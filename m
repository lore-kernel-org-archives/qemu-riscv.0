Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDQVv-0002Nj-Ux
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 09:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVt-0002Il-BU; Mon, 18 Jul 2022 09:10:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43162 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDQVp-00030i-Ur; Mon, 18 Jul 2022 09:10:17 -0400
Received: from localhost.localdomain (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowABnbweqW9Vi5+hPEQ--.55056S7;
 Mon, 18 Jul 2022 21:10:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH V3 5/6] target/riscv: Fix checks in hmode/hmode32
Date: Mon, 18 Jul 2022 21:09:54 +0800
Message-Id: <20220718130955.11899-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowABnbweqW9Vi5+hPEQ--.55056S7
X-Coremail-Antispam: 1UD129KBjvJXoW7trWUGF4rWFyDJrWxuFyrXrb_yoW8Cw1xpr
 48u39Ikr98JasrAa93Jr1UJw1UCF17W3yUCw4Du3yxtF4rArWYqF1qqw429r95XFWkur4a
 9FnruFn5Zw47XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
 1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Mon, 18 Jul 2022 13:10:17 -0000

Add check for the implicit dependence between H and S

Csrs only existed in RV32 will not trigger virtual instruction fault
when not in RV32 based on section 8.6.1 of riscv-privileged spec
(draft-20220717)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/csr.c | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b8ce0959cb..455787a940 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -738,6 +738,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+            error_setg(errp, "H extension implicitly requires S-mode");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c69dc838c..cf15aa67b7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
 
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
-    if (riscv_has_ext(env, RVS) &&
-        riscv_has_ext(env, RVH)) {
+    if (riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
@@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (!riscv_cpu_virt_enabled(env)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        } else {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return hmode(env, csrno);
-- 
2.17.1


