Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWyuM-0006Lj-W2
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 07:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuK-0006J3-F0; Tue, 28 Feb 2023 07:16:36 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuI-0006xI-Au; Tue, 28 Feb 2023 07:16:35 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp68t1677581494t0y4o8vr
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:51:32 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 10/18] target/riscv: Avoid reporting odd-numbered pmpcfgX
 in the CSR XML for RV64
Date: Tue, 28 Feb 2023 18:40:26 +0800
Message-Id: <20230228104035.1879882-11-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 12:16:37 -0000

At present the odd-numbered PMP configuration registers for RV64 are
reported in the CSR XML by QEMU gdbstub. However these registers do
not exist on RV64 so trying to access them from gdb results in 'E14'.

Move the pmpcfgX index check from the actual read/write routine to
the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
be reported in the CSR XML for RV64.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

Changes in v2:
- keep the 'RV128 restriction check' todo comment

 target/riscv/csr.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8e827362cc..7284fd8a0d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -412,6 +412,15 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->pmp) {
+        if (csrno <= CSR_PMPCFG3) {
+            uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+            /* TODO: RV128 restriction check */
+            if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+
         return RISCV_EXCP_NONE;
     }
 
@@ -3331,23 +3340,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
-{
-    /* TODO: RV128 restriction check */
-    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
-        return false;
-    }
-    return true;
-}
-
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
@@ -3357,9 +3354,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
-- 
2.25.1


