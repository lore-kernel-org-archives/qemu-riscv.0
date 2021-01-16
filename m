Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0eLT-00018c-8c
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 00:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0eLL-00015i-9Z; Sat, 16 Jan 2021 00:41:48 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0eLG-0005SM-ES; Sat, 16 Jan 2021 00:41:47 -0500
Received: by mail-pg1-x532.google.com with SMTP id n7so7410269pgg.2;
 Fri, 15 Jan 2021 21:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G0wR1qtblPPoSLC0mSNRunbY56Iau8xBWgLVEQpOeJw=;
 b=OBOKUM6RlBG642cSUsbEGKYZ9gLiKpyllKfEt6ozmue6Brb96iQzUxEq/8DSRqTSdU
 p+sXhbzw26lxcRThl43uaIYcjAig2iUjKxkptRGxeASAbpWipPo2iNjfwl6t7wK170Cf
 rVstfkyC95FdxbElA5KnAYyS7sRMn+rvP+M3gjpA3kmffM2t9PBAAX/74CLsV3tx4GeX
 ZUm4AvIxYgIUgdl4pbuHek/yW3HYvNgGQk5MNUD9nSnpg2j5r9Qq6A+mCkeLZ+uhag5P
 RE0G9bWMU0Vh7vD4aHiHUbkrEkOE4SGmVW8m6wbVP8s8WDH2aZGE5T2EIB6nan2k4FtC
 hi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G0wR1qtblPPoSLC0mSNRunbY56Iau8xBWgLVEQpOeJw=;
 b=tyxH7u2qLc4Z0Tq7YGGox3k/7V+C6F6+5hhUbqVB7ueDT1j+bMDFaE7C97HBz5qPCi
 G65ErQ3L4ZM9EcfA2vXKM7aeweGP/8N+qm93w+iY2cyUIomrm2Hig/LfabJ0Wna3Loax
 /74x45HDLsT99aOuom4saNVUykzzZKUdEZ7FBaDEvFFVKCNF/piJ8K+D/mim4yCkUgan
 f2w3CQCn3R5Xkxy8XSSkn4IDpcUGezEMVFiiISpxM6nXShnhHqXsF6YcDWxpW/Q3KAvh
 EsJyaZ+CXg+4YVCcw9z7aEUEK3w8JEumnLr3AhgsO9uAF+uKiU0ESiy0gVu9EOlF1k7d
 u1KA==
X-Gm-Message-State: AOAM533KwPplPSSszlC5pDfgkPsGOQvnZtk/Y24a+c9WOfHmJT/NzWpT
 zaTVeHorBRGPXGkw5x7E80E=
X-Google-Smtp-Source: ABdhPJyb+5O/KvaRTFlwcmw1t1Nk2aedIgBb7yoUYNA5YzPiwcLzD2JkCslO/zv4p4BCUVxU449YEA==
X-Received: by 2002:aa7:97b9:0:b029:1ae:2731:a769 with SMTP id
 d25-20020aa797b90000b02901ae2731a769mr16290388pfq.46.1610775700598; 
 Fri, 15 Jan 2021 21:41:40 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm9603798pjg.50.2021.01.15.21.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 21:41:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 1/2] target/riscv: Generate the GDB XML file for CSR
 registers dynamically
Date: Sat, 16 Jan 2021 13:41:22 +0800
Message-Id: <20210116054123.5457-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210116054123.5457-1-bmeng.cn@gmail.com>
References: <20210116054123.5457-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 16 Jan 2021 05:41:51 -0000

From: Bin Meng <bin.meng@windriver.com>

At present QEMU RISC-V uses a hardcoded XML to report the feature
"org.gnu.gdb.riscv.csr" [1]. There are two major issues with the
approach being used currently:

- The XML does not specify the "regnum" field of a CSR entry, hence
  consecutive numbers are used by the remote GDB client to access
  CSRs. In QEMU we have to maintain a map table to convert the GDB
  number to the hardware number which is error prone.
- The XML contains some CSRs that QEMU does not implement at all,
  which causes an "E14" response sent to remote GDB client.

Change to generate the CSR register list dynamically, based on the
availability presented in the CSR function table. This new approach
will reflect a correct list of CSRs that QEMU actually implements.

