Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx5cZ-00030u-4l
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 07:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5c6-0002uO-95; Fri, 03 Jun 2022 07:37:15 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:64935
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5bv-0002P4-Jm; Fri, 03 Jun 2022 07:37:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 3D87D30008A;
 Fri,  3 Jun 2022 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1654256213;
 bh=O7IK/iMnBtS6hHzaRt9uvfbcYxRQwdSzDq9ixuFOjVA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=GuV/5EnVxLcXTurvGqp69wk6wShMGqyXhBZJngwDuU1LY+MJroMTgclNZq+9BbfvE
 /dlt/oYBs8AnW2/MYCtwE0saIikX8qkOKizz4vTc5BG00/LSq5dWgfJ9Q9TGsI764i
 WpG0lNN/fVlB3QaG9UCQ2b3yin7qyDJOFeU7gxIU=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 1/3] target/riscv: Reorganize riscv_cpu_properties
Date: Fri,  3 Jun 2022 20:36:42 +0900
Message-Id: <942cea1d0a0ec0ba2ba54df4c04693dfac75c331.1654256190.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1654256190.git.research_trasio@irq.a4lg.com>
References: <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <cover.1654256190.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Jun 2022 11:37:20 -0000

Because many developers introduced new properties in various ways, the
entire riscv_cpu_properties block is getting too complex.

This commit reorganizes riscv_cpu_properties for clarity on future.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 64 +++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..3f21563f2d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -840,7 +840,7 @@ static void riscv_cpu_init(Object *obj)
 }
 
 static Property riscv_cpu_properties[] = {
-    /* Defaults for standard extensions */
+    /* Base ISA and single-letter standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
@@ -853,29 +853,17 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
-    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+
+    /* Standard unprivileged extensions */
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
-    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
-    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
-    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
-
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-
-    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
-
-    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
-    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
-    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
+    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
+    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
+    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
+    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
@@ -884,6 +872,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
     DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+
     DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
     DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
     DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
@@ -895,10 +884,31 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
     DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
 
-    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
-    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
-    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
-    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
+    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
+
+    /* Standard supervisor-level extensions */
+    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
+    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
+
+    /* Base features */
+    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
+    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+
+    /* ISA specification / extension versions */
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+
+    /* CPU parameters */
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
+    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
+    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
@@ -909,9 +919,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
-    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
-
+    /* Other options */
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


