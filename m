Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oASEl-0003s7-GI
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 04:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEj-0003qL-FF; Sun, 10 Jul 2022 04:24:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36416 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEg-0005eh-LZ; Sun, 10 Jul 2022 04:24:17 -0400
Received: from liww-tm.www.tendawifi.com (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAAnLASjjMpiF30+Dg--.38648S7;
 Sun, 10 Jul 2022 16:24:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 5/6] target/riscv: fix checks in hmode/hmode32
Date: Sun, 10 Jul 2022 16:23:59 +0800
Message-Id: <20220710082400.29224-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowAAnLASjjMpiF30+Dg--.38648S7
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF48uF1rXry8trW8Zwb_yoW8Jw4kpr
 43u3y7Kr9xtasFvayxKr48Jr43AF47G3yUCw4Du3y8tF45A3y5tF1Dta1IvFykXFW8ur42
 9F4xCF1rZw47AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [117.151.235.104]
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
X-List-Received-Date: Sun, 10 Jul 2022 08:24:17 -0000

- It seems that there is no explicitly description about whether
the Hypervisor CSRs requires S extension
- Csrs only existed in RV32 will not trigger virtual instruction fault
when not in RV32

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0d8e98b7a9..975007f1ac 100644
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


