#ifndef FourWheels_H
#define FourWheels_H

#include "mbed.h"

class FourWheels
{
    private:
    DigitalOut MD1;
    PwmOut MP1;
    DigitalOut MD2;
    PwmOut MP2;
    DigitalOut MD3;
    PwmOut MP3;
    DigitalOut MD4;
    PwmOut MP4;
    
    public:
    //足回りのピンの宣言
    FourWheels(PinName _MD1, PinName _MP1, PinName _MD2, PinName _MP2, PinName _MD3, PinName _MP3, PinName _MD4, PinName _MP4);
    //ロボットを動かす
    void Move(float angle, float speed, float turn);
    //ロボットを止める
    void Stop(void);
};

#endif
    