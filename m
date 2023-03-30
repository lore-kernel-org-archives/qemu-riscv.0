Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phsnU-0004KH-6h
	for mharc-qemu-riscv@gnu.org; Thu, 30 Mar 2023 09:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phsnT-0004Ji-3d; Thu, 30 Mar 2023 09:58:35 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phsnP-0007O1-Mc; Thu, 30 Mar 2023 09:58:34 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowADn70t9lSVkTm4HGQ--.46385S4;
 Thu, 30 Mar 2023 21:58:23 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: Legalize MPP value in write_mstatus
Date: Thu, 30 Mar 2023 21:58:18 +0800
Message-Id: <20230330135818.68417-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn70t9lSVkTm4HGQ--.46385S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1fGrykWF4DJr4UXr43KFg_yoW8tFyUpr
 Wqk3y3GrWDGFZFqa4fXr48WF15ArW3GrWUCan7Jw4Utw4rJrZ0kF1Dt3y7CF1DXFWxWr1j
 93ZrZas8Aa17AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUUUUU=
 =
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
X-List-Received-Date: Thu, 30 Mar 2023 13:58:35 -0000

mstatus.MPP field is a WARL field, so we remain it unchanged if an
invalid value is written into it. And after this, RVH shouldn't be
passed to riscv_cpu_set_mode().

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  5 +----
 target/riscv/csr.c        | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..46baf3ab7c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -659,12 +659,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
 
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
-    if (newpriv > PRV_M) {
+    if (newpriv > PRV_M || newpriv == PRV_H) {
         g_assert_not_reached();
     }
-    if (newpriv == PRV_H) {
-        newpriv = PRV_U;
-    }
     if (icount_enabled() && newpriv != env->priv) {
         riscv_itrigger_update_priv(env);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..a99026c3e8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1238,6 +1238,18 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
     return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
 }
 
+static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
+                                 target_ulong val)
+{
+    target_ulong new_mpp = get_field(val, MSTATUS_MPP);
+    bool mpp_invalid = (new_mpp == PRV_S && !riscv_has_ext(env, RVS)) ||
+                       (new_mpp == PRV_U && !riscv_has_ext(env, RVU)) ||
+                       (new_mpp == PRV_H);
+
+    /* Remain field unchanged if new_mpp value is invalid */
+    return mpp_invalid ? set_field(val, MSTATUS_MPP, old_mpp) : val;
+}
+
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
@@ -1245,6 +1257,8 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     uint64_t mask = 0;
     RISCVMXL xl = riscv_cpu_mxl(env);
 
+    val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
+
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
             MSTATUS_MPRV | MSTATUS_SUM)) {
-- 
2.25.1


