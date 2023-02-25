Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjZ-0007K9-Mb
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiu-00063s-3A
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:11 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqii-00033n-VX
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:07 -0500
Received: by mail-pl1-x643.google.com with SMTP id i5so192630pla.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRolyktA3w+T8Flrx64dPXxNwnCw3mO2ZM/b7kcuGZ4=;
 b=sKQlVvVYBwYPHOtt3YM8qTEpwsbDDCIuxcYZBXACrTFTbJfMZd6zH6vEBiVTQ1vV4z
 n9+OWiet6u7Ci+SG8W5mtfk/tzViRGOKZ/dCgWIyPi9MOf5Mi6JnPjByT2JhrnE7kGLI
 J2R8x2E8KC3R4ko50iT+cZjy1DBehay3RFj+pNYm+HosWmvC4FRy6KAA6Gf3/QeMpJcb
 /Pid4cZNvlRyerbpfxWRj1Fp2Hk4zlesZVvSZUuOlOjvbx9fal88ogMjoPScOO6WYkfA
 yzLo8+MCE4KZDKXebhTcv3zp/wfEB2OiNM7UWEfolVD0zkpNwhSXdfY5jag+rUjtCJyX
 3mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRolyktA3w+T8Flrx64dPXxNwnCw3mO2ZM/b7kcuGZ4=;
 b=cxMnp1lNV5iKiMFDsu0B+n4hk8JhoLwKRrMKRYPrfTPp5doVZ9P1SWbXjqVL/w7WVb
 aIOWEaZmN+hW+J/r7mMyzt5QuFG89mwc19p6Z7NIl+bN8XK5/WqVmooxL+fwy0AzEl+u
 7u+MSgsfS+r/q9RW9QVXOWhrEs4mrwgzljaRSF6wzre4ZUq/YFWkbHp89ecwsedSeIb6
 50rcPWjibpKMA6wR2A/pso5afX20yRSEFBe/FD9vfF0JhnLT4aYx6AfkvrJVXQ0egi7a
 LNydJzUo4wX7e1oBtevV3T7wQL4gOdqqywShn6n6aDWnzzhv8Eegdu8LWkOJ95F1vcNk
 4OJQ==
X-Gm-Message-State: AO0yUKUVM/2OwR8bv8SOgcPBClQWRmTxTQwut7UJk05Qn/1gN4RtcFmQ
 dR/SMDaqObxJgR4EN1AJj11o4g==
X-Google-Smtp-Source: AK7set//qHOKXvIq/kbwpxJEGOIhvfFHyrEjRG/X+SSVpcpV+Tg6h5zRP0S3XIHPhorVQixwwaM0+g==
X-Received: by 2002:a05:6a20:5198:b0:cc:3da8:63a1 with SMTP id
 j24-20020a056a20519800b000cc3da863a1mr4195852pzf.43.1677316793482; 
 Sat, 25 Feb 2023 01:19:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 54/76] target/rx: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:14:05 -1000
Message-Id: <20230225091427.1817156-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:18 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 84 -------------------------------------------
 1 file changed, 84 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index af23876cb3..6624414739 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -429,7 +429,6 @@ static bool trans_MOV_rm(DisasContext *ctx, arg_MOV_rm *a)
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rd], a->dsp << a->sz);
     rx_gen_st(a->sz, cpu_regs[a->rs], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -440,7 +439,6 @@ static bool trans_MOV_mr(DisasContext *ctx, arg_MOV_mr *a)
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rs], a->dsp << a->sz);
     rx_gen_ld(a->sz, cpu_regs[a->rd], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -462,8 +460,6 @@ static bool trans_MOV_im(DisasContext *ctx, arg_MOV_im *a)
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rd], a->dsp << a->sz);
     rx_gen_st(a->sz, imm, mem);
