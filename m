Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1u-0008Fk-8e
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1n-0007tz-6X
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:23 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1h-0007fc-Q9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:22 -0500
Received: by mail-pj1-x1041.google.com with SMTP id x34so4913995pjj.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKuhry1+rNBBF3JD8VJFYog29cwlZnnDsNByu0HUpIA=;
 b=Sayt5Vvx6zx7Ta7PBxd20mk8JxqZxyy4dUaISoD1qQuglrM0paqtx754pipvFQ9b89
 C7GR0Pt9NMa66VhqSC6W/vHyFYSVLw5biMaOQPfWxYAA4Sa6FlOqnfOvylQbGA6nlUzv
 pgJ4NIXsmWbFIDQAy3PO4k/u9ozYUYSYupB89mwHBZmmgM70v0WyHSfrT2H1s4Gci0tB
 n2gnb+etezILSTkaZhfvVC2/6O5W7G/6cQ7L+TvHqXM5jMzpQwnG415hkL0SoVb0oDtE
 gFk85IMoA8k/u6/svnRHNnZkBIv5oYLYoT0/t9HuxXHS8OtP5hY3RZTYuWyBIeX5ej61
 fr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKuhry1+rNBBF3JD8VJFYog29cwlZnnDsNByu0HUpIA=;
 b=YFsi/t6zR1HiAK/otNQ6cX8r6lXPvZY93njxMwGZbwqwtYrYXqFvUcf0CUqi7FYyPL
 5h+/9ZhZBSno03xlX2dQyZsryyG9cSYDUs80O60335KqONq22MhQaRZ6nap5E7uZJbrX
 5+PtZfgg61qqodtvTG6iA9Wm5bBXwUl+pS0qcDy7iDFKiOCHSUo0u9zyYMnN2V54ebYa
 IrcsGugWdrAEKAr3GhUyOKtS+UKyYqiICl5QkgReEM9uPUmCgyU8fGy3px34ZDvqQcb3
 QtlJvZO4eP611dFg/xVj25baS0vH0KNZf9Jp4oE1x5k4QsPUYbnrTshn+CXDjD8cQ5kj
 sjkA==
X-Gm-Message-State: AO0yUKVM7SzyPGUJCirLdTZT1oLDRa2aPUNvnKzu4M9dqim2yGgvCpJX
 inpCyJ/S2upBvB+NMuuuJZZ8BcRjkUL20i5P26vuNg==
X-Google-Smtp-Source: AK7set+/Oq2yaGuidDyze7ObnBT8j/sw9WnTQRX0ikQ1W0GT+sGkCsr5sZIdEivJJJJ+Oh0r/oooiA==
X-Received: by 2002:a17:902:dad1:b0:196:5839:b374 with SMTP id
 q17-20020a170902dad100b001965839b374mr27846291plx.9.1677475576198; 
 Sun, 26 Feb 2023 21:26:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 24/76] target/cris: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:13 -1000
