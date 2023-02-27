Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1s-0008BT-S2
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1Z-0007PY-5f
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:09 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1W-0007Jv-Dn
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:08 -0500
Received: by mail-pl1-x62b.google.com with SMTP id v11so2002333plz.8
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDigh3LB3s6a/Rl+FCKzmXQVkFODGqoxKbWHFAog88M=;
 b=UPaUNyhkbfn5ggIGRDsDj95zzTZRFvfQEMst2Yt0/u9IK34EeYPA5zNw9Awt4eql3e
 YOY6boDL62zwRWW/PJ7lmoVkRP2CVrsv7mbxmQTfGNbM7xldCnl9OrH/92hd7V3KXFUX
 jto1tzJpqoiTNYQHM8WSmUQj14jF5FF6Ubv+fE1FOa3Z9t7a3j/e/1jXMu5m62/HU9yu
 Nu3vYw1UrujpIejwJ9IfT9mLYaRpz9ciGYJ4q6HNNs3Zj/CxMPjet1FQFpT88GAcFGX4
 yVHVXmQon5Dq9Gw9HQrqPVHOHBmTcQtlPEEbcUGjQi/K/OHY1CAXMb3wDOnxgdFEsLhh
 cfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDigh3LB3s6a/Rl+FCKzmXQVkFODGqoxKbWHFAog88M=;
 b=CxJYJo4PBNC5OtxFfFQCMx+fXfhbrJpcs/HcpkHDZpAiGTBgwt6UwNkfqbNpwGwsIt
 1kWMN0hZnu04WmjEODl6UzDQ7RYr9LbbymBHAhtY75/P0/MwCX014fgMyTDn2HhXyaEx
 6YeH1vzVxUBNDcN62XGDAosFYViLNmq6fS9S0dGYZwlavAmWmQjjLIHEml3ose6vxlaT
 a9V9+1iriwQkv6UT9Jw0Cu00KtcFPM+gAyV/wSi554b8OlXlEjk+P+/s10juAYcV9YWl
 KTD2OI+u/VZAXXt2pp02nUAKtafND2a/VHOpdkoccOHMlLQ8Z5JOzk8or4peskO66Y+a
 QdDQ==
X-Gm-Message-State: AO0yUKWu0luoNaDYMr7qjGzQPBqJGzIhoH0kuD5aWWE4BgGhEVzjZYsO
 PrH30PTvCy3itNJI16MOFL3UaA==
X-Google-Smtp-Source: AK7set/8bvVMG7CwaT0P9noKJXvh56blwjvM4CgGuRcsxG+SOHpECb3Vx9oVlYiueeAcDHQnSMPnlQ==
X-Received: by 2002:a17:902:d709:b0:19c:d78b:cdc with SMTP id
 w9-20020a170902d70900b0019cd78b0cdcmr8499032ply.5.1677475565584; 
 Sun, 26 Feb 2023 21:26:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 20/76] target/avr: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:09 -1000
Message-Id: <20230227052505.352889-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:10 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 228 -----------------------------------------
 1 file changed, 228 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 4f8112c3e6..b9506a8d86 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -221,10 +221,6 @@ static void gen_add_CHf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_shri_tl(cpu_Cf, t1, 7); /* Cf = t1(7) */
     tcg_gen_shri_tl(cpu_Hf, t1, 3); /* Hf = t1(3) */
     tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
-
-    tcg_temp_free_i32(t3);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_add_Vf(TCGv R, TCGv Rd, TCGv Rr)
@@ -239,9 +235,6 @@ static void gen_add_Vf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_andc_tl(t1, t1, t2);
 
     tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
-
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
@@ -259,10 +252,6 @@ static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_shri_tl(cpu_Cf, t2, 7); /* Cf = t2(7) */
     tcg_gen_shri_tl(cpu_Hf, t2, 3); /* Hf = t2(3) */
     tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
-
-    tcg_temp_free_i32(t3);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_sub_Vf(TCGv R, TCGv Rd, TCGv Rr)
@@ -277,9 +266,6 @@ static void gen_sub_Vf(TCGv R, TCGv Rd, TCGv Rr)
     tcg_gen_and_tl(t1, t1, t2);
 
     tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
