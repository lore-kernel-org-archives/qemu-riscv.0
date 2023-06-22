Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32DAEB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 09:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCGrG-0007PV-2C; Thu, 22 Jun 2023 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1qCGrD-0007OJ-S7; Thu, 22 Jun 2023 05:44:03 -0400
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1qCGrB-0002Cy-VZ; Thu, 22 Jun 2023 05:44:03 -0400
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com EC190C0007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1687427036;
 bh=nUWR8bJEtUnaIatZdrVaASTKGaApzxZ6nVq4mh+HlL0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=DL3rrsjeCYNaO86JsBtrjF8dFaspASM4xJhhkRdv71TOJYMguPm2ZIpAUFm4pTIa/
 MOHuY1orVKEOGRI1eBx9xRMANlc7IdEb1OLTPfr85Zph7IRYqZY861cfA+q+h6gT9q
 Xzx3tUbNd9vJWMJ02iU5YFhapzAV+1ivx8chwNkFxNVmfjz9tEII48jnKwHeJTA058
 fyMQls8MQf8zzxKZLMH6x5pF9gp9YW8rIB3vbiNNqBzPc0gWWHV9oyyQ1PkcVO13kF
 GL7eovaIhdZ+jzUfEwOkO8cb36+mEQnUtRWQqd59gDo6379zbi2aHy+0fkjBGm3kwU
 VT6F6MlHSLxSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1687427036;
 bh=nUWR8bJEtUnaIatZdrVaASTKGaApzxZ6nVq4mh+HlL0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=LqCzKD8zgAN4veCS2n2UVq0t+RmMpyfIU2+2wMpzC0LaumQQ9IKRYQhwAQ8ZjVwTK
 YM3ZtXoH5cFsuK53oz2krlU7MAMvyIQF2ikJPvliNswoZjdUNanaO+Dz0YZ+knU66e
 knFSX4NdhiiNoxbpGnZpdTeUuBz/kGtuKQ8mVVFFgx5rIS21JQioCRnRzL0LPuYJpK
 EaEnzgIDpSBArOumu56uEI3QMtS9kE00b2amW/SOjhHWem93Sh+25u9vB/S6d1GKyD
 GjMKQgGpLamejf5rTSKntSbgJkfJH1yGu6GoPZqblTfkzy2ZbpVqgjNxwqdHnnM+th
 7jCs5XW9DJk+g==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <philmd@linaro.org>, <wangyanan55@huawei.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <liweiwei@iscas.ac.cn>, 
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>, Ivan Klokov
 <ivan.klokov@syntacore.com>
Subject: [PATCH v4 1/1] target/riscv: Add RVV registers to log
Date: Thu, 22 Jun 2023 12:43:46 +0300
Message-ID: <20230622094346.29853-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
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

Print RvV extesion register to log if VPU option is enabled.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
v4:
   - General part of patch has been merged, rebase riscv part and resend. 
---
 target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fb8458bf74..b23f3fde0d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,14 @@ const char * const riscv_fpr_regnames[] = {
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
@@ -611,7 +619,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    int i;
+    int i, j;
+    uint8_t *p;
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -695,6 +704,51 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


