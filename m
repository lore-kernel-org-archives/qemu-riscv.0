Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E61CC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 07:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rElOT-0005tG-FM; Sun, 17 Dec 2023 02:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rElOL-0005qO-Eb
 for qemu-riscv@nongnu.org; Sun, 17 Dec 2023 02:16:55 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rElOH-0003xG-UT
 for qemu-riscv@nongnu.org; Sun, 17 Dec 2023 02:16:48 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3BH7GWnF066113;
 Sun, 17 Dec 2023 15:16:32 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from alvinga-VirtualBox.andestech.com (10.0.13.65) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Sun, 17 Dec 2023 15:16:33 +0800
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <liwei1518@gmail.com>, <dbarboza@ventanamicro.com>,
 <zhiwei_liu@linux.alibaba.com>, Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] target/riscv: Implement optional CSR mcontext of debug Sdtrig
 extension
Date: Sun, 17 Dec 2023 15:16:28 +0800
Message-ID: <20231217071628.151599-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.13.65]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BH7GWnF066113
Received-SPF: pass client-ip=60.248.80.70; envelope-from=alvinga@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Alvin Chang <alvinga@andestech.com>
From:  Alvin Chang via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The debug Sdtrig extension defines an optional CSR "mcontext". Since it
is optional, this commit adds new CPU configuration
"ext_sdtrig_mcontext" and uses property "sdtrig_mcontext" to control
whether it is implemented or not. Its predicate and read/write
operations are also implemented into CSR table. Its value is reset as 0
when the trigger module is reset.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 target/riscv/cpu.c      |  4 ++++
 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/cpu_cfg.h  |  1 +
 target/riscv/csr.c      | 36 ++++++++++++++++++++++++++++++++++++
 target/riscv/debug.c    |  2 ++
 6 files changed, 51 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0c..dff757f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1479,6 +1479,10 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
+    /* Optional CSR of debug Sdtrig extension */
+    DEFINE_PROP_BOOL("sdtrig_mcontext", RISCVCPU, cfg.ext_sdtrig_mcontext,
+                     false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361..e117641 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -345,6 +345,7 @@ struct CPUArchState {
     target_ulong tdata1[RV_MAX_TRIGGERS];
     target_ulong tdata2[RV_MAX_TRIGGERS];
     target_ulong tdata3[RV_MAX_TRIGGERS];
+    target_ulong mcontext;
     struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
     struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
     QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ebd7917..3296648 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -361,6 +361,7 @@
 #define CSR_TDATA2          0x7a2
 #define CSR_TDATA3          0x7a3
 #define CSR_TINFO           0x7a4
+#define CSR_MCONTEXT        0x7a8
 
 /* Debug Mode Registers */
 #define CSR_DCSR            0x7b0
@@ -905,4 +906,10 @@ typedef enum RISCVException {
 /* JVT CSR bits */
 #define JVT_MODE                           0x3F
 #define JVT_BASE                           (~0x3F)
+
+/* Debug Sdtrig CSR masks */
+#define MCONTEXT32                         0x0000003F
+#define MCONTEXT64                         0x0000000000001FFFULL
+#define MCONTEXT32_HCONTEXT                0x0000007F
+#define MCONTEXT64_HCONTEXT                0x0000000000003FFFULL
 #endif
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb..4f1cb04 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -147,6 +147,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool debug;
     bool misa_w;
+    bool ext_sdtrig_mcontext;
 
     bool short_isa_string;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1..0b68787 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -549,6 +549,15 @@ static RISCVException debug(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException sdtrig_mcontext(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_cfg(env)->debug && riscv_cpu_cfg(env)->ext_sdtrig_mcontext) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 static RISCVException seed(CPURISCVState *env, int csrno)
@@ -3900,6 +3909,31 @@ static RISCVException read_tinfo(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mcontext(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->mcontext;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mcontext(CPURISCVState *env, int csrno,
+                                     target_ulong val)
+{
+    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
+    int32_t mask;
+
+    if (riscv_has_ext(env, RVH)) {
+        /* Spec suggest 7-bit for RV32 and 14-bit for RV64 w/ H extension */
+        mask = rv32 ? MCONTEXT32_HCONTEXT : MCONTEXT64_HCONTEXT;
+    } else {
+        /* Spec suggest 6-bit for RV32 and 13-bit for RV64 w/o H extension */
+        mask = rv32 ? MCONTEXT32 : MCONTEXT64;
+    }
+
+    env->mcontext = val & mask;
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -4799,6 +4833,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
     [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
     [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
+    [CSR_MCONTEXT]  =  { "mcontext", sdtrig_mcontext,    read_mcontext,
+                         write_mcontext                                },
 
     /* User Pointer Masking */
     [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,  write_umte },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 4945d1a..e30d99c 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -940,4 +940,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
         env->cpu_watchpoint[i] = NULL;
         timer_del(env->itrigger_timer[i]);
     }
+
+    env->mcontext = 0;
 }
-- 
2.34.1


