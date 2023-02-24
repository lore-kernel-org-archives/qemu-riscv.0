Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVPOh-00062j-Vz
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 23:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVPOZ-0005yd-6g; Thu, 23 Feb 2023 23:09:19 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVPOU-00034E-8h; Thu, 23 Feb 2023 23:09:18 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAC3u0deOPhjTRffBw--.16142S7;
 Fri, 24 Feb 2023 12:09:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 5/6] target/riscv: Add *envcfg.HADE related check in address
 translation
Date: Fri, 24 Feb 2023 12:08:51 +0800
Message-Id: <20230224040852.37109-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3u0deOPhjTRffBw--.16142S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48Zw4UGFy5ZryDXw1UWrg_yoW8urWxpr
 Z5Gay3Ka95XFyxJa1fXF1YgF1UGan5Cwsxu3yDCa1Uur45CrWfZrykKw48uF13XrW8Xr4Y
 9w1jyrn8CF4DXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 04:09:19 -0000

When menvcfg.HADE is 1, hardware updating of PTE A/D bits is enabled
during single-stage address translation. When the hypervisor extension is
implemented, if menvcfg.HADE is 1, hardware updating of PTE A/D bits is
enabled during G-stage address translation.

Set *envcfg.HADE default true for backward compatibility.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c        | 6 ++++--
 target/riscv/cpu_helper.c | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2d99679f2f..b81ab65de5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -613,8 +613,10 @@ static void riscv_cpu_reset_hold(Object *obj)
     env->bins = 0;
     env->two_stage_lookup = false;
 
-    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0);
-    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0);
+    env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
+                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
+    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
+                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
 
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 552c0f0b58..9e122ee92a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -937,9 +937,11 @@ restart:
         }
 
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+        bool hade = env->menvcfg & MENVCFG_HADE;
 
         if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
             pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+            hade = hade && (env->henvcfg & HENVCFG_HADE);
         }
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
@@ -998,6 +1000,10 @@ restart:
 
             /* Page table updates need to be atomic with MTTCG enabled */
             if (updated_pte != pte) {
+                if (!hade) {
+                    return TRANSLATE_FAIL;
+                }
+
                 /*
                  * - if accessed or dirty bits need updating, and the PTE is
                  *   in RAM, then we do so atomically with a compare and swap.
-- 
2.25.1


