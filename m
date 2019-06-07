Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZMtR-0005Ju-TD
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jun 2019 17:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48537)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMtF-0005FI-A1
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMtD-0002hT-QW
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:59:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27163)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMt9-0002eS-EZ; Fri, 07 Jun 2019 17:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1559944747; x=1591480747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N9MZWMpwXoggYB9M8lpugWwG2Kp5spU3B5Fv+B5KyOU=;
 b=ZO4sBoM78uKf8bew2RY5ZZSC1C5/y+Usn5lt31F7J/ScqjWWP6hNhZEc
 pYY6/1M/ycg+idHLqwUU673PBEmEtlo5O+Y/BjBH1slzMhxf9pdXd8T9O
 jLG3b1aXgjeThct/melRBrK+w1W2pGwuqk0jRvqQoz9tPhNPaAHIFT5N+
 GRUitSjRiA8/aTWogYeSPkPABprw/xzTIm7KnnbTrj5+ppukIzWu8hGI9
 PWWpbZfYOdS21bKBJ47iJVZpZn+zTyodEmK4oR71+vC18B+w47nTy0wXq
 YnaVpqDfXeUDXsPgKjZbtWvNT7Vdmv2JVI3hgi7r+Peaifg6FKB6IZwBA g==;
X-IronPort-AV: E=Sophos;i="5.63,564,1557158400"; d="scan'208";a="216378111"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2019 05:58:53 +0800
IronPort-SDR: 9sOMxpHKvFvskWiS3nH4EMTwoESP5jOOCo7IbbgQjOTas6+ovS9dIwxDZMN3BsINZ322HSAYAC
 nJQBXcb7zZdyU+G/R7nnZpk1vcnTTY7CWajQhLkwmOMaoJAoXGoVkP6LdcQQ6dzM81Oj4qbwGK
 P9b7X8phltXseC2Ty4M4OHCXIEddPzoqS9n5aUFJbn5eyyE1Op0cayLOyRyR4YLADQa0aJyQrU
 yXLmTLWXdOn29zA0ty3PBnm6vq4uwfB8+bZH1BgZKkDq2SJUBh/I49VosknFSuY4qcm/elbyMN
 nvp9uje3cAaev4J/VpZn0OmV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Jun 2019 14:36:09 -0700
IronPort-SDR: CE3fJVof/5GDSr52x3AK56FS1t2AZJsoqCPWKyDpOine8mjHsBz2Dtno42b9arWfivpaADX1Dh
 92/kQG10z8SOE2h8y15PseEfKN2g77LC5lQ1jDzzoBGJaeAk9ks/GOAdM0rD1mWQMcgoUY4rmH
 EowDDvf/ymTbiavJMW/ULNKVMvLD2Vri87ZM1lhgbeSOv/VmdQJaixsqZL/a08YyRt4IsQl6M1
 3diKLiczClwvBZo2/VJ8xqbBN6vQtvHTdgaBIE1zM50gCbl506DB+m9y2B8scCKdE50W6LpvQr
 UOQ=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2019 14:58:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri,  7 Jun 2019 14:56:43 -0700
Message-Id: <37e3a80ef4ba355fcaf1cc762b15ad96af8373f9.1559944445.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559944445.git.alistair.francis@wdc.com>
References: <cover.1559944445.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 26/27] target/riscv: Call the second stage
 MMU in virtualisation mode
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
X-List-Received-Date: Fri, 07 Jun 2019 21:59:19 -0000

The qemu_log_mask(CPU_LOG_MMU,... calls trigger false positive
checkpatch errors which are being ignored.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 118 ++++++++++++++++++++++++++++++++------
 1 file changed, 99 insertions(+), 19 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ece3eadf66..023368c2ce 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -582,15 +582,23 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
     hwaddr phys_addr;
     int prot;
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
-    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
-                             true, false)) {
+    if (get_physical_address(env, &phys_addr, &prot, addr, 0, mmu_idx,
+                             true, riscv_cpu_virt_enabled(env))) {
         return -1;
     }
 
+    if (riscv_cpu_virt_enabled(env)) {
+        if (get_physical_address(env, &phys_addr, &prot, phys_addr,
+                                 0, mmu_idx, false, true)) {
+            return -1;
+        }
+    }
+
     return phys_addr;
 }
 
