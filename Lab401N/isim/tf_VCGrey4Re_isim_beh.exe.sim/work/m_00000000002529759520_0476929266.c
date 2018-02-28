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
static const char *ng0 = "E:/Dzis/Lab401N/VCGrey4Re.v";
static int ng1[] = {1, 0};
static int ng2[] = {4, 0};
static int ng3[] = {0, 0};
static int ng4[] = {2, 0};
static int ng5[] = {3, 0};



static void Cont_30_0(char *t0)
{
    char t3[8];
    char t16[8];
    char t18[8];
    char t46[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    char *t48;
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
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2248);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 31U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 31U);
    t14 = ((char*)((ng1)));
    t15 = ((char*)((ng2)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_lshift(t16, 32, t14, 32, t15, 32);
    t17 = ((char*)((ng1)));
    t19 = *((unsigned int *)t16);
    t20 = *((unsigned int *)t17);
    t21 = (t19 | t20);
    *((unsigned int *)t18) = t21;
    t22 = (t16 + 4);
    t23 = (t17 + 4);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t22);
    t26 = *((unsigned int *)t23);
    t27 = (t25 | t26);
    *((unsigned int *)t24) = t27;
    t28 = *((unsigned int *)t24);
    t29 = (t28 != 0);
    if (t29 == 1)
        goto LAB4;

LAB5:
LAB6:    memset(t46, 0, 8);
    t47 = (t3 + 4);
    t48 = (t18 + 4);
    t49 = *((unsigned int *)t3);
    t50 = *((unsigned int *)t18);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB10;

LAB7:    if (t58 != 0)
        goto LAB9;

LAB8:    *((unsigned int *)t46) = 1;

LAB10:    t62 = (t0 + 4360);
    t63 = (t62 + 56U);
    t64 = *((char **)t63);
    t65 = (t64 + 56U);
    t66 = *((char **)t65);
    memset(t66, 0, 8);
    t67 = 1U;
    t68 = t67;
    t69 = (t46 + 4);
    t70 = *((unsigned int *)t46);
    t67 = (t67 & t70);
    t71 = *((unsigned int *)t69);
    t68 = (t68 & t71);
    t72 = (t66 + 4);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t73 | t67);
    t74 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t74 | t68);
    xsi_driver_vfirst_trans(t62, 0, 0);
    t75 = (t0 + 4232);
    *((int *)t75) = 1;

LAB1:    return;
LAB4:    t30 = *((unsigned int *)t18);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t18) = (t30 | t31);
    t32 = (t16 + 4);
    t33 = (t17 + 4);
    t34 = *((unsigned int *)t32);
    t35 = (~(t34));
    t36 = *((unsigned int *)t16);
    t37 = (t36 & t35);
    t38 = *((unsigned int *)t33);
    t39 = (~(t38));
    t40 = *((unsigned int *)t17);
    t41 = (t40 & t39);
    t42 = (~(t37));
    t43 = (~(t41));
    t44 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t44 & t42);
    t45 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t45 & t43);
    goto LAB6;

LAB9:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB10;

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

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
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
LAB6:    t36 = (t0 + 4424);
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
    t49 = (t0 + 4248);
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

static void Cont_32_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 3664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2248);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 15U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 15U);
    t14 = (t0 + 4488);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 15U;
    t20 = t19;
    t21 = (t3 + 4);
    t22 = *((unsigned int *)t3);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 3);
    t27 = (t0 + 4264);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Always_33_3(char *t0)
{
    char t4[8];
    char t5[8];
    char t9[8];
    char t52[8];
    char t53[8];
    char t66[8];
    char t70[8];
    char t93[8];
    char t99[8];
    char t128[8];
    char t148[8];
    char t154[8];
    char t188[8];
    char t189[8];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t67;
    char *t68;
    char *t69;
    char *t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    char *t92;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    unsigned int t105;
    int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    char *t147;
    char *t149;
    char *t150;
    char *t151;
    char *t152;
    char *t153;
    char *t155;
    char *t156;
    char *t157;
    char *t158;
    char *t159;
    unsigned int t160;
    int t161;
    int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    char *t190;
    char *t191;
    char *t192;
    char *t193;
    char *t194;
    unsigned int t195;
    int t196;

LAB0:    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 4280);
    *((int *)t2) = 1;
    t3 = (t0 + 3944);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t6 = (t0 + 1368U);
    t7 = *((char **)t6);
    t6 = (t0 + 1688U);
    t8 = *((char **)t6);
    t10 = *((unsigned int *)t7);
    t11 = *((unsigned int *)t8);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t6 = (t7 + 4);
    t13 = (t8 + 4);
    t14 = (t9 + 4);
    t15 = *((unsigned int *)t6);
    t16 = *((unsigned int *)t13);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB6;

LAB7:
LAB8:    memset(t5, 0, 8);
    t36 = (t9 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t9);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t36) != 0)
        goto LAB11;

LAB12:    t43 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t45 = *((unsigned int *)t43);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB13;

LAB14:    t48 = *((unsigned int *)t5);
    t49 = (~(t48));
    t50 = *((unsigned int *)t43);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t43) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t5) > 0)
        goto LAB19;

LAB20:    memcpy(t4, t52, 8);

LAB21:    t98 = (t0 + 2248);
    t100 = (t0 + 2248);
    t101 = (t100 + 72U);
    t102 = *((char **)t101);
    t103 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t99, t102, 2, t103, 32, 1);
    t104 = (t99 + 4);
    t105 = *((unsigned int *)t104);
    t106 = (!(t105));
    if (t106 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t6 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t6);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t6 + 4);
    t8 = (t9 + 4);
    t15 = *((unsigned int *)t2);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB41;

