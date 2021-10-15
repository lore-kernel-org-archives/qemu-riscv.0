Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbSu5-00006X-8h
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbSto-0008ND-Tg; Fri, 15 Oct 2021 15:29:49 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStn-0008Rw-7W; Fri, 15 Oct 2021 15:29:48 -0400
Received: by mail-lf1-x12e.google.com with SMTP id n8so45672049lfk.6;
 Fri, 15 Oct 2021 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0BZVfNR35vNcaA+olp4zm4S8Q+cJnVxl4jGZkzd+8s=;
 b=MiODM05kbNRmLxY8O4UxZ5DwbBNT2FqdaH1vPdqFM+jUuzCKEu8fEyjc/LtwZ4TmZg
 lfHa/QxqIl2qu5q6GMPwUZ0zJVPFGDdSfNSNf/mn2JIq+EuEHzXVsfnlpa4H+yzCOoEo
 mHQxEO7A0VswR9jV2ZU1joc9knzt2N393af8j1WmDldrHapYjFG7NY10R3LqsrJcRp2p
 b+R+stXTiuCvUkoyz84xw0q/DPBiReia+G3Ae1Q4CFovL8kCyejaHzIWW8LmWokxi21h
 27mhEH77RM7ygloAxm0X4tg1AIdIc9I2d2hZHe4FytK8pYnokktAdasFejM6IouhTHK4
 67ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0BZVfNR35vNcaA+olp4zm4S8Q+cJnVxl4jGZkzd+8s=;
 b=KX3XuazoRJk7DZhcKANIq/4Nn3OkuBbg+Qfn3+I73qRi3BBnNFri9sdpMObS68UA5I
 YVisWyBcaVwcVUaVafoppd3hjECEY4KQLbDxfa5X0tPnMNrpeFOA/C2Q/GMkHDGICnhs
 x1Uyy3qJjeqr1/nZpxaN39GYq2B+5Bk5PYDAp1C0ImKT8DDU5FuykmIkus/oIhtZhM6+
 xBRRuLS93LSaxqhEdpPFqpEkNM3LS6zZHZTnWAmOedm/g95SuiO9/Zii5KoBVnZSHg6B
 3hPV5QFgAPpLyiKKP13z8MAGoi/+hUvuHF04SSagfJmCiiGMSaMnIvw0VpZg8bccSzCS
 1wmw==
X-Gm-Message-State: AOAM530nPprFhb82IlR0FDGpnrWFqQ9RGHl3xw1mj4MSdNukyEWXUI1E
 WmwKL131KHjWz16JE8zD/6H8zJvSBKGnpE+gNbw=
X-Google-Smtp-Source: ABdhPJyxkKVaU6cqCv2wRRYBSHHb3SQ66r6K6TsUdPP/5SDi7JLjjIBm3js7LP8ZY9pCX9ZOUMGUag==
X-Received: by 2002:a05:651c:4c9:: with SMTP id
 e9mr14831571lji.212.1634326184056; 
 Fri, 15 Oct 2021 12:29:44 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:43 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v13 6/7] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
Date: Fri, 15 Oct 2021 22:29:30 +0300
Message-Id: <20211015192931.227387-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12e.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 19:29:49 -0000

From: Anatoly Parshintsev <kupokupokupopo@gmail.com>

Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 20 ++++++++++++++
 target/riscv/translate.c | 56 +++++++++++++++++++++++++++++++++-------
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index acb4ce9d23..fd2335d08e 100644
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
index 95739b1e41..4991b4b662 100644
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
@@ -118,16 +125,6 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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
@@ -282,6 +279,26 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
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
@@ -563,6 +580,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->w = false;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
+    ctx->pm_mask = pm_mask[priv];
+    ctx->pm_base = pm_base[priv];
 
     ctx->zero = tcg_constant_tl(0);
 }
@@ -676,4 +697,19 @@ void riscv_translate_init(void)
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


