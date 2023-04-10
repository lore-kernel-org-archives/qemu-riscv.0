Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pliJu-0003ty-51
	for mharc-qemu-riscv@gnu.org; Sun, 09 Apr 2023 23:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pliJt-0003tV-2f; Sun, 09 Apr 2023 23:35:53 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pliJq-0005rG-Ep; Sun, 09 Apr 2023 23:35:52 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BQAhDNkmVlWEA--.60484S4;
 Mon, 10 Apr 2023 11:35:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: Add ext_z*_enabled for implicitly enabled
 extensions
Date: Mon, 10 Apr 2023 11:35:26 +0800
Message-Id: <20230410033526.31708-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BQAhDNkmVlWEA--.60484S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWkKw4kWr17Jr4UGF4xCrg_yoWDJFykpr
 48G3yYkryDJry8C3yfXF4UtF15Gr4S93yxK34vgwn3Way7CrW5XF1vkw12gF4Yq3Z5XFya
 93W2kF15Z3y7Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
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
X-List-Received-Date: Mon, 10 Apr 2023 03:35:53 -0000

For extensions that may implicitly enabled from misa.EXT:
- ext_* is true if the extension is explicitly-enabled.
- ext_*_enabled is true no matter the extension is implicitly-enabled or
explicitly-enabled. And we change the check on the extension to it.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c                      | 29 +++++++++++++++----------
 target/riscv/cpu.h                      |  8 +++++++
 target/riscv/cpu_helper.c               |  2 +-
 target/riscv/csr.c                      |  2 +-
 target/riscv/insn_trans/trans_rvd.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
 target/riscv/insn_trans/trans_rvv.c.inc | 16 +++++++-------
 target/riscv/translate.c                |  4 ++--
 9 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index abb65d41b1..815dd19f36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,29 +811,35 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 
 static void set_implicit_extensions_from_ext(RISCVCPU *cpu)
 {
+    cpu->cfg.ext_zve64d_enabled = cpu->cfg.ext_zve64d;
+    cpu->cfg.ext_zve64f_enabled = cpu->cfg.ext_zve64f;
+    cpu->cfg.ext_zve32f_enabled = cpu->cfg.ext_zve32f;
+    cpu->cfg.ext_zca_enabled = cpu->cfg.ext_zca;
+    cpu->cfg.ext_zcf_enabled = cpu->cfg.ext_zcf;
+    cpu->cfg.ext_zcd_enabled = cpu->cfg.ext_zcd;
 
     /* The V vector extension depends on the Zve64d extension */
     if (cpu->cfg.ext_v) {
-        cpu->cfg.ext_zve64d = true;
+        cpu->cfg.ext_zve64d_enabled = true;
     }
 
     /* The Zve64d extension depends on the Zve64f extension */
     if (cpu->cfg.ext_zve64d) {
-        cpu->cfg.ext_zve64f = true;
+        cpu->cfg.ext_zve64f_enabled = true;
     }
 
     /* The Zve64f extension depends on the Zve32f extension */
     if (cpu->cfg.ext_zve64f) {
-        cpu->cfg.ext_zve32f = true;
+        cpu->cfg.ext_zve32f_enabled = true;
     }
 
     if (cpu->cfg.ext_c) {
-        cpu->cfg.ext_zca = true;
+        cpu->cfg.ext_zca_enabled = true;
         if (cpu->cfg.ext_f && cpu->env.misa_mxl_max == MXL_RV32) {
-            cpu->cfg.ext_zcf = true;
+            cpu->cfg.ext_zcf_enabled = true;
         }
         if (cpu->cfg.ext_d) {
-            cpu->cfg.ext_zcd = true;
+            cpu->cfg.ext_zcd_enabled = true;
         }
     }
 }
@@ -917,12 +923,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d_enabled && !cpu->cfg.ext_d) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f_enabled && !cpu->cfg.ext_f) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -931,7 +937,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zvfhmin = true;
     }
 
-    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
+    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f_enabled) {
         error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
         return;
     }
@@ -988,13 +994,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
-         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) &&
+        !cpu->cfg.ext_zca_enabled) {
         error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
                          "extension");
         return;
     }
 