LAB42:
LAB43:    memset(t5, 0, 8);
    t22 = (t9 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t9);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t22) != 0)
        goto LAB46;

LAB47:    t36 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB48;

LAB49:    t48 = *((unsigned int *)t5);
    t49 = (~(t48));
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t36) > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t5) > 0)
        goto LAB54;

LAB55:    memcpy(t4, t52, 8);

LAB56:    t153 = (t0 + 2248);
    t155 = (t0 + 2248);
    t156 = (t155 + 72U);
    t157 = *((char **)t156);
    t158 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t154, t157, 2, t158, 32, 1);
    t159 = (t154 + 4);
    t160 = *((unsigned int *)t159);
    t161 = (!(t160));
    if (t161 == 1)
        goto LAB81;

LAB82:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t6 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t6);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t6 + 4);
    t8 = (t9 + 4);
    t15 = *((unsigned int *)t2);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB83;

LAB84:
LAB85:    memset(t5, 0, 8);
    t22 = (t9 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t9);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB86;

LAB87:    if (*((unsigned int *)t22) != 0)
        goto LAB88;

LAB89:    t36 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB90;

LAB91:    t48 = *((unsigned int *)t5);
    t49 = (~(t48));
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t36) > 0)
        goto LAB94;

LAB95:    if (*((unsigned int *)t5) > 0)
        goto LAB96;

LAB97:    memcpy(t4, t52, 8);

LAB98:    t159 = (t0 + 2248);
    t190 = (t0 + 2248);
    t191 = (t190 + 72U);
    t192 = *((char **)t191);
    t193 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t189, t192, 2, t193, 32, 1);
    t194 = (t189 + 4);
    t195 = *((unsigned int *)t194);
    t196 = (!(t195));
    if (t196 == 1)
        goto LAB126;

LAB127:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t6 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t6);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t6 + 4);
    t8 = (t9 + 4);
    t15 = *((unsigned int *)t2);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB128;

LAB129:
LAB130:    memset(t5, 0, 8);
    t22 = (t9 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t9);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB131;

LAB132:    if (*((unsigned int *)t22) != 0)
        goto LAB133;

LAB134:    t36 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB135;

LAB136:    t48 = *((unsigned int *)t5);
    t49 = (~(t48));
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB137;

LAB138:    if (*((unsigned int *)t36) > 0)
        goto LAB139;

LAB140:    if (*((unsigned int *)t5) > 0)
        goto LAB141;

LAB142:    memcpy(t4, t52, 8);

LAB143:    t159 = (t0 + 2248);
    t190 = (t0 + 2248);
    t191 = (t190 + 72U);
    t192 = *((char **)t191);
    t193 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t189, t192, 2, t193, 32, 1);
    t194 = (t189 + 4);
    t195 = *((unsigned int *)t194);
    t196 = (!(t195));
    if (t196 == 1)
        goto LAB171;

LAB172:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t6 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t6);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t6 + 4);
    t8 = (t9 + 4);
    t15 = *((unsigned int *)t2);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    *((unsigned int *)t8) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB173;

LAB174:
LAB175:    memset(t5, 0, 8);
    t22 = (t9 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t9);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB176;

LAB177:    if (*((unsigned int *)t22) != 0)
        goto LAB178;

LAB179:    t36 = (t5 + 4);
    t44 = *((unsigned int *)t5);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB180;

LAB181:    t48 = *((unsigned int *)t5);
    t49 = (~(t48));
    t50 = *((unsigned int *)t36);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB182;

LAB183:    if (*((unsigned int *)t36) > 0)
        goto LAB184;

LAB185:    if (*((unsigned int *)t5) > 0)
        goto LAB186;

LAB187:    memcpy(t4, t52, 8);

LAB188:    t159 = (t0 + 2248);
    t190 = (t0 + 2248);
    t191 = (t190 + 72U);
    t192 = *((char **)t191);
    t193 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t189, t192, 2, t193, 32, 1);
    t194 = (t189 + 4);
    t195 = *((unsigned int *)t194);
    t196 = (!(t195));
    if (t196 == 1)
        goto LAB216;

LAB217:    goto LAB2;

LAB6:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t9) = (t20 | t21);
    t22 = (t7 + 4);
    t23 = (t8 + 4);
    t24 = *((unsigned int *)t22);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t23);
    t29 = (~(t28));
    t30 = *((unsigned int *)t8);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t32);
    t35 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t35 & t33);
    goto LAB8;

LAB9:    *((unsigned int *)t5) = 1;
    goto LAB12;

LAB11:    t42 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB12;

LAB13:    t47 = ((char*)((ng3)));
    goto LAB14;

LAB15:    t54 = (t0 + 1208U);
    t55 = *((char **)t54);
    memset(t53, 0, 8);
    t54 = (t55 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (~(t56));
    t58 = *((unsigned int *)t55);
    t59 = (t58 & t57);
    t60 = (t59 & 1U);
    if (t60 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t54) != 0)
        goto LAB24;

LAB25:    t62 = (t53 + 4);
    t63 = *((unsigned int *)t53);
    t64 = *((unsigned int *)t62);
    t65 = (t63 || t64);
    if (t65 > 0)
        goto LAB26;

LAB27:    t86 = *((unsigned int *)t53);
    t87 = (~(t86));
    t88 = *((unsigned int *)t62);
    t89 = (t87 || t88);
    if (t89 > 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t62) > 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t53) > 0)
        goto LAB32;

LAB33:    memcpy(t52, t93, 8);

