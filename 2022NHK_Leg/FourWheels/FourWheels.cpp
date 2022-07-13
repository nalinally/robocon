#include "FourWheels.h"

FourWheels::FourWheels(PinName _MD1, PinName _MP1, PinName _MD2, PinName _MP2, PinName _MD3, PinName _MP3, PinName _MD4, PinName _MP4)
: MD1(_MD1), MP1(_MP1), MD2(_MD2), MP2(_MP2), MD3(_MD3), MP3(_MP3), MD4(_MD4), MP4(_MP4)
{
    MP1.period(0.0002);
    MP2.period(0.0002);
    MP3.period(0.0002);
    MP4.period(0.0002);
}

void FourWheels::Move(float angle, float speed, float turn)
{
    //3輪足回りを制御するよ
    float M[4];
    float max = 0;
    int i;
    
    M[0] = (cos(angle - 0.785) * speed) + turn;
    M[1] = (cos(angle + 0.785) * speed) + turn;
    M[2] = (cos(angle + 2.356) * speed) + turn;
    M[3] = (cos(angle - 2.356) * speed) + turn;
    
    for(i = 0; i < 4; i++){
        if(max < M[i]){
            max = M[i];
        }
    }
    if(max > 1){
        M[0] = M[0] / max;
        M[1] = M[1] / max;
        M[2] = M[2] / max;
        M[3] = M[3] / max;
    }
    
    //M1
    if(M[0] < 0){
        MD1 = 0;
    }
    else{
        MD1 = 1;
    }
    MP1 = abs(M[0]);
    
    //M2
    if(M[1] < 0){
        MD2 = 0;
    }
    else{
        MD2 = 1;
    }
    MP2 = abs(M[1]);
    
    //M3
    if(M[2] < 0){
        MD3 = 0;
    }
    else{
        MD3 = 1;
    }
    MP3 = abs(M[2]);
    
    //M4
    if(M[3] < 0){
        MD4 = 0;
    }
    else{
        MD4 = 1;
    }
    MP4 = abs(M[3]);
}

void FourWheels::Stop(void)
{
    MP1 = 0;
    MP2 = 0;
    MP3 = 0;
    MP4 = 0;
}