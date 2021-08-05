Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBhc4-0007eP-IL
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhc3-0007df-C1; Thu, 05 Aug 2021 13:56:59 -0400
Received: from exmail.andestech.com ([60.248.187.195]:33388
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhbz-0007r5-Ui; Thu, 05 Aug 2021 13:56:58 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 175HuZhD055945;
 Fri, 6 Aug 2021 01:56:35 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 6 Aug 2021 01:56:37 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <ruinland@andestech.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, Dylan Jhong <dylan@andestech.com>
Subject: [RFC PATCH v4 2/4] Adding basic custom/vendor CSR handling mechanism
Date: Fri, 6 Aug 2021 01:56:24 +0800
Message-ID: <20210805175626.11573-3-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210805175626.11573-1-ruinland@andestech.com>
References: <20210805175626.11573-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 175HuZhD055945
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Aug 2021 17:56:59 -0000

From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>

For now we add a custom CSR handling mechanism to handle non-standard CSR read
or write.

The write_stub() and read_zero() are provided for quick placeholder usage if
such CSRs' behavior are expected to fail-over in its user code.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 target/riscv/cpu.c             | 23 ++++++++++
 target/riscv/cpu.h             | 31 ++++++++++++-
 target/riscv/cpu_bits.h        |  4 ++
 target/riscv/csr.c             | 83 ++++++++++++++++++++++++++++------
 target/riscv/custom_cpu_bits.h |  8 ++++
 5 files changed, 134 insertions(+), 15 deletions(-)
 create mode 100644 target/riscv/custom_cpu_bits.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7401325..3a638b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -144,6 +144,29 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 #endif
 }
 
+#if defined(CONFIG_RISCV_CUSTOM)
+static void setup_custom_csr(CPURISCVState *env,
+                             riscv_custom_csr_operations csr_map_struct[]
+                             ) {
+
+    env->custom_csr_map = g_hash_table_new_full(g_direct_hash, \
+                                                g_direct_equal, \
+                                                NULL, NULL);
+
+
+    int i;
+    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
+        if (csr_map_struct[i].csrno != 0) {
+            g_hash_table_insert(env->custom_csr_map,
+                GINT_TO_POINTER(csr_map_struct[i].csrno),
+                &csr_map_struct[i].csr_opset);
+        } else {
+            break;
+        }
+    }
+}
+#endif
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb282..52df9bb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -239,6 +239,16 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    /*
+     * The reason why we have an opset map for custom CSRs and a seperated
+     * storage map is that we might have heterogeneous architecture, in which
+     * different harts have different custom CSRs.
+     * Custom CSR opset map
+     */
+    GHashTable *custom_csr_map;
+    /* Custom CSR val holder */
+    void *custom_csr_val;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
@@ -485,17 +495,36 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+typedef struct {
+    int csrno;
+    riscv_csr_operations csr_opset;
+    } riscv_custom_csr_operations;
+
+/*
+ * The reason why we have an abstraction here is that : We could have CSR
+ * number M on hart A is an alias of CSR number N on hart B. So we make a
+ * CSR number to value address map.
+ */
+typedef struct  {
+    int csrno;
+    target_ulong val;
+    } riscv_custom_csr_vals;
+
 /* CSR function table constants */
 enum {
-    CSR_TABLE_SIZE = 0x1000
+    CSR_TABLE_SIZE = 0x1000,
+    MAX_CUSTOM_CSR_NUM = 100
 };
 
 /* CSR function table */
+extern int andes_custom_csr_size;
+extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM];
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599..de77242 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -593,3 +593,7 @@
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
 #endif
+
+#if defined(CONFIG_RISCV_CUSTOM)
+#include "custom_cpu_bits.h"
+#endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e636..1c4dc94 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -137,7 +137,8 @@ static int ctr32(CPURISCVState *env, int csrno)
     return ctr(env, csrno);
 }
 
-#if !defined(CONFIG_USER_ONLY)
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-function"
 static int any(CPURISCVState *env, int csrno)
 {
     return 0;
@@ -152,6 +153,25 @@ static int any32(CPURISCVState *env, int csrno)
     return any(env, csrno);
 
 }
