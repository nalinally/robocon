//This 'L6470' libraly maked by Brid

#ifndef MBED_L6470
#define MBED_L6470
 
#include "mbed.h"

#define FORWARD     1
#define REVERSE     0

//
//INI = ResetHex
//My specification for Initial value
#define INI_ABS_POS     0    //Current position         
#define INI_EL_POS      0    //Electrical position
#define INI_MARK        0    //Mark position
#define INI_SPEED       0    //Current speed
#define INI_ACC         0x8A    //Acceleration
#define INI_DEC         0x8A    //Deceleration
#define INI_MAX_SPEED   0x20    //Maximum speed
#define INI_MIN_SPEED   0    //Minimum speed
#define INI_KVAL_HOLD   0xFF    //Full step speed
#define INI_KVAL_RUN    0xFF    //
#define INI_KVAL_ACC    0xFF    //
#define INI_KVAL_DEC    0xFF    //
#define INI_INT_SPD     0x408   //
#define INI_ST_SLP      0x19    //
#define INI_FN_SLP_ACC  0x29    //
#define INI_FN_SLP_DEC  0x29    //
#define INI_K_THERA     0x0    //
//         ADC_OUT     ReadOnly
#define INI_OCR_TH      0xF      
#define INI_STALL_TH    0x7F
#define INI_FS_SPD      0x27
#define INI_STEP_MODE   0x7
#define INI_ARARM_FN    0xFF
#define INI_CONFIG      0x2E88    
//      INI_STATUS      ReadOnly








// name         (length<<8)+address
//
#define ABS_POS      ((22<<8)+0x01)    //Current position         
#define EL_POS        ((9<<8)+0x02)    //Electrical position
#define MARK         ((22<<8)+0x03)    //Mark position
#define SPEED        ((20<<8)+0x04)    //Current speed
#define ACC          ((12<<8)+0x05)    //Acceleration
#define DEC          ((12<<8)+0x06)    //Deceleration
#define MAX_SPEED    ((10<<8)+0x07)    //Maximum speed
#define MIN_SPEED    ((13<<8)+0x08)    //Minimum speed
#define KVAL_HOLD     ((8<<8)+0x09)    //Full step speed
#define KVAL_RUN      ((8<<8)+0x0A)    //
#define KVAL_ACC      ((8<<8)+0x0B)    //
#define KVAL_DEC      ((8<<8)+0x0C)    //
#define INT_SPD      ((14<<8)+0x0D)    //
#define ST_SLP        ((8<<8)+0x0E)    //
#define FN_SLP_ACC    ((8<<8)+0x0F)    //
#define FN_SLP_DEC    ((8<<8)+0x10)    //
#define K_THERA       ((4<<8)+0x11)    //
#define ADC_OUT       ((5<<8)+0x12)    //
#define OCR_TH        ((4<<8)+0x13)    //
#define STALL_TH      ((7<<8)+0x14)    //
#define FS_SPD       ((10<<8)+0x15)    //
#define STEP_MODE     ((8<<8)+0x16)    //
#define ARARM_FN      ((8<<8)+0x17)    //
#define CONFIG       ((16<<8)+0x18)    //
#define STATUS       ((16<<8)+0x19)    //






class L6470{
public:
    L6470(PinName mosi, PinName miso, PinName sclk, PinName cs);

    unsigned char send(unsigned char temp);    
    void send_bytes(unsigned char temp[],int i);
    void NOP();
    void SetParam(int param,int value);
    int GetParam(int param);
    void Run(unsigned char dir,int spd);
    void StepClock(unsigned char dir);
    void Move(unsigned char dir,int n_step);
    void GoTo(int abs_pos);
    void GoTo_DIR(unsigned char dir,int abs_pos);
    void GoUntil(unsigned char act,unsigned char dir,int spd);
    void ReleaseSW(unsigned char act,unsigned char dir);
    void GoHome();
    void GoMark();
    void ResetPos();
    void ResetDevice();
    void SoftStop();
    void HardStop();
    void SoftHiZ();
    void HardHiZ();
    void Resets();

private:
    SPI m_spi;
    DigitalOut m_cs;
};

 
#endif