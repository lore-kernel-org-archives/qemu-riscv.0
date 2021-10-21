Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZlu-00081S-V5
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZln-0007wQ-VP; Thu, 21 Oct 2021 11:14:16 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:24331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZli-0007Cf-6K; Thu, 21 Oct 2021 11:14:15 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFDRj6088733;
 Thu, 21 Oct 2021 23:13:27 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:13:29 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v5 3/3] riscv: Enable custom CSR support for Andes AX25
 and A25 CPUs
Date: Thu, 21 Oct 2021 23:09:21 +0800
Message-ID: <20211021150921.721630-4-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021150921.721630-1-ruinland@andestech.com>
References: <20211021150921.721630-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFDRj6088733
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
X-List-Received-Date: Thu, 21 Oct 2021 15:14:17 -0000

Add CSR bits definitions, CSR table and handler functions for Andes
AX25 and A25 CPUs. Also, enable the logic in a(x)25_cpu_init().

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 target/riscv/andes_cpu_bits.h  | 129 +++++++++++++++++++++++
 target/riscv/cpu.c             |   4 +
 target/riscv/csr_andes.c       | 183 +++++++++++++++++++++++++++++++++
 target/riscv/custom_csr_defs.h |   3 +-
 target/riscv/meson.build       |   1 +
 5 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/andes_cpu_bits.h
 create mode 100644 target/riscv/csr_andes.c

diff --git a/target/riscv/andes_cpu_bits.h b/target/riscv/andes_cpu_bits.h
new file mode 100644
index 0000000000..84b0900423
--- /dev/null
+++ b/target/riscv/andes_cpu_bits.h
@@ -0,0 +1,129 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0+
+ *
+ * Andes custom CSRs bit definitions
+ *
+ */
+
+/*
+ * ========= Missing drafted/standard CSR definitions =========
+ * TINFO is in official debug sepc, it's not in cpu_bits.h yet.
+ */
+#define CSR_TINFO           0x7a4
+
+#if !defined(CONFIG_USER_ONLY)
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
+#endif /* !defined(CONFIG_USER_ONLY) */
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
index a72fd32f01..fe63e68b8e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -192,6 +192,8 @@ static void ax25_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    setup_custom_csr(env, andes_custom_csr_table);
+    env->custom_csr_val = g_malloc(andes_custom_csr_size);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -254,6 +256,8 @@ static void a25_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    setup_custom_csr(env, andes_custom_csr_table);
+    env->custom_csr_val = g_malloc(andes_custom_csr_size);
 }
 #endif
 
diff --git a/target/riscv/csr_andes.c b/target/riscv/csr_andes.c
new file mode 100644
index 0000000000..8617f40483
--- /dev/null
+++ b/target/riscv/csr_andes.c
@@ -0,0 +1,183 @@
+/*
+ * Copyright (c) 2021 Andes Technology Corp.
+ * SPDX-License-Identifier: GPL-2.0+
+ * Andes custom CSR table and handling functions
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+#include "andes_cpu_bits.h"
+
+struct andes_csr_val {
+    target_long uitb;
+};
+
+#if !defined(CONFIG_USER_ONLY)
+static RISCVException read_mmsc_cfg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    /* enable pma probe */
+    *val = 0x40000000;
+    return RISCV_EXCP_NONE;
+}
+#endif
+
+static RISCVException write_uitb(CPURISCVState *env, int csrno, target_ulong val)
+{
+    struct andes_csr_val *andes_csr = env->custom_csr_val;
+    andes_csr->uitb = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_uitb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    struct andes_csr_val *andes_csr = env->custom_csr_val;
+    *val = andes_csr->uitb;
+    return RISCV_EXCP_NONE;
+}
+
+
+static RISCVException any(CPURISCVState *env, int csrno)
+{
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_zero(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = 0;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_stub(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
+int andes_custom_csr_size = sizeof(struct andes_csr_val);
+riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] = {
+    /* ========= AndeStar V5 machine mode CSRs ========= */
+    #if !defined(CONFIG_USER_ONLY)
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
+    /* ========= AndeStar V5 supervisor mode CSRs ========= */
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
+    #endif
+
+    /* ========= AndeStar V5 user mode CSRs ========= */
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
+    };
diff --git a/target/riscv/custom_csr_defs.h b/target/riscv/custom_csr_defs.h
index 4dbf8cf1fd..b09083585b 100644
--- a/target/riscv/custom_csr_defs.h
+++ b/target/riscv/custom_csr_defs.h
@@ -4,4 +4,5 @@
  * Custom CSR variables provided by <cpu_model_name>_csr.c
  */
 
-/* Left blank purposely in this commit. */
+extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM];
+extern int andes_custom_csr_size;
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..5c87672ff9 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -9,6 +9,7 @@ gen = [
 riscv_ss = ss.source_set()
 riscv_ss.add(gen)
 riscv_ss.add(files(
+  'csr_andes.c',
   'cpu.c',
   'cpu_helper.c',
   'csr.c',
-- 
2.25.1


