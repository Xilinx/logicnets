#include <cstddef>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vlogicnet.h"
    
// pyverilator defined values
// first declare variables as extern
extern const char* _pyverilator_module_name;
extern const uint32_t _pyverilator_num_inputs;
extern const char* _pyverilator_inputs[];
extern const uint32_t _pyverilator_input_widths[];
extern const uint32_t _pyverilator_num_outputs;
extern const char* _pyverilator_outputs[];
extern const uint32_t _pyverilator_output_widths[];
extern const uint32_t _pyverilator_num_internal_signals;
extern const char* _pyverilator_internal_signals[];
extern const uint32_t _pyverilator_internal_signal_widths[];
extern const uint32_t _pyverilator_num_rules;
extern const char* _pyverilator_rules[];
extern const char* _pyverilator_json_data;
// now initialize the variables
const char* _pyverilator_module_name = "logicnet";
const uint32_t _pyverilator_num_inputs = 3;
const char* _pyverilator_inputs[] = {"clk","rst","M0"};
const uint32_t _pyverilator_input_widths[] = {1,1,128};

const uint32_t _pyverilator_num_outputs = 1;
const char* _pyverilator_outputs[] = {"M2"};
const uint32_t _pyverilator_output_widths[] = {32};

const uint32_t _pyverilator_num_internal_signals = 64;
const char* _pyverilator_internal_signals[] = {"logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N32_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N36_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N37_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N38_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N39_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N40_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N45_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N47_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N48_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N50_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N54_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N55_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N57_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N61_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N67_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N68_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N70_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N72_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N78_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N81_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N85_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N87_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N91_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N93_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N97_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N98_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N104_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N108_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N111_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N112_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N113_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N118_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N124_inst__DOT__M1r","logicnet__DOT__layer0_inst__DOT__layer0_N127_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r","logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r","logicnet__DOT__M1"};
const uint32_t _pyverilator_internal_signal_widths[] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,256};

const char* _pyverilator_json_data = "null";

// this is required by verilator for verilog designs using $time
// main_time is incremented in eval
double main_time = 0;

// What to call when $finish is called
typedef void (*vl_finish_callback)(const char* filename, int line, const char* hier);
vl_finish_callback vl_user_finish = NULL;
    
double sc_time_stamp() {
return main_time;
}
void vl_finish (const char* filename, int linenum, const char* hier) VL_MT_UNSAFE {
    if (vl_user_finish) {
       (*vl_user_finish)(filename, linenum, hier);
    } else {
        // Default implementation
        VL_PRINTF("- %s:%d: Verilog $finish\n", filename, linenum);  // Not VL_PRINTF_MT, already on main thread
        if (Verilated::gotFinish()) {
            VL_PRINTF("- %s:%d: Second verilog $finish, exiting\n", filename, linenum);  // Not VL_PRINTF_MT, already on main thread
            Verilated::flushCall();
            exit(0);
        }
        Verilated::gotFinish(true);
    }
}
// function definitions
// helper functions for basic verilator tasks
extern "C" { //Open an extern C closed in the footer
Vlogicnet* construct() {
    Verilated::traceEverOn(true);
    Vlogicnet* top = new Vlogicnet();
    return top;
}
int eval(Vlogicnet* top) {
    top->eval();
    main_time++;
    return 0;
}
int destruct(Vlogicnet* top) {
    if (top != nullptr) {
        delete top;
        top = nullptr;
    }
    return 0;
}
VerilatedVcdC* start_vcd_trace(Vlogicnet* top, const char* filename) {
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open(filename);
    return tfp;
}
int add_to_vcd_trace(VerilatedVcdC* tfp, int time) {
    tfp->dump(time);
    return 0;
}
int flush_vcd_trace(VerilatedVcdC* tfp) {
    tfp->flush();
    return 0;
}
int stop_vcd_trace(VerilatedVcdC* tfp) {
    tfp->close();
    return 0;
}
bool get_finished() {
    return Verilated::gotFinish();
}
void set_finished(bool b) {
    Verilated::gotFinish(b);
}
void set_vl_finish_callback(vl_finish_callback callback) {
    vl_user_finish = callback;
}
void set_command_args(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
}

uint32_t get_M2(Vlogicnet* top){return top->M2;}
uint32_t get_clk(Vlogicnet* top){return top->clk;}
uint32_t get_rst(Vlogicnet* top){return top->rst;}
uint32_t get_M0(Vlogicnet* top, int word){ return top->M0[word];}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N0_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N8_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N12_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N13_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N15_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N17_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N18_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N19_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N21_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N25_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N27_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N28_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N31_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N32_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N32_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N36_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N36_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N37_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N37_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N38_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N38_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N39_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N39_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N40_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N40_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N45_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N45_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N47_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N47_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N48_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N48_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N50_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N50_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N54_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N54_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N55_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N55_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N57_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N57_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N61_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N61_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N67_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N67_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N68_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N68_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N70_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N70_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N72_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N72_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N78_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N78_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N81_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N81_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N85_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N85_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N87_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N87_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N91_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N91_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N93_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N93_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N97_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N97_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N98_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N98_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N104_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N104_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N108_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N108_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N111_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N111_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N112_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N112_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N113_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N113_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N118_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N118_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N124_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N124_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer0_inst__DOT__layer0_N127_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer0_inst__DOT__layer0_N127_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N0_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N1_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N2_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N3_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N4_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N5_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N6_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N7_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N8_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N9_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N10_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N11_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N12_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N13_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N14_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r(Vlogicnet* top){return top->logicnet__DOT__layer1_inst__DOT__layer1_N15_inst__DOT__M1r;}
uint32_t get_logicnet__DOT__M1(Vlogicnet* top, int word){ return top->logicnet__DOT__M1[word];}
int set_clk(Vlogicnet* top, uint32_t new_value){ top->clk = new_value; return 0;}
int set_rst(Vlogicnet* top, uint32_t new_value){ top->rst = new_value; return 0;}
int set_M0(Vlogicnet* top, int word, uint64_t new_value){ top->M0[word] = new_value; return 0;}
}