Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6583BC47258
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:27:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVP2-0000ZZ-4e; Mon, 15 Jan 2024 17:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVP0-0000Z5-LT
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:54 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVOy-00064H-7z
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:54 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ddf26eba3cso3644424a34.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357551; x=1705962351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oG+n+hpiuw9eVHt2qVKYZPz8/VozWa7gXIVGPPyLFog=;
 b=L3tresyQM2bqqokNJIyKQa5CUhhCMcgcDs7J9MuXT7TzWGXyapIjvPSWLJDGegZE9d
 PXmv/ZKSqQUcBUY4vN4NURrY5ffCCGrR1uEwcCVwkJeUHoGvCi796A4w7UJg3SD9vlhe
 WXius2euqsMHdnN+huDRJpswU0VMUxb6HLFXFy/YEMVaOv/n1w5za6WFTr2ncSJSXFWS
 8VjV95NpS378TwmfMF0st4/weSel22hMUZR52eJfhXYACbazt0buprzZuFrAqixKoT/I
 cLwIknRjqEPGyw+H6Ot0AJaabyz9XQ28BsJ4DJ89e0jySfoDBxpLsSMKOjhzguV22A8c
 79+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357551; x=1705962351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oG+n+hpiuw9eVHt2qVKYZPz8/VozWa7gXIVGPPyLFog=;
 b=Fg/NsblURB2kbsHnwEEVb6sTkLzIE3ixXH0Aeuj3dTACixfGk7Pe7OsHNdgzFios4j
 PHTDd6lMA7j3FL7isnu3q0zJEcARkAYfxs/E0N69sKpI8Y7POYPDOC5GlZTrPxyMD5hA
 tCx1Yk0ZuNIKr2PQTNQFgTzDkkj7qy7wBBohbWEYvzBe7Uuy3Tx4Le4zSmi1EVkUtIXF
 TsCjRzV8zF5n04WnI+a/74Bylx4e36EZW0/xsDxaxQ2WOJvQs6O4YTc3b+6lNahGgtzZ
 NffKS34rVIz0Zm1H/41ymN3Tde6ykTcSjycIOMonfogLlMuWQvxmAwmBGqhEdn3smSZb
 RmBg==
X-Gm-Message-State: AOJu0YyDW/hnR40PwElDw2ZlHJ47lIZ5+6lIMV99TrTRpPvXQ6b8uplE
 0gcY0C1Hhr6Vcz5XQjQ8Pw1jYBn4SGGLrA==
X-Google-Smtp-Source: AGHT+IE0bzu1DBOvD1TK4ECy3dbDU7GylbVVtrmG/2pHaMnwk/pycT24Jxbf2BNRFolju1lI+iTZ4A==
X-Received: by 2002:a9d:4d15:0:b0:6de:6e8a:cfa8 with SMTP id
 n21-20020a9d4d15000000b006de6e8acfa8mr6377964otf.2.1705357551086; 
 Mon, 15 Jan 2024 14:25:51 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:25:50 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 05/12] target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb'
Date: Mon, 15 Jan 2024 19:25:21 -0300
Message-ID: <20240115222528.257342-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

Use s->cfg_ptr->vlenb instead of "s->cfg_ptr->vlen / 8"  and
"s->cfg_ptr->vlen >> 3".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 140 ++++++++++++------------
 1 file changed, 70 insertions(+), 70 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3871f0ea73..d743675262 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -217,7 +217,7 @@ static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlen / 8;
+    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlenb;
 }
 
 /* check functions */
@@ -627,11 +627,11 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * As simd_desc supports at most 2048 bytes, and in this implementation,
      * the max vector group length is 4096 bytes. So split it into two parts.
      *
-     * The first part is vlen in bytes, encoded in maxsz of simd_desc.
+     * The first part is vlen in bytes (vlenb), encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
@@ -791,8 +791,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
     stride = get_gpr(s, rs2, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
@@ -897,8 +897,8 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, tcg_env, vreg_ofs(s, vs2));
@@ -1036,8 +1036,8 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
@@ -1086,7 +1086,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
                              uint32_t width, gen_helper_ldst_whole *fn,
                              DisasContext *s, bool is_store)
 {
-    uint32_t evl = (s->cfg_ptr->vlen / 8) * nf / width;
+    uint32_t evl = s->cfg_ptr->vlenb * nf / width;
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
 
@@ -1096,8 +1096,8 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
 
     uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
     dest = tcg_temp_new_ptr();
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     base = get_gpr(s, rs1, EXT_NONE);
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
@@ -1199,8 +1199,8 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           tcg_env, s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8, data, fn);
+                           tcg_env, s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb, data, fn);
     }
     mark_vs_dirty(s);
     gen_set_label(over);
