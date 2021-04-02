Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ27-0005hF-PP
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ25-0005fN-R8; Fri, 02 Apr 2021 16:04:41 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:3905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ22-0003Sb-GY; Fri, 02 Apr 2021 16:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393878; x=1648929878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EFExi6aUTtKZ4PTrlDdT+lSkosA+eReHet69P4R+W/4=;
 b=JNf/w64kE5IyS1EAKJvnInzNO86rHmEUDGlEGxdS672Ur6yTDEodYKd7
 N8uXbLXT+Dc1zmFlCdouLTS0pzrYWFBuEiEHaE/50DwF5xH+SQ5yYmM/D
 aa/9riXvX1YrrssNSlNSwkTcbU1rdeZetYSsqcCpQ+2ANdoFxiRr+HUDr
 3pTAh+SCiTxSgTl6iTkfkyQWdil8mApXgDuyF58yhVT5NB5f2c/7iPyYp
 9AaLWP24ozJ5nXD/Z0qJa4CRn2IK7WAapxJPNWpzQCn52I/6KJHmIeRc0
 fKo0Npu36V0wPuCxNtcaJPQr/LJarYVHFMhtuaZhuNQhAWklTJEm0r80+ Q==;
IronPort-SDR: 008hFMgMIf2kAN/8JIxT9aQ83gAIygh9TmzoAXIYwuKwf+pKMeLvHeriJsxMit9VsCMHMms28N
 erupZOJWRGbL5gjIXSw/+4mWb80Hg8BnFH4w6tlPpzqfGQWyidVn0d50YFWHrQnvo8+Qv1MbAl
 4GoD5FBrHZf/hcdvNRpvgQHL8Zai8QkcpBP6rHGJlBIDG0UPQaHn4itP2761jO+Si2bvxOT6+z
 pE7Rwd0qmoC0u4MbY21AyF+RvHRVEkgXDznkvZltX3/1MOJ0Fu5cA+nsNiSo/3werZhBcS01kD
 maE=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="168175379"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:36 +0800
IronPort-SDR: HL6HH8zOIbHTkovU3gkhVkzKAZByPM9y7ZYwZJl0gwGwKZ5Zazr4rirCpAlHnXaWShg2/td8J2
 7FtISGAWw+FPx1SrZmdBFxgLcCGI2kyYbLLVJUBYO3jsEk24jRv3w3HAxrQlbMYN4jJaK0wFI8
 SlSXb3KCuqAKiRA3mQZQXGl11n0eZndsLN1MidZYvOmqKhrbB7bDQzkw4xuxZkzzuiZWR4VNuV
 hzgDnqrnyylOQxFQYMF/cFbsITq/iM2jASBlyT9DT+ff7p4XdnVRPD3AgrQqiG7cQkwpyzYppy
 Ej9Y0Q6coJUlXnSm8T4nIxL7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:46:16 -0700
IronPort-SDR: sfsmzfWzFrxF6GuNsUiNABR2jwpkcKqW0bXp9fypVDbWP1mHcBUeFKPXFyyaSJCzNWFH985cWa
 h2UM/31SQ3yR6DsTHB4R71/xOO7bjs+QHlICOjbNwkc5sPzI8Zdpda/01pTS/xeHcYt5N4Rm90
 9HWWZ8TmamyvRHqIMgHO4N1Uf8cNjL1vgyJN1oIj66LtpjwNxO2SaZVYGaTK7Hmx81ImVTHoa8
 zkkGVL4QNtx62tLvqkx3nbO7dvKSe6OLMovryFdED0gemtaS9ZDHHYefQiOkl7Z2KDFMF3L7lS
 bIw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 13:04:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 5/8] target/riscv: Remove the hardcoded SATP_MODE macro
Date: Fri,  2 Apr 2021 16:02:40 -0400
Message-Id: <c2a0653687bea5e932747e301112ea0507169385.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:42 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 30 +++++++++++++++++++++++-------
 target/riscv/csr.c        | 33 ++++++++++++++++++++++++---------
 target/riscv/monitor.c    | 22 +++++++++++++++++-----
 4 files changed, 64 insertions(+), 32 deletions(-)

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
index 6446af5de0..7ae9352d80 100644
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
@@ -622,9 +632,15 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions;
     if (first_stage) {
-        page_fault_exceptions =
-            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        if (riscv_cpu_is_32bit(env)) {
+            page_fault_exceptions =
+                get_field(env->satp, SATP32_MODE) != VM_1_10_MBARE &&
+                !pmp_violation;
+        } else {
+            page_fault_exceptions =
+                get_field(env->satp, SATP64_MODE) != VM_1_10_MBARE &&
+                !pmp_violation;
+        }
     } else {
         if (riscv_cpu_is_32bit(env)) {
             page_fault_exceptions =
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6052b2d6e9..b0ebaa029e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -930,16 +930,31 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return 0;
     }
-    if (validate_vm(env, get_field(val, SATP_MODE)) &&
-        ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
-    {
-        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-            return -RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            if ((val ^ env->satp) & SATP_ASID) {
-                tlb_flush(env_cpu(env));
+    if (riscv_cpu_is_32bit(env)) {
+        if (validate_vm(env, get_field(val, SATP32_MODE)) &&
+            ((val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN)))
+        {
+            if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+                return -RISCV_EXCP_ILLEGAL_INST;
+            } else {
+                if ((val ^ env->satp) & SATP32_ASID) {
+                    tlb_flush(env_cpu(env));
+                }
+                env->satp = val;
+            }
+        }
+    } else {
+        if (validate_vm(env, get_field(val, SATP64_MODE)) &&
+            ((val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN)))
+        {
+            if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+                return -RISCV_EXCP_ILLEGAL_INST;
+            } else {
+                if ((val ^ env->satp) & SATP64_ASID) {
+                    tlb_flush(env_cpu(env));
+                }
+                env->satp = val;
             }
-            env->satp = val;
         }
     }
     return 0;
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
2.31.0


