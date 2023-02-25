Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqdt-0004lA-8d
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdr-0004j9-Ji
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:55 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdl-0001T0-Pa
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:55 -0500
Received: by mail-pl1-x641.google.com with SMTP id e5so1869252plg.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOBtvFMoY0KEyRlCMgows0z9/m76rQnQOiGjaEjvbyI=;
 b=V1rKvvsSkm6ZMtl1X+7JL5BXxStuKfCRkKfIK/h/o9gYBaPbR5yWe/Jyqm0blYdWGt
 acSPmLWLYOmErAKpipFlzb7Tyzam+dHNMm0GPKH1sMpWKGE7jZdmSCaeVX1E7dJ1RZlJ
 NlO8FEEDGTo4PR5/rCtSHRdV0UWIAoTVRkxM+DjXYbUrfhfg1Z8ahjicopAaVldjiXbg
 EV63dp70gLXm1u0LLcJdqhVCT12pMcTEp4aVHqekWDO8mYbVFHg76/eO/0SIg5pZ6c5x
 cnqV73nSnAEgSuYlE1BNlLpfvIermQkMuhqjbC+mEnClcKO/1ERhd8767cfRvGuV6Bm+
 nyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOBtvFMoY0KEyRlCMgows0z9/m76rQnQOiGjaEjvbyI=;
 b=0WoclWosxjLtQKen97Y11ycufcbuuRigI+fVmXlOAzaNJhkzJTV9t+iTIfJfe1c1WF
 240g9QT7KmBbwd/GrIKmYvhp4FMzdT/DTROKB2BQ+2OT4DicblhlaS/bTt2ySPeUusM+
 jxDPj0kXPbaPgAZEmAztog7Cgo0XRVQt96YPfdOXPqsH5jNs3kRMnzUo3/IDw5hvvo1N
 ErZBQEkVzN6C021NF3rL07ND8MsvAKAvuHXDiDb93lmDwQSPRqhBxwbz6lOMnMU2d7H4
 QCTHFNY16byJ5Y91Gj6HDBRUv0VFz9hPuY10KvmqUeubL9KR9TarSPDI66slEeMrgLOH
 tOvg==
X-Gm-Message-State: AO0yUKUmAuCbWfSgYKeMelqsW4DhKods7oLjdD3ncmIU27umO+SbRSM3
 6GteqT16Yv7iz1a/gOxfn/nJJg==
X-Google-Smtp-Source: AK7set/47FdfI4TWHH4xEqtpXT3VeYYDYH/szNdAbieWWHVYotfIiErOB4YYxhNMoysmxJ5eGX2Lrw==
X-Received: by 2002:a17:902:cecf:b0:19c:f476:4793 with SMTP id
 d15-20020a170902cecf00b0019cf4764793mr801884plg.51.1677316488103; 
 Sat, 25 Feb 2023 01:14:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 06/76] target/arm: Drop tcg_temp_free from translator.c
Date: Fri, 24 Feb 2023 23:13:17 -1000
Message-Id: <20230225091427.1817156-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Feb 2023 09:14:55 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 266 +----------------------------------------
 1 file changed, 5 insertions(+), 261 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f76a83b473..645bcf8d0a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -195,7 +195,6 @@ void store_cpu_offset(TCGv_i32 var, int offset, int size)
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free_i32(var);
 }
 
 /* Save the syndrome information for a Data Abort */
@@ -325,7 +324,6 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
         tcg_gen_andi_i32(var, var, ~3);
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
-    tcg_temp_free_i32(var);
 }
 
 /*
@@ -420,12 +418,10 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
     tcg_gen_ext16s_i32(tmp1, a);
     tcg_gen_ext16s_i32(tmp2, b);
     tcg_gen_mul_i32(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
     tcg_gen_sari_i32(a, a, 16);
     tcg_gen_sari_i32(b, b, 16);
     tcg_gen_mul_i32(b, b, a);
     tcg_gen_mov_i32(a, tmp1);
-    tcg_temp_free_i32(tmp1);
 }
 
 /* Byteswap each halfword.  */
@@ -438,7 +434,6 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
     tcg_gen_and_i32(var, var, mask);
     tcg_gen_shli_i32(var, var, 8);
     tcg_gen_or_i32(dest, var, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 /* Byteswap low halfword and sign extend.  */
@@ -463,7 +458,6 @@ static void gen_add16(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(t1, t1, ~0x8000);
     tcg_gen_add_i32(t0, t0, t1);
     tcg_gen_xor_i32(dest, t0, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 /* Set N and Z flags from var.  */
@@ -498,7 +492,6 @@ static void gen_add_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_xor_i32(cpu_VF, cpu_NF, t0);
     tcg_gen_xor_i32(tmp, t0, t1);
     tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
-    tcg_temp_free_i32(tmp);
     tcg_gen_mov_i32(dest, cpu_NF);
 }
 
@@ -519,14 +512,11 @@ static void gen_adc_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
         tcg_gen_extu_i32_i64(q1, cpu_CF);
         tcg_gen_add_i64(q0, q0, q1);
         tcg_gen_extr_i64_i32(cpu_NF, cpu_CF, q0);
-        tcg_temp_free_i64(q0);
-        tcg_temp_free_i64(q1);
     }
     tcg_gen_mov_i32(cpu_ZF, cpu_NF);
     tcg_gen_xor_i32(cpu_VF, cpu_NF, t0);
     tcg_gen_xor_i32(tmp, t0, t1);
     tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
-    tcg_temp_free_i32(tmp);
     tcg_gen_mov_i32(dest, cpu_NF);
 }
 
@@ -541,7 +531,6 @@ static void gen_sub_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
     tmp = tcg_temp_new_i32();
     tcg_gen_xor_i32(tmp, t0, t1);
     tcg_gen_and_i32(cpu_VF, cpu_VF, tmp);
-    tcg_temp_free_i32(tmp);
     tcg_gen_mov_i32(dest, cpu_NF);
 }
 
@@ -551,7 +540,6 @@ static void gen_sbc_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_not_i32(tmp, t1);
     gen_adc_CC(dest, t0, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 #define GEN_SHIFT(name)                                               \
@@ -564,8 +552,6 @@ static void gen_##name(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)       \
     tcg_gen_##name##_i32(tmpd, t0, tmp1);                             \
     tcg_gen_andi_i32(tmp1, t1, 0xe0);                                 \
     tcg_gen_movcond_i32(TCG_COND_NE, dest, tmp1, zero, zero, tmpd);   \
-    tcg_temp_free_i32(tmpd);                                          \
-    tcg_temp_free_i32(tmp1);                                          \
 }
 GEN_SHIFT(shl)
 GEN_SHIFT(shr)
