Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK3v-0005YD-SK
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK3t-0005Kz-3V
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJvI-0004lI-Qe
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:48:29 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:5520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJvH-0004TN-7R; Fri, 24 May 2019 19:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741707; x=1590277707;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=WdXYoh7fkTTZ+ULUGr4p/aowgNK2JkukvO9A/NY16TA=;
	b=bw7t2/KDbh90/Q97sx4UiaipEHxEbdx9fX3UurxH5F+sA18TI9XHBRbD
	zxRhQG/KIyUwrjfdgoikDvOWMzrfUgG7A3LZ/rD0Mrl44cOKS3mH/UlJr
	pwGCWvr8qs6wRNw+l+GT+1/Qpxdbl1lJUUHaZiNM2FvIXwkQaQuNDMO3n
	d/z+C1XIzn6Xyzzje5ZnjZBqFcEqNXUePZ58UwnLHkQsgeW5ihMt/kFkv
	iqy79xEPUPPn0mvctZ1ksM4QIer4BRl+xkMMZQ2eLOvVxOzBfpxU6WIAr
	8oDiacYGUHHOc3JtJyVwxjFuK6MK3Z+bkhDraaXR/a1OPsnxupEGxFO5T w==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="215265035"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:48:25 +0800
IronPort-SDR: 3uBNpXqDjZYi+igSAIdiI0NhJ1To2l9xdZkpVq9c8VpxX2kQWsOgRDIg5iN3rEdv03m2P/eyQZ
	RRtP4uHbzgnUH2Q+13AHZFpBbZzHuo3jfxxpRwHqogXjUqpXpwpeW4ivImQwfcB9ggIn3ZCKeI
	+d7IMTYDQlI+ROztcjZjO6zVFvjC/6Cog+PtjOQYhce0rCGm7jj7sDWTt/3rtKfnKBrpiDq1AH
	AsIjOZ9XDvslboFcmOjjbA9iKtr90xR42ZC2a6Laelm/xZW+0ynMvyAx11eM488c31PAIhWTRJ
	nqGUxqxUSBlwvyztUGaElA4+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 16:26:05 -0700
IronPort-SDR: PAInfIsZI1s83wbLSGWn2PYF0l94q9SBtzZ8YaB4Bm8Ry4FJoSMd0sLx+XMmDuovEHPKo+9NUO
	7+ZkLnEV/Xe1C2dgvivBlDe4dvZWyZeKMYmrDkwdUnVFxnDINs1EbyjL5Qw5BLNO9OlNowggnJ
	NBr0YVzuBSVNc45l4z1WUNnzqf4Fg73PgH1IpTIMVSZjEWvdaRrmQjjfB89LqYUHgnj9YS131W
	o7MgYNamV8baGHqpwPHbhRrpcfAykuVKHmxvp82z9VwSFrncrmnJE5DLy7JhItYylAAVqnjqlT
	aIQ=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 May 2019 16:48:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:46:31 -0700
Message-Id: <566fbd2d52bae6da22dbe51c6ef1716653c4dfba.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 21/23] target/riscv: Implement second stage MMU
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2019 23:57:22 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 87 +++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f57e49c973..387c12547b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -280,13 +280,40 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
 
     int mode = mmu_idx;
-
+    bool use_background = false;
+
+    /*
+     * Check if we should use the background registers for the two
+     * stage translation. We don't need to check if we actually need
+     * two stage translation as that happened before this function
+     * was called. Background registers will be used if the guest has
+     * forced a two stage translation to be on (in HS or M mode).
+     */
     if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
+
+            if (riscv_has_ext(env, RVH) &&
+                get_field(env->mstatus, MSTATUS_MPV)) {
+                use_background = true;
+            }
+        }
+    }
+
+    if (mode == PRV_S && access_type != MMU_INST_FETCH &&
+        riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
+        if (get_field(env->hstatus, HSTATUS_SPRV)) {
+            mode = get_field(env->mstatus, SSTATUS_SPP);
+            use_background = true;
         }
     }
 
+    if (first_stage == false) {
+        /* We are in stage 2 translation, this is similar to stage 1. */
+        /* Stage 2 is always taken as U-mode */
+        mode = PRV_U;
+    }
+
     if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -296,13 +323,30 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *prot = 0;
 
     target_ulong base;
-    int levels, ptidxbits, ptesize, vm, sum;
-    int mxr = get_field(env->mstatus, MSTATUS_MXR);
+    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
+
+    if (first_stage == true) {
+        mxr = get_field(env->mstatus, MSTATUS_MXR);
+    } else {
+        mxr = get_field(env->bsstatus, MSTATUS_MXR);
+    }
 
     if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        base = get_field(env->satp, SATP_PPN) << PGSHIFT;
+        if (first_stage == true) {
+            if (use_background) {
+                base = get_field(env->bsatp, SATP_PPN) << PGSHIFT;
+                vm = get_field(env->bsatp, SATP_MODE);
+            } else {
+                base = get_field(env->satp, SATP_PPN) << PGSHIFT;
+                vm = get_field(env->satp, SATP_MODE);
+            }
+            widened = 0;
+        } else {
+            base = get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, HGATP_MODE);
+            widened = 2;
+        }
         sum = get_field(env->mstatus, MSTATUS_SUM);
-        vm = get_field(env->satp, SATP_MODE);
         switch (vm) {
         case VM_1_10_SV32:
           levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -320,6 +364,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
           g_assert_not_reached();
         }
     } else {
+        widened = 0;
         base = env->sptbr << PGSHIFT;
         sum = !get_field(env->mstatus, MSTATUS_PUM);
         vm = get_field(env->mstatus, MSTATUS_VM);
@@ -340,7 +385,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     CPUState *cs = CPU(riscv_env_get_cpu(env));
-    int va_bits = PGSHIFT + levels * ptidxbits;
+    int va_bits = PGSHIFT + levels * ptidxbits + widened;
     target_ulong mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
     target_ulong masked_msbs = (addr >> (va_bits - 1)) & mask;
     if (masked_msbs != 0 && masked_msbs != mask) {
@@ -354,11 +399,30 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 restart:
 #endif
     for (i = 0; i < levels; i++, ptshift -= ptidxbits) {
-        target_ulong idx = (addr >> (PGSHIFT + ptshift)) &
+        target_ulong idx;
+        if (i == 0) {
+            idx = (addr >> (PGSHIFT + ptshift)) &
+                           ((1 << (ptidxbits + widened)) - 1);
+        } else {
+            idx = (addr >> (PGSHIFT + ptshift)) &
                            ((1 << ptidxbits) - 1);
+        }
 
         /* check that physical address of PTE is legal */
-        target_ulong pte_addr = base + idx * ptesize;
+        target_ulong pte_addr;
+
+        if (two_stage && first_stage) {
+            hwaddr vbase;
+
+            /* Do the second stage translation on the base PTE address. */
+            get_physical_address(env, &vbase, prot, base, access_type,
+                                 mmu_idx, false, true);
+
+            pte_addr = vbase + idx * ptesize;
+        } else {
+            pte_addr = base + idx * ptesize;
+        }
+
 #if defined(TARGET_RISCV32)
         target_ulong pte = ldl_phys(cs->as, pte_addr);
 #elif defined(TARGET_RISCV64)
@@ -444,7 +508,12 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
+            if (i == 0) {
+                *physical = (ppn | (vpn & ((1L << (ptshift + widened)) - 1))) <<
+                             PGSHIFT;
+            } else {
+                *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
+            }
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-- 
2.21.0


