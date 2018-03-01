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
static const char *ng0 = "G:/Dzis/Lab401N/VCDCLED.v";
static int ng1[] = {9, 0};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};



static void Cont_30_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t20[8];
    char t44[8];
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
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;

LAB0:    t1 = (t0 + 1812U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 876U);
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

LAB9:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t12);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t44, 8);

LAB16:    t60 = (t0 + 2356);
    t61 = (t60 + 32U);
    t62 = *((char **)t61);
    t63 = (t62 + 40U);
    t64 = *((char **)t63);
    memset(t64, 0, 8);
    t65 = 1U;
    t66 = t65;
    t67 = (t3 + 4);
    t68 = *((unsigned int *)t3);
    t65 = (t65 & t68);
    t69 = *((unsigned int *)t67);
    t66 = (t66 & t69);
    t70 = (t64 + 4);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t71 | t65);
    t72 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t72 | t66);
    xsi_driver_vfirst_trans(t60, 0, 0);
    t73 = (t0 + 2296);
    *((int *)t73) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1288);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng1)));
    memset(t20, 0, 8);
    t21 = (t18 + 4);
    t22 = (t19 + 4);
    t23 = *((unsigned int *)t18);
    t24 = *((unsigned int *)t19);
    t25 = (t23 ^ t24);
    t26 = *((unsigned int *)t21);
    t27 = *((unsigned int *)t22);
    t28 = (t26 ^ t27);
    t29 = (t25 | t28);
    t30 = *((unsigned int *)t21);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t29 & t33);
    if (t34 != 0)
        goto LAB20;

LAB17:    if (t32 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t20) = 1;

LAB20:    goto LAB9;

LAB10:    t40 = (t0 + 1288);
    t41 = (t40 + 36U);
    t42 = *((char **)t41);
    t43 = ((char*)((ng2)));
    memset(t44, 0, 8);
    t45 = (t42 + 4);
    t46 = (t43 + 4);
    t47 = *((unsigned int *)t42);
    t48 = *((unsigned int *)t43);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t45);
    t51 = *((unsigned int *)t46);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t45);
    t55 = *((unsigned int *)t46);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB24;

LAB21:    if (t56 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t44) = 1;

LAB24:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t20, 1, t44, 1);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

LAB19:    t35 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB20;

LAB23:    t59 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

}

static void Cont_31_1(char *t0)
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

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 968U);
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
LAB6:    t36 = (t0 + 2392);
    t37 = (t36 + 32U);
    t38 = *((char **)t37);
    t39 = (t38 + 40U);
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
    t49 = (t0 + 2304);
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

static void Always_32_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t54[8];
    char t55[8];
    char t56[8];
    char t67[8];
    char t114[8];
    char t115[8];
    char t119[8];
    char t165[8];
    char t170[8];
    char t171[8];
    char t172[8];
    char t183[8];
    char t229[8];
    char t237[8];
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
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    int t90;
    int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
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
    char *t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t116;
    char *t117;
    char *t118;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    char *t132;
    char *t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    int t142;
    int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    char *t156;
    char *t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    char *t161;
    char *t162;
    char *t163;
    char *t164;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    char *t173;
    char *t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    char *t180;
    char *t181;
    char *t182;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    char *t187;
    char *t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    char *t196;
    char *t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    unsigned int t201;
    unsigned int t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    int t206;
    int t207;
    unsigned int t208;
    unsigned int t209;
    unsigned int t210;
    unsigned int t211;
    unsigned int t212;
    unsigned int t213;
    char *t214;
    unsigned int t215;
    unsigned int t216;
    unsigned int t217;
    unsigned int t218;
    unsigned int t219;
    char *t220;
    char *t221;
    unsigned int t222;
    unsigned int t223;
    unsigned int t224;
    char *t225;
    char *t226;
    char *t227;
    char *t228;
    unsigned int t230;
    unsigned int t231;
    unsigned int t232;
    unsigned int t233;
    char *t234;
    char *t235;
    char *t236;
    char *t238;

LAB0:    t1 = (t0 + 2100U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2312);
    *((int *)t2) = 1;
    t3 = (t0 + 2128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 876U);
    t3 = *((char **)t2);
    t2 = (t0 + 1060U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t15) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t15 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t16 = (t9 | t10);
    *((unsigned int *)t11) = t16;
    t17 = *((unsigned int *)t11);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB9;