@@ -578,7 +564,6 @@ static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp1, t1, 0xff);
     tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
     tcg_gen_sar_i32(dest, t0, tmp1);
-    tcg_temp_free_i32(tmp1);
 }
 
 static void shifter_out_im(TCGv_i32 var, int shift)
@@ -631,7 +616,6 @@ static inline void gen_arm_shift_im(TCGv_i32 var, int shiftop,
                 shifter_out_im(var, 0);
             tcg_gen_shri_i32(var, var, 1);
             tcg_gen_or_i32(var, var, tmp);
-            tcg_temp_free_i32(tmp);
         }
     }
 };
@@ -661,7 +645,6 @@ static inline void gen_arm_shift_reg(TCGv_i32 var, int shiftop,
                 tcg_gen_rotr_i32(var, var, shift); break;
         }
     }
-    tcg_temp_free_i32(shift);
 }
 
 /*
@@ -875,7 +858,6 @@ static inline void gen_bxns(DisasContext *s, int rm)
      *    "zeroes the IT bits" as our UNPREDICTABLE behaviour otherwise.
      */
     gen_helper_v7m_bxns(cpu_env, var);
-    tcg_temp_free_i32(var);
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -889,7 +871,6 @@ static inline void gen_blxns(DisasContext *s, int rm)
      */
     gen_update_pc(s, curr_insn_len(s));
     gen_helper_v7m_blxns(cpu_env, var);
-    tcg_temp_free_i32(var);
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -969,7 +950,6 @@ void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
 }
 
 void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
@@ -977,7 +957,6 @@ void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_st_i32(val, addr, index, opc);
-    tcg_temp_free(addr);
 }
 
 void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
@@ -991,7 +970,6 @@ void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
     if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
-    tcg_temp_free(addr);
 }
 
 void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
@@ -1004,11 +982,9 @@ void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-        tcg_temp_free_i64(tmp);
     } else {
         tcg_gen_qemu_st_i64(val, addr, index, opc);
     }
-    tcg_temp_free(addr);
 }
 
 void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
@@ -1320,7 +1296,6 @@ static inline TCGv_i32 iwmmxt_load_creg(int reg)
 static inline void iwmmxt_store_creg(int reg, TCGv_i32 var)
 {
     tcg_gen_st_i32(var, cpu_env, offsetof(CPUARMState, iwmmxt.cregs[reg]));
-    tcg_temp_free_i32(var);
 }
 
 static inline void gen_op_iwmmxt_movq_wRn_M0(int rn)
@@ -1479,10 +1454,9 @@ static inline int gen_iwmmxt_address(DisasContext *s, uint32_t insn,
         else
             tcg_gen_addi_i32(tmp, tmp, -offset);
         tcg_gen_mov_i32(dest, tmp);
-        if (insn & (1 << 21))
+        if (insn & (1 << 21)) {
             store_reg(s, rd, tmp);
-        else
-            tcg_temp_free_i32(tmp);
+        }
     } else if (insn & (1 << 21)) {
         /* Post indexed */
         tcg_gen_mov_i32(dest, tmp);
@@ -1514,7 +1488,6 @@ static inline int gen_iwmmxt_shift(uint32_t insn, uint32_t mask, TCGv_i32 dest)
     }
     tcg_gen_andi_i32(tmp, tmp, mask);
     tcg_gen_mov_i32(dest, tmp);
-    tcg_temp_free_i32(tmp);
     return 0;
 }
 
@@ -1547,7 +1520,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         wrd = (insn >> 12) & 0xf;
         addr = tcg_temp_new_i32();
         if (gen_iwmmxt_address(s, insn, addr)) {
-            tcg_temp_free_i32(addr);
             return 1;
         }
         if (insn & ARM_CP_RW_BIT) {
@@ -1575,7 +1547,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
                 }
                 if (i) {
                     tcg_gen_extu_i32_i64(cpu_M0, tmp);
-                    tcg_temp_free_i32(tmp);
                 }
                 gen_op_iwmmxt_movq_wRn_M0(wrd);
             }
@@ -1603,9 +1574,7 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
                     }
                 }
             }
-            tcg_temp_free_i32(tmp);
         }
-        tcg_temp_free_i32(addr);
         return 0;
     }
 
@@ -1640,7 +1609,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             tmp = iwmmxt_load_creg(wrd);
             tmp2 = load_reg(s, rd);
             tcg_gen_andc_i32(tmp, tmp, tmp2);
-            tcg_temp_free_i32(tmp2);
             iwmmxt_store_creg(wrd, tmp);
             break;
         case ARM_IWMMXT_wCGR0:
@@ -1853,7 +1821,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         tcg_gen_andi_i32(tmp, tmp, 7);
         iwmmxt_load_reg(cpu_V1, rd1);
         gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1, tmp);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -1881,7 +1848,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
         }
         gen_helper_iwmmxt_insr(cpu_M0, cpu_M0, tmp, tmp2, tmp3);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -1935,7 +1901,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         }
         tcg_gen_shli_i32(tmp, tmp, 28);
         gen_set_nzcv(tmp);
-        tcg_temp_free_i32(tmp);
         break;
     case 0x401: case 0x405: case 0x409: case 0x40d:     /* TBCST */
         if (((insn >> 6) & 3) == 3)
@@ -1954,7 +1919,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             gen_helper_iwmmxt_bcstl(cpu_M0, tmp);
             break;
         }
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -1983,8 +1947,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             break;
         }
         gen_set_nzcv(tmp);
-        tcg_temp_free_i32(tmp2);
-        tcg_temp_free_i32(tmp);
         break;
     case 0x01c: case 0x41c: case 0x81c: case 0xc1c:     /* WACC */
         wrd = (insn >> 12) & 0xf;
@@ -2031,8 +1993,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             break;
         }
         gen_set_nzcv(tmp);
-        tcg_temp_free_i32(tmp2);
-        tcg_temp_free_i32(tmp);
         break;
     case 0x103: case 0x503: case 0x903: case 0xd03:     /* TMOVMSK */
         rd = (insn >> 12) & 0xf;
