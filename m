Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsN-0005A8-9T
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsL-00055G-Cb; Fri, 13 May 2022 05:46:21 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsJ-0004oC-Nd; Fri, 13 May 2022 05:46:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 0F18130008A;
 Fri, 13 May 2022 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435174;
 bh=xe4ykRzpIkj6zsl5EFwXnj15ONcm5Zf0n3PT53Jqnso=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=nlWVnwP73/NeYR9JZBboA4NtSd9Lws7nPRNM16mhgFGkYEbtuRq8v8WTj4HWSck4P
 txrzbtTsrKqDS5sSAPD3bFfejD9CxZG6pk7HqdsSd9eATdWAyJ4QnhgLcMegZv5lCZ
 xRS1xTRCuA1lIew+R0O3rv+YYFVIthnE4AvyGqoM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 1/5] target/riscv: Fix "G" extension expansion typing
Date: Fri, 13 May 2022 18:45:46 +0900
Message-Id: <07e4f9011587dc8023b616477ecdf02282fe6232.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:46:21 -0000

Because ext_? members are in bool type, operator `&&' should be used
instead of `&'.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..00bf26ec8b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -596,8 +596,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
                                 cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i = true;
-- 
2.34.1


