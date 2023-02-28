Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxT8-0001dN-2f
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxT6-0001cx-Bf; Tue, 28 Feb 2023 05:44:24 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxT3-0002tI-J9; Tue, 28 Feb 2023 05:44:24 -0500
X-QQ-mid: bizesmtp84t1677581040t1m2frpy
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:43:57 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: ILHsT53NKPjIAYFLn137NrqjAJubMJnmnFZLU9rTEdohw6iN/tKw3ke0FPK27
 qVCkjCgvRXTXE5hIXB9122jac2qBXOIhbS7eHEqgtOOOuIKJaGeCaJksTn8CxNo95F+rFNY
 MJDeCWer+BXS7wpe2GMhwAohV5K9C3jqasvuOMntaaBoOobqW8Ax36GqWQOKy/3YLVa3xSc
 8GhrWc0rkDG/WhnbRR/3+w9rQDWHxuCwd6Pu3c3QYZtKPwQHrIg1jGMwoFpkvcA8VN4VrIT
 fSU42B4VZV/jITPcNVjPYhv9aD7x3hCKmfsxMQMvZvVFW8GQZp/DSGIQmvD6R9ubaT7ILLs
 vCXqoOY16tvFCBqSEcAN3ERu3ARGH5ofDQ4Q+XO
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 03/18] target/riscv: Use g_assert() for the predicate()
 NULL check
Date: Tue, 28 Feb 2023 18:40:19 +0800
Message-Id: <20230228104035.1879882-4-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 28 Feb 2023 10:44:24 -0000

At present riscv_csrrw_check() checks the CSR predicate() against
NULL and throws RISCV_EXCP_ILLEGAL_INST if it is NULL. But this is
a pure software check, and has nothing to do with the emulation of
the hardware behavior, thus it is inappropriate to return illegal
instruction exception when software forgets to install the hook.

Change to use g_assert() instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

Changes in v2:
- new patch: Use assert() for the predicate() NULL check

 target/riscv/csr.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4cc2c6370f..cfd7ffc5c2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3786,11 +3786,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    /* check predicate */
-    if (!csr_ops[csrno].predicate) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     /* read / write check */
     if (write_mask && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -3803,6 +3798,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
      * illegal instruction exception should be triggered instead of virtual
      * instruction exception. Hence this comes after the read / write check.
      */
+    g_assert(csr_ops[csrno].predicate != NULL);
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
-- 
2.25.1