@@ -2157,7 +2117,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(rd0);
         tmp = tcg_temp_new_i32();
         if (gen_iwmmxt_shift(insn, 0xff, tmp)) {
-            tcg_temp_free_i32(tmp);
             return 1;
         }
         switch ((insn >> 22) & 3) {
@@ -2171,7 +2130,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             gen_helper_iwmmxt_srlq(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         }
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
@@ -2185,7 +2143,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(rd0);
         tmp = tcg_temp_new_i32();
         if (gen_iwmmxt_shift(insn, 0xff, tmp)) {
-            tcg_temp_free_i32(tmp);
             return 1;
         }
         switch ((insn >> 22) & 3) {
@@ -2199,7 +2156,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             gen_helper_iwmmxt_sraq(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         }
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
@@ -2213,7 +2169,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(rd0);
         tmp = tcg_temp_new_i32();
         if (gen_iwmmxt_shift(insn, 0xff, tmp)) {
-            tcg_temp_free_i32(tmp);
             return 1;
         }
         switch ((insn >> 22) & 3) {
@@ -2227,7 +2182,6 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             gen_helper_iwmmxt_sllq(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         }
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
@@ -2243,27 +2197,23 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         switch ((insn >> 22) & 3) {
         case 1:
             if (gen_iwmmxt_shift(insn, 0xf, tmp)) {
-                tcg_temp_free_i32(tmp);
                 return 1;
             }
             gen_helper_iwmmxt_rorw(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         case 2:
             if (gen_iwmmxt_shift(insn, 0x1f, tmp)) {
-                tcg_temp_free_i32(tmp);
                 return 1;
             }
             gen_helper_iwmmxt_rorl(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         case 3:
             if (gen_iwmmxt_shift(insn, 0x3f, tmp)) {
-                tcg_temp_free_i32(tmp);
                 return 1;
             }
             gen_helper_iwmmxt_rorq(cpu_M0, cpu_env, cpu_M0, tmp);
             break;
         }
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
@@ -2502,12 +2452,8 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             gen_helper_iwmmxt_muladdswl(cpu_M0, cpu_M0, tmp, tmp2);
             break;
         default:
-            tcg_temp_free_i32(tmp2);
-            tcg_temp_free_i32(tmp);
             return 1;
         }
-        tcg_temp_free_i32(tmp2);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -2556,8 +2502,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
         default:
             return 1;
         }
-        tcg_temp_free_i32(tmp2);
-        tcg_temp_free_i32(tmp);
 
         gen_op_iwmmxt_movq_wRn_M0(acc);
         return 0;
@@ -2734,7 +2678,6 @@ static int gen_set_psr(DisasContext *s, uint32_t mask, int spsr, TCGv_i32 t0)
     } else {
         gen_set_cpsr(t0, mask);
     }
-    tcg_temp_free_i32(t0);
     gen_lookup_tb(s);
     return 0;
 }
@@ -2882,7 +2825,6 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
             gen_exception_insn_el_v(s, 0, EXCP_UDEF,
                                     syn_uncategorized(), tcg_el);
-            tcg_temp_free_i32(tcg_el);
             return false;
         }
         break;
@@ -2926,7 +2868,6 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     gen_helper_msr_banked(cpu_env, tcg_reg,
                           tcg_constant_i32(tgtmode),
                           tcg_constant_i32(regno));
-    tcg_temp_free_i32(tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
@@ -2957,7 +2898,6 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 static void store_pc_exc_ret(DisasContext *s, TCGv_i32 pc)
 {
     tcg_gen_mov_i32(cpu_R[15], pc);
-    tcg_temp_free_i32(pc);
 }
 
 /* Generate a v6 exception return.  Marks both values as dead.  */
@@ -2972,7 +2912,6 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
         gen_io_start();
     }
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
-    tcg_temp_free_i32(cpsr);
     /* Must exit loop to check un-masked IRQs */
     s->base.is_jmp = DISAS_EXIT;
 }
@@ -2992,7 +2931,6 @@ static void gen_gvec_fn3_qc(uint32_t rd_ofs, uint32_t rn_ofs, uint32_t rm_ofs,
     tcg_gen_addi_ptr(qc_ptr, cpu_env, offsetof(CPUARMState, vfp.qc));
     tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, qc_ptr,
                        opr_sz, max_sz, 0, fn);
-    tcg_temp_free_ptr(qc_ptr);
 }
 
 void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -3238,7 +3176,6 @@ static void gen_srshr8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
     tcg_gen_vec_sar8i_i64(d, a, sh);
     tcg_gen_vec_add8_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3249,7 +3186,6 @@ static void gen_srshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
     tcg_gen_vec_sar16i_i64(d, a, sh);
     tcg_gen_vec_add16_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
@@ -3265,7 +3201,6 @@ static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
     tcg_gen_extract_i32(t, a, sh - 1, 1);
     tcg_gen_sari_i32(d, a, sh);
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3275,7 +3210,6 @@ static void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_extract_i64(t, a, sh - 1, 1);
     tcg_gen_sari_i64(d, a, sh);
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
@@ -3288,9 +3222,6 @@ static void gen_srshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
     tcg_gen_and_vec(vece, t, t, ones);
     tcg_gen_sari_vec(vece, d, a, sh);
     tcg_gen_add_vec(vece, d, d, t);
-
-    tcg_temp_free_vec(t);
-    tcg_temp_free_vec(ones);
 }
 
 void gen_gvec_srshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -3346,7 +3277,6 @@ static void gen_srsra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 
     gen_srshr8_i64(t, a, sh);
     tcg_gen_vec_add8_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srsra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3355,7 +3285,6 @@ static void gen_srsra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 
     gen_srshr16_i64(t, a, sh);
     tcg_gen_vec_add16_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srsra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
@@ -3364,7 +3293,6 @@ static void gen_srsra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 
     gen_srshr32_i32(t, a, sh);
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_srsra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3373,7 +3301,6 @@ static void gen_srsra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 
     gen_srshr64_i64(t, a, sh);
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_srsra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
@@ -3382,7 +3309,6 @@ static void gen_srsra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 
     gen_srshr_vec(vece, t, a, sh);
     tcg_gen_add_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -3445,7 +3371,6 @@ static void gen_urshr8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
     tcg_gen_vec_shr8i_i64(d, a, sh);
     tcg_gen_vec_add8_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_urshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3456,7 +3381,6 @@ static void gen_urshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
     tcg_gen_vec_shr16i_i64(d, a, sh);
     tcg_gen_vec_add16_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
