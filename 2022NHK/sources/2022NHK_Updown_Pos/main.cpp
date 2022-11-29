/*****************************************
2022NHK 昇降用のモータと足回り用のモータを制御する
基本的に変えるところ
・昇降するかどうか
・首のサーボの可動範囲
・足回りの最大加速度
・足回りの最大速度
・体をどれくらい回せばロボットが動くか
・足回りの速さ
******************************************/

//ライブラリ読み込むよ
#include "mbed.h"
#include "servo.h"
#include "Watchdog.h"
//#include "MPU6050.h"

//いろいろパラメータ定義するよ
#define num_limit 4
#define num_mot 4
#define num_ser 2
#define num_tog 2
#define num_led 3
#define num_mem 1000
#define num_data 23
#define num_sync1 3
#define num_sync2 3
#define limit_pinmode DigitalIn
#define th_speed 200
#define legspeed 0.06  //足回りの速さ
#define maxaccel 0.003  //足回りの最大加速度
#define maxspeed 0.5  //足回りの最大速度
#define btndata 23
//リミットを割込み入力にもできるよ
//#define limit_pinmode InterruptIn
#define motorspeed 
#define axis roll
#define axis_ave roll_ave
#define room 20  //体をどれくらい回せばロボットが動くか 0~360度
#define num_motion 5  //モーションの数
#define num_pose 20  //1モーション当たりの最大のポーズ数
#define updown_en true  //昇降するかどうか  昇降する->true  昇降しない->false
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
#define btn_twistL 6
#define btn_ganbaruzo 7
#define btn_twistR 7
#define btn_stopmotion 8
#define btn_cachashi 9
#define btn_lock 10
#define btn_twist_lock 11
#define btn_wrist_lock 9


//ピンとかの宣言だよ

//リミット(digitalinかinterruptinかdefineのとこで選べる)
limit_pinmode limit[num_limit] = {
    limit_pinmode(PC_8),
    limit_pinmode(PC_6),
    limit_pinmode(PC_5),
    limit_pinmode(PA_12)
};

//モーター向き(digital)
DigitalOut MD[num_mot] = {
    DigitalOut(PA_7),  //555, right
    DigitalOut(PC_7),  //555, left
    DigitalOut(PA_8),  //pww, right
    DigitalOut(PA_15)  //pww, left
};

//モーター速さ(pwm)
PwmOut MP[num_mot] = {
    PwmOut(PA_6_ALT0),  //555, right
    PwmOut(PB_6),       //555, left
    PwmOut(PA_9),       //pww, right
    PwmOut(PB_7)        //pww, left
};

//サーボ

servo se[num_ser] = {
    servo(PB_4),
    servo(PB_5)
};


//ジャイロセンサ PB_8とPB_9で宣言されます
//MPU6050 mpu6050;

//UART
Serial Xbee(PC_10, PC_11);
Serial Sync1(PC_12, PD_2);
Serial Sync2(PA_0, PA_1);
Serial PC(USBTX, USBRX);
Serial pc(USBTX, USBRX);

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
    DigitalOut(PC_1),
    DigitalOut(PB_2)
};

//タイマ
Timer t;
Timer t_btn;

//ウォッチドッグタイマ
Watchdog wd;


//関数の宣言だよ
//上下だけするよ
void Onlyupdown(void);
//足回りの息の根を止めるよ
void StopWheel(void);
//足回りを制御するよ
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
//mpuの初期設定をするよ
void Config_mpu(void);
//決められた動きをする
void Motion();
//全てのアクチュエータの動きをとめる
void Stopallactuator(void);
//特定のボタンが押されたかどうか ノイズ対策もばっちりバージョン
bool pressed(int a);
//特定のボタンが押されたかどうか
bool ispressed(int a);
//ボタンの値だけ読み込む
void ReadOnlyButton(void);
//昇降機構動かすよ
void Updown(void);
//USBSerialのバッファを消化する
void DijestPCBuff(void);

//グローバル変数宣言だよ
float angle[6];
float tdata;
signed char con[num_data*2+5];
int sync1[num_sync1];
int sync2[num_sync2];
int bits_tim = 0;
int btn = 0;
float yaw_ave, roll_ave, pitch_ave;
float yaw_bias = 0;



