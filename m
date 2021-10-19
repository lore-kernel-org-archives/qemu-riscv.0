Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZZ-000543-Ff
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZQ-0004tj-3p
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZE-0001lG-9L
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m21so17669407pgu.13
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7yPgPOtdXc8cLGoEleP9T3gCAQ/J91zHEOZFu0LBcU=;
 b=woBCMucaWtY+UI1ywYdNCmU3tGp0PtxvIiIqce98ZwdAoldf3Yy6dIwdP0mL1M1ZL6
 UTNKR+z9O73aoZCC1E8xzRMPNU3P4A/PPS/SGsskx5znhtXHXhmP+jJUvLlfMod1pUYv
 5U4ir1o3cTFlgsa65c9+qLtos0L5OhjTX8bdw0k9P8yLKcYf7Revkvy+/muYSVZw5ZDU
 SGlYXeQg2OWj6DuWMQMtExrGTq4LCwZi2Ffhd5dEQZRvQBlS2ye7lIri5ot6wk/hkSx0
 OVszfbPa05WNsjKe+lGM8PvlWyZxLGPyvFJUEYvQAWWsYErBqoRYASxuc+SytaZ+hhZL
 OopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7yPgPOtdXc8cLGoEleP9T3gCAQ/J91zHEOZFu0LBcU=;
 b=gihUnGcNSQuZ0mRE0049ACxbeVFFEJ+2gHMXq/VIZviV7Jri/L+XbgzOpxFJk08GSv
 YpKEc2MXrLIuz/AnT9cdTFXSPs18rD6P0/IxEFvFN/b7rUIO4ourzuQvUD+PcUROAb6a
 PAQHkMN4a7k7ngH35B+pIQiC6cORrlV6MEUoJPsWrG6FW4oMMBnAhrT6eKFRgy8Fj5L9
 qZ3ZvrOuKBVK0m281841elzRveJwF7dlGx56Ahndo6HVsXU12wsOIg0P5i7aAdSuvjSq
 2QHXtMwJf++2NDI17ydMFpNP70bxW8vrcW+0NYgEfgURMIrckkTNPvvWHx/99bZ3gLw8
 bumw==
X-Gm-Message-State: AOAM533cto1EvuSmVPOJmAjXYJQcKX4Js8h9w1btm63kSixDglWTVqa5
 IwJ3ovVREG7JQYBSR9kL/jjImVZl7g1b1g==
X-Google-Smtp-Source: ABdhPJzMu+grTf5BvDAl/FzIV9LFRW3QxJoMEBAztG+U3UOoqB0V8mTczfT1Dd+8hjG/XnYZKLGacw==
X-Received: by 2002:a63:2484:: with SMTP id
 k126mr26091938pgk.297.1634601678794; 
 Mon, 18 Oct 2021 17:01:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 12/16] target/riscv: Use gen_unary_per_ol for RVB
Date: Mon, 18 Oct 2021 17:01:04 -0700
Message-Id: <20211019000108.3678724-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:32 -0000

The count zeros instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5d54570cc9..ebcd1c8431 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -486,6 +486,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv))
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
+    return gen_unary(ctx, a, ext, f_tl);
+}
+
 static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c62eea433a..0c2120428d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -47,10 +47,18 @@ static void gen_clz(TCGv ret, TCGv arg1)
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
 
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
+}
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
+    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
 }
 
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -58,10 +66,15 @@ static void gen_ctz(TCGv ret, TCGv arg1)
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
 
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, 32);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
+    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
@@ -314,14 +327,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
 }
 
-static void gen_clzw(TCGv ret, TCGv arg1)
-{
-    TCGv t = tcg_temp_new();
-    tcg_gen_shli_tl(t, arg1, 32);
-    tcg_gen_clzi_tl(ret, t, 32);
-    tcg_temp_free(t);
-}
-
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -329,17 +334,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
     return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
 
-static void gen_ctzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-    tcg_gen_ctzi_tl(ret, ret, 64);
-}
-
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
-- 
2.25.1


