Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nr8Sd-0003IA-A1
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 21:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nr8Sc-0003Hy-Eb; Tue, 17 May 2022 21:26:46 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47746 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nr8SZ-0007is-K5; Tue, 17 May 2022 21:26:45 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_JBIS4RizeBfCA--.29179S2;
 Wed, 18 May 2022 09:26:34 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
Date: Wed, 18 May 2022 09:26:11 +0800
Message-Id: <20220518012611.6772-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAD3_JBIS4RizeBfCA--.29179S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4DXr4DZw43Wr17ZFb_yoW8Xr4kpr
 47GayakrZ5JF13G3yfXF17K3WUurn7JayxKa97Xw1Igr42yrWDZr4qkr1xWr9Yga95ZayS
 9F12kF15ZanrJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
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
X-List-Received-Date: Wed, 18 May 2022 01:26:46 -0000

 - setting ext_g will implicitly set ext_i

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d01569cad..e373c61ba2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -584,18 +584,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         uint32_t ext = 0;
 
         /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
-
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
-
         if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                                 cpu->cfg.ext_a && cpu->cfg.ext_f &&
                                 cpu->cfg.ext_d &&
@@ -610,6 +598,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_ifencei = true;
         }
 
+        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "I and E extensions are incompatible");
+            return;
+        }
+
+        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "Either I or E extension must be set");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
-- 
2.17.1


