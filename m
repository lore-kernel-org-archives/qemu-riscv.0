Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkMgF-0001NX-K6
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 06:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pkMgE-0001IS-2h; Thu, 06 Apr 2023 06:17:22 -0400
Received: from spam.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi2000@zju.edu.cn>)
 id 1pkMgA-0002nP-F2; Thu, 06 Apr 2023 06:17:21 -0400
Received: from toga-arch.localdomain (unknown [10.192.17.134])
 by mail-app4 (Coremail) with SMTP id cS_KCgD3rX0VnC5kJSe+AA--.16479S2;
 Thu, 06 Apr 2023 18:17:03 +0800 (CST)
From: Yi Chen <chenyi2000@zju.edu.cn>
To: qemu-devel@nongnu.org
Cc: Yi Chen <chenyi2000@zju.edu.cn>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v5] target/riscv: fix H extension TVM trap
Date: Thu,  6 Apr 2023 18:15:59 +0800
Message-Id: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cS_KCgD3rX0VnC5kJSe+AA--.16479S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr17WrW7Jw4fWry3Kr18uFg_yoW7WFWDpa
 18G39Ik3y8GF97Cws3Kr1DW3WrAw4xGayqy3WkGa1rAr1fCr1rCFyDXryvgFykWr4DWr12
 vFW8ZrWDZr42yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6c
 xK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAKzI0E
 Y4vE52x082I5MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUzBTnUUUUU=
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
X-List-Received-Date: Thu, 06 Apr 2023 10:17:22 -0000

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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
Rebase the patch on https://github.com/alistair23/qemu/tree/riscv-to-apply.next
Add "Reviewed-by: LIU Zhiwei"
 target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
 target/riscv/op_helper.c | 12 ++++-----
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0b871f6dc..d6669d8524 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -449,6 +449,30 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
     return sstc(env, csrno);
 }
 
+static RISCVException satp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !env->virt_enabled &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (env->priv == PRV_S && env->virt_enabled &&
+        get_field(env->hstatus, HSTATUS_VTVM)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return smode(env, csrno);
+}
+
+static RISCVException hgatp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && !env->virt_enabled &&
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
@@ -2647,13 +2671,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
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
 
@@ -2676,18 +2694,14 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
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
@@ -4183,7 +4197,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
-    [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
+    [CSR_SATP]     = { "satp",     satp, read_satp,     write_satp     },
 
     /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
     [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
@@ -4220,7 +4234,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
+    [CSR_HGATP]       = { "hgatp",       hgatp,   read_hgatp,   write_hgatp,
                           .min_priv_ver = PRIV_VERSION_1_12_0                },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
                           write_htimedelta,
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ec9a384772..7cbe13db3f 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -380,12 +380,12 @@ void helper_wfi(CPURISCVState *env)
 void helper_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-    if (!(env->priv >= PRV_S) ||
-        (env->priv == PRV_S &&
-         get_field(env->mstatus, MSTATUS_TVM))) {
+    if (!env->virt_enabled &&
+        (env->priv == PRV_U ||
+         (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
-               get_field(env->hstatus, HSTATUS_VTVM)) {
+    } else if (env->virt_enabled &&
+               (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         tlb_flush(cs);
@@ -402,7 +402,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && env->virt_enabled) {
+    if (env->virt_enabled) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
-- 
2.40.0


