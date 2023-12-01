// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vlogicnet__Syms.h"


//======================

void Vlogicnet::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vlogicnet* t=(Vlogicnet*)userthis;
    Vlogicnet__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis (vlSymsp, vcdp, code);
    }
}

//======================


void Vlogicnet::traceChgThis(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 1U))))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vlogicnet::traceChgThis__2(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgQuad (c+1,(vlTOPp->logicnet__DOT__M1),64);
	vcdp->chgBus  (c+3,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r),2);
	vcdp->chgBus  (c+4,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N1_inst__DOT__M1r),2);
	vcdp->chgBus  (c+5,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N2_inst__DOT__M1r),2);
	vcdp->chgBus  (c+6,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N5_inst__DOT__M1r),2);
	vcdp->chgBus  (c+7,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r),2);
	vcdp->chgBus  (c+8,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r),2);
	vcdp->chgBus  (c+9,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N9_inst__DOT__M1r),2);
	vcdp->chgBus  (c+10,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r),2);
	vcdp->chgBus  (c+11,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r),2);
	vcdp->chgBus  (c+12,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r),2);
	vcdp->chgBus  (c+13,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r),2);
	vcdp->chgBus  (c+14,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r),2);
	vcdp->chgBus  (c+15,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r),2);
	vcdp->chgBus  (c+16,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N16_inst__DOT__M1r),2);
	vcdp->chgBus  (c+17,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r),2);
	vcdp->chgBus  (c+18,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r),2);
	vcdp->chgBus  (c+19,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r),2);
	vcdp->chgBus  (c+20,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r),2);
	vcdp->chgBus  (c+21,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N23_inst__DOT__M1r),2);
	vcdp->chgBus  (c+22,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N24_inst__DOT__M1r),2);
	vcdp->chgBus  (c+23,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r),2);
	vcdp->chgBus  (c+24,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N29_inst__DOT__M1r),2);
	vcdp->chgBus  (c+25,(vlTOPp->logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r),2);
	vcdp->chgBus  (c+26,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r),2);
	vcdp->chgBus  (c+27,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r),2);
	vcdp->chgBus  (c+28,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r),2);
	vcdp->chgBus  (c+29,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r),2);
	vcdp->chgBus  (c+30,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r),2);
	vcdp->chgBus  (c+31,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r),2);
	vcdp->chgBus  (c+32,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r),2);
	vcdp->chgBus  (c+33,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r),2);
	vcdp->chgBus  (c+34,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r),2);
	vcdp->chgBus  (c+35,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r),2);
	vcdp->chgBus  (c+36,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r),2);
	vcdp->chgBus  (c+37,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r),2);
	vcdp->chgBus  (c+38,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r),2);
	vcdp->chgBus  (c+39,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r),2);
	vcdp->chgBus  (c+40,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r),2);
	vcdp->chgBus  (c+41,(vlTOPp->logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r),2);
    }
}

