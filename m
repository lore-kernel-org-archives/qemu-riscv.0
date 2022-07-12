Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB9SV-0003pf-Hx
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 02:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SN-0003ZG-KK; Tue, 12 Jul 2022 02:33:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53762 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SJ-0001bp-Cl; Tue, 12 Jul 2022 02:33:15 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowADns1idFc1ijYPeDg--.64613S4;
 Tue, 12 Jul 2022 14:33:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/6] target/riscv: H extension depends on I extension
Date: Tue, 12 Jul 2022 14:32:32 +0800
Message-Id: <20220712063236.23834-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADns1idFc1ijYPeDg--.64613S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr4DZFW5XFyUKr1DtrWDArb_yoW3trc_Gr
 y0gFyfXw1UXF1xKFyUAFn8tr1rGay8Wr4vga1fJF45GryDWws3Aa4ktFs5Ar1xC3yxuF93
 Aa4fJ3y3GFyUCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
 0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU=
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jul 2022 06:33:15 -0000

- add check for "H depends on an I base integer ISA with 32 x registers"

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36c1b26fb3..b8ce0959cb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -732,6 +732,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+            error_setg(errp,
+                       "H depends on an I base integer ISA with 32 x registers");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
-- 
2.17.1


