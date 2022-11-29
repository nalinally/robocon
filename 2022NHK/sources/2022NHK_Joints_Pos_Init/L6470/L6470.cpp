//This 'L6470' libraly maked by Brid
//
//


#include "mbed.h"
#include "L6470.h"

L6470::L6470(PinName mosi, PinName miso, PinName sclk, PinName cs)
:m_spi(mosi, miso, sclk)
,m_cs(cs) {
    m_cs = 1;
    m_spi.format(8,3);
    m_spi.frequency(1000000);
    //wait(1);
    //pc.printf("reset now\n");
}
    

unsigned char L6470::send(unsigned char temp){
    m_cs = 0;
    //printf("send: %2x",temp);
    temp =(unsigned char) m_spi.write(temp);
    //printf(" %2x\n",temp);
    //wait(0.5);
    m_cs = 1;
    wait_us(1);
    return(temp);
}

void L6470::send_bytes(unsigned char temp[],int i){
    while(0 < i--){
        temp[i] = send(temp[i]);
    }
}

void L6470::NOP(){
    send(0x00);
}

void L6470::SetParam(int param,int value){
    int n = (param>>8)/8;
    int m = (param>>8)%8;
//        pc.printf("palam = %x\n",param);
//        pc.printf("n = %x\n",n);
//        pc.printf("m = %x\n",m);
    if(m==0){
        unsigned char temp[n+1];
        temp[n] = 0x00|(unsigned char)(param&0xFF);
        while(0 < n--){
            temp[n]=(unsigned char) (value >> 8*n)&0xFF;
        }
        send_bytes(temp,sizeof temp/sizeof temp[0]);
    }else{
        unsigned char temp[n+2];
        temp[n+1] = 0x00|(unsigned char)(param&0xFF);
        temp[n] =(unsigned char) (value >> 8*n)&~(0xff<<m);
        while(0 < n--){
            temp[n]=(unsigned char) (value >> 8*n)&0xFF;
        }
        send_bytes(temp,sizeof temp/sizeof temp[0]);
    }
}




int L6470::GetParam(int param){
    int value = 0;
    int n = (param>>8)/8;
    int m = (param>>8)%8;
    if(m==0){
        unsigned char temp[n+1];
        for(int i = 0; i < n+1; i++){
            temp[i]=0;
        }
        temp[n] = 0x20|(unsigned char)(param&0xFF);
        send_bytes(temp,sizeof temp/sizeof temp[0]);
        while(0 < n--){
            value |= (int)temp[n] << 8*n;
        }
    }else{
        n++;
        unsigned char temp[n+1];
        for(int i = 0; i < n+2; i++){
            temp[i]=0;
        }
        temp[n] = 0x20|(unsigned char)(param&0xFF);
        send_bytes(temp,sizeof temp/sizeof temp[0]);
        while(0 < n--){
            value |= (int)temp[n] << 8*n;
        }
    }
    
return(value);    
}



void L6470::Run(unsigned char dir,int spd){
    unsigned char temp[4];        
    temp[3] = 0x50|dir;
    temp[2] = (unsigned char) (spd >> 16)&0x0F;
    temp[1] = (unsigned char) (spd >>  8)&0xFF;
    temp[0] = (unsigned char) (spd >>  0)&0xFF;
    send_bytes(temp,sizeof temp/sizeof temp[0]);
}

void L6470::StepClock(unsigned char dir){
    send(0x58|dir);
}


void L6470::Move(unsigned char dir,int n_step){
    unsigned char temp[4];        
    temp[3] = 0x40|dir;
    temp[2] = (unsigned char) (n_step >> 16)&0x3F;
    temp[1] = (unsigned char) (n_step >>  8)&0xFF;
    temp[0] = (unsigned char) (n_step >>  0)&0xFF;
    send_bytes(temp,sizeof temp/sizeof temp[0]);
}
 
void L6470::GoTo(int abs_pos){
    unsigned char temp[4];        
    temp[3] = 0x60;
    temp[2] = (unsigned char) (abs_pos >> 16)&0x3F;
    temp[1] = (unsigned char) (abs_pos >>  8)&0xFF;
    temp[0] = (unsigned char) (abs_pos >>  0)&0xFF;
    send_bytes(temp,sizeof temp/sizeof temp[0]);
}


void L6470::GoTo_DIR(unsigned char dir,int abs_pos){
    unsigned char temp[4];     
    temp[3] = 0x68|dir;
    temp[2] = (unsigned char) (abs_pos >> 16)&0x3F;
    temp[1] = (unsigned char) (abs_pos >>  8)&0xFF;
    temp[0] = (unsigned char) (abs_pos >>  0)&0xFF;
    send_bytes(temp,sizeof temp/sizeof temp[0]);
}


void L6470::GoUntil(unsigned char act,unsigned char dir,int spd){
    unsigned char temp[4];     
    temp[3] = 0x82|(act << 3)|dir;
    temp[2] = (unsigned char) (spd >> 16)&0x0F;
    temp[1] = (unsigned char) (spd >>  8)&0xFF;
    temp[0] = (unsigned char) (spd >>  0)&0xFF;
    send_bytes(temp,sizeof temp/sizeof temp[0]);
}

void L6470::ReleaseSW(unsigned char act,unsigned char dir){
    send(0x92|(act << 3)|dir);
}

void L6470::GoHome(){
    send(0x70);
}

void L6470::GoMark(){
    send(0x78);
}

void L6470::ResetPos(){
    send(0xD8);
}

void L6470::ResetDevice(){
    send(0xC0);
}

void L6470::SoftStop(){
    send(0xB0);
}

void L6470::HardStop(){
    send(0xB8);
}


void L6470::SoftHiZ(){
    send(0xA0);
}

void L6470::HardHiZ(){
    send(0xA8);
}

void L6470::Resets(){
    SoftStop();
    ResetDevice();
    SetParam(ABS_POS,INI_ABS_POS);
    SetParam(EL_POS,INI_EL_POS);
    SetParam(MARK,INI_MARK);
    SetParam(SPEED,INI_SPEED);
    SetParam(ACC,INI_ACC);
    SetParam(DEC,INI_DEC);
    SetParam(MAX_SPEED,INI_MAX_SPEED);
    SetParam(MIN_SPEED,INI_MIN_SPEED);
    SetParam(KVAL_HOLD,INI_KVAL_HOLD);
    SetParam(KVAL_RUN,INI_KVAL_RUN);
    SetParam(KVAL_ACC,INI_KVAL_ACC);
    SetParam(KVAL_DEC,INI_KVAL_DEC);
    SetParam(INT_SPD,INI_INT_SPD);
    SetParam(ST_SLP,INI_ST_SLP);
    SetParam(FN_SLP_ACC,INI_FN_SLP_ACC);
    SetParam(FN_SLP_DEC,INI_FN_SLP_DEC);
    SetParam(K_THERA,INI_K_THERA);
    SetParam(OCR_TH,INI_OCR_TH);      
    SetParam(STALL_TH,INI_STALL_TH);
    SetParam(FS_SPD,INI_FS_SPD);
    SetParam(STEP_MODE,INI_STEP_MODE);
    SetParam(ARARM_FN,INI_ARARM_FN);
    SetParam(CONFIG,INI_CONFIG);            
}

