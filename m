Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTkv-0003ZG-Vx
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkt-0003SS-Jp
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:27 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkr-00032o-20
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:27 -0500
Received: by mail-pg1-x531.google.com with SMTP id b21so5404518pgk.7
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6q5wwE0arfVC4PKPdxKR/oo3h0u3fI0xMmk5vspLTIE=;
 b=WHkcY4Z4Ll8SnOoXlI+ZTC5nlDEIZ4iLOvtooevOcKfS1gxEC9S4bu/gW2nCFaxIoV
 mY+VorJ7uZSDTL1gEoJS7ZJIc62/g2O1amVpMuISZenXoqnTUcefcL8Lop5b4z4Yi4hR
 gWWmuDNhxIyfbS16zH/ZYyCJFbY1oko+0/zJu0Am6Ft8Tb/UhEvxoRLd5g7Pa1OyJ9RY
 G7b+lk8qytZnYEAmbdLiUicmVH/8EOR7HacnPxnOmofBlfFQ2z5mXZeRew4Al1YUtITz
 KBBmJUDFOwwAt/B1V/CQP463Q2AFDrYn4ElaiZfHwT2GRErpzaWBfAxQ/7U4KQSZmdiW
 i5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6q5wwE0arfVC4PKPdxKR/oo3h0u3fI0xMmk5vspLTIE=;
 b=ESdMImZ1t2JfEJVxjW33NWxVNme/VdUdpxUsoFkDBQvt25roPHU647c/r6wrIFOUeT
 8aYnZ2xps9K/xMVJfyJ5ALISXohPZ8qEFdu51rikma68rgi5hzJNpNNf5byb3BXVg1+x
 Y17vi3zPEVMHDMkhA73oyODaoxRi/vn2f4yjVLjcPgUwuiveug+9uZLYrtwUOq1PbHKs
 cuCB3fspGVw/DOeXFmDizX1DDzUVBaNeZm3Duwd/Y5zjvaZApkCNT32dl50HQTo1yS8v
 d3bXXFu/+ivU51T1dU0+lOai593JEMOLfhzWEXyFp9E3MD++7Z3yfRizFXYnwigdZbuH
 xVqA==
X-Gm-Message-State: AOAM53161J6raaYM2ycC/Tb7N4h6qCDaOsCKEt6huR9/ABQjMUG9dPdl
 nIUrsNO5oJEtb68FmkjDGyQQ5g==
X-Google-Smtp-Source: ABdhPJxo9DS+t170dFB4dIYRu5GtVHBDandim2C3Y6Z0WXUOuFtYQ8VC8Rbnv/9X5hkBGfjusjr2Uw==
X-Received: by 2002:a63:ee4e:: with SMTP id n14mr1026104pgk.422.1614309923824; 
 Thu, 25 Feb 2021 19:25:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 66/75] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Fri, 26 Feb 2021 11:18:50 +0800
Message-Id: <20210226031902.23656-67-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:27 -0000

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
index 03245f67c4b..2a3a437168f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2605,6 +2605,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
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
@@ -2690,6 +2694,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         TCGv_i64 t1;
 
         if (s->vl_eq_vlmax) {
@@ -2772,6 +2778,10 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
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
@@ -2857,6 +2867,10 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
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
@@ -2897,6 +2911,10 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
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
@@ -3372,6 +3390,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         unsigned int ofs = (8 << s->sew);
         unsigned int len = 64 - ofs;
         TCGv_i64 t_nan;
@@ -3397,6 +3417,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         /* The instructions ignore LMUL and vector register group. */
         TCGv_i64 t1;
         TCGLabel *over = gen_new_label();
-- 
2.17.1