-    tcg_temp_free(imm);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -474,7 +470,6 @@ static bool trans_MOV_ar(DisasContext *ctx, arg_MOV_ar *a)
     mem = tcg_temp_new();
     rx_gen_regindex(ctx, mem, a->sz, a->ri, a->rb);
     rx_gen_ld(a->sz, cpu_regs[a->rd], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -485,7 +480,6 @@ static bool trans_MOV_ra(DisasContext *ctx, arg_MOV_ra *a)
     mem = tcg_temp_new();
     rx_gen_regindex(ctx, mem, a->sz, a->ri, a->rb);
     rx_gen_st(a->sz, cpu_regs[a->rs], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -521,9 +515,7 @@ static bool trans_MOV_mm(DisasContext *ctx, arg_MOV_mm *a)
         rx_gen_ld(a->sz, tmp, addr);
         addr = rx_index_addr(ctx, mem, a->ldd, a->sz, a->rd);
         rx_gen_st(a->sz, tmp, addr);
-        tcg_temp_free(tmp);
     }
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -541,7 +533,6 @@ static bool trans_MOV_rp(DisasContext *ctx, arg_MOV_rp *a)
     if (a->ad == 0) {
         tcg_gen_addi_i32(cpu_regs[a->rd], cpu_regs[a->rd], 1 << a->sz);
     }
-    tcg_temp_free(val);
     return true;
 }
 
@@ -559,7 +550,6 @@ static bool trans_MOV_pr(DisasContext *ctx, arg_MOV_pr *a)
         tcg_gen_addi_i32(cpu_regs[a->rd], cpu_regs[a->rd], 1 << a->sz);
     }
     tcg_gen_mov_i32(cpu_regs[a->rs], val);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -571,7 +561,6 @@ static bool trans_MOVU_mr(DisasContext *ctx, arg_MOVU_mr *a)
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rs], a->dsp << a->sz);
     rx_gen_ldu(a->sz, cpu_regs[a->rd], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -592,7 +581,6 @@ static bool trans_MOVU_ar(DisasContext *ctx, arg_MOVU_ar *a)
     mem = tcg_temp_new();
     rx_gen_regindex(ctx, mem, a->sz, a->ri, a->rb);
     rx_gen_ldu(a->sz, cpu_regs[a->rd], mem);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -610,7 +598,6 @@ static bool trans_MOVU_pr(DisasContext *ctx, arg_MOVU_pr *a)
         tcg_gen_addi_i32(cpu_regs[a->rd], cpu_regs[a->rd], 1 << a->sz);
     }
     tcg_gen_mov_i32(cpu_regs[a->rs], val);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -635,7 +622,6 @@ static bool trans_POPC(DisasContext *ctx, arg_POPC *a)
     val = tcg_temp_new();
     pop(val);
     move_to_cr(ctx, val, a->cr);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -663,7 +649,6 @@ static bool trans_PUSH_r(DisasContext *ctx, arg_PUSH_r *a)
     tcg_gen_mov_i32(val, cpu_regs[a->rs]);
     tcg_gen_subi_i32(cpu_sp, cpu_sp, 4);
     rx_gen_st(a->sz, val, cpu_sp);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -677,8 +662,6 @@ static bool trans_PUSH_m(DisasContext *ctx, arg_PUSH_m *a)
     rx_gen_ld(a->sz, val, addr);
     tcg_gen_subi_i32(cpu_sp, cpu_sp, 4);
     rx_gen_st(a->sz, val, cpu_sp);
-    tcg_temp_free(mem);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -689,7 +672,6 @@ static bool trans_PUSHC(DisasContext *ctx, arg_PUSHC *a)
     val = tcg_temp_new();
     move_from_cr(ctx, val, a->cr, ctx->pc);
     push(val);
-    tcg_temp_free(val);
     return true;
 }
 
@@ -717,7 +699,6 @@ static bool trans_XCHG_rr(DisasContext *ctx, arg_XCHG_rr *a)
     tcg_gen_mov_i32(tmp, cpu_regs[a->rs]);
     tcg_gen_mov_i32(cpu_regs[a->rs], cpu_regs[a->rd]);
     tcg_gen_mov_i32(cpu_regs[a->rd], tmp);
