Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbKTi-0008M0-Ie
	for mharc-qemu-riscv@gnu.org; Sun, 12 Mar 2023 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pbKTf-0008LU-Tg; Sun, 12 Mar 2023 08:07:03 -0400
Received: from spam.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pbKTc-00012Z-A8; Sun, 12 Mar 2023 08:07:03 -0400
Received: from toga-arch.localdomain (unknown [10.192.17.151])
 by mail-app4 (Coremail) with SMTP id cS_KCgAXUvxKwA1kTwnpCw--.40378S2;
 Sun, 12 Mar 2023 20:06:40 +0800 (CST)
From: Yi Chen <chenyi2000@zju.edu.cn>
To: qemu-devel@nongnu.org
Cc: Yi Chen <chenyi2000@zju.edu.cn>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4] target/riscv: fix H extension TVM trap
Date: Sun, 12 Mar 2023 20:05:38 +0800
Message-Id: <20230312120538.15286-1-chenyi2000@zju.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cS_KCgAXUvxKwA1kTwnpCw--.40378S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar45WFW5ur4kGr4rtrW5KFg_yoW7Ar1fpa
 1UK39Ik3yUJF9rAan3Kr4DGa1rAw1xGayqk3WkWa1rAF1fCr45CryDXryq9FykWr4Dur4j
 vFW8ZF98Zr42yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24V
 AvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0Ew4C2
 6cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUzBTnUUUUU=
X-CM-SenderInfo: xfkh05blsqiio62m3hxhgxhubq/
Received-SPF: pass client-ip=61.164.42.155; envelope-from=chenyi2000@zju.edu.cn;
 helo=zju.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 12 Mar 2023 12:07:04 -0000

- Trap satp/hgatp accesses from HS-mode when MSTATUS.TVM is enabled.
- Trap satp accesses from VS-mode when HSTATUS.VTVM is enabled.
- Raise RISCV_EXCP_ILLEGAL_INST when U-mode executes SFENCE.VMA/SINVAL.VMA.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  SFENCE.VMA/SINVAL.VMA or VS-mode executes SFENCE.VMA/SINVAL.VMA with
  HSTATUS.VTVM enabled.
- Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
  HFENCE.GVMA/HFENCE.VVMA/HINVAL.GVMA/HINVAL.VVMA.

Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
Add reviewed-by
Replace "env->priv <= PRV_S && riscv_cpu_virt_enabled(env)" with "riscv_cpu_virt_enabled(env)"
 target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
 target/riscv/op_helper.c | 12 ++++-----
 2 files changed, 41 insertions(+), 27 deletions(-)

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
index 84ee018f7d..8e16020f8d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -381,12 +381,12 @@ void helper_wfi(CPURISCVState *env)
 void helper_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    if (!(env->priv >= PRV_S) ||
-        (env->priv == PRV_S &&
-         get_field(env->mstatus, MSTATUS_TVM))) {
+    if (!riscv_cpu_virt_enabled(env) &&
+        (env->priv == PRV_U ||
+         (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
-               get_field(env->hstatus, HSTATUS_VTVM)) {
+    } else if (riscv_cpu_virt_enabled(env) &&
+               (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         tlb_flush(cs);
@@ -403,7 +403,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+    if (riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
-- 
2.39.2


