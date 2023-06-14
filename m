Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC48EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 03:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9H96-0000RI-Cn; Tue, 13 Jun 2023 23:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9H95-0000Ql-5n; Tue, 13 Jun 2023 23:26:07 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9H92-0002do-5w; Tue, 13 Jun 2023 23:26:06 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-01 (Coremail) with SMTP id qwCowAAHX8o9M4lkAAEBAw--.60726S3;
 Wed, 14 Jun 2023 11:25:52 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: Add additional xlen for address when MPRV=1
Date: Wed, 14 Jun 2023 11:25:46 +0800
Message-Id: <20230614032547.35895-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
References: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHX8o9M4lkAAEBAw--.60726S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WryDCF1fKrW7uFy5ur1Utrb_yoW7XFW8pF
 WxGFWak34xXa9rGayftF4UXF1rAFyFk3y5Jwn7Gwsa9F45XrW5CFyDKa43ZFWUWFy8uryj
 kF4kAr1UuF4UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU
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

As specified in privilege spec:"When MPRV=1, load and store memory
addresses are treated as though the current XLEN were set to MPP’s
XLEN". So the xlen for address may be different from current xlen.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h        | 49 +++++++++++++++++++++++++++++++++------
 target/riscv/cpu_helper.c |  1 +
 target/riscv/translate.c  | 13 ++++++++++-
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e3e08d315f..cc20ee25a7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -498,6 +498,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, PRIV, 24, 2)
+FIELD(TB_FLAGS, AXL, 26, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
@@ -514,13 +515,20 @@ static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
     return &env_archcpu(env)->cfg;
 }
 
-#if defined(TARGET_RISCV32)
-#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
-#else
-static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
+#if !defined(CONFIG_USER_ONLY)
+static inline int cpu_address_mode(CPURISCVState *env)
+{
+    int mode = env->priv;
+
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    return mode;
+}
+
+static inline RISCVMXL cpu_get_xl(CPURISCVState *env, target_ulong mode)
 {
     RISCVMXL xl = env->misa_mxl;
-#if !defined(CONFIG_USER_ONLY)
     /*
      * When emulating a 32-bit-only cpu, use RV32.
      * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
@@ -528,7 +536,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
      * back to RV64 for lower privs.
      */
     if (xl != MXL_RV32) {
-        switch (env->priv) {
+        switch (mode) {
         case PRV_M:
             break;
         case PRV_U:
@@ -539,11 +547,38 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
             break;
         }
     }
-#endif
     return xl;
 }
 #endif
 
+#if defined(TARGET_RISCV32)
+#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    return cpu_get_xl(env, env->priv);
+#else
+    return env->misa_mxl;
+#endif
+}
+#endif
+
+#if defined(TARGET_RISCV32)
+#define cpu_address_xl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL cpu_address_xl(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return env->xl;
+#else
+    int mode = cpu_address_mode(env);
+
+    return cpu_get_xl(env, mode);
+#endif
+}
+#endif
+
 static inline int riscv_cpu_xlen(CPURISCVState *env)
 {
     return 16 << env->xl;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 90cef9856d..f85113a3db 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -134,6 +134,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
+    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
     if (env->cur_pmmask != 0) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8a33da811e..4bf61766b6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,6 +64,7 @@ typedef struct DisasContext {
     target_ulong priv_ver;
     RISCVMXL misa_mxl_max;
     RISCVMXL xl;
+    RISCVMXL address_xl;
     uint32_t misa_ext;
     uint32_t opcode;
     RISCVExtStatus mstatus_fs;
@@ -152,6 +153,14 @@ MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
 #define get_xl(ctx)    ((ctx)->xl)
 #endif
 
+#ifdef TARGET_RISCV32
+#define get_address_xl(ctx)    MXL_RV32
+#elif defined(CONFIG_USER_ONLY)
+#define get_address_xl(ctx)    MXL_RV64
+#else
+#define get_address_xl(ctx)    ((ctx)->address_xl)
+#endif
+
 /* The word size for this machine mode. */
 static inline int __attribute__((unused)) get_xlen(DisasContext *ctx)
 {
@@ -598,12 +607,13 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     tcg_gen_addi_tl(addr, src1, imm);
     if (ctx->pm_mask_enabled) {
         tcg_gen_andc_tl(addr, addr, pm_mask);
-    } else if (get_xl(ctx) == MXL_RV32) {
+    } else if (get_address_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
     if (ctx->pm_base_enabled) {
         tcg_gen_or_tl(addr, addr, pm_base);
     }
+
     return addr;
 }
 
@@ -1200,6 +1210,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
+    ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
-- 
2.25.1


