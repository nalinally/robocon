//変なエラー出たのでその対策
#ifndef NDEBUG
#define NDEBUG
#endif

#ifndef servo_H
#define servo_H

#include "mbed.h"

class servo
{
    private:
        //ピン
        PwmOut _PIN;
        //サーボの現在角度
        float theta;
        //角度をパルス幅に変換
        float ThetatoPulse(float angle);
        
    public:
        //ピンセット
        servo(PinName PIN);
        //サーボの下限と上限角度
        int theta_lower, theta_upper;
        //制御信号のパルス幅の幅←ややこしっ
        float pulse_lower, pulse_upper;
        //制御信号の周期を決める
        void Period(float period);
        //サーボを動かす
        void Position(float angle);
        //現在の角度を返す
        float Get_angle(void);
        //サーボ設定
        void Set(int anglel, int angleu, float lower, float upper, float period);
};

#endif
