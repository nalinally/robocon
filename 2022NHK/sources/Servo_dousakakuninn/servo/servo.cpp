#include "servo.h"

servo::servo(PinName PIN) : _PIN(PIN)
{
    theta = 0;
    theta_upper = 180;
    pulse_lower = 0.001;
    pulse_upper = 0.002;
    _PIN.period(0.02);
}

//角度をパルス幅に変換
float servo::ThetatoPulse(int angle)
{
    return (pulse_lower + ((pulse_upper - pulse_lower) * ((float)angle / (float)theta_upper)));
}

//サーボの仕様を設定
void servo::Set(int angle, float lower, float upper, float period)
{
    theta_upper = angle;
    pulse_lower = lower;
    pulse_upper = upper;
    _PIN.period(period);
}

//サーボを動かす
void servo::Position(int angle)
{
    theta = angle;
    _PIN.pulsewidth(servo::ThetatoPulse(theta));
}

//現在の角度を返す
int servo::Get_angle(void)
{
    return theta;
}