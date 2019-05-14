function D = inertia_forces_numeric(T2,T3,T4,T5,T6)
%INERTIA_FORCES_NUMERIC
%    D = INERTIA_FORCES_NUMERIC(T2,T3,T4,T5,T6)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    10-Jul-2018 14:20:58

t2 = cos(T2);
t3 = cos(T3);
t4 = cos(T4);
t5 = cos(T6);
t6 = t2.^2;
t7 = t3.^2;
t8 = t4.^2;
t9 = cos(T5);
t10 = t5.^2;
t11 = t9.^2;
t12 = sin(T3);
t13 = sin(T5);
t14 = sin(T2);
t15 = sin(T4);
t16 = sin(T6);
t17 = t2.*t12.*t15.*3.016470997243077e-2;
t18 = t3.*t14.*t15.*3.016470997243077e-2;
t19 = t12.*t14.*t15.*6.48785461e-2;
t20 = t4.*t12.*t14.*t15.*2.087031903568372;
t21 = t2.*t12.*t13.*t15.*1.85923829e-2;
t22 = t3.*t13.*t14.*t15.*1.85923829e-2;
t23 = t9.*t12.*t14.*t15.*3.197481235e-2;
t24 = t4.*t9.*t12.*t14.*t15.*3.71847658e-2;
t25 = t2.*t9.*t12.*t13.*t15.*1.344539989554982;
t26 = t3.*t9.*t13.*t14.*t15.*1.344539989554982;
t27 = t5.*t12.*t13.*t14.*t16.*1.35069508599162e-1;
t28 = t4.*t11.*t12.*t14.*t15.*1.344539989554982;
t29 = t4.*t10.*t12.*t14.*t15.*2.70139017198324e-1;
t30 = t2.*t3.*t5.*t8.*t13.*t16.*2.70139017198324e-1;
t31 = t2.*t3.*t4.*t10.*t11.*t15.*1.35069508599162e-1;
t32 = t2.*t4.*t5.*t9.*t12.*t16.*1.35069508599162e-1;
t33 = t3.*t4.*t5.*t9.*t14.*t16.*1.35069508599162e-1;
t34 = t4.*t9.*t12.*t13.*t14.*t15.*6.032941994486155e-2;
t52 = t2.*t3.*t15.*6.48785461e-2;
t53 = t2.*t3.*t4.*t15.*2.087031903568372;
t54 = t2.*t3.*t9.*t15.*3.197481235e-2;
t55 = t2.*t11.*t12.*t15.*6.032941994486155e-2;
t56 = t3.*t11.*t14.*t15.*6.032941994486155e-2;
t57 = t2.*t3.*t4.*t9.*t15.*3.71847658e-2;
t58 = t2.*t3.*t5.*t13.*t16.*1.35069508599162e-1;
t59 = t2.*t3.*t4.*t11.*t15.*1.344539989554982;
t60 = t2.*t3.*t4.*t10.*t15.*2.70139017198324e-1;
t61 = t2.*t9.*t10.*t12.*t13.*t15.*1.35069508599162e-1;
t62 = t3.*t9.*t10.*t13.*t14.*t15.*1.35069508599162e-1;
t63 = t5.*t8.*t12.*t13.*t14.*t16.*2.70139017198324e-1;
t64 = t4.*t10.*t11.*t12.*t14.*t15.*1.35069508599162e-1;
t65 = t2.*t3.*t4.*t9.*t13.*t15.*6.032941994486155e-2;
t35 = t17+t18+t19+t20+t21+t22+t23+t24+t25+t26+t27+t28+t29+t30+t31+t32+t33+t34-t52-t53-t54-t55-t56-t57-t58-t59-t60-t61-t62-t63-t64-t65-t2.*t15.*9.1203068e-2-t2.*t9.*t15.*4.4948618e-2;
t36 = t3.*3.60739302e-1;
t37 = t10.*1.35069508599162e-1;
t38 = t3.*t4.*1.82406136e-1;
t39 = t3.*t4.*t9.*8.9897236e-2;
t40 = t8.*t10.*t11.*1.35069508599162e-1;
t41 = T5.*2.0;
t42 = sin(t41);
t43 = t4.*1.297570922e-1;
t44 = t8.*2.087031903568372;
t45 = t8.*t9.*3.71847658e-2;
t46 = t8.*t11.*1.344539989554982;
t47 = t8.*t10.*2.70139017198324e-1;
t48 = t10.*t11.*1.35069508599162e-1;
t49 = t4.*t9.*6.39496247e-2;
t50 = t8.*t9.*t13.*6.032941994486155e-2;
t51 = t4.*t5.*t13.*t15.*t16.*2.70139017198324e-1;
t66 = t3.*1.80369651e-1;
t67 = t3.*t4.*9.1203068e-2;
t68 = t3.*t4.*t9.*4.4948618e-2;
t70 = t42.*3.016470997243077e-2;
t71 = t11.*1.344539989554982;
t69 = -t37-t40+t43+t44+t45+t46+t47+t48+t49+t50+t51+t66+t67+t68-t70-t71-t12.*t13.*4.4948618e-2+7.694484764996411;
t72 = t15.*3.016470997243077e-2;
t73 = t13.*t15.*1.85923829e-2;
t74 = t9.*t13.*t15.*1.344539989554982;
t75 = t4.*t5.*t9.*t16.*1.35069508599162e-1;
t76 = t4.*2.552957346935785;
t77 = t9.*3.197481235e-2;
t78 = t4.*t10.*1.35069508599162e-1;
t79 = t4.*t9.*1.85923829e-2;
t80 = t5.*t13.*t15.*t16.*1.35069508599162e-1;
t81 = t9.*t15.*2.665054366083109e-1;
t82 = t2.*t12.*3.07139830597608;
t83 = t3.*t14.*3.07139830597608;
t84 = t4.*t14.*9.1203068e-2;
t85 = t2.*t3.*t4.*3.016470997243077e-2;
t86 = t2.*t4.*t12.*6.48785461e-2;
t87 = t3.*t4.*t14.*6.48785461e-2;
t88 = t2.*t9.*t12.*3.71847658e-2;
t89 = t3.*t9.*t14.*3.71847658e-2;
t90 = t4.*t9.*t14.*4.4948618e-2;
t91 = t2.*t11.*t12.*1.344539989554982;
t92 = t3.*t11.*t14.*1.344539989554982;
t93 = t2.*t3.*t4.*t13.*1.85923829e-2;
t94 = t2.*t4.*t9.*t12.*3.197481235e-2;
t95 = t3.*t4.*t9.*t14.*3.197481235e-2;
t96 = t2.*t9.*t12.*t13.*6.032941994486155e-2;
t97 = t3.*t9.*t13.*t14.*6.032941994486155e-2;
t98 = t4.*t11.*t12.*t14.*6.032941994486155e-2;
t99 = t2.*t3.*t4.*t9.*t13.*1.344539989554982;
t100 = t4.*t9.*t10.*t12.*t13.*t14.*1.35069508599162e-1;
t101 = t5.*t9.*t12.*t14.*t15.*t16.*1.35069508599162e-1;
t102 = t82+t83+t84+t85+t86+t87+t88+t89+t90+t91+t92+t93+t94+t95+t96+t97+t98+t99+t100+t101-t4.*t12.*t14.*3.016470997243077e-2-t2.*t3.*t4.*t11.*6.032941994486155e-2-t2.*t10.*t11.*t12.*1.35069508599162e-1-t3.*t10.*t11.*t14.*1.35069508599162e-1-t4.*t12.*t13.*t14.*1.85923829e-2-t4.*t9.*t12.*t13.*t14.*1.344539989554982-t2.*t3.*t4.*t9.*t10.*t13.*1.35069508599162e-1-t2.*t3.*t5.*t9.*t15.*t16.*1.35069508599162e-1;
t104 = t11.*t15.*6.032941994486155e-2;
t105 = t9.*t10.*t13.*t15.*1.35069508599162e-1;
t103 = t72+t73+t74+t75-t104-t105-t12.*t15.*9.1203068e-2-t9.*t12.*t15.*4.4948618e-2;
t106 = t9.*3.71847658e-2;
t107 = t12.*t14.*t15.*2.552957346935785;
t108 = t9.*t12.*t14.*t15.*1.85923829e-2;
t109 = t10.*t12.*t14.*t15.*1.35069508599162e-1;
t110 = t2.*t5.*t9.*t12.*t16.*1.35069508599162e-1;
t111 = t3.*t5.*t9.*t14.*t16.*1.35069508599162e-1;
t112 = t2.*t3.*t4.*t5.*t13.*t16.*1.35069508599162e-1;
t113 = t107+t108+t109+t110+t111+t112-t2.*t3.*t15.*2.552957346935785-t13.*t14.*t15.*4.4948618e-2-t2.*t3.*t9.*t15.*1.85923829e-2-t2.*t3.*t10.*t15.*1.35069508599162e-1-t2.*t12.*t13.*t15.*3.197481235e-2-t3.*t13.*t14.*t15.*3.197481235e-2-t4.*t5.*t12.*t13.*t14.*t16.*1.35069508599162e-1;
t114 = t3.*t9.*4.4948618e-2;
t115 = t76+t77+t78+t79+t80+t114-t4.*t12.*t13.*4.4948618e-2;
t116 = t76+t77+t78+t79+t80;
t117 = t5.*t9.*t16.*1.35069508599162e-1;
t118 = t2.*t3.*t4.*t9.*2.665054366083109e-1;
t119 = t118-t2.*t12.*t13.*2.665054366083109e-1-t3.*t13.*t14.*2.665054366083109e-1-t4.*t9.*t12.*t14.*2.665054366083109e-1;
D = reshape([t6.*1.229167852279101+t7.*3.274113267988291-t8.*2.087031903568372+t36+t37+t38+t39+t40+t106-t3.*t6.*3.60739302e-1+t4.*t6.*1.297570922e-1+t4.*t7.*1.297570922e-1-t6.*t7.*6.548226535976582+t6.*t8.*2.087031903568372+t7.*t8.*2.087031903568372-t6.*t10.*1.35069508599162e-1+t6.*t11.*1.344539989554982-t7.*t10.*1.35069508599162e-1-t8.*t9.*3.71847658e-2+t7.*t11.*1.344539989554982-t8.*t10.*2.70139017198324e-1-t8.*t11.*1.344539989554982-t12.*t13.*8.9897236e-2-t3.*t4.*t6.*1.82406136e-1-t4.*t6.*t7.*2.595141844e-1-t3.*t4.*t12.*6.032941994486155e-2+t4.*t6.*t9.*6.39496247e-2-t2.*t4.*t14.*6.032941994486155e-2+t4.*t7.*t9.*6.39496247e-2-t6.*t7.*t8.*4.174063807136743+t6.*t7.*t10.*2.70139017198324e-1+t6.*t8.*t9.*3.71847658e-2-t6.*t7.*t11.*2.689079979109964+t6.*t8.*t10.*2.70139017198324e-1+t7.*t8.*t9.*3.71847658e-2+t6.*t8.*t11.*1.344539989554982+t7.*t8.*t10.*2.70139017198324e-1+t7.*t8.*t11.*1.344539989554982-t6.*t10.*t11.*1.35069508599162e-1+t2.*t12.*t14.*3.60739302e-1-t3.*t12.*t13.*6.39496247e-2+t6.*t9.*t13.*6.032941994486155e-2-t7.*t10.*t11.*1.35069508599162e-1-t2.*t13.*t14.*6.39496247e-2+t7.*t9.*t13.*6.032941994486155e-2-t8.*t9.*t13.*6.032941994486155e-2+t6.*t12.*t13.*8.9897236e-2-t3.*t4.*t6.*t9.*8.9897236e-2+t3.*t4.*t6.*t12.*1.206588398897231e-1-t4.*t6.*t7.*t9.*1.278992494e-1+t2.*t4.*t7.*t14.*1.206588398897231e-1+t3.*t4.*t11.*t12.*1.206588398897231e-1-t6.*t7.*t8.*t9.*7.43695316e-2+t2.*t3.*t12.*t14.*6.548226535976582+t2.*t4.*t11.*t14.*1.206588398897231e-1-t6.*t7.*t8.*t10.*5.40278034396648e-1+t2.*t3.*t13.*t14.*8.9897236e-2+t2.*t4.*t12.*t14.*1.82406136e-1-t3.*t4.*t12.*t13.*3.71847658e-2-t6.*t7.*t8.*t11.*2.689079979109964-t2.*t4.*t13.*t14.*3.71847658e-2+t3.*t6.*t12.*t13.*1.278992494e-1+t6.*t7.*t10.*t11.*2.70139017198324e-1-t6.*t7.*t9.*t13.*1.206588398897231e-1-t6.*t8.*t10.*t11.*1.35069508599162e-1+t2.*t7.*t13.*t14.*1.278992494e-1+t6.*t8.*t9.*t13.*6.032941994486155e-2-t7.*t8.*t10.*t11.*1.35069508599162e-1+t7.*t8.*t9.*t13.*6.032941994486155e-2+t2.*t3.*t4.*t12.*t14.*2.595141844e-1-t3.*t4.*t6.*t11.*t12.*2.413176797794462e-1-t2.*t4.*t7.*t11.*t14.*2.413176797794462e-1+t3.*t4.*t6.*t12.*t13.*7.43695316e-2+t2.*t3.*t8.*t12.*t14.*4.174063807136743+t2.*t4.*t7.*t13.*t14.*7.43695316e-2-t2.*t3.*t10.*t12.*t14.*2.70139017198324e-1+t2.*t4.*t9.*t12.*t14.*8.9897236e-2-t3.*t4.*t9.*t12.*t13.*2.689079979109964+t2.*t3.*t11.*t12.*t14.*2.689079979109964-t2.*t4.*t9.*t13.*t14.*2.689079979109964+t6.*t7.*t8.*t10.*t11.*2.70139017198324e-1-t6.*t7.*t8.*t9.*t13.*1.206588398897231e-1-t4.*t5.*t13.*t15.*t16.*2.70139017198324e-1+t2.*t3.*t4.*t9.*t12.*t14.*1.278992494e-1+t3.*t4.*t6.*t9.*t12.*t13.*5.378159958219928+t2.*t3.*t8.*t9.*t12.*t14.*7.43695316e-2+t2.*t3.*t8.*t10.*t12.*t14.*5.40278034396648e-1+t2.*t4.*t7.*t9.*t13.*t14.*5.378159958219928+t2.*t3.*t8.*t11.*t12.*t14.*2.689079979109964+t3.*t4.*t9.*t10.*t12.*t13.*2.70139017198324e-1-t2.*t3.*t10.*t11.*t12.*t14.*2.70139017198324e-1+t2.*t4.*t9.*t10.*t13.*t14.*2.70139017198324e-1+t2.*t3.*t9.*t12.*t13.*t14.*1.206588398897231e-1+t4.*t5.*t6.*t13.*t15.*t16.*2.70139017198324e-1+t3.*t5.*t9.*t12.*t15.*t16.*2.70139017198324e-1+t4.*t5.*t7.*t13.*t15.*t16.*2.70139017198324e-1+t2.*t5.*t9.*t14.*t15.*t16.*2.70139017198324e-1-t3.*t4.*t6.*t9.*t10.*t12.*t13.*5.40278034396648e-1-t2.*t4.*t7.*t9.*t10.*t13.*t14.*5.40278034396648e-1-t2.*t3.*t8.*t10.*t11.*t12.*t14.*2.70139017198324e-1+t2.*t3.*t8.*t9.*t12.*t13.*t14.*1.206588398897231e-1-t3.*t5.*t6.*t9.*t12.*t15.*t16.*5.40278034396648e-1-t4.*t5.*t6.*t7.*t13.*t15.*t16.*5.40278034396648e-1-t2.*t5.*t7.*t9.*t14.*t15.*t16.*5.40278034396648e-1+t2.*t3.*t4.*t5.*t12.*t13.*t14.*t15.*t16.*5.40278034396648e-1+1.093603968756322e1,t35,t17+t18+t19+t20+t21+t22+t23+t24+t25+t26+t27+t28+t29+t30+t31+t32+t33+t34-t52-t53-t54-t55-t56-t57-t58-t59-t60-t61-t62-t63-t64-t65,t102,t113,t119,t35,t11.*(-1.344539989554982)+t36-t37+t38+t39-t40-t42.*3.016470997243077e-2+t43+t44+t45+t46+t47+t48+t49+t50+t51-t12.*t13.*8.9897236e-2+1.554117566906292e1,t69,t103,t115,t81,t17+t18+t19+t20+t21+t22+t23+t24+t25+t26+t27+t28+t29+t30+t31+t32+t33+t34-t2.*t3.*t15.*6.48785461e-2-t2.*t3.*t4.*t15.*2.087031903568372-t2.*t3.*t9.*t15.*3.197481235e-2-t2.*t11.*t12.*t15.*6.032941994486155e-2-t3.*t11.*t14.*t15.*6.032941994486155e-2-t2.*t3.*t4.*t9.*t15.*3.71847658e-2-t2.*t3.*t4.*t10.*t15.*2.70139017198324e-1-t2.*t3.*t4.*t11.*t15.*1.344539989554982-t2.*t3.*t5.*t13.*t16.*1.35069508599162e-1-t2.*t3.*t4.*t9.*t13.*t15.*6.032941994486155e-2-t2.*t9.*t10.*t12.*t13.*t15.*1.35069508599162e-1-t3.*t9.*t10.*t13.*t14.*t15.*1.35069508599162e-1-t4.*t10.*t11.*t12.*t14.*t15.*1.35069508599162e-1-t5.*t8.*t12.*t13.*t14.*t16.*2.70139017198324e-1,t69,-t37-t40+t43+t44+t45+t46+t47+t48+t49+t50+t51-t70-t71+7.694484764996411,t72+t73+t74+t75-t104-t105,t116,t81,t102,t103,t72+t73+t74+t75-t11.*t15.*6.032941994486155e-2-t9.*t10.*t13.*t15.*1.35069508599162e-1,-t48+t70+t71+t106+3.07139830597608,t117,t13.*(-2.665054366083109e-1),t113,t115,t116,t117,t16.^2.*(-1.35069508599162e-1)+2.688026855534947,0.0,t119,t81,t81,t13.*(-2.665054366083109e-1),0.0,2.665054366083109e-1],[6,6]);