+#pragma GCC diagnostic pop
+
+/* Machine Information Registers */
+static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return *val = 0;
+}
+
+/*
+ * XXX: This is just a write stub for developing custom CSR handler,
+ * if the behavior of writting such CSR is not presentable in QEMU and doesn't
+ * affect the functionality, just stub it.
+ */
+static int write_stub(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return 0;
+}
+
+#if !defined(CONFIG_USER_ONLY)
 
 static int smode(CPURISCVState *env, int csrno)
 {
@@ -435,11 +455,6 @@ static const char valid_vm_1_10_64[16] = {
     [VM_1_10_SV57] = 1
 };
 
-/* Machine Information Registers */
-static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    return *val = 0;
-}
 
 static int read_mhartid(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1264,6 +1279,18 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
 
 #endif
 
+
+#if defined(CONFIG_RISCV_CUSTOM)
+/* Custom CSR related routines and data structures */
+
+static gpointer is_custom_csr(CPURISCVState *env, int csrno)
+{
+    gpointer ret;
+    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
+    return ret;
+}
+#endif
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -1273,12 +1300,19 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
+
+
 int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
                 target_ulong new_value, target_ulong write_mask)
 {
     int ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
+    #if !defined(CONFIG_RISCV_CUSTOM)
+    riscv_csr_operations *csrop = &csr_ops[csrno];
+    #else
+    riscv_csr_operations *csrop;
+    #endif
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
@@ -1300,6 +1334,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
+
 #endif
 
     /* ensure the CSR extension is enabled. */
@@ -1307,27 +1342,43 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* try handle_custom_csr */
+
+    #if defined(CONFIG_RISCV_CUSTOM)
+    if (unlikely(env->custom_csr_map != NULL)) {
+        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
+            is_custom_csr(env, csrno);
+        if (NULL != custom_csr_opset) {
+            csrop = custom_csr_opset;
+            } else {
+            csrop = &csr_ops[csrno];
+            }
+        } else {
+        csrop = &csr_ops[csrno];
+        }
+    #endif
+
     /* check predicate */
-    if (!csr_ops[csrno].predicate) {
+    if (!csrop->predicate) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    ret = csr_ops[csrno].predicate(env, csrno);
+    ret = csrop->predicate(env, csrno);
     if (ret < 0) {
         return ret;
     }
 
     /* execute combined read/write operation if it exists */
-    if (csr_ops[csrno].op) {
-        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+    if (csrop->op) {
+        return csrop->op(env, csrno, ret_value, new_value, write_mask);
     }
 
     /* if no accessor exists then return failure */
-    if (!csr_ops[csrno].read) {
+    if (!csrop->read) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
     /* read old value */
-    ret = csr_ops[csrno].read(env, csrno, &old_value);
+    ret = csrop->read(env, csrno, &old_value);
     if (ret < 0) {
         return ret;
     }
@@ -1335,8 +1386,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     /* write value if writable and write mask set, otherwise drop writes */
     if (write_mask) {
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
-        if (csr_ops[csrno].write) {
-            ret = csr_ops[csrno].write(env, csrno, new_value);
+        if (csrop->write) {
+            ret = csrop->write(env, csrno, new_value);
             if (ret < 0) {
                 return ret;
             }
@@ -1369,6 +1420,10 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
+#if defined(CONFIG_RISCV_CUSTOM)
+/* Include the custom CSR table here. */
+#endif
+
 /* Control and Status Register function table */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
diff --git a/target/riscv/custom_cpu_bits.h b/target/riscv/custom_cpu_bits.h
new file mode 100644
index 0000000..5df31f8
--- /dev/null
+++ b/target/riscv/custom_cpu_bits.h
@@ -0,0 +1,8 @@
+/*
+ * RISC-V cpu bits for custom CSR logic.
+ *
+ * Copyright (c) 2021 Andes Technology Corp.
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+/* This file is intentionally left blank at this commit. */
-- 
2.32.0


