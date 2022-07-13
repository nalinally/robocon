#include "PS3.h"

PS3::PS3(PinName PIN_TX, PinName PIN_RX) : cont(PIN_TX, PIN_RX)
{
    Config();
}

//初期設定
void PS3::Config(void)
{
    //初期設定
    cont.baud(2400);
    
    cont.attach(this, &PS3::PS3Data, Serial::RxIrq);
}

void PS3::PS3Data(void)
{
    //受信割り込みのときに来るよ
    int SBDBT_Data = cont.getc();
    static int bits = 0;
    
    if (SBDBT_Data >= 0){
        if(SBDBT_Data == 128){
            bits = 0;
        }
        ps3[bits] = SBDBT_Data;
        
        if (bits == 7){
            bits = 0;
        }
        else {
            bits++;
        }
    }
}