LAB10:
LAB11:    memset(t14, 0, 8);
    t38 = (t15 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (~(t39));
    t41 = *((unsigned int *)t15);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t38) != 0)
        goto LAB14;

LAB15:    t45 = (t14 + 4);
    t46 = *((unsigned int *)t14);
    t47 = *((unsigned int *)t45);
    t48 = (t46 || t47);
    if (t48 > 0)
        goto LAB16;

LAB17:    t50 = *((unsigned int *)t14);
    t51 = (~(t50));
    t52 = *((unsigned int *)t45);
    t53 = (t51 || t52);
    if (t53 > 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t45) > 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t14) > 0)
        goto LAB22;

LAB23:    memcpy(t13, t54, 8);

LAB24:    t238 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t238, t13, 0, 0, 4, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(33, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB8;

LAB9:    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t15) = (t19 | t20);
    t12 = (t3 + 4);
    t21 = (t4 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t12);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t34 & t32);
    t35 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t35 & t33);
    t36 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t36 & t32);
    t37 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t37 & t33);
    goto LAB11;

LAB12:    *((unsigned int *)t14) = 1;
    goto LAB15;

LAB14:    t44 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB15;

LAB16:    t49 = ((char*)((ng2)));
    goto LAB17;

LAB18:    t57 = (t0 + 876U);
    t58 = *((char **)t57);
    memset(t56, 0, 8);
    t57 = (t58 + 4);
    t59 = *((unsigned int *)t57);
    t60 = (~(t59));
    t61 = *((unsigned int *)t58);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t57) == 0)
        goto LAB25;

LAB27:    t64 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t64) = 1;

LAB28:    t65 = (t0 + 1060U);
    t66 = *((char **)t65);
    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t66);
    t70 = (t68 & t69);
    *((unsigned int *)t67) = t70;
    t65 = (t56 + 4);
    t71 = (t66 + 4);
    t72 = (t67 + 4);
    t73 = *((unsigned int *)t65);
    t74 = *((unsigned int *)t71);
    t75 = (t73 | t74);
    *((unsigned int *)t72) = t75;
    t76 = *((unsigned int *)t72);
    t77 = (t76 != 0);
    if (t77 == 1)
        goto LAB29;

LAB30:
LAB31:    memset(t55, 0, 8);
    t98 = (t67 + 4);
    t99 = *((unsigned int *)t98);
    t100 = (~(t99));
    t101 = *((unsigned int *)t67);
    t102 = (t101 & t100);
    t103 = (t102 & 1U);
    if (t103 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t98) != 0)
        goto LAB34;

LAB35:    t105 = (t55 + 4);
    t106 = *((unsigned int *)t55);
    t107 = *((unsigned int *)t105);
    t108 = (t106 || t107);
    if (t108 > 0)
        goto LAB36;

LAB37:    t110 = *((unsigned int *)t55);
    t111 = (~(t110));
    t112 = *((unsigned int *)t105);
    t113 = (t111 || t112);
    if (t113 > 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t105) > 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t55) > 0)
        goto LAB42;

LAB43:    memcpy(t54, t114, 8);

LAB44:    goto LAB19;

LAB20:    xsi_vlog_unsigned_bit_combine(t13, 32, t49, 32, t54, 32);
    goto LAB24;

LAB22:    memcpy(t13, t49, 8);
    goto LAB24;

LAB25:    *((unsigned int *)t56) = 1;
    goto LAB28;

LAB29:    t78 = *((unsigned int *)t67);
    t79 = *((unsigned int *)t72);
    *((unsigned int *)t67) = (t78 | t79);
    t80 = (t56 + 4);
    t81 = (t66 + 4);
    t82 = *((unsigned int *)t56);
    t83 = (~(t82));
    t84 = *((unsigned int *)t80);
    t85 = (~(t84));
    t86 = *((unsigned int *)t66);
    t87 = (~(t86));
    t88 = *((unsigned int *)t81);
    t89 = (~(t88));
    t90 = (t83 & t85);
    t91 = (t87 & t89);
    t92 = (~(t90));
    t93 = (~(t91));
    t94 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t94 & t92);
    t95 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t95 & t93);
    t96 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t96 & t92);
    t97 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t97 & t93);
    goto LAB31;