//main関数だよ
int main()
{
    wd.Configure(timeout);  // configure for a 3 second timeout
    
    int toggle;
    
    //チューニング(初期設定)開始
    leds[0] = 1;
    leds[1] = 1;
    
    //カキコマレマシタ
    PC.printf("programmed by Obama Narito");
    
    //変数宣言だよ
    int i;  
    int lim[4];
        
    //初期設定だよ
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
        MP[i].period(0.001);  //5kHz駆動
        MP[i] = 0;
    }
    /*
    MP[2].period(0.001);  //1kHz駆動でトルク上げる
    MP[3].period(0.001);  //1kHz駆動でトルク上げる
    */
    
    //サーボモータの設定
    //Set(int angle, float lower, float upper, float period);
    se[0].Set(-90, 90, 0.0005, 0.0025, 0.02);
    se[1].Set(-90, 90, 0.0005, 0.0025, 0.02);
    
    for(i = 0; i < num_tog; i++){
        //トグルの設定
        tog[i].mode(PullDown);
    }
    
    for(i = 0; i < num_limit; i++){
        //トグルの設定
        limit[i].mode(PullDown);
    }
    
    for(i = 0; i < num_led; i++){
        //LEDの設定
    }
    /*
    while(bits_tim == 0){
        PC.printf("\r%d", bits_tim);
    }
    */
    //ジャイロセンサ勝手に初期設定してくれるよ
    //mpu6050.SetUp_MPU6050();  
    //Config_mpu();
    
    
    //チューニング(初期設定)完了
    leds[0] = 0;
    leds[1] = 0;
    
    //トグルが押されてたらonlyupdown
    toggle = tog[1].read();
    if( toggle ){ Onlyupdown(); }
    
    wd.Service();  // Kick watchdog 
    
    //スタートボタンが押されるまで待機
    PC.printf("\n");
    while( !pressed(btn_start) ){
        PC.printf("B(waiting start) : %d\r", btn);
        toggle = tog[1].read();
        if( toggle ){ Onlyupdown(); }
        wd.Service();  // Kick watchdog 
    }
    //昇降ボタンが押されるまで待機
    PC.printf("\n");
    while( !pressed(btn_updown) ){
        PC.printf("B(waiting updown) : %d\r", btn);
        toggle = tog[1].read();
        if( toggle ){ Onlyupdown(); }
        wd.Service();  // Kick watchdog 
    }
    
    wd.Service();  // Kick watchdog 
    
    //以下ループ文だよ
    while(1) {
        
        if( !ispressed(btn_lock) ){ Wheel(); }else{ 
            StopWheel(); 
            yaw_bias = angle[4];
        }
        //Wheel();
        Neck();
        Motion();
        Updown();
        Onlyupdown();
        pc.printf("%d\n\rB : ", btn);
        
        wd.Service();  // Kick watchdog 
        
    }
}


