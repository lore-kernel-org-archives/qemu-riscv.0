Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB9SQ-0003fr-Ji
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 02:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SM-0003Wp-5w; Tue, 12 Jul 2022 02:33:14 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53770 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SJ-0001bw-C0; Tue, 12 Jul 2022 02:33:13 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowADns1idFc1ijYPeDg--.64613S7;
 Tue, 12 Jul 2022 14:33:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 5/6] target/riscv: fix checks in hmode/hmode32
Date: Tue, 12 Jul 2022 14:32:35 +0800
Message-Id: <20220712063236.23834-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADns1idFc1ijYPeDg--.64613S7
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1kXFyDCFWfWryrCrg_yoW8Aw15pr
 47u3yak34DJF9rAa97tF1UJw1UCF13W3yUCws7u3yxtF4rA3yYqF1qqw429FykXFWkur42
 9F1UCF1rZr47XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
 GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTYUUUUU
X-Originating-IP: [180.156.173.38]
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
X-List-Received-Date: Tue, 12 Jul 2022 06:33:14 -0000

- add check for the implicit dependence between H and S
- Csrs only existed in RV32 will not trigger virtual instruction fault
when not in RV32

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/csr.c | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b8ce0959cb..455787a940 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -738,6 +738,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+            error_setg(errp, "H extension implicitly requires S-mode");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1edeb69366..deddeb100e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
 
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
-    if (riscv_has_ext(env, RVS) &&
-        riscv_has_ext(env, RVH)) {
+    if (riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
@@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (!riscv_cpu_virt_enabled(env)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return hmode(env, csrno);
-- 
2.17.1


