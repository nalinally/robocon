
//includeとかdefineとか
#include "mbed.h"
#include "servo.h"
#include "L6470.h"
#include "RotaryEncoder.h"

#define num_enc 3
#define num_mot 2
#define num_ser 6
#define num_tog 2
#define num_led 2
#define num_mem 1000
#define num_data 21
#define start_rh 1
#define end_rh 7
#define num_sync1 3
#define num_sync2 3
#define maxspeed 0.5
#define btndata 21


//ピンとか

//モータ関節のエンコーダ ピン割込み2つ使用
RotaryEncoder R[num_enc] = {
    RotaryEncoder(PC_8, PC_6),
    RotaryEncoder(PC_5, PA_12),
    RotaryEncoder(PA_11, PB_1)
};

//モータ関節 回転向き
DigitalOut MD[num_mot] = {
    //DigitalOut(PA_7),
    DigitalOut(PC_7),
    //DigitalOut(PA_8),
    DigitalOut(PA_15)
};

//モータ関節 回転速さ
PwmOut MP[num_mot] = {
    //PwmOut(PA_6_ALT0),
    PwmOut(PB_6),
    //PwmOut(PA_9),
    PwmOut(PB_7)
};

//サーボ
servo se[num_ser] = {
    servo(PA_6_ALT0),
    servo(PA_9),
    servo(PB_2),
    servo(PB_5),
    servo(PB_4),
    servo(PB_10)
};

//ステッピング
L6470 l6470(PB_15, PB_14, PB_13, PC_4);

//ポテンショ、トグル、LED
//インタフェースたち
AnalogIn pot(PC_3);
DigitalIn tog[num_tog] = {
    DigitalIn(PB_0),
    DigitalIn(PA_4)
};
DigitalOut led[num_led] = {
    DigitalOut(PC_0),
    DigitalOut(PC_1)
};

//UART
Serial Xbee(PC_10, PC_11);
Serial Sync1(PC_12, PD_2);
Serial Sync2(PA_0, PA_1);
Serial PC(USBTX, USBRX);

//タイマー
Timer tim;


//関数
void Position(void);
//エンコーダ値(0~2048で一回転)を角度(0~360度)に変換
float RtoDeg(int R);
//角度(0~360度)をl6470のマイクロステップ数(0~25600で一回転)に変換
int DegtoStep(float deg);
//割込みでコントローラからのデータを受け取る
void JointData(void);
//割込みで他マイコンからのデータを受け取る
void Sync1Data(void);
void Sync2Data(void);
//2バイトに分けて送信されたデータを統合
int Compnum(int a, int b);
//4バイトに分けて送信されたデータを統合
int Compnum2(int a, int b, int c, int d);


//グローバル変数
float angle[num_mem][7];
float tdata[num_mem];
int data[num_data];
char con[num_data*2+5];
int sync1[num_sync1];
int sync2[num_sync2];
int bits_tim = 0;
bool flag = 0;
int btn = 0;


