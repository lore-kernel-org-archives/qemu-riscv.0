Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRn01-000789-5T
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 23:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRn00-00077k-16; Mon, 13 Feb 2023 23:33:00 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRmzx-0006fK-6T; Mon, 13 Feb 2023 23:32:59 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp72t1676349121tcm6236y
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 12:31:59 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 17/18] target/riscv: Group all predicate() routines together
Date: Tue, 14 Feb 2023 12:31:57 +0800
Message-Id: <20230213180215.1524938-18-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Tue, 14 Feb 2023 04:33:00 -0000

Move sstc()/sstc32() to where all predicate() routines live.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 108 ++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 40aae9e7b3..37350b8a6d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -399,6 +399,60 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sstc(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    bool hmode_check = false;
+
+    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
+        hmode_check = true;
+    }
+
+    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    /*
+     * No need of separate function for rv32 as menvcfg stores both menvcfg
+     * menvcfgh for RV32.
+     */
+    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
+          get_field(env->menvcfg, MENVCFG_STCE))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (riscv_cpu_virt_enabled(env)) {
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
+              get_field(env->henvcfg, HENVCFG_STCE))) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException sstc_32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return sstc(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -942,60 +996,6 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException sstc(CPURISCVState *env, int csrno)
-{
-    RISCVCPU *cpu = env_archcpu(env);
-    bool hmode_check = false;
-
-    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
-    if (ret != RISCV_EXCP_NONE) {
-        return ret;
-    }
-
-    if (env->debugger) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (env->priv == PRV_M) {
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * No need of separate function for rv32 as menvcfg stores both menvcfg
-     * menvcfgh for RV32.
-     */
-    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
-          get_field(env->menvcfg, MENVCFG_STCE))) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
-              get_field(env->henvcfg, HENVCFG_STCE))) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-    }
-
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException sstc_32(CPURISCVState *env, int csrno)
-{
-    if (riscv_cpu_mxl(env) != MXL_RV32) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    return sstc(env, csrno);
-}
-
 static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-- 
2.25.1


