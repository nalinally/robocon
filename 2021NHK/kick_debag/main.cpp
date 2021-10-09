#include "mbed.h"
#include "RotaryEncoder.h"
#include "HC_SR04.h"
#include <string>


//ピンとかの宣言
DigitalOut MD[2] = {
    DigitalOut(PA_12),
    DigitalOut(PB_7)
};

PwmOut MP[2] = {
    PwmOut(PB_0),
    PwmOut(PB_6)
};

RotaryEncoder R[2] = {
    RotaryEncoder(PA_7, PA_6),
    RotaryEncoder(PA_5, PA_4)
};

DigitalIn limit[2] = {
    DigitalIn(PA_7),
    DigitalIn(PA_6)
};
HC_SR04 TR(PF_0, PB_1);

Serial Raspi(PA_9, PA_10);  //Raspi(たぶん)と通信
Serial PC(USBTX, USBRX);


//関数の宣言
void Kick(int ch);


//変数の宣言
int ball[4];  //ball[0]:ヘッダ(128) ball[1]:横(0~63) ball[2]:縦(0~47) ball[3]:半径(0~39)
int kickdis = 50;
int radius[5], speed[2], alpha, i;
std::string numStr;


//関数の中身
int main(void)
{
    limit[0].mode(PullDown);
    limit[1].mode(PullDown);
    
    MP[0].period(0.0002);
    MP[1].period(0.0002);
    
    R[0].Reset();
    R[1].Reset();
    
    MD[0] = 1;
    MP[0] = 0.2;
    MD[1] = 1;
    MP[1] = 0.2;
    
    PC.printf("position reset\n\r");
    
    while(1){
        if(limit[0]){
            PC.printf("0");
            MP[0] = 0;
            break;
        }
        /*
        if(limit[1]){
            PC.printf("1");
            MP[1] = 0;
        }
        
        if(limit[0]){
            break;
        }
        */
    }
    
    while(1) {
        PC.printf("%d, %d, %d, %.2lf\n\r", ball[1], ball[2], ball[3], TR.Get_Distance());
        if(TR.Get_Distance() <= kickdis){
            if(1){
                if(ball[1] < 64){
                    Kick(0);
                }
                else{
                    Kick(0);
                }
            }
        }
        /*
        if(laser == 0){
            if(ball[1] < 0{
                Kick(1);
            }
            else{
                Kick(0);
            }
        }
        */
        radius[i] = ball[3];
        if(i == 4){
            i = 0;
        }
        else{
            i++;
        }
        wait(0.05);
    }
}

void Kick(int ch)
{
    PC.printf("Kick!\n\r");
    
    MD[ch] = 0;
    MP[ch] = 1;
    wait(0.15);
    MD[ch] = 0;
    MP[ch] = 0.5;
    wait(0.4);
    MD[ch] = 1;
    MP[ch] = 1;
    wait(0.23);
    MD[ch] = 1;
    MP[ch] = 0.6;
    while(1){
        if(limit[ch]){
            MP[ch] = 0;
            break;
        }
    }
}

