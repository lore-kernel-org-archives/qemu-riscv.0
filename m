Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A4C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVP5-0000aV-8E; Mon, 15 Jan 2024 17:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVP3-0000Zd-88
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:57 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVP1-00064t-KA
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:57 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d9b050e88cso4935555b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357554; x=1705962354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udL8itZxAYolT0n7RG5zjbv51JaVnR8dYZboAfLTPv0=;
 b=Wo+LsM00/xH1LuoPtTZ7YsxTskID7epEIuFBM4fJU09KdQHgUJCNSBEJ1AYy+CmzOH
 cLxM3oSiMjmMoJGP5pEKqsx7Zf+t48MYHIBwffaJgN1WnJOuGrG5VdOAZH/+39epJU+h
 tA4XYFTqTeA7WZ7V1H2PXS98aL7EX1saAq9zVuwdPknrscjFDXizjvY0iCVk1q/mpgyl
 gOXBYxIjKcqHEHK19kvNus7/aHQ2DO7gE6lgKHBHNbpIrMXimPMJF36xa+VNdrQnYzm6
 i6vvTgXISiVVF8Lcrh2qpFp75MtoPCBgAi7saD+YVLu0/IvSSolq0vmbP9yD+iQ9KXsQ
 v3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357554; x=1705962354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udL8itZxAYolT0n7RG5zjbv51JaVnR8dYZboAfLTPv0=;
 b=vzFRCxalruhq/BetkdZF6N2ntYHVHpHI12jlcp1onucuS5sOpkcqx67eyTkB1h2ge0
 k46mTR8eBw70+Sr8p3rE2orYKiY/phJQ8SZ9d4kFgg0i2nJlSmhl94gxPgcqSQ0pbJZP
 AoHaWXFnp+l/7S0Ek3KMgeDJFB7ih1lDTxa/F3GLr3+5C77FhbG89PLhqzoOPC8P9bVy
 ti5xS3V/hAgK/kou+94YxeNj8bnSyl8cda7gEq69j3ofjpVkc1RNjF4eCg+YF0fPrO3x
 EPGzqVeTYFXkfM9bAPWD2MUY7IlS86ip8aYV4DMhAm46LmGNkFuz8YgrTteeHXYIH7Ol
 UwBw==
X-Gm-Message-State: AOJu0Yw57qnxEzQmgZw/bin/jNc02LI8cisuw1iTAl+Mxj837yUAViiJ
 DUXEud9339IvPyF2q1keP6hiPOUHMhhzWg==
X-Google-Smtp-Source: AGHT+IFFtw30H1jJc7aYltZvjhEHlxJMSZiBgu470ioiw/uxOqV5IHH3QoGkkBVPwgCow+f4fNLw0w==
X-Received: by 2002:a62:5b83:0:b0:6db:7047:5dff with SMTP id
 p125-20020a625b83000000b006db70475dffmr1374796pfb.44.1705357554325; 
 Mon, 15 Jan 2024 14:25:54 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:25:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 06/12] target/riscv/insn_trans/trans_rvvk.c.inc: use 'vlenb'
Date: Mon, 15 Jan 2024 19:25:22 -0300
Message-ID: <20240115222528.257342-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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

Use s->cfg_ptr->vlenb instead of s->cfg_ptr->vlen / 8.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvvk.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index 3801c16829..a5cdd1b67f 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -174,7 +174,7 @@ GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvkb_vx_check)
             data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
             tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),         \
                                vreg_ofs(s, a->rs2), tcg_env,               \
-                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, \
+                               s->cfg_ptr->vlenb, s->cfg_ptr->vlenb,       \
                                data, fns[s->sew]);                         \
             mark_vs_dirty(s);                                              \
             gen_set_label(over);                                           \
@@ -267,7 +267,7 @@ GEN_OPIVI_WIDEN_TRANS(vwsll_vi, IMM_ZX, vwsll_vx, vwsll_vx_check)
             rd_v = tcg_temp_new_ptr();                                        \
             rs2_v = tcg_temp_new_ptr();                                       \
             desc = tcg_constant_i32(                                          \
-                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
+                simd_desc(s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, data));       \
             tcg_gen_addi_ptr(rd_v, tcg_env, vreg_ofs(s, a->rd));              \
             tcg_gen_addi_ptr(rs2_v, tcg_env, vreg_ofs(s, a->rs2));            \
             gen_helper_##NAME(rd_v, rs2_v, tcg_env, desc);                    \
@@ -345,7 +345,7 @@ GEN_V_UNMASKED_TRANS(vaesem_vs, vaes_check_vs, ZVKNED_EGS)
             rs2_v = tcg_temp_new_ptr();                                       \
             uimm_v = tcg_constant_i32(a->rs1);                                \
             desc = tcg_constant_i32(                                          \
-                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
+                simd_desc(s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, data));       \
             tcg_gen_addi_ptr(rd_v, tcg_env, vreg_ofs(s, a->rd));              \
             tcg_gen_addi_ptr(rs2_v, tcg_env, vreg_ofs(s, a->rs2));            \
             gen_helper_##NAME(rd_v, rs2_v, uimm_v, tcg_env, desc);            \
@@ -413,7 +413,7 @@ GEN_VI_UNMASKED_TRANS(vaeskf2_vi, vaeskf2_check, ZVKNED_EGS)
                                                                               \
             tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),       \
                                vreg_ofs(s, a->rs2), tcg_env,                  \
-                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,    \
+                               s->cfg_ptr->vlenb, s->cfg_ptr->vlenb,          \
                                data, gen_helper_##NAME);                      \
                                                                               \
             mark_vs_dirty(s);                                                 \
@@ -466,8 +466,8 @@ static bool trans_vsha2cl_vv(DisasContext *s, arg_rmrr *a)
         data = FIELD_DP32(data, VDATA, VMA, s->vma);
 
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlen / 8,
-            s->cfg_ptr->vlen / 8, data,
+            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlenb,
+            s->cfg_ptr->vlenb, data,
             s->sew == MO_32 ?
                 gen_helper_vsha2cl32_vv : gen_helper_vsha2cl64_vv);
 
@@ -500,8 +500,8 @@ static bool trans_vsha2ch_vv(DisasContext *s, arg_rmrr *a)
         data = FIELD_DP32(data, VDATA, VMA, s->vma);
 
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlen / 8,
-            s->cfg_ptr->vlen / 8, data,
+            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlenb,
+            s->cfg_ptr->vlenb, data,
             s->sew == MO_32 ?
                 gen_helper_vsha2ch32_vv : gen_helper_vsha2ch64_vv);
 
-- 
2.43.0


