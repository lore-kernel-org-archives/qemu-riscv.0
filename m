Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8j-0001gJ-GE
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8f-0001XP-Sf; Mon, 01 Nov 2021 06:02:01 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8Z-0001Tj-QQ; Mon, 01 Nov 2021 06:02:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00882658-4.93081e-06-0.991168;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:47 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 05/13] target/riscv: Calculate address according to ol
Date: Mon,  1 Nov 2021 18:01:35 +0800
Message-Id: <20211101100143.44356-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.148; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-148.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:02 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 20 ++++++--------------
 target/riscv/insn_trans/trans_rvf.c.inc | 21 ++++++++-------------
 target/riscv/insn_trans/trans_rvi.c.inc | 21 ++++++++++-----------
 3 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 64fb0046f7..70317691c9 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -20,17 +20,13 @@
 
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
-    TCGv addr;
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
 
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
+    tcg_gen_addi_tl(addr, src1, a->imm);
     addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
@@ -41,17 +37,13 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
 
 static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
-    TCGv addr;
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
 
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
+    tcg_gen_addi_tl(addr, src1, a->imm);
     addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b5459249c4..08fa83df7e 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -26,16 +26,15 @@
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     TCGv_i64 dest;
-    TCGv addr;
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
 
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
+    tcg_gen_addi_tl(addr, src1, a->imm);
+    if (ctx->ol == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
     }
     addr = gen_pm_adjust_address(ctx, addr);
 
@@ -49,17 +48,13 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
 
 static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 {
-    TCGv addr;
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
 
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    addr = get_gpr(ctx, a->rs1, EXT_NONE);
-    if (a->imm) {
-        TCGv temp = tcg_temp_new();
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
-    }
+    tcg_gen_addi_tl(addr, src1, a->imm);
     addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e51dbc41c5..bd9d50bb94 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -137,12 +137,12 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
 
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
+    tcg_gen_addi_tl(addr, src1, a->imm);
+    if (ctx->ol == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
     }
     addr = gen_pm_adjust_address(ctx, addr);
 
@@ -178,16 +178,15 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = temp_new(ctx);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    if (a->imm) {
-        TCGv temp = temp_new(ctx);
-        tcg_gen_addi_tl(temp, addr, a->imm);
-        addr = temp;
+    tcg_gen_addi_tl(addr, src1, a->imm);
+    if (ctx->ol == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
     }
     addr = gen_pm_adjust_address(ctx, addr);
-
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
-- 
2.25.1


