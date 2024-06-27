// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vlogicnet_H_
#define _Vlogicnet_H_

#include "verilated.h"

class Vlogicnet__Syms;
class VerilatedVcd;

//----------

VL_MODULE(Vlogicnet) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_INW(M0,127,0,4);
    VL_OUT(M2,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N1_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N3_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N4_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N22_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N23_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N24_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N26_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N29_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N30_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N32_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N33_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N34_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N35_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N36_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N37_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N38_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N39_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N40_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N41_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N42_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N43_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N44_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N45_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N46_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N47_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N48_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N49_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N50_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N51_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N52_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N53_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N54_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N55_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N59_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N61_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N62_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N64_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N65_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N66_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N67_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N68_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N69_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N70_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N71_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N72_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N74_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N76_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N77_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N78_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N79_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N80_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N82_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N83_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N84_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N85_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N86_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N87_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N88_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N89_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N90_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N91_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N92_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N93_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N96_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N97_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N98_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N99_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N100_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N101_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N103_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N104_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N105_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N106_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N107_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N108_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N109_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N110_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N111_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N112_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N113_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N115_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N117_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N118_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N119_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N122_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N123_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N124_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N126_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N127_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r,1,0);
    VL_SIGW(logicnet__DOT__M1,255,0,8);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    static VL_ST_SIG8(__Vtable1_logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable2_logicnet__DOT__layer0_inst__DOT__layer0_N1_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable3_logicnet__DOT__layer0_inst__DOT__layer0_N3_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable4_logicnet__DOT__layer0_inst__DOT__layer0_N4_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable5_logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable6_logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable7_logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable8_logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable9_logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable10_logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable11_logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable12_logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable13_logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable14_logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable15_logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable16_logicnet__DOT__layer0_inst__DOT__layer0_N22_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable17_logicnet__DOT__layer0_inst__DOT__layer0_N23_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable18_logicnet__DOT__layer0_inst__DOT__layer0_N24_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable19_logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable20_logicnet__DOT__layer0_inst__DOT__layer0_N26_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable21_logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable22_logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable23_logicnet__DOT__layer0_inst__DOT__layer0_N29_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable24_logicnet__DOT__layer0_inst__DOT__layer0_N30_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable25_logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable26_logicnet__DOT__layer0_inst__DOT__layer0_N32_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable27_logicnet__DOT__layer0_inst__DOT__layer0_N33_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable28_logicnet__DOT__layer0_inst__DOT__layer0_N34_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable29_logicnet__DOT__layer0_inst__DOT__layer0_N35_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable30_logicnet__DOT__layer0_inst__DOT__layer0_N36_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable31_logicnet__DOT__layer0_inst__DOT__layer0_N37_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable32_logicnet__DOT__layer0_inst__DOT__layer0_N38_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable33_logicnet__DOT__layer0_inst__DOT__layer0_N39_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable34_logicnet__DOT__layer0_inst__DOT__layer0_N40_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable35_logicnet__DOT__layer0_inst__DOT__layer0_N41_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable36_logicnet__DOT__layer0_inst__DOT__layer0_N42_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable37_logicnet__DOT__layer0_inst__DOT__layer0_N43_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable38_logicnet__DOT__layer0_inst__DOT__layer0_N44_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable39_logicnet__DOT__layer0_inst__DOT__layer0_N45_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable40_logicnet__DOT__layer0_inst__DOT__layer0_N46_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable41_logicnet__DOT__layer0_inst__DOT__layer0_N47_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable42_logicnet__DOT__layer0_inst__DOT__layer0_N48_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable43_logicnet__DOT__layer0_inst__DOT__layer0_N49_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable44_logicnet__DOT__layer0_inst__DOT__layer0_N50_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable45_logicnet__DOT__layer0_inst__DOT__layer0_N51_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable46_logicnet__DOT__layer0_inst__DOT__layer0_N52_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable47_logicnet__DOT__layer0_inst__DOT__layer0_N53_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable48_logicnet__DOT__layer0_inst__DOT__layer0_N54_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable49_logicnet__DOT__layer0_inst__DOT__layer0_N55_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable50_logicnet__DOT__layer0_inst__DOT__layer0_N59_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable51_logicnet__DOT__layer0_inst__DOT__layer0_N61_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable52_logicnet__DOT__layer0_inst__DOT__layer0_N62_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable53_logicnet__DOT__layer0_inst__DOT__layer0_N64_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable54_logicnet__DOT__layer0_inst__DOT__layer0_N65_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable55_logicnet__DOT__layer0_inst__DOT__layer0_N66_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable56_logicnet__DOT__layer0_inst__DOT__layer0_N67_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable57_logicnet__DOT__layer0_inst__DOT__layer0_N68_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable58_logicnet__DOT__layer0_inst__DOT__layer0_N69_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable59_logicnet__DOT__layer0_inst__DOT__layer0_N70_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable60_logicnet__DOT__layer0_inst__DOT__layer0_N71_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable61_logicnet__DOT__layer0_inst__DOT__layer0_N72_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable62_logicnet__DOT__layer0_inst__DOT__layer0_N74_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable63_logicnet__DOT__layer0_inst__DOT__layer0_N76_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable64_logicnet__DOT__layer0_inst__DOT__layer0_N77_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable65_logicnet__DOT__layer0_inst__DOT__layer0_N78_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable66_logicnet__DOT__layer0_inst__DOT__layer0_N79_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable67_logicnet__DOT__layer0_inst__DOT__layer0_N80_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable68_logicnet__DOT__layer0_inst__DOT__layer0_N82_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable69_logicnet__DOT__layer0_inst__DOT__layer0_N83_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable70_logicnet__DOT__layer0_inst__DOT__layer0_N84_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable71_logicnet__DOT__layer0_inst__DOT__layer0_N85_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable72_logicnet__DOT__layer0_inst__DOT__layer0_N86_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable73_logicnet__DOT__layer0_inst__DOT__layer0_N87_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable74_logicnet__DOT__layer0_inst__DOT__layer0_N88_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable75_logicnet__DOT__layer0_inst__DOT__layer0_N89_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable76_logicnet__DOT__layer0_inst__DOT__layer0_N90_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable77_logicnet__DOT__layer0_inst__DOT__layer0_N91_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable78_logicnet__DOT__layer0_inst__DOT__layer0_N92_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable79_logicnet__DOT__layer0_inst__DOT__layer0_N93_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable80_logicnet__DOT__layer0_inst__DOT__layer0_N96_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable81_logicnet__DOT__layer0_inst__DOT__layer0_N97_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable82_logicnet__DOT__layer0_inst__DOT__layer0_N98_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable83_logicnet__DOT__layer0_inst__DOT__layer0_N99_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable84_logicnet__DOT__layer0_inst__DOT__layer0_N100_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable85_logicnet__DOT__layer0_inst__DOT__layer0_N101_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable86_logicnet__DOT__layer0_inst__DOT__layer0_N103_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable87_logicnet__DOT__layer0_inst__DOT__layer0_N104_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable88_logicnet__DOT__layer0_inst__DOT__layer0_N105_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable89_logicnet__DOT__layer0_inst__DOT__layer0_N106_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable90_logicnet__DOT__layer0_inst__DOT__layer0_N107_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable91_logicnet__DOT__layer0_inst__DOT__layer0_N108_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable92_logicnet__DOT__layer0_inst__DOT__layer0_N109_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable93_logicnet__DOT__layer0_inst__DOT__layer0_N110_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable94_logicnet__DOT__layer0_inst__DOT__layer0_N111_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable95_logicnet__DOT__layer0_inst__DOT__layer0_N112_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable96_logicnet__DOT__layer0_inst__DOT__layer0_N113_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable97_logicnet__DOT__layer0_inst__DOT__layer0_N115_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable98_logicnet__DOT__layer0_inst__DOT__layer0_N117_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable99_logicnet__DOT__layer0_inst__DOT__layer0_N118_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable100_logicnet__DOT__layer0_inst__DOT__layer0_N119_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable101_logicnet__DOT__layer0_inst__DOT__layer0_N122_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable102_logicnet__DOT__layer0_inst__DOT__layer0_N123_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable103_logicnet__DOT__layer0_inst__DOT__layer0_N124_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable104_logicnet__DOT__layer0_inst__DOT__layer0_N126_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable105_logicnet__DOT__layer0_inst__DOT__layer0_N127_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable106_logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable107_logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable108_logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable109_logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable110_logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable111_logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable112_logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable113_logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable114_logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable115_logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable116_logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable117_logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable118_logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable119_logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable120_logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable121_logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r[256],1,0);
    VL_SIG8(__Vtableidx1,7,0);
    VL_SIG8(__Vtableidx2,7,0);
    VL_SIG8(__Vtableidx3,7,0);
    VL_SIG8(__Vtableidx4,7,0);
    VL_SIG8(__Vtableidx5,7,0);
    VL_SIG8(__Vtableidx6,7,0);
    VL_SIG8(__Vtableidx7,7,0);
    VL_SIG8(__Vtableidx8,7,0);
    VL_SIG8(__Vtableidx9,7,0);
    VL_SIG8(__Vtableidx10,7,0);
    VL_SIG8(__Vtableidx11,7,0);
    VL_SIG8(__Vtableidx12,7,0);
    VL_SIG8(__Vtableidx13,7,0);
    VL_SIG8(__Vtableidx14,7,0);
    VL_SIG8(__Vtableidx15,7,0);
    VL_SIG8(__Vtableidx16,7,0);
    VL_SIG8(__Vtableidx17,7,0);
    VL_SIG8(__Vtableidx18,7,0);
    VL_SIG8(__Vtableidx19,7,0);
    VL_SIG8(__Vtableidx20,7,0);
    VL_SIG8(__Vtableidx21,7,0);
    VL_SIG8(__Vtableidx22,7,0);
    VL_SIG8(__Vtableidx23,7,0);
    VL_SIG8(__Vtableidx24,7,0);
    VL_SIG8(__Vtableidx25,7,0);
    VL_SIG8(__Vtableidx26,7,0);
    VL_SIG8(__Vtableidx27,7,0);
    VL_SIG8(__Vtableidx28,7,0);
    VL_SIG8(__Vtableidx29,7,0);
    VL_SIG8(__Vtableidx30,7,0);
    VL_SIG8(__Vtableidx31,7,0);
    VL_SIG8(__Vtableidx32,7,0);
    VL_SIG8(__Vtableidx33,7,0);
    VL_SIG8(__Vtableidx34,7,0);
    VL_SIG8(__Vtableidx35,7,0);
    VL_SIG8(__Vtableidx36,7,0);
    VL_SIG8(__Vtableidx37,7,0);
    VL_SIG8(__Vtableidx38,7,0);
    VL_SIG8(__Vtableidx39,7,0);
    VL_SIG8(__Vtableidx40,7,0);
    VL_SIG8(__Vtableidx41,7,0);
    VL_SIG8(__Vtableidx42,7,0);
    VL_SIG8(__Vtableidx43,7,0);
    VL_SIG8(__Vtableidx44,7,0);
    VL_SIG8(__Vtableidx45,7,0);
    VL_SIG8(__Vtableidx46,7,0);
    VL_SIG8(__Vtableidx47,7,0);
    VL_SIG8(__Vtableidx48,7,0);
    VL_SIG8(__Vtableidx49,7,0);
    VL_SIG8(__Vtableidx50,7,0);
    VL_SIG8(__Vtableidx51,7,0);
    VL_SIG8(__Vtableidx52,7,0);
    VL_SIG8(__Vtableidx53,7,0);
    VL_SIG8(__Vtableidx54,7,0);
    VL_SIG8(__Vtableidx55,7,0);
    VL_SIG8(__Vtableidx56,7,0);
    VL_SIG8(__Vtableidx57,7,0);
    VL_SIG8(__Vtableidx58,7,0);
    VL_SIG8(__Vtableidx59,7,0);
    VL_SIG8(__Vtableidx60,7,0);
    VL_SIG8(__Vtableidx61,7,0);
    VL_SIG8(__Vtableidx62,7,0);
    VL_SIG8(__Vtableidx63,7,0);
    VL_SIG8(__Vtableidx64,7,0);
    VL_SIG8(__Vtableidx65,7,0);
    VL_SIG8(__Vtableidx66,7,0);
    VL_SIG8(__Vtableidx67,7,0);
    VL_SIG8(__Vtableidx68,7,0);
    VL_SIG8(__Vtableidx69,7,0);
    VL_SIG8(__Vtableidx70,7,0);
    VL_SIG8(__Vtableidx71,7,0);
    VL_SIG8(__Vtableidx72,7,0);
    VL_SIG8(__Vtableidx73,7,0);
    VL_SIG8(__Vtableidx74,7,0);
    VL_SIG8(__Vtableidx75,7,0);
    VL_SIG8(__Vtableidx76,7,0);
    VL_SIG8(__Vtableidx77,7,0);
    VL_SIG8(__Vtableidx78,7,0);
    VL_SIG8(__Vtableidx79,7,0);
    VL_SIG8(__Vtableidx80,7,0);
    VL_SIG8(__Vtableidx81,7,0);
    VL_SIG8(__Vtableidx82,7,0);
    VL_SIG8(__Vtableidx83,7,0);
    VL_SIG8(__Vtableidx84,7,0);
    VL_SIG8(__Vtableidx85,7,0);
    VL_SIG8(__Vtableidx86,7,0);
    VL_SIG8(__Vtableidx87,7,0);
    VL_SIG8(__Vtableidx88,7,0);
    VL_SIG8(__Vtableidx89,7,0);
    VL_SIG8(__Vtableidx90,7,0);
    VL_SIG8(__Vtableidx91,7,0);
    VL_SIG8(__Vtableidx92,7,0);
    VL_SIG8(__Vtableidx93,7,0);
    VL_SIG8(__Vtableidx94,7,0);
    VL_SIG8(__Vtableidx95,7,0);
    VL_SIG8(__Vtableidx96,7,0);
    VL_SIG8(__Vtableidx97,7,0);
    VL_SIG8(__Vtableidx98,7,0);
    VL_SIG8(__Vtableidx99,7,0);
    VL_SIG8(__Vtableidx100,7,0);
    VL_SIG8(__Vtableidx101,7,0);
    VL_SIG8(__Vtableidx102,7,0);
    VL_SIG8(__Vtableidx103,7,0);
    VL_SIG8(__Vtableidx104,7,0);
    VL_SIG8(__Vtableidx105,7,0);
    VL_SIG8(__Vtableidx106,7,0);
    VL_SIG8(__Vtableidx107,7,0);
    VL_SIG8(__Vtableidx108,7,0);
    VL_SIG8(__Vtableidx109,7,0);
    VL_SIG8(__Vtableidx110,7,0);
    VL_SIG8(__Vtableidx111,7,0);
    VL_SIG8(__Vtableidx112,7,0);
    VL_SIG8(__Vtableidx113,7,0);
    VL_SIG8(__Vtableidx114,7,0);
    VL_SIG8(__Vtableidx115,7,0);
    VL_SIG8(__Vtableidx116,7,0);
    VL_SIG8(__Vtableidx117,7,0);
    VL_SIG8(__Vtableidx118,7,0);
    VL_SIG8(__Vtableidx119,7,0);
    VL_SIG8(__Vtableidx120,7,0);
    VL_SIG8(__Vtableidx121,7,0);
    VL_SIG(__Vm_traceActivity,31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vlogicnet__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Vlogicnet& operator= (const Vlogicnet&);  ///< Copying not allowed
    Vlogicnet(const Vlogicnet&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vlogicnet(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vlogicnet();
    /// Trace signals in the model; called by application code
    void trace (VerilatedVcdC* tfp, int levels, int options=0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vlogicnet__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vlogicnet__Syms* symsp, bool first);
  private:
    static QData _change_request(Vlogicnet__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__2(Vlogicnet__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    static void _eval(Vlogicnet__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vlogicnet__Syms* __restrict vlSymsp);
    static void _eval_settle(Vlogicnet__Syms* __restrict vlSymsp);
    static void _settle__TOP__1(Vlogicnet__Syms* __restrict vlSymsp);
    static void traceChgThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis__1(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis__1(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInit (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg  (VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif // guard
