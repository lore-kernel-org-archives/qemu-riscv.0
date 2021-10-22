Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8o-0008EI-Q1
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8e-0007yc-U0; Fri, 22 Oct 2021 14:19:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8c-0004sO-7t; Fri, 22 Oct 2021 14:19:32 -0400
Received: by mail-ed1-x533.google.com with SMTP id r4so611687edi.5;
 Fri, 22 Oct 2021 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kM6eQU+1qED7HPMBmKwR2WyTEjyUMT7fM9vV1UiSOZA=;
 b=H/JDcvo4Y6+PHfvvWQgxtOvGsHfEpHXJysvJiU1YVXZRBKK00FPhvOwtW27mvUXSLH
 dfaTfzEfNRF+NG9CuVV2PQdfnGUSwxDT/HE88tWCq/1D56mEN54ypbbSbaKr1ED2uoSy
 FczY+Yu6s5sv0lDvqbDW4LcDtp0plNI5DP/i1c15xKsJLXipul/PG1cNx5MCGpCwKAe0
 9eNjr52Q3saHBobSvqVpyikeP92maYwnTZTUXhdh7AktokivuhT9Dr+tRE3C+DwGDWL5
 s0+ippw7rwcgpKBWHXqsBtlhxWD2lLdEkMeabpfljOxbuxdxeNFVWVGqlm9cR7L6SIza
 BWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kM6eQU+1qED7HPMBmKwR2WyTEjyUMT7fM9vV1UiSOZA=;
 b=zTAkA+B9kbaoo8B98SAUmwG3qtKb4Ot6XcflY5Ob/6E3GMZgkL+xVHMwzy4C4gTeGZ
 gYkuXKsbMuAO4Y4SIhAcOdrD8+M4lsp2EC9lrWBF7NGTkLdmBJUtUqE+J3/Gehc79xvH
 YJvJTU30HtuROJXHu/kXPU1CyZEX0fzbw+hb5AhD6tGOizpaJ7D4R3uqCVhxkezP1/yi
 r7uPdcuRr4vRMfsUNXCrj2MZ1YsLrJX5RQTTQW6D92tOE9ar4mDbyNKSrMQfT/NuCplI
 QWRbhy5vgHf7ovuvgh2nRU+M477DtM891vxtgEn1/E0V6Nm9yv1MZxNj3lelwOxduGQ2
 Hcbw==
X-Gm-Message-State: AOAM530lPvrP1ehYPJNcOQRRnfkuYolsBXRXOQEL4aZvZweGRi2mExsE
 qWe7A2cPtodsGtC3XgGGB34=
X-Google-Smtp-Source: ABdhPJxrpJ1uSqyOc0RNlZn/xxcKXM9dK76QBCmIceLaePtqizncM2QDzxPHid/wq9oeyW/IA1qU0A==
X-Received: by 2002:a05:6402:42cd:: with SMTP id
 i13mr2014154edc.396.1634926768552; 
 Fri, 22 Oct 2021 11:19:28 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:28 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v16 7/8] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Fri, 22 Oct 2021 21:19:09 +0300
Message-Id: <20211022181910.1999197-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:33 -0000

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


