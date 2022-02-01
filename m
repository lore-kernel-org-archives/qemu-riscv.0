Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEuhO-0004FV-OD
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 10:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEuhM-0004Ae-PZ; Tue, 01 Feb 2022 10:04:00 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:41268 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEuhG-00060J-HS; Tue, 01 Feb 2022 10:04:00 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAC3v5uxQvlhjpc3AA--.47720S7;
 Tue, 01 Feb 2022 22:24:56 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v8 5/5] target/riscv: add support for svpbmt extension
Date: Tue,  1 Feb 2022 22:24:15 +0800
Message-Id: <20220201142415.29980-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAC3v5uxQvlhjpc3AA--.47720S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW7ArW3KFW8KF1rXry8uFg_yoW8tw4xpr
 s3G3y7K395tFW3tayxKF1UJw1UGw4Y93Wqgan7Zw4xJr45J3y3JF1DKw4kGF43XF4DXr1a
 93W2kr1Yvr4UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
 GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
 X7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 01 Feb 2022 15:04:01 -0000

- add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
- add PTE_PBMT bit check for inner PTE

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu_bits.h   | 2 ++
 target/riscv/cpu_helper.c | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4442c4b81d..e231708ffb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -731,6 +731,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7abe9607ff..20ab4f4a0d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -489,7 +489,9 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 77b263c37e..f975de8213 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -640,9 +640,11 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
+        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_PBMT)) {
+            return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
+            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
                 return TRANSLATE_FAIL;
             }
             base = ppn << PGSHIFT;
-- 
2.17.1


