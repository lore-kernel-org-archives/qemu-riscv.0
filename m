Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1niUi0-0001Cu-G5
	for mharc-qemu-riscv@gnu.org; Sun, 24 Apr 2022 01:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUhv-0001CD-PH; Sun, 24 Apr 2022 01:22:53 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:46828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1niUhs-0003oG-FP; Sun, 24 Apr 2022 01:22:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id CC4B730008A;
 Sun, 24 Apr 2022 05:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1650777762;
 bh=L81EOlrmkMFiFDA8/pCxQzX0aZC1+igvOm6O8239aX8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=oUNUAjUNIjG+4XHuRPgOl0+NI56rh2zNJz85HORqZtVO9OOnldBe9NF7cmeQSzDq7
 JH/xA7Shqy31F6qFGRrDykc4IIYF7ypxjvHkMzV4pIruREPDWLpHnYDB3At1kDQAy6
 wvRhAsSOy9cdXMh/rIthTFShMK1vyb6Ldj0gTsjo=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 1/2] target/riscv: Tentatively remove Zhinx* from ISA
 extension string
Date: Sun, 24 Apr 2022 14:22:35 +0900
Message-Id: <cfda1d8da254f2e723e487f0c738c59d5891e492.1650777360.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1650777360.git.research_trasio@irq.a4lg.com>
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Sun, 24 Apr 2022 05:22:54 -0000

This commit disables ISA string conversion for Zhinx and Zhinxmin
extensions for now.  Because extension category ordering of "H" is not
ratified, their ordering is likely invalid.

Once "H"-extension ordering is determined, we can add Zhinx* again.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c774056c5..c765f7ff00 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -954,8 +954,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(zdinx, ext_zdinx),
         ISA_EDATA_ENTRY(zba, ext_zba),
         ISA_EDATA_ENTRY(zbb, ext_zbb),
-- 
2.32.0


