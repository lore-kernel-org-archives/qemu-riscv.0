Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZW-0000Qi-Kt
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZS-0000Gk-R1
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:18 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZR-0008FW-0s
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:18 -0400
Received: by mail-pl1-x643.google.com with SMTP id x8so3481863plm.10
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOTwXorMBOXrFmJmINeMsaqUEEGcVRjeFDnFBQo8HEo=;
 b=OWorXomajix5u8n2V0P5mG7310nVjhH15eJMmSgUcM9IiGU6L0Jnf/5LjfF+qHDm/u
 +9OEjhWzyUw5JlL9N8UkxLRvemDZnpBYa693YQ4fAW4DJS1OAeUDGOeg2uT3qaIz5KNL
 wngMvliPXXJZJZToqr883aF+QrPciIGLvwEK1QTHx5e7wXoZDzIkqkiS5CBFeWu+5eu7
 Wl43aw6l7UrFiCIXAwk4AylJo+LLf2GA76VOhFOrAlTSjvrsCfWadJTIy3IzIUqIyq/F
 OygLzaVjbBQT1JieoZLWvmvWgNKzkknEYJwPWMl/ZJ1h6btpxNn3SRR6fZCSZr2wrmNk
 3h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOTwXorMBOXrFmJmINeMsaqUEEGcVRjeFDnFBQo8HEo=;
 b=HVIWqHfjO+nuCsm3wUIfBFFSsNvKjgcIQSMUS9RRJGY64zO2IbSYEo8Or9mG/uUHdo
 GCBg5Oax2KjlFEEESIPHfboLh5PgAKC3d5ioOB5m9OteU2RV1DvoeyCLNM4i55V+nMHj
 l/K1iAlnc91TCJIuvzd14Y3QJHhVIw/UTp1lwLXPTcb4jqTXQxK0AZEVkkdLBYXNc/cO
 rwdC+AsmxYZv1RG/ByMtupjjYx40iFhKjOPbhUkEhVXzA0Yx3HbZ/WJ3EFnAPFBQg5Zz
 wml0aKe5IiBsDed84l4nb+mCbjx8NIejlx3l1fUgb0AhkXAi4QSmH03rura4X4mEK5Lv
 7E0w==
X-Gm-Message-State: AOAM533HZH7dyOrP0a1wJNChvgVtq6x7aKfMpsoC9TQ9Y0OEmI7NTZkL
 0MeUntjZ2gB0wTyfW8tJ0xC/Bw==
X-Google-Smtp-Source: ABdhPJwl8uVFVOUmkuYLNztuogGhRxfNxGr6QF7tQHDHoD06giqNVb2pExkoWH7ebit3c1AIgf8C4Q==
X-Received: by 2002:a17:90a:c085:: with SMTP id
 o5mr2918973pjs.196.1595550495670; 
 Thu, 23 Jul 2020 17:28:15 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 5/7] target/riscv: Check nanboxed inputs in trans_rvf.inc.c
Date: Thu, 23 Jul 2020 17:28:05 -0700
Message-Id: <20200724002807.441147-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2020 00:28:19 -0000

If a 32-bit input is not properly nanboxed, then the input is replaced
with the default qnan.  The only inline expansion is for the sign-changing
set of instructions: FSGNJ.S, FSGNJX.S, FSGNJN.S.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.inc.c | 71 +++++++++++++++++++------
 target/riscv/translate.c                | 18 +++++++
 2 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 264d3139f1..f9a9e0643a 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -161,47 +161,86 @@ static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+
     if (a->rs1 == a->rs2) { /* FMOV */
-        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
     } else { /* FSGNJ */
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2], cpu_fpr[a->rs1],
-                            0, 31);
+        TCGv_i64 rs1 = tcg_temp_new_i64();
+        TCGv_i64 rs2 = tcg_temp_new_i64();
+
+        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        /* This formulation retains the nanboxing of rs2. */
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
+        tcg_temp_free_i64(rs1);
+        tcg_temp_free_i64(rs2);
     }
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
     mark_fs_dirty(ctx);
     return true;
 }
 
 static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
 {
+    TCGv_i64 rs1, rs2, mask;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+
+    rs1 = tcg_temp_new_i64();
+    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
+        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31, 1));
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
-        tcg_temp_free_i64(t0);
+        rs2 = tcg_temp_new_i64();
+        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Replace bit 31 in rs1 with inverse in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        mask = tcg_const_i64(~MAKE_64BIT_MASK(31, 1));
+        tcg_gen_andc_i64(rs2, mask, rs2);
+        tcg_gen_and_i64(rs1, mask, rs1);
+        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(mask);
+        tcg_temp_free_i64(rs2);
     }
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+    tcg_temp_free_i64(rs1);
+
     mark_fs_dirty(ctx);
     return true;
 }
 
 static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
 {
+    TCGv_i64 rs1, rs2;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+
+    rs1 = tcg_temp_new_i64();
+    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT32_MIN);
+        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(31, 1));
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT32_MIN);
-        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
-        tcg_temp_free_i64(t0);
+        rs2 = tcg_temp_new_i64();
+        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Xor bit 31 in rs1 with that in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
+        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(rs2);
     }
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+    tcg_temp_free_i64(rs1);
+
     mark_fs_dirty(ctx);
     return true;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 12a746da97..bf35182776 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -101,6 +101,24 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+/*
+ * A narrow n-bit operation, where n < FLEN, checks that input operands
+ * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
+ * If so, the least-significant bits of the input are used, otherwise the
+ * input value is treated as an n-bit canonical NaN (v2.2 section 9.2).
+ *
+ * Here, the result is always nan-boxed, even the canonical nan.
+ */
+static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffff7fc00000ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-- 
2.25.1