@@ -3472,7 +3396,6 @@ static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
     tcg_gen_extract_i32(t, a, sh - 1, 1);
     tcg_gen_shri_i32(d, a, sh);
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3482,7 +3405,6 @@ static void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_extract_i64(t, a, sh - 1, 1);
     tcg_gen_shri_i64(d, a, sh);
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_urshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t shift)
@@ -3495,9 +3417,6 @@ static void gen_urshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t shift)
     tcg_gen_and_vec(vece, t, t, ones);
     tcg_gen_shri_vec(vece, d, a, shift);
     tcg_gen_add_vec(vece, d, d, t);
-
-    tcg_temp_free_vec(t);
-    tcg_temp_free_vec(ones);
 }
 
 void gen_gvec_urshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -3556,7 +3475,6 @@ static void gen_ursra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
         gen_urshr8_i64(t, a, sh);
     }
     tcg_gen_vec_add8_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_ursra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3569,7 +3487,6 @@ static void gen_ursra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
         gen_urshr16_i64(t, a, sh);
     }
     tcg_gen_vec_add16_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_ursra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
@@ -3582,7 +3499,6 @@ static void gen_ursra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
         gen_urshr32_i32(t, a, sh);
     }
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_ursra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
@@ -3595,7 +3511,6 @@ static void gen_ursra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
         gen_urshr64_i64(t, a, sh);
     }
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_ursra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
@@ -3608,7 +3523,6 @@ static void gen_ursra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
         gen_urshr_vec(vece, t, a, sh);
     }
     tcg_gen_add_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -3661,7 +3575,6 @@ static void gen_shr8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
     tcg_gen_andi_i64(t, t, mask);
     tcg_gen_andi_i64(d, d, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_shr16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
@@ -3673,7 +3586,6 @@ static void gen_shr16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
     tcg_gen_andi_i64(t, t, mask);
     tcg_gen_andi_i64(d, d, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_shr32_ins_i32(TCGv_i32 d, TCGv_i32 a, int32_t shift)
@@ -3697,9 +3609,6 @@ static void gen_shr_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
     tcg_gen_shri_vec(vece, t, a, sh);
     tcg_gen_and_vec(vece, d, d, m);
     tcg_gen_or_vec(vece, d, d, t);
-
-    tcg_temp_free_vec(t);
-    tcg_temp_free_vec(m);
 }
 
 void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -3756,7 +3665,6 @@ static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
     tcg_gen_andi_i64(t, t, mask);
     tcg_gen_andi_i64(d, d, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_shl16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
@@ -3768,7 +3676,6 @@ static void gen_shl16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
     tcg_gen_andi_i64(t, t, mask);
     tcg_gen_andi_i64(d, d, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_shl32_ins_i32(TCGv_i32 d, TCGv_i32 a, int32_t shift)
@@ -3790,9 +3697,6 @@ static void gen_shl_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
     tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK(0, sh));
     tcg_gen_and_vec(vece, d, d, m);
     tcg_gen_or_vec(vece, d, d, t);
-
-    tcg_temp_free_vec(t);
-    tcg_temp_free_vec(m);
 }
 
 void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
@@ -4033,11 +3937,6 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_gen_shr_i32(rval, src, rsh);
     tcg_gen_movcond_i32(TCG_COND_LTU, dst, lsh, max, lval, zero);
     tcg_gen_movcond_i32(TCG_COND_LTU, dst, rsh, max, rval, dst);
-
-    tcg_temp_free_i32(lval);
-    tcg_temp_free_i32(rval);
-    tcg_temp_free_i32(lsh);
-    tcg_temp_free_i32(rsh);
 }
 
 void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4060,11 +3959,6 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_gen_shr_i64(rval, src, rsh);
     tcg_gen_movcond_i64(TCG_COND_LTU, dst, lsh, max, lval, zero);
     tcg_gen_movcond_i64(TCG_COND_LTU, dst, rsh, max, rval, dst);
-
-    tcg_temp_free_i64(lval);
-    tcg_temp_free_i64(rval);
-    tcg_temp_free_i64(lsh);
-    tcg_temp_free_i64(rsh);
 }
 
 static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
@@ -4084,7 +3978,6 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
         tcg_gen_dupi_vec(vece, msk, 0xff);
         tcg_gen_and_vec(vece, lsh, shift, msk);
         tcg_gen_and_vec(vece, rsh, rsh, msk);
