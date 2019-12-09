Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieNbT-0008Am-89
	for mharc-qemu-riscv@gnu.org; Mon, 09 Dec 2019 13:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbP-00085w-6d
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbN-0007oS-HK
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7465)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbJ-0007jP-86; Mon, 09 Dec 2019 13:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915487; x=1607451487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qlRMeQDkmiuF9/qvT0pM03riX0o7GgkkMNYFj74mYIA=;
 b=ZzK9qW2eCMxwW0bUpMI9bcMlEK8E+6DvVGLx6kuEvjeBloZDKxNX7nvh
 bbH0+ZlKKz+sg9taVinM/36qGs4NgpMa9TF8ERR1reKohTPr4UHg+wivr
 csWY9Fd+VKce0YTNMndGk8e9JfkOBkKY/Vm1afTosOO+7hLq0FXgEZO5M
 /Sfe1GzNWs652h72OzIaVu6SSo2iiefy0IQh1WJ2cc0i16J4HoANUW/qj
 E+lV2d8qZkKZngVtsCegKhXv1U7z74vAvEPgViwdMhjxIA5HGfuihHLn3
 VtIRovNsLIuOc9iEV3Em2xwI0SAxWTQC/yz7t2x7r7JcR8vl0R4KV7UCd A==;
IronPort-SDR: rRGIeTGPKjQumLNtwQfhoMk+BVUFUmKdtJw0Kjg74VKgWO9DU+Thv9/gY2O4VyEVdIvmPxfbut
 ma6fDs9nBcl4iHgrS9Kxs1WuuoTbSqkO55KttTDi7sbPuTWocIbFazYSNcCsRFVw1jBW1YoNpJ
 7uNpEJ5VF22EMsWbufI1TJNpH6+FwxTZl0QWLoux2c2SJBolVSzmvN8vCOIsEcC5ip99d9RK/y
 R2Qx0NuyR80dAEwenA14O0gwo71XMci3WJ4nEO4Qr1WlRtgm6Kb9n56hAoWF4B+V7vOfhDgZnB
 kso=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="226412028"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:18:06 +0800
IronPort-SDR: ea6l4DwF0f0hefiO3PUipUVQz7Gv/xUJ6LnjanCFsjr6cYlLW7spC19pcrHtRwW7Am777E2gcP
 XFr7RVGLhMEcWPWiW0RStp2uj9Aee9nYu3KCI70t2FRjKVkMRtsHCfLWIoIEQ+VRqEcaT6WGcM
 Byxmr+gnA8g/mXw+jzZFR9gWXUrb66CS2XPm1lO6jz0VplgyssdtRdvQkYWv7F/OB6qAtWfk4O
 5l8mwVWrhAhoDcfKRKZrww6ofGpvISOYIN7PsQYZDpKcv068attg/0vf5am8rn9kCfIkrpGqIO
 D38ZxVvKFd2unIEfEwHORrXX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:12:18 -0800
IronPort-SDR: DW+r72pp/dHb7Z1pDyRKGusnSlFF6t/NPtWDXpr4NvgaefcPBZ0Sx/ZVFed3xQsj+NDe6jqnzS
 IxzBz+UPMovbwmNmRaR8dt/g31iyH7QJU0wHIQw78y7gAiWrvTiBHU/9ngMuh5uaAMJ3eHyQZy
 pTBSpNocRUHA6fytG2XXAx5O05osQ/9CSGPCPseHA8bOYe0tIuZe2mp6KqUqlGhQzqgkQXLaUP
 ljTQ6wMT+zaMnFdCxlrW2skVSYkejDmzQJ+os+sMqRRvkYbIlusXCK995QFcCHnhOPab/9SqjB
 VRk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 10:17:40 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 30/36] target/riscv: Allow specifying MMU stage
Date: Mon,  9 Dec 2019 10:11:59 -0800
Message-Id: <1cd8d1423b81dd4705e03923f644840e35143ed5.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
X-List-Received-Date: Mon, 09 Dec 2019 18:17:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2040fc0208..8b234790a7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -279,10 +279,19 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
  *
  * Adapted from Spike's mmu_t::translate and mmu_t::walk
  *
+ * @env: CPURISCVState
+ * @physical: This will be set to the calculated physical address
+ * @prot: The returned protection attributes
+ * @addr: The virtual address to be translated
+ * @access_type: The type of MMU access
+ * @mmu_idx: Indicates current privilege level
+ * @first_stage: Are we in first stage translation?
+ *               Second stage is used for hypervisor guest translation
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
-                                int access_type, int mmu_idx)
+                                int access_type, int mmu_idx,
+                                bool first_stage)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -485,13 +494,23 @@ restart:
 }
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
-                                MMUAccessType access_type, bool pmp_violation)
+                                MMUAccessType access_type, bool pmp_violation,
+                                bool first_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions =
-        (env->priv_ver >= PRIV_VERSION_1_10_0) &&
-        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-        !pmp_violation;
+    int page_fault_exceptions;
+    if (first_stage) {
+        page_fault_exceptions =
+            (env->priv_ver >= PRIV_VERSION_1_10_0) &&
+            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
+            !pmp_violation;
+        riscv_cpu_set_force_hs_excep(env, 0);
+    } else {
+        page_fault_exceptions =
+            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
+            !pmp_violation;
+        riscv_cpu_set_force_hs_excep(env, 1);
+    }
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = page_fault_exceptions ?
@@ -518,7 +537,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
-    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
+    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
+                             true)) {
         return -1;
     }
     return phys_addr;
@@ -583,7 +603,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
+    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
+                               true);
 
     if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(*env->mstatus, MSTATUS_MPRV)) {
@@ -610,7 +631,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type, pmp_violation);
+        raise_mmu_exception(env, address, access_type, pmp_violation, true);
         riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 #else
-- 
2.24.0


