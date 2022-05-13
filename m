Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsV-0005ZP-3h
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsT-0005TD-4i; Fri, 13 May 2022 05:46:29 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsR-0004vG-D2; Fri, 13 May 2022 05:46:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 15E42300089;
 Fri, 13 May 2022 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435185;
 bh=6+nGTMnGzT+4YiTY9T3eWkIA/IB43U9AdVSwTusne2A=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=nYi0OjaByi7wtSvDKQqgDcYltJmWSxc/UuwnVsMzpreHgk2sDblKAsTz260t1QOVv
 diWBq1Yfj7Woi88f2ZubVqwZp1ru/VMXFZmttzikxmYMRD4//F7ieLxmGqzfBwx1IM
 60CEeGpzU4C8Opc8Z+N8AkYL49dlt84g+oBrPuS0=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 3/5] target/riscv: Change "G" expansion
Date: Fri, 13 May 2022 18:45:48 +0900
Message-Id: <713ec37ff6f4ff11f6056c8d648d4a19a2f34905.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:46:29 -0000

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


