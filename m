Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCFcB-0005at-69
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 01:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCFbV-0005QV-ID; Tue, 25 Jan 2022 01:46:59 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:38588 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCFbS-0005ce-Ew; Tue, 25 Jan 2022 01:46:57 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3v1ecnO9hd+nyBg--.63247S5;
 Tue, 25 Jan 2022 14:45:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 3/5] target/riscv: add support for svnapot extension
Date: Tue, 25 Jan 2022 14:45:34 +0800
Message-Id: <20220125064536.7869-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowAC3v1ecnO9hd+nyBg--.63247S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4kXw4DtrW5AFyDAF1kXwb_yoW5XrW8pF
 Z5G39FkFZ7JFW3ta1xKF1Dtw1rGw4Y93yF9a1xZrs7Cw4rJrW3W3WDK398uF1UXF48Zr1a
 9a1DZF1YyrW0vaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Jan 2022 06:47:01 -0000
X-List-Received-Date: Tue, 25 Jan 2022 06:47:01 -0000

- add PTE_N bit
- add PTE_N bit check for inner PTE
- update address translation to support 64KiB continuous region (napot_bits = 4)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 17 ++++++++++++++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..8752fa1544 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -729,6 +729,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 37b622fbfa..41190ce985 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -489,6 +489,7 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_N               0x8000000000000000 /* NAPOT translation */
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a5bf07ccb6..ef7d9b07bd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -641,7 +641,7 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U)) {
+            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
                 return TRANSLATE_FAIL;
             }
             base = ppn << PGSHIFT;
@@ -717,8 +717,19 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+
+            int napot_bits = 0;
+            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {
+                napot_bits = ctzl(ppn) + 1;
+                if ((i != (levels - 1)) || (napot_bits != 4)) {
+                    return TRANSLATE_FAIL;
+                }
+            }
+
+            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << ptshift) - 1))
+                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-- 
2.17.1


