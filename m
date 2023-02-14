Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRlf4-0005XQ-M9
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 22:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRlf0-0005VM-Mr; Mon, 13 Feb 2023 22:07:14 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRlex-00058a-T6; Mon, 13 Feb 2023 22:07:14 -0500
X-QQ-mid: bizesmtp64t1676344003t292ncei
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 11:06:29 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: CR3LFp2JE4kWx9C7AA26WN2QwJ8ILU3YNptFD9KTWBE5rMZIkRGwter7iLgAZ
 Bs/aM9FIGEw49c3QUIWrfsljsvNiGSgL0bAkuy8aqxNlqMHlomlUCD3B/egNxil7Cp8Yj8F
 ZDScn4kzwcj2SsGbzg65bLT98ti3bQZHn4YSSns64uKDblUVoqu8Dsp2ePSaLqYZ56xuszp
 BcUdR4HpHHYnxFNbeOftaxnMD4koAC4djsX+8nKmG9dNYLgy/e7ZoW9I3Lb3H7cv5UfCBC8
 EZhqy5yT1Wx5YGwFp4ZO6dzsEOqWti0ILQnPeJ4EmsBs1kNLe96p/IBFvxRKDMVQTYa8by2
 iwkt9SsSu69c9gjC+7yxIjIpb690zcmZSTk4zvHUSRRjO8T68WTP1oNI5fsf9ZpweSoto2m
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 14/18] target/riscv: Allow debugger to access {h,
 s}stateen CSRs
Date: Tue, 14 Feb 2023 11:06:24 +0800
Message-Id: <20230213180215.1524938-15-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 14 Feb 2023 03:07:15 -0000

At present {h,s}stateen CSRs are not reported in the CSR XML
hence gdb cannot access them.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
addding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f1075b5728..d6bcb7f275 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -337,13 +337,22 @@ static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = hmode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
         }
     }
 
-    return hmode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException hstateen(CPURISCVState *env, int csrno)
@@ -366,6 +375,15 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -378,7 +396,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         }
     }
 
-    return smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 /* Checks if PointerMasking registers could be accessed */
-- 
2.25.1