-        tcg_temp_free_vec(msk);
     }
 
     /*
@@ -4117,12 +4010,6 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
         tcg_gen_and_vec(vece, rval, rval, rsh);
     }
     tcg_gen_or_vec(vece, dst, lval, rval);
-
-    tcg_temp_free_vec(max);
-    tcg_temp_free_vec(lval);
-    tcg_temp_free_vec(rval);
-    tcg_temp_free_vec(lsh);
-    tcg_temp_free_vec(rsh);
 }
 
 void gen_gvec_ushl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4174,11 +4061,6 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_gen_sar_i32(rval, src, rsh);
     tcg_gen_movcond_i32(TCG_COND_LEU, lval, lsh, max, lval, zero);
     tcg_gen_movcond_i32(TCG_COND_LT, dst, lsh, zero, rval, lval);
-
-    tcg_temp_free_i32(lval);
-    tcg_temp_free_i32(rval);
-    tcg_temp_free_i32(lsh);
-    tcg_temp_free_i32(rsh);
 }
 
 void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4202,11 +4084,6 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_gen_sar_i64(rval, src, rsh);
     tcg_gen_movcond_i64(TCG_COND_LEU, lval, lsh, max, lval, zero);
     tcg_gen_movcond_i64(TCG_COND_LT, dst, lsh, zero, rval, lval);
-
-    tcg_temp_free_i64(lval);
-    tcg_temp_free_i64(rval);
-    tcg_temp_free_i64(lsh);
-    tcg_temp_free_i64(rsh);
 }
 
 static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
@@ -4251,12 +4128,6 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
         tcg_gen_dupi_vec(vece, tmp, 0x80);
         tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, tmp, lval, rval);
     }
-
-    tcg_temp_free_vec(lval);
-    tcg_temp_free_vec(rval);
-    tcg_temp_free_vec(lsh);
-    tcg_temp_free_vec(rsh);
-    tcg_temp_free_vec(tmp);
 }
 
 void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4295,7 +4166,6 @@ static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
     tcg_gen_usadd_vec(vece, t, a, b);
     tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
     tcg_gen_or_vec(vece, sat, sat, x);
-    tcg_temp_free_vec(x);
 }
 
 void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4338,7 +4208,6 @@ static void gen_sqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
     tcg_gen_ssadd_vec(vece, t, a, b);
     tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
     tcg_gen_or_vec(vece, sat, sat, x);
-    tcg_temp_free_vec(x);
 }
 
 void gen_gvec_sqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4381,7 +4250,6 @@ static void gen_uqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
     tcg_gen_ussub_vec(vece, t, a, b);
     tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
     tcg_gen_or_vec(vece, sat, sat, x);
-    tcg_temp_free_vec(x);
 }
 
 void gen_gvec_uqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4424,7 +4292,6 @@ static void gen_sqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
     tcg_gen_sssub_vec(vece, t, a, b);
     tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
     tcg_gen_or_vec(vece, sat, sat, x);
-    tcg_temp_free_vec(x);
 }
 
 void gen_gvec_sqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4466,7 +4333,6 @@ static void gen_sabd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     tcg_gen_sub_i32(t, a, b);
     tcg_gen_sub_i32(d, b, a);
     tcg_gen_movcond_i32(TCG_COND_LT, d, a, b, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_sabd_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -4476,7 +4342,6 @@ static void gen_sabd_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_sub_i64(t, a, b);
     tcg_gen_sub_i64(d, b, a);
     tcg_gen_movcond_i64(TCG_COND_LT, d, a, b, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_sabd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
@@ -4486,7 +4351,6 @@ static void gen_sabd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
     tcg_gen_smin_vec(vece, t, a, b);
     tcg_gen_smax_vec(vece, d, a, b);
     tcg_gen_sub_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_sabd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4526,7 +4390,6 @@ static void gen_uabd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     tcg_gen_sub_i32(t, a, b);
     tcg_gen_sub_i32(d, b, a);
     tcg_gen_movcond_i32(TCG_COND_LTU, d, a, b, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_uabd_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -4536,7 +4399,6 @@ static void gen_uabd_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_sub_i64(t, a, b);
     tcg_gen_sub_i64(d, b, a);
     tcg_gen_movcond_i64(TCG_COND_LTU, d, a, b, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_uabd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
@@ -4546,7 +4408,6 @@ static void gen_uabd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
     tcg_gen_umin_vec(vece, t, a, b);
     tcg_gen_umax_vec(vece, d, a, b);
     tcg_gen_sub_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_uabd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4584,7 +4445,6 @@ static void gen_saba_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     TCGv_i32 t = tcg_temp_new_i32();
     gen_sabd_i32(t, a, b);
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_saba_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -4592,7 +4452,6 @@ static void gen_saba_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     TCGv_i64 t = tcg_temp_new_i64();
     gen_sabd_i64(t, a, b);
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_saba_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
@@ -4600,7 +4459,6 @@ static void gen_saba_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
     TCGv_vec t = tcg_temp_new_vec_matching(d);
     gen_sabd_vec(vece, t, a, b);
     tcg_gen_add_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_saba(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4643,7 +4501,6 @@ static void gen_uaba_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
     TCGv_i32 t = tcg_temp_new_i32();
     gen_uabd_i32(t, a, b);
     tcg_gen_add_i32(d, d, t);
-    tcg_temp_free_i32(t);
 }
 
 static void gen_uaba_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -4651,7 +4508,6 @@ static void gen_uaba_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     TCGv_i64 t = tcg_temp_new_i64();
     gen_uabd_i64(t, a, b);
     tcg_gen_add_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_uaba_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
@@ -4659,7 +4515,6 @@ static void gen_uaba_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
     TCGv_vec t = tcg_temp_new_vec_matching(d);
     gen_uabd_vec(vece, t, a, b);
     tcg_gen_add_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 void gen_gvec_uaba(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
@@ -4766,7 +4621,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
             tcg_gen_andi_i32(t, t, 1u << maskbit);
             tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
-            tcg_temp_free_i32(t);
 
             gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
             set_disas_label(s, over);
@@ -4831,7 +4685,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     case 0:
         break;
     case ARM_CP_NOP:
-        goto exit;
+        return;
     case ARM_CP_WFI:
         if (isread) {
             unallocated_encoding(s);
@@ -4839,7 +4693,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             gen_update_pc(s, curr_insn_len(s));
             s->base.is_jmp = DISAS_WFI;
         }
-        goto exit;
+        return;
     default:
         g_assert_not_reached();
     }
@@ -4870,7 +4724,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             store_reg(s, rt, tmp);
             tmp = tcg_temp_new_i32();
             tcg_gen_extrh_i64_i32(tmp, tmp64);
-            tcg_temp_free_i64(tmp64);
             store_reg(s, rt2, tmp);
         } else {
             TCGv_i32 tmp;
@@ -4890,7 +4743,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                  * the condition codes from the high 4 bits of the value
                  */
                 gen_set_nzcv(tmp);
-                tcg_temp_free_i32(tmp);
             } else {
                 store_reg(s, rt, tmp);
             }
@@ -4899,7 +4751,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         /* Write */
         if (ri->type & ARM_CP_CONST) {
             /* If not forbidden by access permissions, treat as WI */
-            goto exit;
+            return;
         }
 
         if (is64) {
@@ -4908,8 +4760,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             tmplo = load_reg(s, rt);
             tmphi = load_reg(s, rt2);
             tcg_gen_concat_i32_i64(tmp64, tmplo, tmphi);
-            tcg_temp_free_i32(tmplo);
-            tcg_temp_free_i32(tmphi);
             if (ri->writefn) {
                 if (!tcg_ri) {
                     tcg_ri = gen_lookup_cp_reg(key);
@@ -4918,7 +4768,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             } else {
                 tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
             }
-            tcg_temp_free_i64(tmp64);
         } else {
             TCGv_i32 tmp = load_reg(s, rt);
             if (ri->writefn) {
@@ -4926,7 +4775,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                     tcg_ri = gen_lookup_cp_reg(key);
                 }
                 gen_helper_set_cp_reg(cpu_env, tcg_ri, tmp);
-                tcg_temp_free_i32(tmp);
             } else {
                 store_cpu_offset(tmp, ri->fieldoffset, 4);
             }
@@ -4953,11 +4801,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     if (need_exit_tb) {
         gen_lookup_tb(s);
     }
-
- exit:
-    if (tcg_ri) {
-        tcg_temp_free_ptr(tcg_ri);
-    }
 }
 
 /* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
@@ -5002,10 +4845,7 @@ static void gen_addq(DisasContext *s, TCGv_i64 val, int rlow, int rhigh)
     tmph = load_reg(s, rhigh);
     tmp = tcg_temp_new_i64();
     tcg_gen_concat_i32_i64(tmp, tmpl, tmph);
-    tcg_temp_free_i32(tmpl);
-    tcg_temp_free_i32(tmph);
     tcg_gen_add_i64(val, val, tmp);
-    tcg_temp_free_i64(tmp);
 }
 
 /* Set N and Z flags from hi|lo.  */
