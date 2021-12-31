Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3CzC-0003t1-Cz
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 03:10:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3Cz2-0003r1-Q3; Fri, 31 Dec 2021 03:09:52 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:54154 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3Cyy-0002UQ-Jk; Fri, 31 Dec 2021 03:09:52 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACnrZ3Dus5h9gmUBQ--.44953S5;
 Fri, 31 Dec 2021 16:09:41 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 3/3] target/riscv: add support for svpbmt extension
Date: Fri, 31 Dec 2021 16:09:23 +0800
Message-Id: <20211231080923.24252-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
References: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACnrZ3Dus5h9gmUBQ--.44953S5
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW5Zr17Cw4UuF1DWFWxJFb_yoW5AFykpr
 4kG3yIka95JFW3Aa18tF1UJw15CwsI9F45Kws7Zrs7Jr4rJrW7XF1DKr42gF45XF4rXF13
 u3Z8Cr1Yvr48XaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
 w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
 C2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
 7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxV
 Aaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
 xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
 1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY
 6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
 AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
 Xa7VUb8wIDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 31 Dec 2021 08:09:53 -0000

It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_bits.h   | 3 +++
 target/riscv/cpu_helper.c | 9 ++++++++-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 77ef0f85fe..743bcfe297 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -649,6 +649,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("x-svnapot", RISCVCPU, cfg.ext_svnapot, false),
+    DEFINE_PROP_BOOL("x-svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5dd9e53293..6656b8a4f3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -317,6 +317,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_svinval;
         bool ext_svnapot;
+        bool ext_svpbmt;
         bool ext_zfh;
         bool ext_zfhmin;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1156c941cb..3dae358aa5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -483,7 +483,10 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
+#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
 #define PTE_N               0x8000000000000000 /* NAPOT translation */
+#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e044153986..41d04675b3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -619,16 +619,23 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
+        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
 
         RISCVCPU *cpu = env_archcpu(env);
         if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
             return TRANSLATE_FAIL;
+        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
+            return TRANSLATE_FAIL;
+        } else if (pte & PTE_RSVD) {
+            return TRANSLATE_FAIL;
         } else if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
+            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
+                return TRANSLATE_FAIL;
+            }
             base = ppn << PGSHIFT;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
-- 
2.17.1


