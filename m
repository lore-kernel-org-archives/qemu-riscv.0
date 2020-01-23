Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuiXt-0002go-AP
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jan 2020 14:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iuiXo-0002U1-Hk
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 14:53:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iuiXn-0000pm-HC
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 14:53:36 -0500
Received: from rs224.mailgun.us ([209.61.151.224]:31785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iuiXn-0000l8-Bk
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 14:53:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1579809209; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=8t+fDncYfgnFj/SFRiDptoWecMF8tAS/UKt2nRHgxxQ=;
 b=XPCxl8DOP04VubHDUT+Pl5xqKqfVdI02jiyZev/xNzdrEZF189YdyjpHGaX6e158PE+0D0i0
 BOT5vJ4rtXT+b5Of6/b5GMT2xXketMQWMCoI8BBS8KZoRMjUiJdTb4eA/9qjBRyANwbvlQTd
 G6OerZZlXjULEdqTFeQlip83yH3lOPJEu9lWKqkspvP5HIsGo+fS93PW/i16EEZsuAG/QPkn
 TNTxBNynI0ZeBr1GyouPvuQP/uz48IhMCrLSejaBjvayM1gt1iRLiAf9K4olWqKPHNKgBobY
 zQBeVaKHyJlm7zZ+oxyeMmkU+fzh40OtA3/P+f6I2lROHQ1RsVd3pw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5e29f9b7.7fca702fc818-smtp-out-n03;
 Thu, 23 Jan 2020 19:53:27 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: 
Cc: Jonathan Behrens <jonathan@fintelia.io>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] target/riscv: Disallow WFI instruction from U-mode
Date: Thu, 23 Jan 2020 14:52:00 -0500
Message-Id: <20200123195200.206355-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 19:53:39 -0000

From the RISC-V Priviliged Specification:

"When S-mode is implemented, then executing WFI in U-mode causes an illegal
instruction exception, unless it completes within an implementation-specific,
bounded time limit. A future revision of this specification might add a feature
that allows S-mode to selectively permit WFI in U-mode."

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 331cc36232..2e5a980192 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -129,10 +129,10 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-
-    if (env->priv == PRV_S &&
-        env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TW)) {
+    if (!(env->priv >= PRV_S) ||
+        (env->priv == PRV_S &&
+         env->priv_ver >= PRIV_VERSION_1_10_0 &&
+         get_field(env->mstatus, MSTATUS_TW))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.25.0

