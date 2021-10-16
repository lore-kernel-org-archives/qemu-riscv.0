Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGm-0001h1-O7
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGS-0001Co-RN
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGO-0006JB-IG
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id f5so11669418pgc.12
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqaZYwMNZOn8YEHdsz2WHA25s2Dfar4hRERGPbJZMrk=;
 b=CvE6xoXaCt1vsxTPhQ9jH9JHCo6eDbGfnPsNMFCJrAuCn8/TdNyhfuGqJ2PxttI3re
 Z0SAbkOiXwjTKJxotaL8+/asN5U8iOWJ5gdIf6jN56h2TJJjhthtPY5D5XkE9aFg1LFY
 /Fkh0nQByODhs/RauW4iXo4hkPvZWlmJgPQEu8SXoXyF2yd20uMxyvBWgdCICi9zSgkk
 Aljj7brMe8Em64jdFYY+pxVIMwsenlztfHubNCrJV/ly1/zA3Zz94Hy7808XM2YBywLG
 CnumOXZ1b3Q10W2rHlGQlL/6uDcZnyNaW+Bjvo5vKpuuiWpTHBqVYlH+DyaZ8GiH3wdg
 ygeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqaZYwMNZOn8YEHdsz2WHA25s2Dfar4hRERGPbJZMrk=;
 b=S3jC3gHdFC8h6GP8TYVUSo8FnuThRw4+gXqKRJBB0ANVlQSfkmZ6XpI9D62fDoeqVv
 /lkuFHyUalfjs2nuJm9foiroVkL87MbuI2rTxXBE1Ri5H2AxhGBcLnE1CehhZIE8KAT6
 uJO0/oQSdpiQBWTLuyAEWw+kkV4gmm9JntJ0URo3xWrN4PmgpFu2qNvjj3yt5CVWsMGT
 9y7/Fs1yTkajrNP2aP5mBc4FG5ky0YcJ2X2oBCfn9oA8GOX5UeUCWjXOjyFKIFDGb6Lu
 edZZRg1Mji5EUCpXWRVdnEZ/OoHUy1J+h1w5x34EQWeVbOMHPPVsBzVGIeCGOtksfKE8
 MQMw==
X-Gm-Message-State: AOAM530pW/qRFLsp5OLvTp28Zdy/8FjsNfcUcoa6U2U6UhCNo1xOfJii
 bdQOwNukN31A7CYCVXynxyTe/A==
X-Google-Smtp-Source: ABdhPJwHkt4cxkZbUG2z2c8ZH4hDCOAD5ZeVv9e5CENxutYWTNZ3rsytxB7AL7xuFY9TmlCiCfHCGg==
X-Received: by 2002:a05:6a00:24c1:b0:44d:3047:4229 with SMTP id
 d1-20020a056a0024c100b0044d30474229mr18602370pfv.70.1634404467135; 
 Sat, 16 Oct 2021 10:14:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 13/14] target/riscv: Use gen_shift*_per_ol for RVB, RVI
Date: Sat, 16 Oct 2021 10:14:11 -0700
Message-Id: <20211016171412.3163784-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:33 -0000

Most shift instructions require a separate implementation
for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 31 +++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
 target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
 3 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7286791c0f..0b3da060fd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -463,6 +463,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
+                                    DisasExtend ext,
+                                    void (*f_tl)(TCGv, TCGv, target_long),
+                                    void (*f_32)(TCGv, TCGv, target_long))
+{
+    int olen = get_olen(ctx);
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift_imm_fn(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, TCGv))
 {
@@ -499,6 +515,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift(ctx, a, ext, f_tl);
+}
+
 static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 0c2120428d..cc39e6033b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -227,22 +227,70 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
+}
+
+static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_rotri_i32(t1, t1, shamt);
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_rotri_tl, gen_roriw);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
 }
 
 static void gen_rev8_32(TCGv ret, TCGv src1)
@@ -349,24 +397,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
-static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotr_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -380,25 +410,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
-}
-
-static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotl_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
 }
 
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c0a46d823f..b0fdec97de 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -270,14 +270,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_shri_tl, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_sari_tl, gen_sraiw);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -344,11 +356,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
-static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -356,11 +363,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
 }
 
-static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