[1] https://sourceware.org/gdb/current/onlinedocs/gdb/RISC_002dV-Features.html#RISC_002dV-Features

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- rebase on top of riscv-to-apply.next branch
- drop the first 2 patches that are already applied on riscv-to-apply.next

 target/riscv/cpu.h     |   2 +
 target/riscv/cpu.c     |  12 ++
 target/riscv/gdbstub.c | 308 ++++++-----------------------------------
 3 files changed, 58 insertions(+), 264 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2718617ef4..02758ae0eb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -272,6 +272,8 @@ struct RISCVCPU {
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
+    char *dyn_csr_xml;
+
     /* Configuration Settings */
     struct {
         bool ext_i;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6aafe4e62c..27788021eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -569,6 +569,17 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     }
 }
 
+static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (strcmp(xmlname, "riscv-csr.xml") == 0) {
+        return cpu->dyn_csr_xml;
+    }
+
+    return NULL;
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -605,6 +616,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
+    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index eba12a86f2..5f96b7ea2a 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,256 +20,6 @@
 #include "exec/gdbstub.h"
 #include "cpu.h"
 
-/*
- * The GDB CSR xml files list them in documentation order, not numerical order,
- * and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
- * to the hardware numbers.
- */
-
-static int csr_register_map[] = {
-    CSR_USTATUS,
-    CSR_UIE,
-    CSR_UTVEC,
-    CSR_USCRATCH,
-    CSR_UEPC,
-    CSR_UCAUSE,
-    CSR_UTVAL,
-    CSR_UIP,
-    CSR_FFLAGS,
-    CSR_FRM,
-    CSR_FCSR,
-    CSR_CYCLE,
-    CSR_TIME,
-    CSR_INSTRET,
-    CSR_HPMCOUNTER3,
-    CSR_HPMCOUNTER4,
-    CSR_HPMCOUNTER5,
-    CSR_HPMCOUNTER6,
-    CSR_HPMCOUNTER7,
-    CSR_HPMCOUNTER8,
-    CSR_HPMCOUNTER9,
-    CSR_HPMCOUNTER10,
-    CSR_HPMCOUNTER11,
-    CSR_HPMCOUNTER12,
-    CSR_HPMCOUNTER13,
-    CSR_HPMCOUNTER14,
-    CSR_HPMCOUNTER15,
-    CSR_HPMCOUNTER16,
-    CSR_HPMCOUNTER17,
-    CSR_HPMCOUNTER18,
-    CSR_HPMCOUNTER19,
-    CSR_HPMCOUNTER20,
-    CSR_HPMCOUNTER21,
-    CSR_HPMCOUNTER22,
-    CSR_HPMCOUNTER23,
-    CSR_HPMCOUNTER24,
-    CSR_HPMCOUNTER25,
-    CSR_HPMCOUNTER26,
-    CSR_HPMCOUNTER27,
-    CSR_HPMCOUNTER28,
-    CSR_HPMCOUNTER29,
-    CSR_HPMCOUNTER30,
-    CSR_HPMCOUNTER31,
-    CSR_CYCLEH,
-    CSR_TIMEH,
-    CSR_INSTRETH,
-    CSR_HPMCOUNTER3H,
-    CSR_HPMCOUNTER4H,
-    CSR_HPMCOUNTER5H,
-    CSR_HPMCOUNTER6H,
-    CSR_HPMCOUNTER7H,
-    CSR_HPMCOUNTER8H,
-    CSR_HPMCOUNTER9H,
-    CSR_HPMCOUNTER10H,
-    CSR_HPMCOUNTER11H,
-    CSR_HPMCOUNTER12H,
-    CSR_HPMCOUNTER13H,
-    CSR_HPMCOUNTER14H,
-    CSR_HPMCOUNTER15H,
-    CSR_HPMCOUNTER16H,
-    CSR_HPMCOUNTER17H,
-    CSR_HPMCOUNTER18H,
-    CSR_HPMCOUNTER19H,
-    CSR_HPMCOUNTER20H,
-    CSR_HPMCOUNTER21H,
-    CSR_HPMCOUNTER22H,
-    CSR_HPMCOUNTER23H,
-    CSR_HPMCOUNTER24H,
-    CSR_HPMCOUNTER25H,
-    CSR_HPMCOUNTER26H,
-    CSR_HPMCOUNTER27H,
-    CSR_HPMCOUNTER28H,
-    CSR_HPMCOUNTER29H,
-    CSR_HPMCOUNTER30H,
-    CSR_HPMCOUNTER31H,
-    CSR_SSTATUS,
-    CSR_SEDELEG,
-    CSR_SIDELEG,
-    CSR_SIE,
-    CSR_STVEC,
-    CSR_SCOUNTEREN,
-    CSR_SSCRATCH,
-    CSR_SEPC,
-    CSR_SCAUSE,
-    CSR_STVAL,
-    CSR_SIP,
-    CSR_SATP,
-    CSR_MVENDORID,
-    CSR_MARCHID,
-    CSR_MIMPID,
-    CSR_MHARTID,
-    CSR_MSTATUS,
-    CSR_MISA,
-    CSR_MEDELEG,
-    CSR_MIDELEG,
-    CSR_MIE,
-    CSR_MTVEC,
-    CSR_MCOUNTEREN,
-    CSR_MSCRATCH,
-    CSR_MEPC,
-    CSR_MCAUSE,
-    CSR_MTVAL,
-    CSR_MIP,
-    CSR_MTINST,
-    CSR_MTVAL2,
-    CSR_PMPCFG0,
-    CSR_PMPCFG1,
-    CSR_PMPCFG2,
-    CSR_PMPCFG3,
-    CSR_PMPADDR0,
-    CSR_PMPADDR1,
-    CSR_PMPADDR2,
-    CSR_PMPADDR3,
-    CSR_PMPADDR4,
-    CSR_PMPADDR5,
-    CSR_PMPADDR6,
-    CSR_PMPADDR7,
-    CSR_PMPADDR8,
-    CSR_PMPADDR9,
-    CSR_PMPADDR10,
-    CSR_PMPADDR11,
-    CSR_PMPADDR12,
-    CSR_PMPADDR13,
-    CSR_PMPADDR14,
-    CSR_PMPADDR15,
-    CSR_MCYCLE,
-    CSR_MINSTRET,
-    CSR_MHPMCOUNTER3,
-    CSR_MHPMCOUNTER4,
-    CSR_MHPMCOUNTER5,
-    CSR_MHPMCOUNTER6,
-    CSR_MHPMCOUNTER7,
-    CSR_MHPMCOUNTER8,
-    CSR_MHPMCOUNTER9,
-    CSR_MHPMCOUNTER10,
-    CSR_MHPMCOUNTER11,
-    CSR_MHPMCOUNTER12,
-    CSR_MHPMCOUNTER13,
-    CSR_MHPMCOUNTER14,
-    CSR_MHPMCOUNTER15,
-    CSR_MHPMCOUNTER16,
-    CSR_MHPMCOUNTER17,
-    CSR_MHPMCOUNTER18,
-    CSR_MHPMCOUNTER19,
-    CSR_MHPMCOUNTER20,
-    CSR_MHPMCOUNTER21,
-    CSR_MHPMCOUNTER22,
-    CSR_MHPMCOUNTER23,
-    CSR_MHPMCOUNTER24,
-    CSR_MHPMCOUNTER25,
-    CSR_MHPMCOUNTER26,
-    CSR_MHPMCOUNTER27,
-    CSR_MHPMCOUNTER28,
-    CSR_MHPMCOUNTER29,
-    CSR_MHPMCOUNTER30,
-    CSR_MHPMCOUNTER31,
-    CSR_MCYCLEH,
-    CSR_MINSTRETH,
-    CSR_MHPMCOUNTER3H,
-    CSR_MHPMCOUNTER4H,
-    CSR_MHPMCOUNTER5H,
-    CSR_MHPMCOUNTER6H,
-    CSR_MHPMCOUNTER7H,
-    CSR_MHPMCOUNTER8H,
-    CSR_MHPMCOUNTER9H,
-    CSR_MHPMCOUNTER10H,
-    CSR_MHPMCOUNTER11H,
-    CSR_MHPMCOUNTER12H,
-    CSR_MHPMCOUNTER13H,
-    CSR_MHPMCOUNTER14H,
-    CSR_MHPMCOUNTER15H,
-    CSR_MHPMCOUNTER16H,
-    CSR_MHPMCOUNTER17H,
-    CSR_MHPMCOUNTER18H,
-    CSR_MHPMCOUNTER19H,
-    CSR_MHPMCOUNTER20H,
-    CSR_MHPMCOUNTER21H,
-    CSR_MHPMCOUNTER22H,
-    CSR_MHPMCOUNTER23H,
-    CSR_MHPMCOUNTER24H,
-    CSR_MHPMCOUNTER25H,
-    CSR_MHPMCOUNTER26H,
-    CSR_MHPMCOUNTER27H,
-    CSR_MHPMCOUNTER28H,
-    CSR_MHPMCOUNTER29H,
-    CSR_MHPMCOUNTER30H,
-    CSR_MHPMCOUNTER31H,
-    CSR_MHPMEVENT3,
-    CSR_MHPMEVENT4,
-    CSR_MHPMEVENT5,
-    CSR_MHPMEVENT6,
-    CSR_MHPMEVENT7,
-    CSR_MHPMEVENT8,
-    CSR_MHPMEVENT9,
-    CSR_MHPMEVENT10,
-    CSR_MHPMEVENT11,
-    CSR_MHPMEVENT12,
-    CSR_MHPMEVENT13,
-    CSR_MHPMEVENT14,
-    CSR_MHPMEVENT15,
-    CSR_MHPMEVENT16,
-    CSR_MHPMEVENT17,
-    CSR_MHPMEVENT18,
-    CSR_MHPMEVENT19,
-    CSR_MHPMEVENT20,
-    CSR_MHPMEVENT21,
-    CSR_MHPMEVENT22,
-    CSR_MHPMEVENT23,
-    CSR_MHPMEVENT24,
-    CSR_MHPMEVENT25,
-    CSR_MHPMEVENT26,
-    CSR_MHPMEVENT27,
-    CSR_MHPMEVENT28,
-    CSR_MHPMEVENT29,
-    CSR_MHPMEVENT30,
-    CSR_MHPMEVENT31,
-    CSR_TSELECT,
-    CSR_TDATA1,
-    CSR_TDATA2,
-    CSR_TDATA3,
-    CSR_DCSR,
-    CSR_DPC,
-    CSR_DSCRATCH,
-    CSR_HSTATUS,
-    CSR_HEDELEG,
-    CSR_HIDELEG,
-    CSR_HIE,
-    CSR_HCOUNTEREN,
-    CSR_HTVAL,
-    CSR_HIP,
-    CSR_HTINST,
-    CSR_HGATP,
-    CSR_MBASE,
-    CSR_MBOUND,
-    CSR_MIBASE,
-    CSR_MIBOUND,
-    CSR_MDBASE,
-    CSR_MDBOUND,
-    CSR_MUCOUNTEREN,
-    CSR_MSCOUNTEREN,
-    CSR_MHCOUNTEREN,
-};
-
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -315,11 +65,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
         target_ulong val = 0;
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
+         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
+        result = riscv_csrrw_debug(env, n - 32, &val,
                                    0, 0);
         if (result == 0) {
             return gdb_get_regl(buf, val);
@@ -338,11 +88,11 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
         target_ulong val = ldtul_p(mem_buf);
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
+         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
+        result = riscv_csrrw_debug(env, n - 32, NULL,
                                    val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
@@ -353,11 +103,11 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
-    if (n < ARRAY_SIZE(csr_register_map)) {
+    if (n < CSR_TABLE_SIZE) {
         target_ulong val = 0;
         int result;
 
-        result = riscv_csrrw_debug(env, csr_register_map[n], &val, 0, 0);
+        result = riscv_csrrw_debug(env, n, &val, 0, 0);
         if (result == 0) {
             return gdb_get_regl(buf, val);
         }
@@ -367,11 +117,11 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 
 static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
-    if (n < ARRAY_SIZE(csr_register_map)) {
+    if (n < CSR_TABLE_SIZE) {
         target_ulong val = ldtul_p(mem_buf);
         int result;
 
-        result = riscv_csrrw_debug(env, csr_register_map[n], NULL, val, -1);
+        result = riscv_csrrw_debug(env, n, NULL, val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
         }
@@ -405,6 +155,38 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    GString *s = g_string_new(NULL);
+    riscv_csr_predicate_fn predicate;
+    int bitsize = riscv_cpu_is_32bit(env) ? 32 : 64;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+
+    for (i = 0; i < CSR_TABLE_SIZE; i++) {
+        predicate = csr_ops[i].predicate;
+        if (predicate && !predicate(env, i)) {
+            if (csr_ops[i].name) {
+                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
+            } else {
+                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            }
+            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
+            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+        }
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_csr_xml = g_string_free(s, false);
+    return CSR_TABLE_SIZE;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -417,16 +199,14 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  36, "riscv-32bit-fpu.xml", 0);
     }
 #if defined(TARGET_RISCV32)
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-32bit-csr.xml", 0);
-
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
 #elif defined(TARGET_RISCV64)
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             240, "riscv-64bit-csr.xml", 0);
-
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
 #endif
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                             riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
+                             "riscv-csr.xml", 0);
 }
-- 
2.25.1


