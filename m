Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psPDi-0002KX-0P
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 10:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDg-0002F2-1c; Fri, 28 Apr 2023 10:37:08 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDd-0008Bh-Vn; Fri, 28 Apr 2023 10:37:07 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACHj3vq2UtkrB5ZDA--.57839S14;
 Fri, 28 Apr 2023 22:36:35 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 12/13] target/riscv: Separate pmp_update_rule() in
 pmpcfg_csr_write
Date: Fri, 28 Apr 2023 22:36:20 +0800
Message-Id: <20230428143621.142390-13-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHj3vq2UtkrB5ZDA--.57839S14
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18uw43ZF15KryDGry5twb_yoW8uF4rpr
 WfCFZ2gF43t3Wqqan3tF4UZF1UCa1rKr42vws7GanYya15uw1rCF1qga4v9r15GayfZrWY
 9ayUAr4UAF47ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1lc2xSY4AK67AK6ry5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
 AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE
 2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
 IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
 KfnxnUUI43ZEXa7VUbfOz3UUUUU==
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 14:37:08 -0000

Use pmp_update_rule_addr() and pmp_update_rule_nums() separately to
update rule nums only once for each pmpcfg_csr_write. Then remove
pmp_update_rule() since it become unused.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/pmp.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 330f61b0f1..317c28ba73 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -29,7 +29,6 @@
 static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
 static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
-static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
 
 /*
  * Accessor method to extract address matching type 'a field' from cfg reg
@@ -121,7 +120,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
         } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
-            pmp_update_rule(env, pmp_index);
+            pmp_update_rule_addr(env, pmp_index);
             return true;
         }
     } else {
@@ -209,18 +208,6 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-/*
- * Convert cfg/addr reg values here into simple 'sa' --> start address and 'ea'
- *   end address values.
- *   This function is called relatively infrequently whereas the check that
- *   an address is within a pmp rule is called often, so optimise that one
- */
-static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
-{
-    pmp_update_rule_addr(env, pmp_index);
-    pmp_update_rule_nums(env);
-}
-
 static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
                            target_ulong addr)
 {
@@ -481,6 +468,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 
     /* If PMP permission of any addr has been changed, flush TLB pages. */
     if (modified) {
+        pmp_update_rule_nums(env);
         tlb_flush(env_cpu(env));
     }
 }
-- 
2.25.1