Message-Id: <20230227052505.352889-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:23 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 70 ---------------------------------
 target/cris/translate_v10.c.inc | 41 -------------------
 2 files changed, 111 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 439af701e6..5172c9b9b2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -178,7 +178,6 @@ static const int preg_sizes[] = {
     do { \
         TCGv tc = tcg_const_tl(c); \
         t_gen_mov_env_TN(member, tc); \
-        tcg_temp_free(tc); \
     } while (0)
 
 static inline void t_gen_mov_TN_preg(TCGv tn, int r)
@@ -271,7 +270,6 @@ static inline void t_gen_raise_exception(uint32_t index)
 {
         TCGv_i32 tmp = tcg_const_i32(index);
         gen_helper_raise_exception(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
 }
 
 static void t_gen_lsl(TCGv d, TCGv a, TCGv b)
@@ -286,8 +284,6 @@ static void t_gen_lsl(TCGv d, TCGv a, TCGv b)
     tcg_gen_sar_tl(t0, t0, t_31);
     tcg_gen_and_tl(t0, t0, d);
     tcg_gen_xor_tl(d, d, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free(t_31);
 }
 
 static void t_gen_lsr(TCGv d, TCGv a, TCGv b)
@@ -303,8 +299,6 @@ static void t_gen_lsr(TCGv d, TCGv a, TCGv b)
     tcg_gen_sar_tl(t0, t0, t_31);
     tcg_gen_and_tl(t0, t0, d);
     tcg_gen_xor_tl(d, d, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free(t_31);
 }
 
 static void t_gen_asr(TCGv d, TCGv a, TCGv b)
@@ -319,8 +313,6 @@ static void t_gen_asr(TCGv d, TCGv a, TCGv b)
     tcg_gen_sub_tl(t0, t_31, b);
     tcg_gen_sar_tl(t0, t0, t_31);
     tcg_gen_or_tl(d, d, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free(t_31);
 }
 
 static void t_gen_cris_dstep(TCGv d, TCGv a, TCGv b)
@@ -335,7 +327,6 @@ static void t_gen_cris_dstep(TCGv d, TCGv a, TCGv b)
     tcg_gen_shli_tl(d, a, 1);
     tcg_gen_sub_tl(t, d, b);
     tcg_gen_movcond_tl(TCG_COND_GEU, d, d, b, t, d);
-    tcg_temp_free(t);
 }
 
 static void t_gen_cris_mstep(TCGv d, TCGv a, TCGv b, TCGv ccs)
@@ -353,7 +344,6 @@ static void t_gen_cris_mstep(TCGv d, TCGv a, TCGv b, TCGv ccs)
     tcg_gen_sari_tl(t, t, 31);
     tcg_gen_and_tl(t, t, b);
     tcg_gen_add_tl(d, d, t);
-    tcg_temp_free(t);
 }
 
 /* Extended arithmetics on CRIS.  */
@@ -369,7 +359,6 @@ static inline void t_gen_add_flag(TCGv d, int flag)
         tcg_gen_shri_tl(c, c, flag);
     }
     tcg_gen_add_tl(d, d, c);
-    tcg_temp_free(c);
 }
 
 static inline void t_gen_addx_carry(DisasContext *dc, TCGv d)
@@ -381,7 +370,6 @@ static inline void t_gen_addx_carry(DisasContext *dc, TCGv d)
         /* C flag is already at bit 0.  */
         tcg_gen_andi_tl(c, c, C_FLAG);
         tcg_gen_add_tl(d, d, c);
-        tcg_temp_free(c);
     }
 }
 
@@ -394,7 +382,6 @@ static inline void t_gen_subx_carry(DisasContext *dc, TCGv d)
         /* C flag is already at bit 0.  */
         tcg_gen_andi_tl(c, c, C_FLAG);
         tcg_gen_sub_tl(d, d, c);
-        tcg_temp_free(c);
     }
 }
 
@@ -414,8 +401,6 @@ static inline void t_gen_swapb(TCGv d, TCGv s)
     tcg_gen_shri_tl(t, org_s, 8);
     tcg_gen_andi_tl(t, t, 0x00ff00ff);
     tcg_gen_or_tl(d, d, t);
-    tcg_temp_free(t);
-    tcg_temp_free(org_s);
 }
 
 /* Swap the halfwords of the s operand.  */
@@ -428,7 +413,6 @@ static inline void t_gen_swapw(TCGv d, TCGv s)
     tcg_gen_shli_tl(d, t, 16);
     tcg_gen_shri_tl(t, t, 16);
     tcg_gen_or_tl(d, d, t);