LAB34:    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t4, 32, t47, 32, t52, 32);
    goto LAB21;

LAB19:    memcpy(t4, t47, 8);
    goto LAB21;

LAB22:    *((unsigned int *)t53) = 1;
    goto LAB25;

LAB24:    t61 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB25;

LAB26:    t67 = (t0 + 2248);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);
    memset(t70, 0, 8);
    t71 = (t70 + 4);
    t72 = (t69 + 4);
    t73 = *((unsigned int *)t69);
    t74 = (t73 >> 0);
    t75 = (t74 & 1);
    *((unsigned int *)t70) = t75;
    t76 = *((unsigned int *)t72);
    t77 = (t76 >> 0);
    t78 = (t77 & 1);
    *((unsigned int *)t71) = t78;
    memset(t66, 0, 8);
    t79 = (t70 + 4);
    t80 = *((unsigned int *)t79);
    t81 = (~(t80));
    t82 = *((unsigned int *)t70);
    t83 = (t82 & t81);
    t84 = (t83 & 1U);
    if (t84 != 0)
        goto LAB38;

LAB36:    if (*((unsigned int *)t79) == 0)
        goto LAB35;

LAB37:    t85 = (t66 + 4);
    *((unsigned int *)t66) = 1;
    *((unsigned int *)t85) = 1;

LAB38:    goto LAB27;

LAB28:    t90 = (t0 + 2248);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    t94 = (t0 + 2248);
    t95 = (t94 + 72U);
    t96 = *((char **)t95);
    t97 = ((char*)((ng3)));
    xsi_vlog_generic_get_index_select_value(t93, 32, t92, t96, 2, t97, 32, 1);
    goto LAB29;

LAB30:    xsi_vlog_unsigned_bit_combine(t52, 32, t66, 32, t93, 32);
    goto LAB34;

LAB32:    memcpy(t52, t66, 8);
    goto LAB34;

LAB35:    *((unsigned int *)t66) = 1;
    goto LAB38;

LAB39:    xsi_vlogvar_wait_assign_value(t98, t4, 0, *((unsigned int *)t99), 1, 0LL);
    goto LAB40;

LAB41:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t20 | t21);
    t13 = (t3 + 4);
    t14 = (t6 + 4);
    t24 = *((unsigned int *)t13);
    t25 = (~(t24));
    t26 = *((unsigned int *)t3);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t14);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & t33);
    goto LAB43;

LAB44:    *((unsigned int *)t5) = 1;
    goto LAB47;

LAB46:    t23 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB47;

LAB48:    t42 = ((char*)((ng3)));
    goto LAB49;

LAB50:    t43 = (t0 + 2248);
    t47 = (t43 + 56U);
    t54 = *((char **)t47);
    t55 = (t0 + 2248);
    t61 = (t55 + 72U);
    t62 = *((char **)t61);
    t67 = ((char*)((ng3)));
    xsi_vlog_generic_get_index_select_value(t66, 32, t54, t62, 2, t67, 32, 1);
    t68 = ((char*)((ng3)));
    memset(t70, 0, 8);
    t69 = (t66 + 4);
    t71 = (t68 + 4);
    t56 = *((unsigned int *)t66);
    t57 = *((unsigned int *)t68);
    t58 = (t56 ^ t57);
    t59 = *((unsigned int *)t69);
    t60 = *((unsigned int *)t71);
    t63 = (t59 ^ t60);
    t64 = (t58 | t63);
    t65 = *((unsigned int *)t69);
    t73 = *((unsigned int *)t71);
    t74 = (t65 | t73);
    t75 = (~(t74));
    t76 = (t64 & t75);
    if (t76 != 0)
        goto LAB60;

LAB57:    if (t74 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t70) = 1;

LAB60:    t79 = (t0 + 1208U);
    t85 = *((char **)t79);
    t77 = *((unsigned int *)t70);
    t78 = *((unsigned int *)t85);
    t80 = (t77 & t78);
    *((unsigned int *)t93) = t80;
    t79 = (t70 + 4);
    t90 = (t85 + 4);
    t91 = (t93 + 4);
    t81 = *((unsigned int *)t79);
    t82 = *((unsigned int *)t90);
    t83 = (t81 | t82);
    *((unsigned int *)t91) = t83;
    t84 = *((unsigned int *)t91);
    t86 = (t84 != 0);
    if (t86 == 1)
        goto LAB61;

LAB62:
LAB63:    memset(t53, 0, 8);
    t95 = (t93 + 4);
    t120 = *((unsigned int *)t95);
    t121 = (~(t120));
    t122 = *((unsigned int *)t93);
    t123 = (t122 & t121);
    t124 = (t123 & 1U);
    if (t124 != 0)
        goto LAB64;

LAB65:    if (*((unsigned int *)t95) != 0)
        goto LAB66;

LAB67:    t97 = (t53 + 4);
    t125 = *((unsigned int *)t53);
    t126 = *((unsigned int *)t97);
    t127 = (t125 || t126);
    if (t127 > 0)
        goto LAB68;

LAB69:    t141 = *((unsigned int *)t53);
    t142 = (~(t141));
    t143 = *((unsigned int *)t97);
    t144 = (t142 || t143);
    if (t144 > 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t97) > 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t53) > 0)
        goto LAB74;

LAB75:    memcpy(t52, t148, 8);

LAB76:    goto LAB51;

LAB52:    xsi_vlog_unsigned_bit_combine(t4, 32, t42, 32, t52, 32);
    goto LAB56;

LAB54:    memcpy(t4, t42, 8);
    goto LAB56;

LAB59:    t72 = (t70 + 4);
    *((unsigned int *)t70) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB60;

