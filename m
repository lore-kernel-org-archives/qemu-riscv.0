Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNnp-00019s-JZ
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNno-00016O-4F
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnm-0006ld-Db
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:55 -0400
Received: by mail-pg1-x534.google.com with SMTP id r28so9382851pga.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r4ZA7MKN9GSDsIrNiGKZL8RejwnKG/zplLRprtr+KpU=;
 b=kaa7mQOHgcdmS3pBbIQpJ/sUGt8/xeRh5txzdyl3ZdJbMFAuytwkD2O4H5/6zNTORG
 3t03Vy6t0Wwv7YkuJLVT4j1S+5B+NXmptOTj72GDMIZ723kfbqkjlnXvtszgUg/yy4WO
 hYHWoLBOvIyF6NNp+5Gv4ng4FI+0QcBZ+pCJuwsSjc+MmmIZXtvHA6x4jDSvFdcYrzc7
 f6v/pxfEN41HBtovMyWlNVGZiRnqbO1oeIWjC6QZFbxRK3j9MsOOBWnIGvrBwPr/8b2P
 LYxNX4C/c27edVSaU7CfuCc2k70mW/2DLFNW9o3Vzj5lQdKmh/MPV2084hRILHdEnBlI
 9Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r4ZA7MKN9GSDsIrNiGKZL8RejwnKG/zplLRprtr+KpU=;
 b=X2z0szjYgtnfPz6/ro9GxQ1oI/DYwYhZdpqNMaOWGcDmxnGvwiYwhgoG5/v3KUHmb5
 7O5X6JtbBaxrRoLI3VjYxRRAO5ZLZq5nM8P5SSHjhWFT5e+V445rTM3tiWbf/KN2gVMA
 1sG+lepoQvCyJhqBnUSb08WMwOC83WRRkxzxOBRbXk/7oLQt8qD89dIw1JZQqZ1JOt1u
 Ciu5cDx+FebZMStNT2i8eeLXdUXk1IwkBT6AsmZA7xZzJA8LOK9u0b+4CC4FN3X/4gLk
 GPAnSv2ZDri5M7F0wa2oB35wkV7h7loT4GynAhJqIOrUYforjsvnHsi6Pd5XFtmNXkmc
 yJEA==
X-Gm-Message-State: AOAM531zgm0qYwhB930B1IhSoldlyJpvO/A61dI/X6Jm2MTW447H2kEp
 LCF6puS5wL/abZAdYI3onU9FMw==
X-Google-Smtp-Source: ABdhPJwZxBn4cj9O/2RvY50WZdrfNokiny6YUubWw/e4DoxF8svfE2E1kcUj1/Gl2gM8UZmNJDswdw==
X-Received: by 2002:a63:9844:: with SMTP id l4mr7285474pgo.271.1635498232080; 
 Fri, 29 Oct 2021 02:03:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 67/76] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Fri, 29 Oct 2021 16:59:12 +0800
Message-Id: <20211029085922.255197-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:56 -0000

From: Frank Chang <frank.chang@sifive.com>

If the frm field contains an invalid rounding mode (101-111),
attempting to execute any vector floating-point instruction, even
those that do not depend on the rounding mode, will raise an illegal
instruction exception.

Call gen_set_rm() with DYN rounding mode to check and trigger illegal
instruction exception if frm field contains invalid value at run-time
for vector floating-point instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7589c8ce32a..53c8573f117 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2374,6 +2374,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
+        if (rm != RISCV_FRM_DYN) {
+            gen_set_rm(s, RISCV_FRM_DYN);
+        }
+
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         gen_set_rm(s, rm);
@@ -2459,6 +2463,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         TCGv_i64 t1;
 
         if (s->vl_eq_vlmax) {
@@ -2540,6 +2546,10 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_widen_check(s, a)) {                                  \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
@@ -2627,6 +2637,10 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_narrow_check(s, a)) {                                 \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
@@ -2668,6 +2682,10 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] = {            \
             gen_helper_##HELPER##_b,                               \
@@ -3138,6 +3156,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         unsigned int ofs = (8 << s->sew);
         unsigned int len = 64 - ofs;
         TCGv_i64 t_nan;
@@ -3162,6 +3182,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         /* The instructions ignore LMUL and vector register group. */
         TCGv_i64 t1;
         TCGLabel *over = gen_new_label();
-- 
2.25.1