-
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_NSf(TCGv R)
@@ -317,9 +303,6 @@ static bool trans_ADD(DisasContext *ctx, arg_ADD *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -344,9 +327,6 @@ static bool trans_ADC(DisasContext *ctx, arg_ADC *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -385,10 +365,6 @@ static bool trans_ADIW(DisasContext *ctx, arg_ADIW *a)
     /* update output registers */
     tcg_gen_andi_tl(RdL, R, 0xff);
     tcg_gen_shri_tl(RdH, R, 8);
-
-    tcg_temp_free_i32(Rd);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -413,9 +389,6 @@ static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -440,10 +413,6 @@ static bool trans_SUBI(DisasContext *ctx, arg_SUBI *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-    tcg_temp_free_i32(Rr);
-
     return true;
 }
 
@@ -475,10 +444,6 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -509,11 +474,6 @@ static bool trans_SBCI(DisasContext *ctx, arg_SBCI *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(R);
-    tcg_temp_free_i32(Rr);
-
     return true;
 }
 
@@ -552,10 +512,6 @@ static bool trans_SBIW(DisasContext *ctx, arg_SBIW *a)
     /* update output registers */
     tcg_gen_andi_tl(RdL, R, 0xff);
     tcg_gen_shri_tl(RdH, R, 8);
-
-    tcg_temp_free_i32(Rd);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -578,9 +534,6 @@ static bool trans_AND(DisasContext *ctx, arg_AND *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -620,9 +573,6 @@ static bool trans_OR(DisasContext *ctx, arg_OR *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -700,10 +650,6 @@ static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
 
     /* update output registers */
     tcg_gen_mov_tl(Rd, R);
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -773,9 +719,6 @@ static bool trans_MUL(DisasContext *ctx, arg_MUL *a)
     /* update status register */
     tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -806,11 +749,6 @@ static bool trans_MULS(DisasContext *ctx, arg_MULS *a)
     /* update status register */
     tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -840,10 +778,6 @@ static bool trans_MULSU(DisasContext *ctx, arg_MULSU *a)
     /* update status register */
     tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(15) */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -874,10 +808,6 @@ static bool trans_FMUL(DisasContext *ctx, arg_FMUL *a)
     tcg_gen_andi_tl(R0, R, 0xff);
     tcg_gen_shri_tl(R1, R, 8);
     tcg_gen_andi_tl(R1, R1, 0xff);
-
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -913,11 +843,6 @@ static bool trans_FMULS(DisasContext *ctx, arg_FMULS *a)
     tcg_gen_andi_tl(R0, R, 0xff);
     tcg_gen_shri_tl(R1, R, 8);
     tcg_gen_andi_tl(R1, R1, 0xff);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -951,10 +876,6 @@ static bool trans_FMULSU(DisasContext *ctx, arg_FMULSU *a)
     tcg_gen_andi_tl(R0, R, 0xff);
     tcg_gen_shri_tl(R1, R, 8);
     tcg_gen_andi_tl(R1, R1, 0xff);
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -1009,25 +930,17 @@ static void gen_jmp_z(DisasContext *ctx)
 static void gen_push_ret(DisasContext *ctx, int ret)
 {
     if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
-
         TCGv t0 = tcg_const_i32((ret & 0x0000ff));
 
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
-
-        tcg_temp_free_i32(t0);
     } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
-
         TCGv t0 = tcg_const_i32((ret & 0x00ffff));
 
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
-
-        tcg_temp_free_i32(t0);
-
     } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
-
         TCGv lo = tcg_const_i32((ret & 0x0000ff));
         TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
 
@@ -1035,9 +948,6 @@ static void gen_push_ret(DisasContext *ctx, int ret)
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
         tcg_gen_qemu_st_tl(hi, cpu_sp, MMU_DATA_IDX, MO_BEUW);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
-
-        tcg_temp_free_i32(lo);
-        tcg_temp_free_i32(hi);
     }
 }
 
@@ -1061,9 +971,6 @@ static void gen_pop_ret(DisasContext *ctx, TCGv ret)
         tcg_gen_qemu_ld_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
 
         tcg_gen_deposit_tl(ret, lo, hi, 8, 16);
-
-        tcg_temp_free_i32(lo);
-        tcg_temp_free_i32(hi);
     }
 }
 
