Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyZPg-0004f8-Rl
	for mharc-qemu-riscv@gnu.org; Fri, 25 Nov 2022 09:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1oyQt1-0000Q1-RF; Fri, 25 Nov 2022 00:04:28 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1oyQsy-0002Lf-W4; Fri, 25 Nov 2022 00:04:27 -0500
X-QQ-mid: bizesmtp81t1669352636t1u4uequ
Received: from ubuntu.. ( [111.196.129.81]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 25 Nov 2022 13:03:54 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: wsGSYzdplcEhOzNmn3xtPkQj6m0m4AgOtEQw4vlCeflhOuahgx4kem0mb4scY
 HC4O4N43n9Me+79r3Sg6yQtLs7aGm9SIOeSplV2TGYSan536wN5rKqNe4khNSY3YYTiGFPd
 Y+5k0R26mUbtxW1cLVlfoQDHY7WvUz4SrzUTxIPxnMigDBGqmKj5BtL97wpRroz5PVdn4d7
 +yZSiSA4kPBu5x1sZiRA8F2MS5Xy6Zg11GbbNWojC7Hr2X+hYZE+Ui4BLtIyMJK9mE4jTc4
 g+sR1nmA8iAoGbAJijrvs+SBtfVwedOqZoMh41Yos6cDtyLbbmCj0Agk98sEVQFjopyfZMr
 VI3zFC0
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
Date: Fri, 25 Nov 2022 13:03:54 +0800
Message-Id: <20221125050354.3166023-1-bmeng@tinylab.org>
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
X-Mailman-Approved-At: Fri, 25 Nov 2022 09:10:42 -0500
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
X-List-Received-Date: Fri, 25 Nov 2022 05:04:30 -0000

sstatus register dump is currently missing in riscv_cpu_dump_state().
As sstatus is a copy of mstatus, which is described in the priv spec,
it seems redundant to print the same information twice.

Add some comments for this to let people know this is intentional.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

Changes in v2:
- Add some comments for missing sstatus

 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc..a6c27977c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MHARTID,
             CSR_MSTATUS,
             CSR_MSTATUSH,
+            /*
+             * CSR_SSTATUS is intentionally omitted here as its value
+             * can be figured out by looking at CSR_MSTATUS
+             */
             CSR_HSTATUS,
             CSR_VSSTATUS,
             CSR_MIP,
-- 
2.34.1


