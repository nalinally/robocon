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


//関数の宣言
void PS3Data(void);
void Move(float sheta, float r);  //足回り


//変数の宣言
int j = 0, m = 0, n = 1;
int ball[4];  //ball[0]:ヘッダ(128) ball[1]:横(0~638) ball[2]:縦(0~478) ball[3]:半径(0~400)
float move[4] = {128, 0, 0, 0};  //本当の座標よ
float differ[2][4];
float integ_x[5] = {0, 0, 0, 0, 0}, integ_y[5] = {0, 0, 0, 0, 0};  //移動距離積分
float kakudo, kyori;  //移動する角度と距離(速度?)
float tanjent, squarekyori;  //途中計算で使うやつ
float disgain = 0.015;  //足回りの速さ決める
float xrange = 638, yrange = 478, rrange = 400;
float xcenter = xrange / 2;
float ycenter = yrange / 2;
float rightxleg = 425, leftxleg = 425, yleg = 305, rleg = 210;
float rightx, leftx, y;  //足の座標
float x_move, y_move;

//関数の中身
int main(void)
{
    kicking.mode(PullDown);
    
    Raspi.baud(9600);
    Raspi.attach(PS3Data, Serial::RxIrq);
    
    MP[0].period(0.0002);
    MP[1].period(0.0002);
    MP[2].period(0.0002);
    
    while(1){
        leftx = (leftxleg - xcenter) * ((float)ball[3] / rleg);
        rightx = (rightxleg - xcenter) * ((float)ball[3] / rleg);
        y = (yleg - ycenter) * ((float)ball[3] / rleg);
        move[1] = (float)ball[1] - ((integ_x[0] + integ_x[1] + integ_x[2] + integ_x[3] + integ_x[4]) * 24);
        move[2] = (float)ball[2] + ((integ_y[0] + integ_y[1] + integ_y[2] + integ_y[3] + integ_y[4]) * 24);
        
        if(move[1] < (leftxleg + rightxleg) / 2){
            x_move = move[1] - xcenter - leftx;
        }
        else{
            x_move = move[1] - xcenter - rightx;
        }
        y_move = -move[2] + ycenter + y;
        
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
        if(kicking){
            kyori *= 0.4;
        }   
        if(kyori > 1){
            kyori = 1;
        }     
        PC.printf("%d, %d, %d, %d, %.2f, %.2f\n\r", ball[0], ball[1], ball[2], ball[3], kakudo, kyori);
        Move(kakudo, kyori);
        integ_x[j] = kyori * cos(kakudo);
        integ_y[j] = kyori * sin(kakudo);
        
        if(j == 4){
            j = 0;
        }
        else{
            j++;
        }
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
