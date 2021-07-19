#include "mbed.h"


PwmOut neck(PA_10);
PwmOut mouth(PB_7);
DigitalIn Leg[3] = {
    DigitalIn(A7), 
    DigitalIn(A6), 
    DigitalIn(A2)
};

//Serial Leg(PA_2, PA_3);
Serial PC(USBTX, USBRX);


void Neckturn(int dir);
void Bite(void);
void Config(void);
void LegData(void);


int sign[3];
int x = 0, y = 0;


int main()
{
    Leg[0].mode(PullUp);
    Leg[1].mode(PullUp);
    Leg[2].mode(PullUp);
    
    sign[0] = 0;
    sign[1] = 0;
    sign[2] = 0;
     
    neck.period(0.0002);
    mouth.period(0.0002); 
    
    neck = 0.5;
    mouth = 0.5;
    
    while(1){
        sign[0] = Leg[0];
        sign[1] = Leg[1];
        sign[2] = Leg[2];
        PC.printf("%d, %d, %d  %d, %d, %d\n", sign[0], sign[1], sign[2], Leg[0], Leg[1], Leg[2]);
        if(sign[0] == 1){
            Neckturn(1);
        }
        else if(sign[1] == 1){
            Neckturn(-1);
        }
        else if(sign[2] == 1){
            Bite();
        }
        else{
            neck = 0.5;
            mouth = 0.5;
        }
        wait(0.05);
    }
}


void Bite(void)
{
    mouth = 0;
    wait(0.2);
    mouth = 1;
    wait(0.2);
    mouth = 0.5;
    //sign = -1;
}


void Neckturn(int dir)
{
    int i;
    
    for(i = 0; i <= 100; i++){
        
        if(i <= 25){
            neck = (0.5 - (i * 0.02)) * dir;
        }
        else if(i <= 75){
            neck = (0.02 * (i - 25)) * dir;
        }
        else{
            neck = (1 - (0.02 * (i - 75))) * dir;
        }
        
        if(i <= 12){
            mouth = 0.5 - (0.04 * i);
        }
        else if(i <= 37){
            mouth = 0.04 * (i - 12);
        }
        else if(i <= 62){
            mouth = 1 - (0.04 * (i - 37));
        }
        else if(i <= 87){
            mouth = 0.04 * (i - 62);
        }
        else{
            mouth = 1 - (0.04 * (i - 87));
        }
               
        wait(0.03);
    }
    //sign = -1;
}

/*
void Config(void)
{
    //初期設定
    Leg.baud(9600);
    
    Leg.attach(&LegData, Serial::RxIrq);
}


void LegData(void)
{
    sign = Leg.getc();
}
*/


