Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhJ7-0005OB-NN
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhJ1-0005Ge-GF
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhJ0-00073a-7v
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:39 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17129)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIx-00069K-BS; Fri, 31 Jan 2020 20:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519435; x=1612055435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZvOTH8k7NLUxTYGrJKj+ErgddFbqIGwYkWqdg/z9qo=;
 b=hlbEv7MqRB4CopdAPTRhgtEJw4bhVPqY1IG9FYoctLsjpeObfFUBtjwO
 /lycLcxqMcnXUmlLHnNhxxfdtzAIqkU/cTeUgNp8bJszf9QVEwn5elYM/
 8UgMJW5lGN7dj+F1ghh+ZL4Od7J7N5fCV+lGR7BXyC95Rkk0lRRwYaYKn
 +BPLgAxZdLi8WEWhbZXrrWueA0s21OlyyzJdXmlxCudXtQ4jGLIsU6jwo
 OSq9xRSzkCAar0oyJN6uCvEOWxo1JI5GqTvLUybQS+CvlfpP5tZjccbsC
 YaYktRre+NQRyZ0dpsQOct7JiDflvIxEl5I6IvOwTrwVHjFcU5fYDcZIy w==;
IronPort-SDR: hGFRGo2DRk9b6BUww6nEqYnaZWBTntbjKD7fcy7NqNn2wCrhZVLqn/1UgW6H1rOPKHln2DUJ58
 IeohCkeBfi65Zd5+ov3lLlBZGJuyGqMZAVFyWND8DMME3PsEe+xyYX31kD3EgOfFtNP/Ac1Hdo
 OsG1VQ0MyjMX+NrQDw0p4BJVCyqFjgfWiD09T3I7t7p5Vl5jAYzi4m3ucGzUXLHe6JratGS/1r
 rfAFygF7PFv9W0Wy9OR9rtNQrZT5X/JAlme41g/FA3pGYz1tKhmeurI75tHyQNkbwJXR2LUTAw
 zfM=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872491"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:29 +0800
IronPort-SDR: zncOfuiMzGk/h8S8i63fSIP5npDyZM1yfYeQQ1EQ9jB5Qc22ArrounjNPS+xEKjpOIDeHF7xID
 nMZCaDAJRr7KUoNiGhxh361InjSxJtZgWIkX7FkY7m9ow3HfpC/1ahlk8Ed7MQNedt1XsNj6p+
 Heqi99SHFD+MhrXnekcJC/fhdSPh0FLjtqP1Pjshgj/ZRmJuUqzw17q0Z6H+hmjexDB7XHJzQp
 iz49sZxVJ96EIiZtsoz93tBlr2iddBN3QkCUBj/gRKo8RLvhTzzQVa/uluy7RMGZ1R0n6g2zIU
 1DYn8D+QNz6uh3b5o0LzwlL3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:38 -0800
IronPort-SDR: o227rWEHJEfYETUUWcFGqsNwB+ybR59DOOVqIOje/DCDbP+Cg+fYl21DTUmmEf/p8JFhaBqiJT
 G0UuxytvBU0buUBMO2GeaeTIANeL3TE3MJD72NPDNiGQ6nn53Pddpq1g3g+POb94Tw9yoTG705
 8Hubqe1LxDTiJ07EufWa3FD51Q6a0zlaDllkNg6eQzzIFYFp0eAuI6kbV9k0ULEl3scjWcfTpt
 v2FEJsyQxXNIUNB+TIXudFEBAyyLeatYRawK9g110epG9266sCLIxkVI4nv/rBp1sVlWMZT1lu
 yzY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 Jan 2020 17:09:29 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 29/35] target/riscv: Allow specifying MMU stage
Date: Fri, 31 Jan 2020 17:02:53 -0800
Message-Id: <6f5f9cab7e5094f5a2f9d5a47d5036a426126ebb.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Sat, 01 Feb 2020 01:10:41 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 827a38324c..cd2d9341b9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -277,10 +277,19 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
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
@@ -483,13 +492,21 @@ restart:
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
+    } else {
+        page_fault_exceptions =
+            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
+            !pmp_violation;
+    }
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = page_fault_exceptions ?
@@ -516,7 +533,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
-    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
+    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
+                             true)) {
         return -1;
     }
     return phys_addr;
@@ -581,7 +599,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
+    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
+                               true);
 
     if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -608,7 +627,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type, pmp_violation);
+        raise_mmu_exception(env, address, access_type, pmp_violation, true);
         riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 #else
-- 
2.25.0


