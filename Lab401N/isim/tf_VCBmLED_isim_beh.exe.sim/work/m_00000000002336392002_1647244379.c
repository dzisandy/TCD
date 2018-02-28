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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Dzis/Lab401N/VCBmLED.v";
static int ng1[] = {1, 0};
static int ng2[] = {4, 0};
static int ng3[] = {0, 0};



static void Cont_33_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char t23[8];
    char t24[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t40 = *((unsigned int *)t4);
    t41 = (~(t40));
    t42 = *((unsigned int *)t12);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t48, 8);

LAB16:    t64 = (t0 + 4416);
    t65 = (t64 + 56U);
    t66 = *((char **)t65);
    t67 = (t66 + 56U);
    t68 = *((char **)t67);
    memset(t68, 0, 8);
    t69 = 1U;
    t70 = t69;
    t71 = (t3 + 4);
    t72 = *((unsigned int *)t3);
    t69 = (t69 & t72);
    t73 = *((unsigned int *)t71);
    t70 = (t70 & t73);
    t74 = (t68 + 4);
    t75 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t75 | t69);
    t76 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t76 | t70);
    xsi_driver_vfirst_trans(t64, 0, 0);
    t77 = (t0 + 4304);
    *((int *)t77) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 2568);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng1)));
    t20 = ((char*)((ng2)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_lshift(t21, 32, t19, 32, t20, 32);
    t22 = ((char*)((ng1)));
    memset(t23, 0, 8);
    xsi_vlog_unsigned_minus(t23, 32, t21, 32, t22, 32);
    memset(t24, 0, 8);
    t25 = (t18 + 4);
    t26 = (t23 + 4);
    t27 = *((unsigned int *)t18);
    t28 = *((unsigned int *)t23);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t26);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB20;

LAB17:    if (t36 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t24) = 1;

LAB20:    goto LAB9;

LAB10:    t44 = (t0 + 2568);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = ((char*)((ng3)));
    memset(t48, 0, 8);
    t49 = (t46 + 4);
    t50 = (t47 + 4);
    t51 = *((unsigned int *)t46);
    t52 = *((unsigned int *)t47);
    t53 = (t51 ^ t52);
    t54 = *((unsigned int *)t49);
    t55 = *((unsigned int *)t50);
    t56 = (t54 ^ t55);
    t57 = (t53 | t56);
    t58 = *((unsigned int *)t49);
    t59 = *((unsigned int *)t50);
    t60 = (t58 | t59);
    t61 = (~(t60));
    t62 = (t57 & t61);
    if (t62 != 0)
        goto LAB24;

LAB21:    if (t60 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t48) = 1;

LAB24:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t24, 1, t48, 1);
    goto LAB16;

LAB14:    memcpy(t3, t24, 8);
    goto LAB16;

LAB19:    t39 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB20;

LAB23:    t63 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB24;

}

static void Cont_34_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t5) = t8;
    t2 = (t3 + 4);
    t9 = (t4 + 4);
    t10 = (t5 + 4);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB4;

LAB5:
LAB6:    t36 = (t0 + 4480);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memset(t40, 0, 8);
    t41 = 1U;
    t42 = t41;
    t43 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t41 = (t41 & t44);
    t45 = *((unsigned int *)t43);
    t42 = (t42 & t45);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t47 | t41);
    t48 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t48 | t42);
    xsi_driver_vfirst_trans(t36, 0, 0);
    t49 = (t0 + 4320);
    *((int *)t49) = 1;

LAB1:    return;
LAB4:    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t5) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t3);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (~(t22));
    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (~(t26));
    t28 = (t21 & t23);
    t29 = (t25 & t27);
    t30 = (~(t28));
    t31 = (~(t29));
    t32 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t32 & t30);
    t33 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t33 & t31);
    t34 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t34 & t30);
    t35 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t35 & t31);
    goto LAB6;

}

static void Always_35_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t18[8];
    char t23[8];
    char t24[8];
    char t27[8];
    char t73[8];
    char t78[8];
    char t79[8];
    char t80[8];
    char t91[8];
    char t137[8];
    char t145[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t25;
    char *t26;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    int t114;
    int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    char *t133;
    char *t134;
    char *t135;
    char *t136;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    char *t142;
    char *t143;
    char *t144;
    char *t146;

LAB0:    t1 = (t0 + 3984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 4336);
    *((int *)t2) = 1;
    t3 = (t0 + 4016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t2) != 0)
        goto LAB11;

LAB12:    t5 = (t14 + 4);
    t15 = *((unsigned int *)t14);
    t16 = *((unsigned int *)t5);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB13;

LAB14:    t19 = *((unsigned int *)t14);
    t20 = (~(t19));
    t21 = *((unsigned int *)t5);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t5) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t14) > 0)
        goto LAB19;

LAB20:    memcpy(t13, t23, 8);

LAB21:    t146 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t146, t13, 0, 0, 4, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(36, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB8;

LAB9:    *((unsigned int *)t14) = 1;
    goto LAB12;

LAB11:    t4 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB13:    t11 = (t0 + 1848U);
    t12 = *((char **)t11);
    memcpy(t18, t12, 8);
    goto LAB14;

LAB15:    t11 = (t0 + 1208U);
    t25 = *((char **)t11);
    t11 = (t0 + 1048U);
    t26 = *((char **)t11);
    t28 = *((unsigned int *)t25);
    t29 = *((unsigned int *)t26);
    t30 = (t28 & t29);
    *((unsigned int *)t27) = t30;
    t11 = (t25 + 4);
    t31 = (t26 + 4);
    t32 = (t27 + 4);
    t33 = *((unsigned int *)t11);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB22;

LAB23:
LAB24:    memset(t24, 0, 8);
    t58 = (t27 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t27);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t24 + 4);
    t66 = *((unsigned int *)t24);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t74 = *((unsigned int *)t24);
    t75 = (~(t74));
    t76 = *((unsigned int *)t65);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t24) > 0)
        goto LAB35;