LAB61:    t87 = *((unsigned int *)t93);
    t88 = *((unsigned int *)t91);
    *((unsigned int *)t93) = (t87 | t88);
    t92 = (t70 + 4);
    t94 = (t85 + 4);
    t89 = *((unsigned int *)t70);
    t105 = (~(t89));
    t107 = *((unsigned int *)t92);
    t108 = (~(t107));
    t109 = *((unsigned int *)t85);
    t110 = (~(t109));
    t111 = *((unsigned int *)t94);
    t112 = (~(t111));
    t106 = (t105 & t108);
    t113 = (t110 & t112);
    t114 = (~(t106));
    t115 = (~(t113));
    t116 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t116 & t114);
    t117 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t117 & t115);
    t118 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t118 & t114);
    t119 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t119 & t115);
    goto LAB63;

LAB64:    *((unsigned int *)t53) = 1;
    goto LAB67;

LAB66:    t96 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t96) = 1;
    goto LAB67;

LAB68:    t98 = (t0 + 2248);
    t100 = (t98 + 56U);
    t101 = *((char **)t100);
    memset(t128, 0, 8);
    t102 = (t128 + 4);
    t103 = (t101 + 4);
    t129 = *((unsigned int *)t101);
    t130 = (t129 >> 1);
    t131 = (t130 & 1);
    *((unsigned int *)t128) = t131;
    t132 = *((unsigned int *)t103);
    t133 = (t132 >> 1);
    t134 = (t133 & 1);
    *((unsigned int *)t102) = t134;
    memset(t99, 0, 8);
    t104 = (t128 + 4);
    t135 = *((unsigned int *)t104);
    t136 = (~(t135));
    t137 = *((unsigned int *)t128);
    t138 = (t137 & t136);
    t139 = (t138 & 1U);
    if (t139 != 0)
        goto LAB80;

LAB78:    if (*((unsigned int *)t104) == 0)
        goto LAB77;

LAB79:    t140 = (t99 + 4);
    *((unsigned int *)t99) = 1;
    *((unsigned int *)t140) = 1;

LAB80:    goto LAB69;

LAB70:    t145 = (t0 + 2248);
    t146 = (t145 + 56U);
    t147 = *((char **)t146);
    t149 = (t0 + 2248);
    t150 = (t149 + 72U);
    t151 = *((char **)t150);
    t152 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t148, 32, t147, t151, 2, t152, 32, 1);
    goto LAB71;

LAB72:    xsi_vlog_unsigned_bit_combine(t52, 32, t99, 32, t148, 32);
    goto LAB76;

LAB74:    memcpy(t52, t99, 8);
    goto LAB76;

LAB77:    *((unsigned int *)t99) = 1;
    goto LAB80;

LAB81:    xsi_vlogvar_wait_assign_value(t153, t4, 0, *((unsigned int *)t154), 1, 0LL);
    goto LAB82;

LAB83:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t20 | t21);
    t13 = (t3 + 4);
    t14 = (t6 + 4);
    t24 = *((unsigned int *)t13);
    t25 = (~(t24));
    t26 = *((unsigned int *)t3);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t14);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & t33);
    goto LAB85;

LAB86:    *((unsigned int *)t5) = 1;
    goto LAB89;

LAB88:    t23 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB89;

LAB90:    t42 = ((char*)((ng3)));
    goto LAB91;

LAB92:    t43 = (t0 + 2248);
    t47 = (t43 + 56U);
    t54 = *((char **)t47);
    memset(t66, 0, 8);
    t55 = (t66 + 4);
    t61 = (t54 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (t56 >> 0);
    *((unsigned int *)t66) = t57;
    t58 = *((unsigned int *)t61);
    t59 = (t58 >> 0);
    *((unsigned int *)t55) = t59;
    t60 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t60 & 3U);
    t63 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t63 & 3U);
    t62 = ((char*)((ng1)));
    t67 = ((char*)((ng1)));
    memset(t70, 0, 8);
    xsi_vlog_unsigned_lshift(t70, 32, t62, 32, t67, 32);
    t68 = ((char*)((ng1)));
    t64 = *((unsigned int *)t70);
    t65 = *((unsigned int *)t68);
    t73 = (t64 | t65);
    *((unsigned int *)t93) = t73;
    t69 = (t70 + 4);
    t71 = (t68 + 4);
    t72 = (t93 + 4);
    t74 = *((unsigned int *)t69);
    t75 = *((unsigned int *)t71);
    t76 = (t74 | t75);
    *((unsigned int *)t72) = t76;
    t77 = *((unsigned int *)t72);
    t78 = (t77 != 0);
    if (t78 == 1)
        goto LAB99;

LAB100:
LAB101:    memset(t99, 0, 8);
    t90 = (t66 + 4);
    t91 = (t93 + 4);
    t109 = *((unsigned int *)t66);
    t110 = *((unsigned int *)t93);
    t111 = (t109 ^ t110);
    t112 = *((unsigned int *)t90);
    t114 = *((unsigned int *)t91);
    t115 = (t112 ^ t114);
    t116 = (t111 | t115);
    t117 = *((unsigned int *)t90);
    t118 = *((unsigned int *)t91);
    t119 = (t117 | t118);
    t120 = (~(t119));
    t121 = (t116 & t120);
    if (t121 != 0)
        goto LAB105;

LAB102:    if (t119 != 0)
        goto LAB104;

LAB103:    *((unsigned int *)t99) = 1;

