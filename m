Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7bJs-0007jx-RE
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 04:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1i7bJq-0007ie-Tw
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 04:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1i7bJp-0002po-VT
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 04:16:10 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:50773
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1i7bJn-0002me-RH; Tue, 10 Sep 2019 04:16:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 6FB3C81391;
 Tue, 10 Sep 2019 10:16:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RP3vM3EvM-lr; Tue, 10 Sep 2019 10:16:05 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (lfbn-tou-1-447-75.w86-206.abo.wanadoo.fr [86.206.4.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id 86C788137E;
 Tue, 10 Sep 2019 10:16:04 +0200 (CEST)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Tue, 10 Sep 2019 10:15:41 +0200
Message-Id: <1568103341-28636-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: [Qemu-riscv] [PATCH v1] gdbstub: riscv: fix the fflags registers
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
X-List-Received-Date: Tue, 10 Sep 2019 08:16:12 -0000

While debugging an application with GDB the following might happen:

(gdb) return
Make xxx return now? (y or n) y
Could not fetch register "fflags"; remote failure reply 'E14'

This is because riscv_gdb_get_fpu calls riscv_csrrw_debug with a wrong csr
number (8). It should use the csr_register_map in order to reach the
riscv_cpu_get_fflags callback.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 target/riscv/gdbstub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 27be932..ded140e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -313,7 +313,8 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
+        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
+                                   0, 0);
         if (result == 0) {
             return gdb_get_regl(mem_buf, val);
         }
@@ -335,7 +336,8 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
+        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
+                                   val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
         }
-- 
1.8.3.1


