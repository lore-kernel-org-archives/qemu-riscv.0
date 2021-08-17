Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6Tb-0001XS-Sh
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TZ-0001SO-KW
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TX-0001AP-Na
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:25 -0400
Received: by mail-pf1-x429.google.com with SMTP id a21so5959pfh.5
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuLqHw6EmBFQhmSiZUuE3orIiC7schsJfqiWupX1ZH8=;
 b=vCmrYVDT+DE0EcbieoxOrBWlX/TkPTNwXyBa23JQMLZkN2JCGWq1NbvRauikqFrb+G
 LXV5SSMdpRYPI7v1Cl//AK2esrmVSYgt04XO2EMvfp5szIIaVxKzgGhLwdc3BlmWhutO
 AlY+DP9L9Pjj5QiUERGjCqG5/4HWG8XhLHx3A+ZdcBRV4NGJ3J93k3cyxiawjvX5WwSm
 SstVIvFyImzryBS3VRrWhxekQjb88VOH7nybX3iDAp+M2vU+XG3+t8SkQItnRokIT3Il
 CwlIjVz7IC14WCNI8EL+YbWyLJXKr67Mb2nJvghMDryT0qEjIAC0mnLIuWvgJLS5OEOg
 Dhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuLqHw6EmBFQhmSiZUuE3orIiC7schsJfqiWupX1ZH8=;
 b=gtcO9rs73ayLJIAtgpsV5rdsSo0Fz10vTJ1e5KCKpxb3ScKNJMcGhEPHKZGwR+Xbdu
 3Klf7Hkk/w7NKgry1k0Y92srAN0mD9jXy3dQ6m/uIAyIybiWbEYshnSZFN7TQMVoLPRJ
 UUFdybcTF/b/dawP5d6Hm2K2wWt4pe5ksRA/Hl5ow3iHBW8utk3OIGkKxTiKsDobJOh6
 2qZsQd8oK/m1BPHcc8L2SmHiR8rkLTmW285ljJ0NNZKUc6x7+UTiDEc3Z99RT4xwpApz
 r5S2/S6e31eLOZKCE5wso44FD87Q5WnN6G4yuSy04kyMcxsNb+tlOKNFD9gF9ASRMwzX
 /gag==
X-Gm-Message-State: AOAM532C1A2JXuPRIH+ObhlRKOnRst8E9a4nLuEA02wMOqmflYsYRCzR
 B7kjFUo0LMd8iAcwL6CemPGW5Q==
X-Google-Smtp-Source: ABdhPJyZNPg7vjCvaLI/j+bHFfIx3/cA+mawkjrdRdSv91vlgfyEDOsaQedwQjTakEtdsZ2gg2ijyA==
X-Received: by 2002:a05:6a00:181c:b029:3c6:2258:a844 with SMTP id
 y28-20020a056a00181cb02903c62258a844mr5679370pfa.6.1629235102437; 
 Tue, 17 Aug 2021 14:18:22 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 10/21] target/riscv: Add DisasExtend to gen_unary
Date: Tue, 17 Aug 2021 11:17:52 -1000
Message-Id: <20210817211803.283639-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:26 -0000

Use ctx->w for ctpopw, which is the only one that can
re-use the generic algorithm for the narrow operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 14 ++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++---------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8d96e70abb..178d317976 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -477,17 +477,15 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
     return true;
 }
 
-static bool gen_unary(DisasContext *ctx, arg_r2 *a,
-                      void(*func)(TCGv, TCGv))
+static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv))
 {
-    TCGv source = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    gen_get_gpr(ctx, source, a->rs1);
+    func(dest, src1);
 
-    (*func)(source, source);
-
-    gen_set_gpr(ctx, a->rd, source);
-    tcg_temp_free(source);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73f088be23..e255678fff 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -26,7 +26,7 @@ static void gen_clz(TCGv ret, TCGv arg1)
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
 
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -37,13 +37,13 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
@@ -132,13 +132,13 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
 
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
 
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
@@ -366,7 +366,6 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_ext32u_tl(ret, arg1);
     tcg_gen_clzi_tl(ret, ret, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
@@ -375,7 +374,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -388,20 +387,15 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctzw);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
+    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_cpopw);
+    ctx->w = true;
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.25.1