LAB105:    t94 = (t0 + 1208U);
    t95 = *((char **)t94);
    t122 = *((unsigned int *)t99);
    t123 = *((unsigned int *)t95);
    t124 = (t122 & t123);
    *((unsigned int *)t128) = t124;
    t94 = (t99 + 4);
    t96 = (t95 + 4);
    t97 = (t128 + 4);
    t125 = *((unsigned int *)t94);
    t126 = *((unsigned int *)t96);
    t127 = (t125 | t126);
    *((unsigned int *)t97) = t127;
    t129 = *((unsigned int *)t97);
    t130 = (t129 != 0);
    if (t130 == 1)
        goto LAB106;

LAB107:
LAB108:    memset(t53, 0, 8);
    t101 = (t128 + 4);
    t165 = *((unsigned int *)t101);
    t166 = (~(t165));
    t167 = *((unsigned int *)t128);
    t168 = (t167 & t166);
    t169 = (t168 & 1U);
    if (t169 != 0)
        goto LAB109;

LAB110:    if (*((unsigned int *)t101) != 0)
        goto LAB111;

LAB112:    t103 = (t53 + 4);
    t170 = *((unsigned int *)t53);
    t171 = *((unsigned int *)t103);
    t172 = (t170 || t171);
    if (t172 > 0)
        goto LAB113;

LAB114:    t184 = *((unsigned int *)t53);
    t185 = (~(t184));
    t186 = *((unsigned int *)t103);
    t187 = (t185 || t186);
    if (t187 > 0)
        goto LAB115;

LAB116:    if (*((unsigned int *)t103) > 0)
        goto LAB117;

LAB118:    if (*((unsigned int *)t53) > 0)
        goto LAB119;

LAB120:    memcpy(t52, t188, 8);

LAB121:    goto LAB93;

LAB94:    xsi_vlog_unsigned_bit_combine(t4, 32, t42, 32, t52, 32);
    goto LAB98;

LAB96:    memcpy(t4, t42, 8);
    goto LAB98;

LAB99:    t80 = *((unsigned int *)t93);
    t81 = *((unsigned int *)t72);
    *((unsigned int *)t93) = (t80 | t81);
    t79 = (t70 + 4);
    t85 = (t68 + 4);
    t82 = *((unsigned int *)t79);
    t83 = (~(t82));
    t84 = *((unsigned int *)t70);
    t106 = (t84 & t83);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t68);
    t113 = (t88 & t87);
    t89 = (~(t106));
    t105 = (~(t113));
    t107 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t107 & t89);
    t108 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t108 & t105);
    goto LAB101;

LAB104:    t92 = (t99 + 4);
    *((unsigned int *)t99) = 1;
    *((unsigned int *)t92) = 1;
    goto LAB105;

LAB106:    t131 = *((unsigned int *)t128);
    t132 = *((unsigned int *)t97);
    *((unsigned int *)t128) = (t131 | t132);
    t98 = (t99 + 4);
    t100 = (t95 + 4);
    t133 = *((unsigned int *)t99);
    t134 = (~(t133));
    t135 = *((unsigned int *)t98);
    t136 = (~(t135));
    t137 = *((unsigned int *)t95);
    t138 = (~(t137));
    t139 = *((unsigned int *)t100);
    t141 = (~(t139));
    t161 = (t134 & t136);
    t162 = (t138 & t141);
    t142 = (~(t161));
    t143 = (~(t162));
    t144 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t144 & t142);
    t160 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t160 & t143);
    t163 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t163 & t142);
    t164 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t164 & t143);
    goto LAB108;

LAB109:    *((unsigned int *)t53) = 1;
    goto LAB112;

LAB111:    t102 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t102) = 1;
    goto LAB112;

LAB113:    t104 = (t0 + 2248);
    t140 = (t104 + 56U);
    t145 = *((char **)t140);
    memset(t154, 0, 8);
    t146 = (t154 + 4);
    t147 = (t145 + 4);
    t173 = *((unsigned int *)t145);
    t174 = (t173 >> 2);
    t175 = (t174 & 1);
    *((unsigned int *)t154) = t175;
    t176 = *((unsigned int *)t147);
    t177 = (t176 >> 2);
    t178 = (t177 & 1);
    *((unsigned int *)t146) = t178;
    memset(t148, 0, 8);
    t149 = (t154 + 4);
    t179 = *((unsigned int *)t149);
    t180 = (~(t179));
    t181 = *((unsigned int *)t154);
    t182 = (t181 & t180);
    t183 = (t182 & 1U);
    if (t183 != 0)
        goto LAB125;

LAB123:    if (*((unsigned int *)t149) == 0)
        goto LAB122;

LAB124:    t150 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t150) = 1;

LAB125:    goto LAB114;

LAB115:    t151 = (t0 + 2248);
    t152 = (t151 + 56U);
    t153 = *((char **)t152);
    t155 = (t0 + 2248);
    t156 = (t155 + 72U);
    t157 = *((char **)t156);
    t158 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t188, 32, t153, t157, 2, t158, 32, 1);
    goto LAB116;

LAB117:    xsi_vlog_unsigned_bit_combine(t52, 32, t148, 32, t188, 32);
    goto LAB121;

LAB119:    memcpy(t52, t148, 8);
    goto LAB121;

LAB122:    *((unsigned int *)t148) = 1;
    goto LAB125;

LAB126:    xsi_vlogvar_wait_assign_value(t159, t4, 0, *((unsigned int *)t189), 1, 0LL);
    goto LAB127;

LAB128:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t20 | t21);
    t13 = (t3 + 4);
    t14 = (t6 + 4);
    t24 = *((unsigned int *)t13);
    t25 = (~(t24));
    t26 = *((unsigned int *)t3);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t14);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & t33);
    goto LAB130;

