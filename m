Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqfD-0007Yv-Cv
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeu-0006dE-7o
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:00 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeq-0002Gc-Pk
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:59 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c1so1893953plg.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qBc9vHr7iMJiuvhm33sJS22hD/SEU2q8VFJIqFm9Qw=;
 b=A83V4+VPXi/Qofq6zX/G2ZfHoeOwJrXWEh2ZsxESbFVis3aSUTSmgMkAAA0EV2m1OS
 /kRiU3F2qc0ntBtM0LsgOFC/wOCpw2XtY68uOPTRhXZps31fBgCI54GU4xDeHHwbHFzO
 3JsuYqlr484gcGO8abfb/gUnpTEfSdmfKSkdOyoh9dfh/P/tj9jrtqEfquU0Xv4QowEa
 NPpsw3ETnrVb4w8Wa/HHZ+ivyn3sr/XaYdvZD7GRMQGZXs6/p5987vO6tfz0alpn4MhD
 Q8g4WwRwb3ax+UMIZIqoHAO7nKcx3Lc/+OCKsqLSs4Gh7/8Ibu90GYS3YyFx0Rg7cZK6
 PAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qBc9vHr7iMJiuvhm33sJS22hD/SEU2q8VFJIqFm9Qw=;
 b=TJjXbjxUydDdE8SRJsNmnUM1ImiDHVgfGrRl7pP0fTzT/n4UzUnEz8CLTDihYWnahT
 415sbN5pINWw2uN+JOZLUI3FYBM+HKIeuFuYgqjsu3vnPl0ayUnHdI7xlloc7glLRw7K
 Xp0697khNJ84qCuVmyD+DFDcHShqJ0nQZQmnvgADNKcfk8f/5h+8t8RELlMIltfnKcxA
 Z6IvUYHB0R0Z+Mok+RyoYQI3Dn87Yst1IgmH2nbnFiIJljyM0z0SOLc1mdgy4BXIUuua
 y6kB868uROBeXaBpetmQDUqkDkknEAFSzgkHY+Rv8BWfpVmp1Ow5tXosOneYJe+FWlsb
 MxlA==
X-Gm-Message-State: AO0yUKVJw6cSdDVZwqxO9WlsBSxxz3L3s9N83G/gieUoFHQ/gHWjBF/D
 jIQ6068F95L6WDMxxGTjt8sjjw==
X-Google-Smtp-Source: AK7set+fEJGKUADsK0C96k+/Oo6JTNvbQSZ82BEq6Nluie4/bDswbNAKXNq71k3rK5X/AV6Jj7n79g==
X-Received: by 2002:a17:903:2903:b0:19c:d550:803e with SMTP id
 lh3-20020a170903290300b0019cd550803emr3763911plb.57.1677316555278; 
 Sat, 25 Feb 2023 01:15:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 32/76] target/loongarch: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:13:43 -1000
Message-Id: <20230225091427.1817156-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Sat, 25 Feb 2023 09:16:00 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_arith.c.inc | 12 -------
 .../loongarch/insn_trans/trans_atomic.c.inc   |  3 --
 target/loongarch/insn_trans/trans_bit.c.inc   | 12 -------
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  3 --
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 20 ++---------
 target/loongarch/insn_trans/trans_fmov.c.inc  |  6 ----
 .../loongarch/insn_trans/trans_memory.c.inc   | 34 +++----------------
 .../insn_trans/trans_privileged.c.inc         |  4 ---
 target/loongarch/insn_trans/trans_shift.c.inc | 11 ------
 9 files changed, 6 insertions(+), 99 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
index 8e45eadbc8..43d6cf261d 100644
--- a/target/loongarch/insn_trans/trans_arith.c.inc
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -100,14 +100,12 @@ static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_muls2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_mulu2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
@@ -129,9 +127,6 @@ static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
     tcg_gen_and_tl(ret, ret, t0);
     tcg_gen_or_tl(ret, ret, t1);
     tcg_gen_movcond_tl(TCG_COND_NE, ret, ret, zero, ret, src2);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void prep_divisor_du(TCGv ret, TCGv src2)