-    tcg_temp_free(tmp);
     return true;
 }
 
@@ -741,7 +722,6 @@ static bool trans_XCHG_mr(DisasContext *ctx, arg_XCHG_mr *a)
     }
     tcg_gen_atomic_xchg_i32(cpu_regs[a->rd], addr, cpu_regs[a->rd],
                             0, mi_to_mop(a->mi));
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -753,8 +733,6 @@ static inline void stcond(TCGCond cond, int rd, int imm)
     _imm = tcg_const_i32(imm);
     tcg_gen_movcond_i32(cond, cpu_regs[rd], cpu_psw_z, z,
                         _imm, cpu_regs[rd]);
-    tcg_temp_free(z);
-    tcg_temp_free(_imm);
 }
 
 /* stz #imm,rd */
@@ -785,12 +763,9 @@ static bool trans_SCCnd(DisasContext *ctx, arg_SCCnd *a)
         tcg_gen_setcondi_i32(dc.cond, val, dc.value, 0);
         addr = rx_index_addr(ctx, mem, a->sz, a->ld, a->rd);
         rx_gen_st(a->sz, val, addr);
-        tcg_temp_free(val);
-        tcg_temp_free(mem);
     } else {
         tcg_gen_setcondi_i32(dc.cond, cpu_regs[a->rd], dc.value, 0);
     }
-    tcg_temp_free(dc.temp);
     return true;
 }
 
@@ -842,7 +817,6 @@ static inline void rx_gen_op_irr(op3fn opr, int dst, int src, uint32_t src2)
 {
     TCGv imm = tcg_const_i32(src2);
     opr(cpu_regs[dst], cpu_regs[src], imm);
-    tcg_temp_free(imm);
 }
 
 static inline void rx_gen_op_mr(op3fn opr, DisasContext *ctx,
@@ -852,7 +826,6 @@ static inline void rx_gen_op_mr(op3fn opr, DisasContext *ctx,
     mem = tcg_temp_new();
     val = rx_load_source(ctx, mem, ld, mi, src);
     opr(cpu_regs[dst], cpu_regs[dst], val);
-    tcg_temp_free(mem);
 }
 
 static void rx_and(TCGv ret, TCGv arg1, TCGv arg2)
@@ -1003,7 +976,6 @@ static void rx_adc(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_xor_i32(z, arg1, arg2);
     tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
     tcg_gen_mov_i32(ret, cpu_psw_s);
-    tcg_temp_free(z);
 }
 
 /* adc #imm, rd */
@@ -1042,7 +1014,6 @@ static void rx_add(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_xor_i32(z, arg1, arg2);
     tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
     tcg_gen_mov_i32(ret, cpu_psw_s);
-    tcg_temp_free(z);
 }
 
 /* add #uimm4, rd */
@@ -1079,7 +1050,6 @@ static void rx_sub(TCGv ret, TCGv arg1, TCGv arg2)
     temp = tcg_temp_new_i32();
     tcg_gen_xor_i32(temp, arg1, arg2);
     tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, temp);
-    tcg_temp_free_i32(temp);
     /* CMP not required return */
     if (ret) {
         tcg_gen_mov_i32(ret, cpu_psw_s);
@@ -1097,7 +1067,6 @@ static void rx_sbb(TCGv ret, TCGv arg1, TCGv arg2)
     temp = tcg_temp_new();
     tcg_gen_not_i32(temp, arg2);
     rx_adc(ret, arg1, temp);
-    tcg_temp_free(temp);
 }
 
 /* cmp #imm4, rs2 */
@@ -1165,8 +1134,6 @@ static void rx_abs(TCGv ret, TCGv arg1)
     zero = tcg_const_i32(0);
     tcg_gen_neg_i32(neg, arg1);
     tcg_gen_movcond_i32(TCG_COND_LT, ret, arg1, zero, neg, arg1);
