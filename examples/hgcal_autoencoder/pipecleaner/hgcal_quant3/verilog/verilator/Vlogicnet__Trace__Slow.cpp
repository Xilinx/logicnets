// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vlogicnet__Syms.h"


//======================

void Vlogicnet::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&Vlogicnet::traceInit, &Vlogicnet::traceFull, &Vlogicnet::traceChg, this);
}
void Vlogicnet::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vlogicnet* t=(Vlogicnet*)userthis;
    Vlogicnet__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vlogicnet::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vlogicnet* t=(Vlogicnet*)userthis;
    Vlogicnet__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void Vlogicnet::traceInitThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vlogicnet::traceFullThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vlogicnet::traceInitThis__1(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declArray(c+96,"M0",-1,127,0);
	vcdp->declBit  (c+100,"clk",-1);
	vcdp->declBit  (c+101,"rst",-1);
	vcdp->declBus  (c+102,"M2",-1,31,0);
	vcdp->declArray(c+96,"logicnet M0",-1,127,0);
	vcdp->declBit  (c+100,"logicnet clk",-1);
	vcdp->declBit  (c+101,"logicnet rst",-1);
	vcdp->declBus  (c+102,"logicnet M2",-1,31,0);
	vcdp->declArray(c+42,"logicnet M0w",-1,127,0);
	vcdp->declQuad (c+1,"logicnet M1",-1,63,0);
	vcdp->declQuad (c+46,"logicnet M1w",-1,63,0);
	vcdp->declBus  (c+103,"logicnet layer0_reg DataWidth",-1,31,0);
	vcdp->declArray(c+96,"logicnet layer0_reg data_in",-1,127,0);
	vcdp->declBit  (c+100,"logicnet layer0_reg clk",-1);
	vcdp->declBit  (c+101,"logicnet layer0_reg rst",-1);
	vcdp->declArray(c+42,"logicnet layer0_reg data_out",-1,127,0);
	vcdp->declArray(c+42,"logicnet layer0_inst M0",-1,127,0);
	vcdp->declQuad (c+1,"logicnet layer0_inst M1",-1,63,0);
	vcdp->declBus  (c+48,"logicnet layer0_inst layer0_N0_wire",-1,7,0);
	vcdp->declBus  (c+49,"logicnet layer0_inst layer0_N1_wire",-1,7,0);
	vcdp->declBus  (c+50,"logicnet layer0_inst layer0_N2_wire",-1,7,0);
	vcdp->declBus  (c+51,"logicnet layer0_inst layer0_N3_wire",-1,7,0);
	vcdp->declBus  (c+52,"logicnet layer0_inst layer0_N4_wire",-1,7,0);
	vcdp->declBus  (c+53,"logicnet layer0_inst layer0_N5_wire",-1,7,0);
	vcdp->declBus  (c+54,"logicnet layer0_inst layer0_N6_wire",-1,7,0);
	vcdp->declBus  (c+55,"logicnet layer0_inst layer0_N7_wire",-1,7,0);
	vcdp->declBus  (c+56,"logicnet layer0_inst layer0_N8_wire",-1,7,0);
	vcdp->declBus  (c+57,"logicnet layer0_inst layer0_N9_wire",-1,7,0);
	vcdp->declBus  (c+58,"logicnet layer0_inst layer0_N10_wire",-1,7,0);
	vcdp->declBus  (c+59,"logicnet layer0_inst layer0_N11_wire",-1,7,0);
	vcdp->declBus  (c+60,"logicnet layer0_inst layer0_N12_wire",-1,7,0);
	vcdp->declBus  (c+61,"logicnet layer0_inst layer0_N13_wire",-1,7,0);
	vcdp->declBus  (c+62,"logicnet layer0_inst layer0_N14_wire",-1,7,0);
	vcdp->declBus  (c+63,"logicnet layer0_inst layer0_N15_wire",-1,7,0);
	vcdp->declBus  (c+64,"logicnet layer0_inst layer0_N16_wire",-1,7,0);
	vcdp->declBus  (c+65,"logicnet layer0_inst layer0_N17_wire",-1,7,0);
	vcdp->declBus  (c+66,"logicnet layer0_inst layer0_N18_wire",-1,7,0);
	vcdp->declBus  (c+67,"logicnet layer0_inst layer0_N19_wire",-1,7,0);
	vcdp->declBus  (c+68,"logicnet layer0_inst layer0_N20_wire",-1,7,0);
	vcdp->declBus  (c+69,"logicnet layer0_inst layer0_N21_wire",-1,7,0);
	vcdp->declBus  (c+70,"logicnet layer0_inst layer0_N22_wire",-1,7,0);
	vcdp->declBus  (c+71,"logicnet layer0_inst layer0_N23_wire",-1,7,0);
	vcdp->declBus  (c+72,"logicnet layer0_inst layer0_N24_wire",-1,7,0);
	vcdp->declBus  (c+73,"logicnet layer0_inst layer0_N25_wire",-1,7,0);
	vcdp->declBus  (c+74,"logicnet layer0_inst layer0_N26_wire",-1,7,0);
	vcdp->declBus  (c+75,"logicnet layer0_inst layer0_N27_wire",-1,7,0);
	vcdp->declBus  (c+76,"logicnet layer0_inst layer0_N28_wire",-1,7,0);
	vcdp->declBus  (c+77,"logicnet layer0_inst layer0_N29_wire",-1,7,0);
	vcdp->declBus  (c+78,"logicnet layer0_inst layer0_N30_wire",-1,7,0);
	vcdp->declBus  (c+79,"logicnet layer0_inst layer0_N31_wire",-1,7,0);
	vcdp->declBus  (c+48,"logicnet layer0_inst layer0_N0_inst M0",-1,7,0);
	vcdp->declBus  (c+3,"logicnet layer0_inst layer0_N0_inst M1",-1,1,0);
	vcdp->declBus  (c+3,"logicnet layer0_inst layer0_N0_inst M1r",-1,1,0);
	vcdp->declBus  (c+49,"logicnet layer0_inst layer0_N1_inst M0",-1,7,0);
	vcdp->declBus  (c+4,"logicnet layer0_inst layer0_N1_inst M1",-1,1,0);
	vcdp->declBus  (c+4,"logicnet layer0_inst layer0_N1_inst M1r",-1,1,0);
	vcdp->declBus  (c+50,"logicnet layer0_inst layer0_N2_inst M0",-1,7,0);
	vcdp->declBus  (c+5,"logicnet layer0_inst layer0_N2_inst M1",-1,1,0);
	vcdp->declBus  (c+5,"logicnet layer0_inst layer0_N2_inst M1r",-1,1,0);
	vcdp->declBus  (c+51,"logicnet layer0_inst layer0_N3_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N3_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N3_inst M1r",-1,1,0);
	vcdp->declBus  (c+52,"logicnet layer0_inst layer0_N4_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N4_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N4_inst M1r",-1,1,0);
	vcdp->declBus  (c+53,"logicnet layer0_inst layer0_N5_inst M0",-1,7,0);
	vcdp->declBus  (c+6,"logicnet layer0_inst layer0_N5_inst M1",-1,1,0);
	vcdp->declBus  (c+6,"logicnet layer0_inst layer0_N5_inst M1r",-1,1,0);
	vcdp->declBus  (c+54,"logicnet layer0_inst layer0_N6_inst M0",-1,7,0);
	vcdp->declBus  (c+7,"logicnet layer0_inst layer0_N6_inst M1",-1,1,0);
	vcdp->declBus  (c+7,"logicnet layer0_inst layer0_N6_inst M1r",-1,1,0);
	vcdp->declBus  (c+55,"logicnet layer0_inst layer0_N7_inst M0",-1,7,0);
	vcdp->declBus  (c+8,"logicnet layer0_inst layer0_N7_inst M1",-1,1,0);
	vcdp->declBus  (c+8,"logicnet layer0_inst layer0_N7_inst M1r",-1,1,0);
	vcdp->declBus  (c+56,"logicnet layer0_inst layer0_N8_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N8_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N8_inst M1r",-1,1,0);
	vcdp->declBus  (c+57,"logicnet layer0_inst layer0_N9_inst M0",-1,7,0);
	vcdp->declBus  (c+9,"logicnet layer0_inst layer0_N9_inst M1",-1,1,0);
	vcdp->declBus  (c+9,"logicnet layer0_inst layer0_N9_inst M1r",-1,1,0);
	vcdp->declBus  (c+58,"logicnet layer0_inst layer0_N10_inst M0",-1,7,0);
	vcdp->declBus  (c+10,"logicnet layer0_inst layer0_N10_inst M1",-1,1,0);
	vcdp->declBus  (c+10,"logicnet layer0_inst layer0_N10_inst M1r",-1,1,0);
	vcdp->declBus  (c+59,"logicnet layer0_inst layer0_N11_inst M0",-1,7,0);
	vcdp->declBus  (c+11,"logicnet layer0_inst layer0_N11_inst M1",-1,1,0);
	vcdp->declBus  (c+11,"logicnet layer0_inst layer0_N11_inst M1r",-1,1,0);
	vcdp->declBus  (c+60,"logicnet layer0_inst layer0_N12_inst M0",-1,7,0);
	vcdp->declBus  (c+12,"logicnet layer0_inst layer0_N12_inst M1",-1,1,0);
	vcdp->declBus  (c+12,"logicnet layer0_inst layer0_N12_inst M1r",-1,1,0);
	vcdp->declBus  (c+61,"logicnet layer0_inst layer0_N13_inst M0",-1,7,0);
	vcdp->declBus  (c+13,"logicnet layer0_inst layer0_N13_inst M1",-1,1,0);
	vcdp->declBus  (c+13,"logicnet layer0_inst layer0_N13_inst M1r",-1,1,0);
	vcdp->declBus  (c+62,"logicnet layer0_inst layer0_N14_inst M0",-1,7,0);
	vcdp->declBus  (c+14,"logicnet layer0_inst layer0_N14_inst M1",-1,1,0);
	vcdp->declBus  (c+14,"logicnet layer0_inst layer0_N14_inst M1r",-1,1,0);
	vcdp->declBus  (c+63,"logicnet layer0_inst layer0_N15_inst M0",-1,7,0);
	vcdp->declBus  (c+15,"logicnet layer0_inst layer0_N15_inst M1",-1,1,0);
	vcdp->declBus  (c+15,"logicnet layer0_inst layer0_N15_inst M1r",-1,1,0);
	vcdp->declBus  (c+64,"logicnet layer0_inst layer0_N16_inst M0",-1,7,0);
	vcdp->declBus  (c+16,"logicnet layer0_inst layer0_N16_inst M1",-1,1,0);
	vcdp->declBus  (c+16,"logicnet layer0_inst layer0_N16_inst M1r",-1,1,0);
	vcdp->declBus  (c+65,"logicnet layer0_inst layer0_N17_inst M0",-1,7,0);
	vcdp->declBus  (c+17,"logicnet layer0_inst layer0_N17_inst M1",-1,1,0);
	vcdp->declBus  (c+17,"logicnet layer0_inst layer0_N17_inst M1r",-1,1,0);
	vcdp->declBus  (c+66,"logicnet layer0_inst layer0_N18_inst M0",-1,7,0);
	vcdp->declBus  (c+18,"logicnet layer0_inst layer0_N18_inst M1",-1,1,0);
	vcdp->declBus  (c+18,"logicnet layer0_inst layer0_N18_inst M1r",-1,1,0);
	vcdp->declBus  (c+67,"logicnet layer0_inst layer0_N19_inst M0",-1,7,0);
	vcdp->declBus  (c+19,"logicnet layer0_inst layer0_N19_inst M1",-1,1,0);
	vcdp->declBus  (c+19,"logicnet layer0_inst layer0_N19_inst M1r",-1,1,0);
	vcdp->declBus  (c+68,"logicnet layer0_inst layer0_N20_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N20_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N20_inst M1r",-1,1,0);
	vcdp->declBus  (c+69,"logicnet layer0_inst layer0_N21_inst M0",-1,7,0);
	vcdp->declBus  (c+20,"logicnet layer0_inst layer0_N21_inst M1",-1,1,0);
	vcdp->declBus  (c+20,"logicnet layer0_inst layer0_N21_inst M1r",-1,1,0);
	vcdp->declBus  (c+70,"logicnet layer0_inst layer0_N22_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N22_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N22_inst M1r",-1,1,0);
	vcdp->declBus  (c+71,"logicnet layer0_inst layer0_N23_inst M0",-1,7,0);
	vcdp->declBus  (c+21,"logicnet layer0_inst layer0_N23_inst M1",-1,1,0);
	vcdp->declBus  (c+21,"logicnet layer0_inst layer0_N23_inst M1r",-1,1,0);
	vcdp->declBus  (c+72,"logicnet layer0_inst layer0_N24_inst M0",-1,7,0);
	vcdp->declBus  (c+22,"logicnet layer0_inst layer0_N24_inst M1",-1,1,0);
	vcdp->declBus  (c+22,"logicnet layer0_inst layer0_N24_inst M1r",-1,1,0);
	vcdp->declBus  (c+73,"logicnet layer0_inst layer0_N25_inst M0",-1,7,0);
	vcdp->declBus  (c+23,"logicnet layer0_inst layer0_N25_inst M1",-1,1,0);
	vcdp->declBus  (c+23,"logicnet layer0_inst layer0_N25_inst M1r",-1,1,0);
	vcdp->declBus  (c+74,"logicnet layer0_inst layer0_N26_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N26_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N26_inst M1r",-1,1,0);
	vcdp->declBus  (c+75,"logicnet layer0_inst layer0_N27_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N27_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N27_inst M1r",-1,1,0);
	vcdp->declBus  (c+76,"logicnet layer0_inst layer0_N28_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N28_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N28_inst M1r",-1,1,0);
	vcdp->declBus  (c+77,"logicnet layer0_inst layer0_N29_inst M0",-1,7,0);
	vcdp->declBus  (c+24,"logicnet layer0_inst layer0_N29_inst M1",-1,1,0);
	vcdp->declBus  (c+24,"logicnet layer0_inst layer0_N29_inst M1r",-1,1,0);
	vcdp->declBus  (c+78,"logicnet layer0_inst layer0_N30_inst M0",-1,7,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N30_inst M1",-1,1,0);
	vcdp->declBus  (c+104,"logicnet layer0_inst layer0_N30_inst M1r",-1,1,0);
	vcdp->declBus  (c+79,"logicnet layer0_inst layer0_N31_inst M0",-1,7,0);
	vcdp->declBus  (c+25,"logicnet layer0_inst layer0_N31_inst M1",-1,1,0);
	vcdp->declBus  (c+25,"logicnet layer0_inst layer0_N31_inst M1r",-1,1,0);
	vcdp->declBus  (c+105,"logicnet layer1_reg DataWidth",-1,31,0);
	vcdp->declQuad (c+1,"logicnet layer1_reg data_in",-1,63,0);
	vcdp->declBit  (c+100,"logicnet layer1_reg clk",-1);
	vcdp->declBit  (c+101,"logicnet layer1_reg rst",-1);
	vcdp->declQuad (c+46,"logicnet layer1_reg data_out",-1,63,0);
	vcdp->declQuad (c+46,"logicnet layer1_inst M0",-1,63,0);
	vcdp->declBus  (c+102,"logicnet layer1_inst M1",-1,31,0);
	vcdp->declBus  (c+80,"logicnet layer1_inst layer1_N0_wire",-1,7,0);
	vcdp->declBus  (c+81,"logicnet layer1_inst layer1_N1_wire",-1,7,0);
	vcdp->declBus  (c+82,"logicnet layer1_inst layer1_N2_wire",-1,7,0);
	vcdp->declBus  (c+83,"logicnet layer1_inst layer1_N3_wire",-1,7,0);
	vcdp->declBus  (c+84,"logicnet layer1_inst layer1_N4_wire",-1,7,0);
	vcdp->declBus  (c+85,"logicnet layer1_inst layer1_N5_wire",-1,7,0);
	vcdp->declBus  (c+86,"logicnet layer1_inst layer1_N6_wire",-1,7,0);
	vcdp->declBus  (c+87,"logicnet layer1_inst layer1_N7_wire",-1,7,0);
	vcdp->declBus  (c+88,"logicnet layer1_inst layer1_N8_wire",-1,7,0);
	vcdp->declBus  (c+89,"logicnet layer1_inst layer1_N9_wire",-1,7,0);
	vcdp->declBus  (c+90,"logicnet layer1_inst layer1_N10_wire",-1,7,0);
	vcdp->declBus  (c+91,"logicnet layer1_inst layer1_N11_wire",-1,7,0);
	vcdp->declBus  (c+92,"logicnet layer1_inst layer1_N12_wire",-1,7,0);
	vcdp->declBus  (c+93,"logicnet layer1_inst layer1_N13_wire",-1,7,0);
	vcdp->declBus  (c+94,"logicnet layer1_inst layer1_N14_wire",-1,7,0);
	vcdp->declBus  (c+95,"logicnet layer1_inst layer1_N15_wire",-1,7,0);
	vcdp->declBus  (c+80,"logicnet layer1_inst layer1_N0_inst M0",-1,7,0);
	vcdp->declBus  (c+26,"logicnet layer1_inst layer1_N0_inst M1",-1,1,0);
	vcdp->declBus  (c+26,"logicnet layer1_inst layer1_N0_inst M1r",-1,1,0);
	vcdp->declBus  (c+81,"logicnet layer1_inst layer1_N1_inst M0",-1,7,0);
	vcdp->declBus  (c+27,"logicnet layer1_inst layer1_N1_inst M1",-1,1,0);
	vcdp->declBus  (c+27,"logicnet layer1_inst layer1_N1_inst M1r",-1,1,0);
	vcdp->declBus  (c+82,"logicnet layer1_inst layer1_N2_inst M0",-1,7,0);
	vcdp->declBus  (c+28,"logicnet layer1_inst layer1_N2_inst M1",-1,1,0);
	vcdp->declBus  (c+28,"logicnet layer1_inst layer1_N2_inst M1r",-1,1,0);
	vcdp->declBus  (c+83,"logicnet layer1_inst layer1_N3_inst M0",-1,7,0);
	vcdp->declBus  (c+29,"logicnet layer1_inst layer1_N3_inst M1",-1,1,0);
	vcdp->declBus  (c+29,"logicnet layer1_inst layer1_N3_inst M1r",-1,1,0);
	vcdp->declBus  (c+84,"logicnet layer1_inst layer1_N4_inst M0",-1,7,0);
	vcdp->declBus  (c+30,"logicnet layer1_inst layer1_N4_inst M1",-1,1,0);
	vcdp->declBus  (c+30,"logicnet layer1_inst layer1_N4_inst M1r",-1,1,0);
	vcdp->declBus  (c+85,"logicnet layer1_inst layer1_N5_inst M0",-1,7,0);
	vcdp->declBus  (c+31,"logicnet layer1_inst layer1_N5_inst M1",-1,1,0);
	vcdp->declBus  (c+31,"logicnet layer1_inst layer1_N5_inst M1r",-1,1,0);
	vcdp->declBus  (c+86,"logicnet layer1_inst layer1_N6_inst M0",-1,7,0);
	vcdp->declBus  (c+32,"logicnet layer1_inst layer1_N6_inst M1",-1,1,0);
	vcdp->declBus  (c+32,"logicnet layer1_inst layer1_N6_inst M1r",-1,1,0);
	vcdp->declBus  (c+87,"logicnet layer1_inst layer1_N7_inst M0",-1,7,0);
	vcdp->declBus  (c+33,"logicnet layer1_inst layer1_N7_inst M1",-1,1,0);
	vcdp->declBus  (c+33,"logicnet layer1_inst layer1_N7_inst M1r",-1,1,0);
	vcdp->declBus  (c+88,"logicnet layer1_inst layer1_N8_inst M0",-1,7,0);
	vcdp->declBus  (c+34,"logicnet layer1_inst layer1_N8_inst M1",-1,1,0);
	vcdp->declBus  (c+34,"logicnet layer1_inst layer1_N8_inst M1r",-1,1,0);
	vcdp->declBus  (c+89,"logicnet layer1_inst layer1_N9_inst M0",-1,7,0);
	vcdp->declBus  (c+35,"logicnet layer1_inst layer1_N9_inst M1",-1,1,0);
	vcdp->declBus  (c+35,"logicnet layer1_inst layer1_N9_inst M1r",-1,1,0);
	vcdp->declBus  (c+90,"logicnet layer1_inst layer1_N10_inst M0",-1,7,0);
	vcdp->declBus  (c+36,"logicnet layer1_inst layer1_N10_inst M1",-1,1,0);
	vcdp->declBus  (c+36,"logicnet layer1_inst layer1_N10_inst M1r",-1,1,0);
	vcdp->declBus  (c+91,"logicnet layer1_inst layer1_N11_inst M0",-1,7,0);
	vcdp->declBus  (c+37,"logicnet layer1_inst layer1_N11_inst M1",-1,1,0);
	vcdp->declBus  (c+37,"logicnet layer1_inst layer1_N11_inst M1r",-1,1,0);
	vcdp->declBus  (c+92,"logicnet layer1_inst layer1_N12_inst M0",-1,7,0);
	vcdp->declBus  (c+38,"logicnet layer1_inst layer1_N12_inst M1",-1,1,0);
	vcdp->declBus  (c+38,"logicnet layer1_inst layer1_N12_inst M1r",-1,1,0);
	vcdp->declBus  (c+93,"logicnet layer1_inst layer1_N13_inst M0",-1,7,0);
	vcdp->declBus  (c+39,"logicnet layer1_inst layer1_N13_inst M1",-1,1,0);
	vcdp->declBus  (c+39,"logicnet layer1_inst layer1_N13_inst M1r",-1,1,0);
	vcdp->declBus  (c+94,"logicnet layer1_inst layer1_N14_inst M0",-1,7,0);
	vcdp->declBus  (c+40,"logicnet layer1_inst layer1_N14_inst M1",-1,1,0);
	vcdp->declBus  (c+40,"logicnet layer1_inst layer1_N14_inst M1r",-1,1,0);
	vcdp->declBus  (c+95,"logicnet layer1_inst layer1_N15_inst M0",-1,7,0);
	vcdp->declBus  (c+41,"logicnet layer1_inst layer1_N15_inst M1",-1,1,0);
	vcdp->declBus  (c+41,"logicnet layer1_inst layer1_N15_inst M1r",-1,1,0);
    }
}

