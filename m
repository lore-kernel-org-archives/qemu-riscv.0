Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plSfu-0000Dk-VC
	for mharc-qemu-riscv@gnu.org; Sun, 09 Apr 2023 06:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfo-0000A7-Kw; Sun, 09 Apr 2023 06:53:29 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfl-0002Xq-DK; Sun, 09 Apr 2023 06:53:27 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhYUmTJkVyANEA--.55439S9;
 Sun, 09 Apr 2023 18:53:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 7/7] target/riscv: Remove pc_succ_insn from DisasContext
Date: Sun,  9 Apr 2023 18:53:06 +0800
Message-Id: <20230409105306.28575-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
References: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHHhYUmTJkVyANEA--.55439S9
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWxWFyfXw13CrWkJFWkZwb_yoW8Zr4xpF
 48CrW7Kr98WFy3Cas5JF47XFy7Gw45GrW8Ww1q9ws3GF43Zws5CrWDGryYgF4kXFW09ryq
 yF4qyry5AF12kaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
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

pc_succ_insn is no longer useful after the introduce of cur_insn_len
and all pc related value use diff value instead of absolute value.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/translate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 632e1cef59..d8899fcc4b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1150,7 +1150,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     /* Check for compressed insn */
     if (ctx->cur_insn_len == 2) {
         ctx->opcode = opcode;
-        ctx->pc_succ_insn = ctx->base.pc_next + 2;
         if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
             return;
         }
@@ -1160,7 +1159,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
         ctx->opcode = opcode32;
-        ctx->pc_succ_insn = ctx->base.pc_next + 4;
 
         for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
             if (decoders[i].guard_func(ctx) &&
@@ -1181,7 +1179,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_save = ctx->base.pc_first;
-    ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
@@ -1244,7 +1241,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     ctx->ol = ctx->xl;
     decode_opc(env, ctx, opcode16);
-    ctx->base.pc_next = ctx->pc_succ_insn;
+    ctx->base.pc_next += ctx->cur_insn_len;
 
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.25.1


