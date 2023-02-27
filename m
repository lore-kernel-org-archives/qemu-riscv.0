Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1M-00078y-1W
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1D-0006uw-Ep
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:47 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW15-0007OA-6n
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:47 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5006315pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1emp/tNLeWyW6jIioRs4cMEwuOfQt7qMeQLtGu1o9s=;
 b=ACVjf3q7j8vmBBssv73Elv8QsM47DrhnBh33bjbjEDP/+QLj3qWDwrJe+P/hdtp7Pi
 R+Z2bvFLc3tTw1N06z1LyLIxUHYgthJiMKYpC3I8fzy1nUgs87K4IxygWSGBnWpmUlQp
 /fvoE5RFYfiLs5iXFzvmz+alMJ8bm/89jzNN3tP8jRTXFXzRW9QzTd4BXrpTA3e8q/v7
 z0+Uhw7MB3WffO/PBptE0Xm1GBExfdF6p0aQjJU9GDrG23Q2vRUXDiCjqalosxUfks1g
 xMxOiEtXArAxk3bYby/ZqWk1tJIeA8OJz/8S+8A5hDlYLGC+QcrcG5IrK9PjmrBXCbJJ
 jLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1emp/tNLeWyW6jIioRs4cMEwuOfQt7qMeQLtGu1o9s=;
 b=ASvcJs6p7kavI15en9DN5HR0jILOsHOrp9jDKnOKfk4v6pEXKAKKpoJ1+1/KYuHyoU
 dMC91WksiyXDXQRnxC7i4Dd9Vfw2HhkjAAtXexY9W8FQ7rEKUAGuqm+OteArfkfMXQ57
 6jekfgtu4jOD9Sk1YKVnV87Qx3Na0lJ28IcBLe2AP/LsM/5lLrVXwEpHLDRQFGJSxPBB
 BJz1hNbWwPvCEpuKv1WlqCp6epoArZW6QuNw7P2k4pmZ4MXn5TYy/N1LOdpIaoSCBn1P
 +LPnp0dpC4VlOat+Gd+HzzdtHWg3LbJI8GsnsWodyeFr3NXcfWU4ZRg4Q8I/jlavOp1m
 AITg==
X-Gm-Message-State: AO0yUKUN4ctuDxz/r6c/nqCIVMv3KGb/ZO8ml45tZ/xcBRghGnKMeTIT
 jSkqI5tIy7OiTabGZUMpz1Aeww==
X-Google-Smtp-Source: AK7set9JxoG5uoK7t1NqfS5i75+AGN2UZEU2A9/IovvWIJ9HVMsgijCmXpkBkG8ugsiF9evZ+073pA==
X-Received: by 2002:a17:903:2283:b0:19a:ae30:3a42 with SMTP id
 b3-20020a170903228300b0019aae303a42mr8526570plh.21.1677475537749; 
 Sun, 26 Feb 2023 21:25:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 10/76] target/arm: Drop tcg_temp_free from translator-a64.c
Date: Sun, 26 Feb 2023 19:23:59 -1000
Message-Id: <20230227052505.352889-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:47 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 468 +------------------------------------
 1 file changed, 11 insertions(+), 457 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b5d6508cbc..b1fa210d64 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -542,7 +542,6 @@ static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
 
     tcg_gen_extu_i32_i64(tmp, v);
     write_fp_dreg(s, reg, tmp);
-    tcg_temp_free_i64(tmp);
 }
 
 /* Expand a 2-operand AdvSIMD vector operation using an expander function.  */
@@ -611,7 +610,6 @@ static void gen_gvec_op3_fpst(DisasContext *s, bool is_q, int rd, int rn,
                        vec_full_reg_offset(s, rn),
                        vec_full_reg_offset(s, rm), fpst,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
-    tcg_temp_free_ptr(fpst);
 }
 
 /* Expand a 3-operand + qc + operation using an out-of-line helper.  */
@@ -625,7 +623,6 @@ static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
                        vec_full_reg_offset(s, rn),
                        vec_full_reg_offset(s, rm), qc_ptr,
                        is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
-    tcg_temp_free_ptr(qc_ptr);
 }
 
 /* Expand a 4-operand operation using an out-of-line helper.  */
@@ -653,7 +650,6 @@ static void gen_gvec_op4_fpst(DisasContext *s, bool is_q, int rd, int rn,
                        vec_full_reg_offset(s, rm),
                        vec_full_reg_offset(s, ra), fpst,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
-    tcg_temp_free_ptr(fpst);
 }
 
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
@@ -697,12 +693,9 @@ static void gen_add_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_gen_xor_i64(flag, result, t0);
         tcg_gen_xor_i64(tmp, t0, t1);
         tcg_gen_andc_i64(flag, flag, tmp);
-        tcg_temp_free_i64(tmp);
         tcg_gen_extrh_i64_i32(cpu_VF, flag);
 
         tcg_gen_mov_i64(dest, result);
-        tcg_temp_free_i64(result);
-        tcg_temp_free_i64(flag);
     } else {
         /* 32 bit arithmetic */
         TCGv_i32 t0_32 = tcg_temp_new_i32();
@@ -718,10 +711,6 @@ static void gen_add_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_gen_xor_i32(tmp, t0_32, t1_32);
         tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
         tcg_gen_extu_i32_i64(dest, cpu_NF);
-
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(t0_32);
-        tcg_temp_free_i32(t1_32);
     }
 }
 
@@ -745,11 +734,8 @@ static void gen_sub_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tmp = tcg_temp_new_i64();
         tcg_gen_xor_i64(tmp, t0, t1);
         tcg_gen_and_i64(flag, flag, tmp);
-        tcg_temp_free_i64(tmp);
         tcg_gen_extrh_i64_i32(cpu_VF, flag);
         tcg_gen_mov_i64(dest, result);
-        tcg_temp_free_i64(flag);
-        tcg_temp_free_i64(result);
     } else {
         /* 32 bit arithmetic */
         TCGv_i32 t0_32 = tcg_temp_new_i32();
@@ -764,10 +750,7 @@ static void gen_sub_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
         tmp = tcg_temp_new_i32();
         tcg_gen_xor_i32(tmp, t0_32, t1_32);
-        tcg_temp_free_i32(t0_32);
-        tcg_temp_free_i32(t1_32);
         tcg_gen_and_i32(cpu_VF, cpu_VF, tmp);
-        tcg_temp_free_i32(tmp);
         tcg_gen_extu_i32_i64(dest, cpu_NF);
     }
 }
@@ -779,7 +762,6 @@ static void gen_adc(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
     tcg_gen_extu_i32_i64(flag, cpu_CF);
     tcg_gen_add_i64(dest, t0, t1);
     tcg_gen_add_i64(dest, dest, flag);
-    tcg_temp_free_i64(flag);
 
     if (!sf) {
         tcg_gen_ext32u_i64(dest, dest);
@@ -808,11 +790,6 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_gen_extrh_i64_i32(cpu_VF, vf_64);
 
         tcg_gen_mov_i64(dest, result);
-
-        tcg_temp_free_i64(tmp);
-        tcg_temp_free_i64(vf_64);
-        tcg_temp_free_i64(cf_64);
-        tcg_temp_free_i64(result);
     } else {
         TCGv_i32 t0_32 = tcg_temp_new_i32();
         TCGv_i32 t1_32 = tcg_temp_new_i32();
@@ -829,10 +806,6 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_gen_xor_i32(tmp, t0_32, t1_32);
         tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
         tcg_gen_extu_i32_i64(dest, cpu_NF);
-
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(t1_32);
-        tcg_temp_free_i32(t0_32);
     }
 }
 
