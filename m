Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2T0-0007ul-SE
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Sz-0007oy-I9
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:53:49 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Sx-0007v8-IG
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:53:49 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5418d54d77bso81782197b3.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccz149ae7qjXs24szWW3cssOF2BSOtBtk+oz9ziJ5zE=;
 b=LA5S24FqpQv9mmRXPuLIAxV4OsINEuGoNvxmVivMvPq91QAzHvsc/AlksXmupvH27v
 b6XrMOJQz5QXMCUgx+VQMs8c7H/752Nkzuc+Y0Z/yys7qVqRX3AkRtqzBVZ39sGlZS1K
 ne851o8Ifosc7xB9Y/TZFE+e3EgRFf/OCBmWa+RV8ZCqiX5lfQgmPdRqLrji2EQ/jiWn
 US1o7/7w30ODr8moDfa85YITqYpV016n5veHY4nrLhrPTAjbV9n/ExVY7lFs1DCrDjKQ
 i0T9VGdebtf4AWfCwZMiNslCZN2oMn/nfbRpu9XnKhF0cB/SFJweu5vRWWUzwllLDtF6
 XQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ccz149ae7qjXs24szWW3cssOF2BSOtBtk+oz9ziJ5zE=;
 b=OSLcuZ2sVYyXtGFD4Ttfh52NslUD7fvATE7pdDn2FPFfyZHqwjSgrYApu8c4xxMB2W
 GrViG3mVPQGeTDYrV6JLghNrlXbh91VPgXY5vVmzBCbVGaBb5eiKWcObUjK+qWPr6WeE
 cIlJyAUPWvdvgiZ2v3Wa7F7N31GHdIr7r4zEpyH+9klLlKDkspa/oHktmx+mc2p0TomF
 HYjagvLccnmvNWQc+tXPFfj+66KaU0Vk1CKz5Tj+v5BKKV5sGMn/pWFA7R0/BPc7Iu6l
 PCseJOjl/DjfzK2QS6OphJsIuLw3jyliT2j8PE0tp9Hv7L3JCyx3p2Ic0UTBa1YJEUk/
 5b2A==
X-Gm-Message-State: AAQBX9c8rzFain4u95MYm+8X+hzhh0qMoL4rU1DZtQuCZULNHDdD2+H0
 ngMrZcpvVxnAygxriJJH++F6Ir0ognEGcZ3Qvpc=
X-Google-Smtp-Source: AKy350aIvP1hNjiMf1dxPp1zH7MZ7UYeNeYTtZW32JsnSlJcEKyNMeJ9yY9tq4zfqN7jxcc1YbnJ8w==
X-Received: by 2002:a17:90b:1801:b0:233:e9a7:209e with SMTP id
 lw1-20020a17090b180100b00233e9a7209emr5809272pjb.28.1679741676993; 
 Sat, 25 Mar 2023 03:54:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 07/25] target/riscv: Reduce overhead of MSTATUS_SUM change
Date: Sat, 25 Mar 2023 03:54:11 -0700
Message-Id: <20230325105429.1142530-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1130.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:53:49 -0000

From: Fei Wu <fei2.wu@intel.com>

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.

This patch creates a separate MMU index for S+SUM, so that it's not
necessary to flush tlb anymore when SUM changes. This is similar to how
ARM handles Privileged Access Never (PAN).

Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
other syscalls benefit a lot from this too.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
Message-Id: <20230324054154.414846-3-fei2.wu@intel.com>
---
 target/riscv/cpu.h                      |  2 --
 target/riscv/internals.h                | 14 ++++++++++++++
 target/riscv/cpu_helper.c               | 17 +++++++++++++++--
 target/riscv/csr.c                      |  3 +--
 target/riscv/op_helper.c                |  5 +++--
 target/riscv/insn_trans/trans_rvh.c.inc |  4 ++--
 6 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3e59dbb3fd..5e589db106 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -631,8 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
-
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5620fbffb6..b55152a7dc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -21,6 +21,20 @@
 
 #include "hw/registerfields.h"
 
+/*
+ * The current MMU Modes are:
+ *  - U                 0b000
+ *  - S                 0b001
+ *  - S+SUM             0b010
+ *  - M                 0b011
+ *  - HLV/HLVX/HSV adds 0b100
+ */
+#define MMUIdx_U            0
+#define MMUIdx_S            1
+#define MMUIdx_S_SUM        2
+#define MMUIdx_M            3
+#define MMU_HYP_ACCESS_BIT  (1 << 2)
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5753126c7a..052fdd2d9d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "internals.h"
 #include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
@@ -36,7 +37,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
-    return env->priv;
+    if (ifetch) {
+        return env->priv;
+    }
+
+    /* All priv -> mmu_idx mapping are here */
+    int mode = env->priv;
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        return MMUIdx_S_SUM;
+    }
+    return mode;
 #endif
 }
 
@@ -600,7 +613,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    return mmu_idx & MMU_HYP_ACCESS_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index abea7b749e..b79758a606 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,8 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     RISCVMXL xl = riscv_cpu_mxl(env);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..962a061228 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
 
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 9248b48c36..15842f4282 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -40,7 +40,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv dest = dest_gpr(ctx, a->rd);
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
         gen_set_gpr(ctx, a->rd, dest);
     }
@@ -87,7 +87,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
         TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
     }
     return true;
-- 
2.34.1


