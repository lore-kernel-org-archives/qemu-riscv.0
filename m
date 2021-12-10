Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapg-0000c8-Mh
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapT-0000PV-RN
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:31 -0500
Received: from [2607:f8b0:4864:20::102e] (port=42968
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapR-0007FT-U7
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:31 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so6872184pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m4wlHv+9FNi9jYyqSuQ6nuu1+ORes9uNQNpK0icG0MY=;
 b=lzlXMal2oo0cglU0kenVtQITZk0hGFPpe+lr/HrMkwuprBiefriMz/WM5l7GfoQw1o
 DjwzD89imRE9Det/e5Yhm2T60t9UJwIhm9FBHSHyoDrUCxWnRMVvvOQRgZpd/VEVTl8E
 48MoO9La859XeV2EqR1X4lPjZqL01eaMYbd8o1G6z0xAJuE+70XB0wsD/xz35hCJ/+Gh
 IXFzmp2TJrd0FlP7s4giePpwzjo88+89ELdhcS960CYK0qaTEkAtGtMH8Q2ZAm5uiAuX
 njIWj1iMdXcNg8ZiHsqJPPCs+NpnTZxONfOs5wFbpan2pquHW/TZ72l8N//fefj0TTIh
 q5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m4wlHv+9FNi9jYyqSuQ6nuu1+ORes9uNQNpK0icG0MY=;
 b=UjL9SyO+27lQeQ4cfKU5E6CTttTsVgE65Y03wiiKoGT5iL+/3a/PXWkY84QYnszNNU
 0Bc1hjGgZd6E4SbiRyfbe3y3xFGeP7UdjHm1aQcRbaqN+5WDApgYr2ygVL8N80ggaN7y
 xwCh4Ucxu5ACq/wsVDG+Msucz81grpVB7qMho4fFpM46n4Y8nUXSl7EMdZWYMs6w8ZpL
 k4ruUhANLI6ifJQnYZ+I2TmtIEzW2eMVWD+RlMJDCZNOtUyv+gKcpa9iTbHbvGR14uMk
 GSOv1c91mU8yD/KCLUVZFzsDpKIoNQblI8GTQyMdcdA/rKDfykqfiFdiUgDcfMIu1cje
 Xacg==
X-Gm-Message-State: AOAM530Kz9ahGNt6EhMRnrPRlYqhB2rhhLdkDJD47Yt6KksVgOY/JPrx
 JDv5LpUOP530IkTi6plnVgt6MQ==
X-Google-Smtp-Source: ABdhPJys3yLCVVDK2lRfyxBm5BcEgn8/phxg1LDQ57Dw9Dql6a8dzNtlrCHHD+lo8P7uchxaf4GNpA==
X-Received: by 2002:a17:902:7005:b0:142:4452:25de with SMTP id
 y5-20020a170902700500b00142445225demr74216157plk.3.1639123228640; 
 Fri, 10 Dec 2021 00:00:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 67/77] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Fri, 10 Dec 2021 15:56:53 +0800
Message-Id: <20211210075704.23951-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:32 -0000

From: Frank Chang <frank.chang@sifive.com>

If the frm field contains an invalid rounding mode (101-111),
attempting to execute any vector floating-point instruction, even
those that do not depend on the rounding mode, will raise an illegal
instruction exception.

Call gen_set_rm() with DYN rounding mode to check and trigger illegal
instruction exception if frm field contains invalid value at run-time
for vector floating-point instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7589c8ce32..53c8573f11 100644
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
2.31.1


