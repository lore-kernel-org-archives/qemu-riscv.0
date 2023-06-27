Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B335FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:49:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEClt-0001by-TZ; Tue, 27 Jun 2023 13:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECln-0001TF-9T
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClk-0004tv-UJ
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:27 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-666ecf9a081so4411654b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687887983; x=1690479983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YCNBWpu8sC/m0RCUWCmKe148MHe8RXhkW+2UVN+8xY=;
 b=OIY5fgad41Wh6ZW9ZnKHBAUNWodBYSNZCXQ+ucwQRCMEOAqQ41ND+mGfIpUZJ+nroI
 q0W0sghaJ3U6vautlhed6/ErC5zsRBmhZIXdqprIZlSWkrmG75ZuaHPYAxnOaxCD3Yo/
 Zz0s5Ck7LQWq/k3QHvBAuqurYDgqufElJOrzIOtXRLz9jT93YxSknG4ZaeiQALW1uTcA
 Ap3cfD5TUXWxU2LhBKCqIN2aC/fQdPxPoxHG2kN/pfhWgF0WXQ3I0IP62wxHo7WVQXhK
 ZnOB2GOQ77d1YQoTtv7Ed0VatcZHo3ByLuZ61PCmP43+mDUmI0majkkbGPWf0XIzjDlh
 sAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687887983; x=1690479983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YCNBWpu8sC/m0RCUWCmKe148MHe8RXhkW+2UVN+8xY=;
 b=UKGjVRDkZD1041JnWkqXipxBMmiMtcHsFOretH6I8XZFNiS750OCf86kHDRCAFKOW3
 m8xDC9L/QTgnP5xy3s+Kf0WUlzBD94OuEDVOtP/4B0fit1YV8KxdKm54lQ3SSzTLMu9P
 yNJWaNrBwDU/HcSfu+Dm14uFSjSnjfIuWwfKiPUghISaJ3DlShxmy7DSkyQOdFbT+XFb
 /+rCse18/Yf0DChN5e5dXPZUpbiirwaWRC6E3x+5cjt64145B0iHF7BKYl+K7O1zArUu
 bph/dN4hUE5wvd6SllTuG3HgudEMC3JAs2ACLMOoJrdAkEK7K8wFUcz35InVw/WT+lRk
 85xg==
X-Gm-Message-State: AC+VfDwKBbnwlf2iUphZ1hJ2xXMPwQBIyQ1DwIr0QPJ4VFJYMvdDRGUo
 +0aEC7FJg6gtOcSMpycJOMEoDA==
X-Google-Smtp-Source: ACHHUZ6DngEvn46AOcr6gReudyFK84/Kfla9rzHBLX63t9+xkjY5OWjafecsuxIpp4z9rh4ZmYtuHQ==
X-Received: by 2002:a05:6a00:1989:b0:668:8b43:8ded with SMTP id
 d9-20020a056a00198900b006688b438dedmr27767711pfl.26.1687887983508; 
 Tue, 27 Jun 2023 10:46:23 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:46:23 -0700 (PDT)
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
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH v6 05/15] target/riscv: Move vector translation checks
Date: Wed, 28 Jun 2023 01:45:39 +0800
Message-Id: <20230627174551.65498-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x431.google.com
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
2.31.1


