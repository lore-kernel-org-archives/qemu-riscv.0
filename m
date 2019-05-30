Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWLTX-0001AD-QF
	for mharc-qemu-riscv@gnu.org; Thu, 30 May 2019 09:52:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hWLTQ-000164-GH
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 09:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hWLTP-0005tx-C1
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 09:52:04 -0400
Received: from mta2.cl.cam.ac.uk ([2001:630:212:200::25:2]:38134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTP-0005sQ-60; Thu, 30 May 2019 09:52:03 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
	by mta2.cl.cam.ac.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.86_2)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTO-000Gd1-En; Thu, 30 May 2019 14:52:02 +0100
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTO-0005dr-D5; Thu, 30 May 2019 14:52:02 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Thu, 30 May 2019 14:51:34 +0100
Message-Id: <20190530135135.19715-5-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530135135.19715-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190530135135.19715-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:630:212:200::25:2
Subject: [Qemu-riscv] [PATCHv4 5/6] RISC-V: Fix a PMP bug where it succeeds
 even if PMP entry is off
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 13:52:05 -0000

The current implementation returns 1 (PMP check success) if the address is in
range even if the PMP entry is off. This is a bug.

For example, if there is a PMP check in S-Mode which is in range, but its PMP
entry is off, this will succeed, which it should not.

The patch fixes this bug by only checking the PMP permissions if the address is
in range and its corresponding PMP entry it not off. Otherwise, it will keep
the ret = -1 which will be checked and handled correctly at the end of the
function.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 89170bc11d..0a8e7a2dc4 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -259,11 +259,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         /* fully inside */
         const uint8_t a_field =
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
-        if ((s + e) == 2) {
-            if (PMP_AMATCH_OFF == a_field) {
-                return 1;
-            }

+        /*
+         * If the PMP entry is not off and the address is in range, do the priv
+         * check
+         */
+        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
             allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
             if ((mode != PRV_M) || pmp_is_locked(env, i)) {
                 allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
--
2.17.1


