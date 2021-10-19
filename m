Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZG-0004nL-92
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZD-0004fQ-6n
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:19 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZA-0001ey-U1
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:18 -0400
Received: by mail-pl1-x62c.google.com with SMTP id s1so10596196plg.12
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JntjpE4dbZf2jEil4I0MzTIE4C49WVyfW1GrdUDx7w8=;
 b=EpEJvLj0PD95egCk2WB4x+DM4vQTtGq5QrMQmZ6G8gXWA7PcosXEFHw/exDVEJhkJ+
 HLgwgoJ8RSeAU+wrg16xhBLLLg6k0b6xP6YpKKAJVWuigND2ROGOmLfgOrSaJnW1ojNo
 Mj2zCQbHTDPMwOUln1ecCLo29g0kc3aaQjlURdbdwZh7p4hD6GwsdRvv+dHKCP/uVLXo
 w2A082Wq0eREGtevdTkap34cYsMyRdzxSYDpvJHNZclPLe5aBTldfua2dvu+J9e5jphk
 N7jTYQNxrdOZ+ZrWfUdivst3b4nnkg/7pNr9bWCqlYS1EzrH6FzhbPQuP5na1HGdXZ3G
 jaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JntjpE4dbZf2jEil4I0MzTIE4C49WVyfW1GrdUDx7w8=;
 b=Xxwcfchwu0N387v03NHxGXFOkzYjyfQbkJiE0+9mYvxswrLrRduFtCn04JZYUVS9c8
 BRUVgDpyZ7eh75T7YohINyNCmkgYIc3jzOHIggSwut+/EOHGgyts8YKXsAs0H3FizsPV
 EEtFsTNxh/apZMjZsAAfDZWGuhwALB+WgvcAoOyRVaVr0UFl7ftnttqbttjBlznwtVb/
 m6EVD/oSdOmJ6irU7VQtDLrUTUAgsJvzYZ+H7+pCkSq4s+HRnsOCcfeX8mvfAJIt1el9
 q6Ql6lPu3O19VEPMoSuD4VPWsofL+GAOnYrW44Y11ASlqlyEqUg9ccMooJeqQ3U4ssPF
 7X6Q==
X-Gm-Message-State: AOAM531zAxD1qVaeRHIvl849H2sxnnxN3/KS6PGRUQDVCSDEqAo1w4Is
 py/wh+O6Q1rA+I62R7toP6SN9A==
X-Google-Smtp-Source: ABdhPJx0dVE1EAmacQvAe/ke1Gr7+N33o2a5GE4mBTfmT5R0TZXrMhomeet+pJu5KdO1Lnl4l+e7Kw==
X-Received: by 2002:a17:90b:120c:: with SMTP id
 gl12mr2443975pjb.50.1634601672944; 
 Mon, 18 Oct 2021 17:01:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 05/16] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Mon, 18 Oct 2021 17:00:57 -0700
Message-Id: <20211019000108.3678724-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:19 -0000

Begin adding support for switching XLEN at runtime.  Extract the
effective XLEN from MISA and MSTATUS and store for use during translation.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  3 +++
 target/riscv/translate.c  |  2 +-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0e82135a9..c24bc9a039 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
+FIELD(TB_FLAGS, XL, 12, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1857670a69..4e1920d5f0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
+    if (env->misa_mxl > MXL_RV32) {
+        /*
+         * The reset status of SXL/UXL is undefined, but mstatus is WARL
+         * and we must ensure that the value after init is valid for read.
+         */
+        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
+        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
+    }
     env->mcause = 0;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 403f54171d..429afd1f48 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+static RISCVMXL cpu_get_xl(CPURISCVState *env)
+{
+#if defined(TARGET_RISCV32)
+    return MXL_RV32;
+#elif defined(CONFIG_USER_ONLY)
+    return MXL_RV64;
+#else
+    RISCVMXL xl = riscv_cpu_mxl(env);
+
+    /*
+     * When emulating a 32-bit-only cpu, use RV32.
+     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
+     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
+     * back to RV64 for lower privs.
+     */
+    if (xl != MXL_RV32) {
+        switch (env->priv) {
+        case PRV_M:
+            break;
+        case PRV_U:
+            xl = get_field(env->mstatus, MSTATUS64_UXL);
+            break;
+        default: /* PRV_S | PRV_H */
+            xl = get_field(env->mstatus, MSTATUS64_SXL);
+            break;
+        }
+    }
+    return xl;
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+
     *pflags = flags;
 }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9c0753bc8b..c4a479ddd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+        /* SXL and UXL fields are for now read only */
+        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
+        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 66857732e8..f7634c175a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -514,7 +514,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled = false;
 #endif
-    ctx->xl = env->misa_mxl;
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
@@ -526,6 +525,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->w = false;
     ctx->ntemp = 0;
-- 
2.25.1


