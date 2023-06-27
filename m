Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA1EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:48:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECld-0001LV-4w; Tue, 27 Jun 2023 13:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClb-0001L7-KC
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:15 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClZ-0004r2-Ff
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-66c729f5618so3295254b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687887972; x=1690479972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1oe993sHDscc+RkuSZFFvxcP0Omzd/xt0ncTYzs7R4=;
 b=T/a3GwbPkuw98ItgH0G1KbwuCwhmxGyiCb96lpIvuhCHomazyWyAZJQhJfFC6HswuT
 rCSnfzaKTEtcumDrOrUTnv3zuoR+FqGC4+mxeTZYgMH/RsQE+CPXw+6/6ouAc8bXE/0B
 zYizEspcHY/TCoVq+IfQge/rKkaUKYvxIv+5PfKLBKNbvpjomuJRjSndzi7kLoJqHl70
 HxwGk+5Y8VoArW3pvFBWYoW6UZkHUKqDejUpU9Fkj1uVI5XZxBkPyPRXN3EWIscAfAcj
 q+e/R23P5s6ZGJUsWJNbIqX7zmhghcJ75Dyh4ZfUiCBJdgIOkEQTWoypN89FN5ooSv0t
 5jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687887972; x=1690479972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1oe993sHDscc+RkuSZFFvxcP0Omzd/xt0ncTYzs7R4=;
 b=AlvbNbp16s8hLAntf7R9M1+azuz2iH/bNgUgk5FKE0VmJz2ZhSlZ5Q2ERT7KbjJkid
 HZ8L4KplgXpq4ZgOTl7B8f0/d4g7mlosvqBmzDXaSCuRpLCX3VrgENGRpbJLiwrFhbyJ
 kLl0fnoWSvYs4QZJUq65qkHZdgxHwOYCKSn2YA2EEhT2XWvnj6pUn4n0ZhMS1cHvx+c6
 X0jOdIzqvLSDJgb6upeund/EHp92Gr+qf787gru4QvCieAK4LKqIQMnpqr0B4gO7/sBy
 32ZF5NehXGlBhA27bqsxlUaZjWC+gfR9sIHyvVcQHYwA2YqC/JQA8iFMi38L9dkFRnDh
 dl7A==
X-Gm-Message-State: AC+VfDz0TPJMYUw1vlsR2OcM60pd05CGXMxkT31AS8Jt2zFiXT+LU4b1
 uj3gMOGs/fUkYzAdtrPcAtJvOw==
X-Google-Smtp-Source: ACHHUZ7hOyxXxnjSxIHi9yTf0WTvRDWdQolw0T7OsFKz9CUIGCi3x5Hjkl8NxKyDv7LIedNpiPayzw==
X-Received: by 2002:a05:6a00:24c4:b0:66a:5466:25bc with SMTP id
 d4-20020a056a0024c400b0066a546625bcmr20514132pfv.30.1687887972074; 
 Tue, 27 Jun 2023 10:46:12 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:46:11 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 03/15] target/riscv: Remove redundant "cpu_vl == 0" checks
Date: Wed, 28 Jun 2023 01:45:37 +0800
Message-Id: <20230627174551.65498-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42c.google.com
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

Remove the redundant "vl == 0" check which is already included within the  vstart >= vl check, when vl == 0.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 31 +------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4a8e62a8be..7e194aae34 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -617,7 +617,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     TCGv_i32 desc;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -786,7 +785,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     TCGv_i32 desc;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -893,7 +891,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     TCGv_i32 desc;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -1034,7 +1031,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     TCGv_i32 desc;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -1191,7 +1187,6 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         return false;
     }
 
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
@@ -1241,7 +1236,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     uint32_t data = 0;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -1405,7 +1399,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     uint32_t data = 0;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -1492,7 +1485,6 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
     if (checkfn(s, a)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -1575,7 +1567,6 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
     if (opiwv_widen_check(s, a)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -1648,7 +1639,6 @@ static bool opivv_trans(uint32_t vd, uint32_t vs1, uint32_t vs2, uint32_t vm,
 {
     uint32_t data = 0;
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -1842,7 +1832,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2054,7 +2043,6 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
             };
             TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
             tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
@@ -2078,7 +2066,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
         vext_check_ss(s, a->rd, 0, 1)) {
         TCGv s1;
         TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         s1 = get_gpr(s, a->rs1, EXT_SIGN);
@@ -2140,7 +2127,6 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
             };
             TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
             tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
             s1 = tcg_constant_i64(simm);
@@ -2288,7 +2274,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2323,7 +2308,6 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     dest = tcg_temp_new_ptr();
@@ -2408,7 +2392,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2483,7 +2466,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2601,7 +2583,6 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         gen_set_rm_chkfrm(s, rm);
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -2713,7 +2694,6 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
                 gen_helper_vmv_v_x_d,
             };
             TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
             tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
             t1 = tcg_temp_new_i64();
@@ -2792,7 +2772,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm_chkfrm(s, FRM);                                 \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2844,7 +2823,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2912,7 +2890,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm_chkfrm(s, FRM);                                 \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2962,7 +2939,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
         gen_set_rm_chkfrm(s, FRM);                                 \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -3053,7 +3029,6 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -3224,7 +3199,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         require_vm(a->vm, a->rd)) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -3411,7 +3385,6 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         TCGv s1;
         TCGLabel *over = gen_new_label();
 
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         t1 = tcg_temp_new_i64();
@@ -3468,8 +3441,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
         TCGv_i64 t1;
         TCGLabel *over = gen_new_label();
 
-        /* if vl == 0 or vstart >= vl, skip vector register write back */
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        /* if vstart >= vl, skip vector register write back */
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
         /* NaN-box f[rs1] */
@@ -3720,7 +3692,6 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
     uint32_t data = 0;
     gen_helper_gvec_3_ptr *fn;
     TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
     static gen_helper_gvec_3_ptr * const fns[6][4] = {
-- 
2.31.1


