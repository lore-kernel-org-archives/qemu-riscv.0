Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgTMw-0002lw-9m
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 08:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46565)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hmka2@cl.cam.ac.uk>) id 1hgTMq-0002hd-E3
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 08:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hmka2@cl.cam.ac.uk>) id 1hgTMn-0000Bu-Sq
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 08:19:07 -0400
Received: from mta2.cl.cam.ac.uk ([2001:630:212:200::25:2]:42526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMk-0008WG-L8; Thu, 27 Jun 2019 08:19:04 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
 by mta2.cl.cam.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMW-000Sdn-QK; Thu, 27 Jun 2019 13:18:48 +0100
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
 (envelope-from <hmka2@cl.cam.ac.uk>)
 id 1hgTMW-0002LV-Ob; Thu, 27 Jun 2019 13:18:48 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Thu, 27 Jun 2019 13:18:23 +0100
Message-Id: <20190627121828.8376-1-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:630:212:200::25:2
Subject: [Qemu-riscv] [PATCHv4 1/6] RISC-V: Only Check PMP if MMU
 translation succeeds
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
X-List-Received-Date: Thu, 27 Jun 2019 12:19:10 -0000

The current implementation unnecessarily checks for PMP even if MMU translation
failed. This may trigger a wrong PMP access exception instead of
a page exception.

For example, the very first instruction fetched after the first satp write in
S-Mode will trigger a PMP access fault instead of an instruction fetch page
fault.

This patch prioritises MMU exceptions over PMP exceptions and only checks for
PMP if MMU translation succeeds. This patch is required for future commits
that properly report PMP exception violations if PTW succeeds.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 41d6db41c3..40fb47e794 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -401,6 +401,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   " prot %d\n", __func__, address, ret, pa, prot);

     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
         ret = TRANSLATE_FAIL;
     }
--
2.17.1


