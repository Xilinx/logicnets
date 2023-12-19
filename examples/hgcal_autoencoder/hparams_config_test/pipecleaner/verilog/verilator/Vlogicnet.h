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
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N2_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N3_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N4_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N5_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N9_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N16_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N20_inst__DOT__M1r,1,0);
    VL_SIG8(logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r,1,0);
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
    VL_SIG64(logicnet__DOT__M1,63,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    static VL_ST_SIG8(__Vtable1_logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable2_logicnet__DOT__layer0_inst__DOT__layer0_N1_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable3_logicnet__DOT__layer0_inst__DOT__layer0_N2_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable4_logicnet__DOT__layer0_inst__DOT__layer0_N3_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable5_logicnet__DOT__layer0_inst__DOT__layer0_N4_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable6_logicnet__DOT__layer0_inst__DOT__layer0_N5_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable7_logicnet__DOT__layer0_inst__DOT__layer0_N6_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable8_logicnet__DOT__layer0_inst__DOT__layer0_N7_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable9_logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable10_logicnet__DOT__layer0_inst__DOT__layer0_N9_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable11_logicnet__DOT__layer0_inst__DOT__layer0_N10_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable12_logicnet__DOT__layer0_inst__DOT__layer0_N11_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable13_logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable14_logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable15_logicnet__DOT__layer0_inst__DOT__layer0_N14_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable16_logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable17_logicnet__DOT__layer0_inst__DOT__layer0_N16_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable18_logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable19_logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable20_logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable21_logicnet__DOT__layer0_inst__DOT__layer0_N20_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable22_logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable23_logicnet__DOT__layer0_inst__DOT__layer0_N22_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable24_logicnet__DOT__layer0_inst__DOT__layer0_N23_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable25_logicnet__DOT__layer0_inst__DOT__layer0_N24_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable26_logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable27_logicnet__DOT__layer0_inst__DOT__layer0_N26_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable28_logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable29_logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable30_logicnet__DOT__layer0_inst__DOT__layer0_N29_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable31_logicnet__DOT__layer0_inst__DOT__layer0_N30_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable32_logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable33_logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable34_logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable35_logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable36_logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable37_logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable38_logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable39_logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable40_logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable41_logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable42_logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable43_logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable44_logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable45_logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable46_logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable47_logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r[256],1,0);
    static VL_ST_SIG8(__Vtable48_logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r[256],1,0);
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
    static void _combo__TOP__1(Vlogicnet__Syms* __restrict vlSymsp);
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
