Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loWHg-0000iB-7X
	for mharc-qemu-riscv@gnu.org; Wed, 02 Jun 2021 15:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHa-0000ds-Hl; Wed, 02 Jun 2021 15:12:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHW-0001vf-K0; Wed, 02 Jun 2021 15:12:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso4409940wmi.3; 
 Wed, 02 Jun 2021 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZz91rM5BGIW4nSoz6um0ZzXqGuRd9b6erkMDM2N8cs=;
 b=UnfrK+4GBbt+Hzu7he1J9AIQrxEbHwiWwptcoBTwqPE2P1zBK+5mqBoELBSsZvK7Lv
 aVyMNK7/yGN3qqtHDk/L66RzdY0rtB59aY77Pvg98U9zP0MmO3WqfvVwPykbF+q+6zDz
 mBV7xwaVbslYCk9OnXKpvZWi0IHUcfBbtjWJYN8sKY4IkueRcB9fIw0F/hQIbgUKrpNK
 vtL6ao8cUV8FZqpZ2jSKBuEmyBCQ862mKtiV3ZUJnzuWjs8DmThCK72vFbarqaYDla4T
 D4iCbfKnDfc12QcPI9gueTZXsbinHZrPRRye+7aX9rXpXdRA1evK8peAl89r23qOihdN
 l1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZz91rM5BGIW4nSoz6um0ZzXqGuRd9b6erkMDM2N8cs=;
 b=XW4VqWq5lU90ZqGszfFEVsACRyqvsN3s5aQfSUus0YRNyN5VrcANA8TmhqHOJj28rK
 ygQK4U89WQtsfzdUwcGcyhR8Bz+nWOB+JAMCKlghgLd95PKAmpAXOxTWQkWi+rzCckpb
 yyCMS/oM1u4hqcSBy63v3tfb+COCOW7JTouSo22AMzDesdND9OK1hYC+YnLRij/vTkQB
 4hYIzxyWm2/0393ofq7icwWqvmqD0wTxKz7hEx4TIDPSBFwyvcYIxzBH7rGBcoBIpx6i
 S7mMKNmOoa7JHX+XYPrIh5wOZnhK9JkGCLPNrPpiBpSfksjsY9PlYmbtOUmeABGx0OPN
 cVug==
X-Gm-Message-State: AOAM530F5+oH1Ocb3/5Sobs+woTiyKoa27Hw4vI2bdMx/AI3LlRsLmnV
 YHpXfms/xduyQqCRtqyT2O1mKKQRPdQrxiRO
X-Google-Smtp-Source: ABdhPJwv7/1LjF1fundtjB9gkDh72nQyMVbP8xkBH/lBa5hAk9t7xQBXXRw6RGwCi6BXsTHt8WgmaA==
X-Received: by 2002:a1c:6657:: with SMTP id a84mr23393640wmc.15.1622661116568; 
 Wed, 02 Jun 2021 12:11:56 -0700 (PDT)
Received: from asus.. ([83.144.170.28])
 by smtp.gmail.com with ESMTPSA id n2sm635304wmb.32.2021.06.02.12.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:11:56 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 2/2] target/riscv: remove force HS exception
Date: Wed,  2 Jun 2021 20:11:25 +0100
Message-Id: <20210602191125.525742-3-josemartins90@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602191125.525742-1-josemartins90@gmail.com>
References: <20210602191125.525742-1-josemartins90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=josemartins90@gmail.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 02 Jun 2021 19:12:05 -0000

There is no need to "force an hs exception" as the current privilege
level, the state of the global ie and of the delegation registers should
be enough to route the interrupt to the appropriate privilege level in
riscv_cpu_do_interrupt. The is true for both asynchronous and
synchronous exceptions, specifically, guest page faults which must be
hardwired to zero hedeleg. As such the hs_force_except mechanism can be
removed.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 ------
 target/riscv/cpu_helper.c | 26 +-------------------------
 3 files changed, 1 insertion(+), 33 deletions(-)

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
index 592d4642be..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -178,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
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
@@ -884,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
     uint64_t s;
 
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -913,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-            force_hs_execp = true;
-            /* fallthrough */
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -973,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
             }
 
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
-                !force_hs_execp) {
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -996,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 htval = env->guest_phys_fault_addr;
 
                 riscv_cpu_set_virt_enabled(env, 0);
-                riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
@@ -1032,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             /* Trapping to M mode, virt is disabled */
             riscv_cpu_set_virt_enabled(env, 0);
-            riscv_cpu_set_force_hs_excep(env, 0);
         }
 
         s = env->mstatus;
-- 
2.30.2


