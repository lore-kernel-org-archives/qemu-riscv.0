Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILi-0003uR-CE
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILb-0003ld-Di; Tue, 28 Sep 2021 15:00:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILY-00010G-IO; Tue, 28 Sep 2021 15:00:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id y35so35999135ede.3;
 Tue, 28 Sep 2021 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmYsFkzlGtVXV98D2W5G1ktXT5jBrArpzgfplBT1N6I=;
 b=JGi3PnMJRb5vuANNH15pGGR6DYz0CbofGF27WwR47DSBsu7PiIsEhhiVSPAJeq91No
 3Y6Ua/o3F4zjwCsKPBZciCk88Bj+B6c3qnrTKcamOVEWwRbuQ4fVlmsLlojKiaf/8JYz
 FQyI3KDcMLRUYWF3O9WucgD4LyUhKYlkVWlpumAGHThMtidpp8h64/jeW6VCMwbWEbEi
 dgJLNwVnq0V0gfyppsZKVCQPZTAeEwxNfZAdl/yxcdkK38lWoq50uyEnO/uL4H80sG6F
 gR/uVjzT9erHPQIYkTwZK3gYwUVOWhNlE3786dGkFeN7Etfd+JyolqvXMN6n5qpo4KNn
 qLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmYsFkzlGtVXV98D2W5G1ktXT5jBrArpzgfplBT1N6I=;
 b=wk+3UjzAnbJsvfE7IlW6XvMlpDwUd2BD8CFWz/CXUac5hzdU86x4Xgwt7cWwcpeA2f
 Xfa/yLHhvL/4UghstUSdOveMZOFLtcRr9BV4+mlEr63Ik+tC1K1y9qW75lYhx5yR1jZ3
 ujlPOqyn1E1qF2LwmV1KpyNR4/kAEHvUFqthY3QzrjPaq/u81EEB0X07Y4s2Pha54xlc
 GPEwKYbH8rvsRwc4u9k02uNLrmc4BTsyqa5Y0E2jsrzheyCELJNys2aea86kgMLF7ndE
 wfI/2O6ce7rzDmB5f/HFdiEakk3GQpkTWAP12daddKAnwSM51binkCPSEQRb/tnDiI1Z
 3Ddg==
X-Gm-Message-State: AOAM533/WekrRLckqR32kiFTbT6R0kZJP1Br9LejOFAgztQMaFvZ2o13
 Tmkj4zQSFhq7rR4oTe2VA7M=
X-Google-Smtp-Source: ABdhPJwkvlIUydV8YGyHDhPocZ20u3YCNa15TiG1swszbdriiG3GPvirv1hFFyb6lM4y96ldH+Bqqg==
X-Received: by 2002:a17:906:1b07:: with SMTP id
 o7mr8648246ejg.28.1632855654908; 
 Tue, 28 Sep 2021 12:00:54 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:54 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Anatoly Parshintsev <kupokupokupopo@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v12 6/7] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Tue, 28 Sep 2021 22:00:35 +0300
Message-Id: <20210928190036.4114438-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Sep 2021 19:00:59 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 20 ++++++++++++++
 target/riscv/translate.c | 56 +++++++++++++++++++++++++++++++++-------
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c41a937a80..a7496d9a56 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -405,6 +405,8 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+/* If PointerMasking should be applied */
+FIELD(TB_FLAGS, PM_ENABLED, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
@@ -462,6 +464,24 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
     }
+    if (riscv_has_ext(env, RVJ)) {
+        int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
+        bool pm_enabled = false;
+        switch (priv) {
+        case PRV_U:
+            pm_enabled = env->mmte & U_PM_ENABLE;
+            break;
+        case PRV_S:
+            pm_enabled = env->mmte & S_PM_ENABLE;
+            break;
+        case PRV_M:
+            pm_enabled = env->mmte & M_PM_ENABLE;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
+    }
 #endif
 
     *pflags = flags;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index de4997a3e5..4618443524 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -36,6 +36,9 @@ static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
+/* globals for PM CSRs */
+static TCGv pm_mask[4];
+static TCGv pm_base[4];
 
 #include "exec/gen-icount.h"
 
@@ -81,6 +84,10 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* PointerMasking extension */
+    bool pm_enabled;
+    TCGv pm_mask;
+    TCGv pm_base;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -117,16 +124,6 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
-/*
- * Temp stub: generates address adjustment for PointerMasking
- */
-static void gen_pm_adjust_address(DisasContext *s,
-                                  TCGv         *dst,
-                                  TCGv          src)
-{
-    tcg_gen_mov_tl(*dst, src);
-}
-
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
@@ -281,6 +278,26 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
+/*
+ * Generates address adjustment for PointerMasking
+ */
+static void gen_pm_adjust_address(DisasContext *s,
+                                  TCGv         *dst,
+                                  TCGv          src)
+{
+    TCGv temp;
+    if (!s->pm_enabled) {
+        /* Load unmodified address */
+        tcg_gen_mov_tl(*dst, src);
+    } else {
+        temp = temp_new(s);
+        tcg_gen_andc_tl(temp, src, s->pm_mask);
+        tcg_gen_or_tl(temp, temp, s->pm_base);
+        *dst = temp;
+    }
+}
+
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
@@ -553,6 +570,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->w = false;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
 
     ctx->zero = tcg_constant_tl(0);
 }
@@ -666,4 +687,19 @@ void riscv_translate_init(void)
                              "load_res");
     load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
                              "load_val");
+#ifndef CONFIG_USER_ONLY
+    /* Assign PM CSRs to tcg globals */
+    pm_mask[PRV_U] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upmmask");
+    pm_base[PRV_U] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upmbase");
+    pm_mask[PRV_S] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spmmask");
+    pm_base[PRV_S] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spmbase");
+    pm_mask[PRV_M] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpmmask");
+    pm_base[PRV_M] =
+      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpmbase");
+#endif
 }
-- 
2.30.2


