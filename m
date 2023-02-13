Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAl-0003Gv-Gl
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAb-00037m-2j; Mon, 13 Feb 2023 13:03:18 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAX-0001Kk-N3; Mon, 13 Feb 2023 13:03:15 -0500
X-QQ-mid: bizesmtp62t1676311374tl5plc7c
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:02:53 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: hxncCWlH1dPrtNrhADQ1Svg2WRB5fSPCfkAPRwVnQr7HjaDQMb4JO0f11HLJe
 yhCG3VHlymND9nPdJ5aZyXobHebGoKBSlyCgsKa7Iopq5bE6FfNd+mQz3xZP3gxLaoWQElM
 OaSduP9jndng0D3CVCHkrXtjJWwxmcBLiiCtZFLVMa2nJZ6AYn3rcGOAqj9nNqJK1cL90UF
 2kf6c7NWpUPmV0QjhjqxJqeiIxv1L4IqsIgD10kb9GRO/vxFbCJDoUFfaPHr4JVPw1e0Bok
 asNEBa8Qa+7WK7JIA+8sp8HuwWG0k09jBJNyLtKAqkMsBlsoq0ETkYNdthcZQ9GZTsAEYDr
 d+TzKh7xQFVE8z9qbgdVbjoy3q2eG8MogzPDBIrUhh0WaCb3NY=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 04/18] target/riscv: gdbstub: Do not generate CSR XML if Zicsr
 is disabled
Date: Tue, 14 Feb 2023 02:02:00 +0800
Message-Id: <20230213180215.1524938-5-bmeng@tinylab.org>
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
X-List-Received-Date: Mon, 13 Feb 2023 18:03:19 -0000

There is no need to generate the CSR XML if the Zicsr extension
is not enabled.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/gdbstub.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 704f3d6922..294f0ceb1c 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -406,7 +406,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         g_assert_not_reached();
     }
 
-    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
-                             "riscv-csr.xml", 0);
+    if (cpu->cfg.ext_icsr) {
+        int base_reg = cs->gdb_num_regs;
+        gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 "riscv-csr.xml", 0);
+    }
 }
-- 
2.25.1