-    tcg_temp_free(t);
 }
 
 /* Reverse the within each byte.
@@ -475,8 +459,6 @@ static void t_gen_swapr(TCGv d, TCGv s)
         tcg_gen_andi_tl(t, t,  bitrev[i].mask);
         tcg_gen_or_tl(d, d, t);
     }
-    tcg_temp_free(t);
-    tcg_temp_free(org_s);
 }
 
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
@@ -778,9 +760,6 @@ static void cris_alu(DisasContext *dc, int op,
         }
         tcg_gen_or_tl(d, d, tmp);
     }
-    if (tmp != d) {
-        tcg_temp_free(tmp);
-    }
 }
 
 static int arith_cc(DisasContext *dc)
@@ -919,8 +898,6 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int cond)
             tcg_gen_shli_tl(cc, tmp, 2);
             tcg_gen_and_tl(cc, tmp, cc);
             tcg_gen_andi_tl(cc, cc, Z_FLAG);
-
-            tcg_temp_free(tmp);
         }
         break;
     case CC_GE:
@@ -959,9 +936,6 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int cond)
             tcg_gen_xori_tl(n, n, 2);
             tcg_gen_and_tl(cc, z, n);
             tcg_gen_andi_tl(cc, cc, 2);
-
-            tcg_temp_free(n);
-            tcg_temp_free(z);
         }
         break;
     case CC_LE:
@@ -980,9 +954,6 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int cond)
             tcg_gen_xor_tl(n, n, cpu_PR[PR_CCS]);
             tcg_gen_or_tl(cc, z, n);
             tcg_gen_andi_tl(cc, cc, 2);
-
-            tcg_temp_free(n);
-            tcg_temp_free(z);
         }
         break;
     case CC_P:
@@ -1282,7 +1253,6 @@ static int dec_addq(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->op1);
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
-    tcg_temp_free(c);
     return 2;
 }
 static int dec_moveq(CPUCRISState *env, DisasContext *dc)
@@ -1307,7 +1277,6 @@ static int dec_subq(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->op1);
     cris_alu(dc, CC_OP_SUB,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
-    tcg_temp_free(c);
     return 2;
 }
 static int dec_cmpq(CPUCRISState *env, DisasContext *dc)
@@ -1323,7 +1292,6 @@ static int dec_cmpq(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(imm);
     cris_alu(dc, CC_OP_CMP,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
-    tcg_temp_free(c);
     return 2;
 }
 static int dec_andq(CPUCRISState *env, DisasContext *dc)
@@ -1339,7 +1307,6 @@ static int dec_andq(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(imm);
     cris_alu(dc, CC_OP_AND,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
-    tcg_temp_free(c);
     return 2;
 }
 static int dec_orq(CPUCRISState *env, DisasContext *dc)
@@ -1354,7 +1321,6 @@ static int dec_orq(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(imm);
     cris_alu(dc, CC_OP_OR,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
-    tcg_temp_free(c);
     return 2;
 }
 static int dec_btstq(CPUCRISState *env, DisasContext *dc)
@@ -1368,7 +1334,6 @@ static int dec_btstq(CPUCRISState *env, DisasContext *dc)
     cris_evaluate_flags(dc);
     gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
             c, cpu_PR[PR_CCS]);
-    tcg_temp_free(c);
     cris_alu(dc, CC_OP_MOVE,
          cpu_R[dc->op2], cpu_R[dc->op2], cpu_R[dc->op2], 4);
     cris_update_cc_op(dc, CC_OP_FLAGS, 4);
@@ -1437,7 +1402,6 @@ static int dec_move_r(CPUCRISState *env, DisasContext *dc)
         cris_alu(dc, CC_OP_MOVE,
              cpu_R[dc->op2],
              cpu_R[dc->op2], t0, size);
-        tcg_temp_free(t0);
     }
     return 2;
 }
@@ -1492,7 +1456,6 @@ static int dec_lz_r(CPUCRISState *env, DisasContext *dc)
     t0 = tcg_temp_new();
     dec_prep_alu_r(dc, dc->op1, dc->op2, 4, 0, cpu_R[dc->op2], t0);
     cris_alu(dc, CC_OP_LZ, cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1609,7 +1572,6 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
-    tcg_temp_free(l0);
     return 2;
 }
 
@@ -1724,7 +1686,6 @@ static int dec_swap_r(CPUCRISState *env, DisasContext *dc)
         t_gen_swapr(t0, t0);
     }
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->op1], cpu_R[dc->op1], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1750,7 +1711,6 @@ static int dec_addi_r(CPUCRISState *env, DisasContext *dc)
     t0 = tcg_temp_new();
     tcg_gen_shli_tl(t0, cpu_R[dc->op2], dc->zzsize);
     tcg_gen_add_tl(cpu_R[dc->op1], cpu_R[dc->op1], t0);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1763,7 +1723,6 @@ static int dec_addi_acr(CPUCRISState *env, DisasContext *dc)
     t0 = tcg_temp_new();
     tcg_gen_shli_tl(t0, cpu_R[dc->op2], dc->zzsize);
     tcg_gen_add_tl(cpu_R[R_ACR], cpu_R[dc->op1], t0);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1822,7 +1781,6 @@ static int dec_movu_r(CPUCRISState *env, DisasContext *dc)
     t0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, t0);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1841,7 +1799,6 @@ static int dec_movs_r(CPUCRISState *env, DisasContext *dc)
     t_gen_sext(t0, cpu_R[dc->op1], size);
     cris_alu(dc, CC_OP_MOVE,
             cpu_R[dc->op2], cpu_R[dc->op1], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1859,7 +1816,6 @@ static int dec_addu_r(CPUCRISState *env, DisasContext *dc)
     /* Size can only be qi or hi.  */
     t_gen_zext(t0, cpu_R[dc->op1], size);
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1878,7 +1834,6 @@ static int dec_adds_r(CPUCRISState *env, DisasContext *dc)
     t_gen_sext(t0, cpu_R[dc->op1], size);
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1897,7 +1852,6 @@ static int dec_subu_r(CPUCRISState *env, DisasContext *dc)
     t_gen_zext(t0, cpu_R[dc->op1], size);
     cris_alu(dc, CC_OP_SUB,
             cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1916,7 +1870,6 @@ static int dec_subs_r(CPUCRISState *env, DisasContext *dc)
     t_gen_sext(t0, cpu_R[dc->op1], size);
     cris_alu(dc, CC_OP_SUB,
             cpu_R[dc->op2], cpu_R[dc->op2], t0, 4);
-    tcg_temp_free(t0);
     return 2;
 }
 