LAB131:    *((unsigned int *)t5) = 1;
    goto LAB134;

LAB133:    t23 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB134;

LAB135:    t42 = ((char*)((ng3)));
    goto LAB136;

LAB137:    t43 = (t0 + 2248);
    t47 = (t43 + 56U);
    t54 = *((char **)t47);
    memset(t66, 0, 8);
    t55 = (t66 + 4);
    t61 = (t54 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (t56 >> 0);
    *((unsigned int *)t66) = t57;
    t58 = *((unsigned int *)t61);
    t59 = (t58 >> 0);
    *((unsigned int *)t55) = t59;
    t60 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t60 & 7U);
    t63 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t63 & 7U);
    t62 = ((char*)((ng1)));
    t67 = ((char*)((ng4)));
    memset(t70, 0, 8);
    xsi_vlog_unsigned_lshift(t70, 32, t62, 32, t67, 32);
    t68 = ((char*)((ng1)));
    t64 = *((unsigned int *)t70);
    t65 = *((unsigned int *)t68);
    t73 = (t64 | t65);
    *((unsigned int *)t93) = t73;
    t69 = (t70 + 4);
    t71 = (t68 + 4);
    t72 = (t93 + 4);
    t74 = *((unsigned int *)t69);
    t75 = *((unsigned int *)t71);
    t76 = (t74 | t75);
    *((unsigned int *)t72) = t76;
    t77 = *((unsigned int *)t72);
    t78 = (t77 != 0);
    if (t78 == 1)
        goto LAB144;

LAB145:
LAB146:    memset(t99, 0, 8);
    t90 = (t66 + 4);
    t91 = (t93 + 4);
    t109 = *((unsigned int *)t66);
    t110 = *((unsigned int *)t93);
    t111 = (t109 ^ t110);
    t112 = *((unsigned int *)t90);
    t114 = *((unsigned int *)t91);
    t115 = (t112 ^ t114);
    t116 = (t111 | t115);
    t117 = *((unsigned int *)t90);
    t118 = *((unsigned int *)t91);
    t119 = (t117 | t118);
    t120 = (~(t119));
    t121 = (t116 & t120);
    if (t121 != 0)
        goto LAB150;

LAB147:    if (t119 != 0)
        goto LAB149;

LAB148:    *((unsigned int *)t99) = 1;

LAB150:    t94 = (t0 + 1208U);
    t95 = *((char **)t94);
    t122 = *((unsigned int *)t99);
    t123 = *((unsigned int *)t95);
    t124 = (t122 & t123);
    *((unsigned int *)t128) = t124;
    t94 = (t99 + 4);
    t96 = (t95 + 4);
    t97 = (t128 + 4);
    t125 = *((unsigned int *)t94);
    t126 = *((unsigned int *)t96);
    t127 = (t125 | t126);
    *((unsigned int *)t97) = t127;
    t129 = *((unsigned int *)t97);
    t130 = (t129 != 0);
    if (t130 == 1)
        goto LAB151;

LAB152:
LAB153:    memset(t53, 0, 8);
    t101 = (t128 + 4);
    t165 = *((unsigned int *)t101);
    t166 = (~(t165));
    t167 = *((unsigned int *)t128);
    t168 = (t167 & t166);
    t169 = (t168 & 1U);
    if (t169 != 0)
        goto LAB154;

LAB155:    if (*((unsigned int *)t101) != 0)
        goto LAB156;

LAB157:    t103 = (t53 + 4);
    t170 = *((unsigned int *)t53);
    t171 = *((unsigned int *)t103);
    t172 = (t170 || t171);
    if (t172 > 0)
        goto LAB158;

LAB159:    t184 = *((unsigned int *)t53);
    t185 = (~(t184));
    t186 = *((unsigned int *)t103);
    t187 = (t185 || t186);
    if (t187 > 0)
        goto LAB160;

LAB161:    if (*((unsigned int *)t103) > 0)
        goto LAB162;

LAB163:    if (*((unsigned int *)t53) > 0)
        goto LAB164;

LAB165:    memcpy(t52, t188, 8);

LAB166:    goto LAB138;

LAB139:    xsi_vlog_unsigned_bit_combine(t4, 32, t42, 32, t52, 32);
    goto LAB143;

LAB141:    memcpy(t4, t42, 8);
    goto LAB143;

LAB144:    t80 = *((unsigned int *)t93);
    t81 = *((unsigned int *)t72);
    *((unsigned int *)t93) = (t80 | t81);
    t79 = (t70 + 4);
    t85 = (t68 + 4);
    t82 = *((unsigned int *)t79);
    t83 = (~(t82));
    t84 = *((unsigned int *)t70);
    t106 = (t84 & t83);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t68);
    t113 = (t88 & t87);
    t89 = (~(t106));
    t105 = (~(t113));
    t107 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t107 & t89);
    t108 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t108 & t105);
    goto LAB146;

LAB149:    t92 = (t99 + 4);
    *((unsigned int *)t99) = 1;
    *((unsigned int *)t92) = 1;
    goto LAB150;

LAB151:    t131 = *((unsigned int *)t128);
    t132 = *((unsigned int *)t97);
    *((unsigned int *)t128) = (t131 | t132);
    t98 = (t99 + 4);
    t100 = (t95 + 4);
    t133 = *((unsigned int *)t99);
    t134 = (~(t133));
    t135 = *((unsigned int *)t98);
    t136 = (~(t135));
    t137 = *((unsigned int *)t95);
    t138 = (~(t137));
    t139 = *((unsigned int *)t100);
    t141 = (~(t139));
    t161 = (t134 & t136);
    t162 = (t138 & t141);
    t142 = (~(t161));
    t143 = (~(t162));
    t144 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t144 & t142);
    t160 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t160 & t143);
    t163 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t163 & t142);
    t164 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t164 & t143);
    goto LAB153;

