Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxz-0001Iv-NB
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxx-0001CF-KJ
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxn-0003sy-KZ
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f11so3800800pfc.12
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOwqXmy0DLXDHpeSukJo0JXwgO1q1jJP7vVLlRn8ZSQ=;
 b=OkjJDP2urg6i21fvAmIVO1Eou/ft3lPdIpF9t9uOwU+Sl+TlLO9udAelCwO/LhHw8/
 uXYED953KyNva8kgsW93aIMhTbkfPDtQCfwmJ6lrId/mMvknE7SFHIUZ+x4uO3fye0C5
 PJ5mBAZS9azcY3kB/orhZfkgZj7QSZeX/3eSD9mmgFzh1cNXbenpLU3zd/Pkqz7uk6ye
 f4Xgb68ttEQ/w/w7SPZBPPBYdBS5RUxE+wnVfJQQDRBRalFoOzz+km08wZpQVzmIXUct
 78Kdshq23iubJHmgibGYodoMDnVmnM27cvGTbiQjp9rnfJ3s3Brf6VcHmmwrbY8oQ54s
 i1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOwqXmy0DLXDHpeSukJo0JXwgO1q1jJP7vVLlRn8ZSQ=;
 b=4ex9cg0Woe5qrqsRr/wykBX4a6CDqE9slTMXCbRMZKVV0UBtqH2yr+eoAly7ILiLZz
 nsfojmHB2zvUlGm6NHAAq/8PGH1dews4vFByLf1Off7J43FN4Xla6HHcndyUrLY4VJLv
 saRafnxymwLa45yfDL20tgIhH9JYpwnxViGtNvcA0SSXktus0xR6KcHEz98aNaBsUqni
 FyUSrs8U/q/hubUQ66CqGcSku0Zld4DbbYyS48GsmV5RFEGPuwrVF2gvYB4QOfeuFoFI
 vudrvTJvTbf5RijFL59jCqwbRZSHH5vSlk0sehHkKkm/7F+RbVId4B8yg75Avr8+4MTA
 CCKA==
X-Gm-Message-State: AOAM530ljp+zTECu0w28+Ig6NMcaNb2wft+IwXgumb7qf03Ra+8yUiEm
 y6mRfIgCRaF//geoOt0oBFaoJw==
X-Google-Smtp-Source: ABdhPJySL6+OBO9hVN7j76if6AA9k2TOcVAq/FDm7T2R99b370BFwCM4ka9deKzJFQtL/sQqJMGqNA==
X-Received: by 2002:a63:7450:: with SMTP id e16mr4171573pgn.482.1634284150499; 
 Fri, 15 Oct 2021 00:49:10 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 38/78] target/riscv: rvv-1.0: floating-point scalar move
 instructions
Date: Fri, 15 Oct 2021 15:45:46 +0800
Message-Id: <20211015074627.3957162-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:22 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 38 ++++++++++++-------------
 target/riscv/internals.h                |  5 ----
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e33ec82fdf8..ab5fdbf9be8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -637,8 +637,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
+vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
+vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
 vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1340ce56806..aec0316fba4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3046,14 +3046,19 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 /* Floating-Point Scalar Move Instructions */
 static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
-    if (!s->vill && has_ext(s, RVF) &&
-        (s->mstatus_fs != 0) && (s->sew != 0)) {
-        unsigned int len = 8 << s->sew;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
+        unsigned int ofs = (8 << s->sew);
+        unsigned int len = 64 - ofs;
+        TCGv_i64 t_nan;
 
         vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
-        if (len < 64) {
-            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
-                            MAKE_64BIT_MASK(len, 64 - len));
+        /* NaN-box f[rd] as necessary for SEW */
+        if (len) {
+            t_nan = tcg_constant_i64(UINT64_MAX);
+            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
+                                t_nan, ofs, len);
         }
 
         mark_fs_dirty(s);
@@ -3065,25 +3070,20 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 /* vfmv.s.f vd, rs1 # vd[0] = rs1 (vs2=0) */
 static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
-    if (!s->vill && has_ext(s, RVF) && (s->sew != 0)) {
-        TCGv_i64 t1;
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s)) {
         /* The instructions ignore LMUL and vector register group. */
-        uint32_t vlmax = s->vlen >> 3;
+        TCGv_i64 t1;
+        TCGLabel *over = gen_new_label();
 
         /* if vl == 0, skip vector register write back */
-        TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        /* zeroed all elements */
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), vlmax, vlmax, 0);
-
-        /* NaN-box f[rs1] as necessary for SEW */
+        /* NaN-box f[rs1] */
         t1 = tcg_temp_new_i64();
-        if (s->sew == MO_64 && !has_ext(s, RVD)) {
-            tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));
-        } else {
-            tcg_gen_mov_i64(t1, cpu_fpr[a->rs1]);
-        }
+        do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 81f5dfa477a..ac062dc0b4e 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -32,11 +32,6 @@ target_ulong fclass_h(uint64_t frs1);
 target_ulong fclass_s(uint64_t frs1);
 target_ulong fclass_d(uint64_t frs1);
 
-#define SEW8  0
-#define SEW16 1
-#define SEW32 2
-#define SEW64 3
-
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
-- 
2.25.1


