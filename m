Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42085EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:38:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEnAV-0006h5-LG; Thu, 29 Jun 2023 04:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1qEnAT-0006gX-AH; Thu, 29 Jun 2023 04:38:21 -0400
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1qEnAQ-0007bY-O8; Thu, 29 Jun 2023 04:38:21 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 0A0F0C0005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1688027894;
 bh=2mzI2p4R5dozVorYVrP/PIC44+joSs1dHC1DPzmtPwE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=cmIXInh80duPx+mRkw9Pb15/uJA7ITi/udII+7haa1UuOLkqM9mpK3rUpyuMaZ9kW
 6ZRb5qHOA5zxRMnnbLMbCnmP/ATZ1oBgcDgZvcP2UIj0p6nF4yeO5cFbsPWjGPHZmC
 JLM1vI8zuEWb1r4uZGXmjrZp2Odw/RwnULB/0ykM5goRkq2fj0poo/8EmDJTyxVHLY
 10M6/2rttfYo8+1IEQyNTpNyuXziRxq/i8Wcq+2A7iAhW14S6eFPj6unYiJz8v41oe
 5MuqJtdgBi9Jmeuf8IB8Sbx9qVr7VhIsym8cGGVglBd4ALDPWui7VYIgMwkPTDGv7d
 Hus1AQN7BUkRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1688027894;
 bh=2mzI2p4R5dozVorYVrP/PIC44+joSs1dHC1DPzmtPwE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Ly6zGlq4UT0REmyjKi1S8Lpbg9eWzaQ5IW1FiJJQW62X23T20rPNfexCOeZQtzl+Q
 ByLIjBGnSmLVox58Nvqvbxgrae26g24dIVW4JufGuDU2gYuoz66LJvJvibvQfBXPTk
 ss/xlU75Y0xJtsAOfKTsKgomhzWDkkbZDnGWhu459W/NUilNAbkEhBP89lmafPDaEt
 /4i/eD6PEALtZlcPCWUbS7SsOZ7d5yAjnGnuufgrn2Jo04e6uw0zufrnc4FHJGkl63
 fzby2Pmwx3CgbZOEGddlPNvT9iaG7dHVjHsrcyJv1klo0Be/LbN4IEL+yYe9NbdAKl
 yO9xZLawZwWQg==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <philmd@linaro.org>, <wangyanan55@huawei.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <liweiwei@iscas.ac.cn>, 
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>, Ivan Klokov
 <ivan.klokov@syntacore.com>
Subject: [PATCH v5 1/1] target/riscv: Add RVV registers to log
Date: Thu, 29 Jun 2023 11:37:30 +0300
Message-ID: <20230629083730.386604-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Print RvV extension register to log if VPU option is enabled.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
v5:
   - Fix typo, move macros out of function, direct access to cfg.vlen field. 
---
 target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..ff29573b1f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -55,6 +55,17 @@ struct isa_ext_data {
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
+/*
+ * From vector_helper.c
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing bytes needs a host-endian fixup.
+ */
+#if HOST_BIG_ENDIAN
+#define BYTE(x)   ((x) ^ 7)
+#else
+#define BYTE(x)   (x)
+#endif
+
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
@@ -183,6 +194,14 @@ const char * const riscv_fpr_regnames[] = {
     "f30/ft10", "f31/ft11"
 };
 
+const char * const riscv_rvv_regnames[] = {
+  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",
+  "v7",  "v8",  "v9",  "v10", "v11", "v12", "v13",
+  "v14", "v15", "v16", "v17", "v18", "v19", "v20",
+  "v21", "v22", "v23", "v24", "v25", "v26", "v27",
+  "v28", "v29", "v30", "v31"
+};
+
 static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
@@ -608,7 +627,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    int i;
+    int i, j;
+    uint8_t *p;
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -692,6 +712,41 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
     }
+    if (riscv_has_ext(env, RVV) && (flags & CPU_DUMP_VPU)) {
+        static const int dump_rvv_csrs[] = {
+                    CSR_VSTART,
+                    CSR_VXSAT,
+                    CSR_VXRM,
+                    CSR_VCSR,
+                    CSR_VL,
+                    CSR_VTYPE,
+                    CSR_VLENB,
+                };
+        for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
+            int csrno = dump_rvv_csrs[i];
+            target_ulong val = 0;
+            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+            /*
+             * Rely on the smode, hmode, etc, predicates within csr.c
+             * to do the filtering of the registers that are present.
+             */
+            if (res == RISCV_EXCP_NONE) {
+                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                             csr_ops[csrno].name, val);
+            }
+        }
+        uint16_t vlenb = cpu->cfg.vlen >> 3;
+
+        for (i = 0; i < 32; i++) {
+            qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
+            p = (uint8_t *)env->vreg;
+            for (j = vlenb - 1 ; j >= 0; j--) {
+                qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
+            }
+            qemu_fprintf(f, "\n");
+        }
+    }
 }
 
 static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.34.1


