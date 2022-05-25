Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntsH5-0003xJ-HK
	for mharc-qemu-riscv@gnu.org; Wed, 25 May 2022 10:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntsGu-00033c-Nv; Wed, 25 May 2022 10:46:01 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nts4U-0003xL-BH; Wed, 25 May 2022 10:33:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 83873300089;
 Wed, 25 May 2022 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1653489181;
 bh=8Nn5Zhw/1XD5Dvkf9GOpgoxDYIXc9JhR0kUP1ltqkBE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=dVCNWf6CDhfazZThPYJ/KdnLvmC2h0EYcuG57+XShZscqL32vRhSGO4gKMoWixsJ+
 QPk+zfT1MW9CSxIVrbYN2X03Bqn1D3XNKd9RYFVYEBidchxE2warAIG1ZmX1BRLXtZ
 0SvFz0m/FnAsFHG2ZfDnzIZ9Xl3UYIZhPdhhlssM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2.1 2/3] target/riscv: Make CPU property names lowercase
Date: Wed, 25 May 2022 23:32:50 +0900
Message-Id: <e20ce7622bb46023cd3b8c003df4f75f68a83f1a.1653489014.git.research_trasio@irq.a4lg.com>
In-Reply-To: <dd7579a2a8b81632827d42a137c7f7720cc7ab5f.1653472385.git.research_trasio@irq.a4lg.com>
References: <dd7579a2a8b81632827d42a137c7f7720cc7ab5f.1653472385.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Wed, 25 May 2022 14:46:02 -0000

Many CPU properties for RISC-V are in lowercase except those with
"capitalized" (or CamelCase) names:

-   Counters
-   Zifencei
-   Zicsr
-   Zfh
-   Zfhmin
-   Zve32f
-   Zve64f

This commit makes lowercase names primary but keeps capitalized names
as aliases (for backward compatibility, but with deprecated status).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3f21563f2d..83262586e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -840,6 +840,10 @@ static void riscv_cpu_init(Object *obj)
 }
 
 static Property riscv_cpu_properties[] = {
+    /*
+     * Names for ISA extensions and features should be in lowercase.
+     */
+
     /* Base ISA and single-letter standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
@@ -855,11 +859,11 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
 
     /* Standard unprivileged extensions */
-    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("zifencei", RISCVCPU, cfg.ext_ifencei, true),
 
-    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
-    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
     DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
@@ -884,8 +888,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
     DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
 
-    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
-    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
+    DEFINE_PROP_BOOL("zve32f", RISCVCPU, cfg.ext_zve32f, false),
+    DEFINE_PROP_BOOL("zve64f", RISCVCPU, cfg.ext_zve64f, false),
 
     /* Standard supervisor-level extensions */
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
@@ -893,7 +897,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
     /* Base features */
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
@@ -922,6 +926,15 @@ static Property riscv_cpu_properties[] = {
     /* Other options */
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
 
+    /* Capitalized aliases (deprecated and will be removed) */
+    DEFINE_PROP("Counters", RISCVCPU, cfg.ext_counters, qdev_prop_bool, bool),
+    DEFINE_PROP("Zifencei", RISCVCPU, cfg.ext_ifencei, qdev_prop_bool, bool),
+    DEFINE_PROP("Zicsr", RISCVCPU, cfg.ext_icsr, qdev_prop_bool, bool),
+    DEFINE_PROP("Zfh", RISCVCPU, cfg.ext_zfh, qdev_prop_bool, bool),
+    DEFINE_PROP("Zfhmin", RISCVCPU, cfg.ext_zfhmin, qdev_prop_bool, bool),
+    DEFINE_PROP("Zve32f", RISCVCPU, cfg.ext_zve32f, qdev_prop_bool, bool),
+    DEFINE_PROP("Zve64f", RISCVCPU, cfg.ext_zve64f, qdev_prop_bool, bool),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