-    tcg_temp_free(neg);
-    tcg_temp_free(zero);
 }
 
 /* abs rd */
@@ -1239,7 +1206,6 @@ static bool trans_EMUL_ir(DisasContext *ctx, arg_EMUL_ir *a)
     }
     tcg_gen_muls2_i32(cpu_regs[a->rd], cpu_regs[(a->rd + 1) & 15],
                       cpu_regs[a->rd], imm);
-    tcg_temp_free(imm);
     return true;
 }
 
@@ -1255,7 +1221,6 @@ static bool trans_EMUL_mr(DisasContext *ctx, arg_EMUL_mr *a)
     val = rx_load_source(ctx, mem, a->ld, a->mi, a->rs);
     tcg_gen_muls2_i32(cpu_regs[a->rd], cpu_regs[(a->rd + 1) & 15],
                       cpu_regs[a->rd], val);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -1268,7 +1233,6 @@ static bool trans_EMULU_ir(DisasContext *ctx, arg_EMULU_ir *a)
     }
     tcg_gen_mulu2_i32(cpu_regs[a->rd], cpu_regs[(a->rd + 1) & 15],
                       cpu_regs[a->rd], imm);
-    tcg_temp_free(imm);
     return true;
 }
 
@@ -1284,7 +1248,6 @@ static bool trans_EMULU_mr(DisasContext *ctx, arg_EMULU_mr *a)
     val = rx_load_source(ctx, mem, a->ld, a->mi, a->rs);
     tcg_gen_mulu2_i32(cpu_regs[a->rd], cpu_regs[(a->rd + 1) & 15],
                       cpu_regs[a->rd], val);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -1381,8 +1344,6 @@ static bool trans_SHLL_rr(DisasContext *ctx, arg_SHLL_rr *a)
     gen_set_label(done);
     tcg_gen_mov_i32(cpu_psw_z, cpu_regs[a->rd]);
     tcg_gen_mov_i32(cpu_psw_s, cpu_regs[a->rd]);
-    tcg_temp_free(count);
-    tcg_temp_free(tmp);
     return true;
 }
 
@@ -1436,7 +1397,6 @@ static inline void shiftr_reg(uint32_t rd, uint32_t rs, unsigned int alith)
     tcg_gen_movi_i32(cpu_psw_o, 0);
     tcg_gen_mov_i32(cpu_psw_z, cpu_regs[rd]);
     tcg_gen_mov_i32(cpu_psw_s, cpu_regs[rd]);
-    tcg_temp_free(count);
 }
 
 /* shar #imm:5, rd */
@@ -1480,7 +1440,6 @@ static bool trans_ROLC(DisasContext *ctx, arg_ROLC *a)
     tcg_gen_mov_i32(cpu_psw_c, tmp);
     tcg_gen_mov_i32(cpu_psw_z, cpu_regs[a->rd]);
     tcg_gen_mov_i32(cpu_psw_s, cpu_regs[a->rd]);
-    tcg_temp_free(tmp);
     return true;
 }
 
@@ -1570,7 +1529,6 @@ static bool trans_REVW(DisasContext *ctx, arg_REVW *a)
     tcg_gen_shri_i32(cpu_regs[a->rd], cpu_regs[a->rs], 8);
     tcg_gen_andi_i32(cpu_regs[a->rd], cpu_regs[a->rd], 0x00ff00ff);
     tcg_gen_or_i32(cpu_regs[a->rd], cpu_regs[a->rd], tmp);
-    tcg_temp_free(tmp);
     return true;
 }
 
@@ -1592,7 +1550,6 @@ static void rx_bcnd_main(DisasContext *ctx, int cd, int dst)
         gen_set_label(t);
         gen_goto_tb(ctx, 1, ctx->pc + dst);
         gen_set_label(done);
-        tcg_temp_free(dc.temp);
         break;
     case 14:
         /* always true case */
@@ -1642,7 +1599,6 @@ static inline void rx_save_pc(DisasContext *ctx)
 {
     TCGv pc = tcg_const_i32(ctx->base.pc_next);
     push(pc);
-    tcg_temp_free(pc);
 }
 
 /* jmp rs */
