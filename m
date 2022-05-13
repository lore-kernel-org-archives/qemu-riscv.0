Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsb-0005oz-RK
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsY-0005j9-Nw; Fri, 13 May 2022 05:46:34 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsX-0004xe-2m; Fri, 13 May 2022 05:46:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 96B2D300089;
 Fri, 13 May 2022 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435190;
 bh=aZvKqxv5fJFhTtqqop7Yca1WrEI6UPKDIqbgFaOlBqc=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=OV7Efep83oZ3K31A/MEZZrT4OjommQ2K0LWt1C/hVijyTqn4r+WUvctKnndWdk7Yf
 nXy6ooWgtfmtqLux5YuN5lFGqREcKMTv33QMElUIVzSyfu/ALlHqwQhlSs0Aioh53c
 mG+vddZ2C/M45j7VwfCpTprkL9Gyy1KmuFTGzz/I=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 4/5] target/riscv: FP extension requirements
Date: Fri, 13 May 2022 18:45:49 +0900
Message-Id: <71a2459e99533ed8d548e79253100ed40da98b2d.1652435138.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435138.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:46:36 -0000

QEMU allowed inconsistent configurations that made floating point
arithmetic effectively unusable.

This commit adds certain checks for consistent FP arithmetic:

-   F requires Zicsr
-   Zfinx requires Zicsr
-   Zfh/Zfhmin require F
-   D requires F
-   V requires D

Because F/D/Zicsr are enabled by default (and an error will not occur unless
we manually disable one or more of prerequisites), this commit just enforces
the user to give consistent combinations.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0854ca9103..5371b0fd17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -610,6 +610,31 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_ifencei = true;
         }
 
+        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "F extension requires Zicsr");
+            return;
+        }
+
+        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+
+        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+            error_setg(errp, "D extension requires F extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+            error_setg(errp, "V extension requires D extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx = true;
-- 
2.34.1


