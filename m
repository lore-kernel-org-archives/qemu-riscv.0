Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxVD-0003jy-SZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxV9-0003Xf-Rr; Tue, 28 Feb 2023 05:46:32 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxV5-0003XV-W9; Tue, 28 Feb 2023 05:46:31 -0500
X-QQ-mid: bizesmtp85t1677581170tr84l4mw
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:46:07 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: D2GZf6M6C/g6LR3Qn4xUcm+tmJy7LNIag81tPF45BkWK48pdQer2uuQhYkpja
 WuQfocvkZ33n4LKFaBQXl2G13jv+/iOZRKPprpzw8yZb8Ry72jYy9/jnN87DmDGYooZ6g/v
 xTafHOgRxUMbtUbbMZelTHxywjEs7+SdC8Vv78+a76u/0FhAAr5xZvUcmn/qfqAGnz0UUhA
 aXtppBh89YYdmrSkh5NLKkga8PjY51ryfqza5rvENVnrLQMiJMpV+gc7TlqAD2PmM/vvyAP
 VMvWy6X/EIsxUYbHYS6mbe3o39/LT20ZW1J5aW5rz8zlXJqHdOcWTdGmAxXWonaVzrxB45l
 atAJSMp18o4jRWmk6ZA/eT0U8jWaYuKvYraTFXvMY6siu4dz0o=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML if
 Zicsr is disabled
Date: Tue, 28 Feb 2023 18:40:21 +0800
Message-Id: <20230228104035.1879882-6-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 28 Feb 2023 10:46:32 -0000

There is no need to generate the CSR XML if the Zicsr extension
is not enabled.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

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


