Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGB1-0003jY-9a
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAp-0003gs-Ro
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:12 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAm-0007RQ-Vn
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:11 -0500
Received: by mail-pf1-x430.google.com with SMTP id b3so731546pft.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mkSgJj+AdtN+uPMUSm+PksB4+E8StQF6TXa/U+VZxYE=;
 b=AoTRIu7XbNG35qogik87/vcbB4rTyT9+oXAWWsubJvx/oTSrm4rZ7Eik9jVGXCArXR
 gqd0w7mHZlqBaUxL24dk6wpIKWU1xhIWrqCE9Ob9tPiYyOCjX2xXuJrcJ3PBK4dn8cJv
 FqnlSkkcmIO7m5AE+xQn0maNuwA/5VbPF3q113drZuXIC37Z33xQjCO4vCqHI3nvZGwn
 0fNx8yyL8nJeuf9ROeju92ldPx7iBOvrsxTOTlPGxSsxHvPjTLDbfmoPBi5qTouTJDJZ
 6AYhVF5f19gj3QyYJQhNT4QIul+oob+vqOnUpACAnfOyoaz7KmkTmX7BviQq3PN1HSi8
 PhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mkSgJj+AdtN+uPMUSm+PksB4+E8StQF6TXa/U+VZxYE=;
 b=qO4pJe9Q1lD2Fza4mmYsLu/DdKJWE80skJz+9bQOm0PQByjAzhZyvl+OrsEEotn/RA
 CpzRuFKjeWmWoZO7E7jRz5ZaiXKcdCqG2uUktHqMZWuMXdUXbMUL/N7SLJzQ9WBldNAZ
 /i2cLjCIRrt24BLkZmasWUvljtDnVTQR6hOMqsw+z7aGRwE+9vkp4oWEa77sMDfP8G3m
 3NdWSafmEG5YwIfLjYJ0r+HQk3CV+a1G2n+LhNzJCE+bhAQRfQvzkuJaKgmmANMhuh7t
 bn7oD0opY63CLBAltcVEEVamUw+Omqihb6bxLB+QPPmiCpNe4duvG+KF+JjCNE48WhmQ
 vvxQ==
X-Gm-Message-State: AOAM531iV8fVtJzGWhDxLaff+aKlrJO0Jql/SL554VCPRL9r4qxNANtz
 JU0Y7l0GuNQE2VXt/vjlhGO93g==
X-Google-Smtp-Source: ABdhPJx2PXKffxCQuMghCQrpSfW0azsmyYrKNBE0SX27cES1F2KENMgsek7d/AVZxx7X0i0h6kgX3g==
X-Received: by 2002:a63:574c:: with SMTP id h12mr3909671pgm.79.1610444467053; 
 Tue, 12 Jan 2021 01:41:07 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 17/72] target/riscv: rvv-1.0: configure instructions
Date: Tue, 12 Jan 2021 17:38:51 +0800
Message-Id: <20210112093950.17530-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:41:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 53 +++++++++----------------
 target/riscv/vector_helper.c            | 14 ++++++-
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ccfa93cf2f8..a3732e76e09 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -132,28 +132,29 @@ static bool require_noover_seg(const int8_t dst, const int8_t nf,
     return !is_overlapped(dst, nf, src, 1);
 }
 
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool do_vsetvl(DisasContext *ctx, int rd, int rs1, TCGv s2)
 {
-    TCGv s1, s2, dst;
+    TCGv s1, dst;
 
     if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
 
-    s2 = tcg_temp_new();
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (rd == 0 && rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+        gen_get_gpr(s1, rs1);
     }
-    gen_get_gpr(s2, a->rs2);
+
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
+    gen_set_gpr(rd, dst);
     mark_vs_dirty(ctx);
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     lookup_and_goto_ptr(ctx);
@@ -165,35 +166,17 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     return true;
 }
 
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
+static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
-    TCGv s1, s2, dst;
-
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
-        return false;
-    }
-
-    s2 = tcg_const_tl(a->zimm);
-    dst = tcg_temp_new();
-
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
-    } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
-    mark_vs_dirty(ctx);
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    TCGv s2 = tcg_temp_new();
+    gen_get_gpr(s2, a->rs2);
+    return do_vsetvl(ctx, a->rd, a->rs1, s2);
+}
 
-    tcg_temp_free(s1);
-    tcg_temp_free(s2);
-    tcg_temp_free(dst);
-    return true;
+static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
+{
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetvl(ctx, a->rd, a->rs1, s2);
 }
 
 /* vector register offset from env */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 89aa7cbf73f..61917d34ffe 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -31,12 +31,24 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
+    uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    if (lmul & 4) {
+        /* Fractional LMUL. */
+        if (lmul == 4 ||
+            cpu->cfg.elen >> (8 - lmul) < sew) {
+            vill = true;
+        }
+    }
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || (ediv != 0)
+        || (reserved != 0)) {
         /* only set vill bit. */
         env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
         env->vl = 0;
-- 
2.17.1


