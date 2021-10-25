Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf3th-00008o-VN
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 13:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3te-00005W-Uc; Mon, 25 Oct 2021 13:36:30 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tc-0001ym-3Z; Mon, 25 Oct 2021 13:36:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id r12so2756673edt.6;
 Mon, 25 Oct 2021 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kM6eQU+1qED7HPMBmKwR2WyTEjyUMT7fM9vV1UiSOZA=;
 b=qMrFTf4r4aLI4G31rg10gXzsjwodgBQz9oTwLNC3JiGyTG7jGdWi1GNyQHHBfsNKSX
 Yk4CnitFOgq3eR6mbrgnI2mg5vRrH1yQEECrlPbai2ukNG2a7qE0A+XmfsViPK9qdsWo
 lfHdfmOOg5dhNeG8AXyhTnZbnnBLPcH+jdISlAWGdMB4m62Zu/73Vz7emp7nDlOSKeS2
 VQPGERNEG1U3PC4yvc3Sr0siLzdD+v077UkHqptf0J58zV9G9mWWth1iVAGMjmsFv4mT
 hOG4e9WmO0VhxTLOyuNFF9L1t3NkhIbnaXual/C+bWPWBTQSByTJUaAOjuD2qeIfpICP
 YoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kM6eQU+1qED7HPMBmKwR2WyTEjyUMT7fM9vV1UiSOZA=;
 b=MK+W7aMzEFCimoZ/Fc3jzBF3m03QS/QjNXrFDaAIpIQZ45u/gTKwVucHhyNAeKYtKK
 Ddu7cgM1q6NEAXQRlCikYHpnbWyXmmIYZCPlULpLxXVonm91RK5d1QvN+7wsarju9+EO
 O6IWHy5GHZQ20vfJosqJ2nQrhN0zCoRCr6hOkGHtu/IZxIPrhxVL8t4iXOfonD2wSOU0
 7vNr6W9s66GCXl5KQkTYAm6tz2iWgAdO6O4CNmwmdw8pwc/EH8VwYBWkBualWJ2Aq/QX
 9IlWr3ttFAnqr7yR/bDJPmwV9IlYiZrQTyy5ZwrXxWong7iAV7pm7fFmmsB0HYTwS3yJ
 3rsw==
X-Gm-Message-State: AOAM5311ZxMwPwHHwmNGTieJ7VsxURR1d8rgPUH+X5nWKlWMNbRmyg5w
 7ShwK5D0gToMqCygATw/FGU=
X-Google-Smtp-Source: ABdhPJxVT1VFYpBUoBMI8AsuZLfMCKTWiI6Au/skWpCIPju2PeXDxfU2ms+BYUZctWa4ww0DTEsxyg==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr23699738ejy.532.1635183385589; 
 Mon, 25 Oct 2021 10:36:25 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:25 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v17 7/8] target/riscv: Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Mon, 25 Oct 2021 20:36:08 +0300
Message-Id: <20211025173609.2724490-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 17:36:31 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 target/riscv/translate.c  | 39 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b2422e3f99..325908287d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -410,6 +410,8 @@ FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 13, 2)
+/* If PointerMasking should be applied */
+FIELD(TB_FLAGS, PM_ENABLED, 15, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0d1132f39d..662228c238 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -107,6 +107,24 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
 
     flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a5e6fa145d..1d57bc97b5 100644
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
 
@@ -83,6 +86,10 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* PointerMasking extension */
+    bool pm_enabled;
+    TCGv pm_mask;
+    TCGv pm_base;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -272,11 +279,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
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
@@ -622,6 +638,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
 
     ctx->zero = tcg_constant_tl(0);
 }
@@ -735,4 +755,19 @@ void riscv_translate_init(void)
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


