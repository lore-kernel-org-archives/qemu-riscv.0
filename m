Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p25ME-00088J-Aa
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 01:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p25MB-00087a-Nv; Mon, 05 Dec 2022 01:53:39 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p25M6-0006yF-IO; Mon, 05 Dec 2022 01:53:39 -0500
X-QQ-mid: bizesmtp70t1670223184tg6npwvs
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 05 Dec 2022 14:53:03 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: UMQM+3VOEYvrXWzvMW2jw3Yy+nQdbG7OwlLAmE/7vjXjDCZ5nR7S1grjZNNpY
 p9qR4PyiOBPFeU6mbz2eIX9hAOXuNd3sCRqUUTYS/eMt3Y5RWoVW1LxcJ5ZWKpCe7uuL9cL
 hDfBJJyM/Cx8Ko+7LDxCDtnYZiXfPVfMCg3BY7zIIzDH1Y9tGaHqYrByNzhxiPxQG/5revG
 s5sk/9RD1kg8pmbNWOIqMrMRUrZB+5Djzl+Tr8Yf/nT4CHX56JzXoijwdfEECST1R4AWmgN
 9CUtGO01GYh729RFdaPih3Y6eml/rUZ4roL6z3DXjfan++vnEcNN1iwbvRMifCJUk/yzpPM
 DBt32pPIjf+wBxC8rAwvv1Eb2jxISbOINFFLd5y
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Fix mret exception cause when no pmp rule is
 configured
Date: Mon,  5 Dec 2022 14:53:03 +0800
Message-Id: <20221205065303.204095-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
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
X-List-Received-Date: Mon, 05 Dec 2022 06:53:40 -0000

The priv spec v1.12 says:

  If no PMP entry matches an M-mode access, the access succeeds. If
  no PMP entry matches an S-mode or U-mode access, but at least one
  PMP entry is implemented, the access fails. Failed accesses generate
  an instruction, load, or store access-fault exception.

At present the exception cause is set to 'illegal instruction' but
should have been 'instruction access fault'.

Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP entry is configured")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 09f1f5185d..d7af7f056b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -202,7 +202,7 @@ target_ulong helper_mret(CPURISCVState *env)
 
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
-        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+        riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
 
     target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
-- 
2.34.1


