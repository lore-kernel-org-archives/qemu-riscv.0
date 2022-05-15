Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nq4R0-0003xp-Up
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 22:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qy-0003u4-DN; Sat, 14 May 2022 22:56:40 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53434
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qw-0005JM-PE; Sat, 14 May 2022 22:56:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 8E26C300089;
 Sun, 15 May 2022 02:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652583395;
 bh=6+nGTMnGzT+4YiTY9T3eWkIA/IB43U9AdVSwTusne2A=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=o/jozdtqDoovuSM/WZHt8AV0jeNMpDriKZ2KN9TFz331dM6YrWiNF3n9VajFGTsjZ
 DEyVUdiIIUw3LXxiO41/ZdvroVoGZ4V7Mic33cwGbO7zXvLPR9zHiAzk3TkhxF0yVj
 cREuHNHDYVBMgGjKp3EuKO3N5oSM6MQsRzn66i+E=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 3/5] target/riscv: Change "G" expansion
Date: Sun, 15 May 2022 11:56:09 +0900
Message-Id: <d1b5be550a2893a0fd32c928f832d2ff7bfafe35.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652583332.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Sun, 15 May 2022 02:56:41 -0000

On ISA version 20190608 or later, "G" expands to "IMAFD_Zicsr_Zifencei".
Both "Zicsr" and "Zifencei" are enabled by default and "G" is supposed to
be (virtually) enabled as well, it should be safe to change its expansion.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3ea68d5cd7..0854ca9103 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,13 +598,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
         if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                                 cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d)) {
-            warn_report("Setting G will also set IMAFD");
+                                cpu->cfg.ext_d &&
+                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
+            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
             cpu->cfg.ext_i = true;
             cpu->cfg.ext_m = true;
             cpu->cfg.ext_a = true;
             cpu->cfg.ext_f = true;
             cpu->cfg.ext_d = true;
+            cpu->cfg.ext_icsr = true;
+            cpu->cfg.ext_ifencei = true;
         }
 
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-- 
2.34.1


