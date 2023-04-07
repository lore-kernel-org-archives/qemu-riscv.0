Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkbCq-00073i-2e
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 21:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkbCm-000722-Jp; Thu, 06 Apr 2023 21:47:56 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkbCj-0007BZ-Tr; Thu, 06 Apr 2023 21:47:56 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAH6oJAdi9kmEpeAA--.11004S4;
 Fri, 07 Apr 2023 09:47:46 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 2/3] target/riscv: Use PRV_RESERVED instead of PRV_H
Date: Fri,  7 Apr 2023 09:47:42 +0800
Message-Id: <20230407014743.18779-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAH6oJAdi9kmEpeAA--.11004S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1fWrWkJw17Xw13XFy7Wrg_yoW8tryUpF
 4kG3yIkrZ8ZrZrJa93tr1DGw15Ars0grZ8C397uw4UWF43X3y5WwnFgw1agFyDJFyDKr4Y
 9F1j9ry5Zw4IqF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPU
 UUUU=
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Fri, 07 Apr 2023 01:47:56 -0000

PRV_H has no real meaning, but just a reserved privilege mode currently.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h       | 2 +-
 target/riscv/cpu_bits.h  | 2 +-
 target/riscv/gdbstub.c   | 2 +-
 target/riscv/op_helper.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cbf3de2708..4af8ebc558 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -699,7 +699,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
         case PRV_U:
             xl = get_field(env->mstatus, MSTATUS64_UXL);
             break;
-        default: /* PRV_S | PRV_H */
+        default: /* PRV_S */
             xl = get_field(env->mstatus, MSTATUS64_SXL);
             break;
         }
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 101702cb4a..a16bfaf43f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -608,7 +608,7 @@ typedef enum {
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
-#define PRV_H 2 /* Reserved */
+#define PRV_RESERVED 2
 #define PRV_M 3
 
 /* RV32 satp CSR field masks */
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index fa537aed74..524bede865 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -203,7 +203,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     if (n == 0) {
 #ifndef CONFIG_USER_ONLY
         cs->priv = ldtul_p(mem_buf) & 0x3;
-        if (cs->priv == PRV_H) {
+        if (cs->priv == PRV_RESERVED) {
             cs->priv = PRV_S;
         }
 #endif
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b8a03afebb..bd21c6eeef 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -141,7 +141,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
     }
 
     if (env->virt_enabled &&
-        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
+        (((env->priv <= PRV_S) && !get_field(env->henvcfg, envbits)) ||
          ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
     }
-- 
2.25.1


