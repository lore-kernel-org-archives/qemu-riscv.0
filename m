Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07045EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 03:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9H98-0000TB-MZ; Tue, 13 Jun 2023 23:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9H96-0000RU-JW; Tue, 13 Jun 2023 23:26:08 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9H92-0002dx-O2; Tue, 13 Jun 2023 23:26:08 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-01 (Coremail) with SMTP id qwCowAAHX8o9M4lkAAEBAw--.60726S4;
 Wed, 14 Jun 2023 11:25:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: update cur_pmbase/pmmask based on mode
 affected by MPRV
Date: Wed, 14 Jun 2023 11:25:47 +0800
Message-Id: <20230614032547.35895-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
References: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHX8o9M4lkAAEBAw--.60726S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17Cw1DWFWDtrW5Kw4DArb_yoWrCr18pr
 4kC3yfK3yxtasF9asIyw1Dt3WrJrWUtayUGwsrWayFyFW5J3WrArsFvasxZry8WFW8Xw12
 vanxCryUZr47ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
 =
X-Originating-IP: [117.61.111.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Pointer mask is also affected by MPRV which means cur_pmbase/pmmask
should also take MPRV into consideration. As pointer mask for instruction
is not supported currently, so we can directly update cur_pmbase/pmmask
based on address related mode and xlen affected by MPRV now.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  7 +++++--
 target/riscv/csr.c        | 27 ++++++++++++++++++++-------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f85113a3db..2321f9132f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -148,13 +148,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 void riscv_cpu_update_mask(CPURISCVState *env)
 {
     target_ulong mask = 0, base = 0;
+    RISCVMXL xl = env->xl;
     /*
      * TODO: Current RVJ spec does not specify
      * how the extension interacts with XLEN.
      */
 #ifndef CONFIG_USER_ONLY
+    int mode = cpu_address_mode(env);
+    xl = cpu_get_xl(env, mode);
     if (riscv_has_ext(env, RVJ)) {
-        switch (env->priv) {
+        switch (mode) {
         case PRV_M:
             if (env->mmte & M_PM_ENABLE) {
                 mask = env->mpmmask;
@@ -178,7 +181,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
         }
     }
 #endif
-    if (env->xl == MXL_RV32) {
+    if (xl == MXL_RV32) {
         env->cur_pmmask = mask & UINT32_MAX;
         env->cur_pmbase = base & UINT32_MAX;
     } else {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58499b5afc..63cc5d7e2d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1335,8 +1335,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
      */
     if (env->debugger) {
         env->xl = cpu_recompute_xl(env);
-        riscv_cpu_update_mask(env);
     }
+
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -3639,7 +3640,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
-    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
     env->mmte |= EXT_STATUS_DIRTY;
@@ -3667,8 +3668,11 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
-    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmmask = val;
+        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
+            env->cur_pmmask &= UINT32_MAX;
+        }
     }
     env->mmte |= EXT_STATUS_DIRTY;
 
@@ -3695,8 +3699,11 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
-    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmmask = val;
+        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
+            env->cur_pmmask &= UINT32_MAX;
+        }
     }
     env->mmte |= EXT_STATUS_DIRTY;
 
@@ -3719,7 +3726,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
-    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
     env->mmte |= EXT_STATUS_DIRTY;
@@ -3747,8 +3754,11 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
-    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmbase = val;
+        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
+            env->cur_pmbase &= UINT32_MAX;
+        }
     }
     env->mmte |= EXT_STATUS_DIRTY;
 
@@ -3775,8 +3785,11 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
-    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmbase = val;
+        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
+            env->cur_pmbase &= UINT32_MAX;
+        }
     }
     env->mmte |= EXT_STATUS_DIRTY;
 
-- 
2.25.1


