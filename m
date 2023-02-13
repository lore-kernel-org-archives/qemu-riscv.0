Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAh-0003DO-I2
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAZ-00037c-2S; Mon, 13 Feb 2023 13:03:17 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAW-0001KP-2j; Mon, 13 Feb 2023 13:03:14 -0500
X-QQ-mid: bizesmtp62t1676311371tk4fexa2
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:02:50 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: XBN7tc9DADLyWcuVMnJZzYC19WYF/g/i9wmIl7DusTAioJdVRtZ+CMhJhVc0b
 hPMjS4U0nG6IflckWv8DJXqHHJf7SrMSAKw3IEYiLVBj2v+ecU1zcTXjPGyytYnL+eRyUGm
 y5Lea+e4yXDtjYmndAKwAIh447MZBIusYRlVXs2SNtf6+4e4ukgj0L0EbqZ2ZjsavGInfkY
 oIiRwCPsUE6ZBhjCTHr688jaYCGRcprbyULYmvhga5Ok4o11r/8GTHo96YRBtg1fl5seeiw
 H4bZkITopOYnfM3R/exloSazKwtNcPKphCmSQlwR0eSz3khJ6IgjeC73eXBvoBkAaiCJW/S
 OXWnJVCi5JkVGADjeTh8TgttpYb+4kNhdDvrkzUYDEgtn+HFP0=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 03/18] target/riscv: gdbstub: Minor change for better
 readability
Date: Tue, 14 Feb 2023 02:01:59 +0800
Message-Id: <20230213180215.1524938-4-bmeng@tinylab.org>
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

Use a variable 'base_reg' to represent cs->gdb_num_regs so that
the call to ricsv_gen_dynamic_vector_xml() can be placed in one
single line for better readability.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

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


