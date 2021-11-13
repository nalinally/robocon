#include "mbed.h"


//ピンとかの宣言
DigitalOut MD[] = {
    DigitalOut(PA_12),
    DigitalOut(PB_7),
    DigitalOut(PB_1)
};

PwmOut MP[] = {
    PwmOut(PB_0),
    PwmOut(PB_6),
    PwmOut(PF_0)
};

DigitalIn kicking(PA_1);
Serial Raspi(PA_9, PA_10);  //Raspi(たぶん)と通信
Serial PC(USBTX, USBRX);  //pcと通信
Timer t;  //なにかと使える

//関数の宣言
void PS3Data(void);
void Move(float sheta, float r);  //足回り


//変数の宣言
int j = 0, m = 0, n = 1, c = 0;
int ball[4];  //ball[0]:ヘッダ(128) ball[1]:横(0~638) ball[2]:縦(0~478) ball[3]:半径(0~400)
float move[4] = {128, 0, 0, 0};  //本当の座標よ
float differ[4] = {128, 0, 0, 0};  //微分制御に使う
float integ_x[5] = {0, 0, 0, 0, 0}, integ_y[5] = {0, 0, 0, 0, 0};  //移動距離積分
float kakudo, kyori;  //移動する角度と距離(速度?)
float tanjent, squarekyori;  //途中計算で使うやつ
float disgain = 0.020;  //足回りの速さ決める
float xrange = 638, yrange = 478, rrange = 400;
float xcenter = xrange / 2;
float ycenter = yrange / 2;
float rightxleg = 445, leftxleg = 445, yleg = 335, rleg = 162;
float xwind = 0, ywind = 0;  //会場の風～
float rightx, leftx, y;  //足の座標
float x_move, y_move;
float speed = 0, theta = 0, accel, maxaccel = 0.075;

//関数の中身
int main(void)
{
    kicking.mode(PullDown);
    
    Raspi.baud(9600);
    Raspi.attach(PS3Data, Serial::RxIrq);
    
    MP[0].period(0.0002);
    MP[1].period(0.0002);
    MP[2].period(0.0002);                         
    
    rightxleg += xwind;
    leftxleg += xwind;
    yleg += ywind;
    
    while(1){
        //処理時間はかるよ
        t.reset();
        t.start();
        
        //目標とするxy座標を決めるよ
        leftx = (leftxleg - xcenter) * ((float)ball[3] / rleg);
        rightx = (rightxleg - xcenter) * ((float)ball[3] / rleg);
        y = (yleg - ycenter) * ((float)ball[3] / rleg);
        
        //ボールの座標にロボットの移動分補正をかけるよ
        move[1] = (float)ball[1] - ((integ_x[0] + integ_x[1] + integ_x[2] + integ_x[3] + integ_x[4]) * 24);
        move[2] = (float)ball[2] + ((integ_y[0] + integ_y[1] + integ_y[2] + integ_y[3] + integ_y[4]) * 24);
        
        /*微分制御するよ、無理のないゲイン
        if(c == 0){
            differ[1] = move[1];
            differ[2] = move[2];
            c++;
        }
        move[1] = move[1] + ((move[1] - differ[1]) * 0.2);
        move[2] = move[2] - ((move[2] - differ[2]) * 0.2);
        differ[1] = move[1];
        differ[2] = move[2];
        */
        
        //ロボットの移動量を決めるよ
        if(move[1] < (leftxleg + rightxleg) / 2){
            x_move = move[1] - xcenter - leftx;
        }
        else{
            x_move = move[1] - xcenter - rightx;
        }
        y_move = -move[2] + ycenter + y;
        
        //移動量(x_move, y_move)→(kakudo, kyori)に変換するよ
        if(x_move == 0){
            if(y_move >= 0){
                kakudo = 1.571;
            }
            else if(y_move < 0){
                kakudo = -1.571;
            }
        }
        else{        
            tanjent = y_move / x_move;
            kakudo = atan(tanjent);
            if(x_move < 0){
                kakudo += 3.142;
            }
        }
        squarekyori = (x_move * x_move) + (y_move * y_move);
        kyori = (sqrt(squarekyori) * disgain);  
        if(kyori > 1){
            kyori = 1;
        } 
        
        //加速度制御するよ
        if(kicking){
            maxaccel = 0.1;
        }
        else{
            maxaccel = 0.2;
        }
        //左に傾かないように～
        accel = (kyori * cos(kakudo + 0.524)) - (speed * cos(theta + 0.524));
        if(accel > maxaccel){
            kyori = ((speed * cos(theta + 0.524)) + maxaccel) / cos(kakudo + 0.524);
        }
        //右に傾かないように～
        accel = (kyori * cos(kakudo + 2.618)) - (speed * cos(theta + 2.618));
        if(accel > maxaccel){
            kyori = ((speed * cos(theta + 2.618)) + maxaccel) / cos(kakudo + 2.618);
        }
        
        //加速度制御で1以上とか0以下になったときの対処だよ
        if(kyori < 0){
            kyori = kyori * -1;
            kakudo += 3.142;
        }
        if(kyori > 1){
            kyori = 1;
        }
        speed = kyori;
        theta = kakudo;
        
        //関数を経由して実際にロボットを動かすよ
        PC.printf("%d, %d, %d, %d, %.2f, %.2f\n\r", ball[0], ball[1], ball[2], ball[3], kakudo, kyori);
        Move(kakudo, kyori);
        
        //ロボットの移動量を記録するよ
        integ_x[j] = kyori * cos(kakudo);
        integ_y[j] = kyori * sin(kakudo);
        if(j == 4){
            j = 0;
        }
        else{
            j++;
        }
        
        //処理時間を出力するよ
        t.stop();
        PC.printf("%f", t.read());
    }
}

void Move(float sheta, float r)
{
    float M[3];
    int i;
    
    M[0] = cos(sheta) * r;
    M[1] = cos(sheta + 4.189) * r;
    M[2] = cos(sheta + 2.094) * r;
    
    for(i = 0; i < 3; i++){
        if(M[i] < 0){
            MD[i] = 0;
        }
        else{
            MD[i] = 1;
        }
        MP[i] = abs(M[i]);
    }
}

void PS3Data(void)
{
    //受信割り込みのときに来るよ
    int SBDBT_Data = Raspi.getc();
    static int bits = 0, count = 0, keep = 0;
    
    if(SBDBT_Data == 128){
        bits = 0;
        count = 0;
        ball[bits] = SBDBT_Data;
        bits++;
    }    
    else{
        if(count == 0){
            keep = SBDBT_Data;
            count = 1;
        }
        else if(count == 1){
            ball[bits] = (keep * 128) + SBDBT_Data;
            count = 0;
            if(bits == 3){
                bits = 0;
            }
            else{
                bits++;
            }
        }
    }
}
