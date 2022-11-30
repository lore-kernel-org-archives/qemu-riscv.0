Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0Hrj-0002B0-0r
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 02:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0Hrb-00028H-8E; Wed, 30 Nov 2022 02:50:39 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0HrX-0001BG-H2; Wed, 30 Nov 2022 02:50:38 -0500
Received: from localhost.localdomain (unknown [180.175.30.174])
 by APP-01 (Coremail) with SMTP id qwCowACnrDBAC4djxmiWAw--.18654S4;
 Wed, 30 Nov 2022 15:50:27 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>, Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v8 2/9] target/riscv: add support for Zca extension
Date: Wed, 30 Nov 2022 15:49:54 +0800
Message-Id: <20221130075001.19130-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
References: <20221130075001.19130-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrDBAC4djxmiWAw--.18654S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF13tF18Ww1xCrWfXw1UJrb_yoW8KrWxpr
 WFk3y7KrZ5Jr93Aa95GF4Utr1UJw4Sgr4xJw4vvwn3JFW3XrW5XF4DK343KrWUZFs2qFyY
 9FWqyFn8Za18XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUU
 UUU==
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 30 Nov 2022 07:50:41 -0000

Modify the check for C extension to Zca (C implies Zca)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 target/riscv/translate.c                | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 4496f21266..ef7c3002b0 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx->cfg_ptr->ext_zca) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -178,7 +178,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2ab8772ebe..cf8f10afa2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -557,7 +557,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!has_ext(ctx, RVC)) {
+    if (!ctx->cfg_ptr->ext_zca) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1097,7 +1097,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     ctx->virt_inst_excp = false;
     /* Check for compressed insn */
     if (insn_len(opcode) == 2) {
-        if (!has_ext(ctx, RVC)) {
+        /*
+         * The Zca extension is added as way to refer to instructions in the C
+         * extension that do not include the floating-point loads and stores
+         */
+        if (!ctx->cfg_ptr->ext_zca) {
             gen_exception_illegal(ctx);
         } else {
             ctx->opcode = opcode;
-- 
2.25.1


