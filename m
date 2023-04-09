Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plSfy-0000FA-8X
	for mharc-qemu-riscv@gnu.org; Sun, 09 Apr 2023 06:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfp-0000AS-Gc; Sun, 09 Apr 2023 06:53:30 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plSfl-0002Xa-Fv; Sun, 09 Apr 2023 06:53:29 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhYUmTJkVyANEA--.55439S5;
 Sun, 09 Apr 2023 18:53:11 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 3/7] target/riscv: Change gen_goto_tb to work on displacements
Date: Sun,  9 Apr 2023 18:53:02 +0800
Message-Id: <20230409105306.28575-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
References: <20230409105306.28575-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHHhYUmTJkVyANEA--.55439S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyruw1UtF4fArW7Xr43KFg_yoW8KFyxpF
 4Ikr47GFW5WFWrJa40gF4UJF13JF4agrW8K3s3twn5tF43JrWrAF4DKay3KF4UZFW8Xr1j
 kF4qyF98ur47tFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5U
 UUUU=
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
X-List-Received-Date: Sun, 09 Apr 2023 10:53:30 -0000

Reduce reliance on absolute value to prepare for PC-relative translation.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 target/riscv/translate.c                | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index cc72864d32..f9a2464287 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -171,7 +171,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     } else {
         tcg_gen_brcond_tl(cond, src1, src2, l);
     }
-    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+    gen_goto_tb(ctx, 1, ctx->cur_insn_len);
 
     gen_set_label(l); /* branch taken */
 
@@ -182,7 +182,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
         gen_pc_plus_diff(target_pc, ctx, next_pc);
         gen_exception_inst_addr_mis(ctx, target_pc);
     } else {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
+        gen_goto_tb(ctx, 0, a->imm);
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index eee13b1225..8c157d947e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -281,8 +281,10 @@ static void exit_tb(DisasContext *ctx)
     tcg_gen_exit_tb(NULL, 0);
 }
 
-static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int n, target_long diff)
 {
+    target_ulong dest = ctx->base.pc_next + diff;
+
      /*
       * Under itrigger, instruction executes one by one like singlestep,
       * direct block chain benefits will be small.
@@ -557,7 +559,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     }
 
     gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
-    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for safety */
+    gen_goto_tb(ctx, 0, imm); /* must use this for safety */
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1237,7 +1239,7 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 
     switch (ctx->base.is_jmp) {
     case DISAS_TOO_MANY:
-        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        gen_goto_tb(ctx, 0, 0);
         break;
     case DISAS_NORETURN:
         break;
-- 
2.25.1


