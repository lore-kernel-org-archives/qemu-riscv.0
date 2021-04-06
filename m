Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTlTJ-0002dY-Hs
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@jade.fyi>)
 id 1lTjvj-0006N8-8t; Tue, 06 Apr 2021 07:31:36 -0400
Received: from out2.migadu.com ([2001:41d0:2:aacc::]:15902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@jade.fyi>)
 id 1lTjva-0007Ce-4e; Tue, 06 Apr 2021 07:31:33 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jade.fyi; s=key1;
 t=1617708676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MpAayDMbblMybCul2Z9h8sgj2liMBXeXs0+0sRI2suM=;
 b=uxv8Ky/dSJFMd6EEnLIGKp5S3Bb0HmfUdLmaErJqKuv/dhADSGLrlojs5MPBEiNk27BJBL
 kBRfn8kS9UtW3V7R4I7ZxMXfmQ+RhcKGjDyZ/lfKjdccac3gglzdDya2+iISvOnYwv5cJ5
 Dhmf1w7rJmyq33b1u7ujKNA8P5+WP1M=
From: Jade Fink <qemu@jade.fyi>
To: qemu-devel@nongnu.org
Cc: Jade Fink <qemu@jade.fyi>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] riscv: don't look at SUM when accessing memory from a
 debugger context
Date: Tue,  6 Apr 2021 04:31:09 -0700
Message-Id: <20210406113109.1031033-1-qemu@jade.fyi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: i@jade.fyi
Received-SPF: pass client-ip=2001:41d0:2:aacc::; envelope-from=qemu@jade.fyi;
 helo=out2.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Apr 2021 09:10:20 -0400
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
X-List-Received-Date: Tue, 06 Apr 2021 11:31:42 -0000

Previously the qemu monitor and gdbstub looked at SUM and refused to
perform accesses to user memory if it is off, which was an impediment to
debugging.

Signed-off-by: Jade Fink <qemu@jade.fyi>
---
 target/riscv/cpu_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 83a6bcfad0..18ea2cba57 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -299,12 +299,14 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
  * @first_stage: Are we in first stage translation?
  *               Second stage is used for hypervisor guest translation
  * @two_stage: Are we going to perform two stage translation
+ * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
-                                bool first_stage, bool two_stage)
+                                bool first_stage, bool two_stage,
+                                bool is_debug)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -369,7 +371,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
+    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -428,7 +430,8 @@ restart:
             /* Do the second stage translation on the base PTE address. */
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
-                                                 mmu_idx, false, true);
+                                                 mmu_idx, false, true,
+                                                 is_debug);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
@@ -616,13 +619,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env))) {
+                             true, riscv_cpu_virt_enabled(env), true)) {
         return -1;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
-                                 0, mmu_idx, false, true)) {
+                                 0, mmu_idx, false, true, true)) {
             return -1;
         }
     }
@@ -714,7 +717,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
-                                   mmu_idx, true, true);
+                                   mmu_idx, true, true, false);
 
         /*
          * A G-stage exception may be triggered during two state lookup.
@@ -736,7 +739,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             im_address = pa;
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
-                                       access_type, mmu_idx, false, true);
+                                       access_type, mmu_idx, false, true,
+                                       false);
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
@@ -765,7 +769,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
-                                   access_type, mmu_idx, true, false);
+                                   access_type, mmu_idx, true, false, false);
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
-- 
2.31.1


