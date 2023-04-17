Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poGWm-0003DP-0s
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 00:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1poGWk-0003Cv-NQ; Mon, 17 Apr 2023 00:31:42 -0400
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1poGWh-0008JA-R8; Mon, 17 Apr 2023 00:31:42 -0400
X-QQ-mid: bizesmtp88t1681705865tzn62m74
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 17 Apr 2023 12:30:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0F000000A0000000
X-QQ-FEAT: PsQCk6chbj7q3Z0SQVVv+8a7eKclznoUAwwNniVNX3JmK1FKRe0YVchUl0orY
 fpsk86yvwtbwYJ9m5u2hFii8drN/GCOlHm1SMzLlB61G7Fb/Z66zc2u54eqKIZ0zXiRt6Nh
 TlBNLFYQviwbY8OE+qGM9SVqvw1LCKAYhAXzQ9bhakpDay32kdo9yzkBYt1P5OxgNjJmje9
 n6bO8AZpnTOPnuTzH3gMCC+Nc/DH1DuEXYjwTqvlhYnwP2ejRKpdfRMQprRknEkJRhCBSZV
 7E9ZlsoqoihjnyQQe4RjSAlJp8t7oyD+7jCGk/1XE1zUIpAekB9CjDTGvd0jM+Udt9V2eTK
 cV49Vc1YKEjltB0Zkg=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10776344779436194532
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2] target/riscv: Restore the predicate() NULL check behavior
Date: Mon, 17 Apr 2023 12:30:54 +0800
Message-Id: <20230417043054.3125614-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz7a-0
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 17 Apr 2023 04:31:43 -0000

When reading a non-existent CSR QEMU should raise illegal instruction
exception, but currently it just exits due to the g_assert() check.

This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617.
Some comments are also added to indicate that predicate() must be
provided for an implemented CSR.

Reported-by: Fei Wu <fei2.wu@intel.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

---

Changes in v2:
- rebase on top of Alistair's riscv-to-apply.next tree

 target/riscv/csr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4d2dcfdc8..7000eb3350 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3817,6 +3817,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* ensure CSR is implemented by checking predicate */
+    if (!csr_ops[csrno].predicate) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     /* privileged spec version check */
     if (env->priv_ver < csr_min_priv) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -3834,7 +3839,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
      * illegal instruction exception should be triggered instead of virtual
      * instruction exception. Hence this comes after the read / write check.
      */
-    g_assert(csr_ops[csrno].predicate != NULL);
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
@@ -4023,7 +4027,10 @@ static RISCVException write_jvt(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-/* Control and Status Register function table */
+/*
+ * Control and Status Register function table
+ * riscv_csr_operations::predicate() must be provided for an implemented CSR
+ */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },
-- 
2.25.1


