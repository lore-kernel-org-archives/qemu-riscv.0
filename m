Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZlt-00080k-3k
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZll-0007tu-AQ; Thu, 21 Oct 2021 11:14:13 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:24330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZli-0007Ci-87; Thu, 21 Oct 2021 11:14:13 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFDMSV088710;
 Thu, 21 Oct 2021 23:13:22 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:13:22 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v5 2/3] riscv: Introduce custom CSR hooks to riscv_csrrw()
Date: Thu, 21 Oct 2021 23:09:20 +0800
Message-ID: <20211021150921.721630-3-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021150921.721630-1-ruinland@andestech.com>
References: <20211021150921.721630-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFDMSV088710
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 15:14:13 -0000

riscv_csrrw() will be called by CSR handling helpers, which is the
most suitable place for checking wheter a custom CSR is being accessed.

If we're touching a custom CSR, invoke the registered handlers.

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c             | 19 +++++++++++++++++
 target/riscv/cpu.h             | 13 +++++++++++-
 target/riscv/csr.c             | 38 +++++++++++++++++++++++++++-------
 target/riscv/custom_csr_defs.h |  7 +++++++
 4 files changed, 68 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/custom_csr_defs.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c93b7edd7..a72fd32f01 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,9 @@
 
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
+GHashTable *custom_csr_map = NULL;
+#include "custom_csr_defs.h"
+
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -149,6 +152,22 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 #endif
 }
 
+static void setup_custom_csr(CPURISCVState *env,
+                             riscv_custom_csr_operations csr_map_struct[])
+{
+    int i;
+    env->custom_csr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
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
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3bef0d1265..012be10d0a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -245,6 +245,11 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    /* Custom CSR opset table per hart */
+    GHashTable *custom_csr_map;                                         
+    /* Custom CSR value holder per hart */                                         
+    void *custom_csr_val;        
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
@@ -496,9 +501,15 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+typedef struct {
+    int csrno;
+    riscv_csr_operations csr_opset;
+} riscv_custom_csr_operations;
+
 /* CSR function table constants */
 enum {
-    CSR_TABLE_SIZE = 0x1000
+    CSR_TABLE_SIZE = 0x1000,
+    MAX_CUSTOM_CSR_NUM = 100
 };
 
 /* CSR function table */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd3216..1048ee3b44 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1403,6 +1403,14 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
 
 #endif
 
+/* Custom CSR related routines */
+static gpointer find_custom_csr(CPURISCVState *env, int csrno)
+{
+    gpointer ret;
+    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
+    return ret;
+}
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -1419,6 +1427,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     RISCVException ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
+    riscv_csr_operations *csr_op;
     int read_only = get_field(csrno, 0xC00) == 3;
 
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
@@ -1449,26 +1458,39 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* try to handle_custom_csr */
+    if (unlikely(env->custom_csr_map != NULL)) {
+        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
+            find_custom_csr(env, csrno);
+        if (custom_csr_opset != NULL) {
+            csr_op = custom_csr_opset;
+            } else {
+            csr_op = &csr_ops[csrno];
+            }
+        } else {
+        csr_op = &csr_ops[csrno];
+        }
+
     /* check predicate */
-    if (!csr_ops[csrno].predicate) {
+    if (!csr_op->predicate) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    ret = csr_ops[csrno].predicate(env, csrno);
+    ret = csr_op->predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
     /* execute combined read/write operation if it exists */
-    if (csr_ops[csrno].op) {
-        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
+    if (csr_op->op) {
+        return csr_op->op(env, csrno, ret_value, new_value, write_mask);
     }
 
     /* if no accessor exists then return failure */
-    if (!csr_ops[csrno].read) {
+    if (!csr_op->read) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
     /* read old value */
-    ret = csr_ops[csrno].read(env, csrno, &old_value);
+    ret = csr_op->read(env, csrno, &old_value);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
@@ -1476,8 +1498,8 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     /* write value if writable and write mask set, otherwise drop writes */
     if (write_mask) {
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
-        if (csr_ops[csrno].write) {
-            ret = csr_ops[csrno].write(env, csrno, new_value);
+        if (csr_op->write) {
+            ret = csr_op->write(env, csrno, new_value);
             if (ret != RISCV_EXCP_NONE) {
                 return ret;
             }
diff --git a/target/riscv/custom_csr_defs.h b/target/riscv/custom_csr_defs.h
new file mode 100644
index 0000000000..4dbf8cf1fd
--- /dev/null
+++ b/target/riscv/custom_csr_defs.h
@@ -0,0 +1,7 @@
+/* 
+ * Copyright (c) 2021 Andes Technology Corp.
+ * SPDX-License-Identifier: GPL-2.0+
+ * Custom CSR variables provided by <cpu_model_name>_csr.c
+ */
+
+/* Left blank purposely in this commit. */
-- 
2.25.1