@@ -942,12 +915,7 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
         tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
                             get_mem_index(s), mop);
-
-        tcg_temp_free_i64(tcg_hiaddr);
-        tcg_temp_free_i64(tmphi);
     }
-
-    tcg_temp_free_i64(tmplo);
 }
 
 /*
@@ -976,15 +944,12 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
         tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
                             get_mem_index(s), mop);
-        tcg_temp_free_i64(tcg_hiaddr);
     }
 
     tcg_gen_st_i64(tmplo, cpu_env, fp_reg_offset(s, destidx, MO_64));
-    tcg_temp_free_i64(tmplo);
 
     if (tmphi) {
         tcg_gen_st_i64(tmphi, cpu_env, fp_reg_hi_offset(s, destidx));
-        tcg_temp_free_i64(tmphi);
     }
     clear_vec_high(s, tmphi != NULL, destidx);
 }
@@ -1110,8 +1075,6 @@ static void do_vec_st(DisasContext *s, int srcidx, int element,
 
     read_vec_element(s, tcg_tmp, srcidx, element, mop & MO_SIZE);
     tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
-
-    tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Load from memory to vector register */
@@ -1122,8 +1085,6 @@ static void do_vec_ld(DisasContext *s, int destidx, int element,
 
     tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
     write_vec_element(s, tcg_tmp, destidx, element, mop & MO_SIZE);
-
-    tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Check that FP/Neon access is enabled. If it is, return
@@ -1407,7 +1368,6 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
     match = gen_disas_label(s);
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, match.label);
-    tcg_temp_free_i64(tcg_cmp);
     gen_goto_tb(s, 0, 4);
     set_disas_label(s, match);
     gen_goto_tb(s, 1, diff);
@@ -1663,8 +1623,6 @@ static void gen_xaflag(void)
 
     /* C | Z */
     tcg_gen_or_i32(cpu_CF, cpu_CF, z);
-
-    tcg_temp_free_i32(z);
 }
 
 static void gen_axflag(void)
@@ -1840,9 +1798,6 @@ static void gen_get_nzcv(TCGv_i64 tcg_rt)
     tcg_gen_deposit_i32(nzcv, nzcv, tmp, 28, 1);
     /* generate result */
     tcg_gen_extu_i32_i64(tcg_rt, nzcv);
-
-    tcg_temp_free_i32(nzcv);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_set_nzcv(TCGv_i64 tcg_rt)
@@ -1863,7 +1818,6 @@ static void gen_set_nzcv(TCGv_i64 tcg_rt)
     /* bit 28, V */
     tcg_gen_andi_i32(cpu_VF, nzcv, (1 << 28));
     tcg_gen_shli_i32(cpu_VF, cpu_VF, 3);
-    tcg_temp_free_i32(nzcv);
 }
 
 static void gen_sysreg_undef(DisasContext *s, bool isread,
@@ -1949,7 +1903,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     case 0:
         break;
     case ARM_CP_NOP:
-        goto exit;
+        return;
     case ARM_CP_NZCV:
         tcg_rt = cpu_reg(s, rt);
         if (isread) {
@@ -1957,14 +1911,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         } else {
             gen_set_nzcv(tcg_rt);
         }
-        goto exit;
+        return;
     case ARM_CP_CURRENTEL:
         /* Reads as current EL value from pstate, which is
          * guaranteed to be constant by the tb flags.
          */
         tcg_rt = cpu_reg(s, rt);
         tcg_gen_movi_i64(tcg_rt, s->current_el << 2);
-        goto exit;
+        return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
@@ -1981,7 +1935,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
         gen_helper_dc_zva(cpu_env, tcg_rt);
-        goto exit;
+        return;
     case ARM_CP_DC_GVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -1999,10 +1953,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
                 gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
-                tcg_temp_free_i64(tag);
             }
         }
-        goto exit;
+        return;
     case ARM_CP_DC_GZVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -2017,19 +1970,18 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                 tag = tcg_temp_new_i64();
                 tcg_gen_shri_i64(tag, tcg_rt, 56);
                 gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
-                tcg_temp_free_i64(tag);
             }
         }
-        goto exit;
+        return;
     default:
         g_assert_not_reached();
     }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
-        goto exit;
+        return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-        goto exit;
+        return;
     } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
-        goto exit;
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
@@ -2052,7 +2004,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     } else {
         if (ri->type & ARM_CP_CONST) {
             /* If not forbidden by access permissions, treat as WI */
-            goto exit;
+            return;
         } else if (ri->writefn) {
             if (!tcg_ri) {
                 tcg_ri = gen_lookup_cp_reg(key);
@@ -2080,11 +2032,6 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          */
         s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
-
- exit:
-    if (tcg_ri) {
-        tcg_temp_free_ptr(tcg_ri);
-    }
 }
 
 /* System
@@ -2395,7 +2342,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         }
 
         gen_helper_exception_return(cpu_env, dst);
-        tcg_temp_free_i64(dst);
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
         return;
@@ -2515,7 +2461,6 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
             TCGv_i64 addr2 = tcg_temp_new_i64();
             tcg_gen_addi_i64(addr2, addr, 8);
             tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
-            tcg_temp_free_i64(addr2);
 
             tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
             tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
@@ -2580,7 +2525,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
                                         get_mem_index(s),
                                         MO_128 | MO_ALIGN | s->be_data);
-            tcg_temp_free_i128(c16);
 
             a = tcg_temp_new_i64();
             b = tcg_temp_new_i64();
@@ -2593,9 +2537,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             tcg_gen_xor_i64(a, a, cpu_exclusive_val);
             tcg_gen_xor_i64(b, b, cpu_exclusive_high);
             tcg_gen_or_i64(tmp, a, b);
-            tcg_temp_free_i64(a);
-            tcg_temp_free_i64(b);
-            tcg_temp_free_i128(t16);
 
             tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
         }
@@ -2606,7 +2547,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
     }
     tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
-    tcg_temp_free_i64(tmp);
     tcg_gen_br(done_label);
 
     gen_set_label(fail_label);
@@ -2662,14 +2602,12 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
 
         tcg_gen_atomic_cmpxchg_i64(cmp, clean_addr, cmp, val, memidx,
                                    MO_64 | MO_ALIGN | s->be_data);
-        tcg_temp_free_i64(val);
 
         if (s->be_data == MO_LE) {
             tcg_gen_extr32_i64(s1, s2, cmp);
         } else {
             tcg_gen_extr32_i64(s2, s1, cmp);
         }
-        tcg_temp_free_i64(cmp);
     } else {
         TCGv_i128 cmp = tcg_temp_new_i128();
         TCGv_i128 val = tcg_temp_new_i128();
@@ -2684,14 +2622,12 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
 
         tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx,
                                     MO_128 | MO_ALIGN | s->be_data);
-        tcg_temp_free_i128(val);
 
         if (s->be_data == MO_LE) {
             tcg_gen_extr_i128_i64(s1, s2, cmp);
         } else {
             tcg_gen_extr_i128_i64(s2, s1, cmp);
         }
-        tcg_temp_free_i128(cmp);
     }
 }
 
@@ -3075,7 +3011,6 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
                       false, false, 0, false, false);
 
             tcg_gen_mov_i64(tcg_rt, tmp);
-            tcg_temp_free_i64(tmp);
         } else {
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       false, 0, false, false);
@@ -3975,7 +3910,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
-            tcg_temp_free_i64(tcg_tmp);
         } else {
             /* Load/store one element per register */
             if (is_load) {
@@ -4317,8 +4251,6 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
     } else {
         tcg_gen_ext32u_i64(tcg_rd, tcg_result);
     }
-
-    tcg_temp_free_i64(tcg_result);
 }
 
 /*
@@ -4706,10 +4638,8 @@ static void disas_extract(DisasContext *s, uint32_t insn)
                     TCGv_i32 t1 = tcg_temp_new_i32();
                     tcg_gen_extrl_i64_i32(t1, tcg_rn);
                     tcg_gen_extract2_i32(t0, t0, t1, imm);
-                    tcg_temp_free_i32(t1);
                 }
                 tcg_gen_extu_i32_i64(tcg_rd, t0);
-                tcg_temp_free_i32(t0);
             }
         }
     }
@@ -4778,8 +4708,6 @@ static void shift_reg(TCGv_i64 dst, TCGv_i64 src, int sf,
             tcg_gen_extrl_i64_i32(t1, shift_amount);
             tcg_gen_rotr_i32(t0, t0, t1);
             tcg_gen_extu_i32_i64(dst, t0);
-            tcg_temp_free_i32(t0);
-            tcg_temp_free_i32(t1);
         }
         break;
     default:
@@ -4968,8 +4896,6 @@ static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
     } else {
         tcg_gen_ext32u_i64(tcg_rd, tcg_result);
     }
-
-    tcg_temp_free_i64(tcg_result);
 }
 
 /*
@@ -5032,8 +4958,6 @@ static void disas_add_sub_reg(DisasContext *s, uint32_t insn)
     } else {
         tcg_gen_ext32u_i64(tcg_rd, tcg_result);
     }
-
-    tcg_temp_free_i64(tcg_result);
 }
 
 /* Data-processing (3 source)
@@ -5091,8 +5015,6 @@ static void disas_data_proc_3src(DisasContext *s, uint32_t insn)
         } else {
             tcg_gen_mulu2_i64(low_bits, tcg_rd, tcg_rn, tcg_rm);
         }
-
-        tcg_temp_free_i64(low_bits);
         return;
     }
 
@@ -5128,10 +5050,6 @@ static void disas_data_proc_3src(DisasContext *s, uint32_t insn)
     if (!sf) {
         tcg_gen_ext32u_i64(cpu_reg(s, rd), cpu_reg(s, rd));
     }
-
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Add/subtract (with carry)
@@ -5211,8 +5129,6 @@ static void disas_rotate_right_into_flags(DisasContext *s, uint32_t insn)
     if (mask & 1) { /* V */
         tcg_gen_shli_i32(cpu_VF, nzcv, 31 - 0);
     }
