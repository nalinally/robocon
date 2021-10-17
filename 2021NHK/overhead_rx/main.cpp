#include "mbed.h"

PwmOut servo[2] = {
    PwmOut(PA_7),
    PwmOut(PA_6)
};

Serial PC(USBTX, USBRX);
Serial Xbee(PA_9, PA_10);

int main(void)
{
    PC.printf("Program Written.");
    int sign = 'a';
    Xbee.baud(9600);
    servo[0].pulsewidth(0.0005);
    servo[1].pulsewidth(0.0025);
    while(1){
        if(Xbee.readable()){
            sign = Xbee.getc();
            PC.printf("%d", sign);
            if(sign == 252){
                wait(0.97);
                servo[0].pulsewidth(0.0025);
                wait(0.03);
                servo[1].pulsewidth(0.0005);
                PC.printf("Kick!");
            }
            else if(sign == 255){
                servo[0].pulsewidth(0.0005);
                servo[1].pulsewidth(0.0025);
                PC.printf("Lock!");
            }
        }
        wait(0.01);
    }
}
