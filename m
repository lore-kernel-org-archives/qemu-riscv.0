Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1malE7-0007r5-Rb
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 16:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDl-0007ei-9c
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDd-0008C4-W4
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id x8so2641976plv.8
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52+7i3/z0p2mVcXTUw31SI3gQpQFEgTKVc2f0m0MGrc=;
 b=hqwmDn+yD12/jgy3l0PA39P6ee5NXYtpi9kWuV3gwlMo3nbvh5HVuDROQyi9bkQUWN
 cKGtRuibidUz+cpheo1gJrYQXcqFHPWZQpEGNS09oG3kVl72+p/ukNjNuiBbWemsx0tx
 hJliwNF/w+sq3lfzSJICCMRLm4CxRfurjE+r++PYFZdgkkxi8wo6Dty124RX/H4W4H3r
 Hx+Jzo7BCoM2cGvSIPh7A+tS+6ZlY9Bsq5Vj4dsNvndCECmyi8xtxIYsIDf84043xLA2
 T5u4e15yatOxPEXT3ctRt3rm+bCLWhlFndNuxFHueNAw1+B2rUJRYXR9swk7HtRxzxdB
 o3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52+7i3/z0p2mVcXTUw31SI3gQpQFEgTKVc2f0m0MGrc=;
 b=tMraeBDOf5PXVSadKY3gJAuHd5h83O3bT+S9UNz+t2rjeZN5i/ATKcdHNF/HHDSarr
 csK/bArg3tOOAsQABZ8v58tIl0t7G6JjTfdyvIWtZ32Ys6hklUbzScb1IQzaC6wW27U1
 Vn3qF2gG3jx+j1vSiJ1HWFtMYs+2Wq5sOZ0+1tpLg1PGhKXtLZ1zAIlxETUzPm8MgqAj
 fD3xlhdPZ2MkFH5HrDFoM32Z7ATRerBD0s+Tb8WI81BUMYfbo/uNl3ycV5x/uqNl7OJE
 JcTOYDv0Sif2MH2XgZsCOzEmA0Tmt4x/QDbG1YkMU367XpapuiM+zKEb4/EUrjaAJA7R
 ZMTQ==
X-Gm-Message-State: AOAM5301yNQhFl3eAoc19JQPmXBzC3IPalW6smDldScnepGqeV8bdd1X
 MyS0GIXrqcawtXMoAt2dl+lbVw==
X-Google-Smtp-Source: ABdhPJwo19QM3GNxVag48wlwwLy+LSlfRprjcwnHV8PxPvJsgKaEG3kg3SfVYaYZTE1a+Mlv6K77CQ==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id
 kb6mr1746132pjb.84.1634158277806; 
 Wed, 13 Oct 2021 13:51:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 12/13] target/riscv: Use gen_unary_per_ol for RVB
Date: Wed, 13 Oct 2021 13:51:03 -0700
Message-Id: <20211013205104.1031679-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 13 Oct 2021 20:51:35 -0000

The count zeros instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f960929c16..be458ae0c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -510,6 +510,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
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


