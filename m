Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A39EB64D9
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 15:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFzPw-0002Xf-Mz; Sun, 02 Jul 2023 11:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzPi-0002U9-8X
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzPc-0008M8-Tv
 for qemu-riscv@nongnu.org; Sun, 02 Jul 2023 11:55:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-666eef03ebdso1779834b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Jul 2023 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688313289; x=1690905289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2Ovee+6qNzPOr0iR3dEIiS21VnlZ9hT+MEjpqH5QMg=;
 b=X3zpVaj1LxzhS1EUMbiYZaWFECsl63qAGDKU/BaYXzHIaaa/16+7ocuVvokB0mvIi4
 piW885I2Sgt6j3eOx/oq2MJErwxkxIb/KCLkrW3VqOMw4/pF/2geNrQVF5/CVjrNl67K
 bzDtgGn+UXAf9t2Jb8wgN9BgcOOZL/UlH6otlkGZvf6d9UFFy05FGxknnlq1gv2fqJyy
 tW985iS0+LnOYbM7JlaWgb0y6n4ux1BZNHNHj0UdjNHgFHl9w5YyBbWk8t7rG7YM/cVV
 6fi7ZYtgDy5cIhYunkikpt1GnB8WzlaaQu9OaaP+iIWSYH9JgWIc48YD3Hma1m9O6yBo
 9/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688313289; x=1690905289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2Ovee+6qNzPOr0iR3dEIiS21VnlZ9hT+MEjpqH5QMg=;
 b=FlKAZre+mSQWF04RrM2aEImNcYtRq/4IsULSdJS7Tg7eFvuyDUYoUucXy3dyf2AR0m
 jzMMZ56wPE+eDyu/Df2M/BD8OPZhqLMfGO/4CRg1BwebX/ppHz8WXsq9GOsUW0SKIrKO
 edAsIiHP+/sR1pL0VhdtyImw6CayVBSsQ8jrhUTHVwBFF/Olai28s4iQMqLYHcadBLiC
 y98VMX3XLaf8st0WAveYMtQ2DSw0RWwnIahr5ocM5gxSlWIdlVI6+DHwVjj2rtFU+9Sg
 KeKS8gx+06sVXJOCu4AmQe7VuCS15GUCgFBOwmPCRQ82A9eXxFscwdPRHjk3bG/tSAFq
 USiA==
X-Gm-Message-State: ABy/qLY/T1BRrLlMheUFPMGKd5yxhYW43dGVB93N3SXRHf07mHtRiLuB
 WlFXDt00KwPraPo0yLeYhd3JdQ==
X-Google-Smtp-Source: APBJJlFbOlvzbGl9KML6qpg+abd4FbEePh1Gqfj7VkOHD6X3PpvyT3swyzX/oqLGifAiz2eHOflF3A==
X-Received: by 2002:a05:6a00:1501:b0:668:9bf9:fa70 with SMTP id
 q1-20020a056a00150100b006689bf9fa70mr7655739pfu.34.1688313289319; 
 Sun, 02 Jul 2023 08:54:49 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 y19-20020aa78553000000b0066f37665a63sm8231969pfn.73.2023.07.02.08.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 08:54:49 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 05/15] target/riscv: Move vector translation checks
Date: Sun,  2 Jul 2023 23:53:39 +0800
Message-Id: <20230702155354.2478495-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702155354.2478495-1-max.chou@sifive.com>
References: <20230702155354.2478495-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Move the checks out of `do_opiv{v,x,i}_gvec{,_shift}` functions
and into the corresponding macros. This enables the functions to be
reused in proceeding commits without check duplication.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 28 +++++++++++--------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7e194aae34..5dfd524c7d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1183,9 +1183,6 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
               gen_helper_gvec_4_ptr *fn)
 {
     TCGLabel *over = gen_new_label();
-    if (!opivv_check(s, a)) {
-        return false;
-    }
 
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
@@ -1218,6 +1215,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
         gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
     };                                                             \
+    if (!opivv_check(s, a)) {                                      \
+        return false;                                              \
+    }                                                              \
     return do_opivv_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
 }
 
@@ -1276,10 +1276,6 @@ static inline bool
 do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
               gen_helper_opivx *fn)
 {
-    if (!opivx_check(s, a)) {
-        return false;
-    }
-
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         TCGv_i64 src1 = tcg_temp_new_i64();
 
@@ -1301,6 +1297,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
         gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
     };                                                             \
+    if (!opivx_check(s, a)) {                                      \
+        return false;                                              \
+    }                                                              \
     return do_opivx_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
 }
 
@@ -1432,10 +1431,6 @@ static inline bool
 do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
               gen_helper_opivx *fn, imm_mode_t imm_mode)
 {
-    if (!opivx_check(s, a)) {
-        return false;
-    }
-
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
@@ -1453,6 +1448,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_helper_##OPIVX##_b, gen_helper_##OPIVX##_h,            \
         gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
     };                                                             \
+    if (!opivx_check(s, a)) {                                      \
+        return false;                                              \
+    }                                                              \
     return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
                          fns[s->sew], IMM_MODE);                   \
 }
@@ -1775,10 +1773,6 @@ static inline bool
 do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
                     gen_helper_opivx *fn)
 {
-    if (!opivx_check(s, a)) {
-        return false;
-    }
-
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         TCGv_i32 src1 = tcg_temp_new_i32();
 
@@ -1800,7 +1794,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
         gen_helper_##NAME##_b, gen_helper_##NAME##_h,                     \
         gen_helper_##NAME##_w, gen_helper_##NAME##_d,                     \
     };                                                                    \
-                                                                          \
+    if (!opivx_check(s, a)) {                                             \
+        return false;                                                     \
+    }                                                                     \
     return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);    \
 }
 
-- 
2.34.1


