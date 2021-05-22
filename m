Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lkTns-0000Ad-L5
	for mharc-qemu-riscv@gnu.org; Sat, 22 May 2021 11:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lkTnq-0008UI-E3; Sat, 22 May 2021 11:44:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lkTno-0000uK-GA; Sat, 22 May 2021 11:44:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c14so22133296wrx.3;
 Sat, 22 May 2021 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c93e1BVHtHaQNdpY243irciE9xkNejaub2aSt2FJjdw=;
 b=so4FSIls5dWf1ang6K3XpgQbO4nTEflTeZj+ewOJnyDzCpl/YVrIH4Pl/9JIHB71nm
 Dh8gH06trdWtbBAg0W6Ez8TIJu7zTOm0U/2kEcTu+SjIVKthn11bPY7qW183OvxUaB/0
 1NCCiBnUMX1DPbvC+gY7uqJe+zKq4X6sR+WZA7l6u3YYPvzM2s7PdrSJKAq2zDUFBSFD
 aKExrZg/zgcQHsV/cxnzSI94X9Q6BeaTk7g+OFH9Xp4FWxa8NJ5bH+8FYP2fAQ5I4ex6
 K/NAgakx2Gy7JbfxGmGNJNgYdhhxS1awcngemik66L3chX8eaeZM+1cUIYzTB79EapyS
 6tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c93e1BVHtHaQNdpY243irciE9xkNejaub2aSt2FJjdw=;
 b=HXh76r6LeRF3Yo8Bq1Wm1kD8rvgaliGWC0GwkODdDHvfNlBbXf1xR/bvvX6EXXrnCu
 XYhcgxbWg6XMfuAll1rHmzC9YqFvQeRGg3abM0t87yvCn+L3+Au8Vw35icvYiRqGqfiO
 nfsu7Dw3HAm4kcNw24mG33q6M5GfGRlUD9DRioQAxG2DJYC2v13DkqlzA6tWc0wkK76V
 lW8oPXtrkBf3SOIbhQF+8ht9Q/lA2a7mTMctr22+7/EFB7sdWUG7fGvsnoEtX8OKwwCe
 59F377JeX7rzY4vHbPB7OAg4U4ZNNeiOlOfXlKJFiCRgU1jaP32gX5QXu/reM/YkIfLV
 RKrQ==
X-Gm-Message-State: AOAM530R0tGqgw1h9JkxNE+r37X6LhwH0XqwaOHGf99OSudnhMkyZ2t0
 khWTmEg00iBTEMs3/sI8S48O7car3NaQJxFx
X-Google-Smtp-Source: ABdhPJxYPYWzeLmOyS3NVKH56hH0kCdJNNb4XPELjfd1QPPTRx1oDNghEH+cZXM8/cdblQd4vxPO4w==
X-Received: by 2002:a5d:6e11:: with SMTP id h17mr14368327wrz.331.1621698273674; 
 Sat, 22 May 2021 08:44:33 -0700 (PDT)
Received: from asus.. ([83.144.169.104])
 by smtp.gmail.com with ESMTPSA id g10sm5942050wrq.12.2021.05.22.08.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 08:44:33 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
Date: Sat, 22 May 2021 16:44:29 +0100
Message-Id: <20210522154429.361235-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=josemartins90@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 22 May 2021 15:44:38 -0000

VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
not delegated in hideleg (which was not being taken into account). This
was mainly because hs level sie was not always considered enabled when
it should. The spec states that "Interrupts for higher-privilege modes,
y>x, are always globally enabled regardless of the setting of the global
yIE bit for the higher-privilege mode." and also "For purposes of
interrupt global enables, HS-mode is considered more privileged than
VS-mode, and VS-mode is considered more privileged than VU-mode".

These interrupts should be treated the same as any other kind of
exception. Therefore, there is no need to "force an hs exception" as the
current privilege level, the state of the global ie and of the
delegation registers should be enough to route the interrupt to the
appropriate privilege level in riscv_cpu_do_interrupt. Also, these
interrupts never target m-mode, which is  guaranteed by the hardwiring
of the corresponding bits in mideleg. The same is true for synchronous
exceptions, specifically, guest page faults which must be hardwired in
to zero hedeleg. As such the hs_force_except mechanism can be removed.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
This version of the patch also removes the uneeded hs_force_except
functions, variables and macro.

 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 -----
 target/riscv/cpu_helper.c | 54 +++++++--------------------------------
 3 files changed, 9 insertions(+), 53 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..a30a64241a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -337,8 +337,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..7322f54157 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -462,12 +462,6 @@
 
 /* Virtulisation Register Fields */
 #define VIRT_ONOFF          1
-/* This is used to save state for when we take an exception. If this is set
- * that means that we want to force a HS level exception (no matter what the
- * delegation is set to). This will occur for things such as a second level
- * page table fault.
- */
-#define FORCE_HS_EXCEP      2
 
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-    target_ulong irqs;
+    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
 
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
 
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    target_ulong pending = env->mip & env->mie;
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
     target_ulong sie    = env->priv < PRV_S ||
                           (env->priv == PRV_S && mstatus_sie);
-    target_ulong hs_sie = env->priv < PRV_S ||
-                          (env->priv == PRV_S && hs_mstatus_sie);
+    target_ulong hsie   = virt_enabled || sie;
+    target_ulong vsie   = virt_enabled && sie;
 
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
-
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
-
-        pending = vspending;
-    }
-
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    target_ulong irqs =
+            (pending & ~env->mideleg & -mie) |
+            (pending &  env->mideleg & ~env->hideleg & -hsie) |
+            (pending &  env->mideleg &  env->hideleg & -vsie);
 
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
@@ -190,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
 }
 
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return false;
-    }
-
-    return get_field(env->virt, FORCE_HS_EXCEP);
-}
-
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
-}
-
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
@@ -896,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
     uint64_t s;
 
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -925,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-            force_hs_execp = true;
-            /* fallthrough */
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -985,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
             }
 
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
-                !force_hs_execp) {
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1008,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 htval = env->guest_phys_fault_addr;
 
                 riscv_cpu_set_virt_enabled(env, 0);
-                riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
@@ -1044,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             /* Trapping to M mode, virt is disabled */
             riscv_cpu_set_virt_enabled(env, 0);
-            riscv_cpu_set_force_hs_excep(env, 0);
         }
 
         s = env->mstatus;
-- 
2.30.2


