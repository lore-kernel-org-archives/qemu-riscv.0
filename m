Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOEZ8-0004ef-4u
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 04:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oOEZ5-0004dJ-F2; Wed, 17 Aug 2022 04:38:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:60614 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oOEZ1-00066b-Kc; Wed, 17 Aug 2022 04:38:15 -0400
Received: from localhost.localdomain (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowABHT5_nqPxij6fUCQ--.18388S2;
 Wed, 17 Aug 2022 16:38:01 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3-31{h}
Date: Wed, 17 Aug 2022 16:37:56 +0800
Message-Id: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABHT5_nqPxij6fUCQ--.18388S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw13Ar1UZF4kAw47XFy3twb_yoW8XFy3pa
 1rK3y5G397Cr9Fkas3W3W5Xr45CFykXrW5Ga1xCFy0yr43tF4rXr9rGr1Yqry8Jr98trsF
 9F1UuF9xZF47Wa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 17 Aug 2022 08:38:15 -0000

- modify check for mcounteren to work in all less-privilege mode
- modify check for scounteren to work only when S mode is enabled
- distinguish the exception type raised by check for scounteren between U
and VU mode

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
v3:
 - remove unnecessary ()'s

v2:
 - Rebase on patches v13 for "Improve PMU support"

 target/riscv/csr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2dcd4e5b2d..ca72b5df98 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -98,17 +98,22 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
 skip_ext_pmu_check:
 
-    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
-        ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
+    if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        if (!get_field(env->hcounteren, ctr_mask) &&
-            get_field(env->mcounteren, ctr_mask)) {
+        if (!get_field(env->hcounteren, ctr_mask) ||
+            (env->priv == PRV_U && !get_field(env->scounteren, ctr_mask))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
+
+    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
+        !get_field(env->scounteren, ctr_mask)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
 #endif
     return RISCV_EXCP_NONE;
 }
-- 
2.17.1


