/// @file Watchdog.cpp provides the interface to the Watchdog module
///
/// This provides basic Watchdog service for the mbed. You can configure
/// various timeout intervals that meet your system needs. Additionally,
/// it is possible to identify if the Watchdog was the cause of any 
/// system restart.
/// 
/// Adapted from Simon's Watchdog code from http://mbed.org/forum/mbed/topic/508/
///
/// @note Copyright &copy; 2011 by Smartware Computing, all rights reserved.
///     This software may be used to derive new software, as long as
///     this copyright statement remains in the source file.
/// @author David Smart
///
#include "mbed.h"
#include "Watchdog.h"

#if defined( TARGET_LPC1768 )
/// Watchdog gets instantiated at the module level
Watchdog::Watchdog() {
    wdreset = (LPC_WDT->WDMOD >> 2) & 1;    // capture the cause of the previous reset
}

/// Load timeout value in watchdog timer and enable
void Watchdog::Configure(float s) {
    LPC_WDT->WDCLKSEL = 0x1;                // Set CLK src to PCLK
    uint32_t clk = SystemCoreClock / 16;    // WD has a fixed /4 prescaler, PCLK default is /4
    LPC_WDT->WDTC = (uint32_t)(s * (float)clk);
    LPC_WDT->WDMOD = 0x3;                   // Enabled and Reset
    Service();
}

/// "Service", "kick" or "feed" the dog - reset the watchdog timer
/// by writing this required bit pattern
void Watchdog::Service() {
    LPC_WDT->WDFEED = 0xAA;
    LPC_WDT->WDFEED = 0x55;
}

/// get the flag to indicate if the watchdog causes the reset
bool Watchdog::WatchdogCausedReset() {
    return wdreset;
}
#elif defined( TARGET_LPC4088 )
// from Gesotec Gesotec
/// Watchdog gets instantiated at the module level
Watchdog::Watchdog() {
    wdreset = (LPC_WDT->MOD >> 2) & 1;    // capture the cause of the previous reset
}
 
/// Load timeout value in watchdog timer and enable
void Watchdog::Configure(float s) {
    //LPC_WDT->CLKSEL = 0x1;                // Set CLK src to PCLK
    uint32_t clk = 500000 / 4;    // WD has a fixed /4 prescaler, and a 500khz oscillator
    LPC_WDT->TC = (uint32_t)(s * (float)clk);
    LPC_WDT->MOD = 0x3;                   // Enabled and Reset
    Service();
}
 
/// "Service", "kick" or "feed" the dog - reset the watchdog timer
/// by writing this required bit pattern
void Watchdog::Service() {
    LPC_WDT->FEED = 0xAA;
    LPC_WDT->FEED = 0x55;
}
 
/// get the flag to indicate if the watchdog causes the reset
bool Watchdog::WatchdogCausedReset() {
    return wdreset;
}
#elif defined( TARGET_STM )
// Derived from Chau Vo
/// Watchdog gets instantiated at the module level
Watchdog::Watchdog() {
    wdreset = (RCC->CSR & (1<<29)) ? true : false;  // read the IWDGRSTF (Independent WD, not the windows WD)
}

/// Load timeout value in watchdog timer and enable
void Watchdog::Configure(float pr) {
    // http://www.st.com/web/en/resource/technical/document/reference_manual/CD00171190.pdf
    IWDG->KR  = 0x5555;         // enable write to PR, RLR
    IWDG->PR  = (int)pr;        // Init prescaler  prescale ratio => 2^(pr+2)
    IWDG->RLR = 0xB46;          // Init RLR  4000clk = 0.1sec
    IWDG->KR  = 0xAAAA;         // Reload the watchdog
    IWDG->KR  = 0xCCCC;         // Starts the WD
}

/// "Service", "kick" or "feed" the dog - reset the watchdog timer
void Watchdog::Service() {
    IWDG->KR  = 0xAAAA;
}

/// get the flag to indicate if the watchdog causes the reset
bool Watchdog::WatchdogCausedReset() {
    if (wdreset) {
        RCC->CSR |= (1<<24); // clear reset flag
    }
    return wdreset;
}
#endif