LAB154:    *((unsigned int *)t53) = 1;
    goto LAB157;

LAB156:    t102 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t102) = 1;
    goto LAB157;

LAB158:    t104 = (t0 + 2248);
    t140 = (t104 + 56U);
    t145 = *((char **)t140);
    memset(t154, 0, 8);
    t146 = (t154 + 4);
    t147 = (t145 + 4);
    t173 = *((unsigned int *)t145);
    t174 = (t173 >> 3);
    t175 = (t174 & 1);
    *((unsigned int *)t154) = t175;
    t176 = *((unsigned int *)t147);
    t177 = (t176 >> 3);
    t178 = (t177 & 1);
    *((unsigned int *)t146) = t178;
    memset(t148, 0, 8);
    t149 = (t154 + 4);
    t179 = *((unsigned int *)t149);
    t180 = (~(t179));
    t181 = *((unsigned int *)t154);
    t182 = (t181 & t180);
    t183 = (t182 & 1U);
    if (t183 != 0)
        goto LAB170;

LAB168:    if (*((unsigned int *)t149) == 0)
        goto LAB167;

LAB169:    t150 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t150) = 1;

LAB170:    goto LAB159;

LAB160:    t151 = (t0 + 2248);
    t152 = (t151 + 56U);
    t153 = *((char **)t152);
    t155 = (t0 + 2248);
    t156 = (t155 + 72U);
    t157 = *((char **)t156);
    t158 = ((char*)((ng5)));
    xsi_vlog_generic_get_index_select_value(t188, 32, t153, t157, 2, t158, 32, 1);
    goto LAB161;

LAB162:    xsi_vlog_unsigned_bit_combine(t52, 32, t148, 32, t188, 32);
    goto LAB166;

LAB164:    memcpy(t52, t148, 8);
    goto LAB166;

LAB167:    *((unsigned int *)t148) = 1;
    goto LAB170;

LAB171:    xsi_vlogvar_wait_assign_value(t159, t4, 0, *((unsigned int *)t189), 1, 0LL);
    goto LAB172;

LAB173:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t20 | t21);
    t13 = (t3 + 4);
    t14 = (t6 + 4);
    t24 = *((unsigned int *)t13);
    t25 = (~(t24));
    t26 = *((unsigned int *)t3);
    t27 = (t26 & t25);
    t28 = *((unsigned int *)t14);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (~(t27));
    t33 = (~(t31));
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & t33);
    goto LAB175;

LAB176:    *((unsigned int *)t5) = 1;
    goto LAB179;

LAB178:    t23 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB179;

LAB180:    t42 = ((char*)((ng3)));
    goto LAB181;

LAB182:    t43 = (t0 + 2248);
    t47 = (t43 + 56U);
    t54 = *((char **)t47);
    memset(t66, 0, 8);
    t55 = (t66 + 4);
    t61 = (t54 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (t56 >> 0);
    *((unsigned int *)t66) = t57;
    t58 = *((unsigned int *)t61);
    t59 = (t58 >> 0);
    *((unsigned int *)t55) = t59;
    t60 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t60 & 15U);
    t63 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t63 & 15U);
    t62 = ((char*)((ng1)));
    t67 = ((char*)((ng5)));
    memset(t70, 0, 8);
    xsi_vlog_unsigned_lshift(t70, 32, t62, 32, t67, 32);
    t68 = ((char*)((ng1)));
    t64 = *((unsigned int *)t70);
    t65 = *((unsigned int *)t68);
    t73 = (t64 | t65);
    *((unsigned int *)t93) = t73;
    t69 = (t70 + 4);
    t71 = (t68 + 4);
    t72 = (t93 + 4);
    t74 = *((unsigned int *)t69);
    t75 = *((unsigned int *)t71);
    t76 = (t74 | t75);
    *((unsigned int *)t72) = t76;
    t77 = *((unsigned int *)t72);
    t78 = (t77 != 0);
    if (t78 == 1)
        goto LAB189;

LAB190:
LAB191:    memset(t99, 0, 8);
    t90 = (t66 + 4);
    t91 = (t93 + 4);
    t109 = *((unsigned int *)t66);
    t110 = *((unsigned int *)t93);
    t111 = (t109 ^ t110);
    t112 = *((unsigned int *)t90);
    t114 = *((unsigned int *)t91);
    t115 = (t112 ^ t114);
    t116 = (t111 | t115);
    t117 = *((unsigned int *)t90);
    t118 = *((unsigned int *)t91);
    t119 = (t117 | t118);
    t120 = (~(t119));
    t121 = (t116 & t120);
    if (t121 != 0)
        goto LAB195;

LAB192:    if (t119 != 0)
        goto LAB194;

LAB193:    *((unsigned int *)t99) = 1;

LAB195:    t94 = (t0 + 1208U);
    t95 = *((char **)t94);
    t122 = *((unsigned int *)t99);
    t123 = *((unsigned int *)t95);
    t124 = (t122 & t123);
    *((unsigned int *)t128) = t124;
    t94 = (t99 + 4);
    t96 = (t95 + 4);
    t97 = (t128 + 4);
    t125 = *((unsigned int *)t94);
    t126 = *((unsigned int *)t96);
    t127 = (t125 | t126);
    *((unsigned int *)t97) = t127;
    t129 = *((unsigned int *)t97);
    t130 = (t129 != 0);
    if (t130 == 1)
        goto LAB196;

