Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oASEn-0003yp-Id
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEj-0003qh-Pj; Sun, 10 Jul 2022 04:24:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36422 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEh-0005ej-Fz; Sun, 10 Jul 2022 04:24:17 -0400
Received: from liww-tm.www.tendawifi.com (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAAnLASjjMpiF30+Dg--.38648S8;
 Sun, 10 Jul 2022 16:24:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 6/6] target/riscv: simplify the check in hmode to resue the
 check in riscv_csrrw_check
Date: Sun, 10 Jul 2022 16:24:00 +0800
Message-Id: <20220710082400.29224-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowAAnLASjjMpiF30+Dg--.38648S8
X-Coremail-Antispam: 1UD129KBjvJXoW7uF13AF17uF48Jw4kGrW3Jrb_yoW8KFWxpr
 4xC347Ga4kKrZFya9xtF1UXF45CF43GayUX3Z293y8AF43ZrW09r95XFWFvF9xXFyDursI
 vF40yr1fAF47Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTYUUUUU
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
X-List-Received-Date: Sun, 10 Jul 2022 08:24:18 -0000

Just add 1 to the effective privledge level when in HS mode, then reuse the check
'effective_priv < csr_priv' in riscv_csrrw_check to replace the privilege level
related check in hmode. Then, hmode will only check whether H extension is supported.

when accessing Hypervior CSRs:
   1) if access from M privilege level, the check of 'effective_priv < csr_priv'
passes, returns hmode(...) which will return RISCV_EXCP_ILLEGAL_INST when H
extension is not supported and return RISCV_EXCP_NONE otherwise.
   2) if access from HS privilege level, effective_priv will add 1, the check
passes too, also returns hmode(...) too.
   3) if access from VS/VU privilege level, the check fails, and returns
RISCV_EXCP_VIRT_INSTRUCTION_FAULT
   4) if access from U privilege level, the check fails, and returns
RISCV_EXCP_ILLEGAL_INST

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 975007f1ac..2b3ed94366 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVH)) {
-        /* Hypervisor extension is supported */
-        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            env->priv == PRV_M) {
-            return RISCV_EXCP_NONE;
-        } else {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
+        return RISCV_EXCP_NONE;
     }
 
     return RISCV_EXCP_ILLEGAL_INST;
@@ -3280,13 +3274,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv, effective_priv = env->priv;
 
-    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
+    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
+        !riscv_cpu_virt_enabled(env)) {
         /*
-         * We are in either HS or VS mode.
-         * Add 1 to the effective privledge level to allow us to access the
-         * Hypervisor CSRs. The `hmode` predicate will determine if access
-         * should be allowed(HS) or if a virtual instruction exception should be
-         * raised(VS).
+         * We are in HS mode. Add 1 to the effective privledge level to
+         * allow us to access the Hypervisor CSRs.
          */
         effective_priv++;
     }
-- 
2.17.1


