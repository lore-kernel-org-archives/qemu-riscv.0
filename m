Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la93H-0007f4-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93F-0007bC-Bh; Fri, 23 Apr 2021 23:33:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:34829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93D-0003jo-ER; Fri, 23 Apr 2021 23:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235229; x=1650771229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ygg6H2+uFVvvKu0RbWmEUqUImpa0lHaDJjsFKROC69M=;
 b=DKtfZESEQYjXbUWrQbMvMlxSt7xFrK5SyAfL/asEwuCf3/HaVgTMcFpl
 OzpDIS4fbdWvlycBI4EdIAtGvWiWl0YzOkn5Tw2bPJPinsWUMawfWstQQ
 vJjQpUrDC0QFHWrhktDad6spQMFDQ1flJArtq06i8zb0+SIQuDPvvpnU3
 j3BcQQXoRtsAPxn1DWkjyLE8gxMELCzWedDJrFzrY8qw+D7rYyHcHYgim
 ZxCixqqKGKSr6mBlbkC7mY65L8s3D0S8c0aybGaa4IgVYLFpJj43DP0++
 Tg8IbjyaAgZC7xxlKSrGUgz7+dbT6qsC6zi2xSH6hZK8Tm2r/4oqxRsOU w==;
IronPort-SDR: I1G8/it1wA2RHdJioHKhZFHSYX3h5u5kTsbdzDtldCPqDlupuNo2HyJS/GPvKriNlp89Rh0lUy
 UguUVFGwCENgbUFXThNAw5X6ObAUfqRKzuMx12bS6jya5Z6035fs1pr6jgOc/2dPbgTYbe2awM
 VyOdLAUYeoOdKWRjN/G66s0W4vTOFeHGbcJFX8Zr5DYEnU88E3QAC6MkYPoFTa5r0vD33MbfXv
 51NWnLWyDJDJTQrkr0nYhgrkxZeo9w/HCKq0iDDRxQSNFpyNmuXMSxm4RFvv3WRkU16Arl2/9V
 rQg=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="270020526"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:33:47 +0800
IronPort-SDR: hedmdaGOucElb0kde708lBALBuwZrL+FjEONYpJqvXJbR4WJbwOH8DwmF6sqb0Q635x1+0dePX
 b9T5kwcgQaDUrOhKuCio7RhIhQ6nBNXu5u6K2JwjrXv/lID6XU/RbCoQR2phWSGY66RMm162Xz
 BoAWucw91v327SufvTsgb8QEth5vCzXxNzc+W2OYKP4GCmIifxefRGTLxJSsPyagTRtHX02FVo
 uolvYstvygX3ZfhcFIIGqcRiJsE9b1s53fXtEgSiKYKQfjIC55LP2Rk3aBsH4PYhcjgfMb8lt2
 +FY9lLTC+kU0FcXXwODXEEVt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:12:47 -0700
IronPort-SDR: 0fVAORnQlp9vvwVzWrHYvcR55vh8ykVTALy12C3iMJ3/1PYo1Cs0P2vErwPXGVo9jQeqkVfWfu
 sxDn7+0j3vPosSNaL3xLOdXMhbe+haeGtaj2GpbkredoaFhDvRC/UFrpEkQ/5Siu/zC7YnQOcS
 SoMhXiwF1hUKq3kfQVpJ+PSATEevY5EQOsMpIb+Fi54hWeFrmb9w7UnMCrn0dRws3vltDSNz73
 /cQP8Io79milfituixXPPwj8Hv7SwoS9rBUiCjRQN3m9BvN5LJxd9th4N7VYRW5Slisdp5ljDO
 bcI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Apr 2021 20:33:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 05/10] target/riscv: Remove the hardcoded SATP_MODE macro
Date: Sat, 24 Apr 2021 13:33:31 +1000
Message-Id: <6b701769d6621f45ba1739334198e36a64fe04df.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
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
X-List-Received-Date: Sat, 24 Apr 2021 03:33:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 32 ++++++++++++++++++++++++--------
 target/riscv/csr.c        | 19 +++++++++++++++----
 target/riscv/monitor.c    | 22 +++++++++++++++++-----
 4 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6e30b312f0..d98f3bc8bc 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -432,17 +432,6 @@
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
index d9defbdd34..968cb8046f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -405,11 +405,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
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
@@ -624,14 +634,20 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
 {
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions, vm;
+    uint64_t stap_mode;
+
+    if (riscv_cpu_is_32bit(env)) {
+        stap_mode = SATP32_MODE;
+    } else {
+        stap_mode = SATP64_MODE;
+    }
 
     if (first_stage) {
-        vm = get_field(env->satp, SATP_MODE);
-    } else if (riscv_cpu_is_32bit(env)) {
-        vm = get_field(env->hgatp, SATP32_MODE);
+        vm = get_field(env->satp, stap_mode);
     } else {
-        vm = get_field(env->hgatp, SATP64_MODE);
+        vm = get_field(env->hgatp, stap_mode);
     }
+
     page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
 
     switch (access_type) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e955753441..fe5628fea6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -997,16 +997,27 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    int vm, mask, asid;
+
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
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
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
-            if ((val ^ env->satp) & SATP_ASID) {
+            if (asid) {
                 tlb_flush(env_cpu(env));
             }
             env->satp = val;
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


