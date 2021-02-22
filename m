Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEGHT-0006mP-6K
	for mharc-qemu-riscv@gnu.org; Mon, 22 Feb 2021 13:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1lEGHP-0006kC-BH; Mon, 22 Feb 2021 13:50:01 -0500
Received: from ppsw-30.csi.cam.ac.uk ([131.111.8.130]:50646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1lEGHL-0004RK-79; Mon, 22 Feb 2021 13:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
 s=20180806.ppsw;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kZ06EAQqisBaZL/oJvVGY4LaWYo6NZdCaDA5Y0JDEe4=; b=JcVPiEwwFIE3dGf4VMUA9sxikt
 r3+m4gTdRXtuFuvqCrHHWLrH5wD81LuUl+9k3G/jC1MTTOuzA2qbS60zw0EjbmRD9EwDv2gpEb48w
 G96dFV+cfF957kA92c6chTz5FaNyLeFMMIjc8sIGf1YoqboKWQ6q0sR9mv2CWFQWFgx0=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from host86-156-0-119.range86-156.btcentralplus.com
 ([86.156.0.119]:53365 helo=Alexs-MBP-10.home)
 by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:587)
 with esmtpsa (LOGIN:alr48) (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1lEGHD-000pj0-di (Exim 4.94)
 (return-path <alr48@hermes.cam.ac.uk>); Mon, 22 Feb 2021 18:49:47 +0000
From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
To: 
Cc: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2 1/2] target/riscv: Reduce duplicated code in trans_rvh.c.inc
Date: Mon, 22 Feb 2021 18:49:38 +0000
Message-Id: <20210222184940.43169-1-Alexander.Richardson@cl.cam.ac.uk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: "A.L. Richardson" <alr48@hermes.cam.ac.uk>
Received-SPF: pass client-ip=131.111.8.130;
 envelope-from=alr48@hermes.cam.ac.uk; helo=ppsw-30.csi.cam.ac.uk
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2021 18:50:01 -0000

I rencently merged CHERI QEMU up to 5.2, and we have to modify all
functions that perform memory accesses. Factoring these almost-indentical
functions into two shared helpers makes our changes a lot smaller and
should also make this code easier to maintain.
---
 target/riscv/insn_trans/trans_rvh.c.inc | 199 ++++--------------------
 1 file changed, 29 insertions(+), 170 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index ce7ed5affb..c66268a9b0 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -28,7 +28,7 @@ static void check_access(DisasContext *ctx) {
 }
 #endif
 
-static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
+static bool gen_hlv(DisasContext *ctx, int rs1, int rd, MemOp memop)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
@@ -37,10 +37,10 @@ static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(t0, rs1);
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-    gen_set_gpr(a->rd, t1);
+    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, memop);
+    gen_set_gpr(rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -50,224 +50,83 @@ static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 #endif
 }
 
-static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
+
+static bool gen_hsv(DisasContext *ctx, int rs1, int rs2, MemOp memop)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
+    TCGv dat = tcg_temp_new();
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(t0, rs1);
+    gen_get_gpr(dat, rs2);
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-    gen_set_gpr(a->rd, t1);
+    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, memop);
 
     tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    tcg_temp_free(dat);
     return true;
 #else
     return false;
 #endif
 }
 
-static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
+static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
+    return gen_hlv(ctx, a->rs1, a->rd, MO_SB);
+}
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-    gen_set_gpr(a->rd, t1);
+static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
+{
+    return gen_hlv(ctx, a->rs1, a->rd, MO_TESW);
+}
 
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
+{
+    return gen_hlv(ctx, a->rs1, a->rd, MO_TESL);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rd, MO_UB);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rd, MO_TEUW);
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rs2, MO_SB);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rs2, MO_TESW);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rs2, MO_TESL);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rd, MO_TEUL);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rd, MO_TEQ);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
-    REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return gen_hlv(ctx, a->rs1, a->rs2, MO_TEQ);
 }
 #endif
 
-- 
2.30.0