@@ -1248,8 +1248,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
@@ -1410,8 +1410,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
@@ -1492,8 +1492,8 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           tcg_env, s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8,
+                           tcg_env, s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb,
                            data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -1568,8 +1568,8 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           tcg_env, s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8, data, fn);
+                           tcg_env, s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -1639,8 +1639,8 @@ static bool opivv_trans(uint32_t vd, uint32_t vs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
     tcg_gen_gvec_4_ptr(vreg_ofs(s, vd), vreg_ofs(s, 0), vreg_ofs(s, vs1),
-                       vreg_ofs(s, vs2), tcg_env, s->cfg_ptr->vlen / 8,
-                       s->cfg_ptr->vlen / 8, data, fn);
+                       vreg_ofs(s, vs2), tcg_env, s->cfg_ptr->vlenb,
+                       s->cfg_ptr->vlenb, data, fn);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
@@ -1831,8 +1831,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2036,8 +2036,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
             tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               tcg_env, s->cfg_ptr->vlen / 8,
-                               s->cfg_ptr->vlen / 8, data,
+                               tcg_env, s->cfg_ptr->vlenb,
+                               s->cfg_ptr->vlenb, data,
                                fns[s->sew]);
             gen_set_label(over);
         }
@@ -2082,8 +2082,8 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             };
 
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                              s->cfg_ptr->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                              s->cfg_ptr->vlenb, data));
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, tcg_env, desc);
         }
@@ -2121,8 +2121,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 
             s1 = tcg_constant_i64(simm);
             dest = tcg_temp_new_ptr();
-            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                              s->cfg_ptr->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                              s->cfg_ptr->vlenb, data));
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, tcg_env, desc);
 
@@ -2275,8 +2275,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2303,8 +2303,8 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                      s->cfg_ptr->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                      s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
@@ -2391,8 +2391,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), tcg_env,         \
-                           s->cfg_ptr->vlen / 8,                 \
-                           s->cfg_ptr->vlen / 8, data,           \
+                           s->cfg_ptr->vlenb,                    \
+                           s->cfg_ptr->vlenb, data,              \
                            fns[s->sew - 1]);                     \
         mark_vs_dirty(s);                                        \
         gen_set_label(over);                                     \
@@ -2465,8 +2465,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2581,8 +2581,8 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), tcg_env,
-                           s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8, data, fn);
+                           s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -2691,8 +2691,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
 
             dest = tcg_temp_new_ptr();
-            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                              s->cfg_ptr->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                              s->cfg_ptr->vlenb, data));
             tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
 
             fns[s->sew - 1](dest, t1, tcg_env, desc);
@@ -2770,8 +2770,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2821,8 +2821,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2888,8 +2888,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2937,8 +2937,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data,             \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data,                \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -3027,8 +3027,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), tcg_env,           \
-                           s->cfg_ptr->vlen / 8,                   \
-                           s->cfg_ptr->vlen / 8, data, fn);        \
+                           s->cfg_ptr->vlenb,                      \
+                           s->cfg_ptr->vlenb, data, fn);           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
@@ -3061,8 +3061,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = dest_gpr(s, a->rd);
-        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                          s->cfg_ptr->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                          s->cfg_ptr->vlenb, data));
 
         tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
@@ -3090,8 +3090,8 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = dest_gpr(s, a->rd);
-        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
-                                          s->cfg_ptr->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                                          s->cfg_ptr->vlenb, data));
 
         tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
@@ -3128,8 +3128,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           tcg_env, s->cfg_ptr->vlen / 8,          \
-                           s->cfg_ptr->vlen / 8,                   \
+                           tcg_env, s->cfg_ptr->vlenb,             \
+                           s->cfg_ptr->vlenb,                      \
                            data, fn);                              \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -3171,8 +3171,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         };
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), tcg_env,
-                           s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8, data, fns[s->sew]);
+                           s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb, data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -3200,8 +3200,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
             gen_helper_vid_v_w, gen_helper_vid_v_d,
         };
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           tcg_env, s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8,
+                           tcg_env, s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb,
                            data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3620,8 +3620,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           tcg_env, s->cfg_ptr->vlen / 8,
-                           s->cfg_ptr->vlen / 8, data,
+                           tcg_env, s->cfg_ptr->vlenb,
+                           s->cfg_ptr->vlenb, data,
                            fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3641,7 +3641,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         vext_check_isa_ill(s) &&                                        \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
-        uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
+        uint32_t maxsz = s->cfg_ptr->vlenb * LEN;                       \
         if (s->vstart_eq_zero) {                                        \
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),                \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
@@ -3723,8 +3723,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
 
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), tcg_env,
-                       s->cfg_ptr->vlen / 8,
-                       s->cfg_ptr->vlen / 8, data, fn);
+                       s->cfg_ptr->vlenb,
+                       s->cfg_ptr->vlenb, data, fn);
 
     mark_vs_dirty(s);
     gen_set_label(over);
-- 
2.43.0


