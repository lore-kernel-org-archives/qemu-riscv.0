Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTcE-0008EN-IQ
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 23:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTcC-00086z-FG; Wed, 04 Aug 2021 23:00:12 -0400
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTcA-0000sL-KS; Wed, 04 Aug 2021 23:00:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07822467|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00526741-8.74947e-05-0.994645;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYMzRs_1628132404; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYMzRs_1628132404)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 05 Aug 2021 11:00:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 10/13] target/riscv: Support UXL32 for float instructions
Date: Thu,  5 Aug 2021 10:53:09 +0800
Message-Id: <20210805025312.15720-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Aug 2021 03:00:13 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 4 ++--
 target/riscv/insn_trans/trans_rvf.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 9bb15fdc12..fb033ccd97 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -23,7 +23,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv addr = gpr_src_u(ctx, a->rs1);
     TCGv temp = NULL;
 
     if (a->imm) {
@@ -46,7 +46,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv addr = gpr_src_u(ctx, a->rs1);
     TCGv temp = NULL;
 
     if (a->imm) {
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index ff8e942199..4576072124 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -28,7 +28,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv addr = gpr_src_u(ctx, a->rs1);
     TCGv temp = NULL;
 
     if (a->imm) {
@@ -53,7 +53,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv addr = gpr_src_u(ctx, a->rs1);
     TCGv temp = NULL;
 
     if (a->imm) {
-- 
2.17.1


