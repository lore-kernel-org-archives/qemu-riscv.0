Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB9ST-0003mg-15
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 02:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SN-0003ZQ-MG; Tue, 12 Jul 2022 02:33:15 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53758 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oB9SJ-0001br-D3; Tue, 12 Jul 2022 02:33:15 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowADns1idFc1ijYPeDg--.64613S3;
 Tue, 12 Jul 2022 14:33:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 1/6] target/riscv: add check for supported privilege modes
 conbinations
Date: Tue, 12 Jul 2022 14:32:31 +0800
Message-Id: <20220712063236.23834-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADns1idFc1ijYPeDg--.64613S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWDCr4kuw1kKrWfAw15XFb_yoWfJrc_G3
 409F97Ww1UXF1I9FWUAF4Fyr1fG395WFZYgay3t3WfCF9Fg3sxA3Z7Kr97JrWxC3yxuFZa
 ywn3Jry3C3WUujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
 0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU=
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
X-List-Received-Date: Tue, 12 Jul 2022 06:33:16 -0000

- There are 3 suggested privilege modes conbinations listed in the spec:
1) M, 2) M, U 3) M, S, U

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db2b8e4d30..36c1b26fb3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -726,6 +726,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+            error_setg(errp,
+                       "Setting S extension without U extension is illegal");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
-- 
2.17.1


