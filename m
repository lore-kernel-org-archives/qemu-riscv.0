Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqRUv-0006z2-KO
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 23:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRUt-0006yU-PV; Sun, 15 May 2022 23:34:15 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:50358 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqRUr-0002wL-7h; Sun, 15 May 2022 23:34:15 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACHA+ErxoFinf0YBw--.36458S2;
 Mon, 16 May 2022 11:34:05 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
Date: Mon, 16 May 2022 11:33:56 +0800
Message-Id: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowACHA+ErxoFinf0YBw--.36458S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4DJr47Zw47Cw1kAFb_yoW8ArW8pr
 47GayYyrWDJF4UGw4xXF1UKF15Wrn7C3yxW3ykX3Wagr4Skr13Ar4vkw1UuF4Fq3WrX3Wf
 uF17CryqyrsrJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
X-List-Received-Date: Mon, 16 May 2022 03:34:16 -0000

 - setting ext_g will implicitly set ext_i

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 slirp              |  2 +-
 target/riscv/cpu.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/slirp b/slirp
index 9d59bb775d..a88d9ace23 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
+Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..b12f69c584 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -583,6 +583,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     if (env->misa_ext == 0) {
         uint32_t ext = 0;
 
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+                                cpu->cfg.ext_d)) {
+            warn_report("Setting G will also set IMAFD");
+            cpu->cfg.ext_i = true;
+            cpu->cfg.ext_m = true;
+            cpu->cfg.ext_a = true;
+            cpu->cfg.ext_f = true;
+            cpu->cfg.ext_d = true;
+        }
+
+
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -596,17 +608,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                                cpu->cfg.ext_a & cpu->cfg.ext_f &
-                                cpu->cfg.ext_d)) {
-            warn_report("Setting G will also set IMAFD");
-            cpu->cfg.ext_i = true;
-            cpu->cfg.ext_m = true;
-            cpu->cfg.ext_a = true;
-            cpu->cfg.ext_f = true;
-            cpu->cfg.ext_d = true;
-        }
-
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx = true;
-- 
2.17.1


