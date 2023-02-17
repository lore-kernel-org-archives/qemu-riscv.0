Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT365-0006C3-PF
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 10:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pT2SG-0003sG-RG; Fri, 17 Feb 2023 10:15:21 -0500
Received: from forward108j.mail.yandex.net ([2a02:6b8:0:801:2::253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pT2SC-0000h8-Ll; Fri, 17 Feb 2023 10:15:18 -0500
Received: from myt6-459ab7c4bc67.qloud-c.yandex.net
 (myt6-459ab7c4bc67.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:201c:0:640:459a:b7c4])
 by forward108j.mail.yandex.net (Yandex) with ESMTP id 0FE833F21120;
 Fri, 17 Feb 2023 18:15:10 +0300 (MSK)
Received: by myt6-459ab7c4bc67.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 8FoRnw3ZU0U1-vAye99f3; Fri, 17 Feb 2023 18:15:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1676646909; bh=N4Nsk0K+6dHGhZMPwBYaNGZAIjVJ/6byBkJpG6rSWds=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=oQaMuxZw6wcSQD/V/sAETXE8WqWutamfUf1xZNFc/4zH1cls7veG76w1/c1WhAz2Q
 ObnKrgB694cUBLQ0eAz3dFzuf6xZRPLeoPlYuARlA//ig7vdj4N/kDbyFwMP/NV18c
 sVG6cF3wvpNa44u6fJAb2S23HXjyXTiSkbrdIT1o=
Authentication-Results: myt6-459ab7c4bc67.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Date: Fri, 17 Feb 2023 18:14:59 +0300
Message-Id: <20230217151459.54649-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::253;
 envelope-from=ivan.klokov@syntacore.com; helo=forward108j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Feb 2023 10:56:28 -0500
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
X-List-Received-Date: Fri, 17 Feb 2023 15:15:22 -0000

Due to typo in opcode list, ctzw is disassembled as clzw instruction.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..d0639cd047 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1644,7 +1644,7 @@ const rv_opcode_data opcode_data[] = {
     { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
-- 
2.34.1


