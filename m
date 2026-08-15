Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F114DC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKr-0007Ub-DK; Sat, 15 Aug 2026 15:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKp-0007SG-Cv
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKn-0008OX-NA
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2d02b4c3601so24100805ad.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823184; x=1787427984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+ncRv98FOpWWg4cYJGCijDVpUQGTeB1NBMwEEckvxpo=;
 b=p+JdtOB7POAyvBs0/t1maqls8vcl6UiAjRw6KCc8rDMIjx4w09zdQ1Xgd/Thky9EdB
 8zjmOVAkoH8UpNQyNIOpmYMFykfqnfjMij9KcludMnXFR7PJyY2xB9ufi9ZD2C4Urilp
 O3Ap3YSrh6bNO+/kYmC/crxtYI2s5G5pr1HDGzDc29JZXcbjkZkT/HmWN3JrcxdbR1pL
 dr8STordK4fVJTsqDYLFGcq1/yHruT7NyPWT1SdP9XoXi0agl+wsXR+/aRvbAQuqpHAG
 Oa5qtmBHKSC5JYAh54EHZAqpipvhHMY3jbvYXVFh7VaFPd8ft8hTN+FdvAuwzNbEMZd7
 QRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823184; x=1787427984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+ncRv98FOpWWg4cYJGCijDVpUQGTeB1NBMwEEckvxpo=;
 b=RX65ru4mpy4Vx10BF8FRix2C0OhoDIRbPJIXgqR75KiStOR/XIUK7V3wZ2t4pXdD6u
 Gaho8dWMs977N1IfORBd/jBQxkHM09g9SBrHMxWAIK3/vbYjzXaTTAo5MkD4nQS0fNt+
 cgF79d2zE/yZPC1UFtjrovAlWYBdHTDMnTVWxqF2+QjKTjIt4yPvKNFMkb3WnTVLQ6sq
 P5rFYWwI0Csu0jzov7PFU1wESw1knbN6t3N6DcrctcVAbebxE47MkmWISoCB3aa5Wk1J
 f71/pNOLXDPKwz+a0MQHTj78MUPwHUNgegApouKGBAeALarF+GIfW4EFEhMkbGDUlmhV
 zXNA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp66WO21XCIknSwXWS+uiVqXig8B1y3pdhIxy6a/t5tAIH/9OKearLV/csI9aifPTceH6CFyu9FCVyx@nongnu.org
X-Gm-Message-State: AOJu0Yw3McHSxgwY36ZtjY4t2mFAp+rJTfFh43uL76UlXPecg5ViLUqX
 ohDzMTXXNgKpxQ1LU5QT/e+lpsjn+yeo+LTwK3scfjW8dHoWh61hFzP3Wq07MDGBs+c=
X-Gm-Gg: AR+sD12Qr8TpX02j496Eblb9mwmXwFelXeUUTohAtHIGHG6WN0NPPP1LASi9VAp4j33
 UO58ycDRXgv3v9fcfs4KCMoRsYMaQ7Q1vtYJRgqLHxroxSs/cyh4XHupmU3Pa4HVuSnSDIP5hVC
 3V9vWKMX7xOMfsY87xfkAh+3+qTh5miUnsxhzJp3QlS4LG78t1H6eCMj6n9vclb3Q12eMKVxfRj
 XFjoLJBbMiuG0JyXAMsWWw+CXDrFQJul7ZKZbvNEDtv/VT5Hdof8xUnEY92KFkJNGgMAw2JhX2S
 37jyXMQ+hAATXvHDzfyjNyUyu1queZJ8eH58Uu3nQgTJ12qfYm0L//aKHs71KMScz+xTnV6D7Vl
 2lgmJA/c14gHC3ZYw/sAGoqnNWoic+3zuOypEGYvxZtW+aJfBNkCDKPcUNireZw4zUDA7dSXfrd
 EQRz98hbnKdKXZb7usNI9Lc7wy2641/+9zih5Pr34oAg/PmFgvyJ9T3YNb7gIghnISQEksODJb0
 5GQYu+z7I8WJ8+eOFmB
X-Received: by 2002:a17:903:950:b0:2c9:9a2e:dab0 with SMTP id
 d9443c01a7336-2d3b0827064mr172243755ad.3.1786823184307; 
 Sat, 15 Aug 2026 12:46:24 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 22/23] target/riscv: Drop v0 argument from
 gen_helper_ldst_stride
Date: Sat, 15 Aug 2026 12:45:47 -0700
Message-ID: <20260815194549.1377505-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 target/riscv/tcg/vector_helper.c            | 10 ++++------
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 16 +++++-----------
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ffd759aef3..82a478962b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -180,14 +180,14 @@ DEF_HELPER_4(vse32_v_mask, void, ptr, tl, env, i32)
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
index 2548ad9c2c..354c0b0da5 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -322,9 +322,8 @@ vext_ldst_stride(void *vd, target_ulong base, target_ulong stride,
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
-void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
-                  target_ulong stride, CPURISCVState *env,              \
-                  uint32_t desc)                                        \
+void HELPER(NAME)(void *vd, target_ulong base, target_ulong stride,     \
+                  CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, base, stride, env, desc, vm, LOAD_FN,          \
@@ -337,9 +336,8 @@ GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w_tlb)
 GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d_tlb)
 
 #define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
-                  target_ulong stride, CPURISCVState *env,              \
-                  uint32_t desc)                                        \
+void HELPER(NAME)(void *vd, target_ulong base, target_ulong stride,     \
+                  CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, base, stride, env, desc, vm, STORE_FN,         \
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