@@ -5044,15 +4884,12 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
         tcg_gen_qemu_ld_i64(t64, taddr, get_mem_index(s), opc);
-        tcg_temp_free(taddr);
         tcg_gen_mov_i64(cpu_exclusive_val, t64);
         if (s->be_data == MO_BE) {
             tcg_gen_extr_i64_i32(tmp2, tmp, t64);
         } else {
             tcg_gen_extr_i64_i32(tmp, tmp2, t64);
         }
-        tcg_temp_free_i64(t64);
-
         store_reg(s, rt2, tmp2);
     } else {
         gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), opc);
@@ -5089,7 +4926,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     extaddr = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(extaddr, addr);
     tcg_gen_brcond_i64(TCG_COND_NE, extaddr, cpu_exclusive_addr, fail_label);
-    tcg_temp_free_i64(extaddr);
 
     taddr = gen_aa32_addr(s, addr, opc);
     t0 = tcg_temp_new_i32();
@@ -5114,27 +4950,19 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         } else {
             tcg_gen_concat_i32_i64(n64, t1, t2);
         }
-        tcg_temp_free_i32(t2);
 
         tcg_gen_atomic_cmpxchg_i64(o64, taddr, cpu_exclusive_val, n64,
                                    get_mem_index(s), opc);
-        tcg_temp_free_i64(n64);
 
         tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);
         tcg_gen_extrl_i64_i32(t0, o64);
-
-        tcg_temp_free_i64(o64);
     } else {
         t2 = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(t2, cpu_exclusive_val);
         tcg_gen_atomic_cmpxchg_i32(t0, taddr, t2, t1, get_mem_index(s), opc);
         tcg_gen_setcond_i32(TCG_COND_NE, t0, t0, t2);
-        tcg_temp_free_i32(t2);
     }
-    tcg_temp_free_i32(t1);
-    tcg_temp_free(taddr);
     tcg_gen_mov_i32(cpu_R[rd], t0);
-    tcg_temp_free_i32(t0);
     tcg_gen_br(done_label);
 
     gen_set_label(fail_label);
@@ -5236,11 +5064,9 @@ static void gen_srs(DisasContext *s,
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
     gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
     gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
         case 0:
@@ -5261,7 +5087,6 @@ static void gen_srs(DisasContext *s,
         tcg_gen_addi_i32(addr, addr, offset);
         gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
     }
-    tcg_temp_free_i32(addr);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
@@ -5453,7 +5278,6 @@ static bool store_reg_kind(DisasContext *s, int rd,
 {
     switch (kind) {
     case STREG_NONE:
-        tcg_temp_free_i32(val);
         return true;
     case STREG_NORMAL:
         /* See ALUWritePC: Interworking only from a32 mode. */
@@ -5490,7 +5314,6 @@ static bool op_s_rrr_shi(DisasContext *s, arg_s_rrr_shi *a,
     tmp1 = load_reg(s, a->rn);
 
     gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
 
     if (logic_cc) {
         gen_logic_CC(tmp1);
@@ -5532,7 +5355,6 @@ static bool op_s_rrr_shr(DisasContext *s, arg_s_rrr_shr *a,
     tmp1 = load_reg(s, a->rn);
 
     gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
 
     if (logic_cc) {
         gen_logic_CC(tmp1);
@@ -5791,7 +5613,6 @@ static bool do_mve_shl_ri(DisasContext *s, arg_mve_shl_ri *a,
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
 
     return true;
 }
@@ -5875,7 +5696,6 @@ static bool do_mve_shl_rr(DisasContext *s, arg_mve_shl_rr *a, WideShiftFn *fn)
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
 
     return true;
 }
@@ -6003,11 +5823,9 @@ static bool op_mla(DisasContext *s, arg_s_rrrr *a, bool add)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     tcg_gen_mul_i32(t1, t1, t2);
-    tcg_temp_free_i32(t2);
     if (add) {
         t2 = load_reg(s, a->ra);
         tcg_gen_add_i32(t1, t1, t2);
-        tcg_temp_free_i32(t2);
     }
     if (a->s) {
         gen_logic_CC(t1);
@@ -6036,10 +5854,8 @@ static bool trans_MLS(DisasContext *s, arg_MLS *a)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     tcg_gen_mul_i32(t1, t1, t2);
-    tcg_temp_free_i32(t2);
     t2 = load_reg(s, a->ra);
     tcg_gen_sub_i32(t1, t2, t1);
-    tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -6059,8 +5875,6 @@ static bool op_mlal(DisasContext *s, arg_s_rrrr *a, bool uns, bool add)
         t2 = load_reg(s, a->ra);
         t3 = load_reg(s, a->rd);
         tcg_gen_add2_i32(t0, t1, t0, t1, t2, t3);
-        tcg_temp_free_i32(t2);
-        tcg_temp_free_i32(t3);
     }
     if (a->s) {
         gen_logicq_cc(t0, t1);
@@ -6106,10 +5920,8 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
     zero = tcg_constant_i32(0);
     t2 = load_reg(s, a->ra);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
-    tcg_temp_free_i32(t2);
     t2 = load_reg(s, a->rd);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
-    tcg_temp_free_i32(t2);
     store_reg(s, a->ra, t0);
     store_reg(s, a->rd, t1);
     return true;
@@ -6139,7 +5951,6 @@ static bool op_qaddsub(DisasContext *s, arg_rrr *a, bool add, bool doub)
     } else {
         gen_helper_sub_saturate(t0, cpu_env, t0, t1);
     }
-    tcg_temp_free_i32(t1);
     store_reg(s, a->rd, t0);
     return true;
 }
@@ -6175,7 +5986,6 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
     t0 = load_reg(s, a->rn);
     t1 = load_reg(s, a->rm);
     gen_mulxy(t0, t1, nt, mt);
-    tcg_temp_free_i32(t1);
 
     switch (add_long) {
     case 0:
@@ -6184,7 +5994,6 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
     case 1:
         t1 = load_reg(s, a->ra);
         gen_helper_add_setq(t0, cpu_env, t0, t1);
-        tcg_temp_free_i32(t1);
         store_reg(s, a->rd, t0);
         break;
     case 2:
@@ -6194,8 +6003,6 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
         t1 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t1, t0, 31);
         tcg_gen_add2_i32(tl, th, tl, th, t0, t1);
-        tcg_temp_free_i32(t0);
-        tcg_temp_free_i32(t1);
         store_reg(s, a->ra, tl);
         store_reg(s, a->rd, th);
         break;
@@ -6248,11 +6055,9 @@ static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
         tcg_gen_shli_i32(t1, t1, 16);
     }
     tcg_gen_muls2_i32(t0, t1, t0, t1);
-    tcg_temp_free_i32(t0);
     if (add) {
         t0 = load_reg(s, a->ra);
         gen_helper_add_setq(t1, cpu_env, t1, t0);
-        tcg_temp_free_i32(t0);
     }
     store_reg(s, a->rd, t1);
     return true;
@@ -6385,7 +6190,6 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     } else {
         gen_helper_crc32(t1, t1, t2, t3);
     }
-    tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -6484,7 +6288,6 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     addr = tcg_constant_i32((a->mask << 10) | a->sysm);
     reg = load_reg(s, a->rn);
     gen_helper_v7m_msr(cpu_env, addr, reg);
-    tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
     gen_rebuild_hflags(s, true);
     gen_lookup_tb(s);
@@ -6694,7 +6497,6 @@ static bool trans_TT(DisasContext *s, arg_TT *a)
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
     gen_helper_v7m_tt(tmp, cpu_env, addr, tcg_constant_i32((a->A << 1) | a->T));
-    tcg_temp_free_i32(addr);
     store_reg(s, a->rd, tmp);
     return true;
 }
@@ -6735,7 +6537,6 @@ static TCGv_i32 op_addr_rr_pre(DisasContext *s, arg_ldst_rr *a)
         } else {
             tcg_gen_sub_i32(addr, addr, ofs);
         }
-        tcg_temp_free_i32(ofs);
     }
     return addr;
 }
