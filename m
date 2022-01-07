Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5nQ2-00054U-94
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 06:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPz-0004wy-V0; Fri, 07 Jan 2022 06:28:23 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:54270 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPu-0006VH-KU; Fri, 07 Jan 2022 06:28:23 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3fS3CI9hh_s5CBQ--.4982S6;
 Fri, 07 Jan 2022 19:28:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 4/6] target/riscv: add support for zdinx
Date: Fri,  7 Jan 2022 19:27:47 +0800
Message-Id: <20220107112749.981-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220107112749.981-1-liweiwei@iscas.ac.cn>
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAB3fS3CI9hh_s5CBQ--.4982S6
X-Coremail-Antispam: 1UD129KBjvAXoWfXFyfKrykuw1kXF45Xw4xZwb_yoW8urykuo
 W7ur47Cr4vgw47uasxGa1rJrWUZay29w1xJrZ09rWkG3Wxur40y34YqF4kZ3WYkr1Fg348
 XFnrAFnFq342ywn8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOb7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF18B
 UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 07 Jan 2022 11:28:24 -0000

  -- update extension check REQUIRE_ZDINX_OR_D
  -- update double float point register read/write

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 319 ++++++++++++++++++------
 target/riscv/translate.c                |  52 ++++
 2 files changed, 293 insertions(+), 78 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 64fb0046f7..d752c8ad9e 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -18,6 +18,19 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZDINX_OR_D(ctx) do { \
+    if (!ctx->ext_zdinx) { \
+        REQUIRE_EXT(ctx, RVD); \
+    } \
+} while (0)
+
+#define REQUIRE_EVEN(ctx, reg) do { \
+    if (ctx->ext_zdinx && (get_xl(ctx) == MXL_RV32) && \
+        (reg & 0x1)) { \
+        return false; \
+    } \
+} while (0)
+
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     TCGv addr;
@@ -62,10 +75,20 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+    REQUIRE_EVEN(ctx, a->rs3);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -73,10 +96,20 @@ static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+    REQUIRE_EVEN(ctx, a->rs3);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -84,10 +117,20 @@ static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
 static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+    REQUIRE_EVEN(ctx, a->rs3);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -95,10 +138,20 @@ static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
 static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+    REQUIRE_EVEN(ctx, a->rs3);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_d(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_d(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -106,12 +159,18 @@ static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
 static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -119,12 +178,18 @@ static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
 static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -132,12 +197,18 @@ static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
 static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -145,12 +216,18 @@ static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
 static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -158,23 +235,37 @@ static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
 static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_d(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
 
 static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
 {
+    REQUIRE_FPU;
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     if (a->rs1 == a->rs2) { /* FMOV */
-        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        dest = get_fpr_d(ctx, a->rs1);
     } else {
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
-                            cpu_fpr[a->rs1], 0, 63);
+        TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+        tcg_gen_deposit_i64(dest, src2, src1, 0, 63);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -182,15 +273,24 @@ static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
 static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
+        tcg_gen_xori_i64(dest, src1, INT64_MIN);
     } else {
+        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
         TCGv_i64 t0 = tcg_temp_new_i64();
-        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 63);
+        tcg_gen_not_i64(t0, src2);
+        tcg_gen_deposit_i64(dest, t0, src1, 0, 63);
         tcg_temp_free_i64(t0);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -198,15 +298,24 @@ static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
 static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
+        tcg_gen_andi_i64(dest, src1, ~INT64_MIN);
     } else {
+        TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
         TCGv_i64 t0 = tcg_temp_new_i64();
-        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT64_MIN);
-        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
+        tcg_gen_andi_i64(t0, src2, INT64_MIN);
+        tcg_gen_xor_i64(dest, src1, t0);
         tcg_temp_free_i64(t0);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -214,11 +323,17 @@ static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
 static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_helper_fmin_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_helper_fmin_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -226,11 +341,17 @@ static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
 static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
-    gen_helper_fmax_d(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
+    gen_helper_fmax_d(dest, cpu_env, src1, src2);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -238,11 +359,15 @@ static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
 static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -250,11 +375,15 @@ static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
 static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_s(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -262,11 +391,15 @@ static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
 static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -274,11 +407,15 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -286,11 +423,15 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
+    REQUIRE_EVEN(ctx, a->rs2);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -298,11 +439,13 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
-    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_d(dest, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -310,12 +453,14 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -323,12 +468,14 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
 static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -336,12 +483,15 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
 static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_w(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -350,12 +500,15 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
 static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_wu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -365,12 +518,14 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -379,12 +534,14 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rs1);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -407,12 +564,15 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_l(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -422,12 +582,15 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+    REQUIRE_EVEN(ctx, a->rd);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_lu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4c5360aa96..00b7307564 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -331,6 +331,31 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
     }
 }
 
+static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    if (reg_num == 0) {
+        return tcg_constant_i64(0);
+    }
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+    {
+        TCGv_i64 t = ftemp_new(ctx);
+        tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
+        return t;
+    }
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        return cpu_gpr[reg_num];
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
 {
     if (!ctx->ext_zfinx) {
@@ -378,6 +403,33 @@ static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
     }
 }
 
+static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (!ctx->ext_zfinx) {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+        return;
+    }
+
+    if (reg_num != 0) {
+        switch (get_xl(ctx)) {
+        case MXL_RV32:
+#ifdef TARGET_RISCV32
+            tcg_gen_extr_i64_i32(cpu_gpr[reg_num], cpu_gpr[reg_num + 1], t);
+            break;
+#else
+            tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
+            tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
+            break;
+        case MXL_RV64:
+            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+            break;
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
-- 
2.17.1


