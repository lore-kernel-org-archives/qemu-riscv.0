Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxXb3-0005hh-9n
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 13:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1oxVje-0008Mk-7r; Tue, 22 Nov 2022 11:03:27 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1oxVjX-0005Ib-Cv; Tue, 22 Nov 2022 11:02:57 -0500
X-QQ-mid: bizesmtp73t1669131989tudswdpb
Received: from ubuntu.. ( [111.196.129.81]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Nov 2022 23:46:28 +0800 (CST)
X-QQ-SSF: 01200000002000B09000B00A0000000
X-QQ-FEAT: +ynUkgUhZJk0m5j/BdeWK/y0Tik59nx3PnjwSeJDke93Z6zNY7zckBABcKW5S
 IpsFuqWEQUoX6zB1fz7lbi4yJVahL2xkQlgoMwh7QJzcoS5pjhXgw1RNdFKqpyJ6XzGQs55
 FZ2//NFlk+2Y7B7xJOioPgPcpF7/x5OCbx04R9RF2fkZmSJPEvm3jrpt1tbislMccY+6UJf
 UBBmDklyIRm1dpOr7d9FTou/FTEqHejZJ4fqtwK8TdgevRh3k3FbBuxPdlOg4mSaBEti8eq
 PB4dsqib3w9NNj7/Wh+ddZ+abkvDyie+u5UditsuRfmxOwQCWFdWQlwZr/6aOzjKSD+YrnV
 l/8Wa8DYml7dl5srD2xgquY9DY0oQ==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
Date: Tue, 22 Nov 2022 23:46:28 +0800
Message-Id: <20221122154628.3138131-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
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
X-Mailman-Approved-At: Tue, 22 Nov 2022 13:02:12 -0500
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
X-List-Received-Date: Tue, 22 Nov 2022 16:03:40 -0000

sstatus register dump is currently missing in riscv_cpu_dump_state().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc..80d76f0181 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MHARTID,
             CSR_MSTATUS,
             CSR_MSTATUSH,
+            CSR_SSTATUS,
             CSR_HSTATUS,
             CSR_VSSTATUS,
             CSR_MIP,
-- 
2.34.1