@@ -1996,8 +1949,6 @@ static int dec_move_rs(CPUCRISState *env, DisasContext *dc)
     c2 = tcg_const_tl(dc->op2);
     cris_cc_mask(dc, 0);
     gen_helper_movl_sreg_reg(cpu_env, c2, c1);
-    tcg_temp_free(c1);
-    tcg_temp_free(c2);
     return 2;
 }
 static int dec_move_sr(CPUCRISState *env, DisasContext *dc)
@@ -2008,8 +1959,6 @@ static int dec_move_sr(CPUCRISState *env, DisasContext *dc)
     c2 = tcg_const_tl(dc->op2);
     cris_cc_mask(dc, 0);
     gen_helper_movl_reg_sreg(cpu_env, c1, c2);
-    tcg_temp_free(c1);
-    tcg_temp_free(c2);
     return 2;
 }
 
@@ -2029,7 +1978,6 @@ static int dec_move_rp(CPUCRISState *env, DisasContext *dc)
             tcg_gen_andi_tl(t[0], t[0], 0x39f);
             tcg_gen_andi_tl(t[1], cpu_PR[PR_CCS], ~0x39f);
             tcg_gen_or_tl(t[0], t[1], t[0]);
-            tcg_temp_free(t[1]);
         }
     } else {
         tcg_gen_mov_tl(t[0], cpu_R[dc->op1]);
@@ -2040,7 +1988,6 @@ static int dec_move_rp(CPUCRISState *env, DisasContext *dc)
         cris_update_cc_op(dc, CC_OP_FLAGS, 4);
         dc->flags_uptodate = 1;
     }
-    tcg_temp_free(t[0]);
     return 2;
 }
 static int dec_move_pr(CPUCRISState *env, DisasContext *dc)
@@ -2061,7 +2008,6 @@ static int dec_move_pr(CPUCRISState *env, DisasContext *dc)
         cris_alu(dc, CC_OP_MOVE,
                 cpu_R[dc->op1], cpu_R[dc->op1], t0,
                 preg_sizes[dc->op2]);
-        tcg_temp_free(t0);
     }
     return 2;
 }
@@ -2089,7 +2035,6 @@ static int dec_move_mr(CPUCRISState *env, DisasContext *dc)
         cris_cc_mask(dc, CC_MASK_NZ);
         cris_alu(dc, CC_OP_MOVE,
                 cpu_R[dc->op2], cpu_R[dc->op2], t0, memsize);
-        tcg_temp_free(t0);
     }
     do_postinc(dc, memsize);
     return insn_len;
@@ -2295,7 +2240,6 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(0);
     cris_alu(dc, CC_OP_CMP,
          cpu_R[dc->op2], t[1], c, memsize_zz(dc));
-    tcg_temp_free(c);
     do_postinc(dc, memsize);
     return insn_len;
 }
@@ -2371,8 +2315,6 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
     do_postinc(dc, memsize);
-    tcg_temp_free(l[0]);
-    tcg_temp_free(l[1]);
     return insn_len;
 }
 
@@ -2484,7 +2426,6 @@ static int dec_move_pm(CPUCRISState *env, DisasContext *dc)
     t_gen_mov_TN_preg(t0, dc->op2);
     cris_flush_cc_state(dc);
     gen_store(dc, cpu_R[dc->op1], t0, memsize);
