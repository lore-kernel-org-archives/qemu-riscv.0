Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGj-0001Vs-RB
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGP-00018q-1T
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:29 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-0006Fz-AZ
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w14so8436403pll.2
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMzXowYp45MDo1QL85pdXlIgOHzRQK8VX891q2+N84Y=;
 b=xzn+fScSeqBIWXSIdjyESljiycd1lSWc5NiiuteaqRWxZuW2BR47C5VvALeIvsmvG+
 hEBl7RQ/qFNTbeZjzwBF/CqXRa+rjiF6Wnn12PgR4AXLkpS9bHiUEpeBnYjaU+/QUAJU
 TtWEzaMPKruDpZjsxZBDtguzWXl1IJCSg2IS+7IJaC0hU90YwNAxC+pe9+/YCqajATDm
 TrGyG8WNa9P/T29ZF4br4xWvf+KlNlszWlT/oWXQsFVBzfuu5wUK6AJtNvNIRYa7MwGr
 EozO0xgn1UKi+aax2OqQ1W3sWvHXkuEPn6BVLL4iVbeVVaZaLkfWPXONaiOfwpF6+ZSa
 Ka9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMzXowYp45MDo1QL85pdXlIgOHzRQK8VX891q2+N84Y=;
 b=PJXBkBgT7b1PjzsPcHyTw35JMqoh3WhbyoBuLrmcq1qZTABLRGqrDcMAHtRFOFzar6
 ICUvo9nKLgwFB52MAMLGh/WeOCc94GDtNwHyBo3+HRKdHePyvmGa6jnNhrvQ2aLewF37
 Jo19kPfmxntd0lJJOi2tRB6zJNeY+xgBFoznSbOVTlDviUslFHGO0LXsH/Hpoi2qSgPv
 98B8sygSX/wCqt9k6NC63jctZFnibQA05afXKg/MTxEuqXU95F/5tVE0eSeScWz0XYH+
 wc4mnMhnSmdB+zB7VT0qpLCBa+16vvHcTOsH+qyBBYUH/e1VAGEyzFsG+U0Qj4EPXzk0
 /1IA==
X-Gm-Message-State: AOAM533pBxHieMimZUgverPUJSRipH2QspHwYwOPTrHzi2qeJqGOWfLU
 3V7+JsqLIToLL9vnMM3vIPsFAA==
X-Google-Smtp-Source: ABdhPJxhaehDyiyy+24AxT/h6OMGmclNNVTLqix/eGl7gQx8mwJyoxyFuL7L9V7pJv4lQvYdFHgL1w==
X-Received: by 2002:a17:90a:3e0c:: with SMTP id
 j12mr36206653pjc.23.1634404464266; 
 Sat, 16 Oct 2021 10:14:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 10/14] target/riscv: Use gen_arith_per_ol for RVM
Date: Sat, 16 Oct 2021 10:14:08 -0700
Message-Id: <20211016171412.3163784-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:29 -0000

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 172eea3935..8f5f39d143 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -428,6 +428,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_arith(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 9a1fe3c799..2af0e5c139 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
     tcg_temp_free(discard);
 }
 
+static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_mul_tl(ret, s1, s2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
+static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_ext32s_tl(t1, arg1);
+    tcg_gen_ext32u_tl(t2, arg2);
+    tcg_gen_mul_tl(ret, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    /* gen_mulh_w works for either sign as input. */
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-- 
2.25.1


