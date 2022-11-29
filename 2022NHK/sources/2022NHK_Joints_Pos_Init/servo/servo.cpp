#include "servo.h"

servo::servo(PinName PIN) : _PIN(PIN)
{
    theta = 0;
    theta_lower = 0;
    theta_upper = 180;
    pulse_lower = 0.001;
    pulse_upper = 0.002;
    _PIN.period(0.02);
}

//角度をパルス幅に変換
float servo::ThetatoPulse(float angle)
{
    return (pulse_lower + ((pulse_upper - pulse_lower) * ((angle - (float)theta_lower) / ((float)theta_upper - (float)theta_lower))));
}

//サーボを動かす
void servo::Position(float angle)
{
    theta = angle;
    _PIN.pulsewidth(servo::ThetatoPulse(theta));
}

void servo::Period(float period)
{
    _PIN.period(period);
}

//現在の角度を返す
float servo::Get_angle(void)
{
    return theta;
}

void servo::Set(int anglel, int angleu, float lower, float upper, float period)
{
    theta_lower = anglel;
    theta_upper = angleu;
    pulse_lower = lower;
    pulse_upper = upper;
    _PIN.period(period);
}