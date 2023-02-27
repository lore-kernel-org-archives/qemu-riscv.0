Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW85-00049D-Os
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6t-0008Sp-4t
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:40 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6j-00013t-Sp
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:38 -0500
Received: by mail-pl1-x644.google.com with SMTP id c1so5552050plg.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hhu6BTqgBT2mQSY+4n4fD9nQI+aXC68pwtEhdchFB+0=;
 b=NVxm+eiK/Y33CO98XKRfv3TTzn1FYl6e/SM6Etw0rfOHhvSRVGSVbQN3FlX66xHAp1
 hQuZpcUvpgHSZToEbHKWz1Qgq1GhyFoQEhK3cyHSDcQtEMTk4AAlRVw1s/ZUowQhRpur
 gFqVsOSr8hkm+yLXIoeapU4xtVHAB0oVmWXR8FaukKyzB6mQtJbAEyxvr94NeaFPn4YP
 Pvm0uWJtQIbVDw7PG2sK1qRi/JCXCPqTtfk6JR8ZNf4XrofMPe7pQJ4XM6D56ibRUaBn
 ktlPsztmZ6gJAU73gKpPvzKjjiWDTv6igYh+VnZhk+ui4D91aOhx6iG4IYQGpC8xLYLL
 07aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hhu6BTqgBT2mQSY+4n4fD9nQI+aXC68pwtEhdchFB+0=;
 b=ZwsKpX4o1lLGYMYy+4A0ALiEE/ZKYP2pXzm5e4YZnA2WSd3+Q8cNtk0odl4fdcoAZh
 0wFV7lRRZiM5u6XDrS1j99zKwfl0Bdic5Da7t9qYgHVHmiwYPlSiO4jSgCX7R4d0xQrN
 kZCyyRgrmKGE99UMaj06bB2P2gU89EATRzrob3cbvgIA9Vt+JNcKpH6ZwWIt9V5kCbES
 T/aSXoPqD9qP2sAPbAPx+z18RS0pKz3gRUOnJw0F+KLG5Ty5Vtrs3kDQUmlioVrTw90U
 JvYVMEs+bTZxCR9DpgmsfmLr0SJdqr4uQvarPGY4U8fMUNO7vBvyOvebxUQUGmJ/yI8k
 jhBw==
X-Gm-Message-State: AO0yUKUf5dTwzDp56G2pzEBKCvq0q0T0VrCyit/6GEJdeYAAjwQCvRd3
 1pvDMO6fXccvlfRVAYvQ9RYitA==
X-Google-Smtp-Source: AK7set/9diuGkef0kVPbTTImwPQbrCyIxehG4bTcdyfr33tY4HhoLYq+5hHwAETxMv7gHoT95vVDYg==
X-Received: by 2002:a17:90b:1b09:b0:233:c3e7:bd37 with SMTP id
 nu9-20020a17090b1b0900b00233c3e7bd37mr7792495pjb.10.1677475888092; 
 Sun, 26 Feb 2023 21:31:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 70/76] target/tricore: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:59 -1000
Message-Id: <20230227052505.352889-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:42 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 540 +------------------------------------
 1 file changed, 4 insertions(+), 536 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 176ea96b2b..127f9a989a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -126,7 +126,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #define gen_helper_1arg(name, arg) do {                           \
     TCGv_i32 helper_tmp = tcg_const_i32(arg);                     \
     gen_helper_##name(cpu_env, helper_tmp);                       \
-    tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
 #define GEN_HELPER_LL(name, ret, arg0, arg1, n) do {         \
@@ -137,9 +136,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     tcg_gen_ext16s_tl(arg01, arg0);                          \
     tcg_gen_ext16s_tl(arg11, arg1);                          \
     gen_helper_##name(ret, arg00, arg01, arg11, arg11, n);   \
-    tcg_temp_free(arg00);                                    \
-    tcg_temp_free(arg01);                                    \
-    tcg_temp_free(arg11);                                    \
 } while (0)
 
 #define GEN_HELPER_LU(name, ret, arg0, arg1, n) do {         \
@@ -152,10 +148,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     tcg_gen_sari_tl(arg11, arg1, 16);                        \
     tcg_gen_ext16s_tl(arg10, arg1);                          \
     gen_helper_##name(ret, arg00, arg01, arg10, arg11, n);   \
-    tcg_temp_free(arg00);                                    \
-    tcg_temp_free(arg01);                                    \
-    tcg_temp_free(arg10);                                    \
-    tcg_temp_free(arg11);                                    \
 } while (0)
 
 #define GEN_HELPER_UL(name, ret, arg0, arg1, n) do {         \
@@ -168,10 +160,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     tcg_gen_sari_tl(arg10, arg1, 16);                        \
     tcg_gen_ext16s_tl(arg11, arg1);                          \
     gen_helper_##name(ret, arg00, arg01, arg10, arg11, n);   \
-    tcg_temp_free(arg00);                                    \
-    tcg_temp_free(arg01);                                    \
-    tcg_temp_free(arg10);                                    \
-    tcg_temp_free(arg11);                                    \
 } while (0)
 
 #define GEN_HELPER_UU(name, ret, arg0, arg1, n) do {         \
@@ -182,9 +170,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     tcg_gen_ext16s_tl(arg00, arg0);                          \
     tcg_gen_sari_tl(arg11, arg1, 16);                        \
     gen_helper_##name(ret, arg00, arg01, arg11, arg11, n);   \
-    tcg_temp_free(arg00);                                    \
-    tcg_temp_free(arg01);                                    \
-    tcg_temp_free(arg11);                                    \
 } while (0)
 
 #define GEN_HELPER_RRR(name, rl, rh, al1, ah1, arg2) do {    \
@@ -194,9 +179,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     tcg_gen_concat_i32_i64(arg1, al1, ah1);                  \
     gen_helper_##name(ret, arg1, arg2);                      \
     tcg_gen_extr_i64_i32(rl, rh, ret);                       \
-                                                             \
-    tcg_temp_free_i64(ret);                                  \
-    tcg_temp_free_i64(arg1);                                 \
 } while (0)
 
 #define GEN_HELPER_RR(name, rl, rh, arg1, arg2) do {        \
@@ -204,8 +186,6 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                                                             \
     gen_helper_##name(ret, cpu_env, arg1, arg2);            \
     tcg_gen_extr_i64_i32(rl, rh, ret);                      \
-                                                            \
-    tcg_temp_free_i64(ret);                                 \
 } while (0)
 
 #define EA_ABS_FORMAT(con) (((con & 0x3C000) << 14) + (con & 0x3FFF))
@@ -229,7 +209,6 @@ static inline void gen_offset_ld(DisasContext *ctx, TCGv r1, TCGv r2,
     TCGv temp = tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, con);
     tcg_gen_qemu_ld_tl(r1, temp, ctx->mem_idx, mop);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_offset_st(DisasContext *ctx, TCGv r1, TCGv r2,
@@ -238,7 +217,6 @@ static inline void gen_offset_st(DisasContext *ctx, TCGv r1, TCGv r2,
     TCGv temp = tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, con);
     tcg_gen_qemu_st_tl(r1, temp, ctx->mem_idx, mop);
-    tcg_temp_free(temp);
 }
 
 static void gen_st_2regs_64(TCGv rh, TCGv rl, TCGv address, DisasContext *ctx)
@@ -247,8 +225,6 @@ static void gen_st_2regs_64(TCGv rh, TCGv rl, TCGv address, DisasContext *ctx)
 
     tcg_gen_concat_i32_i64(temp, rl, rh);
     tcg_gen_qemu_st_i64(temp, address, ctx->mem_idx, MO_LEUQ);