@@ -1291,9 +1198,6 @@ static bool trans_CP(DisasContext *ctx, arg_CP *a)
     gen_sub_CHf(R, Rd, Rr);
     gen_sub_Vf(R, Rd, Rr);
     gen_ZNSf(R);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -1322,10 +1226,6 @@ static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
      * cleared otherwise.
      */
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_Zf, R, zero, cpu_Zf, zero);
-
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
@@ -1348,10 +1248,6 @@ static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
     gen_sub_CHf(R, Rd, Rr);
     gen_sub_Vf(R, Rd, Rr);
     gen_ZNSf(R);
-
-    tcg_temp_free_i32(R);
-    tcg_temp_free_i32(Rr);
-
     return true;
 }
 
@@ -1683,9 +1579,6 @@ static bool trans_LDS(DisasContext *ctx, arg_LDS *a)
     tcg_gen_ori_tl(addr, addr, a->imm);
 
     gen_data_load(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1720,9 +1613,6 @@ static bool trans_LDX1(DisasContext *ctx, arg_LDX1 *a)
     TCGv addr = gen_get_xaddr();
 
     gen_data_load(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1735,9 +1625,6 @@ static bool trans_LDX2(DisasContext *ctx, arg_LDX2 *a)
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
     gen_set_xaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1749,9 +1636,6 @@ static bool trans_LDX3(DisasContext *ctx, arg_LDX3 *a)
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_load(ctx, Rd, addr);
     gen_set_xaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1789,9 +1673,6 @@ static bool trans_LDY2(DisasContext *ctx, arg_LDY2 *a)
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
     gen_set_yaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1803,9 +1684,6 @@ static bool trans_LDY3(DisasContext *ctx, arg_LDY3 *a)
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_load(ctx, Rd, addr);
     gen_set_yaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1816,9 +1694,6 @@ static bool trans_LDDY(DisasContext *ctx, arg_LDDY *a)
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_load(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1860,9 +1735,6 @@ static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
     gen_set_zaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1875,9 +1747,6 @@ static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
     gen_data_load(ctx, Rd, addr);
 
     gen_set_zaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1888,9 +1757,6 @@ static bool trans_LDDZ(DisasContext *ctx, arg_LDDZ *a)
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_load(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1917,9 +1783,6 @@ static bool trans_STS(DisasContext *ctx, arg_STS *a)
     tcg_gen_shli_tl(addr, addr, 16);
     tcg_gen_ori_tl(addr, addr, a->imm);
     gen_data_store(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1950,9 +1813,6 @@ static bool trans_STX1(DisasContext *ctx, arg_STX1 *a)
     TCGv addr = gen_get_xaddr();
 
     gen_data_store(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1964,9 +1824,6 @@ static bool trans_STX2(DisasContext *ctx, arg_STX2 *a)
     gen_data_store(ctx, Rd, addr);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     gen_set_xaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1978,9 +1835,6 @@ static bool trans_STX3(DisasContext *ctx, arg_STX3 *a)
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_store(ctx, Rd, addr);
     gen_set_xaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2015,9 +1869,6 @@ static bool trans_STY2(DisasContext *ctx, arg_STY2 *a)
     gen_data_store(ctx, Rd, addr);
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     gen_set_yaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2029,9 +1880,6 @@ static bool trans_STY3(DisasContext *ctx, arg_STY3 *a)
     tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
     gen_data_store(ctx, Rd, addr);
     gen_set_yaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2042,9 +1890,6 @@ static bool trans_STDY(DisasContext *ctx, arg_STDY *a)
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_store(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2080,9 +1925,6 @@ static bool trans_STZ2(DisasContext *ctx, arg_STZ2 *a)
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
 
     gen_set_zaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2095,9 +1937,6 @@ static bool trans_STZ3(DisasContext *ctx, arg_STZ3 *a)
     gen_data_store(ctx, Rd, addr);
 
     gen_set_zaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2108,9 +1947,6 @@ static bool trans_STDZ(DisasContext *ctx, arg_STDZ *a)
 
     tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
     gen_data_store(ctx, Rd, addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2142,9 +1978,6 @@ static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2162,9 +1995,6 @@ static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
     tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
     tcg_gen_or_tl(addr, addr, L);
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2186,9 +2016,6 @@ static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
     tcg_gen_andi_tl(L, addr, 0xff);
     tcg_gen_shri_tl(addr, addr, 8);
     tcg_gen_andi_tl(H, addr, 0xff);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2217,9 +2044,6 @@ static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
     TCGv addr = gen_get_zaddr();
 
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2233,9 +2057,6 @@ static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
     TCGv addr = gen_get_zaddr();
 
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2251,9 +2072,6 @@ static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
     tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
     tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
     gen_set_zaddr(addr);
-
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2307,9 +2125,6 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
     TCGv port = tcg_const_i32(a->imm);
 
     gen_helper_inb(Rd, cpu_env, port);
-
-    tcg_temp_free_i32(port);
-
     return true;
 }
 
@@ -2323,9 +2138,6 @@ static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
     TCGv port = tcg_const_i32(a->imm);
 
     gen_helper_outb(cpu_env, port, Rd);
-
-    tcg_temp_free_i32(port);
-
     return true;
 }
 
@@ -2393,10 +2205,6 @@ static bool trans_XCH(DisasContext *ctx, arg_XCH *a)
     gen_data_load(ctx, t0, addr);
     gen_data_store(ctx, Rd, addr);
     tcg_gen_mov_tl(Rd, t0);
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2426,11 +2234,6 @@ static bool trans_LAS(DisasContext *ctx, arg_LAS *a)
     tcg_gen_or_tl(t1, t0, Rr);
     tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
     gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2461,11 +2264,6 @@ static bool trans_LAC(DisasContext *ctx, arg_LAC *a)
     tcg_gen_andc_tl(t1, t0, Rr); /* t1 = t0 & (0xff - Rr) = t0 & ~Rr */
     tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
     gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2496,11 +2294,6 @@ static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
     tcg_gen_xor_tl(t1, t0, Rd);
     tcg_gen_mov_tl(Rd, t0); /* Rd = t0 */
     gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -2559,9 +2352,6 @@ static bool trans_ROR(DisasContext *ctx, arg_ROR *a)
 
     /* update status register */
     gen_rshift_ZNVSf(Rd);
-
-    tcg_temp_free_i32(t0);
-
     return true;
 }
 
@@ -2586,9 +2376,6 @@ static bool trans_ASR(DisasContext *ctx, arg_ASR *a)
 
     /* update status register */
     gen_rshift_ZNVSf(Rd);
-
-    tcg_temp_free_i32(t0);
-
     return true;
 }
 
@@ -2606,10 +2393,6 @@ static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
     tcg_gen_andi_tl(t1, Rd, 0xf0);
     tcg_gen_shri_tl(t1, t1, 4);
     tcg_gen_or_tl(Rd, t0, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t0);
-
     return true;
 }
 
@@ -2625,10 +2408,6 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
     gen_helper_outb(cpu_env, port, data);
-
-    tcg_temp_free_i32(port);
-    tcg_temp_free_i32(data);
-
     return true;
 }
 
@@ -2644,10 +2423,6 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
     gen_helper_outb(cpu_env, port, data);
-
-    tcg_temp_free_i32(data);
-    tcg_temp_free_i32(port);
-
     return true;
 }
 
@@ -2675,9 +2450,6 @@ static bool trans_BLD(DisasContext *ctx, arg_BLD *a)
     tcg_gen_andi_tl(Rd, Rd, ~(1u << a->bit)); /* clear bit */
     tcg_gen_shli_tl(t1, cpu_Tf, a->bit); /* create mask */
     tcg_gen_or_tl(Rd, Rd, t1);
-
-    tcg_temp_free_i32(t1);
-
     return true;
 }
 
-- 
2.34.1


