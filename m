Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtW-0005Fh-Ch
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt6-0004k2-5B
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt3-0002Np-A0
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id i3so1256814wrc.4
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299818; x=1683891818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVh+zRIWjFC/l6dDWYElki++Cx2rWrykEl8ZmED7Ed8=;
 b=VLGnjwfWNYisd3SOR073eXH7DSBoKMZSiFSiAj/nnrvqOoYkV2giVLtHWb5D0Tbuz4
 ECl3eOvCEHdxjGxzKI6Yl07TqiDuiHz9s5jhFNul5Q4KP2LbjWUu+Tq0YyIANkqzghrU
 HzwBwwIiCSnVkXdvKXodYJ0Szutv6RHEnS7vl5PqgVpe7qz649RV7s3UEpj+8y4C3D1/
 dNzcv9s2xsybymcpTzrTung4vhggG4u01Cp8a4PDYj1CAhtRubA86sF7+epLlrJve3DL
 zWB8ZIgRdiglDIL9UZotJzJ3LcIGTe6sHlMpsmKKSeeTlz3F04Q/N1PQgWWan0hMHPXs
 Nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299818; x=1683891818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVh+zRIWjFC/l6dDWYElki++Cx2rWrykEl8ZmED7Ed8=;
 b=Qoat1iBXX4pCSeYfg0HevBnnbODemo2uemJgg4Dxwz8Vn4oJGqOICZjZGNZoQN37EE
 ekQ5OeNAx8URDjcGTtfLCvLBPL0GhPgkPaWpkUkl1tHre6R1tXxSiGLgFHIuu56CgpOU
 QHL++f8fd2VTTHX/vFbnJJ30SSQUEtTKSUQr2V02HLQZwXWzAvV0S2aIB8zSP86iG/oy
 DPOjIasyuvLZAFqKjFpWBzYvv1b7faH6mT6/QGlnHKfC7FTVbK34vd94aHQ/X8UvnJRJ
 cNDHR2awErOFY+hhO+5ebNmkQxGX6lzkZKxqw0uBhf3n9EgLmtzGmXYvTlj9BywlD0CU
 3svQ==
X-Gm-Message-State: AAQBX9erG8us3a107NXgBrUdoyzEW4vzSEKhCcY4c5qgba/e4vwge+Po
 24wXwdFP9VUne4cqDiTq7Yj3/w==
X-Google-Smtp-Source: AKy350bnNL0E4BaJrr1O9+srEw074qy39l9s4Ou49ZTz4tYafkz7m3hQlZvZEwuiDjuXufH6S4bSDQ==
X-Received: by 2002:a5d:61c8:0:b0:2f4:cf53:c961 with SMTP id
 q8-20020a5d61c8000000b002f4cf53c961mr878137wrv.54.1681299818713; 
 Wed, 12 Apr 2023 04:43:38 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 04/25] target/riscv: Remove mstatus_hs_{fs,
 vs} from tb_flags
Date: Wed, 12 Apr 2023 13:43:12 +0200
Message-Id: <20230412114333.118895-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:47 -0000

Merge with mstatus_{fs,vs}.  We might perform a redundant
assignment to one or the other field, but it's a trivial
and saves 4 bits from TB_FLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-5-richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 16 +++++++---------
 target/riscv/cpu_helper.c | 33 ++++++++++++++++-----------------
 target/riscv/translate.c  | 32 ++++++++++----------------------
 3 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 51d39687fe..ab64d5f92d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -644,19 +644,17 @@ FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
 FIELD(TB_FLAGS, VILL, 14, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 15, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
-FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
-FIELD(TB_FLAGS, XL, 20, 2)
+FIELD(TB_FLAGS, XL, 16, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
-FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
-FIELD(TB_FLAGS, VTA, 24, 1)
-FIELD(TB_FLAGS, VMA, 25, 1)
+FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
+FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
+FIELD(TB_FLAGS, VTA, 20, 1)
+FIELD(TB_FLAGS, VMA, 21, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
+FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8412ef26ee..e3e620137b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -45,7 +45,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 {
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
-
+    RISCVExtStatus fs, vs;
     uint32_t flags = 0;
 
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
@@ -79,18 +79,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 
 #ifdef CONFIG_USER_ONLY
-    flags = FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
-    flags = FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
+    fs = EXT_STATUS_DIRTY;
+    vs = EXT_STATUS_DIRTY;
 #else
     flags |= cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        flags = FIELD_DP32(flags, TB_FLAGS, FS,
-                           get_field(env->mstatus, MSTATUS_FS));
-    }
-    if (riscv_cpu_vector_enabled(env)) {
-        flags = FIELD_DP32(flags, TB_FLAGS, VS,
-                           get_field(env->mstatus, MSTATUS_VS));
-    }
+    fs = get_field(env->mstatus, MSTATUS_FS);
+    vs = get_field(env->mstatus, MSTATUS_VS);
 
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
@@ -100,18 +94,23 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
 
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
-                           get_field(env->mstatus_hs, MSTATUS_VS));
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, env->virt_enabled);
+        if (env->virt_enabled) {
+            flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+            /*
+             * Merge DISABLED and !DIRTY states using MIN.
+             * We will set both fields when dirtying.
+             */
+            fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+            vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
+        }
     }
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     if (env->cur_pmmask < (env->xl == MXL_RV32 ? UINT32_MAX : UINT64_MAX)) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 411e771e6f..3092c942ab 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -66,8 +66,6 @@ typedef struct DisasContext {
     uint32_t opcode;
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
-    RISCVExtStatus mstatus_hs_fs;
-    RISCVExtStatus mstatus_hs_vs;
     uint32_t mem_idx;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
@@ -620,16 +618,12 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
-
-        tmp = tcg_temp_new();
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        if (ctx->virt_enabled) {
+            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        }
     }
 }
 #else
@@ -653,16 +647,12 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
-        /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
-
-        tmp = tcg_temp_new();
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        if (ctx->virt_enabled) {
+            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+            tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        }
     }
 }
 #else
@@ -1171,8 +1161,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-    ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.34.1


