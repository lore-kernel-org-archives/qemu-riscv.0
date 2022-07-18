Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDQVx-0002Sk-Rr
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVv-0002Ml-Lb; Mon, 18 Jul 2022 09:10:19 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43168 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVo-00030j-47; Mon, 18 Jul 2022 09:10:19 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowABnbweqW9Vi5+hPEQ--.55056S8;
 Mon, 18 Jul 2022 21:10:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH V3 6/6] target/riscv: Simplify the check in hmode to resue the
 check in riscv_csrrw_check
Date: Mon, 18 Jul 2022 21:09:55 +0800
Message-Id: <20220718130955.11899-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowABnbweqW9Vi5+hPEQ--.55056S8
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4fZr4rXF47Zw4rur18Grg_yoW5Jw1kpr
 4rC3y7C34ktrZFya9xtF1UXF45CF43G3yUX3Z7u3y8ZF13Z3y09r98XFWrtF98uryDuF4a
 9FWjyFs3AF4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTYUUUUU
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Mon, 18 Jul 2022 13:10:19 -0000

Just add 1 to the effective privledge level when in HS mode, then reuse
the check of 'effective_priv < csr_priv' in riscv_csrrw_check to replace
the privilege level related check in hmode. Then, hmode will only check
whether H extension is supported.

When accessing Hypervior CSRs:
   1) If accessing from M privilege level, the check of
'effective_priv< csr_priv' passes, returns hmode(...) which will return
RISCV_EXCP_ILLEGAL_INST when H extension is not supported and return
RISCV_EXCP_NONE otherwise.
   2) If accessing from HS privilege level, effective_priv will add 1,
the check passes and also returns hmode(...) too.
   3) If accessing from VS/VU privilege level, the check fails, and
returns RISCV_EXCP_VIRT_INSTRUCTION_FAULT
   4) If accessing from U privilege level, the check fails, and returns
RISCV_EXCP_ILLEGAL_INST

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/csr.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cf15aa67b7..0fb042b2fd 100644
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
@@ -3279,13 +3273,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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


