Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXUu-0004jJ-K4
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUX-00043q-A9
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUU-0006vO-PL
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5695531pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N3Hnmm2MQMIa5OCFLOX/oLKZdwWx7vMKA62OCbtMzhw=;
 b=msRXsXsBG0cT6nChE18nx55qpVzR6LSHzs5DFJY8QZBILrpy74xlkYwmlCO6cRa1Fp
 203d5OAiIHByGpDyBoiGIrXPO9t67BFr6dvN8BJxp6BziHrp2vEJKS+M1MmEzmeeyKcS
 QsmEkoEBu92Uqb99Dm7oQ596iCucpOgj/tfI5EKxV2VsmstnnRco1VyVMu+U9pDvY1yI
 LPh2+qxEgucbls4A5YXVGuVIzi2oJWFg/AOivU83qvH3AiOYfPKRTg6p01VaVdHi8o14
 mn9Ysn1SgJvlUpPwG+gT9l+4d+NNBxbOADRvmhB9UtRyprm+9fw5dIPfGbIkHYSj5lii
 kSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N3Hnmm2MQMIa5OCFLOX/oLKZdwWx7vMKA62OCbtMzhw=;
 b=IeyAXv1fxezhFgS5u+BnaWqRddkxHZD2UmVyCYuITzXk5JbREhjjMLb861jpv3AKXy
 c+9pjLEdei9voCecG3uW7cq4jYbhz5uXD8I7FnkAT+duIQ3S7fcXboOO/mmTcTPcfyPU
 FA2+++MmRibaJjGy+8NJU8lAxyLwJCo5baZbFjK9MzqtbfHGCilvUvHCWxpMFMYBxIyu
 Suq6owGJVdTwr+fdpxpABKGzxWVDKMjgTHzGSqYmgvM1RAhs9tjmLBCI1MYvsNwKlLsl
 DjbVpu9OJ+NczYBYmis5qU5/vmOLE0Fp0d3LvCASFpGWi5oKukJ4Kvf7406ggj5gWk/+
 n4vQ==
X-Gm-Message-State: AOAM53044SXkL9rgqlvRTX123PAB4NN3WGJshNfY65xlOir8Rqq0KRfZ
 F4J1JCzmsVLIRkwPDRHPOFEPGw==
X-Google-Smtp-Source: ABdhPJyUum9RhCMNMc5JGJxAi7n4N8u5YQPZKm+956DIyc64GmGVoXndFBkZd/mxpzVS7bA3SN9qGw==
X-Received: by 2002:a17:902:7d89:b0:13c:a5e1:f0f1 with SMTP id
 a9-20020a1709027d8900b0013ca5e1f0f1mr5094542plm.24.1633628851468; 
 Thu, 07 Oct 2021 10:47:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
Subject: [PATCH 10/13] target/riscv: Use gen_arith_per_ol for RVM
Date: Thu,  7 Oct 2021 10:47:19 -0700
Message-Id: <20211007174722.929993-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Thu, 07 Oct 2021 17:47:45 -0000

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ab5c6aa58..f960929c16 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -427,6 +427,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
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