-    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+    if (cpu->cfg.ext_zcd_enabled && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
         error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
                          "Zcd extension");
         return;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4af8ebc558..c59f099dd3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -523,6 +523,14 @@ struct RISCVCPUConfig {
     bool debug;
     bool misa_w;
 
+    /* May implicitly enabled extensions by misa.EXT */
+    bool ext_zca_enabled;
+    bool ext_zcf_enabled;
+    bool ext_zcd_enabled;
+    bool ext_zve32f_enabled;
+    bool ext_zve64f_enabled;
+    bool ext_zve64d_enabled;
+
     bool short_isa_string;
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 433ea529b0..c9638ae905 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -51,7 +51,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
 
-    if (cpu->cfg.ext_zve32f) {
+    if (cpu->cfg.ext_zve32f_enabled) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4d2dcfdc8..1639a1bdd6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -88,7 +88,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (riscv_cpu_cfg(env)->ext_zve32f) {
+    if (riscv_cpu_cfg(env)->ext_zve32f_enabled) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..b0900a2274 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -32,7 +32,7 @@
 } while (0)
 
 #define REQUIRE_ZCD(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zcd) {  \
+    if (!ctx->cfg_ptr->ext_zcd_enabled) {  \
         return false;     \
     } \
 } while (0)
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 9e9fa2087a..6e810bab3c 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -31,7 +31,7 @@
 } while (0)
 
 #define REQUIRE_ZCF(ctx) do {                  \
-    if (!ctx->cfg_ptr->ext_zcf) {              \
+    if (!ctx->cfg_ptr->ext_zcf_enabled) {      \
         return false;                          \
     }                                          \
 } while (0)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c70c495fc5..8947176718 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     gen_set_pc(ctx, cpu_pc);
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!ctx->cfg_ptr->ext_zca_enabled) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
@@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    if (!ctx->cfg_ptr->ext_zca_enabled &&
+        ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ca3c4c1a3d..fbd5b9b626 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -42,9 +42,9 @@ static bool require_rvf(DisasContext *s)
     case MO_16:
         return s->cfg_ptr->ext_zvfh;
     case MO_32:
-        return s->cfg_ptr->ext_zve32f;
+        return s->cfg_ptr->ext_zve32f_enabled;
     case MO_64:
-        return s->cfg_ptr->ext_zve64d;
+        return s->cfg_ptr->ext_zve64d_enabled;
     default:
         return false;
     }
@@ -60,9 +60,9 @@ static bool require_scale_rvf(DisasContext *s)
     case MO_8:
         return s->cfg_ptr->ext_zvfh;
     case MO_16:
-        return s->cfg_ptr->ext_zve32f;
+        return s->cfg_ptr->ext_zve32f_enabled;
     case MO_32:
-        return s->cfg_ptr->ext_zve64d;
+        return s->cfg_ptr->ext_zve64d_enabled;
     default:
         return false;
     }
@@ -78,9 +78,9 @@ static bool require_scale_rvfmin(DisasContext *s)
     case MO_8:
         return s->cfg_ptr->ext_zvfhmin;
     case MO_16:
-        return s->cfg_ptr->ext_zve32f;
+        return s->cfg_ptr->ext_zve32f_enabled;
     case MO_32:
-        return s->cfg_ptr->ext_zve64d;
+        return s->cfg_ptr->ext_zve64d_enabled;
     default:
         return false;
     }
@@ -149,7 +149,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
     TCGv s1, dst;
 
-    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
+    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f_enabled) {
         return false;
     }
 
@@ -179,7 +179,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 {
     TCGv dst;
 
-    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
+    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f_enabled) {
         return false;
     }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0094922b6..3c0c5e58eb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -551,7 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
-    if (!ctx->cfg_ptr->ext_zca) {
+    if (!ctx->cfg_ptr->ext_zca_enabled) {
         if ((next_pc & 0x3) != 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -1137,7 +1137,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
          * The Zca extension is added as way to refer to instructions in the C
          * extension that do not include the floating-point loads and stores
          */
-        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
+        if (ctx->cfg_ptr->ext_zca_enabled && decode_insn16(ctx, opcode)) {
             return;
         }
     } else {
-- 
2.25.1


