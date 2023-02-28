Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxR5-0006lm-4e
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxQy-0006gR-Rx; Tue, 28 Feb 2023 05:42:14 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxQw-0002Wu-Q4; Tue, 28 Feb 2023 05:42:12 -0500
X-QQ-mid: bizesmtp84t1677580910tzp7u9xr
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:41:47 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: swyrzWPvyR0xhBIGI0mxwzcwGMwozZSOCn94FbeJZYiuSYO/Xp+Jqimw90vx/
 T3BgCLWlBNQ5QCsbxKngPUQeqVCNS+rLu5U/7rE6D+iWd1Icb2MPc5kOjtlkmpL/vccfooP
 NcRq6f1fwUM53upSYD+N3wSKEbcGhAARKH+jDSCbVNBmT0gvdSN/SeZoDCrkiGanga/MqTp
 xCr9bkPzNzizY3RdzHmB7Z0+i8zmewDxG6N3kZL7VaWRGGaNTGWeysksZP9Fp/Ok7kh7Z/K
 1rskgrN30iJA8mq5KEsA/itQ26v3kUNU+EEM6FpKIJJkgROYTQBv7PAZ4gNylAZJbkHlW9C
 n+/K0sT3xw/Z82pzdARGlH/BvvusmrE4o99hVn2MzBa3v1DgvM=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 01/18] target/riscv: gdbstub: Check priv spec version
 before reporting CSR
Date: Tue, 28 Feb 2023 18:40:17 +0800
Message-Id: <20230228104035.1879882-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 10:42:16 -0000

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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

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


