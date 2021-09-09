Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOPIH-0003oc-NQ
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 15:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPIE-0003i6-TF; Thu, 09 Sep 2021 15:01:03 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPIC-0007RH-Ug; Thu, 09 Sep 2021 15:01:02 -0400
Received: by mail-ej1-x633.google.com with SMTP id t19so5612286ejr.8;
 Thu, 09 Sep 2021 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdF0EuazTN/Tmx6W2hQNWYkGgZgkP/J4tiRe2waUs3c=;
 b=laXc9wOuzinfKUtQZY8V8I6qvNs3XAnJDQ/xYTHkAeLj3VP56rlhBWBO1WCqzzofvm
 ss+rRbYwOY2BmzTfsQhn4XJziVCKy7EGyh0SzDuMElM7UCgz/2U1VUVVFvlJLmjCtKxt
 sVsVPGzMu0KTczOGpZ+IikaqCFSEasMB/kvdDJ/oWIeWOBMevbfucpWONZJicKwO/KEF
 5mmLx0UqZFJeTIVAZzRMZy/pg4IrP5Z9WjmIH1KY7VcUztCP1+rx+pedg8dhUI/AcGgJ
 CNVsYwJ7Pl9s/aERYucglHLw/1QGDOAHGsfgM3v51p6bFVuEmfVf8LPc1qYzhdh+/V92
 lxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdF0EuazTN/Tmx6W2hQNWYkGgZgkP/J4tiRe2waUs3c=;
 b=usXAY96bOkxOSq+FkhjdVhkupJCVxL4yX2KC4hxC6dSXkRHmDps74N+BVckBYZ1hoM
 KZPu5OWLgBVrHohRQCdsxQ0bmaxncLxnWah+yLGdNA9wVZ/aSKZEIJTejjgWg3C89JNm
 o7jPJV2rl/KjLKYq0nJdZxqPmkqXk/yNOkTx44raERkD2Itg5BQyF/6EsRVp1K2NW4z+
 GD/2yFASALQ6O+6d3ZRnz+3UaBXOjvTbHutjJ3j1mVzU1U2f+8491zxsoV5EXAQd55GT
 /TYJpE0w6DtCVaPakcHacDh51trKMlhKYQb2hPVtJZlWdjJaUowwUnt1wQ4xXv7rCfrm
 +qcA==
X-Gm-Message-State: AOAM531HdvJ7DVJd8rFmPOzqOJSMaPkxRClgiIGwQMu8RdLXrFey8ac7
 Zf2A5zia+ic1akmrR6NHzI8=
X-Google-Smtp-Source: ABdhPJyuprWM2zZUm4cFYsHpsniEkilXIh60UYGGfeOy2hwwLVW5SuwgvgohEierMxJ0URpYmgtknA==
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr5145532eji.385.1631214056755; 
 Thu, 09 Sep 2021 12:00:56 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id c17sm1514588edu.11.2021.09.09.12.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 12:00:56 -0700 (PDT)
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
Subject: [PATCH v11 6/7] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Thu,  9 Sep 2021 22:00:32 +0300
Message-Id: <20210909190033.1339448-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Thu, 09 Sep 2021 19:01:03 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 20 ++++++++++++++++++++
 target/riscv/translate.c | 36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 94e680cbd0..763d8da4bf 100644
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
index 13d1470690..364edab79e 100644
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
@@ -118,13 +125,19 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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
@@ -552,6 +565,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->w = false;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
 
     ctx->zero = tcg_constant_tl(0);
 }
@@ -665,4 +682,19 @@ void riscv_translate_init(void)
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