-
-    tcg_temp_free_i64(temp);
 }
 
 static void gen_offset_st_2regs(TCGv rh, TCGv rl, TCGv base, int16_t con,
@@ -257,7 +233,6 @@ static void gen_offset_st_2regs(TCGv rh, TCGv rl, TCGv base, int16_t con,
     TCGv temp = tcg_temp_new();
     tcg_gen_addi_tl(temp, base, con);
     gen_st_2regs_64(rh, rl, temp, ctx);
-    tcg_temp_free(temp);
 }
 
 static void gen_ld_2regs_64(TCGv rh, TCGv rl, TCGv address, DisasContext *ctx)
@@ -267,8 +242,6 @@ static void gen_ld_2regs_64(TCGv rh, TCGv rl, TCGv address, DisasContext *ctx)
     tcg_gen_qemu_ld_i64(temp, address, ctx->mem_idx, MO_LEUQ);
     /* write back to two 32 bit regs */
     tcg_gen_extr_i64_i32(rl, rh, temp);
-
-    tcg_temp_free_i64(temp);
 }
 
 static void gen_offset_ld_2regs(TCGv rh, TCGv rl, TCGv base, int16_t con,
@@ -277,7 +250,6 @@ static void gen_offset_ld_2regs(TCGv rh, TCGv rl, TCGv base, int16_t con,
     TCGv temp = tcg_temp_new();
     tcg_gen_addi_tl(temp, base, con);
     gen_ld_2regs_64(rh, rl, temp, ctx);
-    tcg_temp_free(temp);
 }
 
 static void gen_st_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t off,
@@ -287,7 +259,6 @@ static void gen_st_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t off,
     tcg_gen_addi_tl(temp, r2, off);
     tcg_gen_qemu_st_tl(r1, temp, ctx->mem_idx, mop);
     tcg_gen_mov_tl(r2, temp);
-    tcg_temp_free(temp);
 }
 
 static void gen_ld_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t off,
@@ -297,7 +268,6 @@ static void gen_ld_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t off,
     tcg_gen_addi_tl(temp, r2, off);
     tcg_gen_qemu_ld_tl(r1, temp, ctx->mem_idx, mop);
     tcg_gen_mov_tl(r2, temp);
-    tcg_temp_free(temp);
 }
 
 /* M(EA, word) = (M(EA, word) & ~E[a][63:32]) | (E[a][31:0] & E[a][63:32]); */
@@ -317,9 +287,6 @@ static void gen_ldmst(DisasContext *ctx, int ereg, TCGv ea)
     tcg_gen_or_tl(temp, temp, temp2);
     /* M(EA, word) = temp; */
     tcg_gen_qemu_st_tl(temp, ea, ctx->mem_idx, MO_LEUL);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 /* tmp = M(EA, word);
@@ -332,8 +299,6 @@ static void gen_swap(DisasContext *ctx, int reg, TCGv ea)
     tcg_gen_qemu_ld_tl(temp, ea, ctx->mem_idx, MO_LEUL);
     tcg_gen_qemu_st_tl(cpu_gpr_d[reg], ea, ctx->mem_idx, MO_LEUL);
     tcg_gen_mov_tl(cpu_gpr_d[reg], temp);
-
-    tcg_temp_free(temp);
 }
 
 static void gen_cmpswap(DisasContext *ctx, int reg, TCGv ea)
@@ -345,9 +310,6 @@ static void gen_cmpswap(DisasContext *ctx, int reg, TCGv ea)
                        cpu_gpr_d[reg], temp);
     tcg_gen_qemu_st_tl(temp2, ea, ctx->mem_idx, MO_LEUL);
     tcg_gen_mov_tl(cpu_gpr_d[reg], temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static void gen_swapmsk(DisasContext *ctx, int reg, TCGv ea)
@@ -362,10 +324,6 @@ static void gen_swapmsk(DisasContext *ctx, int reg, TCGv ea)
     tcg_gen_or_tl(temp2, temp2, temp3);
     tcg_gen_qemu_st_tl(temp2, ea, ctx->mem_idx, MO_LEUL);
     tcg_gen_mov_tl(cpu_gpr_d[reg], temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
 }
 
 
@@ -447,9 +405,6 @@ static inline void gen_add_d(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(result);
-    tcg_temp_free(t0);
 }
 
 static inline void
@@ -476,11 +431,6 @@ gen_add64_d(TCGv_i64 ret, TCGv_i64 r1, TCGv_i64 r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_i64(ret, result);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(result);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static inline void
@@ -527,11 +477,6 @@ gen_addsub64_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_or_tl(cpu_PSW_AV, cpu_PSW_AV, temp);
     /* calc SAV bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free(temp4);
 }
 
 /* ret = r2 + (r1 * r3); */
@@ -564,17 +509,12 @@ static inline void gen_madd32_d(TCGv ret, TCGv r1, TCGv r2, TCGv r3)
     tcg_gen_xor_tl(cpu_PSW_AV, ret, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void gen_maddi32_d(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_madd32_d(ret, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -603,11 +543,6 @@ gen_madd64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     /* write back the result */
     tcg_gen_mov_tl(ret_low, t3);
     tcg_gen_mov_tl(ret_high, t4);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
 }
 
 static inline void
@@ -638,10 +573,6 @@ gen_maddu64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_xor_tl(cpu_PSW_AV, ret_high, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void
@@ -650,7 +581,6 @@ gen_maddi64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_madd64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -659,7 +589,6 @@ gen_maddui64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_maddu64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -686,9 +615,6 @@ gen_madd_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
     gen_addsub64_h(ret_low, ret_high, r1_low, r1_high, temp, temp2,
                    tcg_gen_add_tl, tcg_gen_add_tl);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -715,9 +641,6 @@ gen_maddsu_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
     gen_addsub64_h(ret_low, ret_high, r1_low, r1_high, temp, temp2,
                    tcg_gen_sub_tl, tcg_gen_add_tl);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -751,11 +674,6 @@ gen_maddsum_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     gen_add64_d(temp64_2, temp64_3, temp64);
     /* write back result */
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64_2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
-    tcg_temp_free_i64(temp64_3);
 }
 
 static inline void gen_adds(TCGv ret, TCGv r1, TCGv r2);
@@ -792,12 +710,6 @@ gen_madds_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_or_tl(cpu_PSW_V, cpu_PSW_V, temp);
     /* combine av bits */
     tcg_gen_or_tl(cpu_PSW_AV, cpu_PSW_AV, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(temp64);
-
 }
 
 static inline void gen_subs(TCGv ret, TCGv r1, TCGv r2);
@@ -834,12 +746,6 @@ gen_maddsus_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_or_tl(cpu_PSW_V, cpu_PSW_V, temp);
     /* combine av bits */
     tcg_gen_or_tl(cpu_PSW_AV, cpu_PSW_AV, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(temp64);
-
 }
 
 static inline void
@@ -872,10 +778,6 @@ gen_maddsums_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 
     gen_helper_add64_ssov(temp64, cpu_env, temp64_2, temp64);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
 }
 
 
@@ -905,11 +807,6 @@ gen_maddm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     gen_add64_d(temp64_3, temp64_2, temp64);
     /* write back result */
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64_3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
-    tcg_temp_free_i64(temp64_3);
 }
 
 static inline void
@@ -936,10 +833,6 @@ gen_maddms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
     gen_helper_add64_ssov(temp64, cpu_env, temp64_2, temp64);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
 }
 
 static inline void