void Vlogicnet::traceChgThis__3(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgArray(c+42,(vlTOPp->logicnet__DOT__M0w),128);
	vcdp->chgQuad (c+46,(vlTOPp->logicnet__DOT__M1w),64);
	vcdp->chgBus  (c+48,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x12U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					   << 2U)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					      << 2U)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      >> 0x12U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
						 >> 0x12U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x14U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0xcU))))))))),8);
	vcdp->chgBus  (c+49,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 8U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[1U] 
						       << 2U)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[1U] 
							  << 2U)) 
						      | (0xfU 
							 & vlTOPp->logicnet__DOT__M0w[0U]))))),8);
	vcdp->chgBus  (c+50,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 2U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[2U] 
						       >> 0xcU)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[2U] 
							  >> 0xcU)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[1U] 
							     >> 0x1cU)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[1U] 
								>> 0x1cU)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 2U) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0x1eU))))))))),8);
	vcdp->chgBus  (c+51,(((0xc0U & vlTOPp->logicnet__DOT__M0w[3U]) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   >> 0xaU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0xaU)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 4U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 4U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x18U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 8U))))))))),8);
	vcdp->chgBus  (c+52,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x16U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   >> 0x10U)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x10U)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 6U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 6U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 6U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x1aU))))))))),8);
	vcdp->chgBus  (c+53,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x12U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 0xeU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      >> 0xeU)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x1aU)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x1aU)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x16U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0xaU))))))))),8);
	vcdp->chgBus  (c+54,(((0xf0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					 << 0xcU) | 
					(0xff0U & (
						   vlTOPp->logicnet__DOT__M0w[2U] 
						   >> 0x14U)))) 
			      | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					>> 0x16U)) 
				 | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   >> 0x16U)) 
				    | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
					      << 0x18U) 
					     | (vlTOPp->logicnet__DOT__M0w[0U] 
						>> 8U))))))),8);
	vcdp->chgBus  (c+55,(((0xc0U & vlTOPp->logicnet__DOT__M0w[3U]) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 0xaU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      >> 0xaU)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x18U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x18U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[2U] 
						    << 0x1aU) 
						   | (vlTOPp->logicnet__DOT__M0w[1U] 
						      >> 6U))))))))),8);
	vcdp->chgBus  (c+56,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x14U)) 
			      | ((0x20U & vlTOPp->logicnet__DOT__M0w[2U]) 
				 | ((0x10U & vlTOPp->logicnet__DOT__M0w[2U]) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x1cU)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x1cU)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[2U] 
						    << 0xeU) 
						   | (vlTOPp->logicnet__DOT__M0w[1U] 
						      >> 0x12U))))))))),8);
	vcdp->chgBus  (c+57,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 6U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[3U] 
						       << 2U)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[3U] 
							  << 2U)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[2U] 
							     >> 4U)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[2U] 
								>> 4U)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 0xcU) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0x14U))))))))),8);
	vcdp->chgBus  (c+58,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x16U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					   >> 0xeU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					      >> 0xeU)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[3U] 
					      >> 0xeU)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[3U] 
						 >> 0xeU)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 2U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x1eU))))))))),8);
	vcdp->chgBus  (c+59,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					<< 4U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[1U] 
						       >> 0xeU)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[1U] 
							  >> 0xeU)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[1U] 
							     >> 4U)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[1U] 
								>> 4U)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 0x12U) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0xeU))))))))),8);
	vcdp->chgBus  (c+60,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x18U)) 
			      | ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
				 | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x18U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x18U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[2U] 
						    << 0x1aU) 
						   | (vlTOPp->logicnet__DOT__M0w[1U] 
						      >> 6U))))))))),8);
	vcdp->chgBus  (c+61,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
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
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 8U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x18U))))))))),8);
	vcdp->chgBus  (c+62,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 2U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[2U] 
						       >> 4U)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[2U] 
							  >> 4U)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[1U] 
							     >> 0x10U)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[1U] 
								>> 0x10U)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 0xaU) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0x16U))))))))),8);
	vcdp->chgBus  (c+63,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 6U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[2U] 
						       >> 0xaU)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[2U] 
							  >> 0xaU)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[1U] 
							     >> 0x1aU)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[1U] 
								>> 0x1aU)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 0xaU) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0x16U))))))))),8);
	vcdp->chgBus  (c+64,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x14U)) 
			      | ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
				 | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x12U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x12U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x1aU) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 6U))))))))),8);
	vcdp->chgBus  (c+65,(((0xf0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x18U)) 
			      | ((8U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 6U)) | (
						   (4U 
						    & (vlTOPp->logicnet__DOT__M0w[3U] 
						       >> 6U)) 
						   | (3U 
						      & ((vlTOPp->logicnet__DOT__M0w[3U] 
							  << 8U) 
							 | (vlTOPp->logicnet__DOT__M0w[2U] 
							    >> 0x18U))))))),8);
	vcdp->chgBus  (c+66,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0xcU)) | 
			      ((0x20U & vlTOPp->logicnet__DOT__M0w[3U]) 
			       | ((0x10U & vlTOPp->logicnet__DOT__M0w[3U]) 
				  | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					    >> 0x10U)) 
				     | ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
					       >> 0x10U)) 
					| (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
						  << 0x16U) 
						 | (vlTOPp->logicnet__DOT__M0w[0U] 
						    >> 0xaU))))))))),8);
	vcdp->chgBus  (c+67,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					 << 0xeU) | 
					(0x3fc0U & 
					 (vlTOPp->logicnet__DOT__M0w[2U] 
					  >> 0x12U)))) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   >> 0x18U)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x18U)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					      >> 6U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
						 >> 6U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x1eU) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 2U))))))))),8);
	vcdp->chgBus  (c+68,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0xaU)) | 
			      ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					 >> 0x12U)) 
			       | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x12U)) 
				  | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					    >> 0x10U)) 
				     | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
					       >> 0x10U)) 
					| (3U & ((vlTOPp->logicnet__DOT__M0w[2U] 
						  << 0x1eU) 
						 | (vlTOPp->logicnet__DOT__M0w[1U] 
						    >> 2U))))))))),8);
	vcdp->chgBus  (c+69,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x18U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					   << 2U)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					      << 2U)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      << 2U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
						 << 2U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x14U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0xcU))))))))),8);
	vcdp->chgBus  (c+70,(((0xf0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					<< 2U)) | (
						   (8U 
						    & (vlTOPp->logicnet__DOT__M0w[0U] 
						       >> 0x12U)) 
						   | ((4U 
						       & (vlTOPp->logicnet__DOT__M0w[0U] 
							  >> 0x12U)) 
						      | (3U 
							 & ((vlTOPp->logicnet__DOT__M0w[1U] 
							     << 0x16U) 
							    | (vlTOPp->logicnet__DOT__M0w[0U] 
							       >> 0xaU))))))),8);
	vcdp->chgBus  (c+71,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					<< 6U)) | (
						   (0x20U 
						    & (vlTOPp->logicnet__DOT__M0w[2U] 
						       >> 0x14U)) 
						   | ((0x10U 
						       & (vlTOPp->logicnet__DOT__M0w[2U] 
							  >> 0x14U)) 
						      | ((8U 
							  & (vlTOPp->logicnet__DOT__M0w[1U] 
							     >> 4U)) 
							 | ((4U 
							     & (vlTOPp->logicnet__DOT__M0w[1U] 
								>> 4U)) 
							    | (3U 
							       & ((vlTOPp->logicnet__DOT__M0w[1U] 
								   << 0xeU) 
								  | (vlTOPp->logicnet__DOT__M0w[0U] 
								     >> 0x12U))))))))),8);
	vcdp->chgBus  (c+72,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x10U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					   >> 0xaU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					      >> 0xaU)) 
				    | ((8U & vlTOPp->logicnet__DOT__M0w[2U]) 
				       | ((4U & vlTOPp->logicnet__DOT__M0w[2U]) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 4U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x1cU))))))))),8);
	vcdp->chgBus  (c+73,(((0xf0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					 << 8U) | (0xf0U 
						   & (vlTOPp->logicnet__DOT__M0w[2U] 
						      >> 0x18U)))) 
			      | ((8U & (vlTOPp->logicnet__DOT__M0w[0U] 
					>> 0xcU)) | 
				 ((4U & (vlTOPp->logicnet__DOT__M0w[0U] 
					 >> 0xcU)) 
				  | (3U & ((vlTOPp->logicnet__DOT__M0w[1U] 
					    << 0x1eU) 
					   | (vlTOPp->logicnet__DOT__M0w[0U] 
					      >> 2U))))))),8);
	vcdp->chgBus  (c+74,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0xcU)) | 
			      ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					 << 4U)) | 
			       ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					  << 4U)) | 
				((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					>> 6U)) | (
						   (4U 
						    & (vlTOPp->logicnet__DOT__M0w[1U] 
						       >> 6U)) 
						   | (3U 
						      & ((vlTOPp->logicnet__DOT__M0w[1U] 
							  << 0x14U) 
							 | (vlTOPp->logicnet__DOT__M0w[0U] 
							    >> 0xcU))))))))),8);
	vcdp->chgBus  (c+75,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
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
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0x1eU) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 2U))))))))),8);
	vcdp->chgBus  (c+76,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[2U] 
					 << 8U) | (0xc0U 
						   & (vlTOPp->logicnet__DOT__M0w[1U] 
						      >> 0x18U)))) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[1U] 
					   << 2U)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      << 2U)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      << 2U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 << 2U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 4U) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x1cU))))))))),8);
	vcdp->chgBus  (c+77,(((0xc0U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					 << 0xcU) | 
					(0xfc0U & (
						   vlTOPp->logicnet__DOT__M0w[2U] 
						   >> 0x14U)))) 
			      | ((0x20U & vlTOPp->logicnet__DOT__M0w[2U]) 
				 | ((0x10U & vlTOPp->logicnet__DOT__M0w[2U]) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 6U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 6U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[1U] 
						    << 0xeU) 
						   | (vlTOPp->logicnet__DOT__M0w[0U] 
						      >> 0x12U))))))))),8);
	vcdp->chgBus  (c+78,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0x18U)) 
			      | ((0x20U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 0x1aU)) 
				 | ((0x10U & (vlTOPp->logicnet__DOT__M0w[2U] 
					      >> 0x1aU)) 
				    | ((8U & (vlTOPp->logicnet__DOT__M0w[1U] 
					      >> 0x14U)) 
				       | ((4U & (vlTOPp->logicnet__DOT__M0w[1U] 
						 >> 0x14U)) 
					  | (3U & (
						   (vlTOPp->logicnet__DOT__M0w[2U] 
						    << 0x1eU) 
						   | (vlTOPp->logicnet__DOT__M0w[1U] 
						      >> 2U))))))))),8);
	vcdp->chgBus  (c+79,(((0xc0U & (vlTOPp->logicnet__DOT__M0w[3U] 
					>> 0xaU)) | 
			      ((0x20U & (vlTOPp->logicnet__DOT__M0w[3U] 
					 >> 6U)) | 
			       ((0x10U & (vlTOPp->logicnet__DOT__M0w[3U] 
					  >> 6U)) | 
				((8U & (vlTOPp->logicnet__DOT__M0w[2U] 
					>> 0x1aU)) 
				 | ((4U & (vlTOPp->logicnet__DOT__M0w[2U] 
					   >> 0x1aU)) 
				    | (3U & ((vlTOPp->logicnet__DOT__M0w[3U] 
					      << 0x10U) 
					     | (vlTOPp->logicnet__DOT__M0w[2U] 
						>> 0x10U))))))))),8);
	vcdp->chgBus  (c+80,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x3cU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x39U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x38U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x25U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x24U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 8U))))))))),8);
	vcdp->chgBus  (c+81,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x32U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x27U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x26U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x19U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x18U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 8U))))))))),8);
	vcdp->chgBus  (c+82,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x1cU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x17U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x16U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x15U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x14U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0xeU))))))))),8);
	vcdp->chgBus  (c+83,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x28U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x1dU)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x1cU)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 7U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 6U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(vlTOPp->logicnet__DOT__M1w)))))))),8);
	vcdp->chgBus  (c+84,(((0xf0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x32U)) 
					<< 4U)) | (
						   (8U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x29U)) 
						       << 3U)) 
						   | ((4U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x28U)) 
							  << 2U)) 
						      | (3U 
							 & (IData)(
								   (vlTOPp->logicnet__DOT__M1w 
								    >> 8U))))))),8);
	vcdp->chgBus  (c+85,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x3aU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x23U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x22U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x1dU)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x1cU)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0xaU))))))))),8);
	vcdp->chgBus  (c+86,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x2aU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x19U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x18U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x11U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x10U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 6U))))))))),8);
	vcdp->chgBus  (c+87,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x3eU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x31U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x30U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x2dU)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x2cU)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0x24U))))))))),8);
	vcdp->chgBus  (c+88,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x3eU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x2dU)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x2cU)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x29U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x28U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0x1aU))))))))),8);
	vcdp->chgBus  (c+89,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x32U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x29U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x28U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x17U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x16U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 8U))))))))),8);
	vcdp->chgBus  (c+90,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x28U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x1fU)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x1eU)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x19U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x18U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 8U))))))))),8);
	vcdp->chgBus  (c+91,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x30U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x29U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x28U)) 
							  << 4U)) 
						      | (0xfU 
							 & (IData)(
								   (vlTOPp->logicnet__DOT__M1w 
								    >> 0x16U))))))),8);
	vcdp->chgBus  (c+92,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x34U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x2bU)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x2aU)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x1dU)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x1cU)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0xaU))))))))),8);
	vcdp->chgBus  (c+93,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x3eU)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x35U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x34U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x25U)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x24U)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 0x14U))))))))),8);
	vcdp->chgBus  (c+94,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x30U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x13U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x12U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0xbU)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0xaU)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 4U))))))))),8);
	vcdp->chgBus  (c+95,(((0xc0U & ((IData)((vlTOPp->logicnet__DOT__M1w 
						 >> 0x38U)) 
					<< 6U)) | (
						   (0x20U 
						    & ((IData)(
							       (vlTOPp->logicnet__DOT__M1w 
								>> 0x27U)) 
						       << 5U)) 
						   | ((0x10U 
						       & ((IData)(
								  (vlTOPp->logicnet__DOT__M1w 
								   >> 0x26U)) 
							  << 4U)) 
						      | ((8U 
							  & ((IData)(
								     (vlTOPp->logicnet__DOT__M1w 
								      >> 0x1dU)) 
							     << 3U)) 
							 | ((4U 
							     & ((IData)(
									(vlTOPp->logicnet__DOT__M1w 
									 >> 0x1cU)) 
								<< 2U)) 
							    | (3U 
							       & (IData)(
									 (vlTOPp->logicnet__DOT__M1w 
									  >> 2U))))))))),8);
    }
}

void Vlogicnet::traceChgThis__4(Vlogicnet__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vlogicnet* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgArray(c+96,(vlTOPp->M0),128);
	vcdp->chgBit  (c+100,(vlTOPp->clk));
	vcdp->chgBit  (c+101,(vlTOPp->rst));
	vcdp->chgBus  (c+102,(vlTOPp->M2),32);
    }
}
