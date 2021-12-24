Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0bbJ-0006vH-JD
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 22:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bb7-0006mx-G9; Thu, 23 Dec 2021 22:50:26 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:49276 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0baw-0001Za-Nv; Thu, 23 Dec 2021 22:50:25 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNqQ8VheYHIBA--.4261S4;
 Fri, 24 Dec 2021 11:50:05 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/6] target/riscv: add support for unique fpr read/write with
 support for zfinx
Date: Fri, 24 Dec 2021 11:49:11 +0800
Message-Id: <20211224034915.17204-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACHjwNqQ8VheYHIBA--.4261S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGF13ZF1ruw1xWrWrZr4kXrb_yoW7JrW5pF
 4Ik34UZrn5Xr1fGFWSyr4UArn8ur1S9ryqy3yrC3y8Ar42qrn8Cwn3KrWavFW7AFZ5ur1Y
 kFZxCFWUCF48Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Fri, 24 Dec 2021 03:50:26 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/translate.c | 169 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8b1cdacf50..bac42e60bd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -104,10 +104,13 @@ typedef struct DisasContext {
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
+    uint8_t nftemp;
     CPUState *cs;
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* Space for 4 float point operands */
+    TCGv_i64 ftemp[4];
     /* PointerMasking extension */
     bool pm_enabled;
     TCGv pm_mask;
@@ -295,6 +298,165 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static TCGv_i64 ftemp_new(DisasContext *ctx)
+{
+    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
+    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
+}
+
+static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
+{
+    if (ctx->ext_zfinx) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+#ifdef TARGET_RISCV32
+        {
+            TCGv_i64 t = ftemp_new(ctx);
+            if (reg_num == 0) {
+                tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);
+            } else {
+                tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], ctx->zero);
+            }
+            return t;
+        }
+#else
+        /* fall through */
+        case MXL_RV64:
+            if (reg_num == 0) {
+                return ctx->zero;
+            } else {
+                return cpu_gpr[reg_num];
+            }
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        return cpu_fpr[reg_num];
+    }
+}
+
+static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
+{
+    if (ctx->ext_zfinx) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            if (reg_num & 1) {
+                gen_exception_illegal(ctx);
+                return NULL;
+            } else {
+#ifdef TARGET_RISCV32
+                TCGv_i64 t = ftemp_new(ctx);
+                if (reg_num == 0) {
+                    tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);
+                } else {
+                    tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
+                }
+                return t;
+            }
+#else
+                if (reg_num == 0) {
+                    return ctx->zero;
+                } else {
+                    TCGv_i64 t = ftemp_new(ctx);
+                    tcg_gen_deposit_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1], 32, 32);
+                    return t;
+                }
+            }
+        case MXL_RV64:
+            if (reg_num == 0) {
+                return ctx->zero;
+            } else {
+                return cpu_gpr[reg_num];
+            }
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        return cpu_fpr[reg_num];
+    }
+}
+
+static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
+{
+    if (ctx->ext_zfinx) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            return ftemp_new(ctx);
+#ifdef TARGET_RISCV64
+        case MXL_RV64:
+            if (reg_num == 0) {
+                return ftemp_new(ctx);
+            } else {
+                return cpu_gpr[reg_num];
+            }
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        return cpu_fpr[reg_num];
+    }
+}
+
+static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (ctx->ext_zfinx) {
+        if (reg_num != 0) {
+            switch (get_ol(ctx)) {
+            case MXL_RV32:
+#ifdef TARGET_RISCV32
+                tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
+                break;
+#else
+                tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
+                break;
+            case MXL_RV64:
+                tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+                break;
+#endif
+            default:
+                g_assert_not_reached();
+            }
+        }
+    } else {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+    }
+}
+
+static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (ctx->ext_zfinx) {
+        if (reg_num != 0) {
+            switch (get_ol(ctx)) {
+            case MXL_RV32:
+                if (reg_num & 1) {
+                    gen_exception_illegal(ctx);
+                } else {
+#ifdef TARGET_RISCV32
+                    tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
+                    tcg_gen_extrh_i64_i32(cpu_gpr[reg_num + 1], t);
+                }
+                break;
+#else
+                    tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
+                    tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
+                }
+                break;
+            case MXL_RV64:
+                tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+                break;
+#endif
+            default:
+                g_assert_not_reached();
+            }
+        }
+    } else {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -727,6 +889,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->nftemp = 0;
+    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
     int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
     ctx->pm_mask = pm_mask[priv];
@@ -761,6 +925,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         ctx->temp[i] = NULL;
     }
     ctx->ntemp = 0;
+    for (int i = ctx->nftemp - 1; i >= 0; --i) {
+        tcg_temp_free_i64(ctx->ftemp[i]);
+        ctx->ftemp[i] = NULL;
+    }
+    ctx->nftemp = 0;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
         target_ulong page_start;
-- 
2.17.1


