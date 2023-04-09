Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plSft-0000CA-8t
	for mharc-qemu-riscv@gnu.org; Sun, 09 Apr 2023 06:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfo-0000A8-Kn; Sun, 09 Apr 2023 06:53:29 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfk-0002Xt-Rb; Sun, 09 Apr 2023 06:53:27 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhYUmTJkVyANEA--.55439S7;
 Sun, 09 Apr 2023 18:53:12 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 5/7] target/riscv: Use true diff for gen_pc_plus_diff
Date: Sun,  9 Apr 2023 18:53:04 +0800
Message-Id: <20230409105306.28575-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
References: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHHhYUmTJkVyANEA--.55439S7
X-Coremail-Antispam: 1UD129KBjvJXoWxurW8CrWUAFWxKw17Kw4rXwb_yoW5Wryxpr
 WIkwsrurW5JFWFvayrGF4UZF15Jrs8K3y2kwn3twn7ta1ftrW5Zwn8t3y3KF4UWF93WryY
 kFs0ya4jvw47XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
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
X-List-Received-Date: Sun, 09 Apr 2023 10:53:29 -0000

Reduce reliance on absolute values by using true pc difference for
gen_pc_plus_diff() to prepare for PC-relative translation.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvi.c.inc |  6 ++----
 target/riscv/translate.c                | 13 ++++++-------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 012534c883..b77e6c4fb6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -158,7 +158,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGLabel *l = gen_new_label();
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
-    target_ulong next_pc;
 
     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
@@ -175,11 +174,10 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    next_pc = ctx->base.pc_next + a->imm;
-    if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
+    if (!has_ext(ctx, RVC) && (a->imm & 0x3)) {
         /* misaligned */
         TCGv target_pc = tcg_temp_new();
-        gen_pc_plus_diff(target_pc, ctx, next_pc);
+        gen_pc_plus_diff(target_pc, ctx, a->imm);
         gen_exception_inst_addr_mis(ctx, target_pc);
     } else {
         gen_goto_tb(ctx, 0, a->imm);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db061064a6..50a87d7367 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -224,8 +224,10 @@ static void decode_save_opc(DisasContext *ctx)
 }
 
 static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
-                             target_ulong dest)
+                             target_long diff)
 {
+    target_ulong dest = ctx->base.pc_next + diff;
+
     if (get_xl(ctx) == MXL_RV32) {
         dest = (int32_t)dest;
     }
@@ -234,7 +236,7 @@ static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
 
 static void gen_update_pc(DisasContext *ctx, target_long diff)
 {
-    gen_pc_plus_diff(cpu_pc, ctx, ctx->base.pc_next + diff);
+    gen_pc_plus_diff(cpu_pc, ctx, diff);
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
@@ -545,14 +547,11 @@ static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
-    target_ulong next_pc;
-
     /* check misaligned: */
-    next_pc = ctx->base.pc_next + imm;
     if (!has_ext(ctx, RVC)) {
-        if ((next_pc & 0x3) != 0) {
+        if ((imm & 0x3) != 0) {
             TCGv target_pc = tcg_temp_new();
-            gen_pc_plus_diff(target_pc, ctx, next_pc);
+            gen_pc_plus_diff(target_pc, ctx, imm);
             gen_exception_inst_addr_mis(ctx, target_pc);
             return;
         }
-- 
2.25.1


