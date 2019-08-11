Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwit5-0006hg-R8
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 04:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60433)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwit2-0006XW-Sh
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwit1-00045N-QQ
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:32 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwisz-00043X-6y; Sun, 11 Aug 2019 04:07:29 -0400
Received: by mail-pg1-x544.google.com with SMTP id l21so47976376pgm.3;
 Sun, 11 Aug 2019 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=h3B8HqjoU6Brx2b5L4qBT0o6ktE68GD/Z5pDRO5N53o=;
 b=Xr70VofmXm5GMCQTzX1MRfEXBK9Xk8QerjI3+Q/S/5PNy1Ck3ExMv3B3oS7VrkNPzY
 +dSrv/rel4gLvV2LfJltZfR7VD63MRlSQtyT+GD5CMby+d1xjZ/SHbEohh3O9iMWyXdw
 YndG3QJkfPvTAwSiXpAn/9E20fzKAiknOzJq4KzoB94+RsdilzPp19qsA3w4DAJh6zk9
 ywCl/TZo6Gn83N3+2RB8OrxBpIsHuHFo8exIV5Tq9kPTY8FMIhYOhj6GperSF4V8MJ4Q
 hmjyYHhBW/jMwL4IbAwkKa9RzjYH7ORVrMWKdGce9ESVfN4H2bJvCEcnTOUlOigOU9bq
 6Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=h3B8HqjoU6Brx2b5L4qBT0o6ktE68GD/Z5pDRO5N53o=;
 b=m2rv0wY/5moAnMoUCywYUssHIJPVBVeq9tgZJqq4G3pjxIVfsNr9lw8ECNl+0i63NA
 qPxScuuKhvsNx5VvXQfpbQ/p65xAOsko9/f5bJW0tJ4nQJ1hC1eq25VzwoMwB1YyL6lY
 5LQSXJybvmnAHt03I2ZWjnDOroQvDh6KIqVKDxKSSIMjNgY9m0xOzg9AQ0UxihFAtnmM
 wPC8hpeFbtln44kuSZE3RAIKvy6hJsloa9G7w0/Npr2UFk/I94L/hlyGdUdJAOVR/OhX
 VVKwr8dA9b1BCCAuDYf1hTpEWwZ1DNtRDCNJNhj95mWz3hcaN+q4tpW9rXytgQjMBiY2
 UiuA==
X-Gm-Message-State: APjAAAU4zpOvZsmKBeQCSmaCYKMeKm51LE283CKJ5JlwRX4lRR4EVgT7
 FKKMd5rDk9z+WVG2hy9T4n0=
X-Google-Smtp-Source: APXvYqxfsqHjlTH3Csmb1cN76qv94envLOhcYZsGe32BazS/ozo1+Le8lLMjJWLMiw0kLNmo2ARfcQ==
X-Received: by 2002:a62:1515:: with SMTP id 21mr13673822pfv.81.1565510848497; 
 Sun, 11 Aug 2019 01:07:28 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.26
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:52 -0700
Message-Id: <1565510821-3927-20-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PATCH v3 19/28] riscv: sifive_u: Instantiate OTP
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
X-List-Received-Date: Sun, 11 Aug 2019 08:07:34 -0000

This adds an OTP memory with a given serial number to the sifive_u
machine. With such support, the upstream U-Boot for sifive_fu540
boots out of the box on the sifive_u machine.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 5 +++++
 include/hw/riscv/sifive_u.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5022b8f..486b247 100644
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
index e318ecb..3ae75b5 100644
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