@@ -1726,7 +1682,6 @@ static bool trans_SMOVB(DisasContext *ctx, arg_SMOVB *a)
     do {                                        \
         TCGv size = tcg_const_i32(a->sz);       \
         gen_helper_##op(cpu_env, size);         \
-        tcg_temp_free(size);                    \
     } while (0)
 
 /* suntile.<bwl> */
@@ -1767,8 +1722,6 @@ static void rx_mul64hi(TCGv_i64 ret, int rs, int rs2)
     tcg_gen_sari_i64(tmp1, tmp1, 16);
     tcg_gen_mul_i64(ret, tmp0, tmp1);
     tcg_gen_shli_i64(ret, ret, 16);
-    tcg_temp_free_i64(tmp0);
-    tcg_temp_free_i64(tmp1);
 }
 
 static void rx_mul64lo(TCGv_i64 ret, int rs, int rs2)
@@ -1782,8 +1735,6 @@ static void rx_mul64lo(TCGv_i64 ret, int rs, int rs2)
     tcg_gen_ext16s_i64(tmp1, tmp1);
     tcg_gen_mul_i64(ret, tmp0, tmp1);
     tcg_gen_shli_i64(ret, ret, 16);
-    tcg_temp_free_i64(tmp0);
-    tcg_temp_free_i64(tmp1);
 }
 
 /* mulhi rs,rs2 */
@@ -1807,7 +1758,6 @@ static bool trans_MACHI(DisasContext *ctx, arg_MACHI *a)
     tmp = tcg_temp_new_i64();
     rx_mul64hi(tmp, a->rs, a->rs2);
     tcg_gen_add_i64(cpu_acc, cpu_acc, tmp);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -1818,7 +1768,6 @@ static bool trans_MACLO(DisasContext *ctx, arg_MACLO *a)
     tmp = tcg_temp_new_i64();
     rx_mul64lo(tmp, a->rs, a->rs2);
     tcg_gen_add_i64(cpu_acc, cpu_acc, tmp);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -1836,7 +1785,6 @@ static bool trans_MVFACMI(DisasContext *ctx, arg_MVFACMI *a)
     rd64 = tcg_temp_new_i64();
     tcg_gen_extract_i64(rd64, cpu_acc, 16, 32);
     tcg_gen_extrl_i64_i32(cpu_regs[a->rd], rd64);
-    tcg_temp_free_i64(rd64);
     return true;
 }
 
@@ -1847,7 +1795,6 @@ static bool trans_MVTACHI(DisasContext *ctx, arg_MVTACHI *a)
     rs64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(rs64, cpu_regs[a->rs]);
     tcg_gen_deposit_i64(cpu_acc, cpu_acc, rs64, 32, 32);
-    tcg_temp_free_i64(rs64);
     return true;
 }
 
@@ -1858,7 +1805,6 @@ static bool trans_MVTACLO(DisasContext *ctx, arg_MVTACLO *a)
     rs64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(rs64, cpu_regs[a->rs]);
     tcg_gen_deposit_i64(cpu_acc, cpu_acc, rs64, 0, 32);
-    tcg_temp_free_i64(rs64);
     return true;
 }
 
@@ -1867,7 +1813,6 @@ static bool trans_RACW(DisasContext *ctx, arg_RACW *a)
 {
     TCGv imm = tcg_const_i32(a->imm + 1);
     gen_helper_racw(cpu_env, imm);
-    tcg_temp_free(imm);
     return true;
 }
 
@@ -1883,8 +1828,6 @@ static bool trans_SAT(DisasContext *ctx, arg_SAT *a)
     tcg_gen_xori_i32(tmp, tmp, 0x80000000);
     tcg_gen_movcond_i32(TCG_COND_LT, cpu_regs[a->rd],
                         cpu_psw_o, z, tmp, cpu_regs[a->rd]);
