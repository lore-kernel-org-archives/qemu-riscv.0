Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHwb-0006tu-6v
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwX-0006fl-7v
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwV-0002iT-BO
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id t184so6834044pfd.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSesJMTViR+gfcHGhiiIQkXXH1EzNz+zD7L/UEO6ZtU=;
 b=ImfSQ2j8lduMulacfIieX+USFjvk5aKRVaeLQxuqxh2y9MPFZeY3WAm0N/dc6J6r5r
 IoHKLbvc3ji46Yi4wkOf5/BWfzyIrgJT4FAjWnl0ury4sm8KtKLe3NwGGbfazvuhzjM6
 BoM1SiE2pq+ZrJc5V2h7UXbGUHFFEixepiWyjdfXcplbLaQpWvNNV7dE4uyGc1nOaBCL
 LbeZOtE6hZ21iOPJXe4NdAPtETJR9s4sOR0VgxEZ22SqokYghWwMkP61WTwzsmSAGazT
 47DR6UnILYUHItMtH16UK4x4axOwb/D8jbSQAXDB4wheF3dxjAD5PiOx6BWZHuWJCGlc
 ZATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSesJMTViR+gfcHGhiiIQkXXH1EzNz+zD7L/UEO6ZtU=;
 b=4+2LHY5A2xXrdEOdCjY4qO57LWvmjsEnjZWsj8kL3xBeze6ypiDoZo+7bgJg/3+qsJ
 kWQZapzM1B8B3G+jmSawooUjjxCh+ydKsv5KXPZSVlVrqV7mx9cA1AuH2ijxWpr7VsaK
 IMsfF2rKs7IttbcfG/dZluuLuRFjjHGAnQRHrabVHt7VbHdWwpe+ZGTihh65XrQFGdmf
 X5hpMtoU4dTtnf+TssDmBM9axoYWwEpgBjMYMNcBZaPf69F26PnfR87rjH2hWfF4uwjB
 mNHY+4yT+jb+CngK8eW7MZ+nvFROMi5FjCLVNRcwIn7BSMId0Zfl14rHoj8yLvNlO2Av
 DA3g==
X-Gm-Message-State: AOAM533jpBDKdQ7a/Xu6x8p2DE0PHOyfYYO/sL7eVxIAH3LaCAnqAbCr
 hDA+jOx28GpsTyYax8ageu4i679SuESd4hUC
X-Google-Smtp-Source: ABdhPJz7QV9Z8lqsaFkdm1nH6+cNg2rTNdDg+EDl7ef5Jhh+YThg5Qksw3C9sun0HG1THUSZuKuF/A==
X-Received: by 2002:aa7:8d09:0:b0:44b:fd25:dd8a with SMTP id
 j9-20020aa78d09000000b0044bfd25dd8amr10366377pfe.41.1634284068284; 
 Fri, 15 Oct 2021 00:47:48 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 19/78] target/riscv: rvv-1.0: configure instructions
Date: Fri, 15 Oct 2021 15:45:21 +0800
Message-Id: <20211015074627.3957162-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:47:53 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 64 +++++++++++--------------
 target/riscv/vector_helper.c            | 14 +++++-
 2 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ddea578d0ba..ddc5f602768 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -120,59 +120,51 @@ static bool require_noover(const int8_t dst, const int8_t dst_lmul,
     return !is_overlapped(dst, dst_size, src, src_size);
 }
 
-static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
+static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
-    TCGv s1, s2, dst;
+    TCGv s1, dst;
 
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
         return false;
     }
 
-    s2 = get_gpr(ctx, a->rs2, EXT_ZERO);
-    dst = dest_gpr(ctx, a->rd);
+    dst = dest_gpr(s, rd);
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (rd == 0 && rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+        s1 = get_gpr(s, rs1, EXT_ZERO);
     }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
 
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    lookup_and_goto_ptr(ctx);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
-}
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
 
-static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
-{
-    TCGv s1, s2, dst;
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    lookup_and_goto_ptr(s);
+    s->base.is_jmp = DISAS_NORETURN;
 
-    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
-        return false;
+    if (rd == 0 && rs1 == 0) {
+        tcg_temp_free(s1);
     }
 
-    s2 = tcg_constant_tl(a->zimm);
-    dst = dest_gpr(ctx, a->rd);
+    return true;
+}
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
-        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_constant_tl(RV_VLEN_MAX);
-    } else {
-        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
-    }
-    gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(ctx, a->rd, dst);
-    mark_vs_dirty(ctx);
+static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
+{
+    TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
+}
 
-    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
+{
+    TCGv s2 = tcg_constant_tl(a->zimm);
+    return do_vsetvl(s, a->rd, a->rs1, s2);
 }
 
 /* vector register offset from env */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bf976d364f1..78fae782840 100644
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
2.25.1


