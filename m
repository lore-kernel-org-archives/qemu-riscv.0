Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWyui-0006h4-0i
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 07:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuZ-0006R5-B4; Tue, 28 Feb 2023 07:16:52 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuX-0006zc-7M; Tue, 28 Feb 2023 07:16:51 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp78t1677581559tdv8kvki
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:52:36 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 11/18] target/riscv: gdbstub: Turn on debugger mode before
 calling CSR predicate()
Date: Tue, 28 Feb 2023 18:40:27 +0800
Message-Id: <20230228104035.1879882-12-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 28 Feb 2023 12:16:55 -0000

Since commit 94452ac4cf26 ("target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml")
the 3 FPU CSRs are removed from the XML target decription. The
original intent of that commit was based on the assumption that
the 3 FPU CSRs will show up in the riscv-csr.xml so the ones in
riscv-*-fpu.xml are redundant. But unforuantely that is not true.
As the FPU CSR predicate() has a run-time check on MSTATUS.FS,
at the time when CSR XML is generated MSTATUS.FS is unset, hence
no FPU CSRs will be reported.

The FPU CSR predicate() already considered such a case of being
accessed by a debugger. All we need to do is to turn on debugger
mode before calling predicate().

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 294f0ceb1c..ef52f41460 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -280,6 +280,10 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     int bitsize = 16 << env->misa_mxl_max;
     int i;
 
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = true;
+#endif
+
     /* Until gdb knows about 128-bit registers */
     if (bitsize > 64) {
         bitsize = 64;
@@ -308,6 +312,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_csr_xml = g_string_free(s, false);
+
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = false;
+#endif
+
     return CSR_TABLE_SIZE;
 }
 
-- 
2.25.1


