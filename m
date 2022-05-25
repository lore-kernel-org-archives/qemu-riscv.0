Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntnjb-0006CO-Dw
	for mharc-qemu-riscv@gnu.org; Wed, 25 May 2022 05:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntnjO-00066D-Uc; Wed, 25 May 2022 05:55:08 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:49140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntnjL-0002a3-QS; Wed, 25 May 2022 05:55:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 0A10D30008A;
 Wed, 25 May 2022 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1653472497;
 bh=y89vULyNDIXF4RCmRq+PRuNQFTocF8ySC9qlSU5Or8E=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=sAFAoMWrUw8g7Vs1eSoLt9O5bNsxnYiKOySI5WotvkTtOfJ39L/B99wvXCxC16z6t
 x8WQwgHGnthQw5eD/SCCiPVs5QJllG9icFfzFBbwE3NjYkkrK6SGFLU4oTKIuv5xON
 Xvak2oEteWMJV0HfwtvJnbwz5Sqazhrne46B1Hco=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 1/3] target/riscv: Reorganize riscv_cpu_properties
Date: Wed, 25 May 2022 18:54:41 +0900
Message-Id: <3cc626d3c36935d7ad5b4573c6779f6ec88957ea.1653472385.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1653472385.git.research_trasio@irq.a4lg.com>
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <cover.1653472385.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
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
X-List-Received-Date: Wed, 25 May 2022 09:55:09 -0000

This commit reorganizes riscv_cpu_properties for clarity.

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


