Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z8-0007xM-1b
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z6-0007u1-Ty
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:48 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z5-0007lv-38
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a2so1995129plm.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832906;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdFCJsN+s5zjRcT/dEPni1wa/6tfViaP6/n8KeEaxj8=;
 b=5C922TWYXQHorRO+YWNw8nwr3Rt5nZD8a1iJV1VetrbWr52kRsCnu5tlp59pTu+IG7
 uw7fcHPPqOJMzHh2Vnbp2sHsDAXwdfxDDQXLBQcLGtjAkONIkpe/mFcpp2yg0UGlcK9s
 u6/0Twhv4P+TyVdlSKwYUpQx+vas7PvuDdVxvWSVKRadsMQHYYakCzFwLdQfm1ETjhyo
 k0v94BmpfSqFiUe3u0ndV/7CwFF68nsiipDwO5010vaXpkWMIj3NTJtqO6Ff2H6k+QGu
 XAkXngahzS7rAO7nB2E9BxeKxdQFJWn/N+06Rzs2lrqDIC9EOw/OH5LsZyZpz5d1+1zA
 Bn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832906;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdFCJsN+s5zjRcT/dEPni1wa/6tfViaP6/n8KeEaxj8=;
 b=s1pfUQfhrHCaDOHMpnfu8tCZi9c0woAfo2peBLMrnA4N2KNqA+r3iDtXDQWeud9a2e
 JWkKUOFpXHSyn9cG4HW9pDqpmltklrVGC1gnk/WX80Vex5eyeXsdUPthn3yCwQLS05dY
 NwHLoq1aAKYTVf4yNKpvhUS0Eea5louzYoCJkFqw+Z+468UIPCA9U41wOhXDLjRVSj5m
 6x1PbbLyFyVZwH7EjF6tiIiQVoxR5mrU1o9nXPjo4yy12oOwL5rXrI2mtDuPuDUbVaXc
 fF2pvbcCM0npxG3s2nyBGJCR9vfFx6rCJfA8jZHWIBUfIofH9Vhq5g00Mjp6tZKHDtyG
 5h1Q==
X-Gm-Message-State: AO0yUKWr1f6bqAsnk4UpHWd9CJTkMg1nt413GLRlJitgGQZ00EcKfvyh
 Vxoc0ZzISVYzMSPPM9AXZgavpIHhmfwyuMoX
X-Google-Smtp-Source: AK7set9X1qlfIfAJQdX0eYTur1VEDqACYgF3u74r8EfCGJ4xFW/PH0Sg7MPz/hoQRnjXVgNLO+uxOw==
X-Received: by 2002:a17:902:e546:b0:19a:7a02:7954 with SMTP id
 n6-20020a170902e54600b0019a7a027954mr1548724plf.24.1677832905988; 
 Fri, 03 Mar 2023 00:41:45 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 lc14-20020a170902fa8e00b0019aca830869sm967906plb.238.2023.03.03.00.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:45 -0800 (PST)
Subject: [PULL 20/59] target/riscv: Remove redundunt check for zve32f and
 zve64f
Date: Fri,  3 Mar 2023 00:37:01 -0800
Message-Id: <20230303083740.12817-21-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:49 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Require_zve32/64f have been overlapped by require_rvf/require_scale_rvf.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-11-liweiwei@iscas.ac.cn>
[Palmer: commit text]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 128 ++++--------------------
 1 file changed, 21 insertions(+), 107 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9b2711b94b..9053759546 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,50 +66,6 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
-static bool require_zve32f(DisasContext *s)
-{
-    /* RVV + Zve32f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
-}
-
-static bool require_scale_zve32f(DisasContext *s)
-{
-    /* RVV + Zve32f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
-}
-
-static bool require_zve64f(DisasContext *s)
-{
-    /* RVV + Zve64f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
-}
-
-static bool require_scale_zve64f(DisasContext *s)
-{
-    /* RVV + Zve64f = RVV. */
-    if (has_ext(s, RVV)) {
-        return true;
-    }
-
-    /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
-}
-
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2331,9 +2287,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV without GVEC IR */
@@ -2421,9 +2375,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF without GVEC IR */
@@ -2461,9 +2413,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* OPFVV with WIDEN */
@@ -2506,9 +2456,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 /* OPFVF with WIDEN */
@@ -2540,9 +2488,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2585,9 +2531,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2664,9 +2608,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
-           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
 static bool do_opfv(DisasContext *s, arg_rmr *a,
@@ -2731,9 +2673,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2746,9 +2686,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           vext_check_ms(s, a->rd, a->rs2);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2769,9 +2707,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
-        require_align(a->rd, s->lmul) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        require_align(a->rd, s->lmul)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         TCGv_i64 t1;
@@ -2856,18 +2792,14 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           (s->sew != MO_8);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2918,9 +2850,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
@@ -2975,18 +2905,14 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew != MO_64) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           (s->sew != MO_64);
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           (s->sew != MO_8);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -3035,9 +2961,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
-           require_scale_zve32f(s) &&
-           require_scale_zve64f(s);
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
@@ -3111,9 +3035,7 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
@@ -3540,9 +3462,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        vext_check_isa_ill(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         unsigned int ofs = (8 << s->sew);
@@ -3568,9 +3488,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
 {
     if (require_rvv(s) &&
         require_rvf(s) &&
-        vext_check_isa_ill(s) &&
-        require_zve32f(s) &&
-        require_zve64f(s)) {
+        vext_check_isa_ill(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
         /* The instructions ignore LMUL and vector register group. */
@@ -3621,17 +3539,13 @@ GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
-           require_rvf(s) &&
-           require_zve32f(s) &&
-           require_zve64f(s);
+           require_rvf(s);
 }
 
 GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
-- 
2.39.2


