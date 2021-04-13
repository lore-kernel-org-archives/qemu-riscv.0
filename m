Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSYK-0007pf-Cl
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYE-0007lC-7L; Tue, 13 Apr 2021 19:34:34 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYB-0004MQ-Gm; Tue, 13 Apr 2021 19:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356873; x=1649892873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+RiucRtPdXKOzS7snl5iFqslDJ3MG0do01OpedL8TI=;
 b=ibs8biC9HAXvHnbrvdHYHuFbD3r2gXztqach8lNp6tdpmY3ub3aXvb81
 Q91tupVRHmLdpNeybhWG/OVZElLWMXYqFrSRXwyy2QTuagqu6qjdCQ+JK
 6VjlopjuK4i3vmjCUsfrK38GDP7X7lCOD7geA2BWIEN+N/fz+chaFVd9V
 KA9+wco5rSt2Atx2yHOCdC00ESWhA2/lml2Mb/hXE6tOA451sM1c7T474
 mZJF/rUn9Z7A2REJKNrC9pThAzaXUJ2fpfnqPkdnBGzqfVOs7d9kEd9YE
 O+EUp8qLp3GbbN8MPX9WrngHk/3foqIK5NaHjH6zw3twQqgp80v5loEku Q==;
IronPort-SDR: 2xFPZGxpl1GooiUOKUiilWcBUbf3LAY5Y4x1MrhDUow2NVr2Nzp3J0KJP6axCbwd3VmYQ6UII0
 /RqK5p9M0Gnpwshj+KrEICpDDx4CNbWStBBRJZKJ29lIs65BsxPkIHXXCkyLPCFiFw06DZ1IPm
 SHWYrBqKiVQ8vlq6vT96sNOfHyoChD0iEJel314Bq2ZIiWcHaZLH/cALtbbU9NQOyef68Z4Tzu
 rJ9rnla16rqHJKWANN3gHog+LO73hW5ASm99BtLqjNg1OaPH13DhZhlVWUIFiL8LgyyMzsvOic
 cHI=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="268875907"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:34:07 +0800
IronPort-SDR: vddf2xaBfWuKbgB9+cFhOP62XaTaBF+yyBMA2If9ypbRZBKiuH3meD2ORulmBS7pIBMNrT4taR
 HL3d13aJobiohrFUo78GxSLwW3KURNldsLRRjCU/4UaVb6jtm4lU/AC1qd2oIsmwxYr40Z8yNB
 o2MlqTSSe43KqawsCGoxfsbtBrmISZJVpOzoy61VyENamiiXM5WSsqyeJbp09o3QGVxaRy4BlX
 BGlH9Mp29iKmOeJL98vYjJAIhw6ESvDOsTjZlTUZOhZQD76ENnELmeKO8aqvVhdubG7TqTXIJq
 Kq+KTK6h53CluvWcunMltSMf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:15:09 -0700
IronPort-SDR: lKt1/3KetQ9XzB7RgkY8bzLoLFxkQ8vedY2u5++dUNfkwHkpykZRUNiIRvSk1QLOkIQmRBnqs8
 7yV0gBHgMtOtP3TQpOsAdc8EYJkxQlvY2EDXs+Q2MLrMtoUEi4rSkTWd2wdOJY4x2YUnSaRbNy
 RamWcYb1JB7zYqDW1KY57UqgQm0fngrzZpZZbn4F5sOeORazxuqgWk0hzgEt/x2d/CmLxRd24s
 vnPxq36pR0ptlM0f86Q2Z87yvEfJNydVxbED9jW1IZ4jGs3eATYchb2GwXIXNPzFWvih2PVjhC
 gNw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:34:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 5/9] target/riscv: Remove the hardcoded SATP_MODE macro
