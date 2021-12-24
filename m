Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0bbN-00073u-Ui
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 22:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bbE-0006qU-E6; Thu, 23 Dec 2021 22:50:33 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:49308 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bav-0001a5-Ua; Thu, 23 Dec 2021 22:50:31 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNqQ8VheYHIBA--.4261S6;
 Fri, 24 Dec 2021 11:50:06 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH 4/6] target/riscv: add support for zdinx
Date: Fri, 24 Dec 2021 11:49:13 +0800
Message-Id: <20211224034915.17204-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACHjwNqQ8VheYHIBA--.4261S6
X-Coremail-Antispam: 1UD129KBjvAXoWfJFyDWry7AF1DGw45Kr13XFb_yoW8AryrCo
 WUuF4UCF4kWw17W3ZxGa1rJrW7Za47uw1xJrZ0934kG3Wxur40ya4Yqa1kZ3WYkr1Fg34r
 XFnxA3ZFq342ywn8n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYl7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTYUUUUU
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
X-List-Received-Date: Fri, 24 Dec 2021 03:50:34 -0000

  -- update extension check REQUIRE_ZDINX_OR_D
  -- update double float point register read/write

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 252 ++++++++++++++++--------
 1 file changed, 174 insertions(+), 78 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 64fb0046f7..084a5c5fbe 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZDINX_OR_D(ctx) do {\
+    if (!ctx->ext_zdinx) {\
+        REQUIRE_EXT(ctx, RVD); \
+    } \
+} while (0)
+
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     TCGv addr;
@@ -62,10 +68,16 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
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
@@ -73,10 +85,16 @@ static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
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
@@ -84,10 +102,16 @@ static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
 static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
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
@@ -95,10 +119,16 @@ static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
 static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
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
@@ -106,12 +136,15 @@ static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
 static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -119,12 +152,15 @@ static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
 static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -132,12 +168,15 @@ static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
 static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -145,12 +184,15 @@ static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
 static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -158,23 +200,34 @@ static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
 static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+
     if (a->rs1 == a->rs2) { /* FMOV */
-        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        tcg_gen_mov_i64(dest, src1);
     } else {
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
-                            cpu_fpr[a->rs1], 0, 63);
+        tcg_gen_deposit_i64(dest, src2,
+                            src1, 0, 63);
     }
+    gen_set_fpr_d(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -182,15 +235,21 @@ static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
 static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
+        tcg_gen_xori_i64(dest, src1, INT64_MIN);
     } else {
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
@@ -198,15 +257,21 @@ static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
 static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
+
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
+        tcg_gen_andi_i64(dest, src1, ~INT64_MIN);
     } else {
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
@@ -214,11 +279,14 @@ static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
 static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -226,11 +294,14 @@ static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
 static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -238,11 +309,14 @@ static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
 static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -250,11 +324,14 @@ static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
 static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
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
@@ -262,11 +339,13 @@ static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
 static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -274,11 +353,13 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -286,11 +367,13 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
 
-    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_d(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -298,11 +381,12 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
-    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_d(dest, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -310,12 +394,13 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -323,12 +408,13 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
 static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -336,12 +422,14 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
 static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_w(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -350,12 +438,14 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
 static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_wu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -365,12 +455,13 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -379,12 +470,13 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_d(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -407,12 +499,14 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_l(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -422,12 +516,14 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZDINX_OR_D(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+    gen_helper_fcvt_d_lu(dest, cpu_env, src);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
-- 
2.17.1