-
-    tcg_temp_free_i32(nzcv);
 }
 
 /*
@@ -5245,7 +5161,6 @@ static void disas_evaluate_into_flags(DisasContext *s, uint32_t insn)
     tcg_gen_shli_i32(cpu_VF, tmp, shift - 1);
     tcg_gen_mov_i32(cpu_ZF, cpu_NF);
     tcg_gen_xor_i32(cpu_VF, cpu_VF, cpu_NF);
-    tcg_temp_free_i32(tmp);
 }
 
 /* Conditional compare (immediate / register)
@@ -5299,7 +5214,6 @@ static void disas_cc(DisasContext *s, uint32_t insn)
     } else {
         gen_add_CC(sf, tcg_tmp, tcg_rn, tcg_y);
     }
-    tcg_temp_free_i64(tcg_tmp);
 
     /* If COND was false, force the flags to #nzcv.  Compute two masks
      * to help with this: T1 = (COND ? 0 : -1), T2 = (COND ? -1 : 0).
@@ -5347,9 +5261,6 @@ static void disas_cc(DisasContext *s, uint32_t insn)
             tcg_gen_and_i32(cpu_VF, cpu_VF, tcg_t2);
         }
     }
-    tcg_temp_free_i32(tcg_t0);
-    tcg_temp_free_i32(tcg_t1);
-    tcg_temp_free_i32(tcg_t2);
 }
 
 /* Conditional select
@@ -5420,7 +5331,6 @@ static void handle_clz(DisasContext *s, unsigned int sf,
         tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
         tcg_gen_clzi_i32(tcg_tmp32, tcg_tmp32, 32);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-        tcg_temp_free_i32(tcg_tmp32);
     }
 }
 
@@ -5438,7 +5348,6 @@ static void handle_cls(DisasContext *s, unsigned int sf,
         tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
         tcg_gen_clrsb_i32(tcg_tmp32, tcg_tmp32);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-        tcg_temp_free_i32(tcg_tmp32);
     }
 }
 
@@ -5456,7 +5365,6 @@ static void handle_rbit(DisasContext *s, unsigned int sf,
         tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
         gen_helper_rbit(tcg_tmp32, tcg_tmp32);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-        tcg_temp_free_i32(tcg_tmp32);
     }
 }
 
@@ -5502,8 +5410,6 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
     tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
     tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
-
-    tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Data-processing (1 source)
@@ -5745,7 +5651,6 @@ static void handle_shift_reg(DisasContext *s,
 
     tcg_gen_andi_i64(tcg_shift, cpu_reg(s, rm), sf ? 63 : 31);
     shift_reg(tcg_rd, tcg_rn, sf, shift_type, tcg_shift);
-    tcg_temp_free_i64(tcg_shift);
 }
 
 /* CRC32[BHWX], CRC32C[BHWX] */
@@ -5862,8 +5767,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
             tcg_gen_extract_i64(t, cpu_reg_sp(s, rn), 56, 4);
             tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
             tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
-
-            tcg_temp_free_i64(t);
         }
         break;
     case 8: /* LSLV */
@@ -6007,8 +5910,6 @@ static void handle_fp_compare(DisasContext *s, int size,
         } else {
             gen_helper_vfp_cmpd_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
         }
-        tcg_temp_free_i64(tcg_vn);
-        tcg_temp_free_i64(tcg_vm);
     } else {
         TCGv_i32 tcg_vn = tcg_temp_new_i32();
         TCGv_i32 tcg_vm = tcg_temp_new_i32();
@@ -6038,16 +5939,9 @@ static void handle_fp_compare(DisasContext *s, int size,
         default:
             g_assert_not_reached();
         }
-
-        tcg_temp_free_i32(tcg_vn);
-        tcg_temp_free_i32(tcg_vm);
     }
 
-    tcg_temp_free_ptr(fpst);
-
     gen_set_nzcv(tcg_flags);
-
-    tcg_temp_free_i64(tcg_flags);
 }
 
 /* Floating point compare
@@ -6219,12 +6113,10 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     a64_test_cc(&c, cond);
     tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
                         t_true, t_false);
-    tcg_temp_free_i64(t_false);
 
     /* Note that sregs & hregs write back zeros to the high bits,
        and we've already done the zero-extension.  */
     write_fp_dreg(s, rd, t_true);
-    tcg_temp_free_i64(t_true);
 }
 
 /* Floating-point data-processing (1 source) - half precision */
@@ -6261,7 +6153,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
 
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-        tcg_temp_free_i32(tcg_rmode);
         break;
     }
     case 0xe: /* FRINTX */
@@ -6277,12 +6168,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     }
 
     write_fp_sreg(s, rd, tcg_res);
-
-    if (fpst) {
-        tcg_temp_free_ptr(fpst);
-    }
-    tcg_temp_free_i32(tcg_op);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating-point data-processing (1 source) - single precision */
@@ -6350,16 +6235,12 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-        tcg_temp_free_i32(tcg_rmode);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
-    tcg_temp_free_ptr(fpst);
 
  done:
     write_fp_sreg(s, rd, tcg_res);