@@ -963,9 +856,6 @@ gen_maddr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
         break;
     }
     gen_helper_addr_h(ret, cpu_env, temp64, r1_low, r1_high);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -977,9 +867,6 @@ gen_maddr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_maddr64_h(ret, temp, temp2, r2, r3, n, mode);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1005,10 +892,6 @@ gen_maddsur32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_helper_addsur_h(ret, cpu_env, temp64, temp, temp2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 
@@ -1033,9 +916,6 @@ gen_maddr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
         break;
     }
     gen_helper_addr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1047,9 +927,6 @@ gen_maddr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_maddr64s_h(ret, temp, temp2, r2, r3, n, mode);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1075,10 +952,6 @@ gen_maddsur32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_helper_addsur_h_ssov(ret, cpu_env, temp64, temp, temp2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1086,7 +959,6 @@ gen_maddr_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
     TCGv temp = tcg_const_i32(n);
     gen_helper_maddr_q(ret, cpu_env, r1, r2, r3, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -1094,7 +966,6 @@ gen_maddrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
     TCGv temp = tcg_const_i32(n);
     gen_helper_maddr_q_ssov(ret, cpu_env, r1, r2, r3, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -1145,13 +1016,6 @@ gen_madd32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void
@@ -1169,9 +1033,6 @@ gen_m16add32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
         tcg_gen_sub_tl(temp, temp, temp2);
     }
     gen_add_d(ret, arg1, temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1189,9 +1050,6 @@ gen_m16adds32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
         tcg_gen_sub_tl(temp, temp, temp2);
     }
     gen_adds(ret, arg1, temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1219,12 +1077,6 @@ gen_m16add64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     gen_add64_d(t3, t1, t2);
     /* write back result */
     tcg_gen_extr_i64_i32(rl, rh, t3);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1251,11 +1103,6 @@ gen_m16adds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     gen_helper_add64_ssov(t1, cpu_env, t1, t2);
     tcg_gen_extr_i64_i32(rl, rh, t1);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
 }
 
 static inline void
@@ -1294,9 +1141,6 @@ gen_madd64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
         tcg_gen_shli_tl(temp, temp, 31);
         /* negate v bit, if special condition */
         tcg_gen_xor_tl(cpu_PSW_V, cpu_PSW_V, temp);
-
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
     }
     /* write back result */
     tcg_gen_extr_i64_i32(rl, rh, t4);
@@ -1307,11 +1151,6 @@ gen_madd64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     tcg_gen_xor_tl(cpu_PSW_AV, rh, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free_i64(t4);
 }
 
 static inline void
@@ -1330,10 +1169,6 @@ gen_madds32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
     tcg_gen_sari_i64(t2, t2, up_shift - n);
 
     gen_helper_madd32_q_add_ssov(ret, cpu_env, t1, t2);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void
@@ -1346,10 +1181,8 @@ gen_madds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
     gen_helper_madd64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
     tcg_gen_extr_i64_i32(rl, rh, r1);
-
-    tcg_temp_free_i64(r1);
-    tcg_temp_free(temp);
 }