LAB32:    *((unsigned int *)t55) = 1;
    goto LAB35;

LAB34:    t104 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB35;

LAB36:    t109 = ((char*)((ng1)));
    goto LAB37;

LAB38:    t116 = (t0 + 876U);
    t117 = *((char **)t116);
    t116 = (t0 + 692U);
    t118 = *((char **)t116);
    t120 = *((unsigned int *)t117);
    t121 = *((unsigned int *)t118);
    t122 = (t120 & t121);
    *((unsigned int *)t119) = t122;
    t116 = (t117 + 4);
    t123 = (t118 + 4);
    t124 = (t119 + 4);
    t125 = *((unsigned int *)t116);
    t126 = *((unsigned int *)t123);
    t127 = (t125 | t126);
    *((unsigned int *)t124) = t127;
    t128 = *((unsigned int *)t124);
    t129 = (t128 != 0);
    if (t129 == 1)
        goto LAB45;

LAB46:
LAB47:    memset(t115, 0, 8);
    t150 = (t119 + 4);
    t151 = *((unsigned int *)t150);
    t152 = (~(t151));
    t153 = *((unsigned int *)t119);
    t154 = (t153 & t152);
    t155 = (t154 & 1U);
    if (t155 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t150) != 0)
        goto LAB50;

LAB51:    t157 = (t115 + 4);
    t158 = *((unsigned int *)t115);
    t159 = *((unsigned int *)t157);
    t160 = (t158 || t159);
    if (t160 > 0)
        goto LAB52;

LAB53:    t166 = *((unsigned int *)t115);
    t167 = (~(t166));
    t168 = *((unsigned int *)t157);
    t169 = (t167 || t168);
    if (t169 > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t157) > 0)
        goto LAB56;

LAB57:    if (*((unsigned int *)t115) > 0)
        goto LAB58;

LAB59:    memcpy(t114, t170, 8);

LAB60:    goto LAB39;

LAB40:    xsi_vlog_unsigned_bit_combine(t54, 32, t109, 32, t114, 32);
    goto LAB44;

LAB42:    memcpy(t54, t109, 8);
    goto LAB44;

LAB45:    t130 = *((unsigned int *)t119);
    t131 = *((unsigned int *)t124);
    *((unsigned int *)t119) = (t130 | t131);
    t132 = (t117 + 4);
    t133 = (t118 + 4);
    t134 = *((unsigned int *)t117);
    t135 = (~(t134));
    t136 = *((unsigned int *)t132);
    t137 = (~(t136));
    t138 = *((unsigned int *)t118);
    t139 = (~(t138));
    t140 = *((unsigned int *)t133);
    t141 = (~(t140));
    t142 = (t135 & t137);
    t143 = (t139 & t141);
    t144 = (~(t142));
    t145 = (~(t143));
    t146 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t146 & t144);
    t147 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t147 & t145);
    t148 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t148 & t144);
    t149 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t149 & t145);
    goto LAB47;

LAB48:    *((unsigned int *)t115) = 1;
    goto LAB51;

LAB50:    t156 = (t115 + 4);
    *((unsigned int *)t115) = 1;
    *((unsigned int *)t156) = 1;
    goto LAB51;

LAB52:    t161 = (t0 + 1288);
    t162 = (t161 + 36U);
    t163 = *((char **)t162);
    t164 = ((char*)((ng3)));
    memset(t165, 0, 8);
    xsi_vlog_unsigned_add(t165, 32, t163, 4, t164, 32);
    goto LAB53;

LAB54:    t173 = (t0 + 876U);
    t174 = *((char **)t173);
    memset(t172, 0, 8);
    t173 = (t174 + 4);
    t175 = *((unsigned int *)t173);
    t176 = (~(t175));
    t177 = *((unsigned int *)t174);
    t178 = (t177 & t176);
    t179 = (t178 & 1U);
    if (t179 != 0)
        goto LAB64;

LAB62:    if (*((unsigned int *)t173) == 0)
        goto LAB61;

LAB63:    t180 = (t172 + 4);
    *((unsigned int *)t172) = 1;
    *((unsigned int *)t180) = 1;