//main関数
int main(void)
{
    //カキコマレマシタ
    PC.printf("programmed by Obama Narito");
    
    //変数宣言するよ～
    int i = 0, j = 0, k = 0;
    
    //初期設定色々やるよね～
    PC.baud(115200);
    Xbee.baud(115200);
    Sync1.baud(115200);
    Sync2.baud(115200);
    Sync1.attach(&Sync1Data, Serial::RxIrq);
    Sync2.attach(&Sync2Data, Serial::RxIrq);
    Xbee.attach(&JointData, Serial::RxIrq);
    
    for(i = 0; i < num_mot; i++){
        //モータの設定
        MD[i] = 0;
        MP[i].period(0.0002);
        MP[i] = 0;
    }
    
    //サーボモータの設定
    //Set(int angle, float lower, float upper, float period);
    se[0].Set(270, 0.0005, 0.0025, 0.02);
    se[1].Set(180, 0.0005, 0.0025, 0.02);
    se[2].Set(90, 0.001, 0.002, 0.02);
    se[3].Set(90, 0.001, 0.002, 0.02);
    se[4].Set(90, 0.001, 0.002, 0.02);
    
    for(i = 0; i < num_enc; i++){
        //エンコーダの設定
        R[i].Reset();
    }
    
    for(i = 0; i < num_ser; i++){
        //サーボの設定
    }
    
    for(i = 0; i < num_tog; i++){
        //トグルの設定
        tog[i].mode(PullDown);
    }
    
    for(i = 0; i < num_led; i++){
        //LEDの設定
    }
    
    while(bits_tim == 0){
        PC.printf("\r%d", bits_tim);
    }
    tim.stop();
    tim.reset();
    tim.start();
    
    while(1){
        
        /*
        for(i = 0; i < 7; i++){
            PC.printf("%.2f,", angle[bits_tim-1][i]);
        }
        PC.printf("%.2f", tdata[bits_tim-1]);
        */
        PC.printf("\n\r");
        Position();
        //wait(0.01);
        
    }
}


//その他関数
void Position(void)
{
    static int num = 0, i;
    float max_angle[7] = {180, 180, 180, 180, 90, 90, 90}, min_angle[7] = {0, 0, 0, 0, 0, 0, 0};
    float M[2], nowt = tim.read();
    float mgain = pot.read()/100000.0;
    
    //flag = 1;
    while(nowt >= tdata[num]){
        if(num < num_mem-1){
            //PC.printf("%.2f,%.2f,%.2f,", nowt, tdata[num], tdata[num+1]);
            if(tdata[num] < tdata[num+1]){
                num++;
                //PC.printf("1\n\r");
            }
            else{
                //PC.printf("2\n\r");
            }
        }
        else if(num >= num_mem-1){
            if(tdata[num] < tdata[0]){
                num = 0;
                //PC.printf("3\n\r");
            }
            else{
                //PC.printf("4\n\r");
            }
        }
    }
    //flag = 0;
    PC.printf("%d,%d,%.2f,%.2f, ", num, bits_tim, nowt, tdata[num]);
    
    for(i = 0; i < 7; i++){
        if(angle[num][i] > max_angle[i]){
            angle[num][i] = max_angle[i];
        }
        if(angle[num][i] < min_angle[i]){
            angle[num][i] = min_angle[i];
        }
        PC.printf("%.2f,", angle[num][i]);
    }
    
    //肩roll
    //PC.printf("%.2f, %.2f,", RtoDeg(R[0].Get_Count())*4.0/294.0, 294.0 * mgain * ((angle[num][0] - (RtoDeg(R[0].Get_Count())*4.0/294.0)) / (tdata[num] - nowt)));
    //PC.printf("%.2f,%.2f,%.2f", mgain, angle[num][0] - (RtoDeg(R[0].Get_Count())*4.0/294.0), tdata[num] - nowt);
    M[0] = 294.0 * mgain * ((angle[num][0] - (RtoDeg(R[0].Get_Count())*4.0/294.0)) / (tdata[num] - nowt));
    if(M[0] >= 0){
        MD[0] = 1;
    }
    else{
        MD[0] = 0;
    }
    if(fabs(M[0]) > maxspeed){
        MP[0] = maxspeed;
    }
    else{
        MP[0] = fabs(M[0]);
    }
    
    //肩pitch
    //PC.printf("%.2f", ((tim.read() - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][1]-angle[num-1][1]) + angle[num-1][1]);
    se[0].Position(((nowt - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][1]-angle[num-1][1]) + angle[num-1][1]);
    
    //肘
    //PC.printf("%.2f,", 4.0 * mgain * (angle[num][2] - (RtoDeg(R[1].Get_Count())/4)) / (tdata[num] - nowt));
    M[1] = 4.0 * mgain * (angle[num][2] - (RtoDeg(R[1].Get_Count())/4)) / (tdata[num] - nowt);
    if(M[1] >= 0){
        MD[1] = 1;
    }
    else{
        MD[1] = 0;
    }
    if(fabs(M[1]) > 0.25){
        MP[1] = 0.25;
    }
    else{
        MP[1] = fabs(M[1]);
    }
    
    //腕yaw
    se[1].Position(((nowt - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][3]-angle[num-1][3]) + angle[num-1][3]);
    
    //手首roll
    se[2].Position(((nowt - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][4]-angle[num-1][4]) + angle[num-1][4]);
    
    //手首pitch
    se[3].Position(((nowt - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][5]-angle[num-1][5]) + angle[num-1][5]);
    
    //指
    se[4].Position(((nowt - tdata[num-1]) / (tdata[num] - tdata[num-1])) * (angle[num][6]-angle[num-1][6]) + angle[num-1][6]);
}

