/***********************************************
右手を制御する
基本的にいじるところ
・腕の各関節の初期角度
***********************************************/


//includeとかdefineとか
#include "mbed.h"
#include "servo.h"
#include "L6470.h"
#include "RotaryEncoder.h"
#include "Watchdog.h"  //include library for watchdog timer

#define num_pose 20
#define num_motion 5
#define num_enc 3
#define num_mot 2
#define num_ser 6
#define num_tog 2
#define num_led 2
#define num_data 23
#define num_sync1 3
#define num_sync2 3
#define maxspeed 0.15
#define btndata 23
#define timeout 3  //timeout[sec] = 2^(this+2) * 0.1[sec]

#define start_rh 1
#define end_rh 8
#define start_lh 9
#define end_lh 16
#define start_ud 17
#define end_ud 22

#define btn_updown 1
#define btn_start 2
#define btn_throwL 3
#define btn_awaawa 4
#define btn_throwR 5
#define btn_douzo 6
#define btn_ganbaruzo 7
#define btn_stopmotion 8
#define btn_cachashi 9
#define btn_lock 10
#define btn_twist_lock 11
#define btn_wrist_lock 9


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
    servo(PB_2),
    servo(PA_9),  //手首yaw
    servo(PA_6_ALT0),  //手首pitch
    servo(PB_5),  //手首roll
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

//モーションのとき使う
Timer t;
Timer t_btn;

//ウォッチドッグタイマ
Watchdog wd;


//関数
//腕の各関節を指定の角度にする
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
//決められた動きをする
void Motion();
//全てのアクチュエータの動きをとめる
void Stopallactuator(void);
//特定のボタンが押されたかどうか
bool ispressed(int a);
//特定のボタンが押されたかどうか ノイズ対策もばっちり！バージョン
bool pressed(int a);
//空の関数
void ReadOnlyButton(void);
//USBSerialのバッファを消化する
void DijestPCBuff(void);


//グローバル変数
float angle[8];
int data[num_data];
signed char con[num_data*2+5];
int sync1[num_sync1];
int sync2[num_sync2];
int btn = 0;



//main関数
int main(void)
{
    wd.Configure(timeout);  // configure for a 3 second timeout
    
    //カキコマレマシタ
    PC.printf("programmed by Obama Narito");
    
    //変数宣言するよ～
    int i = 0, j = 0, k = 0;
    
    //初期設定色々やるよね～
    PC.baud(115200);
    Xbee.baud(38400);
    Sync1.baud(115200);
    Sync2.baud(115200);
    Sync1.attach(&Sync1Data, Serial::RxIrq);
    Sync2.attach(&Sync2Data, Serial::RxIrq);
    Xbee.attach(&JointData, Serial::RxIrq);
    PC.attach(&DijestPCBuff, Serial::RxIrq);
    
    for(i = 0; i < num_mot; i++){
        //モータの設定
        MD[i] = 0;
        MP[i].period(0.004);
        MP[i] = 0;
    }
    
    //サーボモータの設定
    //Set(int angle, float lower, float upper, float period);
    se[0].Set(-135, 135, 0.0005, 0.0025, 0.02);
    se[1].Set(-90, 90, 0.0005, 0.0025, 0.02);
    se[2].Set(-90, 90, 0.0005, 0.0024, 0.02);
    se[3].Set(-90, 90, 0.0005, 0.0024, 0.02);
    se[4].Set(-90, 90, 0.0005, 0.0024, 0.02);
    se[5].Set(-135, 135, 0.0005, 0.0025, 0.02);
    
    for(i = 0; i < num_enc; i++){
        //エンコーダの設定
        R[i].Reset();
    }
    
    for(i = 0; i < num_tog; i++){
        //トグルの設定
        tog[i].mode(PullDown);
    }
    
    for(i = 0; i < num_led; i++){
        //LEDの設定
    }
    
    
    //スタートボタンが押されるまで待機
    PC.printf("\n");
    while(!pressed(btn_start)){ PC.printf("R(waiting start) : %d\r", btn); wd.Service(); }
    //昇降ボタンが押されるまで待機
    PC.printf("\n");
    while(!pressed(btn_updown)){ PC.printf("R(waiting updown) : %d\r", btn); wd.Service(); }
    
    
    while(1){
        
        wd.Service();  // Kick watchdog 
        //for( i = 0; i < 7; i++ ){ PC.printf("%d:%.2f, ", i, angle[i]); }
        PC.printf("\n\rR : ");
        //PC.printf("%d %d %d\r", ispressed(4), ispressed(5), ispressed(6));
        Position();
        Motion();
        
    }
}


