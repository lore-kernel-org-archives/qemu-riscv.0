Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZc-0000Xm-2S
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZH-0000FZ-H6
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:00 -0500
Received: from [2607:f8b0:4864:20::534] (port=38871
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZF-0007TS-L3
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:51 -0500
Received: by mail-pg1-x534.google.com with SMTP id q75so4738874pgq.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmGLBeYJtQdrHYl1yWO9CEisyBhnQs1aM9ox720afbw=;
 b=Db0D8xBNyn5nyHadlHXfCnTScmAgNBGACBSOl4jqllmjP/PSDJNw8StXNg784Q6zN/
 4nsgVhXgNWP4XMbrjdXQzOrH0zTqIfi3qZ4eTOrulx5F+F6sHGzs2aShmFcP/zhjZUpE
 b4oNt+XB52q0oRIiux22o1GGnkyOne1Y3WSE7qrPH8aoukTZ9z/GijrOt9FAGJ6Wni0Q
 5HVZk9d5YAIgBabM4+JF8YU5+msloA7CqQxp6BoWuEJb9RlHcJ9XZ7xqlNzRawpHX9Ce
 zGPRm7tY+2krKFw49UI/5hXS7pD6JV69bWYoTDVEUWdd39e2EzOoL6Iga8vNcCoY4f4p
 OC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmGLBeYJtQdrHYl1yWO9CEisyBhnQs1aM9ox720afbw=;
 b=DjGmAy7n4Y4lWIi4QZ0GMXQ6axiTL0J2Sj7cwlJG8IK5pTQB5mgk8szYYA8dQBSDEz
 BTggodfJ1+yWqYN3ksbeMGebBU2NbnESmueaPPm7LWScSpE0CDsu3gBsKpP/VolWoDqr
 WGv3H/lLpMc1WboSlvCZSXzmXSeMzRDRXvFac7HL3iPYzoonI5kx9KLZzKM1OAd3Gt4K
 yG6cUCbsiGaU/OosboAk5TVXt0dH1eAGxVdvUXA6CQczxT0Oc6GwmR6XUZEA//+B9F+w
 k4lpAgvNYLLEvQRiW359uD35BfhphP5ZX0UJ4ZNm+bjVneTXCLf+z8+Z/iR+hJkae88C
 xcOw==
X-Gm-Message-State: AOAM5339paFKG4ZMPH1Tm/bkgOyCJ9e33KtEENpGdq9Wk1/reElDYfg1
 UWIGUbAqrpCYUtFOVhsfHN02Wg==
X-Google-Smtp-Source: ABdhPJx4IinryJU+h21BUV+YgSLrPIfgWSbqvkBpaczpzO1QHkylEZ13Sw8BpYAYUburrm6bUBD6tQ==
X-Received: by 2002:a63:6c04:: with SMTP id h4mr21066744pgc.30.1642470347826; 
 Mon, 17 Jan 2022 17:45:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 06/17] target/riscv: rvv-1.0: Add Zve64f support for scalar
 fp insns
Date: Tue, 18 Jan 2022 09:45:09 +0800
Message-Id: <20220118014522.13613-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:46:01 -0000

From: Frank Chang <frank.chang@sifive.com>

Zve64f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 41 +++++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8e493b7933..56246a5d88 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
+static bool require_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_32 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2206,7 +2217,8 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 /* OPFVV without GVEC IR */
@@ -2286,7 +2298,8 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 /* OPFVF without GVEC IR */
@@ -2503,7 +2516,8 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
-           vext_check_ss(s, a->rd, a->rs2, a->vm);
+           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve64f(s);
 }
 
 static bool do_opfv(DisasContext *s, arg_rmr *a,
@@ -2568,7 +2582,8 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2581,7 +2596,8 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2602,7 +2618,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
-        require_align(a->rd, s->lmul)) {
+        require_align(a->rd, s->lmul) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         TCGv_i64 t1;
@@ -3328,7 +3345,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         unsigned int ofs = (8 << s->sew);
@@ -3354,7 +3372,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         /* The instructions ignore LMUL and vector register group. */
@@ -3405,13 +3424,15 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
-- 
2.31.1


