Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73597C77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 09:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzDGs-00065L-O0; Wed, 17 May 2023 05:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGm-0005L7-Sh; Wed, 17 May 2023 05:16:28 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGi-0007kk-EQ; Wed, 17 May 2023 05:16:28 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowABnVxRam2Rks_XqJQ--.29147S4;
 Wed, 17 May 2023 17:16:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 02/12] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
Date: Wed, 17 May 2023 17:15:09 +0800
Message-Id: <20230517091519.34439-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
References: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnVxRam2Rks_XqJQ--.29147S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1rWFW8AFWDXFW5KFW5trb_yoW5XFy3pr
 ZxCr4xWa1kGFZa9a1xZr1UAFWUCFnrKrWjgay8GwsY9Fs0q345C3Wq934agFs7GrWkZws0
 kw4qyFy0kF15XFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
 yTuYvjfUexhlDUUUU
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

pmp_get_tlb_size can be separated from get_physical_address_pmp and is only
needed when ret == TRANSLATE_SUCCESS.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index de585b14cc..15eafb342d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -687,14 +687,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
  *
  * @env: CPURISCVState
  * @prot: The returned protection attributes
- * @tlb_size: TLB page size containing addr. It could be modified after PMP
- *            permission checking. NULL if not set TLB page for addr.
  * @addr: The physical address to be checked permission
  * @access_type: The type of MMU access
  * @mode: Indicates current privilege level.
  */
-static int get_physical_address_pmp(CPURISCVState *env, int *prot,
-                                    target_ulong *tlb_size, hwaddr addr,
+static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
                                     int size, MMUAccessType access_type,
                                     int mode)
 {
@@ -714,9 +711,6 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     }
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
-    if (tlb_size != NULL) {
-        *tlb_size = pmp_get_tlb_size(env, addr);
-    }
 
     return TRANSLATE_SUCCESS;
 }
@@ -905,7 +899,7 @@ restart:
         }
 
         int pmp_prot;
-        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
+        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
                                                sizeof(target_ulong),
                                                MMU_DATA_LOAD, PRV_S);
         if (pmp_ret != TRANSLATE_SUCCESS) {
@@ -1301,8 +1295,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             prot &= prot2;
 
             if (ret == TRANSLATE_SUCCESS) {
-                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+                ret = get_physical_address_pmp(env, &prot_pmp, pa,
                                                size, access_type, mode);
+                tlb_size = pmp_get_tlb_size(env, pa);
 
                 qemu_log_mask(CPU_LOG_MMU,
                               "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
@@ -1334,8 +1329,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
-            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+            ret = get_physical_address_pmp(env, &prot_pmp, pa,
                                            size, access_type, mode);
+            tlb_size = pmp_get_tlb_size(env, pa);
 
             qemu_log_mask(CPU_LOG_MMU,
                           "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
-- 
2.25.1