-    tcg_temp_free_i32(tcg_op);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating-point data-processing (1 source) - double precision */
@@ -6427,16 +6308,12 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-        tcg_temp_free_i32(tcg_rmode);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
-    tcg_temp_free_ptr(fpst);
 
  done:
     write_fp_dreg(s, rd, tcg_res);
-    tcg_temp_free_i64(tcg_op);
-    tcg_temp_free_i64(tcg_res);
 }
 
 static void handle_fp_fcvt(DisasContext *s, int opcode,
@@ -6451,7 +6328,6 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             TCGv_i64 tcg_rd = tcg_temp_new_i64();
             gen_helper_vfp_fcvtds(tcg_rd, tcg_rn, cpu_env);
             write_fp_dreg(s, rd, tcg_rd);
-            tcg_temp_free_i64(tcg_rd);
         } else {
             /* Single to half */
             TCGv_i32 tcg_rd = tcg_temp_new_i32();
@@ -6461,11 +6337,7 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             gen_helper_vfp_fcvt_f32_to_f16(tcg_rd, tcg_rn, fpst, ahp);
             /* write_fp_sreg is OK here because top half of tcg_rd is zero */
             write_fp_sreg(s, rd, tcg_rd);
-            tcg_temp_free_i32(tcg_rd);
-            tcg_temp_free_i32(ahp);
-            tcg_temp_free_ptr(fpst);
         }
-        tcg_temp_free_i32(tcg_rn);
         break;
     }
     case 0x1:
@@ -6481,12 +6353,8 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             /* Double to half */
             gen_helper_vfp_fcvt_f64_to_f16(tcg_rd, tcg_rn, fpst, ahp);
             /* write_fp_sreg is OK here because top half of tcg_rd is zero */
-            tcg_temp_free_ptr(fpst);
-            tcg_temp_free_i32(ahp);
         }
         write_fp_sreg(s, rd, tcg_rd);
-        tcg_temp_free_i32(tcg_rd);
-        tcg_temp_free_i64(tcg_rn);
         break;
     }
     case 0x3:
@@ -6500,17 +6368,12 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             TCGv_i32 tcg_rd = tcg_temp_new_i32();
             gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
             write_fp_sreg(s, rd, tcg_rd);
-            tcg_temp_free_i32(tcg_rd);
         } else {
             /* Half to double */
             TCGv_i64 tcg_rd = tcg_temp_new_i64();
             gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
             write_fp_dreg(s, rd, tcg_rd);
-            tcg_temp_free_i64(tcg_rd);
         }
-        tcg_temp_free_i32(tcg_rn);
-        tcg_temp_free_ptr(tcg_fpst);
-        tcg_temp_free_i32(tcg_ahp);
         break;
     }
     default:
@@ -6658,11 +6521,6 @@ static void handle_fp_2src_single(DisasContext *s, int opcode,
     }
 
     write_fp_sreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_op1);
-    tcg_temp_free_i32(tcg_op2);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating-point data-processing (2 source) - double precision */
@@ -6711,11 +6569,6 @@ static void handle_fp_2src_double(DisasContext *s, int opcode,
     }
 
     write_fp_dreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_res);
 }
 
 /* Floating-point data-processing (2 source) - half precision */
@@ -6766,11 +6619,6 @@ static void handle_fp_2src_half(DisasContext *s, int opcode,
     }
 
     write_fp_sreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_op1);
-    tcg_temp_free_i32(tcg_op2);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating point data-processing (2 source)
@@ -6851,12 +6699,6 @@ static void handle_fp_3src_single(DisasContext *s, bool o0, bool o1,
     gen_helper_vfp_muladds(tcg_res, tcg_op1, tcg_op2, tcg_op3, fpst);
 
     write_fp_sreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_op1);
-    tcg_temp_free_i32(tcg_op2);
-    tcg_temp_free_i32(tcg_op3);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating-point data-processing (3 source) - double precision */
@@ -6889,12 +6731,6 @@ static void handle_fp_3src_double(DisasContext *s, bool o0, bool o1,
     gen_helper_vfp_muladdd(tcg_res, tcg_op1, tcg_op2, tcg_op3, fpst);
 
     write_fp_dreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_op3);
-    tcg_temp_free_i64(tcg_res);
 }
 
 /* Floating-point data-processing (3 source) - half precision */
@@ -6927,12 +6763,6 @@ static void handle_fp_3src_half(DisasContext *s, bool o0, bool o1,
     gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_op3, fpst);
 
     write_fp_sreg(s, rd, tcg_res);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_op1);
-    tcg_temp_free_i32(tcg_op2);
-    tcg_temp_free_i32(tcg_op3);
-    tcg_temp_free_i32(tcg_res);
 }
 
 /* Floating point data-processing (3 source)
@@ -7074,7 +6904,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
                                      tcg_shift, tcg_fpstatus);
             }
             write_fp_dreg(s, rd, tcg_double);
-            tcg_temp_free_i64(tcg_double);
             break;
 
         case 0: /* float32 */
@@ -7087,7 +6916,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
                                      tcg_shift, tcg_fpstatus);
             }
             write_fp_sreg(s, rd, tcg_single);
-            tcg_temp_free_i32(tcg_single);
             break;
 
         case 3: /* float16 */
@@ -7100,7 +6928,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
                                      tcg_shift, tcg_fpstatus);
             }
             write_fp_sreg(s, rd, tcg_single);
-            tcg_temp_free_i32(tcg_single);
             break;
 
         default:
@@ -7144,7 +6971,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             if (!sf) {
                 tcg_gen_ext32u_i64(tcg_int, tcg_int);
             }
-            tcg_temp_free_i64(tcg_double);
             break;
 
         case 0: /* float32 */
@@ -7167,9 +6993,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
                                          tcg_shift, tcg_fpstatus);
                 }
                 tcg_gen_extu_i32_i64(tcg_int, tcg_dest);
-                tcg_temp_free_i32(tcg_dest);
             }
-            tcg_temp_free_i32(tcg_single);
             break;
 
         case 3: /* float16 */
@@ -7192,9 +7016,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
                                          tcg_shift, tcg_fpstatus);
                 }
                 tcg_gen_extu_i32_i64(tcg_int, tcg_dest);
-                tcg_temp_free_i32(tcg_dest);
             }
-            tcg_temp_free_i32(tcg_single);
             break;
 
         default:
@@ -7202,10 +7024,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
         }
 
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_rmode);
     }
-
-    tcg_temp_free_ptr(tcg_fpstatus);
 }
 
 /* Floating point <-> fixed point conversions
@@ -7282,7 +7101,6 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
             tmp = tcg_temp_new_i64();
             tcg_gen_ext32u_i64(tmp, tcg_rn);
             write_fp_dreg(s, rd, tmp);
-            tcg_temp_free_i64(tmp);
             break;
         case 1:
             /* 64 bit */
@@ -7298,7 +7116,6 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
             tmp = tcg_temp_new_i64();
             tcg_gen_ext16u_i64(tmp, tcg_rn);
             write_fp_dreg(s, rd, tmp);
-            tcg_temp_free_i64(tmp);
             break;
         default:
             g_assert_not_reached();
@@ -7336,15 +7153,11 @@ static void handle_fjcvtzs(DisasContext *s, int rd, int rn)
 
     gen_helper_fjcvtzs(t, t, fpstatus);
 
-    tcg_temp_free_ptr(fpstatus);
-
     tcg_gen_ext32u_i64(cpu_reg(s, rd), t);
     tcg_gen_extrh_i64_i32(cpu_ZF, t);
     tcg_gen_movi_i32(cpu_CF, 0);
     tcg_gen_movi_i32(cpu_NF, 0);
     tcg_gen_movi_i32(cpu_VF, 0);
