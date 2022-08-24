Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQsKF-0000HH-I7
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 11:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq8A-0008Mu-D8; Wed, 24 Aug 2022 09:09:14 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:55962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq85-0006hS-Nn; Wed, 24 Aug 2022 09:09:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VN7XDem_1661346227; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VN7XDem_1661346227) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 21:03:48 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 1/4] target/riscv: Use xl instead of mxl for disassemble
Date: Wed, 24 Aug 2022 21:03:28 +0800
Message-Id: <20220824130331.21315-2-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:29:47 -0400
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
X-List-Received-Date: Wed, 24 Aug 2022 13:09:14 -0000

Disassemble function(plugin_disas, target_disas, monitor_disas) will
always call set_disas_info before disassembling instructions.

plugin_disas  and target_disas will always be called under a TB, which
has the same XLEN.

We can't ensure that monitor_disas will always be called under a TB,
but current XLEN will still be a better choice, thus we can ensure at
least the disassemble of the nearest one TB is right.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..a5f84f211d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -507,8 +507,9 @@ static void riscv_cpu_reset(DeviceState *dev)
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     RISCVCPU *cpu = RISCV_CPU(s);
+    CPURISCVState *env = &cpu->env;
 
-    switch (riscv_cpu_mxl(&cpu->env)) {
+    switch (env->xl) {
     case MXL_RV32:
         info->print_insn = print_insn_riscv32;
         break;
-- 
2.25.1