+
 /* ret = r2 - (r1 * r3); */
 static inline void gen_msub32_d(TCGv ret, TCGv r1, TCGv r2, TCGv r3)
 {
@@ -1381,17 +1214,12 @@ static inline void gen_msub32_d(TCGv ret, TCGv r1, TCGv r2, TCGv r3)
     tcg_gen_xor_tl(cpu_PSW_AV, ret, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void gen_msubi32_d(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_msub32_d(ret, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -1420,11 +1248,6 @@ gen_msub64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     /* write back the result */
     tcg_gen_mov_tl(ret_low, t3);
     tcg_gen_mov_tl(ret_high, t4);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
 }
 
 static inline void
@@ -1433,7 +1256,6 @@ gen_msubi64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_msub64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -1462,10 +1284,6 @@ gen_msubu64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_xor_tl(cpu_PSW_AV, ret_high, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
 }
 
 static inline void
@@ -1474,15 +1292,14 @@ gen_msubui64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_msubu64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_addi_d(TCGv ret, TCGv r1, target_ulong r2)
 {
     TCGv temp = tcg_const_i32(r2);
     gen_add_d(ret, r1, temp);
-    tcg_temp_free(temp);
 }
+
 /* calculate the carry bit too */
 static inline void gen_add_CC(TCGv ret, TCGv r1, TCGv r2)
 {
@@ -1505,16 +1322,12 @@ static inline void gen_add_CC(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(result);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_addi_CC(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_add_CC(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_addc_CC(TCGv ret, TCGv r1, TCGv r2)
@@ -1541,17 +1354,12 @@ static inline void gen_addc_CC(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(result);
-    tcg_temp_free(t0);
-    tcg_temp_free(carry);
 }
 
 static inline void gen_addci_CC(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_addc_CC(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_cond_add(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
@@ -1585,12 +1393,6 @@ static inline void gen_cond_add(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
     tcg_gen_or_tl(cpu_PSW_SAV, temp, cpu_PSW_SAV);
     /* write back result */
     tcg_gen_movcond_tl(cond, r3, r4, t0, result, r1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(result);
-    tcg_temp_free(mask);
 }
 
 static inline void gen_condi_add(TCGCond cond, TCGv r1, int32_t r2,
@@ -1598,7 +1400,6 @@ static inline void gen_condi_add(TCGCond cond, TCGv r1, int32_t r2,
 {
     TCGv temp = tcg_const_i32(r2);
     gen_cond_add(cond, r1, temp, r3, r4);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_sub_d(TCGv ret, TCGv r1, TCGv r2)
@@ -1620,9 +1421,6 @@ static inline void gen_sub_d(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(result);
 }
 
 static inline void
@@ -1649,11 +1447,6 @@ gen_sub64_d(TCGv_i64 ret, TCGv_i64 r1, TCGv_i64 r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_i64(ret, result);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(result);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static inline void gen_sub_CC(TCGv ret, TCGv r1, TCGv r2)
@@ -1677,9 +1470,6 @@ static inline void gen_sub_CC(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(result);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_subc_CC(TCGv ret, TCGv r1, TCGv r2)
@@ -1687,7 +1477,6 @@ static inline void gen_subc_CC(TCGv ret, TCGv r1, TCGv r2)
     TCGv temp = tcg_temp_new();
     tcg_gen_not_tl(temp, r2);
     gen_addc_CC(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_cond_sub(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
@@ -1721,12 +1510,6 @@ static inline void gen_cond_sub(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
     tcg_gen_or_tl(cpu_PSW_SAV, temp, cpu_PSW_SAV);
     /* write back result */
     tcg_gen_movcond_tl(cond, r3, r4, t0, result, r1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(result);
-    tcg_temp_free(mask);
 }
 
 static inline void
@@ -1753,9 +1536,6 @@ gen_msub_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
     gen_addsub64_h(ret_low, ret_high, r1_low, r1_high, temp, temp2,
                    tcg_gen_sub_tl, tcg_gen_sub_tl);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1790,11 +1570,6 @@ gen_msubs_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_or_tl(cpu_PSW_V, cpu_PSW_V, temp);
     /* combine av bits */
     tcg_gen_or_tl(cpu_PSW_AV, cpu_PSW_AV, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1823,11 +1598,6 @@ gen_msubm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     gen_sub64_d(temp64_3, temp64_2, temp64);
     /* write back result */
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64_3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
-    tcg_temp_free_i64(temp64_3);
 }
 
 static inline void
@@ -1854,10 +1624,6 @@ gen_msubms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
     gen_helper_sub64_ssov(temp64, cpu_env, temp64_2, temp64);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
 }
 
 static inline void
@@ -1881,9 +1647,6 @@ gen_msubr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
         break;
     }
     gen_helper_subr_h(ret, cpu_env, temp64, r1_low, r1_high);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1895,9 +1658,6 @@ gen_msubr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_msubr64_h(ret, temp, temp2, r2, r3, n, mode);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1921,9 +1681,6 @@ gen_msubr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
         break;
     }
     gen_helper_subr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -1935,9 +1692,6 @@ gen_msubr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_msubr64s_h(ret, temp, temp2, r2, r3, n, mode);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -1945,7 +1699,6 @@ gen_msubr_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
     TCGv temp = tcg_const_i32(n);
     gen_helper_msubr_q(ret, cpu_env, r1, r2, r3, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -1953,15 +1706,12 @@ gen_msubrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
     TCGv temp = tcg_const_i32(n);
     gen_helper_msubr_q_ssov(ret, cpu_env, r1, r2, r3, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
 gen_msub32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
              uint32_t up_shift)
 {
-    TCGv temp = tcg_temp_new();
-    TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -1997,14 +1747,6 @@ gen_msub32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free_i64(t4);
 }
 
 static inline void
@@ -2022,9 +1764,6 @@ gen_m16sub32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
         tcg_gen_sub_tl(temp, temp, temp2);
     }
     gen_sub_d(ret, arg1, temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -2042,9 +1781,6 @@ gen_m16subs32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
         tcg_gen_sub_tl(temp, temp, temp2);
     }
     gen_subs(ret, arg1, temp);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -2072,12 +1808,6 @@ gen_m16sub64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     gen_sub64_d(t3, t1, t2);
     /* write back result */
     tcg_gen_extr_i64_i32(rl, rh, t3);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -2104,11 +1834,6 @@ gen_m16subs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     gen_helper_sub64_ssov(t1, cpu_env, t1, t2);
     tcg_gen_extr_i64_i32(rl, rh, t1);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
 }
 
 static inline void
@@ -2147,9 +1872,6 @@ gen_msub64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
         tcg_gen_shli_tl(temp, temp, 31);
         /* negate v bit, if special condition */
         tcg_gen_xor_tl(cpu_PSW_V, cpu_PSW_V, temp);
-
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
     }
     /* write back result */
     tcg_gen_extr_i64_i32(rl, rh, t4);
@@ -2160,11 +1882,6 @@ gen_msub64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     tcg_gen_xor_tl(cpu_PSW_AV, rh, cpu_PSW_AV);
     /* calc SAV */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free_i64(t4);
 }
 
 static inline void
@@ -2188,11 +1905,6 @@ gen_msubs32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
     tcg_gen_add_i64(t3, t3, t4);
 
     gen_helper_msub32_q_sub_ssov(ret, cpu_env, t1, t3);
-
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t3);
-    tcg_temp_free_i64(t4);
 }
 
 static inline void
@@ -2205,9 +1917,6 @@ gen_msubs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
     gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
     tcg_gen_extr_i64_i32(rl, rh, r1);
-
-    tcg_temp_free_i64(r1);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -2234,9 +1943,6 @@ gen_msubad_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
     gen_addsub64_h(ret_low, ret_high, r1_low, r1_high, temp, temp2,
                    tcg_gen_add_tl, tcg_gen_sub_tl);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2270,11 +1976,6 @@ gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     gen_sub64_d(temp64_2, temp64_3, temp64);
     /* write back result */
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64_2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
-    tcg_temp_free_i64(temp64_3);
 }
 
 static inline void
@@ -2300,10 +2001,6 @@ gen_msubadr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_helper_subadr_h(ret, cpu_env, temp64, temp, temp2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2338,11 +2035,6 @@ gen_msubads_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
     tcg_gen_or_tl(cpu_PSW_V, cpu_PSW_V, temp);
     /* combine av bits */
     tcg_gen_or_tl(cpu_PSW_AV, cpu_PSW_AV, temp3);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2375,10 +2067,6 @@ gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 
     gen_helper_sub64_ssov(temp64, cpu_env, temp64_2, temp64);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp64);
-    tcg_temp_free_i64(temp64_2);
 }
 
 static inline void
@@ -2404,10 +2092,6 @@ gen_msubadr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
     tcg_gen_shli_tl(temp, r1, 16);
     gen_helper_subadr_h_ssov(ret, cpu_env, temp64, temp, temp2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void gen_abs(TCGv ret, TCGv r1)
@@ -2449,23 +2133,18 @@ static inline void gen_absdif(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* write back result */
     tcg_gen_mov_tl(ret, result);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(result);
 }
 
 static inline void gen_absdifi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_absdif(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_absdifsi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_absdif_ssov(ret, cpu_env, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_mul_i32s(TCGv ret, TCGv r1, TCGv r2)
@@ -2486,16 +2165,12 @@ static inline void gen_mul_i32s(TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_xor_tl(cpu_PSW_AV, ret, cpu_PSW_AV);
     /* calc SAV bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free(high);
-    tcg_temp_free(low);
 }
 
 static inline void gen_muli_i32s(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_mul_i32s(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_mul_i64s(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2)
@@ -2517,7 +2192,6 @@ static inline void gen_muli_i64s(TCGv ret_low, TCGv ret_high, TCGv r1,
 {
     TCGv temp = tcg_const_i32(con);
     gen_mul_i64s(ret_low, ret_high, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_mul_i64u(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2)
@@ -2539,41 +2213,35 @@ static inline void gen_muli_i64u(TCGv ret_low, TCGv ret_high, TCGv r1,
 {
     TCGv temp = tcg_const_i32(con);
     gen_mul_i64u(ret_low, ret_high, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_mulsi_i32(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_mul_ssov(ret, cpu_env, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_mulsui_i32(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_mul_suov(ret, cpu_env, r1, temp);
-    tcg_temp_free(temp);
 }
 /* gen_maddsi_32(cpu_gpr_d[r4], cpu_gpr_d[r1], cpu_gpr_d[r3], const9); */
 static inline void gen_maddsi_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_madd32_ssov(ret, cpu_env, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_maddsui_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_madd32_suov(ret, cpu_env, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static void
 gen_mul_q(TCGv rl, TCGv rh, TCGv arg1, TCGv arg2, uint32_t n, uint32_t up_shift)
 {
-    TCGv temp = tcg_temp_new();
     TCGv_i64 temp_64 = tcg_temp_new_i64();
     TCGv_i64 temp2_64 = tcg_temp_new_i64();
 
@@ -2626,9 +2294,6 @@ gen_mul_q(TCGv rl, TCGv rh, TCGv arg1, TCGv arg2, uint32_t n, uint32_t up_shift)
     }
     /* calc sav overflow bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-    tcg_temp_free(temp);
-    tcg_temp_free_i64(temp_64);
-    tcg_temp_free_i64(temp2_64);
 }
 
 static void
@@ -2651,8 +2316,6 @@ gen_mul_q_16(TCGv ret, TCGv arg1, TCGv arg2, uint32_t n)
     tcg_gen_xor_tl(cpu_PSW_AV, ret, cpu_PSW_AV);
     /* calc sav overflow bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free(temp);
 }
 
 static void gen_mulr_q(TCGv ret, TCGv arg1, TCGv arg2, uint32_t n)
@@ -2679,8 +2342,6 @@ static void gen_mulr_q(TCGv ret, TCGv arg1, TCGv arg2, uint32_t n)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* cut halfword off */
     tcg_gen_andi_tl(ret, ret, 0xffff0000);
-
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -2691,7 +2352,6 @@ gen_madds_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_concat_i32_i64(temp64, r2_low, r2_high);
     gen_helper_madd64_ssov(temp64, cpu_env, r1, temp64, r3);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2700,7 +2360,6 @@ gen_maddsi_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_madds_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -2711,7 +2370,6 @@ gen_maddsu_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_concat_i32_i64(temp64, r2_low, r2_high);
     gen_helper_madd64_suov(temp64, cpu_env, r1, temp64, r3);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2720,21 +2378,18 @@ gen_maddsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_maddsu_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_msubsi_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_msub32_ssov(ret, cpu_env, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_msubsui_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_msub32_suov(ret, cpu_env, r1, r2, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -2745,7 +2400,6 @@ gen_msubs_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_concat_i32_i64(temp64, r2_low, r2_high);
     gen_helper_msub64_ssov(temp64, cpu_env, r1, temp64, r3);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2754,7 +2408,6 @@ gen_msubsi_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_msubs_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void
@@ -2765,7 +2418,6 @@ gen_msubsu_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
     tcg_gen_concat_i32_i64(temp64, r2_low, r2_high);
     gen_helper_msub64_suov(temp64, cpu_env, r1, temp64, r3);
     tcg_gen_extr_i64_i32(ret_low, ret_high, temp64);
-    tcg_temp_free_i64(temp64);
 }
 
 static inline void
@@ -2774,7 +2426,6 @@ gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 {
     TCGv temp = tcg_const_i32(con);
     gen_msubsu_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
-    tcg_temp_free(temp);
 }
 
 static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
@@ -2787,9 +2438,6 @@ static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
 
     /* ret = (sat_neg > up ) ? up  : sat_neg; */
     tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
-
-    tcg_temp_free(sat_neg);
-    tcg_temp_free(temp);
 }
 
 static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
@@ -2797,7 +2445,6 @@ static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
     TCGv temp = tcg_const_i32(up);
     /* sat_neg = (arg > up ) ? up : arg; */
     tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
-    tcg_temp_free(temp);
 }
 
 static void gen_shi(TCGv ret, TCGv r1, int32_t shift_count)
@@ -2826,9 +2473,6 @@ static void gen_sh_hi(TCGv ret, TCGv r1, int32_t shiftcount)
         gen_shi(temp_low, temp_low, shiftcount);
         gen_shi(ret, temp_high, shiftcount);
         tcg_gen_deposit_tl(ret, ret, temp_low, 0, 16);
-
-        tcg_temp_free(temp_low);
-        tcg_temp_free(temp_high);
     }
 }
 
@@ -2837,7 +2481,6 @@ static void gen_shaci(TCGv ret, TCGv r1, int32_t shift_count)
     uint32_t msk, msk_start;
     TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
-    TCGv t_0 = tcg_const_i32(0);
 
     if (shift_count == 0) {
         /* Clear PSW.C and PSW.V */
@@ -2868,9 +2511,6 @@ static void gen_shaci(TCGv ret, TCGv r1, int32_t shift_count)
         tcg_gen_or_tl(cpu_PSW_SV, cpu_PSW_V, cpu_PSW_SV);
         /* do shift */
         tcg_gen_shli_tl(ret, r1, shift_count);
-
-        tcg_temp_free(t_max);
-        tcg_temp_free(t_min);
     } else {
         /* clear PSW.V */
         tcg_gen_movi_tl(cpu_PSW_V, 0);
@@ -2885,10 +2525,6 @@ static void gen_shaci(TCGv ret, TCGv r1, int32_t shift_count)
     tcg_gen_xor_tl(cpu_PSW_AV, ret, cpu_PSW_AV);
     /* calc sav overflow bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(t_0);
 }
 
 static void gen_shas(TCGv ret, TCGv r1, TCGv r2)
@@ -2900,7 +2536,6 @@ static void gen_shasi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_shas(ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static void gen_sha_hi(TCGv ret, TCGv r1, int32_t shift_count)
@@ -2917,9 +2552,6 @@ static void gen_sha_hi(TCGv ret, TCGv r1, int32_t shift_count)
         tcg_gen_shli_tl(low, r1, shift_count);
         tcg_gen_shli_tl(ret, high, shift_count);
         tcg_gen_deposit_tl(ret, ret, low, 0, 16);
-
-        tcg_temp_free(low);
-        tcg_temp_free(high);
     } else {
         low = tcg_temp_new();
         high = tcg_temp_new();
@@ -2928,11 +2560,7 @@ static void gen_sha_hi(TCGv ret, TCGv r1, int32_t shift_count)
         tcg_gen_sari_tl(low, low, -shift_count);
         tcg_gen_sari_tl(ret, r1, -shift_count);
         tcg_gen_deposit_tl(ret, ret, low, 0, 16);
-
-        tcg_temp_free(low);
-        tcg_temp_free(high);
     }
-
 }
 
 /* ret = {ret[30:0], (r1 cond r2)}; */
@@ -2944,16 +2572,12 @@ static void gen_sh_cond(int cond, TCGv ret, TCGv r1, TCGv r2)
     tcg_gen_shli_tl(temp, ret, 1);
     tcg_gen_setcond_tl(cond, temp2, r1, r2);
     tcg_gen_or_tl(ret, temp, temp2);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static void gen_sh_condi(int cond, TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_sh_cond(cond, ret, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_adds(TCGv ret, TCGv r1, TCGv r2)
@@ -2965,14 +2589,12 @@ static inline void gen_addsi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_add_ssov(ret, cpu_env, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_addsui(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv temp = tcg_const_i32(con);
     gen_helper_add_suov(ret, cpu_env, r1, temp);
-    tcg_temp_free(temp);
 }
 
 static inline void gen_subs(TCGv ret, TCGv r1, TCGv r2)
@@ -3002,9 +2624,6 @@ static inline void gen_bit_2op(TCGv ret, TCGv r1, TCGv r2,
     (*op2)(temp1 , ret, temp1);
 
     tcg_gen_deposit_tl(ret, ret, temp1, 0, 1);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
 }
 
 /* ret = r1[pos1] op1 r2[pos2]; */
@@ -3023,9 +2642,6 @@ static inline void gen_bit_1op(TCGv ret, TCGv r1, TCGv r2,
     (*op1)(ret, temp1, temp2);
 
     tcg_gen_andi_tl(ret, ret, 0x1);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
 }
 
 static inline void gen_accumulating_cond(int cond, TCGv ret, TCGv r1, TCGv r2,
@@ -3041,9 +2657,6 @@ static inline void gen_accumulating_cond(int cond, TCGv ret, TCGv r1, TCGv r2,
     (*op)(temp, temp, temp2);
     /* ret = {ret[31:1], temp} */
     tcg_gen_deposit_tl(ret, ret, temp, 0, 1);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void
@@ -3052,7 +2665,6 @@ gen_accumulating_condi(int cond, TCGv ret, TCGv r1, int32_t con,
 {
     TCGv temp = tcg_const_i32(con);
     gen_accumulating_cond(cond, ret, r1, temp, op);
-    tcg_temp_free(temp);
 }
 
 /* ret = (r1 cond r2) ? 0xFFFFFFFF ? 0x00000000;*/
@@ -3089,11 +2701,6 @@ static inline void gen_eqany_bi(TCGv ret, TCGv r1, int32_t con)
     tcg_gen_or_tl(ret, b0, b1);
     tcg_gen_or_tl(ret, ret, b2);
     tcg_gen_or_tl(ret, ret, b3);
-
-    tcg_temp_free(b0);
-    tcg_temp_free(b1);
-    tcg_temp_free(b2);
-    tcg_temp_free(b3);
 }
 
 static inline void gen_eqany_hi(TCGv ret, TCGv r1, int32_t con)
@@ -3111,10 +2718,8 @@ static inline void gen_eqany_hi(TCGv ret, TCGv r1, int32_t con)
 
     /* combine them */
     tcg_gen_or_tl(ret, h0, h1);
-
-    tcg_temp_free(h0);
-    tcg_temp_free(h1);
 }
+
 /* mask = ((1 << width) -1) << pos;
    ret = (r1 & ~mask) | (r2 << pos) & mask); */
 static inline void gen_insert(TCGv ret, TCGv r1, TCGv r2, TCGv width, TCGv pos)
@@ -3132,10 +2737,6 @@ static inline void gen_insert(TCGv ret, TCGv r1, TCGv r2, TCGv width, TCGv pos)
     tcg_gen_and_tl(temp, temp, mask);
     tcg_gen_andc_tl(temp2, r1, mask);
     tcg_gen_or_tl(ret, temp, temp2);
-
-    tcg_temp_free(mask);
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static inline void gen_bsplit(TCGv rl, TCGv rh, TCGv r1)
@@ -3144,8 +2745,6 @@ static inline void gen_bsplit(TCGv rl, TCGv rh, TCGv r1)
 
     gen_helper_bsplit(temp, r1);
     tcg_gen_extr_i64_i32(rl, rh, temp);
-
-    tcg_temp_free_i64(temp);
 }
 
 static inline void gen_unpack(TCGv rl, TCGv rh, TCGv r1)
@@ -3154,8 +2753,6 @@ static inline void gen_unpack(TCGv rl, TCGv rh, TCGv r1)
 
     gen_helper_unpack(temp, r1);
     tcg_gen_extr_i64_i32(rl, rh, temp);
-
-    tcg_temp_free_i64(temp);
 }
 
 static inline void
@@ -3169,8 +2766,6 @@ gen_dvinit_b(DisasContext *ctx, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
         gen_helper_dvinit_b_131(ret, cpu_env, r1, r2);
     }
     tcg_gen_extr_i64_i32(rl, rh, ret);
-
-    tcg_temp_free_i64(ret);
 }
 
 static inline void
@@ -3184,8 +2779,6 @@ gen_dvinit_h(DisasContext *ctx, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
         gen_helper_dvinit_h_131(ret, cpu_env, r1, r2);
     }
     tcg_gen_extr_i64_i32(rl, rh, ret);
-
-    tcg_temp_free_i64(ret);
 }
 
 static void gen_calc_usb_mul_h(TCGv arg_low, TCGv arg_high)
@@ -3200,7 +2793,6 @@ static void gen_calc_usb_mul_h(TCGv arg_low, TCGv arg_high)
     /* calc SAV bit */
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     tcg_gen_movi_tl(cpu_PSW_V, 0);
-    tcg_temp_free(temp);
 }
 
 static void gen_calc_usb_mulr_h(TCGv arg)
@@ -3215,7 +2807,6 @@ static void gen_calc_usb_mulr_h(TCGv arg)
     tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
     /* clear V bit */
     tcg_gen_movi_tl(cpu_PSW_V, 0);
-    tcg_temp_free(temp);
 }
 
 /* helpers for generating program flow micro-ops */
@@ -3245,9 +2836,6 @@ static void generate_trap(DisasContext *ctx, int class, int tin)
     gen_save_pc(ctx->base.pc_next);
     gen_helper_raise_exception_sync(cpu_env, classtemp, tintemp);
     ctx->base.is_jmp = DISAS_NORETURN;
-
-    tcg_temp_free(classtemp);
-    tcg_temp_free(tintemp);
 }
 
 static inline void gen_branch_cond(DisasContext *ctx, TCGCond cond, TCGv r1,
@@ -3267,7 +2855,6 @@ static inline void gen_branch_condi(DisasContext *ctx, TCGCond cond, TCGv r1,
 {
     TCGv temp = tcg_const_i32(r2);
     gen_branch_cond(ctx, cond, r1, temp, address);
-    tcg_temp_free(temp);
 }
 
 static void gen_loop(DisasContext *ctx, int r1, int32_t offset)
@@ -3289,8 +2876,6 @@ static void gen_fcall_save_ctx(DisasContext *ctx)
     tcg_gen_qemu_st_tl(cpu_gpr_a[11], temp, ctx->mem_idx, MO_LESL);
     tcg_gen_movi_tl(cpu_gpr_a[11], ctx->pc_succ_insn);
     tcg_gen_mov_tl(cpu_gpr_a[10], temp);
-
-    tcg_temp_free(temp);
 }
 
 static void gen_fret(DisasContext *ctx)
@@ -3303,8 +2888,6 @@ static void gen_fret(DisasContext *ctx)
     tcg_gen_mov_tl(cpu_PC, temp);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
-
-    tcg_temp_free(temp);
 }
 
 static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
@@ -3350,13 +2933,11 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
         temp = tcg_temp_new();
         tcg_gen_andi_tl(temp, cpu_gpr_d[15], 0x1u << constant);
         gen_branch_condi(ctx, TCG_COND_EQ, temp, 0, offset);
-        tcg_temp_free(temp);
         break;
     case OPC1_16_SBRN_JNZ_T:
         temp = tcg_temp_new();
         tcg_gen_andi_tl(temp, cpu_gpr_d[15], 0x1u << constant);
         gen_branch_condi(ctx, TCG_COND_NE, temp, 0, offset);
-        tcg_temp_free(temp);
         break;
 /* SBR-format jumps */
     case OPC1_16_SBR_JEQ:
@@ -3474,7 +3055,6 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
             tcg_gen_addi_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 1);
             gen_branch_condi(ctx, TCG_COND_NE, temp, constant, offset);
         }
-        tcg_temp_free(temp);
         break;
 /* BRN format */
     case OPCM_32_BRN_JTT:
@@ -3488,7 +3068,6 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
         } else {
             gen_branch_condi(ctx, TCG_COND_EQ, temp, 0, offset);
         }
-        tcg_temp_free(temp);
         break;
 /* BRR Format */
     case OPCM_32_BRR_EQ_NEQ:
@@ -3553,8 +3132,6 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
             tcg_gen_addi_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 1);
             gen_branch_cond(ctx, TCG_COND_NE, temp, temp2, offset);
         }
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     case OPCM_32_BRR_JNZ:
         if (MASK_OP_BRR_OP2(ctx->opcode) == OPC2_32_BRR_JNZ_A) {
@@ -3609,16 +3186,12 @@ static void decode_src_opc(DisasContext *ctx, int op1)
         temp2 = tcg_const_tl(const4);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            temp2, cpu_gpr_d[r1]);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     case OPC1_16_SRC_CMOVN:
         temp = tcg_const_tl(0);
         temp2 = tcg_const_tl(const4);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            temp2, cpu_gpr_d[r1]);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     case OPC1_16_SRC_EQ:
         tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr_d[15], cpu_gpr_d[r1],
@@ -3685,13 +3258,11 @@ static void decode_srr_opc(DisasContext *ctx, int op1)
         temp = tcg_const_tl(0);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            cpu_gpr_d[r2], cpu_gpr_d[r1]);
-        tcg_temp_free(temp);
         break;
     case OPC1_16_SRR_CMOVN:
         temp = tcg_const_tl(0);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            cpu_gpr_d[r2], cpu_gpr_d[r1]);
-        tcg_temp_free(temp);
         break;
     case OPC1_16_SRR_EQ:
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr_d[15], cpu_gpr_d[r1],
@@ -3952,7 +3523,6 @@ static void decode_sr_accu(DisasContext *ctx)
         tcg_gen_xor_tl(cpu_PSW_AV, cpu_gpr_d[r1], cpu_PSW_AV);
         /* calc sav */
         tcg_gen_or_tl(cpu_PSW_SAV, cpu_PSW_SAV, cpu_PSW_AV);
-        tcg_temp_free(temp);
         break;
     case OPC2_16_SR_SAT_B:
         gen_saturate(cpu_gpr_d[r1], cpu_gpr_d[r1], 0x7f, -0x80);
@@ -4047,7 +3617,6 @@ static void decode_16Bit_opc(DisasContext *ctx)
         temp = tcg_temp_new();
         tcg_gen_shli_tl(temp, cpu_gpr_d[15], const16);
         tcg_gen_add_tl(cpu_gpr_a[r1], cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
 /* SLRO-format */
     case OPC1_16_SLRO_LD_A:
@@ -4239,8 +3808,6 @@ static void decode_abs_ldw(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-
-    tcg_temp_free(temp);
 }
 
 static void decode_abs_ldb(DisasContext *ctx)
@@ -4272,8 +3839,6 @@ static void decode_abs_ldb(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-
-    tcg_temp_free(temp);
 }
 
 static void decode_abs_ldst_swap(DisasContext *ctx)
@@ -4299,8 +3864,6 @@ static void decode_abs_ldst_swap(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-
-    tcg_temp_free(temp);
 }
 
 static void decode_abs_ldst_context(DisasContext *ctx)
@@ -4360,7 +3923,6 @@ static void decode_abs_store(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 static void decode_abs_storeb_h(DisasContext *ctx)
@@ -4386,7 +3948,6 @@ static void decode_abs_storeb_h(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 /* Bit-format */
@@ -4486,7 +4047,6 @@ static void decode_bit_insert(DisasContext *ctx)
         tcg_gen_not_tl(temp, temp);
     }
     tcg_gen_deposit_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], temp, pos1, 1);
-    tcg_temp_free(temp);
 }
 
 static void decode_bit_logical_t2(DisasContext *ctx)
@@ -4604,7 +4164,6 @@ static void decode_bit_sh_logic1(DisasContext *ctx)
     }
     tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], 1);
     tcg_gen_add_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], temp);
