/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "G:/Dzis/Lab_406AD/MIL_RXD_tf.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {39612U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {25891U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {1U, 0U};



static void Initial_112_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 4456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);

LAB4:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3932);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3748);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4356);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3748);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4356);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3748);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 4356);
    xsi_process_wait(t2, 10000000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3748);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4356);
    xsi_process_wait(t2, 24000000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3748);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

}

static void Always_131_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 4600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(131, ng0);

LAB4:    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3932);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 4500);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(131, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 3932);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 4500);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    goto LAB2;

}

static void Always_133_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 4744U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(133, ng0);

LAB4:    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3656);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 4644);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(133, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 3656);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 4644);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    goto LAB2;

}


extern void work_m_00000000001477445915_1892226295_init()
{
	static char *pe[] = {(void *)Initial_112_0,(void *)Always_131_1,(void *)Always_133_2};
	xsi_register_didat("work_m_00000000001477445915_1892226295", "isim/MIL_RXD_tf_isim_beh.exe.sim/work/m_00000000001477445915_1892226295.didat");
	xsi_register_executes(pe);
}
