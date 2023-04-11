Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm9u3-0004Qt-Mr
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 05:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pm9u1-0004QY-Gs; Tue, 11 Apr 2023 05:03:01 -0400
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pm9ty-0005Oj-Sz; Tue, 11 Apr 2023 05:03:01 -0400
X-QQ-mid: bizesmtp90t1681203743t0ap21fw
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 11 Apr 2023 17:02:11 +0800 (CST)
X-QQ-SSF: 01200000000000D0F000000A0000000
X-QQ-FEAT: cy+SGFpNa8duaVCl5WNrH/sW0Sn8KWt+x+a4B58qA8ieBl997q2AcKrs3YV+9
 ZqXALJMrxHyOJuOu6FeK7WGf2u/rngm8MQEeeb1Ib1OcRgZbuSutzgwfYg9coI6HHEWUUFy
 gFl0nI+Jyqx5OL3gBS33JlSu9S+Fjw7ExwDuDlUzinqHygonktylmpn3kt4lqshskXkpdB9
 NnnHp7dupGqCvqzBwDSsIa1LOSHip9GwQ7GoK2gbbA6ksb1eJfT6xQToi7u3uQ80J+zT4fT
 q7QxPUXMHvTP/oo4+DGjnGvpq52EBzLRc2PUsafClYSMiNrj9Lih9Z0ET9TBrtylGlhu8k7
 1jENfE5BiccVWvcrsw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17000592329357289727
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>
Subject: [PATCH] target/riscv: Restore the predicate() NULL check behavior
Date: Tue, 11 Apr 2023 17:02:11 +0800
Message-Id: <20230411090211.3039186-1-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 11 Apr 2023 09:03:02 -0000

When reading a non-existent CSR QEMU should raise illegal instruction
exception, but currently it just exits due to the g_assert() check.

This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
Some comments are also added to indicate that predicate() must be
provided for an implemented CSR.

Reported-by: Fei Wu <fei2.wu@intel.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..736ab64275 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3797,6 +3797,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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
@@ -3814,7 +3819,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
      * illegal instruction exception should be triggered instead of virtual
      * instruction exception. Hence this comes after the read / write check.
      */
-    g_assert(csr_ops[csrno].predicate != NULL);
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
@@ -3991,7 +3995,10 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
     return ret;
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


