Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrLvZ-0004md-RI
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 10:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvY-0004jC-9w; Thu, 10 Jun 2021 10:45:00 -0400
Received: from exmail.andestech.com ([60.248.187.195]:42454
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvU-0000J8-HW; Thu, 10 Jun 2021 10:45:00 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 15AEibAV035895;
 Thu, 10 Jun 2021 22:44:37 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 10 Jun 2021
 22:44:38 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, <alankao@andestech.com>,
 <dylan@andestech.com>, Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>
Subject: [RFC PATCH v3 2/2] Adding preliminary custom/vendor CSR handling
 mechanism
Date: Thu, 10 Jun 2021 22:44:24 +0800
Message-ID: <20210610144424.8658-3-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210610144424.8658-1-ruinland@andestech.com>
References: <20210610144424.8658-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 15AEibAV035895
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
X-List-Received-Date: Thu, 10 Jun 2021 14:45:00 -0000

From: Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>

For now we add a custom CSR handling mechanism to handle non-standard CSR read
or write.

The write_stub() and read_zero() are provided for quick placeholder usage if
such CSRs' behavior are expected to fail-over in its user code.

For demonstration, we modify Andes Technology AX25 to showcase how the such
mechanism works and how the UITB and MMSC_CFG CSR could be emulated.
---
 target/riscv/andes_cpu_bits.h  | 113 ++++++++++++++++++++++++
 target/riscv/cpu.c             |  29 +++++++
 target/riscv/cpu.h             |  20 ++++-
 target/riscv/cpu_bits.h        |   3 +
 target/riscv/csr.c             |  46 ++++++++--
 target/riscv/csr_andes.inc.c   | 153 +++++++++++++++++++++++++++++++++
 target/riscv/custom_cpu_bits.h |   3 +
 7 files changed, 358 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/andes_cpu_bits.h
 create mode 100644 target/riscv/csr_andes.inc.c
 create mode 100644 target/riscv/custom_cpu_bits.h

diff --git a/target/riscv/andes_cpu_bits.h b/target/riscv/andes_cpu_bits.h
new file mode 100644
index 0000000000..8dee58a2c2
--- /dev/null
+++ b/target/riscv/andes_cpu_bits.h
@@ -0,0 +1,113 @@
+/* ========= AndeStar V5 machine mode CSRs ========= */
+/* Configuration Registers */
+#define CSR_MICM_CFG            0xfc0
+#define CSR_MDCM_CFG            0xfc1
+#define CSR_MMSC_CFG            0xfc2
+#define CSR_MMSC_CFG2           0xfc3
+#define CSR_MVEC_CFG            0xfc7
+
+/* Crash Debug CSRs */
+#define CSR_MCRASH_STATESAVE    0xfc8
+#define CSR_MSTATUS_CRASHSAVE   0xfc9
+
+/* Memory CSRs */
+#define CSR_MILMB               0x7c0
+#define CSR_MDLMB               0x7c1
+#define CSR_MECC_CODE           0x7C2
+#define CSR_MNVEC               0x7c3
+#define CSR_MCACHE_CTL          0x7ca
+#define CSR_MCCTLBEGINADDR      0x7cb
+#define CSR_MCCTLCOMMAND        0x7cc
+#define CSR_MCCTLDATA           0x7cd
+#define CSR_MPPIB               0x7f0
+#define CSR_MFIOB               0x7f1
+
+/* Hardware Stack Protection & Recording */
+#define CSR_MHSP_CTL            0x7c6
+#define CSR_MSP_BOUND           0x7c7
+#define CSR_MSP_BASE            0x7c8
+#define CSR_MXSTATUS            0x7c4
+#define CSR_MDCAUSE             0x7c9
+#define CSR_MSLIDELEG           0x7d5
+#define CSR_MSAVESTATUS         0x7d6
+#define CSR_MSAVEEPC1           0x7d7
+#define CSR_MSAVECAUSE1         0x7d8
+#define CSR_MSAVEEPC2           0x7d9
+#define CSR_MSAVECAUSE2         0x7da
+#define CSR_MSAVEDCAUSE1        0x7db
+#define CSR_MSAVEDCAUSE2        0x7dc
+
+/* Control CSRs */
+#define CSR_MPFT_CTL            0x7c5
+#define CSR_MMISC_CTL           0x7d0
+#define CSR_MCLK_CTL            0x7df
+
+/* Counter related CSRs */
+#define CSR_MCOUNTERWEN         0x7ce
+#define CSR_MCOUNTERINTEN       0x7cf
+#define CSR_MCOUNTERMASK_M      0x7d1
+#define CSR_MCOUNTERMASK_S      0x7d2
+#define CSR_MCOUNTERMASK_U      0x7d3
+#define CSR_MCOUNTEROVF         0x7d4
+
+/* Enhanced CLIC CSRs */
+#define CSR_MIRQ_ENTRY          0x7ec
+#define CSR_MINTSEL_JAL         0x7ed
+#define CSR_PUSHMCAUSE          0x7ee
+#define CSR_PUSHMEPC            0x7ef
+#define CSR_PUSHMXSTATUS        0x7eb
+
+/* Andes Physical Memory Attribute(PMA) CSRs */
+#define CSR_PMACFG0             0xbc0
+#define CSR_PMACFG1             0xbc1
+#define CSR_PMACFG2             0xbc2
+#define CSR_PMACFG3             0xbc3
+#define CSR_PMAADDR0            0xbd0
+#define CSR_PMAADDR1            0xbd1
+#define CSR_PMAADDR2            0xbd2
+#define CSR_PMAADDR3            0xbd2
+#define CSR_PMAADDR4            0xbd4
+#define CSR_PMAADDR5            0xbd5
+#define CSR_PMAADDR6            0xbd6
+#define CSR_PMAADDR7            0xbd7
+#define CSR_PMAADDR8            0xbd8
+#define CSR_PMAADDR9            0xbd9
+#define CSR_PMAADDR10           0xbda
+#define CSR_PMAADDR11           0xbdb
+#define CSR_PMAADDR12           0xbdc
+#define CSR_PMAADDR13           0xbdd
+#define CSR_PMAADDR14           0xbde
+#define CSR_PMAADDR15           0xbdf
+
+/* ========= AndeStar V5 supervisor mode CSRs ========= */
+/* Supervisor trap registers */
+#define CSR_SLIE                0x9c4
+#define CSR_SLIP                0x9c5
+#define CSR_SDCAUSE             0x9c9
+
+/* Supervisor counter registers */
+#define CSR_SCOUNTERINTEN       0x9cf
+#define CSR_SCOUNTERMASK_M      0x9d1
+#define CSR_SCOUNTERMASK_S      0x9d2
+#define CSR_SCOUNTERMASK_U      0x9d3
+#define CSR_SCOUNTEROVF         0x9d4
+#define CSR_SCOUNTINHIBIT       0x9e0
+#define CSR_SHPMEVENT3          0x9e3
+#define CSR_SHPMEVENT4          0x9e4
+#define CSR_SHPMEVENT5          0x9e5
+#define CSR_SHPMEVENT6          0x9e6
+
+/* Supervisor control registers */
+#define CSR_SCCTLDATA           0x9cd
+#define CSR_SMISC_CTL           0x9d0
+
+/* ========= AndeStar V5 user mode CSRs ========= */
+/* User mode control registers */
+#define CSR_UITB                0x800
+#define CSR_UCODE               0x801
+#define CSR_UDCAUSE             0x809
+#define CSR_UCCTLBEGINADDR      0x80b
+#define CSR_UCCTLCOMMAND        0x80c
+#define CSR_WFE                 0x810
+#define CSR_SLEEPVALUE          0x811
+#define CSR_TXEVT               0x812
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4ae21cbf9b..460839d006 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -144,6 +144,30 @@ static void set_resetvec(CPURISCVState *env, int resetvec)
 #endif
 }
 
