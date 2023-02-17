Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT3Km-0003ic-53
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 11:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pT3Kl-0003iD-1V; Fri, 17 Feb 2023 11:11:39 -0500
Received: from forward101j.mail.yandex.net ([2a02:6b8:0:801:2::101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pT3Kj-0004bp-17; Fri, 17 Feb 2023 11:11:38 -0500
Received: from myt6-870ea81e6a0f.qloud-c.yandex.net
 (myt6-870ea81e6a0f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2229:0:640:870e:a81e])
 by forward101j.mail.yandex.net (Yandex) with ESMTP id E086369B6852;
 Fri, 17 Feb 2023 19:10:33 +0300 (MSK)
Received: by myt6-870ea81e6a0f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id WApOEJ4ZYeA1-BFQiZbYm; Fri, 17 Feb 2023 19:10:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1676650233; bh=qibHtBAjn1wySo/090s3+lphFFNyPzNlHf4KIoMmokc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=XMs/8DP6XAkGQJKwrCFeVBWJHBpyPN8MKPfjQPmw+98a6rnZjbqiPWT20627/7zhb
 OLLewbbsVlVEhavgc7dLaz5/aQj/wU6NIgv3JP3k896wnsPbVu4axjX2NbLZT+VUrY
 fgDlM6Zd6sA7skjPcgWnJkVns2Zk7/NP3Frw0iBU=
Authentication-Results: myt6-870ea81e6a0f.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Date: Fri, 17 Feb 2023 19:10:27 +0300
Message-Id: <20230217161027.56859-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::101;
 envelope-from=ivan.klokov@syntacore.com; helo=forward101j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Feb 2023 16:11:39 -0000

Due to typo in opcode list, ctzw is disassembled as clzw instruction.

Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
v2:
   - added fixes line
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..54455aaaa8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
     { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-- 
2.34.1


