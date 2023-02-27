Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZS4-00062m-BP
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pWZRX-0005bq-3F; Mon, 27 Feb 2023 04:05:13 -0500
Received: from forward105j.mail.yandex.net ([2a02:6b8:0:801:2::108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pWZRP-0001pa-7V; Mon, 27 Feb 2023 04:05:08 -0500
Received: from myt5-fc73f9af8654.qloud-c.yandex.net
 (myt5-fc73f9af8654.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2898:0:640:fc73:f9af])
 by forward105j.mail.yandex.net (Yandex) with ESMTP id 6C6214EC91CA;
 Mon, 27 Feb 2023 12:02:31 +0300 (MSK)
Received: by myt5-fc73f9af8654.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id T2PcS10bGqM1-6YiTMaAk; Mon, 27 Feb 2023 12:02:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1677488550; bh=xFuPm4ylRWmpsXvYlS82iEPRaLHSipoR5XS4X1MgI1Y=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=Y45CJ8Fj3S4xwNKglAdGVHZZ6Dx07TXvzQuK66ru7S1hbV4HjXK0/VEpWWh9kkP7i
 SQpIpCzo0ejyGwZq2U/MBmUVSGfYADly3xgFi66zxjP8KhE3fD68wLh5+coB6c1tD1
 BnLv0Mq0ITTAF9xlh8UmO/hzSZwkPAfBMWm8jz1I=
Authentication-Results: myt5-fc73f9af8654.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 philipp.tomsich@vrull.eu, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH] Fix slli_uw decoding
Date: Mon, 27 Feb 2023 12:02:28 +0300
Message-Id: <20230227090228.17117-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::108;
 envelope-from=ivan.klokov@syntacore.com; helo=forward105j.mail.yandex.net
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
X-List-Received-Date: Mon, 27 Feb 2023 09:05:16 -0000

The decoding of the slli_uw currently contains decoding
error: shamt part of opcode has six bits, not five.

Fixes 3de1fb71("target/riscv: update disas.c for xnor/orn/andn and slli.uw")

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 disas/riscv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..03cfefb0d3 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] = {
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_i_sh6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
@@ -2617,10 +2617,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             switch (((inst >> 12) & 0b111)) {
             case 0: op = rv_op_addiw; break;
             case 1:
-                switch (((inst >> 25) & 0b1111111)) {
+                switch (((inst >> 26) & 0b111111)) {
                 case 0: op = rv_op_slliw; break;
-                case 4: op = rv_op_slli_uw; break;
-                case 48:
+                case 2: op = rv_op_slli_uw; break;
+                case 24:
                     switch ((inst >> 20) & 0b11111) {
                     case 0b00000: op = rv_op_clzw; break;
                     case 0b00001: op = rv_op_ctzw; break;
-- 
2.34.1