-    tcg_temp_free(tmp);
-    tcg_temp_free(z);
     return true;
 }
 
@@ -1903,7 +1846,6 @@ static bool trans_SATR(DisasContext *ctx, arg_SATR *a)
         TCGv imm = tcg_const_i32(li(ctx, 0));                           \
         gen_helper_##op(cpu_regs[a->rd], cpu_env,                       \
                         cpu_regs[a->rd], imm);                          \
-        tcg_temp_free(imm);                                             \
         return true;                                                    \
     }                                                                   \
     static bool cat3(trans_, name, _mr)(DisasContext *ctx,              \
@@ -1914,7 +1856,6 @@ static bool trans_SATR(DisasContext *ctx, arg_SATR *a)
         val = rx_load_source(ctx, mem, a->ld, MO_32, a->rs);            \
         gen_helper_##op(cpu_regs[a->rd], cpu_env,                       \
                         cpu_regs[a->rd], val);                          \
-        tcg_temp_free(mem);                                             \
         return true;                                                    \
     }
 
@@ -1925,7 +1866,6 @@ static bool trans_SATR(DisasContext *ctx, arg_SATR *a)
         mem = tcg_temp_new();                                   \
         val = rx_load_source(ctx, mem, a->ld, MO_32, a->rs);    \
         gen_helper_##op(cpu_regs[a->rd], cpu_env, val);         \
-        tcg_temp_free(mem);                                     \
         return true;                                            \
     }
 
@@ -1939,7 +1879,6 @@ static bool trans_FCMP_ir(DisasContext *ctx, arg_FCMP_ir * a)
 {
     TCGv imm = tcg_const_i32(li(ctx, 0));
     gen_helper_fcmp(cpu_env, cpu_regs[a->rd], imm);
-    tcg_temp_free(imm);
     return true;
 }
 
@@ -1951,7 +1890,6 @@ static bool trans_FCMP_mr(DisasContext *ctx, arg_FCMP_mr *a)
     mem = tcg_temp_new();
     val = rx_load_source(ctx, mem, a->ld, MO_32, a->rs);
     gen_helper_fcmp(cpu_env, cpu_regs[a->rd], val);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -1966,7 +1904,6 @@ static bool trans_ITOF(DisasContext *ctx, arg_ITOF * a)
     mem = tcg_temp_new();
     val = rx_load_source(ctx, mem, a->ld, a->mi, a->rs);
     gen_helper_itof(cpu_regs[a->rd], cpu_env, val);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -1977,7 +1914,6 @@ static void rx_bsetm(TCGv mem, TCGv mask)
     rx_gen_ld(MO_8, val, mem);
     tcg_gen_or_i32(val, val, mask);
     rx_gen_st(MO_8, val, mem);
-    tcg_temp_free(val);
 }
 
 static void rx_bclrm(TCGv mem, TCGv mask)
@@ -1987,7 +1923,6 @@ static void rx_bclrm(TCGv mem, TCGv mask)
     rx_gen_ld(MO_8, val, mem);
     tcg_gen_andc_i32(val, val, mask);
     rx_gen_st(MO_8, val, mem);
-    tcg_temp_free(val);
 }
 
 static void rx_btstm(TCGv mem, TCGv mask)
@@ -1998,7 +1933,6 @@ static void rx_btstm(TCGv mem, TCGv mask)
     tcg_gen_and_i32(val, val, mask);
     tcg_gen_setcondi_i32(TCG_COND_NE, cpu_psw_c, val, 0);
     tcg_gen_mov_i32(cpu_psw_z, cpu_psw_c);
-    tcg_temp_free(val);
 }
 
 static void rx_bnotm(TCGv mem, TCGv mask)
@@ -2008,7 +1942,6 @@ static void rx_bnotm(TCGv mem, TCGv mask)
     rx_gen_ld(MO_8, val, mem);
     tcg_gen_xor_i32(val, val, mask);
     rx_gen_st(MO_8, val, mem);
