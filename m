Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQTt-0008Cg-An
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTo-00087A-9U
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:29 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTl-00073J-UY
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:28 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a5eea94963so577202a34.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982485; x=1684574485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FN853kGcAYdV8a890u3Fe0ddWEgn/rZ1yzgBeq+xwhk=;
 b=VCBEIrhC1i/sQqTv81aBzQPwgYRvasrkgrh9TPPkFA3r6U75SDtMRkj0lOjB3uxg5A
 FSKHYAcR9rnQ+BYLzfTbUIzIPYpMRddXST0Ocm3LvMOTNoDXyXxHqwk2wlxUNU3f03Jq
 pzUEJ156RgWYvOr0vYVQXUC/YjyVwc8zoOrb6Ld8dZAPpd8MGcQZVm42NRGSNMibSmUg
 HLzZiOcGsnRdjCF2B72N9UBevJxwx94VmW+izHF2mzan67P5JVeNOFXqCxtkkkC7MSud
 FhHmGzp8qkji2XP0iyqgmTuWmr+CEA8LCwqAotOoeom92YqlK6k+n6sgzQgaaOQVR4R/
 hX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982485; x=1684574485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FN853kGcAYdV8a890u3Fe0ddWEgn/rZ1yzgBeq+xwhk=;
 b=lkmps5llVwrniKUalL6FJ5SYjDoOiKV2fp9YwrAVfSkkqdfyvewLeGrhUr6wqeln8l
 YlCzwrrcyKG+B9wRIbFyNUi/GLh5bcqOksWdO8FWDIaxZ5gNyGP042fXlcJcUNOeK+/R
 s1GZfR3FtlKMfCoA2i56BvM5RTeZxoVbwmByk+tXtIpiixstgMYheTM7663XwcKEKKwP
 LQPIzl9DO3EyurMF72Q/JTbU0BKSJniEuEPtE6Wnb5pCXSGsc1F+84YMp6Vz4Y3CHpen
 F05vE7DPk5wz7dp4Ypq3jy/vB2TcMjfJGQPqdLdWSS0fnqia8FhBUVhs1/aezBYBXw/D
 uelg==
X-Gm-Message-State: AAQBX9fn7whwihqzfuS9FWABT1au5LoVtRVT95sfviQaFVnPrxlBKJ8A
 8g23Y5yzKu/eQU6Uz4jHGYl/JQ==
X-Google-Smtp-Source: AKy350ZYrJ5xcDEgpAVPkd43HqMnAqXjz0U3UHOcRD6Q0vDLBcFg5IBN58NHiLlDSNuy4x/ty+CHSw==
X-Received: by 2002:a05:6870:339e:b0:17f:84ba:98e2 with SMTP id
 w30-20020a056870339e00b0017f84ba98e2mr864696oae.22.1681982484878; 
 Thu, 20 Apr 2023 02:21:24 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: [PATCH RESEND v7 06/12] target/riscv: Update check for Zca/Zcf/Zcd
Date: Thu, 20 Apr 2023 06:20:54 -0300
Message-Id: <20230420092100.177464-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:29 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
version is higher than the priv version of C/F/D. So if we use check
for them instead of check for C/F/D totally, it will trigger new
problem when we try to disable the extensions based on the configured
priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
 target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
 target/riscv/translate.c                |  5 +++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..6bdb55ef43 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,9 +31,11 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCD(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zcd) {  \
-        return false;     \
+#define REQUIRE_ZCD_OR_DC(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) { \
+        if (!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
@@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
 static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fld(ctx, a);
 }
 
 static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fsd(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b2de4fcf3f..c47138575a 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,10 +30,12 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCF(ctx) do {                  \
-    if (!ctx->cfg_ptr->ext_zcf) {              \
-        return false;                          \
-    }                                          \
+#define REQUIRE_ZCF_OR_FC(ctx) do {                     \
+    if (!ctx->cfg_ptr->ext_zcf) {                       \
+        if (!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
+            return false;                               \
+        }                                               \
+    }                                                   \
 } while (0)
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
@@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 
 static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_flw(ctx, a);
 }
 
 static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_fsw(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c70c495fc5..e33f63bea1 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
+        ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 928da0d3f0..a889454137 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1123,7 +1123,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
          * The Zca extension is added as way to refer to instructions in the C
          * extension that do not include the floating-point loads and stores
          */
-        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
+        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
+            decode_insn16(ctx, opcode)) {
             return;
         }
     } else {
-- 
2.40.0


