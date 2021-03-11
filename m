Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKIaG-0007YG-Oy
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 05:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKIaD-0007W6-SL; Thu, 11 Mar 2021 05:30:21 -0500
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:59407
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKIaB-0003tP-Ng; Thu, 11 Mar 2021 05:30:21 -0500
Received: from [86.56.46.35] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lKIa9-0005uj-9K; Thu, 11 Mar 2021 11:30:17 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Adjust privilege level for HLV(X)/HSV
 instructions
Date: Thu, 11 Mar 2021 11:30:05 +0100
Message-Id: <20210311103005.1400718-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.02,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 11 Mar 2021 10:30:23 -0000

According to the specification the "field SPVP of hstatus controls the
privilege level of the access" for the hypervisor virtual-machine load
and store instructions HLV, HLVX and HSV.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/cpu_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6..d0577b1e08 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -325,7 +325,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
+    /* MPRV does not affect the virtual-machine load/store
+       instructions, HLV, HLVX, and HSV. */
+    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+        mode = get_field(env->hstatus, HSTATUS_SPVP);
+    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
         }
@@ -695,19 +699,18 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
+    /* MPRV does not affect the virtual-machine load/store
+       instructions, HLV, HLVX, and HSV. */
+    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+        mode = get_field(env->hstatus, HSTATUS_SPVP);
+    } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
+               get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+        if (riscv_has_ext(env, RVH) && get_field(env->mstatus, MSTATUS_MPV)) {
+            two_stage_lookup = true;
         }
     }
 
-    if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
-        access_type != MMU_INST_FETCH &&
-        get_field(env->mstatus, MSTATUS_MPRV) &&
-        get_field(env->mstatus, MSTATUS_MPV)) {
-        two_stage_lookup = true;
-    }
-
     if (riscv_cpu_virt_enabled(env) ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
-- 
2.30.1


