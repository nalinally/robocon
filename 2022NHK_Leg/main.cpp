//ライブラリ読み込むよ
#include "mbed.h"
#include "MPU6050.h"
#include "servo.h"

#define num_limit 6
#define num_mot 3
#define num_ser 2
#define num_tog 2
#define num_led 2
#define num_data 21
#define limit_pinmode DigitalIn
//リミットを割込み入力にもできるよ
//#define limit_pinmode InterruptIn
#define num_mem 1000
#define start_rh 16
#define end_rh 19
#define num_sync1 3
#define num_sync2 3
#define th_speed 180
#define legspeed 0.4
#define maxspeed 0.5
#define maxaccel 0.05
#define btndata 21


//ピンとかの宣言だよ

//リミット(digitalinかinterruptinかdefineのとこで選べる)
limit_pinmode limit[num_limit] = {
    limit_pinmode(PC_8),
    limit_pinmode(PC_6),
    limit_pinmode(PC_5),
    limit_pinmode(PA_12),
    limit_pinmode(PA_11),
    limit_pinmode(PB_1)
};

//モーター向き(digital)
DigitalOut MD[num_mot] = {
    DigitalOut(PA_7),
    DigitalOut(PC_7),
    DigitalOut(PA_8)
};

//モーター速さ(pwm)
PwmOut MP[num_mot] = {
    PwmOut(PA_6),
    PwmOut(PB_6),
    PwmOut(PA_9)
};

//サーボ
servo se[num_ser] = {
    servo(PB_1),
    servo(PB_5)
};

//ジャイロセンサ PB_8とPB_9で宣言されます
MPU6050 mpu6050;

//UART
Serial Xbee(PC_10, PC_11);
Serial Sync1(PC_12, PD_2);
Serial Sync2(PA_0, PA_1);
Serial PC(USBTX, USBRX);

//ポテンショメータ
AnalogIn pot(PC_3);

//トグルスイッチ
DigitalIn tog[num_tog] = {
    DigitalIn(PB_0),
    DigitalIn(PA_4)
};

//led

DigitalOut leds[num_led] = {
    DigitalOut(PC_0),
    DigitalOut(PC_1)
};



//関数の宣言だよ
void Wheel(void);
void JointData(void);
//割込みで他マイコンからのデータを受け取る
void Sync1Data(void);
void Sync2Data(void);
//2バイトに分けて送信されたデータを統合
int Compnum(int a, int b);
//4バイトに分けて送信されたデータを統合
int Compnum2(int a, int b, int c, int d);
//エンコーダ値(0~2048で一回転)を角度(0~360度)に変換
float RtoDeg(int R);
//首のサーボを制御するよ
void Neck(void);

//グローバル変数宣言だよ
float angle[num_mem][4];
float tdata[num_mem];
char con[num_data*2+5];
int sync1[num_sync1];
int sync2[num_sync2];
int bits_tim = 0;
int btn = 0;


//main関数だよ
int main()
{
    //カキコマレマシタ
    PC.printf("programmed by Obama Narito");
    
    //変数宣言だよ
    int i;  
        
    //初期設定だよ
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
    se[0].Set(180, 0.0005, 0.0025, 0.02);
    se[1].Set(180, 0.0005, 0.0025, 0.02);
    
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
    
    //ジャイロセンサ勝手に初期設定してくれるよ
    mpu6050.SetUp_MPU6050();  
    
    //昇降機構動かすよ
    MD[2] = 0;
    MP[2] = 0.2;
    while(!limit[0] && !limit[1] && !limit[2] && !limit[3]){
    }
    MP[2] = 0;
    
    
    //以下ループ文だよ
    while(1) {
        
        Wheel();
        Neck();
        pc.printf("\n\r");
        
    }
}


void Wheel(void)
{
    //変数宣言だよ
    int num = bits_tim;
    float legsp;
    float ang_f = angle[num-11][2] * 720.0 + angle[num-11][3];
    float ang_l = angle[num-1][2] * 720.0 + angle[num-1][3];
    float tim_f = tdata[num-11], tim_l = tdata[num-1];
    float right = 0, left = 0;
    static float right_mem = 0, left_mem = 0;
    
    if(num == 0){
        ang_l = angle[999][2] * 720.0 + angle[999][3];
        tim_l = tdata[999];
    }
    if(num < 11){
        ang_f = angle[989 + num][2] * 720.0 + angle[989 + num][3];
        tim_f = tdata[989 + num];
    }
    
    legsp = (ang_l - ang_f) / (tim_l - tim_f);
    
    if(legsp > th_speed){
        right += legspeed;
        left -= legspeed;
    }
    
    mpu6050.MPU6050_Start();
    right += (angle[num][4] - yaw) / 10.0 * legspeed;
    left += (angle[num][4] - yaw) / 10.0 * legspeed;
    
    if(right>right_mem+maxaccel){
        right = right_mem + maxaccel;
    }
    else if(right<right_mem-maxaccel){
        right = right_mem - maxaccel;
    }
    
    if(left>left_mem+maxaccel){
        left = left_mem + maxaccel;
    }
    else if(left<left_mem-maxaccel){
        left = left_mem - maxaccel;
    }
    
    PC.printf("%.2f,%.2f,", right, left);
    
    if(right < 0){
        MD[0] = 0;
    }
    else{
        MD[0] = 1;
    }
    if((limit[5] && right > 0) || (limit[6] && right < 0)){
        MP[0] = 0;
    }
    else if(fabs(right) > maxspeed){
        MP[0] = maxspeed;
    }
    else{
        MP[0] = fabs(right);
    }
    
    if(left < 0){
        MD[1] = 0;
    }
    else{
        MD[1] = 1;
    }
    if((limit[5] && left > 0) || (limit[6] && left < 0)){
        MP[1] = 0;
    }
    else if(fabs(left) > maxspeed){
        MP[1] = maxspeed;
    }
    else{
        MP[1] = fabs(left);
    }
    
    right_mem = right;
    left_mem = left;
    
}


void Neck(void)
{
    int num = bits_tim, i;
    float max_angle[2] = {90, 120}, min_angle[2] = {0, 0};
    
    if(num < num_mem-1){
        num--;
    }
    else{
        num = 0;
    }
    
    for(i = 0; i < num_ser; i++){
        if(angle[num][i] > max_angle[i]){
            se[i].Position(maxangle);
        }
        else if(angle[num][i] < min_angle[i]){
            se[i].Position(minangle);
        }
        else{
            se[i].Position(angle[num][i]);
        }
    }
}


void JointData(void)
{    
    //受信割り込みのときに来るよ
    signed char XBEE_Data;
    static int bits = 0;
    
    XBEE_Data = Xbee.getc();
    if(XBEE_Data == -128){
        bits = 0;
    }
    
    con[bits] = XBEE_Data;
    
    if(bits >= start_rh*2 && bits <= end_rh*2 && bits % 2 == 0){
        angle[bits_tim][(bits/2)-start_rh] = RtoDeg(Compnum(con[bits-1], con[bits]));
    }
    
    if(bits == btndata*2){
        btn = Compnum(con[bits-1], con[bits]);
    }
    
    if(bits == num_data*2+4){
        tdata[bits_tim] = (float)Compnum2(con[bits-3], con[bits-2], con[bits-1], con[bits]) * 0.0001;
        if(bits_tim >= num_mem-1){
            bits_tim = 0;
        }
        else {
            bits_tim++;
        }
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

float RtoDeg(int R)
{
    float f = (float)R * (0.17578125);
    return f;
}
