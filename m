Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS4nC-0003Pf-Ks
	for mharc-qemu-riscv@gnu.org; Sat, 18 May 2019 15:14:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hS4nA-0003Ni-Mt
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 15:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hS4n9-0002ry-Rd
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 15:14:48 -0400
Received: from mta1.cl.cam.ac.uk ([2a05:b400:110::25:1]:36405)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS4n9-0002qc-M0; Sat, 18 May 2019 15:14:47 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
	by mta1.cl.cam.ac.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS4n8-0002ps-UT; Sat, 18 May 2019 19:14:46 +0000
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS4n8-0001uz-SJ; Sat, 18 May 2019 20:14:46 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
	Hesham Almatary <hesham.almatary@cl.cam.ac.uk>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sat, 18 May 2019 20:13:23 +0100
Message-Id: <20190518191323.4907-2-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518191323.4907-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190518191323.4907-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a05:b400:110::25:1
Subject: [Qemu-riscv] [PATCH 2/2] RISC-V: Only Check PMP if MMU translation
 succeeds
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
X-List-Received-Date: Sat, 18 May 2019 19:14:49 -0000

The current implementation unnecessarily checks for PMP even if MMU translation
failed. This may trigger a wrong PMP access exception instead of
a page exception.

For example, the very first instruction fetched after the first satp write in
S-Mode will trigger a PMP access fault instead of an instruction fetch page
fault.

This patch prioritises MMU exceptions over PMP exceptions and only checks for
PMP if MMU translation succeeds.

Signed-off-by: Hesham Almatary <hesham.almatary@cl.cam.ac.uk>
---
 target/riscv/cpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b48de36114..7c7282c680 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -403,6 +403,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   " prot %d\n", __func__, address, ret, pa, prot);

     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
         pmp_violation = true;
         ret = TRANSLATE_FAIL;
--
2.17.1


