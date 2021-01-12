Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEK-0007mV-DA
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGE8-0007eu-M7
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:38 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGE4-00006v-6x
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id c13so1050174pfi.12
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6q5wwE0arfVC4PKPdxKR/oo3h0u3fI0xMmk5vspLTIE=;
 b=g0JTv0u6u+0bbvLLJzIe0BLhgLjZju7OH0ETBbAHwQNUJRTtYdosEun5IvtCVuRxrc
 dzXfx8cuRUk0LRK5DCGa86MyoaVZixhQuKDMGf9xGXrMt+Ail9hPCl2QPSj/eGt2KN4R
 5B5+uZulxuYsrniTCm9/GnIz8kV5WXTvhCM3/Z7zztci4Cc+k8UnJBq7adKva10MlSnl
 itjxzZ7ss3lJPNJ82G5VSwogyyoo/5hWf6ozflG6U2nFMUjOVQhcNVeQVPoxk7+Svxoo
 WP/yJZWSaAVQhtco1/gq/0bq8syKZ8LEfefdzD146Tg8sirUwzb7Wv7ZDfm+8FSSw09n
 NsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6q5wwE0arfVC4PKPdxKR/oo3h0u3fI0xMmk5vspLTIE=;
 b=YyF1aTFjP0xkP3l8yBLvsmreizUDU1OI1N3Edm9UjY7agspZ1tbb4/6LZeI1ms3HRS
 RI5IpKFjURsPqVyzH27tXTAQ19cv2qK0Yg120bTffXbClNXE27znwttZzHnicy8VXLQZ
 HRkpczfBR6W3ce67hkWfbOGqcso5MczIPpxyeG0f3+10vN+BTMaQ8mD49XB67izDoq/x
 oWaBQxtRTaZ+tsizkwhOndMdzMAGX6+830heOI2KkEk2xzgh3jVm5qC00myeXTJAYtTQ
 4XbiGxT9jSagWPTufJXun/ubRhOQ597L0BbJgPNZIc64ZRTP4dqU0/loRzSGgcdQVNyy
 3mYw==
X-Gm-Message-State: AOAM530npEseVfm9zL6FFmj9v52zUhGCwmeHXwPew2DpnAsfBeefFnw4
 7Q7sOGrylJ+Su7KRfFA4AYPkxA==
X-Google-Smtp-Source: ABdhPJxsHi1raqW/V7FngDJYRi1V0nmO8xma5dZCbrdF3++IHPJkHwQFxBUuzYrmxOwnKa8+yjOhRQ==
X-Received: by 2002:a62:dd94:0:b029:19e:92ec:722a with SMTP id
 w142-20020a62dd940000b029019e92ec722amr4131817pff.50.1610444671048; 
 Tue, 12 Jan 2021 01:44:31 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 66/72] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Tue, 12 Jan 2021 17:39:40 +0800
Message-Id: <20210112093950.17530-67-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:38 -0000

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