//その他関数
void Position(void)
{
    static int i;
    //float max_angle[7] = {0, 110, 90, 90, 90, 90, 30}, min_angle[7] = {-180, 30, -90, -90, -90, -90, -90};
    //肩pitch, 肩roll, 肘, 手首yaw, 手首pitch, 手首roll, 指
    float bias[7] = {0, 75, 0, -90, -45, -30, 0};  //各関節の初期角度
    //float bias[7] = {0, 75, 0, -90, 0, 0, 0};  //腕の各関節の初期角度
    float max_angle[7] = {130, 135-bias[1], 75, 90+bias[3], 90-bias[4], 90-bias[5], 90};
    float min_angle[7] = {-20, -135-bias[1], -30, -90+bias[3], -90-bias[4], -90-bias[5], -90};
    float now_angle[7], tage_angle[7];
    static float tage_angle_mem[7] = {0,0,0,0,0,0,0};
    float M[2];
    float mgain = 1.0/800.0;
    
    now_angle[0] = RtoDeg(R[0].Get_Count()) * 4.0 / 294.0;
    //now_angle[1] = 150 - se[0].Get_angle();
    now_angle[1] = se[0].Get_angle();
    now_angle[2] = RtoDeg(R[1].Get_Count()) / -4.0;
    now_angle[3] = se[1].Get_angle();
    now_angle[4] = se[2].Get_angle();
    now_angle[5] = se[3].Get_angle();
    now_angle[6] = se[4].Get_angle();
    
    for( i = 0; i < 7; i++ ){ tage_angle[i] = angle[i]; }
    
    //動きを何倍に増幅するか
    tage_angle[0] = angle[0] * 2;  //肩pitch増幅
    tage_angle[1] = angle[1] * 2.25;  //肩roll増幅
    tage_angle[2] = angle[2] * 3.5;  //肘増幅
    tage_angle[3] = angle[3] * 1;  //手首yaw増幅
    tage_angle[4] = angle[4] * 2;  //手首pitch増幅
    tage_angle[5] = angle[5] * 3;  //手首roll増幅
    tage_angle[6] = angle[6] * 1.5;  //指増幅
    
    for( i = 0; i < 8; i++ ){
        if( tage_angle[i] > tage_angle_mem[i] + 3 ){ tage_angle[i] = tage_angle_mem[i] + 3; }
        if( tage_angle[i] < tage_angle_mem[i] - 3 ){ tage_angle[i] = tage_angle_mem[i] - 3; }
    }
    
    /*
    if(now_angle[0] <= 45){  //手が下らへんにある時
        max_angle[2] = -now_angle[1] + 75;
    }
    else{  //手が上らへんにある時
        max_angle[2] = -now_angle[1] + 90;
    }
    if(max_angle[2] < min_angle[2]){
        max_angle[2] = min_angle[2];
    }
    */
    
    for(i = 0; i < 7; i++){
        if(tage_angle[i] > max_angle[i]){
            tage_angle[i] = max_angle[i];
        }
        if(tage_angle[i] < min_angle[i]){
            tage_angle[i] = min_angle[i];
        }
        PC.printf("%.2f,", tage_angle[i]);
    }
    
    
    //肩pitch
    /*
    if(ispressed(btn_shoulder)){
        PC.printf("[1], ");
        M[0] = -294.0 * mgain * (now_angle[0] - tage_angle[7]);
    }else{
        PC.printf("[2], ");
        M[0] = -294.0 * mgain * (now_angle[0] - tage_angle[0]);
    }
    */
    M[0] = 147.0 * mgain * (now_angle[0] - tage_angle[0]);
    PC.printf("[%.2f], ", now_angle[0]);
    //PC.printf("%.2f, ", M[0]);
    
    if( M[0] >= 0 ){ MD[0] = 1; }else{ MD[0] = 0; }
    
    if( fabs(M[0]) > 0.25 ){ MP[0] = 0.25; }
    else{ MP[0] = fabs(M[0]); }
    
    //肩roll
    se[0].Position( tage_angle[1] + bias[1] );
    //PC.printf("[%.2f], ", now_angle[1]);
    
    //肘
    M[1] = 16.0 * mgain * (now_angle[2] - tage_angle[2]);
    //PC.printf("M1:%.4f, ", M[1]);
    PC.printf("[%.2f], %.2f", now_angle[2], tage_angle[2]);
    PC.printf("[%.4f]), ", M[1]);
    if( M[1] >= 0 ){ MD[1] = 1; }else{ MD[1] = 0; }
    
    if( fabs(M[1] ) > 0.3){ MP[1] = 0.3; }
    else{ MP[1] = fabs(M[1]); }
    
    //腕yaw
    if( !ispressed(btn_wrist_lock) ){ se[1].Position(-tage_angle[3] + bias[3]); }
    PC.printf("[%.2f], ", angle[3]);
    
    //手首pitch
    se[2].Position(tage_angle[4] + bias[4]);
    
    //手首roll
    se[3].Position(tage_angle[5] + bias[5]);
    
    //指
    se[4].Position(tage_angle[6] + bias[6]);
    
    for( i = 0; i < 7; i++ ){ tage_angle_mem[i] = tage_angle[i]; }
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
    //PC.printf("i");
    
    
    //受信割り込みのときに来るよ
    signed char XBEE_Data;
    static int bits = 0;
    
    XBEE_Data = Xbee.getc();
    if( XBEE_Data == -128 ){
        //PC.printf("\n\r128,");
        bits = start_rh*2 - 1;
        return;
    }
    if( XBEE_Data == -127 ){
        bits = start_lh*2 - 1;
        return;
    }
    if( XBEE_Data == -126 ){
        bits = start_ud*2 - 1;
        return;
    }
    
    con[bits] = XBEE_Data;
    //PC.printf("%d,", con[bits]);
    
    if(bits >= start_rh*2 && bits <= end_rh*2 && bits % 2 == 0){
        //PC.printf("%.2f, ", RtoDeg(Compnum(con[bits-1], con[bits])));
        angle[(bits/2)-start_rh] = RtoDeg(Compnum(con[bits-1], con[bits]));
    }
    
    if(bits == btndata*2){
        btn = Compnum(con[bits-1], con[bits]);
        /*if(btn != 0){
            PC.printf("%d\n\r", btn); 
        }*/
    }
    
    if(bits >= num_data * 2 + 5){
        bits = 0;
    }
    else {
        bits++;
    }
    
    while( Xbee.readable() ){ XBEE_Data = Xbee.getc(); }
}

