/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_3(char*, char *);
extern void execute_227(char*, char *);
extern void execute_228(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_236(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_215(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_218(char*, char *);
extern void execute_219(char*, char *);
extern void execute_220(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_214(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_185(char*, char *);
extern void execute_194(char*, char *);
extern void execute_195(char*, char *);
extern void execute_196(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_200(char*, char *);
extern void execute_205(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_209(char*, char *);
extern void execute_8(char*, char *);
extern void execute_41(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_171(char*, char *);
extern void execute_172(char*, char *);
extern void execute_173(char*, char *);
extern void execute_174(char*, char *);
extern void execute_175(char*, char *);
extern void execute_176(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_116(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_123(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_128(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_132(char*, char *);
extern void execute_133(char*, char *);
extern void execute_134(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_139(char*, char *);
extern void execute_140(char*, char *);
extern void execute_141(char*, char *);
extern void execute_142(char*, char *);
extern void execute_143(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_152(char*, char *);
extern void execute_47(char*, char *);
extern void execute_221(char*, char *);
extern void execute_222(char*, char *);
extern void execute_223(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_243(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[135] = {(funcp)execute_48, (funcp)execute_49, (funcp)execute_241, (funcp)execute_242, (funcp)execute_3, (funcp)execute_227, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_44, (funcp)execute_45, (funcp)execute_215, (funcp)execute_216, (funcp)execute_217, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)execute_42, (funcp)execute_43, (funcp)execute_214, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_185, (funcp)execute_194, (funcp)execute_195, (funcp)execute_196, (funcp)execute_197, (funcp)execute_198, (funcp)execute_200, (funcp)execute_205, (funcp)execute_206, (funcp)execute_207, (funcp)execute_208, (funcp)execute_209, (funcp)execute_8, (funcp)execute_41, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_144, (funcp)execute_145, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_171, (funcp)execute_172, (funcp)execute_173, (funcp)execute_174, (funcp)execute_175, (funcp)execute_176, (funcp)execute_177, (funcp)execute_178, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_110, (funcp)execute_111, (funcp)execute_112, (funcp)execute_116, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_128, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_133, (funcp)execute_134, (funcp)execute_135, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_142, (funcp)execute_143, (funcp)execute_21, (funcp)execute_22, (funcp)execute_23, (funcp)execute_24, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_31, (funcp)execute_32, (funcp)execute_37, (funcp)execute_38, (funcp)execute_39, (funcp)execute_40, (funcp)execute_152, (funcp)execute_47, (funcp)execute_221, (funcp)execute_222, (funcp)execute_223, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_243, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 135;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_clk_behav/xsim.reloc",  (void **)funcTab, 135);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_clk_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_clk_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_clk_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_clk_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_clk_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