-    tcg_temp_free(t0);
 
     cris_cc_mask(dc, 0);
     if (dc->postinc) {
@@ -2519,17 +2460,14 @@ static int dec_movem_mr(CPUCRISState *env, DisasContext *dc)
     } else {
         tmp32 = NULL;
     }
-    tcg_temp_free(addr);
 
     for (i = 0; i < (nr >> 1); i++) {
         tcg_gen_extrl_i64_i32(cpu_R[i * 2], tmp[i]);
         tcg_gen_shri_i64(tmp[i], tmp[i], 32);
         tcg_gen_extrl_i64_i32(cpu_R[i * 2 + 1], tmp[i]);
-        tcg_temp_free_i64(tmp[i]);
     }
     if (nr & 1) {
         tcg_gen_mov_tl(cpu_R[dc->op2], tmp32);
-        tcg_temp_free(tmp32);
     }
 
     /* writeback the updated pointer value.  */
@@ -2567,8 +2505,6 @@ static int dec_movem_rm(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_R[dc->op1], addr);
     }
     cris_cc_mask(dc, 0);
-    tcg_temp_free(tmp);
-    tcg_temp_free(addr);
     return 2;
 }
 
@@ -2648,7 +2584,6 @@ static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
     }
     c = tcg_const_tl(dc->pc + 4);
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
 
     cris_prepare_jmp(dc, JMP_INDIRECT);
     return 2;
@@ -2666,7 +2601,6 @@ static int dec_jas_im(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->pc + 8);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
 
     dc->jmp_pc = imm;
     cris_prepare_jmp(dc, JMP_DIRECT);
@@ -2685,7 +2619,6 @@ static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->pc + 8 + 4);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
 
     dc->jmp_pc = imm;
     cris_prepare_jmp(dc, JMP_DIRECT);
@@ -2701,7 +2634,6 @@ static int dec_jasc_r(CPUCRISState *env, DisasContext *dc)
     tcg_gen_mov_tl(env_btarget, cpu_R[dc->op1]);
     c = tcg_const_tl(dc->pc + 4 + 4);
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
     cris_prepare_jmp(dc, JMP_INDIRECT);
     return 2;
 }
@@ -2735,7 +2667,6 @@ static int dec_bas_im(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->pc + 8);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
 
     dc->jmp_pc = dc->pc + simm;
     cris_prepare_jmp(dc, JMP_DIRECT);
@@ -2753,7 +2684,6 @@ static int dec_basc_im(CPUCRISState *env, DisasContext *dc)
     c = tcg_const_tl(dc->pc + 12);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
-    tcg_temp_free(c);
 
     dc->jmp_pc = dc->pc + simm;
     cris_prepare_jmp(dc, JMP_DIRECT);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 4f03548365..b03b2ef746 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -90,9 +90,6 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
     gen_set_label(l1);
     tcg_gen_shri_tl(t1, t1, 1);  /* shift F to P position */
     tcg_gen_or_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], t1); /*P=F*/
