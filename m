Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkK0r-0006rF-W4
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 03:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkK0a-0006mc-8B; Thu, 06 Apr 2023 03:26:12 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkK0W-0000aV-5P; Thu, 06 Apr 2023 03:26:11 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowADHzMwGdC5kQlGzDg--.14061S4;
 Thu, 06 Apr 2023 15:26:00 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/2] target/riscv: Legalize MPP value in write_mstatus
Date: Thu,  6 Apr 2023 15:25:55 +0800
Message-Id: <20230406072555.21927-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406072555.21927-1-liweiwei@iscas.ac.cn>
References: <20230406072555.21927-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHzMwGdC5kQlGzDg--.14061S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1fGrykWF4DJr4UXr43KFg_yoW8Kw4fpr
 WkC3y3GrWDJa9Fqa4fXr48WF15ArWxGrWUCan7Jw48Kw4rJrZ0kF1Dt3y3uF1DWFyxWr1j
 93WDZ3s8AF47AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
 =
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 06 Apr 2023 07:26:12 -0000

mstatus.MPP field is a WARL field since priv version 1.11, so we
remain it unchanged if an invalid value is written into it. And
after this, RVH shouldn't be passed to riscv_cpu_set_mode().

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  5 +----
 target/riscv/csr.c        | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2310c7905f..6148f221c3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -647,12 +647,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
 
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
index e0b871f6dc..f3ae726853 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1230,6 +1230,18 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
            satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
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
@@ -1237,6 +1249,12 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     uint64_t mask = 0;
     RISCVMXL xl = riscv_cpu_mxl(env);
 
+    /*
+     * MPP field have been made WARL since priv version 1.11. However,
+     * legalization for it will not break any software running on 1.10.
+     */
+    val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
+
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
             MSTATUS_MPRV | MSTATUS_SUM)) {
-- 
2.25.1