//エンコーダ値(0~2048で一回転)を角度(0~360度)に変換
float RtoDeg(int R)
{
    float f = (float)R * (0.17578125);
    return f;
}

//角度(0~360度)をl6470のマイクロステップ数(0~25600で一回転)に変換
int DegtoStep(float deg)
{
    return (deg * (25600 / 360));
}

//コントローラからデータを割込みでうけとる
void JointData(void)
{
    //実行確認
    /*
    if(flag){
        PC.printf("i");
    }
    */
    
    //受信割り込みのときに来るよ
    signed char XBEE_Data;
    static int bits = 0;
    
    XBEE_Data = Xbee.getc();
    if(XBEE_Data == -128){
        //PC.printf("\n\r128,");
        bits = 0;
    }
    
    con[bits] = XBEE_Data;
    //PC.printf("%d,", con[bits]);
    
    if(bits >= start_rh*2 && bits <= end_rh*2 && bits % 2 == 0){
        //PC.printf("%.2f, ", RtoDeg(Compnum(con[bits-1], con[bits])));
        angle[bits_tim][(bits/2)-start_rh] = RtoDeg(Compnum(con[bits-1], con[bits]));
    }
    
    if(bits == btndata*2){
        btn = Compnum(con[bits-1], con[bits]);
    }
    
    if(bits == num_data*2+4){
        //PC.printf(" t,%.2f\n\r", (float)Compnum2(con[bits-3], con[bits-2], con[bits-1], con[bits]) * 0.0001);
        tdata[bits_tim] = (float)Compnum2(con[bits-3], con[bits-2], con[bits-1], con[bits]) * 0.0001;
        if(bits_tim >= num_mem-1){
            bits_tim = 0;
        }
        else {
            bits_tim++;
        }
        //PC.printf(" n,%d, ", bits_tim);
    }
    
    if(bits >= num_data * 2 + 5){
        bits = 0;
    }
    else {
        bits++;
    }
}

void Sync1Data(void)
{
    //受信割り込みのときに来るよ
    signed char SYNC1_Data = Sync1.getc();
    static int bits = 0;
        
    if(SYNC1_Data == 128){
        bits = 0;
    }
    
    sync1[bits] = SYNC1_Data;
    
    if(bits >= num_sync1){
        bits = 0;
    }
    else {
        bits++;
    }
}

void Sync2Data(void)
{
    //受信割り込みのときに来るよ
    signed char SYNC2_Data = Sync2.getc();
    static int bits = 0;
        
    if(SYNC2_Data == 128){
        bits = 0;
    }
    
    sync2[bits] = SYNC2_Data;
    
    if(bits >= num_sync2){
        bits = 0;
    }
    else {
        bits++;
    }
}

//2バイトに分けて送信されたデータを統合
int Compnum(int a, int b){
    int c = (64 * a) + b;
    return c;
}

//4バイトに分けて送信されたデータを統合
int Compnum2(int a, int b, int c, int d){
    return ((262144 * a) + (4096 * b) + (64 * c) + d);
}