-    tcg_temp_free(temp);
 }
 
 static void decode_bit_sh_logic2(DisasContext *ctx)
@@ -4645,7 +4204,6 @@ static void decode_bit_sh_logic2(DisasContext *ctx)
     }
     tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], 1);
     tcg_gen_add_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], temp);
-    tcg_temp_free(temp);
 }
 
 /* BO-format */
@@ -4743,7 +4301,6 @@ static void decode_bo_addrmode_post_pre_base(DisasContext *ctx)
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], off10);
         gen_st_2regs_64(cpu_gpr_d[r1+1], cpu_gpr_d[r1], temp, ctx);
         tcg_gen_mov_tl(cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_ST_DA_SHORTOFF:
         CHECK_REG_PAIR(r1);
@@ -4761,7 +4318,6 @@ static void decode_bo_addrmode_post_pre_base(DisasContext *ctx)
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], off10);
         gen_st_2regs_64(cpu_gpr_a[r1+1], cpu_gpr_a[r1], temp, ctx);
         tcg_gen_mov_tl(cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_ST_H_SHORTOFF:
         gen_offset_st(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], off10, MO_LEUW);
@@ -4778,7 +4334,6 @@ static void decode_bo_addrmode_post_pre_base(DisasContext *ctx)
         temp = tcg_temp_new();
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
         gen_offset_st(ctx, temp, cpu_gpr_a[r2], off10, MO_LEUW);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_ST_Q_POSTINC:
         temp = tcg_temp_new();
