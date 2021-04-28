Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbfE-0001N2-6P
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbfB-0001FB-0m; Wed, 28 Apr 2021 00:19:01 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf7-00065h-WC; Wed, 28 Apr 2021 00:19:00 -0400
Received: by mail-ed1-x533.google.com with SMTP id c22so8866553edn.7;
 Tue, 27 Apr 2021 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZo0boHEvBRhG0tdDLSUtrJ+iJiWD/rcMwo8xjj1KII=;
 b=XfORPdI/NMCc0mJ+twKHZ2mtOmMcJ5meONrzHmvqF4vd+M8ndgWaKxnkqC9yqF/aeQ
 8GdJsUqp754CdJUQ7jyZJpRbdllVpHrDlRrOt5xM4hnhq/K2NHq6K4rd//1TfOYvfCGD
 DFplZGJoxTOVdIyVb8dzR2fJiwjZWYIQp0TdVlxIYnMTdDumWBV94gOY8XxLJunYRqe9
 mUiYjpi1y188oSYjVIjf6fC3GtbD3cWzJQG2o8QliCd/gc9P4MPyrPNzBjiqSkZK4T1t
 e72Hh66pTUMI834O+Hqq5FEfCjMmD8hLjBU/20bic62N2bwf8DKYpksgM5Z0gs4bR3j1
 5U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZo0boHEvBRhG0tdDLSUtrJ+iJiWD/rcMwo8xjj1KII=;
 b=nXHkUc39ZAEnxQGsDzLxBFkpeOtuF4iFWIzbmqCru2KjNbmNsfR/u1d4OsMv+veHFy
 HE8Y401xVgLxNWfxaTuNDyTt1/31VbOz3w3139WEx1D3kePZvKaRKgojlQkpimMZQ/jg
 KAEh62gcYz6WzfGRuP/7M82QPFEaaWl3Co0WyPZMduql+ySd2H9B3196okqaRV5042dr
 QuKiGVRYyM7YdVf9agwOvRmvoJ/nd95AbPdqT4pHKwF9uiNfd5PmIU16fRJnaWgiSpr/
 AGZLR1S+DSJCXd/4h3X0fmXlgGW6DKpfDxpWt0bm1mq4W0EiUIa4yvsCw7PHu8PsN+Z9
 v3kQ==
X-Gm-Message-State: AOAM530yOTZO8SnnUZF8WtALv+RkeLETFUBJJKg/p8INZq1JhGd8uyZV
 Y8Q9zDDmnZfBdy9D2mHRdjs=
X-Google-Smtp-Source: ABdhPJzNntdvvHXiB1VXYcIcLUuBLe+zJsvxoTaWjQtBjU+EARUY57vy77OIF9mKAQZp6AKW9zGIjQ==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr8160040edd.348.1619583536372; 
 Tue, 27 Apr 2021 21:18:56 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id s20sm3759565edu.93.2021.04.27.21.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:18:56 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 5/6] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Wed, 28 Apr 2021 07:18:47 +0300
Message-Id: <20210428041848.12982-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Wed, 28 Apr 2021 04:19:01 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h       | 20 ++++++++++++++++++++
 target/riscv/translate.c | 36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 19aa3b4769..2edfc59712 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -407,6 +407,8 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+/* If PointerMasking should be applied */
+FIELD(TB_FLAGS, PM_ENABLED, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
@@ -464,6 +466,24 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
     }
+    if (riscv_has_ext(env, RVJ)) {
+        int priv = cpu_mmu_index(env, false);
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
index 2e815a5912..37706d56d5 100644
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
 
@@ -64,6 +67,10 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    /* PointerMasking extension */
+    bool pm_enabled;
+    TCGv pm_mask;
+    TCGv pm_base;
     CPUState *cs;
 } DisasContext;
 
@@ -90,13 +97,19 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 }
 
 /*
- * Temp stub: generates address adjustment for PointerMasking
+ * Generates address adjustment for PointerMasking
  */
 static void gen_pm_adjust_address(DisasContext *s,
                                   TCGv_i64      dst,
                                   TCGv_i64      src)
 {
-    tcg_gen_mov_i64(dst, src);
+    if (!s->pm_enabled) {
+        /* Load unmodified address */
+        tcg_gen_mov_i64(dst, src);
+    } else {
+        tcg_gen_andc_i64(dst, src, s->pm_mask);
+        tcg_gen_or_i64(dst, dst, s->pm_base);
+    }
 }
 
 /*
@@ -657,6 +670,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
     ctx->cs = cs;
 }
 
@@ -777,4 +794,19 @@ void riscv_translate_init(void)
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
2.20.1