LAB197:
LAB198:    memset(t53, 0, 8);
    t101 = (t128 + 4);
    t165 = *((unsigned int *)t101);
    t166 = (~(t165));
    t167 = *((unsigned int *)t128);
    t168 = (t167 & t166);
    t169 = (t168 & 1U);
    if (t169 != 0)
        goto LAB199;

LAB200:    if (*((unsigned int *)t101) != 0)
        goto LAB201;

LAB202:    t103 = (t53 + 4);
    t170 = *((unsigned int *)t53);
    t171 = *((unsigned int *)t103);
    t172 = (t170 || t171);
    if (t172 > 0)
        goto LAB203;

LAB204:    t184 = *((unsigned int *)t53);
    t185 = (~(t184));
    t186 = *((unsigned int *)t103);
    t187 = (t185 || t186);
    if (t187 > 0)
        goto LAB205;

LAB206:    if (*((unsigned int *)t103) > 0)
        goto LAB207;

LAB208:    if (*((unsigned int *)t53) > 0)
        goto LAB209;

LAB210:    memcpy(t52, t188, 8);

LAB211:    goto LAB183;

LAB184:    xsi_vlog_unsigned_bit_combine(t4, 32, t42, 32, t52, 32);
    goto LAB188;

LAB186:    memcpy(t4, t42, 8);
    goto LAB188;

LAB189:    t80 = *((unsigned int *)t93);
    t81 = *((unsigned int *)t72);
    *((unsigned int *)t93) = (t80 | t81);
    t79 = (t70 + 4);
    t85 = (t68 + 4);
    t82 = *((unsigned int *)t79);
    t83 = (~(t82));
    t84 = *((unsigned int *)t70);
    t106 = (t84 & t83);
    t86 = *((unsigned int *)t85);
    t87 = (~(t86));
    t88 = *((unsigned int *)t68);
    t113 = (t88 & t87);
    t89 = (~(t106));
    t105 = (~(t113));
    t107 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t107 & t89);
    t108 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t108 & t105);
    goto LAB191;

LAB194:    t92 = (t99 + 4);
    *((unsigned int *)t99) = 1;
    *((unsigned int *)t92) = 1;
    goto LAB195;

LAB196:    t131 = *((unsigned int *)t128);
    t132 = *((unsigned int *)t97);
    *((unsigned int *)t128) = (t131 | t132);
    t98 = (t99 + 4);
    t100 = (t95 + 4);
    t133 = *((unsigned int *)t99);
    t134 = (~(t133));
    t135 = *((unsigned int *)t98);
    t136 = (~(t135));
    t137 = *((unsigned int *)t95);
    t138 = (~(t137));
    t139 = *((unsigned int *)t100);
    t141 = (~(t139));
    t161 = (t134 & t136);
    t162 = (t138 & t141);
    t142 = (~(t161));
    t143 = (~(t162));
    t144 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t144 & t142);
    t160 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t160 & t143);
    t163 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t163 & t142);
    t164 = *((unsigned int *)t128);
    *((unsigned int *)t128) = (t164 & t143);
    goto LAB198;

LAB199:    *((unsigned int *)t53) = 1;
    goto LAB202;

LAB201:    t102 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t102) = 1;
    goto LAB202;

LAB203:    t104 = (t0 + 2248);
    t140 = (t104 + 56U);
    t145 = *((char **)t140);
    memset(t154, 0, 8);
    t146 = (t154 + 4);
    t147 = (t145 + 4);
    t173 = *((unsigned int *)t145);
    t174 = (t173 >> 4);
    t175 = (t174 & 1);
    *((unsigned int *)t154) = t175;
    t176 = *((unsigned int *)t147);
    t177 = (t176 >> 4);
    t178 = (t177 & 1);
    *((unsigned int *)t146) = t178;
    memset(t148, 0, 8);
    t149 = (t154 + 4);
    t179 = *((unsigned int *)t149);
    t180 = (~(t179));
    t181 = *((unsigned int *)t154);
    t182 = (t181 & t180);
    t183 = (t182 & 1U);
    if (t183 != 0)
        goto LAB215;

LAB213:    if (*((unsigned int *)t149) == 0)
        goto LAB212;

LAB214:    t150 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t150) = 1;

LAB215:    goto LAB204;

LAB205:    t151 = (t0 + 2248);
    t152 = (t151 + 56U);
    t153 = *((char **)t152);
    t155 = (t0 + 2248);
    t156 = (t155 + 72U);
    t157 = *((char **)t156);
    t158 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t188, 32, t153, t157, 2, t158, 32, 1);
    goto LAB206;

LAB207:    xsi_vlog_unsigned_bit_combine(t52, 32, t148, 32, t188, 32);
    goto LAB211;

LAB209:    memcpy(t52, t148, 8);
    goto LAB211;

LAB212:    *((unsigned int *)t148) = 1;
    goto LAB215;

LAB216:    xsi_vlogvar_wait_assign_value(t159, t4, 0, *((unsigned int *)t189), 1, 0LL);
    goto LAB217;

}


extern void work_m_00000000002529759520_0476929266_init()
{
	static char *pe[] = {(void *)Cont_30_0,(void *)Cont_31_1,(void *)Cont_32_2,(void *)Always_33_3};
	xsi_register_didat("work_m_00000000002529759520_0476929266", "isim/tf_VCGrey4Re_isim_beh.exe.sim/work/m_00000000002529759520_0476929266.didat");
	xsi_register_executes(pe);
}