void Vlogicnet::traceFullThis__1(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullQuad (c+1,(vlTOPp->logicnet__DOT__M1),64);
	vcdp->fullBus  (c+3,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r),2);
	vcdp->fullBus  (c+4,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N1_inst__DOT__M1r),2);
	vcdp->fullBus  (c+5,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N2_inst__DOT__M1r),2);
	vcdp->fullBus  (c+6,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N5_inst__DOT__M1r),2);
	vcdp->fullBus  (c+7,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r),2);
	vcdp->fullBus  (c+8,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r),2);
	vcdp->fullBus  (c+9,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N9_inst__DOT__M1r),2);
	vcdp->fullBus  (c+10,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r),2);
	vcdp->fullBus  (c+11,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r),2);
	vcdp->fullBus  (c+12,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r),2);
	vcdp->fullBus  (c+13,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r),2);
	vcdp->fullBus  (c+14,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r),2);
	vcdp->fullBus  (c+15,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r),2);
	vcdp->fullBus  (c+16,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N16_inst__DOT__M1r),2);
	vcdp->fullBus  (c+17,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r),2);
	vcdp->fullBus  (c+18,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r),2);
	vcdp->fullBus  (c+19,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r),2);
	vcdp->fullBus  (c+20,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r),2);
	vcdp->fullBus  (c+21,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N23_inst__DOT__M1r),2);
	vcdp->fullBus  (c+22,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N24_inst__DOT__M1r),2);
	vcdp->fullBus  (c+23,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r),2);
	vcdp->fullBus  (c+24,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N29_inst__DOT__M1r),2);
	vcdp->fullBus  (c+25,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r),2);
	vcdp->fullBus  (c+26,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r),2);
	vcdp->fullBus  (c+27,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r),2);
	vcdp->fullBus  (c+28,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r),2);
	vcdp->fullBus  (c+29,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r),2);
	vcdp->fullBus  (c+30,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r),2);
	vcdp->fullBus  (c+31,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r),2);
	vcdp->fullBus  (c+32,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r),2);
	vcdp->fullBus  (c+33,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r),2);
	vcdp->fullBus  (c+34,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r),2);
	vcdp->fullBus  (c+35,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r),2);
	vcdp->fullBus  (c+36,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r),2);
	vcdp->fullBus  (c+37,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r),2);
	vcdp->fullBus  (c+38,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r),2);
	vcdp->fullBus  (c+39,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r),2);
	vcdp->fullBus  (c+40,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r),2);
	vcdp->fullBus  (c+41,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r),2);
	vcdp->fullArray(c+42,(vlTOPp->logicnet__DOT__M0w),128);
	vcdp->fullQuad (c+46,(vlTOPp->logicnet__DOT__M1w),64);
	vcdp->fullBus  (c+48,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x12U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					    << 2U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       << 2U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x12U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
						  >> 0x12U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x14U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0xcU))))))))),8);
	vcdp->fullBus  (c+49,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 8U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					  << 2U)) | 
				((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   << 2U)) 
				 | (0xfU & vlTOPp->logicnet__DOT__M0w[0U]))))),8);
	vcdp->fullBus  (c+50,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 2U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					  >> 0xcU)) 
				| ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					     >> 0xcU)) 
				   | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					     >> 0x1cU)) 
				      | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						>> 0x1cU)) 
					 | (3U & ((
						   vlTOPp->logicnet__DOT__M0w[1U] 
						   << 2U) 
						  | (vlTOPp->logicnet__DOT__M0w[0U] 
						     >> 0x1eU))))))))),8);
	vcdp->fullBus  (c+51,(((0xc0U & vlTOPp->logicnet__DOT__M0w[3U]) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0xaU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0xaU)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 4U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 4U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x18U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 8U))))))))),8);
	vcdp->fullBus  (c+52,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x16U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x10U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x10U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 6U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 6U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 6U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x1aU))))))))),8);
	vcdp->fullBus  (c+53,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x12U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					    >> 0xeU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0xeU)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x1aU)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x1aU)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x16U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0xaU))))))))),8);
	vcdp->fullBus  (c+54,(((0xf0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 0xcU) 
					 | (0xff0U 
					    & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x14U)))) 
			       | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					 >> 0x16U)) 
				  | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x16U)) 
				     | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
					       << 0x18U) 
					      | (vlTOPp->logicnet__DOT__M0w[0U] 
						 >> 8U))))))),8);
	vcdp->fullBus  (c+55,(((0xc0U & vlTOPp->logicnet__DOT__M0w[3U]) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					    >> 0xaU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0xaU)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x18U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x18U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[2U] 
						<< 0x1aU) 
					       | (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 6U))))))))),8);
	vcdp->fullBus  (c+56,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x14U)) 
			       | ((0x20U & vlTOPp->logicnet__DOT__M0w[2U]) 
				  | ((0x10U & vlTOPp->logicnet__DOT__M0w[2U]) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x1cU)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x1cU)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[2U] 
						<< 0xeU) 
					       | (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x12U))))))))),8);
	vcdp->fullBus  (c+57,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 6U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					  << 2U)) | 
				((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					   << 2U)) 
				 | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 4U)) 
				    | ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      >> 4U)) 
				       | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
						 << 0xcU) 
						| (vlTOPp->logicnet__DOT__M0w[0U] 
						   >> 0x14U))))))))),8);
	vcdp->fullBus  (c+58,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x16U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					    >> 0xeU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       >> 0xeU)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       >> 0xeU)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[3U] 
						  >> 0xeU)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 2U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x1eU))))))))),8);
	vcdp->fullBus  (c+59,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 << 4U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					  >> 0xeU)) 
				| ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					     >> 0xeU)) 
				   | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					     >> 4U)) 
				      | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						>> 4U)) 
					 | (3U & ((
						   vlTOPp->logicnet__DOT__M0w[1U] 
						   << 0x12U) 
						  | (vlTOPp->logicnet__DOT__M0w[0U] 
						     >> 0xeU))))))))),8);
	vcdp->fullBus  (c+60,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x18U)) 
			       | ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
				  | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x18U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x18U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[2U] 
						<< 0x1aU) 
					       | (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 6U))))))))),8);
	vcdp->fullBus  (c+61,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 0x12U) 
					 | (0x3ffc0U 
					    & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0xeU)))) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x14U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x14U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x12U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x12U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 8U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x18U))))))))),8);
	vcdp->fullBus  (c+62,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 2U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					  >> 4U)) | 
				((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 4U)) 
				 | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   >> 0x10U)) 
				    | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x10U)) 
				       | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
						 << 0xaU) 
						| (vlTOPp->logicnet__DOT__M0w[0U] 
						   >> 0x16U))))))))),8);
	vcdp->fullBus  (c+63,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 6U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					  >> 0xaU)) 
				| ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					     >> 0xaU)) 
				   | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					     >> 0x1aU)) 
				      | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						>> 0x1aU)) 
					 | (3U & ((
						   vlTOPp->logicnet__DOT__M0w[1U] 
						   << 0xaU) 
						  | (vlTOPp->logicnet__DOT__M0w[0U] 
						     >> 0x16U))))))))),8);
	vcdp->fullBus  (c+64,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x14U)) 
			       | ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
				  | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x12U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x12U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x1aU) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 6U))))))))),8);
	vcdp->fullBus  (c+65,(((0xf0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x18U)) 
			       | ((8U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 6U)) | 
				  ((4U & (vlTOPp->logicnet__DOT__M0w[3U] 
					  >> 6U)) | 
				   (3U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					   << 8U) | 
					  (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 0x18U))))))),8);
	vcdp->fullBus  (c+66,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0xcU)) 
			       | ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
				  | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					       >> 0x10U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x10U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x16U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0xaU))))))))),8);
	vcdp->fullBus  (c+67,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 0xeU) 
					 | (0x3fc0U 
					    & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x12U)))) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x18U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x18U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					       >> 6U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 6U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x1eU) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 2U))))))))),8);
	vcdp->fullBus  (c+68,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0xaU)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x12U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x12U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x10U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x10U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[2U] 
						<< 0x1eU) 
					       | (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 2U))))))))),8);
	vcdp->fullBus  (c+69,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x18U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					    << 2U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       << 2U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       << 2U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
						  << 2U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x14U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0xcU))))))))),8);
	vcdp->fullBus  (c+70,(((0xf0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 << 2U)) | 
			       ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
				       >> 0x12U)) | 
				((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
					>> 0x12U)) 
				 | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
					   << 0x16U) 
					  | (vlTOPp->logicnet__DOT__M0w[0U] 
					     >> 0xaU))))))),8);
	vcdp->fullBus  (c+71,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 << 6U)) | 
			       ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					  >> 0x14U)) 
				| ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					     >> 0x14U)) 
				   | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					     >> 4U)) 
				      | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						>> 4U)) 
					 | (3U & ((
						   vlTOPp->logicnet__DOT__M0w[1U] 
						   << 0xeU) 
						  | (vlTOPp->logicnet__DOT__M0w[0U] 
						     >> 0x12U))))))))),8);
	vcdp->fullBus  (c+72,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x10U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					    >> 0xaU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       >> 0xaU)) 
				     | ((8U & vlTOPp->logicnet__DOT__M0w[2U]) 
					| ((4U & vlTOPp->logicnet__DOT__M0w[2U]) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 4U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x1cU))))))))),8);
	vcdp->fullBus  (c+73,(((0xf0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 8U) | 
					 (0xf0U & (
						   vlTOPp->logicnet__DOT__M0w[2U] 
						   >> 0x18U)))) 
			       | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					 >> 0xcU)) 
				  | ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
					    >> 0xcU)) 
				     | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
					       << 0x1eU) 
					      | (vlTOPp->logicnet__DOT__M0w[0U] 
						 >> 2U))))))),8);
	vcdp->fullBus  (c+74,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0xcU)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					    << 4U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       << 4U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 6U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 6U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x14U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0xcU))))))))),8);
	vcdp->fullBus  (c+75,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 0x1eU) 
					 | (0x3fffffc0U 
					    & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 2U)))) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x14U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x14U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					       >> 0x1cU)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x1cU)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0x1eU) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 2U))))))))),8);
	vcdp->fullBus  (c+76,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[2U] 
					  << 8U) | 
					 (0xc0U & (
						   vlTOPp->logicnet__DOT__M0w[1U] 
						   >> 0x18U)))) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    << 2U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       << 2U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       << 2U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  << 2U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 4U) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x1cU))))))))),8);
	vcdp->fullBus  (c+77,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					  << 0xcU) 
					 | (0xfc0U 
					    & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x14U)))) 
			       | ((0x20U & vlTOPp->logicnet__DOT__M0w[2U]) 
				  | ((0x10U & vlTOPp->logicnet__DOT__M0w[2U]) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 6U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 6U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[1U] 
						<< 0xeU) 
					       | (vlTOPp->logicnet__DOT__M0w[0U] 
						  >> 0x12U))))))))),8);
	vcdp->fullBus  (c+78,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0x18U)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					    >> 0x1aU)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x1aU)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x14U)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 0x14U)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[2U] 
						<< 0x1eU) 
					       | (vlTOPp->logicnet__DOT__M0w[1U] 
						  >> 2U))))))))),8);
	vcdp->fullBus  (c+79,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 0xaU)) 
			       | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					    >> 6U)) 
				  | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					       >> 6U)) 
				     | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					       >> 0x1aU)) 
					| ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
						  >> 0x1aU)) 
					   | (3U & 
					      ((vlTOPp->logicnet__DOT__M0w[3U] 
						<< 0x10U) 
					       | (vlTOPp->logicnet__DOT__M0w[2U] 
						  >> 0x10U))))))))),8);
	vcdp->fullBus  (c+80,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x3cU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x39U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x38U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x25U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x24U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 8U))))))))),8);
	vcdp->fullBus  (c+81,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x32U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x27U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x26U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x19U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x18U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 8U))))))))),8);
	vcdp->fullBus  (c+82,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x1cU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x17U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x16U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x15U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x14U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0xeU))))))))),8);
	vcdp->fullBus  (c+83,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x28U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x1dU)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x1cU)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 7U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 6U)) 
					      << 2U)) 
				       | (3U & (IData)(vlTOPp->logicnet__DOT__M1w)))))))),8);
	vcdp->fullBus  (c+84,(((0xf0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x32U)) 
					 << 4U)) | 
			       ((8U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						>> 0x29U)) 
				       << 3U)) | ((4U 
						   & ((IData)(
							      (vlTOPp->logicnet__DOT__M1w 
							       >> 0x28U)) 
						      << 2U)) 
						  | (3U 
						     & (IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 8U))))))),8);
	vcdp->fullBus  (c+85,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x3aU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x23U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x22U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x1dU)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x1cU)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0xaU))))))))),8);
	vcdp->fullBus  (c+86,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x2aU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x19U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x18U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x11U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x10U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 6U))))))))),8);
	vcdp->fullBus  (c+87,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x3eU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x31U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x30U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x2dU)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x2cU)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0x24U))))))))),8);
	vcdp->fullBus  (c+88,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x3eU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x2dU)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x2cU)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x29U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x28U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0x1aU))))))))),8);
	vcdp->fullBus  (c+89,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x32U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x29U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x28U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x17U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x16U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 8U))))))))),8);
	vcdp->fullBus  (c+90,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x28U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x1fU)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x1eU)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x19U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x18U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 8U))))))))),8);
	vcdp->fullBus  (c+91,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x30U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x29U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x28U)) 
					   << 4U)) 
				 | (0xfU & (IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x16U))))))),8);
	vcdp->fullBus  (c+92,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x34U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x2bU)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x2aU)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x1dU)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x1cU)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0xaU))))))))),8);
	vcdp->fullBus  (c+93,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x3eU)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x35U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x34U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x25U)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x24U)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 0x14U))))))))),8);
	vcdp->fullBus  (c+94,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x30U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x13U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x12U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0xbU)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0xaU)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 4U))))))))),8);
	vcdp->fullBus  (c+95,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						  >> 0x38U)) 
					 << 6U)) | 
			       ((0x20U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						   >> 0x27U)) 
					  << 5U)) | 
				((0x10U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x26U)) 
					   << 4U)) 
				 | ((8U & ((IData)(
						   (vlTOPp->logicnet__DOT__M1w 
						    >> 0x1dU)) 
					   << 3U)) 
				    | ((4U & ((IData)(
						      (vlTOPp->logicnet__DOT__M1w 
						       >> 0x1cU)) 
					      << 2U)) 
				       | (3U & (IData)(
						       (vlTOPp->logicnet__DOT__M1w 
							>> 2U))))))))),8);
	vcdp->fullArray(c+96,(vlTOPp->M0),128);
	vcdp->fullBit  (c+100,(vlTOPp->clk));
	vcdp->fullBit  (c+101,(vlTOPp->rst));
	vcdp->fullBus  (c+102,(vlTOPp->M2),32);
	vcdp->fullBus  (c+103,(0x80U),32);
	vcdp->fullBus  (c+104,(0U),2);
	vcdp->fullBus  (c+105,(0x40U),32);
    }
}
