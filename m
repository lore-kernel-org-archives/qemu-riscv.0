Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hol4i-0005km-RA
	for mharc-qemu-riscv@gnu.org; Sat, 20 Jul 2019 04:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frederic.konrad@adacore.com>) id 1hoihz-0006Vr-Gp
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 02:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1hoihx-0004l3-9n
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2019 02:19:03 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:34535
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1hoihs-0004iU-Ek; Sat, 20 Jul 2019 02:18:57 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 0F17B813A1;
 Sat, 20 Jul 2019 08:18:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfMi38ftFdjn; Sat, 20 Jul 2019 08:18:53 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (lfbn-tou-1-447-75.w86-206.abo.wanadoo.fr [86.206.4.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id 499B68139F;
 Sat, 20 Jul 2019 08:18:52 +0200 (CEST)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, sagark@eecs.berkeley.edu,
 Alistair.Francis@wdc.com, palmer@sifive.com, frederic.konrad@adacore.com
Date: Sat, 20 Jul 2019 08:18:32 +0200
Message-Id: <1563603512-5914-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
X-Mailman-Approved-At: Sat, 20 Jul 2019 04:50:39 -0400
Subject: [Qemu-riscv] [PATCH] riscv: htif: use qemu_log_mask instead of
 qemu_log
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
X-List-Received-Date: Sat, 20 Jul 2019 06:19:04 -0000

There are some debug trace appearing when using GDB with the HTIF mapped @0:
 Invalid htif read: address 0000000000000002
 Invalid htif read: address 0000000000000006
 Invalid htif read: address 000000000000000a
 Invalid htif read: address 000000000000000e

So don't show them unconditionally.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 hw/riscv/riscv_htif.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
index 4f7b11d..6a8f0c2 100644
--- a/hw/riscv/riscv_htif.c
+++ b/hw/riscv/riscv_htif.c
@@ -119,7 +119,8 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
     int resp = 0;
 
     HTIF_DEBUG("mtohost write: device: %d cmd: %d what: %02" PRIx64
-        " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF, payload);
+               " -payload: %016" PRIx64 "\n", device, cmd, payload & 0xFF,
+               payload);
 
     /*
      * Currently, there is a fixed mapping of devices:
@@ -137,7 +138,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
                 qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
             }
         } else {
-            qemu_log("HTIF device %d: unknown command\n", device);
+            HTIF_DEBUG("HTIF device %d: unknown command\n", device);
         }
     } else if (likely(device == 0x1)) {
         /* HTIF Console */
@@ -150,12 +151,13 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
             qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
             resp = 0x100 | (uint8_t)payload;
         } else {
-            qemu_log("HTIF device %d: unknown command\n", device);
+            HTIF_DEBUG("HTIF device %d: unknown command\n", device);
         }
     } else {
-        qemu_log("HTIF unknown device or command\n");
+        HTIF_DEBUG("HTIF unknown device or command\n");
         HTIF_DEBUG("device: %d cmd: %d what: %02" PRIx64
-            " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
+                   " payload: %016" PRIx64, device, cmd, payload & 0xFF,
+                   payload);
     }
     /*
      * - latest bbl does not set fromhost to 0 if there is a value in tohost
@@ -180,6 +182,7 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
 static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
     HTIFState *htifstate = opaque;
+
     if (addr == TOHOST_OFFSET1) {
         return htifstate->env->mtohost & 0xFFFFFFFF;
     } else if (addr == TOHOST_OFFSET2) {
@@ -189,8 +192,8 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
     } else if (addr == FROMHOST_OFFSET2) {
         return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
     } else {
-        qemu_log("Invalid htif read: address %016" PRIx64 "\n",
-            (uint64_t)addr);
+        HTIF_DEBUG("Invalid htif read: address %016" PRIx64 "\n",
+                   (uint64_t)addr);
         return 0;
     }
 }
@@ -219,8 +222,8 @@ static void htif_mm_write(void *opaque, hwaddr addr,
         htifstate->env->mfromhost |= value << 32;
         htifstate->fromhost_inprogress = 0;
     } else {
-        qemu_log("Invalid htif write: address %016" PRIx64 "\n",
-            (uint64_t)addr);
+        HTIF_DEBUG("Invalid htif write: address %016" PRIx64 "\n",
+                   (uint64_t)addr);
     }
 }
 
-- 
1.8.3.1


