Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD846-0006Qh-GF
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1lD844-0006NJ-Mv; Fri, 19 Feb 2021 10:51:32 -0500
Received: from ppsw-41.csi.cam.ac.uk ([131.111.8.141]:58822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1lD842-0005L7-Uu; Fri, 19 Feb 2021 10:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
 s=20180806.ppsw;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SW5jTn9WteGASvOpQnPr5MkU6ynaNRoFa9KXoZRVMgw=; b=k6cPehbHMc1P2OCxwQHhwx3IQv
 xxqPJ3vAK74DlWHEvlzydxBtOG2p6ZrvGjQZ61GmWGFOcgADQe56gW3vUI3XUNwp8e7UZsEfWpARE
 kZs/DZpPZS7UVrUBCt4EbNJaEojjbf41edO6o647n8eLf34pgYTkTNl7TgZNnhc0RXZc=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from host86-156-0-119.range86-156.btcentralplus.com
 ([86.156.0.119]:49213 helo=Alexs-MBP-10.home)
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:587)
 with esmtpsa (LOGIN:alr48) (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1lD83y-000II8-S7 (Exim 4.94)
 (return-path <alr48@hermes.cam.ac.uk>); Fri, 19 Feb 2021 15:51:26 +0000
From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
To: 
Cc: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 2/2] target/riscv: Call check_access() before tcg_temp_new()
Date: Fri, 19 Feb 2021 15:50:52 +0000
Message-Id: <20210219155052.76921-2-Alexander.Richardson@cl.cam.ac.uk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210219155052.76921-1-Alexander.Richardson@cl.cam.ac.uk>
References: <20210219155052.76921-1-Alexander.Richardson@cl.cam.ac.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: "A.L. Richardson" <alr48@hermes.cam.ac.uk>
Received-SPF: pass client-ip=131.111.8.141;
 envelope-from=alr48@hermes.cam.ac.uk; helo=ppsw-41.csi.cam.ac.uk
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 19 Feb 2021 15:51:33 -0000

---
 target/riscv/insn_trans/trans_rvh.c.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 203a620723..b0a9ea1dca 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -32,11 +32,11 @@ static bool gen_hlv(DisasContext *ctx, arg_hlv_b *a, MemOp memop)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    check_access(ctx);
+
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
 
-    check_access(ctx);
-
     gen_get_gpr(t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, memop);
@@ -55,10 +55,11 @@ static bool gen_hsv(DisasContext *ctx, arg_hsv_b *a, MemOp memop)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    check_access(ctx);
+
     TCGv t0 = tcg_temp_new();
     TCGv dat = tcg_temp_new();
 
-    check_access(ctx);
 
     gen_get_gpr(t0, a->rs1);
     gen_get_gpr(dat, a->rs2);
@@ -134,10 +135,11 @@ static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    check_access(ctx);
+
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
 
-    check_access(ctx);
 
     gen_get_gpr(t0, a->rs1);
 
@@ -156,10 +158,11 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    check_access(ctx);
+
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
 
-    check_access(ctx);
 
     gen_get_gpr(t0, a->rs1);
 
-- 
2.30.0


