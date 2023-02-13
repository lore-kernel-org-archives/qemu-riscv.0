Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAe-0003Cw-CM
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAY-00037b-Tv; Mon, 13 Feb 2023 13:03:15 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAV-0001Ik-M8; Mon, 13 Feb 2023 13:03:14 -0500
X-QQ-mid: bizesmtp62t1676311364tf7oryd4
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:02:43 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: SdugMSrl+IMOA/kl/2+0JJ7KKDuAi3hv5oa+0wa1bnoGIBw7w2FB1inIAstP2
 KaItufkKWSnhjmQvHREvmjGln2jEjPCnjeASTHO5UqedakzjzJan994ilXbus49uu8V72PS
 oPjF9t135vZ7aYezkfFRF1VtiOj6H0xU+BttI/JjkoWGMm9xIfu6U4TW3OFo7QpGbSVnpBR
 DdmJXceKZANlLNvpiOrYVEhcOInCjQG09AMM6vm43im+qHqs46VHu+aVrqROc2DXt2rGQ7i
 HPRete33Z7XuYSwU181N+7W+IbqZzMvWHSFUTY0RevuPstLs9wMQRuHeE+j3KPH6SvdHRzf
 CtEwQ/HN+eVbh3IjZxjJWJx5qW28cbnXRI9dmlvzoqjR3IQqzg=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 01/18] target/riscv: gdbstub: Check priv spec version before
 reporting CSR
Date: Tue, 14 Feb 2023 02:01:57 +0800
Message-Id: <20230213180215.1524938-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-1-bmeng@tinylab.org>
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
X-List-Received-Date: Mon, 13 Feb 2023 18:03:18 -0000

The gdbstub CSR XML is dynamically generated according to the result
of the CSR predicate() result. This has been working fine until
commit 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
introduced the privilege spec version check in riscv_csrrw_check().

When debugging the 'sifive_u' machine whose priv spec is at 1.10,
gdbstub reports priv spec 1.12 CSRs like menvcfg in the XML, hence
we see "remote failure reply 'E14'" message when examining all CSRs
via "info register system" from gdb.

Add the priv spec version check in the CSR XML generation logic to
fix this issue.

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 6e7bbdbd5e..e57372db38 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -290,6 +290,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
+        if (env->priv_ver < csr_ops[i].min_priv_ver) {
+            continue;
+        }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
             if (csr_ops[i].name) {
-- 
2.25.1


