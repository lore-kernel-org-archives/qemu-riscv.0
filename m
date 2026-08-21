Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5560AC5DF8F
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:06:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGV5-0006Uq-1o; Fri, 21 Aug 2026 00:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUb-00068Z-54
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:35 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUX-0003Fz-EO
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cc147d86bebso417356a12.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285067; x=1787889867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2WObrjAhqD3Znpz9vQQq9dMaoW/8w0bJAnFWTLVI39A=;
 b=ygT+0jZrK8QgD6MxF6OSEt1I5+UxzbqDqptoGQa+7WcBPVNAesgsHo11JZ0PPeEm9V
 QMRgdDZWEctYHYA88ejFFwm5Gm8caIAO//Z8owxVY4G6mbYTyHBHBW/aYaBB8n+VMzJS
 MAvYMffpXWC1tmvlowS8PZXrZN6t9N47Y3S6Ie++XCJqd7hidq7yWLYsfj9BpB+UwOVB
 rkzwmAvK9QQ0rMh8nVjkkPaErJ9eGJmevSrE9br5RMqnkaq6pS4BJ0VqhnNkECA6rVEz
 g534dIKmd1QbKFrhJf3/hACMkoWDWnbMl+bSh+LMv5nI8g10EAN8yhb+bvf/x/VXwbmt
 k3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285067; x=1787889867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2WObrjAhqD3Znpz9vQQq9dMaoW/8w0bJAnFWTLVI39A=;
 b=E189lxY4i9VCP80e8x6/8SdHjepTrCn0ujt8VAkLi80F7JTvrbO0zOa+/sPxC4WmIn
 V+5+Lt6PcFmPac7ldegfzNYFaKOtjm7LTf8ay5Q37cIB0tkMuzv2euGR1CIGXlcXM8sH
 0HFlkZH1Uj9973VJSigs6IWKU10RYL1dH/pvgMdtSOm+8Jg3G929oVv/+yUy7k0bsWoE
 7ZMtojAZtwUMj0tnKxI8NTNxXm1ExiUIyZHoR88hC2ys+RcD2tSBbTqEo234mn+F5cHv
 6pULbL+7kGmhY3q6kk0mLA99ZXgHREjnNpIakvaY7g2+5WvXTca3gmzcGMvNeXYsOwb9
 MG1w==
X-Gm-Message-State: AFuF++kZqXtG/g4BX3JbR9wei+8Z9SacEcxBEg0wqxCfcNyNOtpl5BYl
 yYmyuk8dGEUKShrUFA7A3RlDMT2G5AYmGrMXNRej7ze/WIDuRPm3QQiBDKcYSbVPu1hr1NKAqzt
 Rt2ii
X-Gm-Gg: AR+sD12/2/syvKw/+gJRj3syBxELfdExQuZ97/3BCtMaJj1jXwtbDAL1lMxzgwLaRfp
 ERRzZR2xO90qxRVohggmYvHUVQf5xdOhnvIn1SFAJ16u2Oa9su1uIMk2p1nAshh4bpXAuBBKxzo
 OVM29mamMWQbtiWHf8+WR9K35s9Z4OwNIvVo4d6EZRqkvwWzuHp5hKVVHaXW9jqB/BGRVS4QbRs
 cfYAHIYdhesz5zfx2HmXV5hySxSAIZsBPr/uch7kHS2qjS0wUhrKcrjeS0iA9zdKDp07wQp3X2i
 pI0twgGCwPsFMq6+vIkMG6EIWAYOK7H6vKeYgaiSdykqgmoSycYjIhQm3hLZ5stjMGsuObgWnpF
 NHZAjoWIeqy+tySG+dN7+W9IBYm/gNBpA08EbnII5hRql7TpIDIwzm8m4yxbGdk2SYT5dE7SPsK
 uWLer0w5oRp5YNyg/SLQpeo/61oSVuhEtvDmcbXGsgzBLiQkpimzqF/YcV7GjZcTz4gc8=
X-Received: by 2002:a17:90b:39a3:b0:384:927f:3db9 with SMTP id
 98e67ed59e1d1-395c4bdddaemr2389261a91.1.1787285066884; 
 Thu, 20 Aug 2026 21:04:26 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 20/23] target/riscv: Drop v0 argument from
 gen_helper_ldst_stride
Date: Thu, 20 Aug 2026 21:04:01 -0700
Message-ID: <20260821040404.268123-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since we're also passing env, v0 is always env->vreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                       | 16 ++++++++--------
 target/riscv/tcg/vector_helper.c            |  4 ++--
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 16 +++++-----------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8a42a6ce03..3ef352898b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -179,14 +179,14 @@ DEF_HELPER_4(vse32_v_mask, void, ptr, tl, env, i32)
 DEF_HELPER_4(vse64_v_mask, void, ptr, tl, env, i32)
 DEF_HELPER_4(vlm_v, void, ptr, tl, env, i32)
 DEF_HELPER_4(vsm_v, void, ptr, tl, env, i32)
-DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse64_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vlse8_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vlse16_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vlse32_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vlse64_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vsse8_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vsse16_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vsse32_v, void, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vsse64_v, void, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 66a5f68de8..15c1281538 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -305,7 +305,7 @@ vext_ldst_stride(void *vd, target_ulong base, target_ulong stride,
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
-QEMU_FLATTEN void HELPER(NAME)(void *vd, void * v0, target_ulong base,  \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base,             \
                                target_ulong stride, CPURISCVState *env, \
                                uint32_t desc)                           \
 {                                                                       \
@@ -320,7 +320,7 @@ GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w_tlb)
 GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d_tlb)
 
 #define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       \
-QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base,             \
                                target_ulong stride, CPURISCVState *env, \
                                uint32_t desc)                           \
 {                                                                       \
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 3d32564660..5e352dbf41 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -878,32 +878,26 @@ GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
 /*
  *** stride load and store
  */
-typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
-                                    TCGv, TCGv_env, TCGv_i32);
+typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv, TCGv, TCGv_env, TCGv_i32);
 
 static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
                               uint32_t data, gen_helper_ldst_stride *fn,
                               DisasContext *s)
 {
-    TCGv_ptr dest, mask;
-    TCGv base, stride;
+    TCGv_ptr dest = tcg_temp_new_ptr();
+    TCGv base = get_gpr(s, rs1, EXT_NONE);
+    TCGv stride = get_gpr(s, rs2, EXT_NONE);
     TCGv_i32 desc;
 
-    dest = tcg_temp_new_ptr();
-    mask = tcg_temp_new_ptr();
-    base = get_gpr(s, rs1, EXT_NONE);
-    stride = get_gpr(s, rs2, EXT_NONE);
-
     data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
-    tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
     mark_vs_dirty(s);
 
-    fn(dest, mask, base, stride, tcg_env, desc);
+    fn(dest, base, stride, tcg_env, desc);
 
     finalize_rvv_inst(s);
     return true;
-- 
2.43.0