void Sync1Data(void)
{
    //受信割り込みのときに来るよ
    signed char SYNC1_Data = Sync1.getc();
    static int bits = 0;
        
    if(SYNC1_Data == -128){
        bits = 0;
    }
    
    sync1[bits] = SYNC1_Data;
    
    if(bits >= num_sync1){
        bits = 0;
    }
    else {
        bits++;
    }
    
    while( Sync1.readable() ){ SYNC1_Data = Sync1.getc(); }
}

void Sync2Data(void)
{
    //受信割り込みのときに来るよ
    signed char SYNC2_Data = Sync2.getc();
    static int bits = 0;
    int i;
        
    if( SYNC2_Data == 100 ){
        Sync2.printf("{1,");
        for(i = 0; i < 8; i++){
            Sync2.printf("%.2f, ", angle[i]);
        }
        Sync2.printf("%d}\n\r", btn);
        return;
    }
        
    if(SYNC2_Data == -128){
        bits = 0;
    }
    
    sync2[bits] = SYNC2_Data;
    
    if(bits >= num_sync2){
        bits = 0;
    }
    else {
        bits++;
    }
    
    while( Sync2.readable() ){ SYNC2_Data = Sync2.getc(); }
}

void DijestPCBuff(void)
{
    char data;
    while( PC.readable() ){ data = PC.getc(); }
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


void Motion()
{
    int i, j, k;
    float time[2];
    
    static bool ens[num_motion] = {true, true, false, true};
    static int btns[num_motion] = {btn_throwL, btn_awaawa, btn_cachashi, btn_throwR};
    static float times[num_motion] = {1, 1, 1, 1, 1};
    
    static float pose[num_motion][num_pose][10] = { //0番目はヘッダ(0なら実行しない),10番目はボタン
        {
            //投げのモーション(左手)
            {1,-0.70, 0.00, 0.35, -0.53, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.88, 0.00, 0.35, -1.76, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -0.53, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512}
        },
        {
            //アワアワのモーション
            {1, 0, -10, 0, -8.61, 10.20, 12.83, -3.69, 0.00, 512},
            {1, 60, -5, 0, 0.88, 9.32, 16.00, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 9.49, 16.00, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 9.67, 16.00, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 9.84, 16.17, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 10.37, 16.17, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 9.84, 16.17, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 10.37, 16.17, -39.02, 0.00, 512},
            {1, 60, -5, 0, 0.88, 10.55, 16.17, -39.02, 0.00, 512},
            {1, 20, -5, 0, 12.13, 39.55, 10.02, -90.18, 0.00, 512}
        },
        {
            //カチャーシーのモーション
            {1,0.00, -0.18, 0.18, 0.00, 0.35, 0.70, 2.46, 0.00, -9},
            {1,45.21, -19.34, 0.00, 12.66, 29.00, 4.75, 5.45, 0.00, 512},
            {1,45.05, -19.86, -4.92, 55.72, 48.52, 29.71, -21.62, 0.00, 512},
            {1,45.16, -19.86, -6.50, 21.62, 29.53, 15.47, -26.54, 0.00, 512},
            {1,45.93, -20.74, -4.57, 83.67, 12.13, 5.45, -39.02, 0.00, -10},
            {1,45.64, -20.39, -3.69, 96.50, 32.52, 33.93, -49.04, 0.00, 512},
            {1,45.64, -20.74, -4.92, -17.58, -0.88, 2.46, 30.23, 0.00, 512},
            {1,2.99, -21.09, -1.41, -11.95, 19.86, -1.58, 10.37, 0.00, 512}
        },
        /*
        {
            //ガンバルゾのモーション
            {1,-1.76, -2.99, 7.56, 0.00, 0.70, 0.18, 0.00, 0.00, 512},
            {1,47.64, -2.81, -13.71, -2.99, -21.45, 6.68, 0.00, 0.00, 512},
            {1,47.11, -4.75, -7.03, -1.41, -21.27, 7.73, 0.00, 0.00, 512},
            {1,45.00, -9.84, -12.83, -2.64, -21.45, 7.91, 0.00, 0.00, 512},
            {1,-20.39, -10.55, -6.15, -3.16, 5.62, 8.26, 0.00, 0.00, 512}
        },
        */
        /*
        {
            //投げのモーション(右手)
            //{ヘッダ,肩dc,肩サーボ,肘,手首ひねり,手首pitch,手首roll,指,ボタン}
            //{1,4.75, -0.18, 0.88, 0.00, 1.23, 0.70, -56.43, 512},
            {1,-4.80, -0.53, -0.53, 3.69, -0.53, 3.69, -0.18, 512},//
            {1,-4.80, -0.53, -0.53, 3.69, -0.53, 3.69, 54.49, 512},//
            {1,66.97, 0, -0.53, 0.00, 16.21, 0, 54.49, 512},//
            {1,66.97, -10, 0, 0.00, 16.21, 0, 54.49, 512},//
            {1,66.97, 0, 0, 0.00, 16.21, 0, 54.49, 512},//
            {1,66.97, 10, 0, 0.00, 16.21, 0, 54.49, 512},//
            {1,63.28, 10, -19.34, -1.23, 16.21, 0, 54.49, 512},//
            {1,20.28, -40, -19.34, -1.23, 16.21, 30, 54.49, 512}//
        }
        */
        {
            //投げのモーション(左手, 滑走路)
            {1,-0.70, 0.00, 0.35, -0.53, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.88, 0.00, 0.35, -1.76, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -0.53, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512},
            {1,-0.70, 0.00, 0.35, -1.58, 0.00, -1.23, 0.00, 0.00, 512}
        },
    };
    
    for(i = 0; i < num_motion; i++){
        if( ens[i] && pressed(btns[i]) ){
            Xbee.attach(&ReadOnlyButton, Serial::RxIrq);
            PC.printf("\n\n\n\n\n\r   Motion : %d   \n\n\n\n\n\r", i);
            Stopallactuator();
            t.reset();
            t.start();
            sync1[1] = 0;
            sync2[1] = 0;
            j = 0;
            while(pose[i][j][0] == 1){
                wd.Service();  // Kick watchdog 
                Sync1.putc(128);   Sync2.putc(128);
                Sync1.putc(j);   Sync2.putc(j);
                Stopallactuator();
                while( sync1[1] < j || sync2[1] < j ){
                    wd.Service();  // Kick watchdog 
                    PC.printf("%d, [%d], [%d], [%d]\n\rR(M%d) : ", btn, j, sync1[1], sync2[1], i);
                    if( pressed( btn_stopmotion ) ){
                        Xbee.attach(&JointData, Serial::RxIrq);
                        btn &= ~(1 << (btns[i] - 1));
                        return;
                    }
                }
                for(k = 1; k < 8; k++){
                    angle[k-1] = pose[i][j][k];
                }
                btn = pose[i][j][8];
                time[0] = t.read();
                if( j > 0 ){ time[1] = fabs( pose[i][j][1] - pose[i][j-1][1] ) / 20.0; }
                if( time[1] <= times[i] ){ time[1] = times[i]; }
                while(t.read() <= time[0] + time[1]){
                    wd.Service();  // Kick watchdog 
                    /*
                    if( btns[i] == btn_throwR && j == 2 ){
                        angle[1] = -20 * (t.read() - time[0]) / time[1];
                    }
                    if( btns[i] == btn_throwR && j == 6 && t.read() > time[0] + 0.1 ){
                        //angle[1] = -40;
                        angle[1] = -10;
                    }
                    if( btns[i] == btn_throwR && j == 6 && t.read() > time[0] + 0.13 ){
                        angle[5] = 20;
                    }
                    if( btns[i] == btn_throwR && j == 6 && t.read() > time[0] + 0.195 ){
                        angle[6] = -49.39;
                        angle[5] = -10;
                    }
                    */
                    Position();
                    PC.printf("%d, [%d], [%d], [%d]\n\rR(M%d) : ", btn, j, sync1[1], sync2[1], i);
                    if( pressed( btn_stopmotion ) ){
                        Xbee.attach(&JointData, Serial::RxIrq);
                        btn &= ~(1 << (btns[i] - 1));
                        return;
                    }
                }
                j++;
            }
            Sync1.putc(128);
            Sync1.putc(j);
            Sync2.putc(128);
            Sync2.putc(j);
            Stopallactuator();
            while( sync1[1] < j || sync2[1] < j ){
                wd.Service();  // Kick watchdog 
                PC.printf("%d, [%d], [%d], [%d]\n\rR(M%d) : ", btn, j, sync1[1], sync2[1], i);
                if( pressed( btn_stopmotion ) ){
                    Xbee.attach(&JointData, Serial::RxIrq);
                    btn &= ~(1 << (btns[i] - 1));
                    return;
                }
            }
            Xbee.attach(&JointData, Serial::RxIrq);
            btn &= ~(1 << (btns[i] - 1));
        }
    }
}

bool ispressed(int a){
    return (btn & (1 << (a-1)));
}

bool pressed(int a){
    if(ispressed(a)){
        t_btn.reset();
        t_btn.start();
        wd.Service();  // Kick watchdog 
        while( ispressed(a) ){
            //PC.printf("%d", a);
            if( t_btn.read() >= 0.05 ){ return true; }
        }
        wd.Service();  // Kick watchdog 
        return false;
    }
    return false;
}

void Stopallactuator(void)
{
    int i;
    for( i = 0; i < num_mot; i++ ){ MP[i] = 0; }
}


void ReadOnlyButton(void)
{
    static int bits = 0;
    signed char XBEE_Data;
    XBEE_Data = Xbee.getc();
    if( XBEE_Data == -128 ){
        //PC.printf("\n\r128,");
        bits = start_rh*2 - 1;
        return;
    }
    if( XBEE_Data == -127 ){
        bits = start_lh*2 - 1;
        return;
    }
    if( XBEE_Data == -126 ){
        bits = start_ud*2 - 1;
        return;
    }
    if( bits == btndata*2-1 ){
        con[bits] = XBEE_Data;
    }
    if( bits == btndata*2 ){
        //PC.printf("b");
        con[bits] = XBEE_Data;
        btn = Compnum(con[bits-1], con[bits]);
    }
    if(bits >= num_data * 2 + 5){
        bits = 0;
    }
    else {
        bits++;
    }
    while( Xbee.readable() ){ XBEE_Data = Xbee.getc(); }
}