@@ -6751,9 +6552,7 @@ static void op_addr_rr_post(DisasContext *s, arg_ldst_rr *a,
         } else {
             tcg_gen_sub_i32(addr, addr, ofs);
         }
-        tcg_temp_free_i32(ofs);
     } else if (!a->w) {
-        tcg_temp_free_i32(addr);
         return;
     }
     tcg_gen_addi_i32(addr, addr, address_offset);
@@ -6800,7 +6599,6 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     tmp = load_reg(s, a->rt);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
-    tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, 0);
     return true;
@@ -6851,13 +6649,11 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
 
     tmp = load_reg(s, a->rt);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
     return true;
@@ -6886,7 +6682,6 @@ static TCGv_i32 op_addr_ri_pre(DisasContext *s, arg_ldst_ri *a)
             TCGv_i32 newsp = tcg_temp_new_i32();
             tcg_gen_addi_i32(newsp, cpu_R[13], ofs);
             gen_helper_v8m_stackcheck(cpu_env, newsp);
-            tcg_temp_free_i32(newsp);
         } else {
             gen_helper_v8m_stackcheck(cpu_env, cpu_R[13]);
         }
@@ -6905,7 +6700,6 @@ static void op_addr_ri_post(DisasContext *s, arg_ldst_ri *a,
             address_offset -= a->imm;
         }
     } else if (!a->w) {
-        tcg_temp_free_i32(addr);
         return;
     }
     tcg_gen_addi_i32(addr, addr, address_offset);
@@ -6952,7 +6746,6 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     tmp = load_reg(s, a->rt);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, mop);
     disas_set_da_iss(s, mop, issinfo);
-    tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, 0);
     return true;
@@ -7006,13 +6799,11 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
 
     tmp = load_reg(s, a->rt);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
     gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
     return true;
@@ -7077,11 +6868,9 @@ static bool op_swp(DisasContext *s, arg_SWP *a, MemOp opc)
     opc |= s->be_data;
     addr = load_reg(s, a->rn);
     taddr = gen_aa32_addr(s, addr, opc);
-    tcg_temp_free_i32(addr);
 
     tmp = load_reg(s, a->rt2);
     tcg_gen_atomic_xchg_i32(tmp, taddr, tmp, get_mem_index(s), opc);
-    tcg_temp_free(taddr);
 
     store_reg(s, a->rt, tmp);
     return true;
@@ -7128,7 +6917,6 @@ static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
     tcg_gen_addi_i32(addr, addr, a->imm);
 
     gen_store_exclusive(s, a->rd, a->rt, a->rt2, addr, mop);
-    tcg_temp_free_i32(addr);
     return true;
 }
 
@@ -7240,8 +7028,6 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(addr);
     return true;
 }
 
@@ -7281,7 +7067,6 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
     tcg_gen_addi_i32(addr, addr, a->imm);
 
     gen_load_exclusive(s, a->rt, a->rt2, addr, mop);
-    tcg_temp_free_i32(addr);
 
     if (acq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -7395,7 +7180,6 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
     tmp = tcg_temp_new_i32();
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
-    tcg_temp_free_i32(addr);
 
     store_reg(s, a->rt, tmp);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
@@ -7432,11 +7216,9 @@ static bool trans_USADA8(DisasContext *s, arg_USADA8 *a)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     gen_helper_usad8(t1, t1, t2);
-    tcg_temp_free_i32(t2);
     if (a->ra != 15) {
         t2 = load_reg(s, a->ra);
         tcg_gen_add_i32(t1, t1, t2);
-        tcg_temp_free_i32(t2);
     }
     store_reg(s, a->rd, t1);
     return true;
@@ -7503,7 +7285,6 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     if (width != 32) {
         TCGv_i32 tmp2 = load_reg(s, a->rd);
         tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-        tcg_temp_free_i32(tmp2);
     }
     store_reg(s, a->rd, tmp);
     return true;
@@ -7535,7 +7316,6 @@ static bool op_par_addsub(DisasContext *s, arg_rrr *a,
 
     gen(t0, t0, t1);
 
-    tcg_temp_free_i32(t1);
     store_reg(s, a->rd, t0);
     return true;
 }
@@ -7560,8 +7340,6 @@ static bool op_par_addsub_ge(DisasContext *s, arg_rrr *a,
     tcg_gen_addi_ptr(ge, cpu_env, offsetof(CPUARMState, GE));
     gen(t0, t0, t1, ge);
 
-    tcg_temp_free_ptr(ge);
-    tcg_temp_free_i32(t1);
     store_reg(s, a->rd, t0);
     return true;
 }
@@ -7652,7 +7430,6 @@ static bool trans_PKH(DisasContext *s, arg_PKH *a)
         tcg_gen_shli_i32(tm, tm, shift);
         tcg_gen_deposit_i32(tn, tm, tn, 0, 16);
     }