@@ -641,34 +649,106 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+    vaddr im_address;
     hwaddr pa = 0;
     int prot;
+    bool m_mode_two_stage = false;
+    bool hs_mode_two_stage = false;
     int ret = TRANSLATE_FAIL;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
-                               true, false);
+    /*
+     * Determine if we are in M mode and MPRV is set or in HS mode and SPRV is
+     * set and we want to access a virtulisation address.
+     */
+    if (riscv_has_ext(env, RVH)) {
+        m_mode_two_stage = env->priv == PRV_M &&
+                           access_type != MMU_INST_FETCH &&
+                           get_field(env->mstatus, MSTATUS_MPRV) &&
+                           get_field(env->mstatus, MSTATUS_MPV);
+
+        hs_mode_two_stage = env->priv == PRV_S &&
+                            !riscv_cpu_virt_enabled(env) &&
+                            access_type != MMU_INST_FETCH &&
+                            get_field(env->hstatus, HSTATUS_SPRV) &&
+                            get_field(env->hstatus, HSTATUS_SPV);
+    }
+
+    if (riscv_cpu_virt_enabled(env) || m_mode_two_stage || hs_mode_two_stage) {
+        /* Two stage lookup */
+        ret = get_physical_address(env, &pa, &prot, address, access_type,
+                                   mmu_idx, true, true);
 
-    qemu_log_mask(CPU_LOG_MMU,
-                  "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
-                  " prot %d\n", __func__, address, ret, pa, prot);
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
+                      TARGET_FMT_plx " prot %d\n",
+                      __func__, address, ret, pa, prot);
 
-    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
-        ret = TRANSLATE_FAIL;
-    }
-    if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
-                     prot, mmu_idx, TARGET_PAGE_SIZE);
-        return true;
-    } else if (probe) {
-        return false;
+        if (ret == TRANSLATE_FAIL) {
+            if (!probe) {
+                raise_mmu_exception(env, address, access_type, true);
+                riscv_raise_exception(env, cs->exception_index, retaddr);
+            }
+            return ret;
+        }
+
+        /* Second stage lookup */
+        im_address = pa;
+
+        ret = get_physical_address(env, &pa, &prot, im_address, access_type, mmu_idx,
+                                   false, true);
+
+        qemu_log_mask(CPU_LOG_MMU,
+                "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
+                TARGET_FMT_plx " prot %d\n",
+                __func__, im_address, ret, pa, prot);
+
+        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+            !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
+            ret = TRANSLATE_FAIL;
+        }
+
+        if (ret == TRANSLATE_FAIL) {
+            /*
+             * Guest physical address translation failed, this is a HS
+             * level exception
+             */
+            if (!probe) {
+                raise_mmu_exception(env, im_address | (address & (TARGET_PAGE_SIZE - 1)), access_type, false);
+                riscv_raise_exception(env, cs->exception_index, retaddr);
+            }
+            return ret;
+        }
     } else {
-        raise_mmu_exception(env, address, access_type, true);
-        riscv_raise_exception(env, cs->exception_index, retaddr);
+        /* Single stage lookup */
+        ret = get_physical_address(env, &pa, &prot, address, access_type,
+                                   mmu_idx, true, false);
+
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s address=%" VADDR_PRIx " ret %d physical "
+                      TARGET_FMT_plx " prot %d\n",
+                      __func__, address, ret, pa, prot);
+
+        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+            !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
+            ret = TRANSLATE_FAIL;
+        }
+
+        if (ret == TRANSLATE_FAIL) {
+            if (!probe) {
+                raise_mmu_exception(env, address, access_type, true);
+                riscv_raise_exception(env, cs->exception_index, retaddr);
+            }
+            return ret;
+        }
     }
+
+    tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
+                 prot, mmu_idx, TARGET_PAGE_SIZE);
+    return true;
+
 #else
     switch (access_type) {
     case MMU_INST_FETCH:
-- 
2.21.0


