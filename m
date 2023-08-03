Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C940FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:11:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRZyr-0003rX-II; Thu, 03 Aug 2023 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <negge@xiph.org>)
 id 1qRYAI-0000ae-J1; Thu, 03 Aug 2023 09:14:54 -0400
Received: from mailfish.xiph.org ([2001:470:eb26:42:5054:ff:fe09:a40c])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <negge@xiph.org>)
 id 1qRYAG-0007Cl-GR; Thu, 03 Aug 2023 09:14:54 -0400
Received: from localhost.localdomain (c-24-126-94-29.hsd1.wv.comcast.net
 [24.126.94.29])
 by mailfish.xiph.org (Postfix) with ESMTPSA id 4E6D69F86E;
 Thu,  3 Aug 2023 13:14:46 +0000 (UTC)
From: Nathan Egge <negge@xiph.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, "Nathan Egge" <negge@xiph.org>
Subject: [PATCH] linux-user/elfload: Set V in ELF_HWCAP for RISC-V
Date: Thu,  3 Aug 2023 09:14:24 -0400
Message-Id: <20230803131424.40744-1-negge@xiph.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:470:eb26:42:5054:ff:fe09:a40c;
 envelope-from=negge@xiph.org; helo=mailfish.xiph.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 03 Aug 2023 11:11:12 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: "Nathan Egge" <negge@xiph.org>

Set V bit for hwcap if misa is set.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1793
Signed-off-by: Nathan Egge <negge@xiph.org>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 861ec07abc..a299ba7300 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1710,7 +1710,8 @@ static uint32_t get_elf_hwcap(void)
 #define MISA_BIT(EXT) (1 << (EXT - 'A'))
     RISCVCPU *cpu = RISCV_CPU(thread_cpu);
     uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
-                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
+                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
+                    | MISA_BIT('V');
 
     return cpu->env.misa_ext & mask;
 #undef MISA_BIT
-- 
2.35.1


