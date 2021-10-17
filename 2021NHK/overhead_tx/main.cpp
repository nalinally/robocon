#include "mbed.h"

DigitalIn sw(PA_7);
Serial PC(USBTX, USBRX);
Serial Xbee(PA_9, PA_10);

int main(void)
{
    int i;
    sw.mode(PullDown);
    Xbee.baud(9600);
    while(1){
        i = sw;
        if(i == 0){
            PC.printf("Kick!\n\r");
            Xbee.printf("e");
            while(i == 0){
                i = sw;
            }
        }
        else if(i == 1){
            PC.printf("Lock!\n\r");
            Xbee.putc('x');
            while(i == 1){
                i = sw;
            }
        }
    }
        
}
