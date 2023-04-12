Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQL6-0000JM-1k
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL4-0000Ia-Ae; Tue, 11 Apr 2023 22:36:02 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL2-0008U7-0Q; Tue, 11 Apr 2023 22:36:02 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDABGTZkp2E_EQ--.55592S4;
 Wed, 12 Apr 2023 10:35:47 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 2/5] target/riscv: Add support for Zfbfmin extension
Date: Wed, 12 Apr 2023 10:33:17 +0800
Message-Id: <20230412023320.50706-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDABGTZkp2E_EQ--.55592S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4fGw13tF4xZF1rWF1DAwb_yoWxWF1xpF
 4fCFWUC3ykJFyfZaySka15AF17Gan3Kw4UJwn3Kw1kJa15GrZ8Zr4DK3y3KrWDJFyDWr1Y
 93WjyFy5A3y0qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUU
 UUU==
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
X-List-Received-Date: Wed, 12 Apr 2023 02:36:02 -0000

Add trans_* and helper function for Zfbfmin instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/fpu_helper.c                  | 12 +++++
 target/riscv/helper.h                      |  4 ++
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 53 ++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc  | 12 ++---
 target/riscv/translate.c                   |  1 +
 6 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvbf16.c.inc

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 449d236df6..013b52f9e3 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -593,3 +593,15 @@ uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
     float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_float64(frs1, true, &env->fp_status);
 }
+
+uint64_t helper_fcvt_bf16_s(CPURISCVState *env, uint64_t rs1)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    return nanbox_h(env, float32_to_bfloat16(frs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_s_bf16(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    return nanbox_s(env, bfloat16_to_float32(frs1, &env->fp_status));
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 37b54e0991..7650168eb0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1142,3 +1142,7 @@ DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+/* BF16 functions */
+DEF_HELPER_FLAGS_2(fcvt_bf16_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 73d5d1b045..874a5cb974 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -908,3 +908,7 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
 # *** RV32 Zicond Standard Extension ***
 czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
 czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
+
+# *** Zfbfmin Standard Extension ***
+fcvt_bf16_s       0100010  00100 ..... ... ..... 1010011 @r2_rm
+fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
new file mode 100644
index 0000000000..2a299075d8
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
@@ -0,0 +1,53 @@
+/*
+ * RISC-V translation routines for the BF16 Standard Extensions.
+ *
+* Copyright (c) 2020-2023 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZFBFMIN(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zfbfmin) { \
+        return false; \
+    } \
+} while (0)
+
+static bool trans_fcvt_bf16_s(DisasContext *ctx, arg_fcvt_bf16_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFBFMIN(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_bf16_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_s_bf16(DisasContext *ctx, arg_fcvt_s_bf16 *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFBFMIN(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_bf16(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 74dde37ff7..8b1e2519bb 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -28,8 +28,8 @@
     }                                  \
 } while (0)
 
-#define REQUIRE_ZFHMIN(ctx) do {              \
-    if (!ctx->cfg_ptr->ext_zfhmin) {          \
+#define REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zfhmin && !ctx->cfg_ptr->ext_zfbfmin) { \
         return false;                         \
     }                                         \
 } while (0)
@@ -46,7 +46,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -69,7 +69,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -574,7 +574,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -594,7 +594,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..836229e87f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1085,6 +1085,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
+#include "insn_trans/trans_rvbf16.c.inc"
 #include "decode-xthead.c.inc"
 #include "insn_trans/trans_xthead.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
-- 
2.25.1


