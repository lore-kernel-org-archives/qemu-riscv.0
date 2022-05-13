Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsP-0005HZ-NJ
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsN-0005B5-G9; Fri, 13 May 2022 05:46:23 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53433
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsL-0004qs-RF; Fri, 13 May 2022 05:46:23 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 8C4A0300089;
 Fri, 13 May 2022 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435179;
 bh=iBuz9s2lVnC1Qr79+mx564AyUY+YXnNGXVW4c6ve6F8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=TzL+pxpzVXggVOAjJbcidqs18dMJrxWz+beeK+Hia8eJVsm2dAyGC8GKuApNwgZCm
 ezDYlgnWpKixXWe8+IR8MJl6WDUmI++PicRplNx9HF+9qKNa5VwQmO9LzdG/z1rJu0
 vlMq6AngQYFDyC0QwzYe2NSnOIUAQcfJPmxWlphw=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 2/5] target/riscv: Disable "G" by default
Date: Fri, 13 May 2022 18:45:47 +0900
Message-Id: <def2b95c85943a5a2fa7406dcafbb82fe78bceb4.1652435138.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435138.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 13 May 2022 09:46:24 -0000

Because "G" virtual extension expands to "IMAFD", we cannot separately
disable extensions like "F" or "D" without disabling "G".  Because all
"IMAFD" are enabled by default, it's harmless to disable "G" by default.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 00bf26ec8b..3ea68d5cd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
+    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-- 
2.34.1


