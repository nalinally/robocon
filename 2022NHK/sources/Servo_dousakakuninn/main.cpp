#include "mbed.h" 

PwmOut servo1(PA_6_ALT0);
PwmOut servo2(PB_4);
PwmOut servo3(PA_9);
PwmOut servo4(PB_5);
PwmOut servo5(PB_2);
Serial pc(USBTX, USBRX);

int main(void)
{
    pc.baud(115200);
    servo1.period(0.02);
    servo2.period(0.02);
    
    //ループ文だよ
    while(1){
        
        /*
        pc.printf("0.001");
        servo1.pulsewidth(0.0015);  
        servo2.pulsewidth(0.0015); 
        wait(1.0);
        pc.printf("0.002");
        servo1.pulsewidth(0.0003);
        servo2.pulsewidth(0.0003); 
        wait(1.0);
        */
        
        pc.printf("0.0015");
        servo1.pulsewidth(0.0015);
        servo2.pulsewidth(0.0015);
        //servo3.pulsewidth(0.0015);
        //servo4.pulsewidth(0.0015);
        //servo5.pulsewidth(0.0015);
        wait(1.0);
        
    }
}