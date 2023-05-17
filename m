Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A11C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 09:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzDGt-0006Gh-P2; Wed, 17 May 2023 05:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGn-0005RL-FB; Wed, 17 May 2023 05:16:29 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGj-0007l3-8F; Wed, 17 May 2023 05:16:29 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowABnVxRam2Rks_XqJQ--.29147S7;
 Wed, 17 May 2023 17:16:15 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 05/12] target/riscv: Make RLB/MML/MMWP bits writable only
 when Smepmp is enabled
Date: Wed, 17 May 2023 17:15:12 +0800
Message-Id: <20230517091519.34439-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
References: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnVxRam2Rks_XqJQ--.29147S7
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1UGF15Gw18KFWxtryxKrg_yoW8Kr4xpr
 43Ga4fGFWrZ3yxKa4fWr17GFy5CwsYg3s0qayfu3y8Aw43CrWkuas8Jw4S9FyUJFy7Jw1a
 vFW5CFyrCFsFqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
 C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
 nUUI43ZEXa7VUjXAw3UUUUU==
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

RLB/MML/MMWP bits in mseccfg CSR are introduced by Smepmp extension.
So they can only be writable and set to 1s when cfg.epmp is true.
Then we also need't check on epmp in pmp_hart_has_privs_default().

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 50 ++++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 1d42cfb5f8..10a4c7c8f4 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -243,30 +243,28 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
-    if (riscv_cpu_cfg(env)->epmp) {
-        if (MSECCFG_MMWP_ISSET(env)) {
-            /*
-             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
-             * so we default to deny all, even for M-mode.
-             */
+    if (MSECCFG_MMWP_ISSET(env)) {
+        /*
+         * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
+         * so we default to deny all, even for M-mode.
+         */
+        *allowed_privs = 0;
+        return false;
+    } else if (MSECCFG_MML_ISSET(env)) {
+        /*
+         * The Machine Mode Lockdown (mseccfg.MML) bit is set
+         * so we can only execute code in M-mode with an applicable
+         * rule. Other modes are disabled.
+         */
+        if (mode == PRV_M && !(privs & PMP_EXEC)) {
+            ret = true;
+            *allowed_privs = PMP_READ | PMP_WRITE;
+        } else {
+            ret = false;
             *allowed_privs = 0;
-            return false;
-        } else if (MSECCFG_MML_ISSET(env)) {
-            /*
-             * The Machine Mode Lockdown (mseccfg.MML) bit is set
-             * so we can only execute code in M-mode with an applicable
-             * rule. Other modes are disabled.
-             */
-            if (mode == PRV_M && !(privs & PMP_EXEC)) {
-                ret = true;
-                *allowed_privs = PMP_READ | PMP_WRITE;
-            } else {
-                ret = false;
-                *allowed_privs = 0;
-            }
-
-            return ret;
         }
+
+        return ret;
     }
 
     if (!riscv_cpu_cfg(env)->pmp || (mode == PRV_M)) {
@@ -580,8 +578,12 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
         }
     }
 
-    /* Sticky bits */
-    val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
+    if (riscv_cpu_cfg(env)->epmp) {
+        /* Sticky bits */
+        val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
+    } else {
+        val &= ~(MSECCFG_MMWP | MSECCFG_MML | MSECCFG_RLB);
+    }
 
     env->mseccfg = val;
 }
-- 
2.25.1


