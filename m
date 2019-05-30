Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWLTY-0001BB-Hi
	for mharc-qemu-riscv@gnu.org; Thu, 30 May 2019 09:52:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hWLTQ-00016c-Vz
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 09:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hWLTQ-0005uq-2x
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 09:52:04 -0400
Received: from mta2.cl.cam.ac.uk ([2001:630:212:200::25:2]:36650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTP-0005tr-TE; Thu, 30 May 2019 09:52:04 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
	by mta2.cl.cam.ac.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.86_2)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTP-000Gd7-5n; Thu, 30 May 2019 14:52:03 +0100
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hWLTP-0005fw-43; Thu, 30 May 2019 14:52:03 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Thu, 30 May 2019 14:51:35 +0100
Message-Id: <20190530135135.19715-6-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530135135.19715-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190530135135.19715-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:630:212:200::25:2
Subject: [Qemu-riscv] [PATCHv4 6/6] RISC-V: Fix a PMP check with the correct
 access size
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
X-List-Received-Date: Thu, 30 May 2019 13:52:06 -0000

The PMP check should be of the memory access size rather
than TARGET_PAGE_SIZE.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 00bc4f1712..64c12d83dc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -417,8 +417,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,

     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
-        mode)) {
+        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
         ret = TRANSLATE_PMP_FAIL;
     }
     if (ret == TRANSLATE_PMP_FAIL) {
--
2.17.1