@@ -4786,13 +4341,11 @@ static void decode_bo_addrmode_post_pre_base(DisasContext *ctx)
         tcg_gen_qemu_st_tl(temp, cpu_gpr_a[r2], ctx->mem_idx,
                            MO_LEUW);
         tcg_gen_addi_tl(cpu_gpr_a[r2], cpu_gpr_a[r2], off10);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_ST_Q_PREINC:
         temp = tcg_temp_new();
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
         gen_st_preincr(ctx, temp, cpu_gpr_a[r2], off10, MO_LEUW);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_ST_W_SHORTOFF:
         gen_offset_st(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], off10, MO_LEUL);
@@ -4915,9 +4468,6 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
 }
 
 static void decode_bo_addrmode_ld_post_pre_base(DisasContext *ctx)
@@ -4982,7 +4532,6 @@ static void decode_bo_addrmode_ld_post_pre_base(DisasContext *ctx)
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], off10);
         gen_ld_2regs_64(cpu_gpr_d[r1+1], cpu_gpr_d[r1], temp, ctx);
         tcg_gen_mov_tl(cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_LD_DA_SHORTOFF:
         CHECK_REG_PAIR(r1);
@@ -5000,7 +4549,6 @@ static void decode_bo_addrmode_ld_post_pre_base(DisasContext *ctx)
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], off10);
         gen_ld_2regs_64(cpu_gpr_a[r1+1], cpu_gpr_a[r1], temp, ctx);
         tcg_gen_mov_tl(cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_BO_LD_H_SHORTOFF:
         gen_offset_ld(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], off10, MO_LESW);
