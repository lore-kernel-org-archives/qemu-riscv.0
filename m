Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxU4-0002iI-Un
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxU1-0002gO-RB; Tue, 28 Feb 2023 05:45:22 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxTz-0003KC-Vo; Tue, 28 Feb 2023 05:45:21 -0500
X-QQ-mid: bizesmtp66t1677581104teejqsck
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:45:03 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: XBN7tc9DADIiKnjL71AgyfMs9KlQQOCupLSUV5+hZnNfGXc2yZaSpfu+wsShP
 EAl/mrdKriC37CGV5KnbruUXnVqWdQKNQ3zq6e6SuzOmShCV003zduKD2eqt/qp+OTnnqML
 wbzD3fF1RHn6f7+ed7+89X3heTLGIDlheLM4FEuR2ycA9asd+ED3sbNZDnqACwAZ0xCRd6M
 /xrS4Sfn1aqg6DZ/lSwEDbEUiu/50x1I4aKTrBPfnu2LZKM0lqdnkJndZdBU6uoevWdBbXN
 QYrL+QVYvGx0aV3IYowIgUDD65Gmmoy2JCmHsll0GYHspa9cmLfbLaChDsbarJkgwxE5ohW
 C29yfuYhxFjYH1PpZ/Vtj4OG4M+5qOdxAjo4uz428liNNFC+xk=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 04/18] target/riscv: gdbstub: Minor change for better
 readability
Date: Tue, 28 Feb 2023 18:40:20 +0800
Message-Id: <20230228104035.1879882-5-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 28 Feb 2023 10:45:22 -0000

Use a variable 'base_reg' to represent cs->gdb_num_regs so that
the call to ricsv_gen_dynamic_vector_xml() can be placed in one
single line for better readability.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index e57372db38..704f3d6922 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -385,9 +385,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
+        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs,
-                                                              cs->gdb_num_regs),
+                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
-- 
2.25.1


