#ifndef servo_H
#define servo_H

#include "mbed.h"

class servo
{
    private:
        //ピン
        PwmOut _PIN;
        //サーボの現在角度、上限角度
        int theta, theta_upper;
        //制御信号のパルス幅の幅←ややこしっ
        float pulse_lower, pulse_upper;
        //角度をパルス幅に変換
        float ThetatoPulse(int angle);
        
    public:
        //ピンセット
        servo(PinName PIN);
        //サーボの仕様を設定
        void Set(int angle, float lower, float upper, float period);
        //サーボを動かす
        void Position(int angle);
        //現在の角度を返す
        int Get_angle(void);
};

#endif
