Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9x0-0001xE-Km
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wp-0001pR-7P; Sun, 17 Oct 2021 13:27:47 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wm-0003Gy-45; Sun, 17 Oct 2021 13:27:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id 5so30839651edw.7;
 Sun, 17 Oct 2021 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MMqnqsUUcK1PWEgJODm9TEqM0MGx97DCR5kYwOP0Arg=;
 b=lP6t6y03I/zgYkdUODtChH4X7ir1crbG3TY0w2ghZX7K1+y42Y18h854tyjBlT+ZfT
 iFRGUb/b5YKT8lrys/W8xgTtOCmdLkj0twRLGXJM3LoQ7GR+y6ysI3FcF3qzWObwxYsR
 RP8gBu3oSfR89Z+Z3vMTYWWAovAwFNh00XdBFnNtTjjM5ofQF6F8TG5nYwFbf6AlzB1B
 sVUx45+xbHSJ7WtbjywkRM4Q5O9B6fxJnQEk8yYrAS9ISpZhYYgeM9LwzxTkVgZnH+tA
 LB4Jx45oTQbatMwKYrmxMGc6LzfC8BEQk2zWVRSbvMd93FY/FnT1+skCqCwOSlMfuQ1l
 nn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMqnqsUUcK1PWEgJODm9TEqM0MGx97DCR5kYwOP0Arg=;
 b=TwfWSDucuWq0HPf88RRJ2SMsJ/51UrWdAQT/zNoODF9A5re7zNGcOChb14L3N3a6FL
 dy2m8PEcH8EiH/2CHhKisl4Ku/5jjMAj/vUKEx+oyd6oKsppggpYCQJndjrcTED74+kY
 Th4Li6hsoK+F5wjDfaxJAbKPsyb3/CgWMLPR49KzxhXwXfwDqbwgbQZyDnVlKASFxWjU
 lbBRBFvt4zZdT0CTPc5EQZSfW2ZSjn0cm7lQW8kSUPgo9Zcl8Dbo2awIVvFYRnccUu1y
 YD2nowmJSIRLHhaTKawz1DAlx8wRlm64x23fnX10p9xdX1Xx88r3MLVWCtGyHF8AAiWR
 Fl5Q==
X-Gm-Message-State: AOAM532Hc0V4/dUe3ldytW3Yv69lQsegw3to99+cxSZL3K0iu8Udx1FV
 gGd8CfwGKBelAt1W4xzQJhI=
X-Google-Smtp-Source: ABdhPJzQbTVRLRQD4QcslzopM9K4WNCK9ue74WRUMUAUwDIITykeEJwEq3XMbMgahK/4/8aNY0I1Ag==
X-Received: by 2002:a17:907:7f24:: with SMTP id
 qf36mr5667609ejc.491.1634491662520; 
 Sun, 17 Oct 2021 10:27:42 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:42 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 7/8] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Sun, 17 Oct 2021 20:27:27 +0300
Message-Id: <20211017172728.759687-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:49 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 20 ++++++++++++++++++++
 target/riscv/translate.c | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index acb4ce9d23..0ae12b9e61 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -407,6 +407,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+/* If PointerMasking should be applied */
+FIELD(TB_FLAGS, PM_ENABLED, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
@@ -467,6 +469,24 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
                            get_field(env->mstatus_hs, MSTATUS_FS));
     }
+    if (riscv_has_ext(env, RVJ)) {
+        int priv = flags & TB_FLAGS_PRIV_MMU_MASK;
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
index 9e176b8137..e1a5725395 100644
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
 
@@ -82,6 +85,10 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* PointerMasking extension */
+    bool pm_enabled;
+    TCGv pm_mask;
+    TCGv pm_base;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -248,11 +255,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 }
 
 /*
- * Temp stub: generates address adjustment for PointerMasking
+ * Generates address adjustment for PointerMasking
  */
 static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
 {
-    return src;
+    TCGv temp;
+    if (!s->pm_enabled) {
+        /* Load unmodified address */
+        return src;
+    } else {
+        temp = temp_new(s);
+        tcg_gen_andc_tl(temp, src, s->pm_mask);
+        tcg_gen_or_tl(temp, temp, s->pm_base);
+        return temp;
+    }
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -536,6 +552,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->w = false;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
 
     ctx->zero = tcg_constant_tl(0);
 }
@@ -649,4 +669,19 @@ void riscv_translate_init(void)
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


