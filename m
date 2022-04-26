Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njHs6-0006sj-VC
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 05:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njHs4-0006n1-0A; Tue, 26 Apr 2022 05:52:37 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:43988 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njHs1-0001Nf-6j; Tue, 26 Apr 2022 05:52:35 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3P5PVwGdi46wKAQ--.50851S2;
 Tue, 26 Apr 2022 17:52:23 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: add scalar crypto related extenstion strings to
 isa_string
Date: Tue, 26 Apr 2022 17:52:04 +0800
Message-Id: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAA3P5PVwGdi46wKAQ--.50851S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1kXw1rJFW8CFy7trb_yoW8JF47pr
 1jg34UAas5J39xWwn3JrW5WFW8Jw18Gwnag39Fv3Z5Xr4fAa98Jrn7C34qqr45KFZ7t34f
 ZrWUZr13CrWkAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Apr 2022 09:52:37 -0000

 - add zbk* and zk* strings to isa_edata_arr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dff4606585..ccacdee215 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1005,7 +1005,20 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zba, ext_zba),
         ISA_EDATA_ENTRY(zbb, ext_zbb),
         ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
+        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
+        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
         ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zk, ext_zk),
+        ISA_EDATA_ENTRY(zkn, ext_zkn),
+        ISA_EDATA_ENTRY(zknd, ext_zknd),
+        ISA_EDATA_ENTRY(zkne, ext_zkne),
+        ISA_EDATA_ENTRY(zknh, ext_zknh),
+        ISA_EDATA_ENTRY(zkr, ext_zkr),
+        ISA_EDATA_ENTRY(zks, ext_zks),
+        ISA_EDATA_ENTRY(zksed, ext_zksed),
+        ISA_EDATA_ENTRY(zksh, ext_zksh),
+        ISA_EDATA_ENTRY(zkt, ext_zkt),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
-- 
2.17.1


