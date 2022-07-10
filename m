Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oASEl-0003t3-Qt
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 04:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEj-0003qZ-MP; Sun, 10 Jul 2022 04:24:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36390 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oASEh-0005eG-G2; Sun, 10 Jul 2022 04:24:17 -0400
Received: from liww-tm.www.tendawifi.com (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAAnLASjjMpiF30+Dg--.38648S6;
 Sun, 10 Jul 2022 16:24:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 4/6] target/riscv: add check for csrs existed with U extension
Date: Sun, 10 Jul 2022 16:23:58 +0800
Message-Id: <20220710082400.29224-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowAAnLASjjMpiF30+Dg--.38648S6
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrZry7Kr45GrWxKr4UArb_yoW8tF17pr
 Wjg34UKwsYyr92van3G3s8WFy3ZFy8Ga9I9rWxAw10yFsxJ3yrXFn2gF12qrW8Way0yr1U
 tanxCrnxua1DAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [117.151.235.104]
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
X-List-Received-Date: Sun, 10 Jul 2022 08:24:17 -0000

- add umode/umode32 predicate for mcounteren,menvcfg/menvcfgh

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9bda1ff993..0d8e98b7a9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -339,6 +339,25 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static RISCVException umode(CPURISCVState *env, int csrno)
+{
+    if (riscv_has_ext(env, RVU)) {
+        /* User extension is supported */
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
+static RISCVException umode32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return umode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -3521,7 +3540,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,  write_medeleg },
     [CSR_MIE]         = { "mie",        any,   NULL,  NULL,   rmw_mie       },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,    write_mtvec   },
-    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
+    [CSR_MCOUNTEREN]  = { "mcounteren", umode, read_mcounteren,
                                                write_mcounteren             },
 
     [CSR_MSTATUSH]    = { "mstatush", any32, read_mstatush, write_mstatush  },
@@ -3554,9 +3573,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Execution environment configuration */
-    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
+    [CSR_MENVCFG]  = { "menvcfg",  umode, read_menvcfg,  write_menvcfg,
                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
-    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
+    [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
-- 
2.17.1


