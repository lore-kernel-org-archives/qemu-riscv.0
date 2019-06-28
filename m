Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgxE7-0005vz-86
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 16:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgxE3-0005tz-ET
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 16:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgxE1-00012E-6a
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 16:12:03 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:28037)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgxE1-00010A-1Y
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 16:12:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1561752718; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=rK9dVQoGRf7gzhJQ62FeEPYEuGqaPsFuSSy+cUnHJAI=;
 b=gZ2Und5WnREAXSydkjIhE0XtIerlfqdGvpmZ+GcbgtEmuUBeIQC9FKhdkDab6kI9cHmXo/EE
 ZZVYMP0AX4WvG2QoExoSXNtgjOceK2r+bCDi2Rmvo03/paShH1bIRazvT6sZKxWXEbIONZWM
 kbtRwkteoyjcxboMvCicnUIFyVP3bfB3/Bl8xSbi4YzeEu/ttsVvO72paeWAZ8TDfUCsbrGX
 hImX0TlZMSQ/mVTD6j6TohPULkmsjDkNtRhbLXZkTV+M7WYx19Sttx71jcGx+8Hju4dIlX+J
 Ro0BOZXlxYcY+tTSlvavs4vaZSNlIKzBIS0jzYcNMjH00GQvROrAkQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
 (30-9-3.wireless.csail.mit.edu [128.30.9.3])
 by mxa.mailgun.org with ESMTP id 5d16748d.7f301001b800-smtp-out-n02;
 Fri, 28 Jun 2019 20:11:57 -0000 (UTC)
From: jonathan@fintelia.io
To: qemu-riscv@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Date: Fri, 28 Jun 2019 16:11:33 -0400
Message-Id: <20190628201133.14235-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH] target/riscv: Hardwire mcounter.TM and upper
 bits of [m|s]counteren
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
X-List-Received-Date: Fri, 28 Jun 2019 20:12:05 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

QEMU currently always triggers an illegal instruction exception when code
attempts to read the time CSR. This is valid behavor, but only if the TM bit in
mcounteren is hardwired to zero. This change also corrects mcounteren and scounteren CSRs to be 32-bits on both
32-bit and 64-bit targets.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/cpu.h | 4 ++--
 target/riscv/csr.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f32..2d0cbe9c78 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -151,8 +151,8 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
-    target_ulong scounteren;
-    target_ulong mcounteren;
+    uint32_t scounteren;
+    uint32_t mcounteren;
 
     target_ulong sscratch;
     target_ulong mscratch;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586760..89cf9734c3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -473,7 +473,8 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     if (env->priv_ver < PRIV_VERSION_1_10_0) {
         return -1;
     }
-    env->mcounteren = val;
+    /* mcounteren.TM is hardwired to zero, all other bits are writable */
+    env->mcounteren = val & ~(1 << (CSR_TIME & 31));
     return 0;
 }
 
-- 
2.22.0