-    tcg_temp_free(t1);
-    tcg_temp_free(tval);
-    tcg_temp_free(taddr);
 }
 
 static void gen_store_v10(DisasContext *dc, TCGv addr, TCGv val,
@@ -215,7 +212,6 @@ static int dec10_prep_move_m(CPUCRISState *env, DisasContext *dc,
         else
             t_gen_zext(dst, dst, memsize);
         insn_len += crisv10_post_memaddr(dc, memsize);
-        tcg_temp_free(addr);
     }
 
     if (dc->mode == CRISV10_MODE_INDIRECT && (dc->tb_flags & PFIX_FLAG)) {
@@ -258,7 +254,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(simm);
             cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_CMPQ:
             LOG_DIS("cmpq %d, $r%d\n", simm, dc->dst);
@@ -267,7 +262,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(simm);
             cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_ADDQ:
             LOG_DIS("addq %d, $r%d\n", imm, dc->dst);
@@ -276,7 +270,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(imm);
             cris_alu(dc, CC_OP_ADD, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_ANDQ:
             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
@@ -285,7 +278,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(simm);
             cris_alu(dc, CC_OP_AND, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_ASHQ:
             LOG_DIS("ashq %d, $r%d\n", simm, dc->dst);
@@ -303,7 +295,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
                 gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->dst],
                            c, cpu_PR[PR_CCS]);
             }
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_LSHQ:
             LOG_DIS("lshq %d, $r%d\n", simm, dc->dst);
@@ -317,7 +308,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(imm);
             cris_alu(dc, op, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_SUBQ:
             LOG_DIS("subq %d, $r%d\n", imm, dc->dst);
@@ -326,7 +316,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(imm);
             cris_alu(dc, CC_OP_SUB, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
         case CRISV10_QIMM_ORQ:
             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
@@ -335,7 +324,6 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             c = tcg_const_tl(simm);
             cris_alu(dc, CC_OP_OR, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
-            tcg_temp_free(c);
             break;
 
         case CRISV10_QIMM_BCC_R0:
@@ -426,8 +414,6 @@ static void dec10_reg_alu(DisasContext *dc, int op, int size, int sext)
 
     assert(dc->dst != 15);
     cris_alu(dc, op, cpu_R[dc->dst], t[0], t[1], size);
-    tcg_temp_free(t[0]);
-    tcg_temp_free(t[1]);
 }
 
 static void dec10_reg_bound(DisasContext *dc, int size)
@@ -437,7 +423,6 @@ static void dec10_reg_bound(DisasContext *dc, int size)
     t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
-    tcg_temp_free(t);
 }
 
 static void dec10_reg_mul(DisasContext *dc, int size, int sext)
@@ -451,9 +436,6 @@ static void dec10_reg_mul(DisasContext *dc, int size, int sext)
                         t[0], t[1], cpu_R[dc->dst], cpu_R[dc->src]);
 
     cris_alu(dc, op, cpu_R[dc->dst], t[0], t[1], 4);
-
-    tcg_temp_free(t[0]);
-    tcg_temp_free(t[1]);
 }
 
 
@@ -472,7 +454,6 @@ static void dec10_reg_movs(DisasContext *dc)
         t_gen_zext(t, cpu_R[dc->src], size);
 
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
-    tcg_temp_free(t);
 }
 
 static void dec10_reg_alux(DisasContext *dc, int op)
@@ -490,7 +471,6 @@ static void dec10_reg_alux(DisasContext *dc, int op)
         t_gen_zext(t, cpu_R[dc->src], size);
 
     cris_alu(dc, op, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
-    tcg_temp_free(t);
 }
 
 static void dec10_reg_mov_pr(DisasContext *dc)
@@ -522,7 +502,6 @@ static void dec10_reg_abs(DisasContext *dc)
     tcg_gen_sub_tl(t0, cpu_R[dc->dst], t0);
 
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst], cpu_R[dc->dst], t0, 4);
-    tcg_temp_free(t0);
 }
 
 static void dec10_reg_swap(DisasContext *dc)
@@ -543,7 +522,6 @@ static void dec10_reg_swap(DisasContext *dc)
     if (dc->dst & 1)
         t_gen_swapr(t0, t0);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->src], cpu_R[dc->src], t0, 4);
-    tcg_temp_free(t0);
 }
 
 static void dec10_reg_scc(DisasContext *dc)
@@ -623,7 +601,6 @@ static unsigned int dec10_reg(DisasContext *dc)
                 LOG_DIS("addi r%d r%d size=%d\n", dc->src, dc->dst, dc->size);
                 tcg_gen_shli_tl(t, cpu_R[dc->dst], dc->size & 3);
                 tcg_gen_add_tl(cpu_R[dc->src], cpu_R[dc->src], t);
-                tcg_temp_free(t);
                 break;
             case CRISV10_REG_LSL:
                 LOG_DIS("lsl $r%d, $r%d sz=%d\n", dc->src, dc->dst, size);
@@ -669,7 +646,6 @@ static unsigned int dec10_reg(DisasContext *dc)
                 } else {
                     tcg_gen_add_tl(cpu_PR[PR_PREFIX], cpu_R[dc->src], t);
                 }
-                tcg_temp_free(t);
                 cris_set_prefix(dc);
                 break;
 
@@ -778,7 +754,6 @@ static unsigned int dec10_ind_move_m_r(CPUCRISState *env, DisasContext *dc,
         dc->delayed_branch = 1;
     }
 
-    tcg_temp_free(t);
     return insn_len;
 }
 
