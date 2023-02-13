Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAl-0003HD-LS
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAZ-00037e-FQ; Mon, 13 Feb 2023 13:03:18 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAW-0001Io-Ie; Mon, 13 Feb 2023 13:03:14 -0500
X-QQ-mid: bizesmtp62t1676311368tu64a876
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:02:46 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: swyrzWPvyR2fBUeCR/eoHkWfnX3baPGJZSKsqfvd+RVyEdHiRszLxR4E025lH
 AnzmacmydeXmEVxQMzpAMevCTEFA5y90VyKjXATzqzrKjFk5C7eT9MxkNkT0TqWOE7cOBSe
 +3/pk3JCgSo26/jO/JnRvr9tar0OR9ZluVNe14MDkDbU0kpq8tJ0QquzC/eP4qHsCFZ3iaA
 OKqPpDW8h4W6dDOWsepUmWlmiYzv17p4rB1GRjStU7/uSHvR0lVY6E1n+71zn3sURdxFfEy
 ruRH9McNDLuabXT2Swug8k8d3bkIBgG4amHWMc1qPY1OJTlBu6y/Vz7MqL3TXAUN2seqCvz
 gkE09DUyp+wfmGcysOFylKMHXlyKnXxKBd63NEHFUIRr1zAVpU=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 02/18] target/riscv: Correct the priority policy of
 riscv_csrrw_check()
Date: Tue, 14 Feb 2023 02:01:58 +0800
Message-Id: <20230213180215.1524938-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-1-bmeng@tinylab.org>
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
X-List-Received-Date: Mon, 13 Feb 2023 18:03:19 -0000

The priority policy of riscv_csrrw_check() was once adjusted in
commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
whose commit message says the CSR existence check should come
before the access control check, but the code changes did not
agree with the commit message, that the predicate() check came
after the read / write check.

Fixes: eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..c2dd9d5af0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3793,15 +3793,15 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (write_mask && read_only) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
+    if (write_mask && read_only) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv, effective_priv = env->priv;
 
-- 
2.25.1


