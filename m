Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D0BC77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 09:18:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzDGu-0006Lj-Lf; Wed, 17 May 2023 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGm-0005LM-U4; Wed, 17 May 2023 05:16:29 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGi-0007lV-FV; Wed, 17 May 2023 05:16:28 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowABnVxRam2Rks_XqJQ--.29147S10;
 Wed, 17 May 2023 17:16:17 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 08/12] target/riscv: Update the next rule addr in
 pmpaddr_csr_write()
Date: Wed, 17 May 2023 17:15:15 +0800
Message-Id: <20230517091519.34439-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
References: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnVxRam2Rks_XqJQ--.29147S10
X-Coremail-Antispam: 1UD129KBjvJXoW7urWUur4DJw47CF18XF4xZwb_yoW8Zry3pr
 4IkFyxKryrt3s8Way3JF1Uuw1rGw45Krn2v3yxC3W09Fs5Xw48CF1qqasxKF1UXrZavryY
 ka1j9w18AFs29FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
 AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
 2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
 vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0JUfl19UUUUU=
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Currently only the rule addr of the same index of pmpaddr is updated
when pmpaddr CSR is modified. However, the rule addr of next PMP entry
may also be affected if its A field is PMP_AMATCH_TOR. So we should
also update it in this case.

Write to pmpaddr CSR will not affect the rule nums, So we needn't update
call pmp_update_rule_nums()  in pmpaddr_csr_write().

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 8cb8519b0c..efe72afe29 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -507,6 +507,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
                        target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
+    bool is_next_cfg_tor = false;
 
     if (addr_index < MAX_RISCV_PMPS) {
         /*
@@ -515,9 +516,9 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
          */
         if (addr_index + 1 < MAX_RISCV_PMPS) {
             uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
+            is_next_cfg_tor = PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg);
 
-            if (pmp_cfg & PMP_LOCK &&
-                PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg)) {
+            if (pmp_cfg & PMP_LOCK && is_next_cfg_tor) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "ignoring pmpaddr write - pmpcfg + 1 locked\n");
                 return;
@@ -526,7 +527,10 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
 
         if (!pmp_is_locked(env, addr_index)) {
             env->pmp_state.pmp[addr_index].addr_reg = val;
-            pmp_update_rule(env, addr_index);
+            pmp_update_rule_addr(env, addr_index);
+            if (is_next_cfg_tor) {
+                pmp_update_rule_addr(env, addr_index + 1);
+            }
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "ignoring pmpaddr write - locked\n");
-- 
2.25.1