-    tcg_temp_free(val);
 }
 
 static void rx_bsetr(TCGv reg, TCGv mask)
@@ -2028,7 +1961,6 @@ static inline void rx_btstr(TCGv reg, TCGv mask)
     tcg_gen_and_i32(t0, reg, mask);
     tcg_gen_setcondi_i32(TCG_COND_NE, cpu_psw_c, t0, 0);
     tcg_gen_mov_i32(cpu_psw_z, cpu_psw_c);
-    tcg_temp_free(t0);
 }
 
 static inline void rx_bnotr(TCGv reg, TCGv mask)
@@ -2045,8 +1977,6 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
         mask = tcg_const_i32(1 << a->imm);                              \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
-        tcg_temp_free(mask);                                            \
-        tcg_temp_free(mem);                                             \
         return true;                                                    \
     }                                                                   \
     static bool cat3(trans_, name, _ir)(DisasContext *ctx,              \
@@ -2055,7 +1985,6 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
         TCGv mask;                                                      \
         mask = tcg_const_i32(1 << a->imm);                              \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
-        tcg_temp_free(mask);                                            \
         return true;                                                    \
     }                                                                   \
     static bool cat3(trans_, name, _rr)(DisasContext *ctx,              \
@@ -2067,8 +1996,6 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
         tcg_gen_andi_i32(b, cpu_regs[a->rs], 31);                       \
         tcg_gen_shl_i32(mask, mask, b);                                 \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
-        tcg_temp_free(mask);                                            \
-        tcg_temp_free(b);                                               \
         return true;                                                    \
     }                                                                   \
     static bool cat3(trans_, name, _rm)(DisasContext *ctx,              \
@@ -2082,9 +2009,6 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
         mem = tcg_temp_new();                                           \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
-        tcg_temp_free(mem);                                             \
-        tcg_temp_free(mask);                                            \
-        tcg_temp_free(b);                                               \
         return true;                                                    \
     }
 
@@ -2103,8 +2027,6 @@ static inline void bmcnd_op(TCGv val, TCGCond cond, int pos)
     tcg_gen_andi_i32(val, val, ~(1 << pos));
     tcg_gen_setcondi_i32(dc.cond, bit, dc.value, 0);
     tcg_gen_deposit_i32(val, val, bit, pos, 1);
-    tcg_temp_free(bit);
-    tcg_temp_free(dc.temp);
  }
 
 /* bmcnd #imm, dsp[rd] */
@@ -2117,8 +2039,6 @@ static bool trans_BMCnd_im(DisasContext *ctx, arg_BMCnd_im *a)
     rx_gen_ld(MO_8, val, addr);
     bmcnd_op(val, a->cd, a->imm);
     rx_gen_st(MO_8, val, addr);
-    tcg_temp_free(val);
-    tcg_temp_free(mem);
     return true;
 }
 
@@ -2210,7 +2130,6 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 
     imm = tcg_const_i32(a->imm);
     move_to_cr(ctx, imm, a->cr);
-    tcg_temp_free(imm);
     return true;
 }
 
@@ -2238,7 +2157,6 @@ static bool trans_RTFI(DisasContext *ctx, arg_RTFI *a)
         tcg_gen_mov_i32(psw, cpu_bpsw);
         gen_helper_set_psw_rte(cpu_env, psw);
         ctx->base.is_jmp = DISAS_EXIT;
-        tcg_temp_free(psw);
     }
     return true;
 }
@@ -2253,7 +2171,6 @@ static bool trans_RTE(DisasContext *ctx, arg_RTE *a)
         pop(psw);
         gen_helper_set_psw_rte(cpu_env, psw);
         ctx->base.is_jmp = DISAS_EXIT;
-        tcg_temp_free(psw);
     }
     return true;
 }
@@ -2276,7 +2193,6 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
     vec = tcg_const_i32(a->imm);
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
     gen_helper_rxint(cpu_env, vec);
-    tcg_temp_free(vec);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
-- 
2.34.1


