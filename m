Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRmpK-0004wR-Cg
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 23:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRmpI-0004vw-5a; Mon, 13 Feb 2023 23:21:56 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRmpF-0001zF-LY; Mon, 13 Feb 2023 23:21:55 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp79t1676347976ts69qlu9
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 12:12:53 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 15/18] target/riscv: Allow debugger to access sstc CSRs
Date: Tue, 14 Feb 2023 12:12:48 +0800
Message-Id: <20230213180215.1524938-16-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 14 Feb 2023 04:21:56 -0000

At present with a debugger attached sstc CSRs can only be accssed
when CPU is in M-mode, or configured correctly.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
addding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d6bcb7f275..c6a7745cb2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -951,6 +951,19 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
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
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
     }
@@ -971,11 +984,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         }
     }
 
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException sstc_32(CPURISCVState *env, int csrno)
-- 
2.25.1


