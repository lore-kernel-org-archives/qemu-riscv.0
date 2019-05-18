Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS8iB-0007Xr-Ih
	for mharc-qemu-riscv@gnu.org; Sat, 18 May 2019 19:25:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hS8i9-0007Wq-6A
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 19:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@cl.cam.ac.uk>) id 1hS8i8-0004IZ-9i
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 19:25:53 -0400
Received: from mta2.cl.cam.ac.uk ([2001:630:212:200::25:2]:53132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS8i8-0004IF-4E; Sat, 18 May 2019 19:25:52 -0400
Received: from cassia.cl.cam.ac.uk ([2001:630:212:238:b26e:bfff:fe2f:c7d9])
	by mta2.cl.cam.ac.uk with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.86_2)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS8i7-000GB2-Dh; Sun, 19 May 2019 00:25:51 +0100
Received: from hmka2 by cassia.cl.cam.ac.uk with local (Exim 4.90_1)
	(envelope-from <hmka2@cl.cam.ac.uk>)
	id 1hS8i7-00023k-CA; Sun, 19 May 2019 00:25:51 +0100
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sun, 19 May 2019 00:25:02 +0100
Message-Id: <20190518232502.5201-3-Hesham.Almatary@cl.cam.ac.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518232502.5201-1-Hesham.Almatary@cl.cam.ac.uk>
References: <20190518232502.5201-1-Hesham.Almatary@cl.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:630:212:200::25:2
Subject: [Qemu-riscv] [PATCHv3 3/3] RISC-V: Check PMP during Page Table Walks
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
X-List-Received-Date: Sat, 18 May 2019 23:25:54 -0000

The PMP should be checked when doing a page table walk, and report access
fault exception if the to-be-read PTE address failed the PMP check.

Suggested-by: Jonathan Behrens <fintelia@gmail.com>
Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c17184f4e4..ab3ba3f15a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -94,6 +94,7 @@ enum {
 #define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000

+#define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
 #define NB_MMU_MODES 4
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7c7282c680..d0b0f9cf88 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -211,6 +211,12 @@ restart:

         /* check that physical address of PTE is legal */
         target_ulong pte_addr = base + idx * ptesize;
+
+        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
+            1 << MMU_DATA_LOAD)) {
+            return TRANSLATE_PMP_FAIL;
+        }
 #if defined(TARGET_RISCV32)
         target_ulong pte = ldl_phys(cs->as, pte_addr);
 #elif defined(TARGET_RISCV64)
@@ -405,8 +411,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
+        ret = TRANSLATE_PMP_FAIL;
+    }
+    if (ret == TRANSLATE_PMP_FAIL) {
         pmp_violation = true;
-        ret = TRANSLATE_FAIL;
     }
     if (ret == TRANSLATE_SUCCESS) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
--
2.17.1


