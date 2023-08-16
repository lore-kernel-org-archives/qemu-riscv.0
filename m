Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900F5C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:19:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHN6-0000Vb-6f; Wed, 16 Aug 2023 10:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qWHN2-0000VM-S9; Wed, 16 Aug 2023 10:19:37 -0400
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qWHMy-0002FM-ON; Wed, 16 Aug 2023 10:19:36 -0400
Received: from localhost.localdomain (unknown [180.165.241.204])
 by APP-03 (Coremail) with SMTP id rQCowABXX6Pm2txkcCeuAA--.19126S2;
 Wed, 16 Aug 2023 22:19:19 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2] target/riscv: Update CSR bits name for svadu extension
Date: Wed, 16 Aug 2023 22:19:16 +0800
Message-Id: <20230816141916.66898-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXX6Pm2txkcCeuAA--.19126S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1fKFyUXFW7Cr47Gr4kZwb_yoW7ArW3pF
 W5Ga9rJ395JF97Xan3Ar4Yg3W8Jws5CwsxZw4q9a1kZFW5GrWrJasrtws8AryUWFW8Jr10
 9w45Ar13Ar4kZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [180.165.241.204]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.81; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The Svadu specification updated the name of the *envcfg bit from
HADE to ADUE.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---

v2:
* rename hade variable name to adue suggested by Daniel

 target/riscv/cpu.c        |  4 ++--
 target/riscv/cpu_bits.h   |  8 ++++----
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..f04a985d55 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -875,9 +875,9 @@ static void riscv_cpu_reset_hold(Object *obj)
     env->two_stage_lookup = false;
 
     env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
-                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
+                   (cpu->cfg.ext_svadu ? MENVCFG_ADUE : 0);
     env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
-                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
+                   (cpu->cfg.ext_svadu ? HENVCFG_ADUE : 0);
 
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 59f0ffd9e1..1c2ffae883 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -745,12 +745,12 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
-#define MENVCFG_HADE                       (1ULL << 61)
+#define MENVCFG_ADUE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
 
 /* For RV32 */
-#define MENVCFGH_HADE                      BIT(29)
+#define MENVCFGH_ADUE                      BIT(29)
 #define MENVCFGH_PBMTE                     BIT(30)
 #define MENVCFGH_STCE                      BIT(31)
 
@@ -763,12 +763,12 @@ typedef enum RISCVException {
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
-#define HENVCFG_HADE                       MENVCFG_HADE
+#define HENVCFG_ADUE                       MENVCFG_ADUE
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
 
 /* For RV32 */
-#define HENVCFGH_HADE                       MENVCFGH_HADE
+#define HENVCFGH_ADUE                       MENVCFGH_ADUE
 #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
 #define HENVCFGH_STCE                       MENVCFGH_STCE
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9f611d89bb..3a02079290 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -861,11 +861,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-    bool hade = env->menvcfg & MENVCFG_HADE;
+    bool adue = env->menvcfg & MENVCFG_ADUE;
 
     if (first_stage && two_stage && env->virt_enabled) {
         pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
-        hade = hade && (env->henvcfg & HENVCFG_HADE);
+        adue = adue && (env->henvcfg & HENVCFG_ADUE);
     }
 
     int ptshift = (levels - 1) * ptidxbits;
@@ -1026,7 +1026,7 @@ restart:
 
     /* Page table updates need to be atomic with MTTCG enabled */
     if (updated_pte != pte && !is_debug) {
-        if (!hade) {
+        if (!adue) {
             return TRANSLATE_FAIL;
         }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..b4c66dc8ca 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1951,7 +1951,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                 (cfg->ext_sstc ? MENVCFG_STCE : 0) |
-                (cfg->ext_svadu ? MENVCFG_HADE : 0);
+                (cfg->ext_svadu ? MENVCFG_ADUE : 0);
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
@@ -1971,7 +1971,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                     (cfg->ext_sstc ? MENVCFG_STCE : 0) |
-                    (cfg->ext_svadu ? MENVCFG_HADE : 0);
+                    (cfg->ext_svadu ? MENVCFG_ADUE : 0);
     uint64_t valh = (uint64_t)val << 32;
 
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
@@ -2023,7 +2023,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
      * henvcfg.stce is read_only 0 when menvcfg.stce = 0
      * henvcfg.hade is read_only 0 when menvcfg.hade = 0
      */
-    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
+    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE) |
                            env->menvcfg);
     return RISCV_EXCP_NONE;
 }
@@ -2040,7 +2040,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
     }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE);
+        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE);
     }
 
     env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
@@ -2058,7 +2058,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
+    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE) |
                             env->menvcfg)) >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -2067,7 +2067,7 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
     uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
-                                    HENVCFG_HADE);
+                                    HENVCFG_ADUE);
     uint64_t valh = (uint64_t)val << 32;
     RISCVException ret;
 
-- 
2.25.1