-
-    tcg_temp_free_i64(t);
 }
 
 /* Floating point <-> integer conversions
@@ -7509,8 +7322,6 @@ static void do_ext64(DisasContext *s, TCGv_i64 tcg_left, TCGv_i64 tcg_right,
     tcg_gen_shri_i64(tcg_right, tcg_right, pos);
     tcg_gen_shli_i64(tcg_tmp, tcg_left, 64 - pos);
     tcg_gen_or_i64(tcg_right, tcg_right, tcg_tmp);
-
-    tcg_temp_free_i64(tcg_tmp);
 }
 
 /* EXT
@@ -7575,16 +7386,13 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
             tcg_hh = tcg_temp_new_i64();
             read_vec_element(s, tcg_hh, elt->reg, elt->elt, MO_64);
             do_ext64(s, tcg_hh, tcg_resh, pos);
-            tcg_temp_free_i64(tcg_hh);
         }
     }
 
     write_vec_element(s, tcg_resl, rd, 0, MO_64);
-    tcg_temp_free_i64(tcg_resl);
     if (is_q) {
         write_vec_element(s, tcg_resh, rd, 1, MO_64);
     }
-    tcg_temp_free_i64(tcg_resh);
     clear_vec_high(s, is_q, rd);
 }
 
@@ -7701,14 +7509,9 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
         }
     }
 
-    tcg_temp_free_i64(tcg_res);
-
     write_vec_element(s, tcg_resl, rd, 0, MO_64);
-    tcg_temp_free_i64(tcg_resl);
-
     if (is_q) {
         write_vec_element(s, tcg_resh, rd, 1, MO_64);
-        tcg_temp_free_i64(tcg_resh);
     }
     clear_vec_high(s, is_q, rd);
 }
@@ -7778,9 +7581,6 @@ static TCGv_i32 do_reduction_op(DisasContext *s, int fpopcode, int rn,
         default:
             g_assert_not_reached();
         }
-
-        tcg_temp_free_i32(tcg_hi);
-        tcg_temp_free_i32(tcg_lo);
         return tcg_res;
     }
 }
@@ -7908,12 +7708,8 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
         TCGv_i32 tcg_res32 = do_reduction_op(s, fpopcode, rn, esize,
                                              (is_q ? 128 : 64), vmap, fpst);
         tcg_gen_extu_i32_i64(tcg_res, tcg_res32);
-        tcg_temp_free_i32(tcg_res32);
-        tcg_temp_free_ptr(fpst);
     }
 
-    tcg_temp_free_i64(tcg_elt);
-
     /* Now truncate the result to the width required for the final output */
     if (opcode == 0x03) {
         /* SADDLV, UADDLV: result is 2*esize */
@@ -7937,7 +7733,6 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
     }
 
     write_fp_dreg(s, rd, tcg_res);
-    tcg_temp_free_i64(tcg_res);
 }
 
 /* DUP (Element, Vector)
@@ -8000,7 +7795,6 @@ static void handle_simd_dupes(DisasContext *s, int rd, int rn,
     tmp = tcg_temp_new_i64();
     read_vec_element(s, tmp, rn, index, size);
     write_fp_dreg(s, rd, tmp);
-    tcg_temp_free_i64(tmp);
 }
 
 /* DUP (General)
@@ -8068,8 +7862,6 @@ static void handle_simd_inse(DisasContext *s, int rd, int rn,
     read_vec_element(s, tmp, rn, src_index, size);
     write_vec_element(s, tmp, rd, dst_index, size);
 
-    tcg_temp_free_i64(tmp);
-
     /* INS is considered a 128-bit write for SVE. */
     clear_vec_high(s, true, rd);
 }
@@ -8380,10 +8172,6 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
         }
 
         write_fp_dreg(s, rd, tcg_res);
-
-        tcg_temp_free_i64(tcg_op1);
-        tcg_temp_free_i64(tcg_op2);
-        tcg_temp_free_i64(tcg_res);
     } else {
         TCGv_i32 tcg_op1 = tcg_temp_new_i32();
         TCGv_i32 tcg_op2 = tcg_temp_new_i32();
@@ -8435,14 +8223,6 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
         }
 
         write_fp_sreg(s, rd, tcg_res);
-
-        tcg_temp_free_i32(tcg_op1);
-        tcg_temp_free_i32(tcg_op2);
-        tcg_temp_free_i32(tcg_res);
-    }
-
-    if (fpst) {
-        tcg_temp_free_ptr(fpst);
     }
 }
 
@@ -8527,10 +8307,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     } else {
         tcg_gen_mov_i64(tcg_res, tcg_src);
     }
-
-    if (extended_result) {
-        tcg_temp_free_i64(tcg_src_hi);
-    }
 }
 
 /* SSHR[RA]/USHR[RA] - Scalar shift right (optional rounding/accumulate) */
@@ -8596,9 +8372,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
     }
 
     write_fp_dreg(s, rd, tcg_rd);
-
-    tcg_temp_free_i64(tcg_rn);
-    tcg_temp_free_i64(tcg_rd);
 }
 
 /* SHL/SLI - Scalar shift left */
@@ -8631,9 +8404,6 @@ static void handle_scalar_simd_shli(DisasContext *s, bool insert,
     }
 
     write_fp_dreg(s, rd, tcg_rd);
