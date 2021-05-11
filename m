Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPJ8-0000g5-5h
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 06:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgPJ6-0000aQ-O6
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 06:08:04 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:25132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgPJ4-0007sy-CM
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 06:08:04 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 14BA7YmQ076954;
 Tue, 11 May 2021 18:07:34 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 18:07:33 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-riscv@nongnu.org>, <alistair23@gmail.com>
CC: <dylan@andestech.com>, <alankao@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [PATCH V2 2/2] Adding custom Andes CSR table.
Date: Tue, 11 May 2021 18:07:22 +0800
Message-ID: <20210511100722.18065-3-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511100722.18065-1-ruinland@andestech.com>
References: <20210511100722.18065-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 14BA7YmQ076954
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
X-List-Received-Date: Tue, 11 May 2021 10:08:05 -0000

---
 target/riscv/csr_andes.inc.c | 125 +++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 target/riscv/csr_andes.inc.c

diff --git a/target/riscv/csr_andes.inc.c b/target/riscv/csr_andes.inc.c
new file mode 100644
index 0000000..c470ef8
--- /dev/null
+++ b/target/riscv/csr_andes.inc.c
@@ -0,0 +1,125 @@
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
+    {CSR_UITB,             { "uitb",              any, read_zero, write_stub} },
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
-- 
2.17.1