LAB36:    memcpy(t23, t78, 8);

LAB37:    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t13, 32, t18, 32, t23, 32);
    goto LAB21;

LAB19:    memcpy(t13, t18, 8);
    goto LAB21;

LAB22:    t38 = *((unsigned int *)t27);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t27) = (t38 | t39);
    t40 = (t25 + 4);
    t41 = (t26 + 4);
    t42 = *((unsigned int *)t25);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t26);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t56 & t52);
    t57 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t57 & t53);
    goto LAB24;

LAB25:    *((unsigned int *)t24) = 1;
    goto LAB28;

LAB27:    t64 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t69 = (t0 + 2568);
    t70 = (t69 + 56U);
    t71 = *((char **)t70);
    t72 = ((char*)((ng1)));
    memset(t73, 0, 8);
    xsi_vlog_unsigned_add(t73, 32, t71, 4, t72, 32);
    goto LAB30;

LAB31:    t81 = (t0 + 1208U);
    t82 = *((char **)t81);
    memset(t80, 0, 8);
    t81 = (t82 + 4);
    t83 = *((unsigned int *)t81);
    t84 = (~(t83));
    t85 = *((unsigned int *)t82);
    t86 = (t85 & t84);
    t87 = (t86 & 1U);
    if (t87 != 0)
        goto LAB41;

LAB39:    if (*((unsigned int *)t81) == 0)
        goto LAB38;

LAB40:    t88 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t88) = 1;

LAB41:    t89 = (t0 + 1048U);
    t90 = *((char **)t89);
    t92 = *((unsigned int *)t80);
    t93 = *((unsigned int *)t90);
    t94 = (t92 & t93);
    *((unsigned int *)t91) = t94;
    t89 = (t80 + 4);
    t95 = (t90 + 4);
    t96 = (t91 + 4);
    t97 = *((unsigned int *)t89);
    t98 = *((unsigned int *)t95);
    t99 = (t97 | t98);
    *((unsigned int *)t96) = t99;
    t100 = *((unsigned int *)t96);
    t101 = (t100 != 0);
    if (t101 == 1)
        goto LAB42;

LAB43:
LAB44:    memset(t79, 0, 8);
    t122 = (t91 + 4);
    t123 = *((unsigned int *)t122);
    t124 = (~(t123));
    t125 = *((unsigned int *)t91);
    t126 = (t125 & t124);
    t127 = (t126 & 1U);
    if (t127 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t122) != 0)
        goto LAB47;

LAB48:    t129 = (t79 + 4);
    t130 = *((unsigned int *)t79);
    t131 = *((unsigned int *)t129);
    t132 = (t130 || t131);
    if (t132 > 0)
        goto LAB49;

LAB50:    t138 = *((unsigned int *)t79);
    t139 = (~(t138));
    t140 = *((unsigned int *)t129);
    t141 = (t139 || t140);
    if (t141 > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t129) > 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t79) > 0)
        goto LAB55;

LAB56:    memcpy(t78, t145, 8);

LAB57:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t23, 32, t73, 32, t78, 32);
    goto LAB37;

LAB35:    memcpy(t23, t73, 8);
    goto LAB37;

LAB38:    *((unsigned int *)t80) = 1;
    goto LAB41;

LAB42:    t102 = *((unsigned int *)t91);
    t103 = *((unsigned int *)t96);
    *((unsigned int *)t91) = (t102 | t103);
    t104 = (t80 + 4);
    t105 = (t90 + 4);
    t106 = *((unsigned int *)t80);
    t107 = (~(t106));
    t108 = *((unsigned int *)t104);
    t109 = (~(t108));
    t110 = *((unsigned int *)t90);
    t111 = (~(t110));
    t112 = *((unsigned int *)t105);
    t113 = (~(t112));
    t114 = (t107 & t109);
    t115 = (t111 & t113);
    t116 = (~(t114));
    t117 = (~(t115));
    t118 = *((unsigned int *)t96);
    *((unsigned int *)t96) = (t118 & t116);
    t119 = *((unsigned int *)t96);
    *((unsigned int *)t96) = (t119 & t117);
    t120 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t120 & t116);
    t121 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t121 & t117);
    goto LAB44;

LAB45:    *((unsigned int *)t79) = 1;
    goto LAB48;

LAB47:    t128 = (t79 + 4);
    *((unsigned int *)t79) = 1;
    *((unsigned int *)t128) = 1;
    goto LAB48;

LAB49:    t133 = (t0 + 2568);
    t134 = (t133 + 56U);
    t135 = *((char **)t134);
    t136 = ((char*)((ng1)));
    memset(t137, 0, 8);
    xsi_vlog_unsigned_minus(t137, 32, t135, 4, t136, 32);
    goto LAB50;

LAB51:    t142 = (t0 + 2568);
    t143 = (t142 + 56U);
    t144 = *((char **)t143);
    memcpy(t145, t144, 8);
    goto LAB52;

LAB53:    xsi_vlog_unsigned_bit_combine(t78, 32, t137, 32, t145, 32);
    goto LAB57;

LAB55:    memcpy(t78, t137, 8);
    goto LAB57;

}


extern void work_m_00000000002336392002_1647244379_init()
{
	static char *pe[] = {(void *)Cont_33_0,(void *)Cont_34_1,(void *)Always_35_2};
	xsi_register_didat("work_m_00000000002336392002_1647244379", "isim/tf_VCBmLED_isim_beh.exe.sim/work/m_00000000002336392002_1647244379.didat");
	xsi_register_executes(pe);
}
