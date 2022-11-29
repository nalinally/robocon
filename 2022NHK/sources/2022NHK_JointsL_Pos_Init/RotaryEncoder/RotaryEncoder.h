#ifndef RotaryEncoder_H
#define RotaryEncoder_H

#include "mbed.h"

class RotaryEncoder
{
    private:
        InterruptIn _PIN_A;
        InterruptIn _PIN_B;
        int count;
        unsigned char pos;
        
        //カウント
        void Proccessing(void);
        
    public:
        //ピンセット
        RotaryEncoder(PinName PIN_A, PinName PIN_B);
        //カウントの値を0にする
        void Reset(void);
        //カウントを返す
        int Get_Count(void);
        //円周を返す
        double Get_Circumference(int Diameter, int Resolution);
};

#endif
