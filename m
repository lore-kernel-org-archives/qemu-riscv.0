Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plqtq-00065S-Kv
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 08:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtn-00064G-KP; Mon, 10 Apr 2023 08:45:31 -0400
Received: from forward206b.mail.yandex.net ([178.154.239.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtk-0004F8-VC; Mon, 10 Apr 2023 08:45:31 -0400
Received: from mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:2e14:0:640:2cd1:0])
 by forward206b.mail.yandex.net (Yandex) with ESMTP id 1A97F600A8;
 Mon, 10 Apr 2023 15:45:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id GjTsr15WxCg0-LXsPkfRK; 
 Mon, 10 Apr 2023 15:45:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1681130723; bh=9Mb4Qwkx8fOHD6B0/BJrqGmPRtDY8NFbHmHYbVZV5AE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=OpPS8Fac/XbYKqlvENFYXn6rF7Udw4MCTNMvVBpJcQ9fdoK5SGaMOI5NE7e+vnw1E
 BUddlO2aKZ0ECGgHpgwrF0uZ1wil90pkjhdBO6sPY2X6ITJoY/cqDLO5d37V2Bf93M
 xsqm3Wo7pl2wrQdeHBBGoo7rf/LYWVTPgctmPE2E=
Authentication-Results: mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v3 2/2] target/riscv: Add RVV registers to log
Date: Mon, 10 Apr 2023 15:44:51 +0300
Message-Id: <20230410124451.15929-3-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410124451.15929-1-ivan.klokov@syntacore.com>
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.151;
 envelope-from=ivan.klokov@syntacore.com; helo=forward206b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Apr 2023 12:45:32 -0000

Print RvV extesion register to log if VPU option is enabled.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bc0005cc7..cfd063a5dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -172,6 +172,14 @@ const char * const riscv_fpr_regnames[] = {
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
@@ -422,7 +430,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    int i;
+    int i, j;
+    uint8_t *p;
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -506,6 +515,51 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+        uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+
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


