Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZuc2-0000pe-J8
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 09:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pZt2g-0001Vd-98; Wed, 08 Mar 2023 07:37:14 -0500
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pZt2e-0003cs-1W; Wed, 08 Mar 2023 07:37:14 -0500
Received: from toga-arch.localdomain (unknown [112.10.177.110])
 by mail-app2 (Coremail) with SMTP id by_KCgCXWrDugAhk_Ld1Cw--.43485S2;
 Wed, 08 Mar 2023 20:34:57 +0800 (CST)
From: chenyi2000@zju.edu.cn
To: qemu-devel@nongnu.org
Cc: Yi Chen <chenyi2000@zju.edu.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv/csr.c: fix H extension TVM trap
Date: Wed,  8 Mar 2023 20:34:17 +0800
Message-Id: <20230308123417.12555-1-chenyi2000@zju.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: by_KCgCXWrDugAhk_Ld1Cw--.43485S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF43ZFyxCr4rCry3Cw4kZwb_yoW8Aw4kpa
 18J390k3yUKFWqya1fJr1qgw13AFWUGayDA3Z7Wa1rAr1fAryrCF1DWr9FqFyDWFWDJFs2
 vFWDuFZ8AF42kFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lw4CEc2x0rVAKj4xxMxkF7I0Ew4C26cxK6c8Ij28IcwCY02Avz4vE14v_Xr1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
 yTuYvjfUUD73UUUUU
X-CM-SenderInfo: xfkh05blsqiio62m3hxhgxhubq/
Received-SPF: pass client-ip=46.101.248.176;
 envelope-from=chenyi2000@zju.edu.cn;
 helo=zg8tndyumtaxlji0oc4xnzya.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Mar 2023 09:17:29 -0500
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
X-List-Received-Date: Wed, 08 Mar 2023 12:37:14 -0000

From: Yi Chen <chenyi2000@zju.edu.cn>

Trap accesses to hgatp if MSTATUS_TVM is enabled.
Don't trap accesses to vsatp even if MSTATUS_TVM is enabled.

Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
---
 target/riscv/csr.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab56663..09bc780 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2655,7 +2655,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
         return RISCV_EXCP_ILLEGAL_INST;
     } else {
         *val = env->satp;
@@ -2683,7 +2683,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     }
 
     if (vm && mask) {
-        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) && get_field(env->mstatus, MSTATUS_TVM)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             /*
@@ -3047,14 +3047,24 @@ static RISCVException read_hgeip(CPURISCVState *env, int csrno,
 static RISCVException read_hgatp(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->hgatp;
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        *val = env->hgatp;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hgatp(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    env->hgatp = val;
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        env->hgatp = val;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.2