-
-    tcg_temp_free_i64(tcg_rn);
-    tcg_temp_free_i64(tcg_rd);
 }
 
 /* SQSHRN/SQSHRUN - Saturating (signed/unsigned) shift right with
@@ -8715,12 +8485,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-
-    tcg_temp_free_i64(tcg_rn);
-    tcg_temp_free_i64(tcg_rd);
-    tcg_temp_free_i32(tcg_rd_narrowed);
-    tcg_temp_free_i64(tcg_final);
-
     clear_vec_high(s, is_q, rd);
 }
 
@@ -8781,8 +8545,6 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
             read_vec_element(s, tcg_op, rn, pass, MO_64);
             genfn(tcg_op, cpu_env, tcg_op, tcg_shift);
             write_vec_element(s, tcg_op, rd, pass, MO_64);
-
-            tcg_temp_free_i64(tcg_op);
         }
         clear_vec_high(s, is_q, rd);
     } else {
@@ -8828,8 +8590,6 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
             } else {
                 write_vec_element_i32(s, tcg_op, rd, pass, MO_32);
             }
-
-            tcg_temp_free_i32(tcg_op);
         }
 
         if (!scalar) {
@@ -8873,10 +8633,6 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                 write_vec_element(s, tcg_double, rd, pass, MO_64);
             }
         }
-
-        tcg_temp_free_i64(tcg_int64);
-        tcg_temp_free_i64(tcg_double);
-
     } else {
         TCGv_i32 tcg_int32 = tcg_temp_new_i32();
         TCGv_i32 tcg_float = tcg_temp_new_i32();
@@ -8929,13 +8685,8 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                 write_vec_element_i32(s, tcg_float, rd, pass, size);
             }
         }
-
-        tcg_temp_free_i32(tcg_int32);
-        tcg_temp_free_i32(tcg_float);
     }
 
-    tcg_temp_free_ptr(tcg_fpst);
-
     clear_vec_high(s, elements << size == 16, rd);
 }
 
@@ -9039,7 +8790,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
                 gen_helper_vfp_tosqd(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
             }
             write_vec_element(s, tcg_op, rd, pass, MO_64);
-            tcg_temp_free_i64(tcg_op);
         }
         clear_vec_high(s, is_q, rd);
     } else {
@@ -9075,7 +8825,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
             } else {
                 write_vec_element_i32(s, tcg_op, rd, pass, size);
             }
-            tcg_temp_free_i32(tcg_op);
         }
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
@@ -9083,8 +8832,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
     }
 
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
-    tcg_temp_free_ptr(tcg_fpstatus);
-    tcg_temp_free_i32(tcg_rmode);
 }
 
 /* AdvSIMD scalar shift by immediate
@@ -9227,10 +8974,6 @@ static void disas_simd_scalar_three_reg_diff(DisasContext *s, uint32_t insn)
         }
 
         write_fp_dreg(s, rd, tcg_res);
-
-        tcg_temp_free_i64(tcg_op1);
-        tcg_temp_free_i64(tcg_op2);
-        tcg_temp_free_i64(tcg_res);
     } else {
         TCGv_i32 tcg_op1 = read_fp_hreg(s, rn);
         TCGv_i32 tcg_op2 = read_fp_hreg(s, rm);
@@ -9251,7 +8994,6 @@ static void disas_simd_scalar_three_reg_diff(DisasContext *s, uint32_t insn)
             read_vec_element(s, tcg_op3, rd, 0, MO_32);
             gen_helper_neon_addl_saturate_s32(tcg_res, cpu_env,
                                               tcg_res, tcg_op3);
-            tcg_temp_free_i64(tcg_op3);
             break;
         }
         default:
@@ -9260,10 +9002,6 @@ static void disas_simd_scalar_three_reg_diff(DisasContext *s, uint32_t insn)
 
         tcg_gen_ext32u_i64(tcg_res, tcg_res);
         write_fp_dreg(s, rd, tcg_res);
-
-        tcg_temp_free_i32(tcg_op1);
-        tcg_temp_free_i32(tcg_op2);
-        tcg_temp_free_i64(tcg_res);
     }
 }
 
@@ -9438,10 +9176,6 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
             }
 
             write_vec_element(s, tcg_res, rd, pass, MO_64);
-
-            tcg_temp_free_i64(tcg_res);
-            tcg_temp_free_i64(tcg_op1);
-            tcg_temp_free_i64(tcg_op2);
         } else {
             /* Single */
             TCGv_i32 tcg_op1 = tcg_temp_new_i32();
@@ -9523,19 +9257,12 @@ static void handle_3same_float(DisasContext *s, int size, int elements,
 
                 tcg_gen_extu_i32_i64(tcg_tmp, tcg_res);
                 write_vec_element(s, tcg_tmp, rd, pass, MO_64);
-                tcg_temp_free_i64(tcg_tmp);
             } else {
                 write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
             }
-
-            tcg_temp_free_i32(tcg_res);
-            tcg_temp_free_i32(tcg_op1);
-            tcg_temp_free_i32(tcg_op2);
         }
     }
 
-    tcg_temp_free_ptr(fpst);
-
     clear_vec_high(s, elements * (size ? 8 : 4) > 8, rd);
 }
 
@@ -9621,8 +9348,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         TCGv_i64 tcg_rm = read_fp_dreg(s, rm);
 
         handle_3same_64(s, opcode, u, tcg_rd, tcg_rn, tcg_rm);
-        tcg_temp_free_i64(tcg_rn);
-        tcg_temp_free_i64(tcg_rm);
     } else {
         /* Do a single operation on the lowest element in the vector.
          * We use the standard Neon helpers and rely on 0 OP 0 == 0 with
@@ -9695,14 +9420,9 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
 
         genenvfn(tcg_rd32, cpu_env, tcg_rn, tcg_rm);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd32);
-        tcg_temp_free_i32(tcg_rd32);
-        tcg_temp_free_i32(tcg_rn);
-        tcg_temp_free_i32(tcg_rm);
     }
 
     write_fp_dreg(s, rd, tcg_rd);
-
-    tcg_temp_free_i64(tcg_rd);
 }
 
 /* AdvSIMD scalar three same FP16
@@ -9792,12 +9512,6 @@ static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
     }
 
     write_fp_sreg(s, rd, tcg_res);
-
-
-    tcg_temp_free_i32(tcg_res);
-    tcg_temp_free_i32(tcg_op1);
-    tcg_temp_free_i32(tcg_op2);
-    tcg_temp_free_ptr(fpst);
 }
 
 /* AdvSIMD scalar three same extra
@@ -9872,15 +9586,10 @@ static void disas_simd_scalar_three_reg_same_extra(DisasContext *s,
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free_i32(ele1);
-    tcg_temp_free_i32(ele2);
 
     res = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(res, ele3);
-    tcg_temp_free_i32(ele3);
-
     write_fp_dreg(s, rd, res);
-    tcg_temp_free_i64(res);
 }
 
 static void handle_2misc_64(DisasContext *s, int opcode, bool u,
@@ -10036,8 +9745,6 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             }
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
-        tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_op);
 
         clear_vec_high(s, !is_scalar, rd);
     } else {
@@ -10110,14 +9817,11 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
                 write_vec_element_i32(s, tcg_res, rd, pass, size);
             }
         }
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_op);
+
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
         }
     }
-
-    tcg_temp_free_ptr(fpst);
 }
 
 static void handle_2misc_reciprocal(DisasContext *s, int opcode,
@@ -10149,8 +9853,6 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
             }
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
-        tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_op);
         clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
@@ -10189,13 +9891,10 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
                 write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
             }
         }
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_op);
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
         }
     }
-    tcg_temp_free_ptr(fpst);
 }
 
 static void handle_2misc_narrow(DisasContext *s, bool scalar,
@@ -10273,17 +9972,12 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
                 gen_helper_vfp_fcvt_f32_to_f16(tcg_lo, tcg_lo, fpst, ahp);
                 gen_helper_vfp_fcvt_f32_to_f16(tcg_hi, tcg_hi, fpst, ahp);
                 tcg_gen_deposit_i32(tcg_res[pass], tcg_lo, tcg_hi, 16, 16);
-                tcg_temp_free_i32(tcg_lo);
-                tcg_temp_free_i32(tcg_hi);
-                tcg_temp_free_ptr(fpst);
-                tcg_temp_free_i32(ahp);
             }
             break;
         case 0x36: /* BFCVTN, BFCVTN2 */
             {
                 TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
                 gen_helper_bfcvt_pair(tcg_res[pass], tcg_op, fpst);
-                tcg_temp_free_ptr(fpst);
             }
             break;
         case 0x56:  /* FCVTXN, FCVTXN2 */
@@ -10302,13 +9996,10 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         } else if (genenvfn) {
             genenvfn(tcg_res[pass], cpu_env, tcg_op);
         }
-
-        tcg_temp_free_i64(tcg_op);
     }
 
     for (pass = 0; pass < 2; pass++) {
         write_vec_element_i32(s, tcg_res[pass], rd, destelt + pass, MO_32);
-        tcg_temp_free_i32(tcg_res[pass]);
     }
     clear_vec_high(s, is_q, rd);
 }
@@ -10335,8 +10026,6 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
             write_vec_element(s, tcg_rd, rd, pass, MO_64);
         }
-        tcg_temp_free_i64(tcg_rd);
-        tcg_temp_free_i64(tcg_rn);
         clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_rn = tcg_temp_new_i32();
@@ -10393,8 +10082,6 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
             write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
         }
-        tcg_temp_free_i32(tcg_rd);
-        tcg_temp_free_i32(tcg_rn);
         clear_vec_high(s, is_q, rd);
     }
 }
