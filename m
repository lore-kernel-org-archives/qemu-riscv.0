Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGe1-0001S4-Td
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36861)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdy-0001GT-8G
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdw-0008E9-LP
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:58 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40794)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGds-00088p-S7; Wed, 07 Aug 2019 03:45:53 -0400
Received: by mail-pl1-x642.google.com with SMTP id a93so39421442pla.7;
 Wed, 07 Aug 2019 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=irnIasjoPryyn6PeGNluzSnHr2iiYTUs2FFgMVWmq5s=;
 b=CKeDV0BM0hnPzmC2G4IQT5a96E5acqVLco5LqgrD4xmbRfezZEMyQppx9Uj0b3fqZV
 OqnsChTxnE3HT+zDvIsib8h7KR+PRnJL5rjOfmJKgB7J9Xe8dBaF2l2nYFPnQ4LLLx7D
 zpTzeHDomjgBL45jaq6lN+KLIATDeQ10QT8gviFLfoWuKr6jlq6hi1BixvM5mh+8h+Pz
 mnZmFDitxxN3DAzowF1HjuTKptX571BMsSl0BY/8Lhwv88p6cXiZcPAfj51xcA22+RYo
 WAFOyfsiflz7NFQlmCiI2KaTYsZ+smxgVK/AJpCifzc5qTJkSbgQb5S//1d2bAoUCmEY
 1JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=irnIasjoPryyn6PeGNluzSnHr2iiYTUs2FFgMVWmq5s=;
 b=Vu6bi1+r1Ao/9sUDD9OrnGqVI5upvn5PHLoQ150PWY0P545CkhjyV1kd3Ky9enJrKv
 k0uvegC0Xus6t3nN3/+is+HEfMjVFSkrTg2vvszUVwQB4bEtLIWaXpk2q4CtSl8FDbKD
 D92bUzOaDpV9nUuEjsZvGVcwp1oO92aH82wPOIfJfM2BRjLkFiFxdEdscEQoLsHRO0Gi
 j587v9FIMnnkz1Fmp9Wb+GEPicrTA0Nqj2S01ov+jVv5K3PgKNMX9b2vhB+UOCCeCRBH
 1/uqfDA8NoqgDYWfooaFeA28hCqg4NGwOSHz2LjyTY5VlwHQ5Ofvtm42f/oDEMYa0YoU
 5yuA==
X-Gm-Message-State: APjAAAXhKvgtE7XH+G8yJAm1zlkWFNtenXND/VCos4nWa8QR/d/jIAgD
 rqbzHvp1d4JFkS3OlkiiCYs=
X-Google-Smtp-Source: APXvYqztIJcN+D79X0pPGqjRS+hYzRRiNh9s11NMB0L9Pma6DCrQZ/u4zzcky3xVdGax3n7JPrTe1g==
X-Received: by 2002:a17:902:2987:: with SMTP id
 h7mr6874236plb.37.1565163951985; 
 Wed, 07 Aug 2019 00:45:51 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:15 -0700
Message-Id: <1565163924-18621-20-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH v2 19/28] riscv: sifive_u: Instantiate OTP
 memory with a serial number
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
X-List-Received-Date: Wed, 07 Aug 2019 07:46:00 -0000

This adds an OTP memory with a given serial number to the sifive_u
machine. With such support, the upstream U-Boot for sifive_fu540
boots out of the box on the sifive_u machine.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v2: None

 hw/riscv/sifive_u.c         | 5 +++++
 include/hw/riscv/sifive_u.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bddf892..7b4a684 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,6 +10,7 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  * 3) PRCI (Power, Reset, Clock, Interrupt)
+ * 4) OTP (One-Time Programmable) memory with stored serial number
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -43,6 +44,7 @@
 #include "hw/riscv/sifive_clint.h"
 #include "hw/riscv/sifive_uart.h"
 #include "hw/riscv/sifive_u.h"
+#include "hw/riscv/sifive_u_otp.h"
 #include "hw/riscv/sifive_u_prci.h"
 #include "hw/riscv/boot.h"
 #include "chardev/char.h"
@@ -65,10 +67,12 @@ static const struct MemmapEntry {
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
 
+#define SIFIVE_OTP_SERIAL   1
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
@@ -441,6 +445,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
     sifive_u_prci_create(memmap[SIFIVE_U_PRCI].base);
+    sifive_u_otp_create(memmap[SIFIVE_U_OTP].base, SIFIVE_OTP_SERIAL);
 
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 19d5a6f..2f475c5 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -54,6 +54,7 @@ enum {
     SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
+    SIFIVE_U_OTP,
     SIFIVE_U_DRAM,
     SIFIVE_U_GEM
 };
-- 
2.7.4


