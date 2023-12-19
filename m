Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFA6C41535
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 12:33:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFZHj-0001zG-EG; Tue, 19 Dec 2023 07:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rFZHY-0001yY-71
 for qemu-riscv@nongnu.org; Tue, 19 Dec 2023 07:33:10 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rFZHT-00035N-K3
 for qemu-riscv@nongnu.org; Tue, 19 Dec 2023 07:33:07 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3BJCWnbx055594;
 Tue, 19 Dec 2023 20:32:49 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from alvinga-VirtualBox.andestech.com (10.0.13.65) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Tue, 19 Dec 2023 20:32:49 +0800
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <liwei1518@gmail.com>, <dbarboza@ventanamicro.com>,
 <zhiwei_liu@linux.alibaba.com>, Alvin Chang <alvinga@andestech.com>
Subject: [PATCH v2] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Date: Tue, 19 Dec 2023 20:32:44 +0800
Message-ID: <20231219123244.290935-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.13.65]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BJCWnbx055594
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

The debug Sdtrig extension defines an CSR "mcontext". This commit
implements its predicate and read/write operations into CSR table.
Its value is reset as 0 when the trigger module is reset.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
Changes from v1: Remove dedicated cfg, always implement mcontext.

 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  7 +++++++
 target/riscv/csr.c      | 36 +++++++++++++++++++++++++++++++-----
 target/riscv/debug.c    |  2 ++
 4 files changed, 41 insertions(+), 5 deletions(-)

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
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1..ff1e128 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3900,6 +3900,31 @@ static RISCVException read_tinfo(CPURISCVState *env, int csrno,
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
@@ -4794,11 +4819,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
     /* Debug CSRs */
-    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
-    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
-    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
-    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
-    [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
+    [CSR_TSELECT]   =  { "tselect",  debug, read_tselect,  write_tselect  },
+    [CSR_TDATA1]    =  { "tdata1",   debug, read_tdata,    write_tdata    },
+    [CSR_TDATA2]    =  { "tdata2",   debug, read_tdata,    write_tdata    },
+    [CSR_TDATA3]    =  { "tdata3",   debug, read_tdata,    write_tdata    },
+    [CSR_TINFO]     =  { "tinfo",    debug, read_tinfo,    write_ignore   },
+    [CSR_MCONTEXT]  =  { "mcontext", debug, read_mcontext, write_mcontext },
 
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