@@ -10546,8 +10233,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
 
         handle_2misc_64(s, opcode, u, tcg_rd, tcg_rn, tcg_rmode, tcg_fpstatus);
         write_fp_dreg(s, rd, tcg_rd);
-        tcg_temp_free_i64(tcg_rd);
-        tcg_temp_free_i64(tcg_rn);
     } else {
         TCGv_i32 tcg_rn = tcg_temp_new_i32();
         TCGv_i32 tcg_rd = tcg_temp_new_i32();
@@ -10588,14 +10273,10 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         }
 
         write_fp_sreg(s, rd, tcg_rd);
-        tcg_temp_free_i32(tcg_rd);
-        tcg_temp_free_i32(tcg_rn);
     }
 
     if (is_fcvt) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_rmode);
-        tcg_temp_free_ptr(tcg_fpstatus);
     }
 }
 
@@ -10772,9 +10453,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-    tcg_temp_free_i64(tcg_rn);
-    tcg_temp_free_i64(tcg_rd);
-    tcg_temp_free_i64(tcg_final);
 
     clear_vec_high(s, is_q, rd);
 }
@@ -10945,8 +10623,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
                 tcg_gen_movcond_i64(is_u ? TCG_COND_GEU : TCG_COND_GE,
                                     tcg_passres,
                                     tcg_op1, tcg_op2, tcg_tmp1, tcg_tmp2);
-                tcg_temp_free_i64(tcg_tmp1);
-                tcg_temp_free_i64(tcg_tmp2);
                 break;
             }
             case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
@@ -10977,13 +10653,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             } else if (accop < 0) {
                 tcg_gen_sub_i64(tcg_res[pass], tcg_res[pass], tcg_passres);
             }
-
-            if (accop != 0) {
-                tcg_temp_free_i64(tcg_passres);
-            }
-
-            tcg_temp_free_i64(tcg_op1);
-            tcg_temp_free_i64(tcg_op2);
         }
     } else {
         /* size 0 or 1, generally helper functions */
@@ -11017,7 +10686,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
                 widenfn(tcg_passres, tcg_op1);
                 gen_neon_addl(size, (opcode == 2), tcg_passres,
                               tcg_passres, tcg_op2_64);
-                tcg_temp_free_i64(tcg_op2_64);
                 break;
             }
             case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
@@ -11064,8 +10732,6 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
             default:
                 g_assert_not_reached();
             }
-            tcg_temp_free_i32(tcg_op1);
-            tcg_temp_free_i32(tcg_op2);
 
             if (accop != 0) {
                 if (opcode == 9 || opcode == 11) {
@@ -11080,15 +10746,12 @@ static void handle_3rd_widening(DisasContext *s, int is_q, int is_u, int size,
                     gen_neon_addl(size, (accop < 0), tcg_res[pass],
                                   tcg_res[pass], tcg_passres);
                 }
-                tcg_temp_free_i64(tcg_passres);
             }
         }
     }
 
     write_vec_element(s, tcg_res[0], rd, 0, MO_64);
     write_vec_element(s, tcg_res[1], rd, 1, MO_64);
-    tcg_temp_free_i64(tcg_res[0]);
-    tcg_temp_free_i64(tcg_res[1]);
 }
 
 static void handle_3rd_wide(DisasContext *s, int is_q, int is_u, int size,
@@ -11112,17 +10775,13 @@ static void handle_3rd_wide(DisasContext *s, int is_q, int is_u, int size,
         read_vec_element(s, tcg_op1, rn, pass, MO_64);
         read_vec_element_i32(s, tcg_op2, rm, part + pass, MO_32);
         widenfn(tcg_op2_wide, tcg_op2);
-        tcg_temp_free_i32(tcg_op2);
         tcg_res[pass] = tcg_temp_new_i64();
         gen_neon_addl(size, (opcode == 3),
                       tcg_res[pass], tcg_op1, tcg_op2_wide);
-        tcg_temp_free_i64(tcg_op1);
-        tcg_temp_free_i64(tcg_op2_wide);
     }
 
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-        tcg_temp_free_i64(tcg_res[pass]);
     }
 }
 
@@ -11157,17 +10816,12 @@ static void handle_3rd_narrowing(DisasContext *s, int is_q, int is_u, int size,
 
         gen_neon_addl(size, (opcode == 6), tcg_wideres, tcg_op1, tcg_op2);
 
-        tcg_temp_free_i64(tcg_op1);
-        tcg_temp_free_i64(tcg_op2);
-
         tcg_res[pass] = tcg_temp_new_i32();
         gennarrow(tcg_res[pass], tcg_wideres);
-        tcg_temp_free_i64(tcg_wideres);
     }
 
     for (pass = 0; pass < 2; pass++) {
         write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_32);
-        tcg_temp_free_i32(tcg_res[pass]);
     }
     clear_vec_high(s, is_q, rd);
 }
@@ -11394,14 +11048,10 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
             default:
                 g_assert_not_reached();
             }
-
-            tcg_temp_free_i64(tcg_op1);
-            tcg_temp_free_i64(tcg_op2);
         }
 
         for (pass = 0; pass < 2; pass++) {
             write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-            tcg_temp_free_i64(tcg_res[pass]);
         }
     } else {
         int maxpass = is_q ? 4 : 2;
@@ -11473,21 +11123,13 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
             if (genfn) {
                 genfn(tcg_res[pass], tcg_op1, tcg_op2);
             }
-
-            tcg_temp_free_i32(tcg_op1);
-            tcg_temp_free_i32(tcg_op2);
         }
 
         for (pass = 0; pass < maxpass; pass++) {
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
-            tcg_temp_free_i32(tcg_res[pass]);
         }
         clear_vec_high(s, is_q, rd);
     }
-
-    if (fpst) {
-        tcg_temp_free_ptr(fpst);
-    }
 }
 
 /* Floating point op subgroup of C3.6.16. */
@@ -11744,10 +11386,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             handle_3same_64(s, opcode, u, tcg_res, tcg_op1, tcg_op2);
 
             write_vec_element(s, tcg_res, rd, pass, MO_64);
-
-            tcg_temp_free_i64(tcg_res);
-            tcg_temp_free_i64(tcg_op1);
-            tcg_temp_free_i64(tcg_op2);
         }
     } else {
         for (pass = 0; pass < (is_q ? 4 : 2); pass++) {
@@ -11832,10 +11470,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             }
 
             write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-
-            tcg_temp_free_i32(tcg_res);
-            tcg_temp_free_i32(tcg_op1);
-            tcg_temp_free_i32(tcg_op2);
         }
     }
     clear_vec_high(s, is_q, rd);
@@ -12006,12 +11640,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
 
         for (pass = 0; pass < maxpass; pass++) {
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_16);
-            tcg_temp_free_i32(tcg_res[pass]);
         }
-
-        tcg_temp_free_i32(tcg_op1);
-        tcg_temp_free_i32(tcg_op2);
-
     } else {
         for (pass = 0; pass < elements; pass++) {
             TCGv_i32 tcg_op1 = tcg_temp_new_i32();
@@ -12091,14 +11720,9 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             }
 
             write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
-            tcg_temp_free_i32(tcg_res);
-            tcg_temp_free_i32(tcg_op1);
-            tcg_temp_free_i32(tcg_op2);
         }
     }
 
-    tcg_temp_free_ptr(fpst);
-
     clear_vec_high(s, is_q, rd);
 }
 
@@ -12310,11 +11934,9 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
 
             read_vec_element_i32(s, tcg_op, rn, srcelt + pass, MO_32);
             gen_helper_vfp_fcvtds(tcg_res[pass], tcg_op, cpu_env);
