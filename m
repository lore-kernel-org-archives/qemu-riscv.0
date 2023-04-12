Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQpE-0001VO-GP
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 23:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQpD-0001VC-Dg; Tue, 11 Apr 2023 23:07:11 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQp5-0005ow-QD; Tue, 11 Apr 2023 23:07:06 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowADn7xdMIDZkwaJCEQ--.55287S2;
 Wed, 12 Apr 2023 11:06:53 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: Update check for Zca/zcf/zcd
Date: Wed, 12 Apr 2023 11:06:48 +0800
Message-Id: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADn7xdMIDZkwaJCEQ--.55287S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy3GF1ruF4DWw18ZrWfGrg_yoWrZrWrpr
 yFkFW7GrZ8WryfAayfAF4UtF17tr4Sgr48twnYqwn5Jay3GrW5Zr4DK343KryUXF1kWryY
 kFWUAas8uw40qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UZa9-UUUUU=
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 12 Apr 2023 03:07:11 -0000

Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
version is higher than the priv version of C/F/D. So if we use check
for them instead of check for C/F/D totally, it will trigger new
problem when we try to disable the extensions based on the configured
priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
 target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
 target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
 target/riscv/translate.c                |  5 +++--
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..f8d0ae48c7 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,9 +31,11 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCD(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zcd) {  \
-        return false;     \
+#define REQUIRE_ZCD_OR_DC(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) { \
+        if(!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
@@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
 static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fld(ctx, a);
 }
 
 static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
 {
-    REQUIRE_ZCD(ctx);
+    REQUIRE_ZCD_OR_DC(ctx);
     return trans_fsd(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 9e9fa2087a..58467eb409 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,10 +30,12 @@
     } \
 } while (0)
 
-#define REQUIRE_ZCF(ctx) do {                  \
-    if (!ctx->cfg_ptr->ext_zcf) {              \
-        return false;                          \
-    }                                          \
+#define REQUIRE_ZCF_OR_FC(ctx) do {                    \
+    if (!ctx->cfg_ptr->ext_zcf) {                      \
+        if(!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
+            return false;                              \
+        }                                              \
+    }                                                  \
 } while (0)
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
@@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 
 static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_flw(ctx, a);
 }
 
 static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
 {
-    REQUIRE_ZCF(ctx);
+    REQUIRE_ZCF_OR_FC(ctx);
     return trans_fsw(ctx, a);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c70c495fc5..e33f63bea1 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
+        ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0094922b6..661e29ab39 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -551,7 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1137,7 +1137,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
          * The Zca extension is added as way to refer to instructions in the C
          * extension that do not include the floating-point loads and stores
          */
-        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
+        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
+            decode_insn16(ctx, opcode)) {
             return;
         }
     } else {
-- 
2.25.1


