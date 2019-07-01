Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhyWb-0007i5-BN
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 11:47:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49058)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hhyWZ-0007eo-6Z
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 11:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hhyWY-000632-2P
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 11:47:23 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:58068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hhyWX-0005ud-Re
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 11:47:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1561996030; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=lBCHiDL7WNGa2WRZT3RH1NkA3mkdOOmWboMA1YaH7Ak=;
 b=TEqhY4qjyNu7mVBPg8wpo9s++jOaaxSPW8LeV+ATHbu50WOQcmAQGCI1a1ZxpZPCquFnueh6
 ugWSrJuhGbxAkBC/cGpOj9eX2hMwknFBy5VCI463Np+VJus+oezkTUAF3Vqtri167Kx3IePG
 SSWMo0Dhknnc/2zgT8yvvIOU8JBUlKRNvq2MgjOqqvxJ0ecH9EGBcQTeMrQ5XCKYwurl09XU
 h4mF7NjXyWrkELwr7y2oaHEv9In66ABwxMvLbR9eNBRlTEhdZGIuI0bq5TTCgMAe7dD43x5H
 t5Yxc9uZCxkHIS5/3VxAqR3T83EXqwn/1mGYXbKHALiWvl14WtoOCw==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
 (30-9-3.wireless.csail.mit.edu [128.30.9.3])
 by mxa.mailgun.org with ESMTP id 5d1a2afc.7fb1ab6aeb70-smtp-out-n01;
 Mon, 01 Jul 2019 15:47:08 -0000 (UTC)
From: jonathan@fintelia.io
To: qemu-riscv@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Date: Mon,  1 Jul 2019 11:46:17 -0400
Message-Id: <20190701154617.22908-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH v2] target/riscv: Hardwire mcounter.TM and
 upper bits of [m|s]counteren
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
X-List-Received-Date: Mon, 01 Jul 2019 15:47:24 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

QEMU currently always triggers an illegal instruction exception when
code attempts to read the time CSR. This is valid behavor, but only if
the TM bit in mcounteren is hardwired to zero. This change also
corrects mcounteren and scounteren CSRs to be 32-bits on both 32-bit
and 64-bit targets.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/cpu.h      | 4 ++--
 target/riscv/cpu_bits.h | 5 +++++
 target/riscv/csr.c      | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

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
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 11f971ad5d..0ea1e1caf5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -532,4 +532,9 @@
 #define SIP_STIP                           MIP_STIP
 #define SIP_SEIP                           MIP_SEIP
 
+/* mcounteren CSR bits */
+#define MCOUNTEREN_CY                      0x1
+#define MCOUNTEREN_TM                      0x2
+#define MCOUNTEREN_IR                      0x4
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586760..8425a6d2bd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -473,7 +473,7 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     if (env->priv_ver < PRIV_VERSION_1_10_0) {
         return -1;
     }
-    env->mcounteren = val;
+    env->mcounteren = val & ~MCOUNTEREN_TM;
     return 0;
 }
 
-- 
2.22.0