-            tcg_temp_free_i32(tcg_op);
         }
         for (pass = 0; pass < 2; pass++) {
             write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-            tcg_temp_free_i64(tcg_res[pass]);
         }
     } else {
         /* 16 -> 32 bit fp conversion */
@@ -12332,11 +11954,7 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
         }
         for (pass = 0; pass < 4; pass++) {
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
-            tcg_temp_free_i32(tcg_res[pass]);
         }
-
-        tcg_temp_free_ptr(fpst);
-        tcg_temp_free_i32(ahp);
     }
 }
 
@@ -12380,7 +11998,6 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
                 g_assert_not_reached();
             }
             write_vec_element(s, tcg_tmp, rd, i, grp_size);
-            tcg_temp_free_i64(tcg_tmp);
         }
         clear_vec_high(s, is_q, rd);
     } else {
@@ -12404,10 +12021,6 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
         }
         write_vec_element(s, tcg_rd, rd, 0, MO_64);
         write_vec_element(s, tcg_rd_hi, rd, 1, MO_64);
-
-        tcg_temp_free_i64(tcg_rd_hi);
-        tcg_temp_free_i64(tcg_rd);
-        tcg_temp_free_i64(tcg_rn);
     }
 }
 
@@ -12441,9 +12054,6 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
                 read_vec_element(s, tcg_op1, rd, pass, MO_64);
                 tcg_gen_add_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
             }
-
-            tcg_temp_free_i64(tcg_op1);
-            tcg_temp_free_i64(tcg_op2);
         }
     } else {
         for (pass = 0; pass < maxpass; pass++) {
@@ -12471,7 +12081,6 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
                                              tcg_res[pass], tcg_op);
                 }
             }
-            tcg_temp_free_i64(tcg_op);
         }
     }
     if (!is_q) {
@@ -12479,7 +12088,6 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
     }
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-        tcg_temp_free_i64(tcg_res[pass]);
     }
 }
 
@@ -12503,13 +12111,10 @@ static void handle_shll(DisasContext *s, bool is_q, int size, int rn, int rd)
         tcg_res[pass] = tcg_temp_new_i64();
         widenfn(tcg_res[pass], tcg_op);
         tcg_gen_shli_i64(tcg_res[pass], tcg_res[pass], 8 << size);
-
-        tcg_temp_free_i32(tcg_op);
     }
 
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-        tcg_temp_free_i64(tcg_res[pass]);
     }
 }
 
@@ -12864,9 +12469,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                             tcg_rmode, tcg_fpstatus);
 
             write_vec_element(s, tcg_res, rd, pass, MO_64);
-
-            tcg_temp_free_i64(tcg_res);
-            tcg_temp_free_i64(tcg_op);
         }
     } else {
         int pass;
@@ -12989,19 +12591,12 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
 
             write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-
-            tcg_temp_free_i32(tcg_res);
-            tcg_temp_free_i32(tcg_op);
         }
     }
     clear_vec_high(s, is_q, rd);
 
     if (need_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_rmode);
-    }
-    if (need_fpstatus) {
-        tcg_temp_free_ptr(tcg_fpstatus);
     }
 }
 
@@ -13227,9 +12822,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         /* limit any sign extension going on */
         tcg_gen_andi_i32(tcg_res, tcg_res, 0xffff);
         write_fp_sreg(s, rd, tcg_res);
-
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_op);
     } else {
         for (pass = 0; pass < (is_q ? 8 : 4); pass++) {
             TCGv_i32 tcg_op = tcg_temp_new_i32();
@@ -13283,9 +12875,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             }
 
             write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
-
-            tcg_temp_free_i32(tcg_res);
-            tcg_temp_free_i32(tcg_op);
         }
 
         clear_vec_high(s, is_q, rd);
@@ -13293,11 +12882,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
 
     if (tcg_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_rmode);
-    }
-
-    if (tcg_fpstatus) {
-        tcg_temp_free_ptr(tcg_fpstatus);
     }
 }
 
@@ -13567,7 +13151,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                size == MO_64
                                ? gen_helper_gvec_fcmlas_idx
                                : gen_helper_gvec_fcmlah_idx);
-            tcg_temp_free_ptr(fpst);
         }
         return;
 
@@ -13672,11 +13255,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             }
 
             write_vec_element(s, tcg_res, rd, pass, MO_64);
-            tcg_temp_free_i64(tcg_op);
-            tcg_temp_free_i64(tcg_res);
         }
 
-        tcg_temp_free_i64(tcg_idx);
         clear_vec_high(s, !is_scalar, rd);
     } else if (!is_long) {
         /* 32 bit floating point, or 16 or 32 bit integer.
@@ -13850,12 +13430,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             } else {
                 write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
             }
-
-            tcg_temp_free_i32(tcg_op);
-            tcg_temp_free_i32(tcg_res);
         }
 
-        tcg_temp_free_i32(tcg_idx);
         clear_vec_high(s, is_q, rd);
     } else {
         /* long ops: 16x16->32 or 32x32->64 */
@@ -13896,7 +13472,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 }
 
                 tcg_gen_mul_i64(tcg_passres, tcg_op, tcg_idx);
-                tcg_temp_free_i64(tcg_op);
 
                 if (satop) {
                     /* saturating, doubling */
@@ -13929,9 +13504,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 default:
                     g_assert_not_reached();
                 }
-                tcg_temp_free_i64(tcg_passres);
             }
-            tcg_temp_free_i64(tcg_idx);
 
             clear_vec_high(s, !is_scalar, rd);
         } else {
@@ -13977,7 +13550,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                     gen_helper_neon_addl_saturate_s32(tcg_passres, cpu_env,
                                                       tcg_passres, tcg_passres);
                 }
-                tcg_temp_free_i32(tcg_op);
 
                 if (opcode == 0xa || opcode == 0xb) {
                     continue;
@@ -14006,9 +13578,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 default:
                     g_assert_not_reached();
                 }
-                tcg_temp_free_i64(tcg_passres);
             }
-            tcg_temp_free_i32(tcg_idx);
 
             if (is_scalar) {
                 tcg_gen_ext32u_i64(tcg_res[0], tcg_res[0]);
@@ -14021,13 +13591,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
         for (pass = 0; pass < 2; pass++) {
             write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-            tcg_temp_free_i64(tcg_res[pass]);
         }
     }
-
-    if (fpst) {
-        tcg_temp_free_ptr(fpst);
-    }
 }
 
 /* Crypto AES
@@ -14407,12 +13972,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         }
         write_vec_element(s, tcg_res[0], rd, 0, MO_64);
         write_vec_element(s, tcg_res[1], rd, 1, MO_64);
-
-        tcg_temp_free_i64(tcg_op1);
-        tcg_temp_free_i64(tcg_op2);
-        tcg_temp_free_i64(tcg_op3);
-        tcg_temp_free_i64(tcg_res[0]);
-        tcg_temp_free_i64(tcg_res[1]);
     } else {
         TCGv_i32 tcg_op1, tcg_op2, tcg_op3, tcg_res, tcg_zero;
 
@@ -14435,11 +13994,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         write_vec_element_i32(s, tcg_zero, rd, 1, MO_32);
         write_vec_element_i32(s, tcg_zero, rd, 2, MO_32);
         write_vec_element_i32(s, tcg_res, rd, 3, MO_32);
-
-        tcg_temp_free_i32(tcg_op1);
-        tcg_temp_free_i32(tcg_op2);
-        tcg_temp_free_i32(tcg_op3);
-        tcg_temp_free_i32(tcg_res);
     }
 }
 
-- 
2.34.1