@@ -152,7 +147,6 @@ static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
@@ -160,7 +154,6 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
@@ -168,7 +161,6 @@ static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_divu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
@@ -176,7 +168,6 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_remu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
@@ -185,7 +176,6 @@ static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for div_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
@@ -194,7 +184,6 @@ static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for rem_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
@@ -202,7 +191,6 @@ static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
     TCGv t0 = tcg_temp_new();
     tcg_gen_shli_tl(t0, src1, sa);
     tcg_gen_add_tl(dest, t0, src2);
-    tcg_temp_free(t0);
 }
 
 static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
index 6763c1c301..612709f2a7 100644
--- a/target/loongarch/insn_trans/trans_atomic.c.inc
+++ b/target/loongarch/insn_trans/trans_atomic.c.inc
@@ -14,7 +14,6 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
     tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -43,8 +42,6 @@ static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_setcond_tl(TCG_COND_EQ, dest, t0, cpu_llval);
     gen_set_label(done);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
-    tcg_temp_free(val);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index b01e4aeb23..25b4d7858b 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -122,9 +122,6 @@ static void gen_revb_2h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revb_4h(TCGv dest, TCGv src1)
@@ -138,9 +135,6 @@ static void gen_revb_4h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revh_2w(TCGv dest, TCGv src1)
@@ -154,9 +148,6 @@ static void gen_revh_2w(TCGv dest, TCGv src1)
     tcg_gen_and_i64(t0, t0, mask);
     tcg_gen_shli_i64(t1, t1, 16);
     tcg_gen_or_i64(dest, t1, t0);
-
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_revh_d(TCGv dest, TCGv src1)
@@ -171,9 +162,6 @@ static void gen_revh_d(TCGv dest, TCGv src1)
     tcg_gen_shli_tl(t0, t0, 16);
     tcg_gen_or_tl(t0, t0, t1);
     tcg_gen_rotri_tl(dest, t0, 32);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 2ccf646ccb..3b0da2b9f4 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -38,7 +38,6 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-    tcg_temp_free(var);
     return true;
 }
 
@@ -57,7 +56,5 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-
-    tcg_temp_free(var);
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 3025a1d3e9..0d11843873 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -13,12 +13,11 @@ static void maybe_nanbox_load(TCGv freg, MemOp mop)
 static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
@@ -26,31 +25,22 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
 
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
 static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
     return true;
 }
 
@@ -66,7 +56,6 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -82,7 +71,6 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -100,7 +88,6 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -117,7 +104,6 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -135,7 +121,6 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -152,7 +137,6 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 8e5106db4e..069c941665 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -18,7 +18,6 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
                        cpu_fpr[a->fj], cpu_fpr[a->fk]);
-    tcg_temp_free(cond);
 
     return true;
 }
@@ -82,9 +81,6 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
         tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
         tcg_gen_or_i32(fcsr0, fcsr0, temp);
         tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
-
-        tcg_temp_free_i32(temp);
-        tcg_temp_free_i32(fcsr0);
     }
 
     /*
@@ -134,7 +130,6 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -157,7 +152,6 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
index d5eb31147c..75cfdf59ad 100644
--- a/target/loongarch/insn_trans/trans_memory.c.inc
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -7,21 +7,15 @@ static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -29,20 +23,14 @@ static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -56,7 +44,6 @@ static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -70,7 +57,6 @@ static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
 
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -146,21 +132,15 @@ static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -168,20 +148,14 @@ static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 56f4c45e09..5a04352b01 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -291,10 +291,6 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
         tcg_gen_st_tl(newv, cpu_env, csr->offset);
     }
     gen_set_gpr(a->rd, oldv, EXT_NONE);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(newv);
-    tcg_temp_free(oldv);
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
index 5260af2337..bf5428a2ba 100644
--- a/target/loongarch/insn_trans/trans_shift.c.inc
+++ b/target/loongarch/insn_trans/trans_shift.c.inc
@@ -8,7 +8,6 @@ static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
@@ -16,7 +15,6 @@ static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
@@ -24,7 +22,6 @@ static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
@@ -32,7 +29,6 @@ static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
@@ -40,7 +36,6 @@ static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
@@ -48,7 +43,6 @@ static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
@@ -64,10 +58,6 @@ static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
 
     tcg_gen_rotr_i32(t1, t1, t2);
     tcg_gen_ext_i32_tl(dest, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
@@ -75,7 +65,6 @@ static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_rotr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
-- 
2.34.1