@@ -792,7 +767,6 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
     crisv10_prepare_memaddr(dc, addr, size);
     gen_store_v10(dc, addr, cpu_R[dc->dst], size);
     insn_len += crisv10_post_memaddr(dc, size);
-    tcg_temp_free(addr);
 
     return insn_len;
 }
@@ -815,7 +789,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(t);
     return insn_len;
 }
 
@@ -833,12 +806,10 @@ static unsigned int dec10_ind_move_pr_m(DisasContext *dc)
         cris_evaluate_flags(dc);
         tcg_gen_andi_tl(t0, cpu_PR[PR_CCS], ~PFIX_FLAG);
         gen_store_v10(dc, addr, t0, size);
-        tcg_temp_free(t0);
     } else {
         gen_store_v10(dc, addr, cpu_PR[dc->dst], size);
     }
     insn_len += crisv10_post_memaddr(dc, size);
-    tcg_temp_free(addr);
     cris_lock_irq(dc);
 
     return insn_len;
@@ -872,8 +843,6 @@ static void dec10_movem_r_m(DisasContext *dc)
     if (!pfix && dc->mode == CRISV10_MODE_AUTOINC) {
         tcg_gen_mov_tl(cpu_R[dc->src], addr);
     }
-    tcg_temp_free(addr);
-    tcg_temp_free(t0);
 }
 
 static void dec10_movem_m_r(DisasContext *dc)
@@ -900,8 +869,6 @@ static void dec10_movem_m_r(DisasContext *dc)
     if (!pfix && dc->mode == CRISV10_MODE_AUTOINC) {
         tcg_gen_mov_tl(cpu_R[dc->src], addr);
     }
-    tcg_temp_free(addr);
-    tcg_temp_free(t0);
 }
 
 static int dec10_ind_alu(CPUCRISState *env, DisasContext *dc,
@@ -939,7 +906,6 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
         dc->delayed_branch = 1;
     }
 
-    tcg_temp_free(t);
     return insn_len;
 }
 
@@ -964,7 +930,6 @@ static int dec10_alux_m(CPUCRISState *env, DisasContext *dc, int op)
         dc->delayed_branch = 1;
     }
 
-    tcg_temp_free(t);
     return insn_len;
 }
 
@@ -1052,7 +1017,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 c = tcg_const_tl(0);
                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                          t[0], c, size);
-                tcg_temp_free(c);
                 break;
             case CRISV10_IND_ADD:
                 LOG_DIS("add size=%d op=%d %d\n",  size, dc->src, dc->dst);
@@ -1149,7 +1113,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
 
                 c = tcg_const_tl(dc->pc + insn_len);
                 t_gen_mov_preg_TN(dc, dc->dst, c);
-                tcg_temp_free(c);
                 dc->jmp_pc = imm;
                 cris_prepare_jmp(dc, JMP_DIRECT);
                 dc->delayed_branch--; /* v10 has no dslot here.  */
@@ -1160,7 +1123,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                     tcg_gen_movi_tl(env_pc, dc->pc + 2);
                     c = tcg_const_tl(dc->src + 2);
                     t_gen_mov_env_TN(trap_vector, c);
-                    tcg_temp_free(c);
                     t_gen_raise_exception(EXCP_BREAK);
                     dc->base.is_jmp = DISAS_NORETURN;
                     return insn_len;
@@ -1170,13 +1132,11 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 t[0] = tcg_temp_new();
                 c = tcg_const_tl(dc->pc + insn_len);
                 t_gen_mov_preg_TN(dc, dc->dst, c);
-                tcg_temp_free(c);
                 crisv10_prepare_memaddr(dc, t[0], size);
                 gen_load(dc, env_btarget, t[0], 4, 0);
                 insn_len += crisv10_post_memaddr(dc, size);
                 cris_prepare_jmp(dc, JMP_INDIRECT);
                 dc->delayed_branch--; /* v10 has no dslot here.  */
-                tcg_temp_free(t[0]);
             }
             break;
 
@@ -1195,7 +1155,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
             tcg_gen_mov_tl(env_btarget, cpu_R[dc->src]);
             c = tcg_const_tl(dc->pc + insn_len);
             t_gen_mov_preg_TN(dc, dc->dst, c);
-            tcg_temp_free(c);
             cris_prepare_jmp(dc, JMP_INDIRECT);
             dc->delayed_branch--; /* v10 has no dslot here.  */
             break;
-- 
2.34.1