LAB64:    t181 = (t0 + 692U);
    t182 = *((char **)t181);
    t184 = *((unsigned int *)t172);
    t185 = *((unsigned int *)t182);
    t186 = (t184 & t185);
    *((unsigned int *)t183) = t186;
    t181 = (t172 + 4);
    t187 = (t182 + 4);
    t188 = (t183 + 4);
    t189 = *((unsigned int *)t181);
    t190 = *((unsigned int *)t187);
    t191 = (t189 | t190);
    *((unsigned int *)t188) = t191;
    t192 = *((unsigned int *)t188);
    t193 = (t192 != 0);
    if (t193 == 1)
        goto LAB65;

LAB66:
LAB67:    memset(t171, 0, 8);
    t214 = (t183 + 4);
    t215 = *((unsigned int *)t214);
    t216 = (~(t215));
    t217 = *((unsigned int *)t183);
    t218 = (t217 & t216);
    t219 = (t218 & 1U);
    if (t219 != 0)
        goto LAB68;

LAB69:    if (*((unsigned int *)t214) != 0)
        goto LAB70;

LAB71:    t221 = (t171 + 4);
    t222 = *((unsigned int *)t171);
    t223 = *((unsigned int *)t221);
    t224 = (t222 || t223);
    if (t224 > 0)
        goto LAB72;

LAB73:    t230 = *((unsigned int *)t171);
    t231 = (~(t230));
    t232 = *((unsigned int *)t221);
    t233 = (t231 || t232);
    if (t233 > 0)
        goto LAB74;

LAB75:    if (*((unsigned int *)t221) > 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t171) > 0)
        goto LAB78;

LAB79:    memcpy(t170, t237, 8);

LAB80:    goto LAB55;

LAB56:    xsi_vlog_unsigned_bit_combine(t114, 32, t165, 32, t170, 32);
    goto LAB60;

LAB58:    memcpy(t114, t165, 8);
    goto LAB60;

LAB61:    *((unsigned int *)t172) = 1;
    goto LAB64;

LAB65:    t194 = *((unsigned int *)t183);
    t195 = *((unsigned int *)t188);
    *((unsigned int *)t183) = (t194 | t195);
    t196 = (t172 + 4);
    t197 = (t182 + 4);
    t198 = *((unsigned int *)t172);
    t199 = (~(t198));
    t200 = *((unsigned int *)t196);
    t201 = (~(t200));
    t202 = *((unsigned int *)t182);
    t203 = (~(t202));
    t204 = *((unsigned int *)t197);
    t205 = (~(t204));
    t206 = (t199 & t201);
    t207 = (t203 & t205);
    t208 = (~(t206));
    t209 = (~(t207));
    t210 = *((unsigned int *)t188);
    *((unsigned int *)t188) = (t210 & t208);
    t211 = *((unsigned int *)t188);
    *((unsigned int *)t188) = (t211 & t209);
    t212 = *((unsigned int *)t183);
    *((unsigned int *)t183) = (t212 & t208);
    t213 = *((unsigned int *)t183);
    *((unsigned int *)t183) = (t213 & t209);
    goto LAB67;

LAB68:    *((unsigned int *)t171) = 1;
    goto LAB71;

LAB70:    t220 = (t171 + 4);
    *((unsigned int *)t171) = 1;
    *((unsigned int *)t220) = 1;
    goto LAB71;

LAB72:    t225 = (t0 + 1288);
    t226 = (t225 + 36U);
    t227 = *((char **)t226);
    t228 = ((char*)((ng3)));
    memset(t229, 0, 8);
    xsi_vlog_unsigned_minus(t229, 32, t227, 4, t228, 32);
    goto LAB73;

LAB74:    t234 = (t0 + 1288);
    t235 = (t234 + 36U);
    t236 = *((char **)t235);
    memcpy(t237, t236, 8);
    goto LAB75;

LAB76:    xsi_vlog_unsigned_bit_combine(t170, 32, t229, 32, t237, 32);
    goto LAB80;

LAB78:    memcpy(t170, t229, 8);
    goto LAB80;

}


extern void work_m_00000000000702546029_2911099382_init()
{
	static char *pe[] = {(void *)Cont_30_0,(void *)Cont_31_1,(void *)Always_32_2};
	xsi_register_didat("work_m_00000000000702546029_2911099382", "isim/tf_VCDCLED_isim_beh.exe.sim/work/m_00000000000702546029_2911099382.didat");
	xsi_register_executes(pe);
}
