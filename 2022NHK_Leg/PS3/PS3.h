#ifndef PS3_H
#define PS3_H

#include "mbed.h"

class PS3
{
    private:
        //PS3と接続するピン
        Serial cont;
        //初期設定
        void Config(void);
        //PS3から割込みでデータ受け取る
        void PS3Data(void);
        
    public:
        //ピンセット
        PS3(PinName PIN_TX, PinName PIN_RX);
        //PS3からのデータ
        int ps3[7];
};

#endif