@@ -5167,9 +4715,6 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
 }
 
 static void decode_bo_addrmode_stctx_post_pre_base(DisasContext *ctx)
@@ -5178,7 +4723,7 @@ static void decode_bo_addrmode_stctx_post_pre_base(DisasContext *ctx)
     uint32_t off10;
     int r1, r2;
 
-    TCGv temp, temp2;
+    TCGv temp;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -5187,7 +4732,6 @@ static void decode_bo_addrmode_stctx_post_pre_base(DisasContext *ctx)
 
 
     temp = tcg_temp_new();
-    temp2 = tcg_temp_new();
 
     switch (op2) {
     case OPC2_32_BO_LDLCX_SHORTOFF:
@@ -5260,8 +4804,6 @@ static void decode_bo_addrmode_stctx_post_pre_base(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
@@ -5320,10 +4862,6 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
-    tcg_temp_free(temp3);
 }
 
 static void decode_bol_opc(DisasContext *ctx, int32_t op1)
@@ -5341,13 +4879,11 @@ static void decode_bol_opc(DisasContext *ctx, int32_t op1)
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], address);
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1], temp, ctx->mem_idx, MO_LEUL);
-        tcg_temp_free(temp);
         break;
     case OPC1_32_BOL_LD_W_LONGOFF:
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, cpu_gpr_a[r2], address);
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp, ctx->mem_idx, MO_LEUL);
-        tcg_temp_free(temp);
         break;
     case OPC1_32_BOL_LEA_LONGOFF:
         tcg_gen_addi_tl(cpu_gpr_a[r1], cpu_gpr_a[r2], address);
@@ -5474,7 +5010,6 @@ static void decode_rc_logical_shift(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 static void decode_rc_accumulator(DisasContext *ctx)
@@ -5674,7 +5209,6 @@ static void decode_rc_accumulator(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 static void decode_rc_serviceroutine(DisasContext *ctx)
@@ -5764,7 +5298,6 @@ static void decode_rcpw_insert(DisasContext *ctx)
         if (pos + width <= 32) {
             temp = tcg_const_i32(const4);
             tcg_gen_deposit_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], temp, pos, width);
-            tcg_temp_free(temp);
         }
         break;
     default:
@@ -5807,14 +5340,10 @@ static void decode_rcrw_insert(DisasContext *ctx)
         tcg_gen_movi_tl(temp2, const4);
         tcg_gen_andi_tl(temp3, cpu_gpr_d[r3], 0x1f);
         gen_insert(cpu_gpr_d[r4], cpu_gpr_d[r1], temp2, temp, temp3);
-
-        tcg_temp_free(temp3);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 /* RCR format */
@@ -5847,16 +5376,12 @@ static void decode_rcr_cond_select(DisasContext *ctx)
         temp2 = tcg_const_i32(const9);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], temp2);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     case OPC2_32_RCR_SELN:
         temp = tcg_const_i32(0);
         temp2 = tcg_const_i32(const9);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], temp2);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -6236,8 +5761,6 @@ static void decode_rr_accumulator(DisasContext *ctx)
             tcg_gen_mov_tl(temp, cpu_gpr_d[r1]);
             tcg_gen_mov_tl(cpu_gpr_d[r3], cpu_gpr_d[r2]);
             tcg_gen_mov_tl(cpu_gpr_d[r3 + 1], temp);
-
-            tcg_temp_free(temp);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
@@ -6377,13 +5900,10 @@ static void decode_rr_logical_shift(DisasContext *ctx)
 {
     uint32_t op2;
     int r3, r2, r1;
-    TCGv temp;
 
     r3 = MASK_OP_RR_D(ctx->opcode);
     r2 = MASK_OP_RR_S2(ctx->opcode);
     r1 = MASK_OP_RR_S1(ctx->opcode);
-
-    temp = tcg_temp_new();
     op2 = MASK_OP_RR_OP2(ctx->opcode);
 
     switch (op2) {
@@ -6448,7 +5968,6 @@ static void decode_rr_logical_shift(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 static void decode_rr_address(DisasContext *ctx)
@@ -6471,14 +5990,12 @@ static void decode_rr_address(DisasContext *ctx)
         temp = tcg_temp_new();
         tcg_gen_shli_tl(temp, cpu_gpr_d[r1], n);
         tcg_gen_add_tl(cpu_gpr_a[r3], cpu_gpr_a[r2], temp);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_RR_ADDSC_AT:
         temp = tcg_temp_new();
         tcg_gen_sari_tl(temp, cpu_gpr_d[r1], 3);
         tcg_gen_add_tl(temp, cpu_gpr_a[r2], temp);
         tcg_gen_andi_tl(cpu_gpr_a[r3], temp, 0xFFFFFFFC);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_RR_EQ_A:
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr_d[r3], cpu_gpr_a[r1],
@@ -6598,10 +6115,6 @@ static void decode_rr_divide(DisasContext *ctx)
         /* write result */
         tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], 24);
         tcg_gen_mov_tl(cpu_gpr_d[r3+1], temp3);
-
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
-        tcg_temp_free(temp3);
         break;
     case OPC2_32_RR_DVINIT_H:
         CHECK_REG_PAIR(r3);
@@ -6631,9 +6144,6 @@ static void decode_rr_divide(DisasContext *ctx)
         /* write result */
         tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], 16);
         tcg_gen_mov_tl(cpu_gpr_d[r3+1], temp3);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
-        tcg_temp_free(temp3);
         break;
     case OPC2_32_RR_DVINIT:
         temp = tcg_temp_new();
@@ -6655,8 +6165,6 @@ static void decode_rr_divide(DisasContext *ctx)
         tcg_gen_mov_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
         /* sign extend to high reg */
         tcg_gen_sari_tl(cpu_gpr_d[r3+1], cpu_gpr_d[r1], 31);
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
     case OPC2_32_RR_DVINIT_U:
         /* overflow = (D[b] == 0) */
@@ -6758,7 +6266,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         GEN_HELPER_LL(mul_h, temp64, cpu_gpr_d[r1], cpu_gpr_d[r2], n);
         tcg_gen_extr_i64_i32(cpu_gpr_d[r3], cpu_gpr_d[r3+1], temp64);
         gen_calc_usb_mul_h(cpu_gpr_d[r3], cpu_gpr_d[r3+1]);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MUL_H_32_LU:
         temp64 = tcg_temp_new_i64();