void Wheel(void)
{
    //変数宣言だよ
    float right = 0, left = 0, MPout[2] = {0,0};
    static float right_mem = 0, left_mem = 0;
    float tage_angle[5];
    
    //セグウェイ式
    if( ((angle[5] * 2048.0 / 360.0) > room || (angle[5] * 2048.0 / 360.0) < -room + 10) && ispressed(btn_twist_lock) ){
        PC.printf("pitch:%.2f, ", (angle[5] * 2048.0 / 360.0));
        right += angle[5] * legspeed;
        left -= angle[5] * legspeed;
    }
    else{ PC.printf("pitch:0.00, "); }
    
    //tage_angle[4] = angle[4] - yaw_bias;
    tage_angle[4] = angle[4];
    //操縦者が体をひねるとロボットが回転する方式 ロボットにジャイロ必要なし
    if( !ispressed(btn_twist_lock) ){
        if( tage_angle[4] * 2048.0 / 360.0 > room ){
            //right += (tage_angle[4]-room) * legspeed * 0.2;
            //left += (tage_angle[4]-room) * legspeed * 0.2;
            right -= 0.15;
            left -= 0.15;
        }
        else if( tage_angle[4] * 2048.0 / 360.0 < -room ){
            //right += (tage_angle[4]+room) * legspeed * 0.2;
            //left += (tage_angle[4]+room) * legspeed * 0.2;
            right += 0.15;
            left += 0.15;
        }
    }
        
    
    /*
    //操縦者とロボットが同じ方向を向く方式 ロボットにもジャイロ必要
    mpu6050.MPU6050_Start();    
    PC.printf("yaw:%.2f, ", axis - axis_ave);
    PC.printf("ag:%.2f, ", angle[4]);
    right += (axis - axis_ave - (angle[4] * 2048.0 / 360.0)) / 2.0 * legspeed;
    left += (axis - axis_ave - (angle[4] * 2048.0 / 360.0)) / 2.0 * legspeed;
    */
    
    //加速度がmaxaccel以上にならないように制御
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
    
    //スピードがmaxspeed以上にならないように制御
    if( right < -maxspeed ){ 
        right = -maxspeed; 
    }
    else if( right > maxspeed ){ 
        right = maxspeed; 
    }
    
    if( left < -maxspeed ){ 
        left = -maxspeed; 
    }
    else if( left > maxspeed ){ 
        left = maxspeed; 
    }
    
    if( right < 0 ){ 
        MD[0] = 0; 
    }
    else{ 
        MD[0] = 1; 
    }
    MPout[0] = fabs(right);
    PC.printf("r:%.2f,", MPout[0]);
    MP[0] = MPout[0];
    
    if(left < 0){
        MD[1] = 0;
    }
    else{
        MD[1] = 1;
    }
    MPout[1] = fabs(left);
    PC.printf("l:%.2f,", MPout[1]);
    MP[1].write(MPout[1]);
    //MP[1].pulsewidth(0.0001);
    
    right_mem = right;
    left_mem = left;
    
}


