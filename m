Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA8EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 10:59:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH0Dm-0004MF-VI; Wed, 05 Jul 2023 06:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1qH0Dm-0004M3-An; Wed, 05 Jul 2023 06:58:54 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1qH0Di-0008S6-GK; Wed, 05 Jul 2023 06:58:53 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1qH0DX-008b59-Hf; Wed, 05 Jul 2023 11:58:39 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1qH0DW-000Htz-2k;
 Wed, 05 Jul 2023 11:58:38 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, liweiwei@iscas.ac.cn, bin.meng@windriver.com,
 alistair.francis@wdc.com, almer@dabbelt.com,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: add config for asid size
Date: Wed,  5 Jul 2023 11:58:38 +0100
Message-Id: <20230705105838.68806-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a config to the cpu state to control the size of the ASID area
in the SATP CSR to enable testing with smaller than the default (which
is currently maximum for both rv32 and rv64). It also adds the ability
to stop the ASID feature by using 0 to disable it.

For example, an rv64 with only 8 asid bits:
	-cpu rv64,asid-bits=8

or no asids:
        -cpu rv64,asid-bits=0

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 target/riscv/cpu.c      | 42 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  2 ++
 target/riscv/cpu_cfg.h  |  1 +
 target/riscv/csr.c      |  1 +
 5 files changed, 47 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4035fe0e62..c703005aba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1281,6 +1281,38 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
         }
     }
 }
+
+static void riscv_cpu_asid_finalized_features(RISCVCPU *cpu, Error **errp)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    target_ulong asid_mask, asid_shift;
+    target_ulong calc_mask;
+
+    if (rv32) {
+        asid_mask = SATP32_ASID;
+        asid_shift = SATP32_ASID_SHIFT;
+    } else {
+        asid_mask = SATP64_ASID;
+        asid_shift = SATP64_ASID_SHIFT;
+    }
+
+    if (cpu->cfg.asid_bits < 0) {
+        cpu->env.asid_clear = 0;
+        return;
+    }
+
+    calc_mask = ((target_ulong)1 << cpu->cfg.asid_bits) - 1;
+    calc_mask <<= asid_shift;
+
+    if (calc_mask > asid_mask) {
+        error_setg(errp, "invalid ASID bits [0 %d]",
+                   __builtin_clz(asid_mask >> asid_shift));
+        return;
+    }
+
+    cpu->env.asid_clear = calc_mask ^ asid_mask;
+}
+
 #endif
 
 static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
@@ -1293,6 +1325,12 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+
+    riscv_cpu_asid_finalized_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
 #endif
 }
 
@@ -1648,6 +1686,10 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
+#ifndef CONFIG_USER_ONLY
+    DEFINE_PROP_INT32("asid-bits",  RISCVCPU, cfg.asid_bits, -1),
+#endif
+
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7adb8706ac..5b35770795 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -194,6 +194,7 @@ struct CPUArchState {
     uint64_t mideleg;
 
     target_ulong satp;   /* since: priv-1.10.0 */
+    target_ulong asid_clear;    /* always clear these bits in satp */
     target_ulong stval;
     target_ulong medeleg;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 59f0ffd9e1..fd753ce3f4 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -617,11 +617,13 @@ typedef enum {
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
 #define SATP32_ASID         0x7fc00000
+#define SATP32_ASID_SHIFT   22
 #define SATP32_PPN          0x003fffff
 
 /* RV64 satp CSR field masks */
 #define SATP64_MODE         0xF000000000000000ULL
 #define SATP64_ASID         0x0FFFF00000000000ULL
+#define SATP64_ASID_SHIFT   44
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
 /* VM modes (satp.mode) privileged ISA 1.10 */
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..4d578797cc 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -128,6 +128,7 @@ struct RISCVCPUConfig {
     bool short_isa_string;
 
 #ifndef CONFIG_USER_ONLY
+    int32_t asid_bits;
     RISCVSATPMap satp_mode;
 #endif
 };
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58499b5afc..215b71bd31 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2731,6 +2731,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    val &= ~env->asid_clear;
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         vm = validate_vm(env, get_field(val, SATP32_MODE));
         mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
-- 
2.40.1


