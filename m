Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1padrb-0005V3-Ns
	for mharc-qemu-riscv@gnu.org; Fri, 10 Mar 2023 09:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi2000@zju.edu.cn>)
 id 1padrW-0005QN-KD; Fri, 10 Mar 2023 09:36:51 -0500
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi2000@zju.edu.cn>)
 id 1padrT-0001AO-Pa; Fri, 10 Mar 2023 09:36:50 -0500
Received: from toga-arch.localdomain (unknown [112.10.177.110])
 by mail-app3 (Coremail) with SMTP id cC_KCgBHyLTwPwtkJzocDg--.54936S2;
 Fri, 10 Mar 2023 22:34:30 +0800 (CST)
From: chenyi2000@zju.edu.cn
To: qemu-devel@nongnu.org
Cc: Yi Chen <chenyi2000@zju.edu.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2] target/riscv: fix H extension TVM trap
Date: Fri, 10 Mar 2023 22:33:27 +0800
Message-Id: <20230310143328.145347-1-chenyi2000@zju.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cC_KCgBHyLTwPwtkJzocDg--.54936S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar45WFW5ur4kGr4rtrW5KFg_yoW7XFW8pF
 4UK39Ik3yUJF9rAan3tr1DGa1rAw1xGayjy3Z7Wa1FyF1fAr4rCryDXr9F9FykWr4Dur4j
 vFW8ZFZ8Zr42yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lw4CEc2x0rVAKj4xxMxkF7I0Ew4C26cxK6c8Ij28IcwCY02Avz4vE14v_Xryl42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUbrWrUUUUU
X-CM-SenderInfo: xfkh05blsqiio62m3hxhgxhubq/
Received-SPF: pass client-ip=207.46.229.174;
 envelope-from=chenyi2000@zju.edu.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Mar 2023 14:36:52 -0000

From: Yi Chen <chenyi2000@zju.edu.cn>

- Trap satp/hgatp accesses from HS-mode when MSTATUS.TVM is enabled.
- Trap satp accesses from VS-mode when HSTATUS.VTVM is enabled.
- Raise RISCV_EXCP_ILLEGAL_INST when U-mode executes SFENCE.VMA/SINVAL.VMA.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  SFENCE.VMA/SINVAL.VMA or VS-mode executes SFENCE.VMA/SINVAL.VMA with
  HSTATUS.VTVM enabled.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  HFENCE.GVMA/HFENCE.VVMA/HINVAL.GVMA/HINVAL.VVMA.

Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
---
 target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
 target/riscv/op_helper.c |  9 ++++---
 2 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..26a02e57bd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -443,6 +443,30 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
     return sstc(env, csrno);
 }
 
+static RISCVException satp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env) &&
+        get_field(env->hstatus, HSTATUS_VTVM)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return smode(env, csrno);
+}
+
+static RISCVException hgatp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -2655,13 +2679,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
         *val = 0;
         return RISCV_EXCP_NONE;
     }
-
-    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    } else {
-        *val = env->satp;
-    }
-
+    *val = env->satp;
     return RISCV_EXCP_NONE;
 }
 
@@ -2684,18 +2702,14 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     }
 
     if (vm && mask) {
-        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            /*
-             * The ISA defines SATP.MODE=Bare as "no translation", but we still
-             * pass these through QEMU's TLB emulation as it improves
-             * performance.  Flushing the TLB on SATP writes with paging
-             * enabled avoids leaking those invalid cached mappings.
-             */
-            tlb_flush(env_cpu(env));
-            env->satp = val;
-        }
+        /*
+         * The ISA defines SATP.MODE=Bare as "no translation", but we still
+         * pass these through QEMU's TLB emulation as it improves
+         * performance.  Flushing the TLB on SATP writes with paging
+         * enabled avoids leaking those invalid cached mappings.
+         */
+        tlb_flush(env_cpu(env));
+        env->satp = val;
     }
     return RISCV_EXCP_NONE;
 }
@@ -4180,7 +4194,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
-    [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
+    [CSR_SATP]     = { "satp",     satp, read_satp,     write_satp     },
 
     /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
     [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
@@ -4217,7 +4231,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
+    [CSR_HGATP]       = { "hgatp",       hgatp,   read_hgatp,   write_hgatp,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
                           write_htimedelta,
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..fbccca9e0b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -381,12 +381,13 @@ void helper_wfi(CPURISCVState *env)
 void helper_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    if (!(env->priv >= PRV_S) ||
-        (env->priv == PRV_S &&
+    if ((!(env->priv >= PRV_S) && !riscv_cpu_virt_enabled(env)) ||
+        (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
          get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
-               get_field(env->hstatus, HSTATUS_VTVM)) {
+               (!(env->priv >= PRV_S) ||
+                get_field(env->hstatus, HSTATUS_VTVM))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         tlb_flush(cs);
@@ -403,7 +404,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+    if (env->priv <= PRV_S && riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
-- 
2.39.2


