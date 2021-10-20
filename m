Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hZ-0004JW-7w
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hP-0003nT-RO; Wed, 20 Oct 2021 06:19:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hM-00032b-V4; Wed, 20 Oct 2021 06:19:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id 5so23541577edw.7;
 Wed, 20 Oct 2021 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MMqnqsUUcK1PWEgJODm9TEqM0MGx97DCR5kYwOP0Arg=;
 b=g9vYyeYC1/GQU1AoEua5A+B+2ZMEG9WfZooSy92CDogKxcWVIZ+HOVpgaASE8v/+a2
 cmf+sdFjIA6clOQtphJSx4rwwPR/si0icRJeSDlV326nj/A9pAgmijRFJjEZ5AmhWdla
 QszVBC5Gx+riIoja7yP5rTy6g16Rg8kPb+7Xe4SvcRWgmp4LF0T9FcffiqiP5PYS9R9w
 WshLzVqTMSfxOYucAhrj7l2f2Z813H33gN8hCmcbRyoAXDoqc1oJpcU8AAwN5fkZlfDy
 bTHRRWFaq0ukT2MUG5ozgEnWU6Jw+FTPqIBpwgOpvMy0TPEsAd1EvB3Ia244f4GE8XAA
 cxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMqnqsUUcK1PWEgJODm9TEqM0MGx97DCR5kYwOP0Arg=;
 b=oTbuUeZpAdJZpGI9z42EGFrXNq6mW5sLF+ozL6JhcWOEGwsVaze3eWJMgGFPZef+1g
 9qoXfpZ2zVmCkNo4gGBZ7vBGOGEuAtGMdxGF8V51vwWMBfmf/voyhUmgnIvx3mHRXkCX
 u5VHGqc+q6xQi2vTl2zSjuSmVY41wMC6n2NkQTRsRMOnvA6HZNqmDicpwgJgnTvHcso+
 P3RfPl1bYDHKMmDugoZsn+n+8oe8swv8rs7MTPXfnrGQsDV/AXvCNKqnFfUwNyqQOSRp
 6FxSoehMVqQY0g0NHOAerJIo0LftkCC722VFfdde0skUkWBEIVC41glnE4IvmJT8Kx/P
 RXQA==
X-Gm-Message-State: AOAM532WHZuAqNqhE+YoANbaYDVWtyHErWhmTjPfUWF5C1WJpHFO1yqA
 HIszVg6hcm26gjsU0NODdko=
X-Google-Smtp-Source: ABdhPJyXVpIWR8wpmYrGyw3XcRBHC+FW2MZBhMua+XlG4LZNwbDaRzjZrYzW35ZE6rkXOdBtAfJZjg==
X-Received: by 2002:a05:6402:141:: with SMTP id
 s1mr61545782edu.317.1634725190571; 
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v15 7/8] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Wed, 20 Oct 2021 13:19:34 +0300
Message-Id: <20211020101935.1369682-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:56 -0000

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


