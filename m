Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gouz5-0000sn-3O
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 13:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gouz0-0000qJ-Ku
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 13:53:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gouyx-0002pp-9P
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 13:53:10 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:48912
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1gouyv-0002dP-Aa; Wed, 30 Jan 2019 13:53:05 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 637618138F;
	Wed, 30 Jan 2019 19:53:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Da-BbiOoYIBc; Wed, 30 Jan 2019 19:53:01 +0100 (CET)
Received: from ledoue.act-europe.fr (unknown
	[IPv6:2a02:2ab8:224:1:d8fe:6e57:5bc4:202f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id D156681345;
	Wed, 30 Jan 2019 19:53:00 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: 
Cc: Fabien Chouteau <chouteau@adacore.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org (open list:RISC-V),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 30 Jan 2019 19:52:42 +0100
Message-Id: <20190130185242.12490-1-chouteau@adacore.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: [Qemu-riscv] [PATCH] hw/riscv/sifive_clint.c: avoid integer
 overflow in timecmp write
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
X-List-Received-Date: Wed, 30 Jan 2019 18:53:13 -0000

Writing a high value in timecmp leads to an integer overflow. This patch
modifies the code to detect such case, and use the maximum integer value
as the next trigger for the timer.

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 hw/riscv/sifive_clint.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index d4c159e937..1ca1f8c75e 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -38,8 +38,10 @@ static uint64_t cpu_riscv_read_rtc(void)
  */
 static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value)
 {
-    uint64_t next;
     uint64_t diff;
+    uint64_t lapse_ns;
+    uint64_t clock_ns;
+    int64_t  next_ns;
 
     uint64_t rtc_r = cpu_riscv_read_rtc();
 
@@ -54,10 +56,29 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value)
     /* otherwise, set up the future timer interrupt */
     riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
     diff = cpu->env.timecmp - rtc_r;
-    /* back to ns (note args switched in muldiv64) */
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, SIFIVE_CLINT_TIMEBASE_FREQ);
-    timer_mod(cpu->env.timer, next);
+
+    /*
+     * How many nanoseconds until the next trigger (note args switched in
+     * muldiv64)
+     */
+    lapse_ns = muldiv64(diff,
+                        NANOSECONDS_PER_SECOND,
+                        SIFIVE_CLINT_TIMEBASE_FREQ);
+
+    /* Current time in nanoseconds */
+    clock_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    if ((G_MAXINT64 - clock_ns) <= lapse_ns) {
+        /*
+         * clock + lapse would overflow on 64bit. The highest 64bit value is
+         * used as the next trigger time.
+         */
+        next_ns = G_MAXINT64;
+    } else {
+        next_ns = clock_ns + lapse_ns;
+    }
+
+    timer_mod(cpu->env.timer, next_ns);
 }
 
 /*
-- 
2.17.1


