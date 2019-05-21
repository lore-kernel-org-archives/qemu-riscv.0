Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT2GC-0003m0-3U
	for mharc-qemu-riscv@gnu.org; Tue, 21 May 2019 06:44:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hT2GA-0003kU-30
	for qemu-riscv@nongnu.org; Tue, 21 May 2019 06:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hT2G9-0003sn-3v
	for qemu-riscv@nongnu.org; Tue, 21 May 2019 06:44:42 -0400
Received: from mta1.cl.cam.ac.uk ([2a05:b400:110::25:1]:56957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hT2G8-0003rx-Tl; Tue, 21 May 2019 06:44:41 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
	by mta1.cl.cam.ac.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hT2G8-00017N-60; Tue, 21 May 2019 10:44:40 +0000
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hT2G8-0003r7-46; Tue, 21 May 2019 11:44:40 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Tue, 21 May 2019 11:43:23 +0100
Message-Id: <20190521104324.12835-4-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a05:b400:110::25:1
Subject: [Qemu-riscv] [PATCHv3 4/5] RISC-V: Fix a PMP bug where it succeeds
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
X-List-Received-Date: Tue, 21 May 2019 10:44:43 -0000

The current implementation returns 1 (PMP check success) if the address is in
range even if the PMP entry is off. This is a bug.

For example, if there is a PMP check in S-Mode which is in range, but its PMP
entry is off, this will succeed, which it should not.

The patch fixes this bug by only checking the PMP permissions if the address is
in range and its corresponding PMP entry it not off. Otherwise, it will keep
the ret = -1 which will be checked and handled correctly at the end of the
function.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
---
 target/riscv/pmp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index b11c4ae22f..8668f0dd7c 100644
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
             if ((env->priv != PRV_M) || pmp_is_locked(env, i)) {
                 allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
--
2.17.1