+#if defined(TARGET_RISCV64)
+// Currently we only have ax25 using this function, to ease Wunused-function,
+// we put it in TARGET_RISCV64.
+static void setup_custom_csr(CPURISCVState *env,
+                             riscv_custom_csr_operations csr_map_struct[]
+                             ) {
+
+    env->custom_csr_map = g_hash_table_new_full(
+        g_direct_hash, g_direct_equal, NULL, NULL);
+
+    int i;
+
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
@@ -164,6 +188,11 @@ static void ax25_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+
+    /* setup custom csr handler hash table */
+    setup_custom_csr(env, andes_custom_csr_table);
+    env->custom_csr_val = g_malloc(andes_custom_csr_size);
+
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bff9af7f3f..231505f403 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -112,6 +112,7 @@ FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
@@ -240,6 +241,14 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    // The reason why we have an opset map for custom CSRs and a seperated
+    // storage map is that we might have heterogeneous architecture, in which
+    // different harts have different custom CSRs.
+    /* Custom CSR opset map */
+    GHashTable *custom_csr_map;
+    /* Custom CSR val holder */
+    void *custom_csr_val;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
@@ -486,17 +495,26 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+typedef struct {
+    int csrno;
+    riscv_csr_operations csr_opset;
+    } riscv_custom_csr_operations;
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
index caf4599207..e8dfebd1b0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -259,6 +259,7 @@
 #define CSR_TDATA1          0x7a1
 #define CSR_TDATA2          0x7a2
 #define CSR_TDATA3          0x7a3
+#define CSR_TINFO           0x7a4
 
 /* Debug Mode Registers */
 #define CSR_DCSR            0x7b0
@@ -593,3 +594,5 @@
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
 #endif
+
+#include "custom_cpu_bits.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f3..6ea2b5e4b0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -523,6 +523,14 @@ static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+
+// XXX: This is just a write stub for developing custom CSR handler,
+// if the behavior of writting such CSR is not presentable in QEMU and doesn't
+// affect the functionality, just stub it.
+static int write_stub(CPURISCVState *env, int csrno, target_ulong val) {
+    return 0;
+}
+
 static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
 {
     if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
@@ -1264,6 +1272,15 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
 
 #endif
 
+
+/* Custom CSR related routines and data structures */
+
+static gpointer is_custom_csr(CPURISCVState *env, int csrno) {
+    gpointer ret;
+    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
+    return ret;
+    }
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -1279,6 +1296,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     int ret;
     target_ulong old_value;
     RISCVCPU *cpu = env_archcpu(env);
+    riscv_csr_operations *csrop;
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
@@ -1307,27 +1325,37 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* try handle_custom_csr */
+    riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
+        is_custom_csr(env, csrno);
+    if(NULL != custom_csr_opset) {
+        csrop = custom_csr_opset;
+        }
+    else {
+        csrop = &csr_ops[csrno];
+        }
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
@@ -1335,8 +1363,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
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
@@ -1369,6 +1397,8 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
+#include "csr_andes.inc.c"
+
 /* Control and Status Register function table */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
diff --git a/target/riscv/csr_andes.inc.c b/target/riscv/csr_andes.inc.c
new file mode 100644
index 0000000000..6af7c91096
--- /dev/null
+++ b/target/riscv/csr_andes.inc.c
@@ -0,0 +1,153 @@
+/* Andes Custom Registers */
+
+struct andes_csr_val {
+    target_long uitb;
+};
+
+int andes_custom_csr_size = sizeof(struct andes_csr_val);
+
+static int write_uitb(CPURISCVState *env, int csrno, target_ulong val) {
+    struct andes_csr_val *andes_csr = env->custom_csr_val;
+    andes_csr->uitb = val;
+    return 0;
+}
+
+static int read_uitb(CPURISCVState *env, int csrno, target_ulong *val) {
+    struct andes_csr_val *andes_csr = env->custom_csr_val;
+    *val = andes_csr->uitb;
+    return 0;
+}
+
+static int read_mmsc_cfg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    /* enable pma probe */
+    *val = 0x40000000;
+    return 0;
+}
+
+riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] = {
+#if !defined(CONFIG_USER_ONLY)
+    /* ==================== AndeStar V5 machine mode CSRs ==================== */
+    /* Configuration Registers */
+    {CSR_MICM_CFG,         { "micm_cfg",          any, read_zero, write_stub} },
+    {CSR_MDCM_CFG,         { "mdcm_cfg",          any, read_zero, write_stub} },
+    {CSR_MMSC_CFG,         { "mmsc_cfg",          any, read_mmsc_cfg, write_stub} },
+    {CSR_MMSC_CFG2,        { "mmsc_cfg2",         any, read_zero, write_stub} },
+    {CSR_MVEC_CFG,         { "mvec_cfg",          any, read_zero, write_stub} },
+
+    /* Crash Debug CSRs */
+    {CSR_MCRASH_STATESAVE,  { "mcrash_statesave",  any, read_zero, write_stub} },
+    {CSR_MSTATUS_CRASHSAVE, { "mstatus_crashsave", any, read_zero, write_stub} },
+
+    /* Memory CSRs */
+    {CSR_MILMB,            { "milmb",             any, read_zero, write_stub} },
+    {CSR_MDLMB,            { "mdlmb",             any, read_zero, write_stub} },
+    {CSR_MECC_CODE,        { "mecc_code",         any, read_zero, write_stub} },
+    {CSR_MNVEC,            { "mnvec",             any, read_zero, write_stub} },
+    {CSR_MCACHE_CTL,       { "mcache_ctl",        any, read_zero, write_stub} },
+    {CSR_MCCTLBEGINADDR,   { "mcctlbeginaddr",    any, read_zero, write_stub} },
+    {CSR_MCCTLCOMMAND,     { "mcctlcommand",      any, read_zero, write_stub} },
+    {CSR_MCCTLDATA,        { "mcctldata",         any, read_zero, write_stub} },
+    {CSR_MPPIB,            { "mppib",             any, read_zero, write_stub} },
+    {CSR_MFIOB,            { "mfiob",             any, read_zero, write_stub} },
+
+    /* Hardware Stack Protection & Recording */
+    {CSR_MHSP_CTL,         { "mhsp_ctl",          any, read_zero, write_stub} },
+    {CSR_MSP_BOUND,        { "msp_bound",         any, read_zero, write_stub} },
+    {CSR_MSP_BASE,         { "msp_base",          any, read_zero, write_stub} },
+    {CSR_MXSTATUS,         { "mxstatus",          any, read_zero, write_stub} },
+    {CSR_MDCAUSE,          { "mdcause",           any, read_zero, write_stub} },
+    {CSR_MSLIDELEG,        { "mslideleg",         any, read_zero, write_stub} },
+    {CSR_MSAVESTATUS,      { "msavestatus",       any, read_zero, write_stub} },
+    {CSR_MSAVEEPC1,        { "msaveepc1",         any, read_zero, write_stub} },
+    {CSR_MSAVECAUSE1,      { "msavecause1",       any, read_zero, write_stub} },
+    {CSR_MSAVEEPC2,        { "msaveepc2",         any, read_zero, write_stub} },
+    {CSR_MSAVECAUSE2,      { "msavecause2",       any, read_zero, write_stub} },
+    {CSR_MSAVEDCAUSE1,     { "msavedcause1",      any, read_zero, write_stub} },
+    {CSR_MSAVEDCAUSE2,     { "msavedcause2",      any, read_zero, write_stub} },
+
+    /* Control CSRs */
+    {CSR_MPFT_CTL,         { "mpft_ctl",          any, read_zero, write_stub} },
+    {CSR_MMISC_CTL,        { "mmisc_ctl",         any, read_zero, write_stub} },
+    {CSR_MCLK_CTL,         { "mclk_ctl",          any, read_zero, write_stub} },
+
+    /* Counter related CSRs */
+    {CSR_MCOUNTERWEN,      { "mcounterwen",       any, read_zero, write_stub} },
+    {CSR_MCOUNTERINTEN,    { "mcounterinten",     any, read_zero, write_stub} },
+    {CSR_MCOUNTERMASK_M,   { "mcountermask_m",    any, read_zero, write_stub} },
+    {CSR_MCOUNTERMASK_S,   { "mcountermask_s",    any, read_zero, write_stub} },
+    {CSR_MCOUNTERMASK_U,   { "mcountermask_u",    any, read_zero, write_stub} },
+    {CSR_MCOUNTEROVF,      { "mcounterovf",       any, read_zero, write_stub} },
+
+    /* Enhanced CLIC CSRs */
+    {CSR_MIRQ_ENTRY,       { "mirq_entry",        any, read_zero, write_stub} },
+    {CSR_MINTSEL_JAL,      { "mintsel_jal",       any, read_zero, write_stub} },
+    {CSR_PUSHMCAUSE,       { "pushmcause",        any, read_zero, write_stub} },
+    {CSR_PUSHMEPC,         { "pushmepc",          any, read_zero, write_stub} },
+    {CSR_PUSHMXSTATUS,     { "pushmxstatus",      any, read_zero, write_stub} },
+
+    /* Andes Physical Memory Attribute(PMA) CSRs */
+    {CSR_PMACFG0,          { "pmacfg0",           any, read_zero, write_stub} },
+    {CSR_PMACFG1,          { "pmacfg1",           any, read_zero, write_stub} },
+    {CSR_PMACFG2,          { "pmacfg2",           any, read_zero, write_stub} },
+    {CSR_PMACFG3,          { "pmacfg3",           any, read_zero, write_stub} },
+    {CSR_PMAADDR0,         { "pmaaddr0",          any, read_zero, write_stub} },
+    {CSR_PMAADDR1,         { "pmaaddr1",          any, read_zero, write_stub} },
+    {CSR_PMAADDR2,         { "pmaaddr2",          any, read_zero, write_stub} },
+    {CSR_PMAADDR3,         { "pmaaddr3",          any, read_zero, write_stub} },
+    {CSR_PMAADDR4,         { "pmaaddr4",          any, read_zero, write_stub} },
+    {CSR_PMAADDR5,         { "pmaaddr5",          any, read_zero, write_stub} },
+    {CSR_PMAADDR6,         { "pmaaddr6",          any, read_zero, write_stub} },
+    {CSR_PMAADDR7,         { "pmaaddr7",          any, read_zero, write_stub} },
+    {CSR_PMAADDR8,         { "pmaaddr8",          any, read_zero, write_stub} },
+    {CSR_PMAADDR9,         { "pmaaddr9",          any, read_zero, write_stub} },
+    {CSR_PMAADDR10,        { "pmaaddr10",         any, read_zero, write_stub} },
+    {CSR_PMAADDR11,        { "pmaaddr11",         any, read_zero, write_stub} },
+    {CSR_PMAADDR12,        { "pmaaddr12",         any, read_zero, write_stub} },
+    {CSR_PMAADDR13,        { "pmaaddr13",         any, read_zero, write_stub} },
+    {CSR_PMAADDR14,        { "pmaaddr14",         any, read_zero, write_stub} },
+    {CSR_PMAADDR15,        { "pmaaddr15",         any, read_zero, write_stub} },
+
+    /* Debug/Trace Registers (shared with Debug Mode) */
+    {CSR_TSELECT,          { "tselect",           any, read_zero, write_stub} },
+    {CSR_TDATA1,           { "tdata1",            any, read_zero, write_stub} },
+    {CSR_TDATA2,           { "tdata2",            any, read_zero, write_stub} },
+    {CSR_TDATA3,           { "tdata3",            any, read_zero, write_stub} },
+    {CSR_TINFO,            { "tinfo",             any, read_zero, write_stub} },
+
+    /* ================== AndeStar V5 supervisor mode CSRs ================== */
+    /* Supervisor trap registers */
+    {CSR_SLIE,             { "slie",              any, read_zero, write_stub} },
+    {CSR_SLIP,             { "slip",              any, read_zero, write_stub} },
+    {CSR_SDCAUSE,          { "sdcause",           any, read_zero, write_stub} },
+
+    /* Supervisor counter registers */
+    {CSR_SCOUNTERINTEN,    { "scounterinten",     any, read_zero, write_stub} },
+    {CSR_SCOUNTERMASK_M,   { "scountermask_m",    any, read_zero, write_stub} },
+    {CSR_SCOUNTERMASK_S,   { "scountermask_s",    any, read_zero, write_stub} },
+    {CSR_SCOUNTERMASK_U,   { "scountermask_u",    any, read_zero, write_stub} },
+    {CSR_SCOUNTEROVF,      { "scounterovf",       any, read_zero, write_stub} },
+    {CSR_SCOUNTINHIBIT,    { "scountinhibit",     any, read_zero, write_stub} },
+    {CSR_SHPMEVENT3,       { "shpmevent3",        any, read_zero, write_stub} },
+    {CSR_SHPMEVENT4,       { "shpmevent4",        any, read_zero, write_stub} },
+    {CSR_SHPMEVENT5,       { "shpmevent5",        any, read_zero, write_stub} },
+    {CSR_SHPMEVENT6,       { "shpmevent6",        any, read_zero, write_stub} },
+
+    /* Supervisor control registers */
+    {CSR_SCCTLDATA,        { "scctldata",         any, read_zero, write_stub} },
+    {CSR_SMISC_CTL,        { "smisc_ctl",         any, read_zero, write_stub} },
+
+    /* ===================== AndeStar V5 user mode CSRs ===================== */
+    /* User mode control registers */
+    {CSR_UITB,             { "uitb",              any, read_uitb, write_uitb} },
+    {CSR_UCODE,            { "ucode",             any, read_zero, write_stub} },
+    {CSR_UDCAUSE,          { "udcause",           any, read_zero, write_stub} },
+    {CSR_UCCTLBEGINADDR,   { "ucctlbeginaddr",    any, read_zero, write_stub} },
+    {CSR_UCCTLCOMMAND,     { "ucctlcommand",      any, read_zero, write_stub} },
+    {CSR_WFE,              { "wfe",               any, read_zero, write_stub} },
+    {CSR_SLEEPVALUE,       { "sleepvalue",        any, read_zero, write_stub} },
+    {CSR_TXEVT,            { "csr_txevt",         any, read_zero, write_stub} },
+    {0, { "", NULL, NULL, NULL } },
+#endif
+    };
+
diff --git a/target/riscv/custom_cpu_bits.h b/target/riscv/custom_cpu_bits.h
new file mode 100644
index 0000000000..072c97728a
--- /dev/null
+++ b/target/riscv/custom_cpu_bits.h
@@ -0,0 +1,3 @@
+//XXX Maybe we should introduce a configure option to toggle different vendor
+// CSR bits definition ?
+#include "andes_cpu_bits.h"
-- 
2.31.1


