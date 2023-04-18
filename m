Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1polzI-0008Rz-IM
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 10:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1polyt-0008Eu-C0; Tue, 18 Apr 2023 10:06:51 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1polyp-0008Ur-6s; Tue, 18 Apr 2023 10:06:51 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowADX32froz5kHH+IFA--.38119S7;
 Tue, 18 Apr 2023 22:06:40 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 5/8] target/riscv: flush tb when PMP entry changes
Date: Tue, 18 Apr 2023 22:06:29 +0800
Message-Id: <20230418140632.53166-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418140632.53166-1-liweiwei@iscas.ac.cn>
References: <20230418140632.53166-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX32froz5kHH+IFA--.38119S7
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1fGryxXw48ZF4Uur1rWFg_yoWkArb_Gr
 4xZF4kW34qq3ZYvFWUAF1rCF10k34kArsYgrZayrZrCa4Ygw4xAwnYq3WkAr4Y9F9xWF92
 vr17J345ArnxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbq8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
 IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
 F7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
 1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeXd1
 UUUUU
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Tue, 18 Apr 2023 14:06:52 -0000

The translation block may also be affected when PMP entry changes.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/pmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ec86fccd2e..37bc76c474 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 
 static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
@@ -492,6 +493,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     /* If PMP permission of any addr has been changed, flush TLB pages. */
     if (modified) {
         tlb_flush(env_cpu(env));
+        tb_flush(env_cpu(env));
     }
 }
 
@@ -545,6 +547,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
                 env->pmp_state.pmp[addr_index].addr_reg = val;
                 pmp_update_rule(env, addr_index);
                 tlb_flush(env_cpu(env));
+                tb_flush(env_cpu(env));
             }
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.25.1


