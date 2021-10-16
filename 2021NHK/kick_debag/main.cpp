#include "mbed.h"
#include "RotaryEncoder.h"
#include "HC_SR04.h"

//ピンとかの宣言
DigitalOut MD[2] = {
    DigitalOut(PA_12),
    DigitalOut(PB_7)
};

PwmOut MP[2] = {
    PwmOut(PB_0),
    PwmOut(PB_6)
};


DigitalIn limit[2] = {
    DigitalIn(PA_6),
    DigitalIn(PA_7)
};

HC_SR04 TR(PF_0, PB_1);
DigitalOut kicking(PA_1);

Serial Raspi(PA_9, PA_10);  //Raspi(たぶん)と通信
Serial PC(USBTX, USBRX);


//関数の宣言
void Kick(int ch);
void PS3Data(void);


//変数の宣言
int ball[4];  //ball[0]:ヘッダ(128) ball[1]:横(0~63) ball[2]:縦(0~47) ball[3]:半径(0~39)
int kickdis = 75;
int radius[5], speed[2], alpha, i;


//関数の中身
int main(void)
{
    kicking = 0;
    
    Raspi.baud(9600);
    Raspi.attach(PS3Data, Serial::RxIrq);
    
    limit[0].mode(PullDown);
    limit[1].mode(PullDown);
    
    MP[0].period(0.0002);
    MP[1].period(0.0002);
    
    MD[0] = 1;
    MP[0] = 0.2;
    MD[1] = 1;
    MP[1] = 0.2;
    
    PC.printf("position reset\n\r");
    
    while(1){
        if(limit[0]){
            PC.printf("0");
            MP[0] = 0;
            while(1){
                if(limit[1]){
                    PC.printf("1");
                    MP[1] = 0;
                    break;
                }
            }
            break;
        }
        if(limit[1]){
            PC.printf("1");
            MP[1] = 0;
            while(1){
                if(limit[0]){
                    PC.printf("0");
                    MP[0] = 0;
                    break;
                }
            }
            break;
        }
    }
    
    wait(1.0);
    
    while(1) {
        PC.printf("%d, %d, %d, %.2lf\n\r", ball[1], ball[2], ball[3], TR.Get_Distance());
        if(TR.Get_Distance() <= kickdis){
            if(1){
                if(ball[1] < 319){
                    Kick(0);
                }
                else{
                    Kick(0);
                }
            }
        }
    }
}

void Kick(int ch)
{
    PC.printf("Kick!\n\r");
    wait(0.2);
    MD[ch] = 0;
    MP[ch] = 0.5;
    wait(0.4);
    kicking = 1;
    wait(0.2);
    MD[ch] = 1;
    MP[ch] = 0.5;
    wait(0.2);
    kicking = 0;
    while(1){
        if(limit[ch]){
            MP[ch] = 0;
            break;
        }
    }
    MD[ch] = 0;
    MP[ch] = 1;
    wait(0.05);
    MP[ch] = 0;
}


void PS3Data(void)
{
    //受信割り込みのときに来るよ
    int SBDBT_Data = Raspi.getc();
    static int bits = 0, count = 0, keep = 0;
    
    if(SBDBT_Data == 128){
        bits = 0;
        count = 0;
        ball[bits] = SBDBT_Data;
        bits++;
    }    
    else{
        if(count == 0){
            keep = SBDBT_Data;
            count = 1;
        }
        else if(count == 1){
            ball[bits] = (keep * 128) + SBDBT_Data;
            count = 0;
            if(bits == 3){
                bits = 0;
            }
            else{
                bits++;
            }
        }
    }
}