Date: Wed, 14 Apr 2021 09:34:02 +1000
Message-Id: <ef02611060de1a918f148fef5773a68d336afc16.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:34:36 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
 target/riscv/csr.c        | 20 ++++++++++++++++----
 target/riscv/monitor.c    | 22 +++++++++++++++++-----
 4 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index dd643d0f63..6a816ce9c2 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -452,17 +452,6 @@
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
-#if defined(TARGET_RISCV32)
-#define SATP_MODE           SATP32_MODE
-#define SATP_ASID           SATP32_ASID
-#define SATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define SATP_MODE           SATP64_MODE
-#define SATP_ASID           SATP64_ASID
-#define SATP_PPN            SATP64_PPN
-#endif
-
 /* VM modes (mstatus.vm) privileged ISA 1.9.1 */
 #define VM_1_09_MBARE       0
 #define VM_1_09_MBB         1
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b065ddb681..e5e9339458 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -403,11 +403,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (first_stage == true) {
         if (use_background) {
-            base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
-            vm = get_field(env->vsatp, SATP_MODE);
+            if (riscv_cpu_is_32bit(env)) {
+                base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
+                vm = get_field(env->vsatp, SATP32_MODE);
+            } else {
+                base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
+                vm = get_field(env->vsatp, SATP64_MODE);
+            }
         } else {
-            base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
-            vm = get_field(env->satp, SATP_MODE);
+            if (riscv_cpu_is_32bit(env)) {
+                base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
+                vm = get_field(env->satp, SATP32_MODE);
+            } else {
+                base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
+                vm = get_field(env->satp, SATP64_MODE);
+            }
         }
         widened = 0;
     } else {
@@ -622,8 +632,10 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions, vm;
 
-    if (first_stage) {
-        vm = get_field(env->satp, SATP_MODE);
+    if (first_stage && riscv_cpu_is_32bit(env)) {
+        vm = get_field(env->satp, SATP32_MODE);
+    } else if (first_stage) {
+        vm = get_field(env->satp, SATP64_MODE);
     } else if (riscv_cpu_is_32bit(env)) {
         vm = get_field(env->hgatp, SATP32_MODE);
     } else {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6052b2d6e9..8abfe33b29 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -927,21 +927,33 @@ static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
 {
+    int vm, mask, asid;
+
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return 0;
     }
-    if (validate_vm(env, get_field(val, SATP_MODE)) &&
-        ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
-    {
+
+    if (riscv_cpu_is_32bit(env)) {
+        vm = validate_vm(env, get_field(val, SATP32_MODE));
+        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
+        asid = (val ^ env->satp) & SATP32_ASID;
+    } else {
+        vm = validate_vm(env, get_field(val, SATP64_MODE));
+        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
+        asid = (val ^ env->satp) & SATP64_ASID;
+    }
+
+    if (vm && mask) {
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return -RISCV_EXCP_ILLEGAL_INST;
         } else {
-            if ((val ^ env->satp) & SATP_ASID) {
+            if (asid) {
                 tlb_flush(env_cpu(env));
             }
             env->satp = val;
         }
     }
+
     return 0;
 }
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index e51188f919..f7e6ea72b3 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -150,9 +150,14 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     target_ulong last_size;
     int last_attr;
 
-    base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
+    if (riscv_cpu_is_32bit(env)) {
+        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
+        vm = get_field(env->satp, SATP32_MODE);
+    } else {
+        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
+        vm = get_field(env->satp, SATP64_MODE);
+    }
 
-    vm = get_field(env->satp, SATP_MODE);
     switch (vm) {
     case VM_1_10_SV32:
         levels = 2;
@@ -215,9 +220,16 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!(env->satp & SATP_MODE)) {
-        monitor_printf(mon, "No translation or protection\n");
-        return;
+    if (riscv_cpu_is_32bit(env)) {
+        if (!(env->satp & SATP32_MODE)) {
+            monitor_printf(mon, "No translation or protection\n");
+            return;
+        }
+    } else {
+        if (!(env->satp & SATP64_MODE)) {
+            monitor_printf(mon, "No translation or protection\n");
+            return;
+        }
     }
 
     mem_info_svxx(mon, env);
-- 
2.31.1