-    tcg_temp_free_i32(tm);
     store_reg(s, a->rd, tn);
     return true;
 }
@@ -7727,7 +7504,6 @@ static bool op_xta(DisasContext *s, arg_rrr_rot *a,
     if (a->rn != 15) {
         TCGv_i32 tmp2 = load_reg(s, a->rn);
         gen_add(tmp, tmp, tmp2);
-        tcg_temp_free_i32(tmp2);
     }
     store_reg(s, a->rd, tmp);
     return true;
@@ -7784,8 +7560,6 @@ static bool trans_SEL(DisasContext *s, arg_rrr *a)
     t3 = tcg_temp_new_i32();
     tcg_gen_ld_i32(t3, cpu_env, offsetof(CPUARMState, GE));
     gen_helper_sel_flags(t1, t3, t1, t2);
-    tcg_temp_free_i32(t3);
-    tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -7859,17 +7633,14 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
          * addition of Ra.
          */
         tcg_gen_sub_i32(t1, t1, t2);
-        tcg_temp_free_i32(t2);
 
         if (a->ra != 15) {
             t2 = load_reg(s, a->ra);
             gen_helper_add_setq(t1, cpu_env, t1, t2);
-            tcg_temp_free_i32(t2);
         }
     } else if (a->ra == 15) {
         /* Single saturation-checking addition */
         gen_helper_add_setq(t1, cpu_env, t1, t2);
-        tcg_temp_free_i32(t2);
     } else {
         /*
          * We need to add the products and Ra together and then
@@ -7889,10 +7660,8 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         load_reg_var(s, t2, a->ra);
         tcg_gen_ext_i32_i64(q64, t2);
         tcg_gen_add_i64(p64, p64, q64);
-        tcg_temp_free_i64(q64);
 
         tcg_gen_extr_i64_i32(t1, t2, p64);
-        tcg_temp_free_i64(p64);
         /*
          * t1 is the low half of the result which goes into Rd.
          * We have overflow and must set Q if the high half (t2)
@@ -7904,8 +7673,6 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(t3);
-        tcg_temp_free_i32(t2);
     }
     store_reg(s, a->rd, t1);
     return true;
@@ -7951,19 +7718,15 @@ static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     l2 = tcg_temp_new_i64();
     tcg_gen_ext_i32_i64(l1, t1);
     tcg_gen_ext_i32_i64(l2, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
 
     if (sub) {
         tcg_gen_sub_i64(l1, l1, l2);
     } else {
         tcg_gen_add_i64(l1, l1, l2);
     }
-    tcg_temp_free_i64(l2);
 
     gen_addq(s, l1, a->ra, a->rd);
     gen_storeq_reg(s, a->ra, a->rd, l1);
-    tcg_temp_free_i64(l1);
     return true;
 }
 
@@ -8013,7 +7776,6 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
         } else {
             tcg_gen_add_i32(t1, t1, t3);
         }
-        tcg_temp_free_i32(t3);
     }
     if (round) {
         /*
@@ -8023,7 +7785,6 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
         tcg_gen_shri_i32(t2, t2, 31);
         tcg_gen_add_i32(t1, t1, t2);
     }
-    tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -8065,7 +7826,6 @@ static bool op_div(DisasContext *s, arg_rrr *a, bool u)
     } else {
         gen_helper_sdiv(t1, cpu_env, t1, t2);
     }
-    tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -8137,8 +7897,6 @@ static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
             tcg_gen_addi_i32(addr, addr, -((n - 1) * 4));
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 }
 
@@ -8181,7 +7939,6 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
             tmp = load_reg(s, i);
         }
         gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-        tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
         if (++j != n) {
@@ -8261,7 +8018,6 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             gen_helper_set_user_reg(cpu_env, tcg_constant_i32(i), tmp);
-            tcg_temp_free_i32(tmp);
         } else if (i == a->rn) {
             loaded_var = tmp;
             loaded_base = true;
@@ -8291,7 +8047,6 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
             gen_io_start();
         }
         gen_helper_cpsr_write_eret(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
     }
@@ -8657,7 +8412,6 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         DisasLabel skipexc = gen_disas_label(s);
         tmp = load_cpu_field(v7m.ltpsize);
         tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        tcg_temp_free_i32(tmp);
         gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
         set_disas_label(s, skipexc);
     }
@@ -8687,12 +8441,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
         tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
         tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
-        tcg_temp_free_i32(ltpsize);
 
         tcg_gen_brcond_i32(TCG_COND_LEU, cpu_R[14], decr, loopend.label);
 
         tcg_gen_sub_i32(cpu_R[14], cpu_R[14], decr);
-        tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
     gen_jmp(s, jmp_diff(s, -a->imm));
@@ -8756,8 +8508,6 @@ static bool trans_VCTP(DisasContext *s, arg_VCTP *a)
                         masklen, tcg_constant_i32(1 << (4 - a->size)),
                         rn_shifted, tcg_constant_i32(16));
     gen_helper_mve_vctp(cpu_env, masklen);
-    tcg_temp_free_i32(masklen);
-    tcg_temp_free_i32(rn_shifted);
     /* This insn updates predication bits */
     s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     mve_update_eci(s);
@@ -8780,7 +8530,6 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     tcg_gen_add_i32(tmp, tmp, tmp);
     gen_pc_plus_diff(s, addr, jmp_diff(s, 0));
     tcg_gen_add_i32(tmp, tmp, addr);
-    tcg_temp_free_i32(addr);
     store_reg(s, 15, tmp);
     return true;
 }
@@ -8802,7 +8551,6 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     arm_gen_condlabel(s);
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel.label);
-    tcg_temp_free_i32(tmp);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8869,8 +8617,6 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
         /* Base writeback.  */
         tcg_gen_addi_i32(addr, addr, post_offset[a->pu]);
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     gen_rfe(s, t1, t2);
     return true;
@@ -9114,8 +8860,6 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
 
     store_reg(s, a->rd, rn);
-    tcg_temp_free_i32(rm);
-
     return true;
 }
 
-- 
2.34.1