void Neck(void)
{
    
    static bool isright = false, isleft = false, flag = false;
    int num = bits_tim, i;
    //首のサーボの可動範囲 初期位置(首が立っている状態)は0
    float max_angle[2] = {45, 90}, min_angle[2] = {-45, -90};
    float tage_angle[2];
    
    if( num > 0 ){ num--; }
    else{ num = num_mem-1; }
    
    for(i = 0; i < num_ser; i++){
        if(angle[i] > max_angle[i]){
            tage_angle[i] = max_angle[i];
        }
        else if(angle[i] < min_angle[i]){
            tage_angle[i] = min_angle[i];
        }
        else{
            tage_angle[i] = angle[i];
        }
        if( isleft ){ tage_angle[1] = -75; }
        if( isright ){ tage_angle[1] = 75; }
        PC.printf("n%d:%.2f,", i, tage_angle[i]);
    }
    
    if( pressed(btn_twistL) ){ 
        while( ispressed( btn_twistL )){ wait(0.01); wd.Service(); }
        isleft = !isleft;
    }else if( pressed(btn_twistR) ){
        while( ispressed( btn_twistR )){ wait(0.01); wd.Service(); }
        isright = !isright;
    }
    
    se[0].Position(-tage_angle[0]);  //縦
    se[1].Position(tage_angle[1]);  //横
    
}


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
    
    if(bits >= start_ud*2 && bits <= end_ud*2 && bits % 2 == 0){
        //PC.printf("%.2f, ", RtoDeg(Compnum(con[bits-1], con[bits])));
        angle[(bits/2)-start_ud] = RtoDeg(Compnum(con[bits-1], con[bits]));
    }
    
    if(bits == btndata*2){
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

float RtoDeg(int R)
{
    float f = (float)R * (0.17578125);
    return f;
}

/*
void Config_mpu(void)
{    
    int i, num_sample = 200, num_stable = 200;
    yaw_ave = 0; roll_ave = 0; pitch_ave = 0;
    
    for(i = 0; i < num_stable; i++){
        mpu6050.MPU6050_Start();
        pc.printf("%.2f, %.2f, %.2f\n\r", yaw, roll, pitch);
        wait(0.01);
    }
    
    for(i = 0; i < num_sample; i++){
        mpu6050.MPU6050_Start();
        pc.printf("%.2f, %.2f, %.2f\n\r", yaw, roll, pitch);
        yaw_ave += yaw;
        roll_ave += roll;
        pitch_ave += pitch;
        wait(0.01);
    }
    
    yaw_ave = yaw_ave / num_sample;
    roll_ave = roll_ave / num_sample;
    pitch_ave = pitch_ave / num_sample;
}
*/

void Updown(void)
{
    
    int i, lim[4];
    static bool dir = false;
    
    if( !updown_en ){ return; }
    
    if( pressed(btn_updown) ){
        pc.printf("updown.\n\r");
        while( ispressed( btn_updown ) ){ wait(0.01); wd.Service(); }
        //昇降機構動かすよ
        StopWheel();
        leds[0] = 1;  leds[1] = 1;
        if( !dir ){
            //right
            MD[2] = 0;
            MP[2] = 0.6 * 0.9;
            //left
            MD[3] = 0;
            MP[3] = 0.6 * 1;
            dir = true;
        }
        else{
            MD[2] = 1;
            MP[2] = 0.5;
            MD[3] = 1;
            MP[3] = 0.5;
            dir = false;
        }
        for(i = 0; i < 4; i++){ lim[i] = 0; }
        while( !lim[0] || !lim[1] || !lim[2] || !lim[3] || !dir ){
            for(i = 0; i < 4; i++){ lim[i] = limit[i]; }
            PC.printf("%d %d %d %d ", lim[0], lim[1], lim[2], lim[3]);
            if( dir ){ PC.printf("up\n\r"); }else{ PC.printf("down\n\r"); }
            if( lim[0] && lim[1] ){ MP[2] = 0; }
            if( lim[2] && lim[3] ){ MP[3] = 0; }
            if( pressed(btn_updown) ){
                MP[2] = 0;
                MP[3] = 0;
                while( ispressed(btn_updown) ){ wait(0.01); wd.Service(); }
                PC.printf("break");
                break;
            }
            wd.Service();  // Kick watchdog 
        }
    }
    leds[0] = dir;  leds[1] = !dir;
    //if( dir ){ leds[0] = 1;  leds[1] = 0; }
    //else{ leds[0] = 0;  leds[1] = 1; }
    
}

void StopWheel(){
    int i;
    for(i = 0; i < num_mot; i++){
        MP[i] = 0;
        MD[i] = 0;
    }
}

void Motion()
{
    int i, j, k;
    bool st = leds[0];
    float time[2], time_bright[2];
    
    static bool ens[num_motion] = {true, true, false, true};
    static int btns[num_motion] = {btn_throwL, btn_awaawa, btn_cachashi, btn_throwR};
    static float times[num_motion] = {1, 1, 1, 1, 1};
    static float pose[num_motion][num_pose][8] = { //0番目はヘッダ(0なら実行しない),8番目はボタン
        {
            //投げのモーション(左手)
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512}
        },
        {
            //アワアワのモーション
            {1, 0.00, 1.58, 0.00, 0.00, 0, -2.29, 512},
            {1, 0.00, 2.29, 0.00, 0.00, 0, -2.29, 512},
            {1, 0.00, 72.95, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, -43.24, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, 55.90, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, -46.41, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, 55.90, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, -46.41, 0.00, 0.00, 3.69, -2.29, 512},
            {1, 0.00, -0.18, 0.00, 0.00, 0, -2.29, 512},
            {1, 0.00, 0.35, 0.00, 0.00, 0, -2.29, 512}
        },
        {
            //カチャーシーのモーション
            {1, 0.00, 0.00, 0.00, 0.00, 0.00, -1.41, 512},
            {1, 0.00, 0.00, 0.00, 0.00, -1.58, -1.23, 512},
            {1, 0.00, 0.00, 0.00, 0.00, -1.58, -1.23, 512},
            {1, 0.00, 0.00, 0.00, 0.00, -1.76, -1.23, 512},
            {1, -5.98, 0.00, 0.00, 0.00, 0.00, 0.00, -10},
            {1, 0.00, 0.00, 0.00, 0.00, -1.76, -1.23, 512},
            {1, 0.00, 0.00, 0.00, 0.00, -1.93, -1.23, 512},
            {1, 0.00, 0.00, 0.00, 0.00, -1.93, -1.41, 512}
        },
        /*
        {
            //ガンバルゾのモーション
            {1, 0.00, 0.00, 0.00, 0.00, 1.05, -1.76, 512},
            {1, 0.00, 0.00, 0.00, 0.00, 1.05, -1.93, 512},
            {1, 0.00, 0.00, 0.00, 0.00, 0.88, -1.93, 512},
            {1, 0.00, 0.00, 0.00, 0.00, 0.88, -1.93, 512},
            {1, 0.00, 0.00, 0.00, 0.00, 1.05, -1.93, 512}
        },
        */
        {
            //投げのモーション(右手)
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, 90, 0.00, 0.00, 0, 0, 512},
            {1, 0.00, -0.18, 0.00, 0.00, 0, 0, 512}
        }
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
                Sync1.putc(128);   Sync2.putc(128);
                Sync1.putc(j);   Sync2.putc(j);
                time_bright[0] = 0;
                time_bright[1] = t.read();
                leds[0] = 0;
                leds[1] = 0;
                Stopallactuator();
                while( sync1[1] < j || sync2[1] < j ){
                    PC.printf("%d, [%d], [%d], [%d]\n\rB(M%d) : ", btn, j, sync1[1], sync2[1], i);
                    if( t.read() >= time_bright[0] + time_bright[1] ){
                        time_bright[0] += 0.125;
                        leds[0] = !leds[0];
                        leds[1] = !leds[1];
                    }
                    if( pressed( btn_stopmotion ) ){
                        Xbee.attach(&JointData, Serial::RxIrq);
                        btn &= ~(1 << (btns[i] - 1));
                        return;
                    }
                    wd.Service();  // Kick watchdog 
                }
                for(k = 1; k < 7; k++){
                    angle[k-1] = pose[i][j][k];
                }
                btn = pose[i][j][7];
                time[0] = t.read();
                while(t.read() <= time[0] + times[i]){
                    if( t.read() >= time_bright[0] + time_bright[1] ){
                        time_bright[0] += 0.125;
                        leds[0] = !leds[0];
                        leds[1] = !leds[1];
                    }
                    Wheel();
                    Neck();
                    PC.printf("%d, [%d], [%d], [%d]\n\rB(M%d) : ", btn, j, sync1[1], sync2[1], i);
                    if( pressed( btn_stopmotion ) ){
                        Xbee.attach(&JointData, Serial::RxIrq);
                        btn &= ~(1 << (btns[i] - 1));
                        leds[0] = st;  leds[1] = !st;
                        return;
                    }
                    wd.Service();  // Kick watchdog 
                }
                wd.Service();  // Kick watchdog 
                j++;
            }
            Sync1.putc(128);
            Sync1.putc(j);
            Sync2.putc(128);
            Sync2.putc(j);
            Stopallactuator();
            while( sync1[1] < j || sync2[1] < j ){
                if( t.read() >= time_bright[0] + time_bright[1] ){
                    time_bright[0] += 0.125;
                    leds[0] = !leds[0];
                    leds[1] = !leds[1];
                }
                PC.printf("%d, [%d], [%d], [%d]\n\rB(M%d) : ", btn, j, sync1[1], sync2[1], i);
                if( pressed( btn_stopmotion ) ){
                    Xbee.attach(&JointData, Serial::RxIrq);
                    btn &= ~(1 << (btns[i] - 1));
                    leds[0] = st;  leds[1] = !st;
                    return;
                }
                wd.Service();  // Kick watchdog 
            }
            Xbee.attach(&JointData, Serial::RxIrq);
            btn &= ~(1 << (btns[i] - 1));
            //leds[0] = st;  leds[1] = !st;
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
        while( ispressed(a) ){
            if( t_btn.read() >= 0.05 ){ return true; }
            wd.Service();  // Kick watchdog 
        }
        return false;
    }
    return false;
}

void Stopallactuator(void)
{
    int i;
    
    for(i = 0; i < num_mot; i++){
        MP[i] = 0;
    }
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


void Onlyupdown(void)
{
    
    int updown = tog[1].read();
    
    if( !updown ){ return; }
    
    leds[2] = 1;
    while(updown){
        updown = tog[1].read();
        //右側
        MD[2] = tog[0].read();
        if( tog[0].read() == 0 ){ MP[2] = pot.read() * 0.9; }
        else{ MP[2] = pot.read(); }
        //左側
        MD[3] = tog[0].read();
        MP[3] = pot.read();
        leds[0] = tog[0].read();
        leds[1] = !tog[0].read();
        PC.printf("%d, %.2f\n\r", tog[0].read(), pot.read());
        wait(0.01);
        wd.Service();  // Kick watchdog 
    }
    leds[0] = 0;  leds[1] = 0;  leds[2] = 0;
    
}

