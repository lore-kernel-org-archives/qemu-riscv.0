Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB9SV-0003qI-T3
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 02:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SN-0003Zn-RA; Tue, 12 Jul 2022 02:33:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53808 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SK-0001ct-4r; Tue, 12 Jul 2022 02:33:15 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowADns1idFc1ijYPeDg--.64613S8;
 Tue, 12 Jul 2022 14:33:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 6/6] target/riscv: simplify the check in hmode to resue the
 check in riscv_csrrw_check
Date: Tue, 12 Jul 2022 14:32:36 +0800
Message-Id: <20220712063236.23834-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADns1idFc1ijYPeDg--.64613S8
X-Coremail-Antispam: 1UD129KBjvJXoW7uF13AF17uF48Jw4kGrW3Jrb_yoW5JryDpr
 4fC3y7Ga4kKrZ2ya9xKF1UXF45CF43GayUX3Wku3y8AF43Z3y09r98XF4FvF9xuryDursI
 9FWjyr1fAF4UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
 GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Tue, 12 Jul 2022 06:33:16 -0000

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index deddeb100e..aa87698d1d 100644
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