@@ -6766,7 +6273,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         GEN_HELPER_LU(mul_h, temp64, cpu_gpr_d[r1], cpu_gpr_d[r2], n);
         tcg_gen_extr_i64_i32(cpu_gpr_d[r3], cpu_gpr_d[r3+1], temp64);
         gen_calc_usb_mul_h(cpu_gpr_d[r3], cpu_gpr_d[r3+1]);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MUL_H_32_UL:
         temp64 = tcg_temp_new_i64();
@@ -6774,7 +6280,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         GEN_HELPER_UL(mul_h, temp64, cpu_gpr_d[r1], cpu_gpr_d[r2], n);
         tcg_gen_extr_i64_i32(cpu_gpr_d[r3], cpu_gpr_d[r3+1], temp64);
         gen_calc_usb_mul_h(cpu_gpr_d[r3], cpu_gpr_d[r3+1]);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MUL_H_32_UU:
         temp64 = tcg_temp_new_i64();
@@ -6782,7 +6287,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         GEN_HELPER_UU(mul_h, temp64, cpu_gpr_d[r1], cpu_gpr_d[r2], n);
         tcg_gen_extr_i64_i32(cpu_gpr_d[r3], cpu_gpr_d[r3+1], temp64);
         gen_calc_usb_mul_h(cpu_gpr_d[r3], cpu_gpr_d[r3+1]);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MULM_H_64_LL:
         temp64 = tcg_temp_new_i64();
@@ -6793,7 +6297,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         tcg_gen_movi_tl(cpu_PSW_V, 0);
         /* reset AV bit */
         tcg_gen_mov_tl(cpu_PSW_AV, cpu_PSW_V);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MULM_H_64_LU:
         temp64 = tcg_temp_new_i64();
@@ -6804,7 +6307,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         tcg_gen_movi_tl(cpu_PSW_V, 0);
         /* reset AV bit */
         tcg_gen_mov_tl(cpu_PSW_AV, cpu_PSW_V);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MULM_H_64_UL:
         temp64 = tcg_temp_new_i64();
@@ -6815,7 +6317,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         tcg_gen_movi_tl(cpu_PSW_V, 0);
         /* reset AV bit */
         tcg_gen_mov_tl(cpu_PSW_AV, cpu_PSW_V);
-        tcg_temp_free_i64(temp64);
         break;
     case OPC2_32_RR1_MULM_H_64_UU:
         temp64 = tcg_temp_new_i64();
@@ -6826,8 +6327,6 @@ static void decode_rr1_mul(DisasContext *ctx)
         tcg_gen_movi_tl(cpu_PSW_V, 0);
         /* reset AV bit */
         tcg_gen_mov_tl(cpu_PSW_AV, cpu_PSW_V);
-        tcg_temp_free_i64(temp64);
-
         break;
     case OPC2_32_RR1_MULR_H_16_LL:
         GEN_HELPER_LL(mulr_h, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2], n);
@@ -6848,7 +6347,6 @@ static void decode_rr1_mul(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(n);
 }
 
 static void decode_rr1_mulq(DisasContext *ctx)
@@ -6918,8 +6416,6 @@ static void decode_rr1_mulq(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 /* RR2 format */
@@ -7009,7 +6505,6 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
             tcg_gen_movi_tl(temp, ((1u << width) - 1) << pos);
             tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
             tcg_gen_mov_tl(cpu_gpr_d[r3 + 1], temp);
-            tcg_temp_free(temp);
         }
 
         break;
@@ -7058,13 +6553,11 @@ static void decode_rrr_cond_select(DisasContext *ctx)
         temp = tcg_const_i32(0);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], cpu_gpr_d[r2]);
-        tcg_temp_free(temp);
         break;
     case OPC2_32_RRR_SELN:
         temp = tcg_const_i32(0);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], cpu_gpr_d[r2]);
-        tcg_temp_free(temp);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -7577,8 +7070,6 @@ static void decode_rrr1_maddq_h(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static void decode_rrr1_maddsu_h(DisasContext *ctx)
@@ -8061,8 +7552,6 @@ static void decode_rrr1_msubq_h(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
-    tcg_temp_free(temp2);
 }
 
 static void decode_rrr1_msubad_h(DisasContext *ctx)
@@ -8257,7 +7746,6 @@ static void decode_rrrr_extract_insert(DisasContext *ctx)
              */
             tcg_gen_movcond_tl(TCG_COND_EQ, msw, tmp_pos, zero, zero, msw);
             tcg_gen_or_tl(cpu_gpr_d[r4], tmp_width, msw);
-            tcg_temp_free(msw);
         }
         break;
     case OPC2_32_RRRR_EXTR:
@@ -8285,8 +7773,6 @@ static void decode_rrrr_extract_insert(DisasContext *ctx)
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(tmp_pos);
-    tcg_temp_free(tmp_width);
 }
 
 /* RRRW format */
@@ -8332,8 +7818,6 @@ static void decode_rrrw_extract_insert(DisasContext *ctx)
         tcg_gen_shl_tl(temp2, temp2, temp);
         tcg_gen_shl_tl(cpu_gpr_d[r4], cpu_gpr_d[r2], temp);
         tcg_gen_mov_tl(cpu_gpr_d[r4+1], temp2);
-
-        tcg_temp_free(temp2);
         break;
     case OPC2_32_RRRW_INSERT:
         temp2 = tcg_temp_new();
@@ -8341,13 +7825,10 @@ static void decode_rrrw_extract_insert(DisasContext *ctx)
         tcg_gen_movi_tl(temp, width);
         tcg_gen_andi_tl(temp2, cpu_gpr_d[r3], 0x1f);
         gen_insert(cpu_gpr_d[r4], cpu_gpr_d[r1], cpu_gpr_d[r2], temp, temp2);
-
-        tcg_temp_free(temp2);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
     }
-    tcg_temp_free(temp);
 }
 
 /* SYS Format*/
@@ -8400,7 +7881,6 @@ static void decode_sys_interrupts(DisasContext *ctx)
             gen_set_label(l1);
             tcg_gen_exit_tb(NULL, 0);
             ctx->base.is_jmp = DISAS_NORETURN;
-            tcg_temp_free(tmp);
         } else {
             /* generate privilege trap */
         }
@@ -8482,9 +7962,6 @@ static void decode_32Bit_opc(DisasContext *ctx)
 
         tcg_gen_shri_tl(temp2, cpu_gpr_d[r1], 16);
         tcg_gen_qemu_st_tl(temp2, temp, ctx->mem_idx, MO_LEUW);
-
-        tcg_temp_free(temp2);
-        tcg_temp_free(temp);
         break;
     case OPC1_32_ABS_LD_Q:
         address = MASK_OP_ABS_OFF18(ctx->opcode);
@@ -8493,8 +7970,6 @@ static void decode_32Bit_opc(DisasContext *ctx)
 
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp, ctx->mem_idx, MO_LEUW);
         tcg_gen_shli_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 16);
-
-        tcg_temp_free(temp);
         break;
     case OPC1_32_ABS_LEA:
         address = MASK_OP_ABS_OFF18(ctx->opcode);
@@ -8514,9 +7989,6 @@ static void decode_32Bit_opc(DisasContext *ctx)
         tcg_gen_andi_tl(temp2, temp2, ~(0x1u << bpos));
         tcg_gen_ori_tl(temp2, temp2, (b << bpos));
         tcg_gen_qemu_st_tl(temp2, temp, ctx->mem_idx, MO_UB);
-
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
         break;
 /* B-format */
     case OPC1_32_B_CALL:
@@ -8647,10 +8119,6 @@ static void decode_32Bit_opc(DisasContext *ctx)
         tcg_gen_andi_tl(temp3, cpu_gpr_d[r3], 0x1f);
 
         gen_insert(cpu_gpr_d[r2], cpu_gpr_d[r1], temp, temp2, temp3);
-
-        tcg_temp_free(temp);
-        tcg_temp_free(temp2);
-        tcg_temp_free(temp3);
         break;
 /* RCRW Format */
     case OPCM_32_RCRW_MASK_INSERT:
-- 
2.34.1


