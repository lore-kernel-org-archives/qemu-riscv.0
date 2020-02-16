Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3KOW-0001WQ-4Z
	for mharc-qemu-riscv@gnu.org; Sun, 16 Feb 2020 08:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j3KOQ-0001U1-9l
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2020 08:55:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j3KOP-0002Ww-0T
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2020 08:55:30 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j3KOL-0002Vo-Vz; Sun, 16 Feb 2020 08:55:26 -0500
Received: by mail-pg1-x542.google.com with SMTP id d6so7637168pgn.5;
 Sun, 16 Feb 2020 05:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=dydTX9aUaHAip/X7Tlcckw9kVs7eCkTzSokwR7lcaPM=;
 b=m5HjoZeaHhk+Eryt2STSjsIGg1TxPmrUhCtz5meJypX8iIoWbmktOn05n3sbIlTh00
 WrpUY6cnnam8GbkRv4ckX6crCKNWoKC28q1BWwW29W2yP1C9JBM5+n/hROhYBHI4vaeN
 AK+S/7pwm4ey82ZcDgJXptuAnfyU8ex33+0SC5lRWlhWu2JrDqm48zcO6A+bemBcPveA
 9Q4XjLCel8ssnwDqTOerEwHQcIPfxy6h8z9s9zQLUoUQ4iRKNS1w2uN51NTU10GreJgL
 HS155vpqiQnC0yhY3eW1+VYazlne2RyNVUKTUx1NVZvxUIshNOu5xDnlHrC5LzIyUOmi
 HwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=dydTX9aUaHAip/X7Tlcckw9kVs7eCkTzSokwR7lcaPM=;
 b=ZJRLYWGN8QxiNnDjKbpE8Cnj/IkQlnr5Ppim07j7MfKYzuJgXnhDW9leZQoIyTmeBw
 czLgwDTUinmpFAfDOEKDq9U0oBRK5AoEyyQHQScJtPH7ZwxOGWGjZBnpmEi2I8uPGRy3
 RK/FQkoJjpHXTgm2V+WCne89snJxnTZdhZgSS8BOHj8b74I3CIrSJLdmGwkwdQAg/ElZ
 8Seoa9t/ogMGGQ3NHl2kHlNwR544L9vBZ0S4bcUVtjRbPv4zDotf+EnJtrMOCg2iycd1
 08HBPA6OLycFHMiQI0W7S6k8aULZ9KEHtcUeTquSFDc/VWcGjLYqv1Ag/JHCKvSZ1hyc
 +ggg==
X-Gm-Message-State: APjAAAU8ARWdmINZqi8F3kz9+wn09hemY3WsDXbSb8800CSKcauADEC8
 aoPUIVQs3LNF/fhqRXk57aA=
X-Google-Smtp-Source: APXvYqzUYoVAlMFBS1YXAfuCiIkCZ5PsE7YB0Oy3VHzCp6xJH18vwE8aoc+sORRkWdpt+oeSOl9ONA==
X-Received: by 2002:a63:1e06:: with SMTP id e6mr13439697pge.134.1581861324179; 
 Sun, 16 Feb 2020 05:55:24 -0800 (PST)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id x65sm13899205pfb.171.2020.02.16.05.55.23
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 16 Feb 2020 05:55:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2] riscv: sifive_u: Add a "serial" property for board serial
 number
Date: Sun, 16 Feb 2020 05:55:17 -0800
Message-Id: <1581861317-30977-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Sun, 16 Feb 2020 13:55:31 -0000

At present the board serial number is hard-coded to 1, and passed
to OTP model during initialization. Firmware (FSBL, U-Boot) uses
the serial number to generate a unique MAC address for the on-chip
ethernet controller. When multiple QEMU 'sifive_u' instances are
created and connected to the same subnet, they all have the same
MAC address hence it creates a unusable network.

A new "serial" property is introduced to specify the board serial
number. When not given, the default serial number 1 is used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- Move setting OTP serial number property from riscv_sifive_u_soc_init()
  to riscv_sifive_u_soc_realize(), to fix the 'check-qtest-riscv' error.
  I am not really sure why doing so could fix the 'make check' error.
  The v1 patch worked fine and nothing seems wrong.

 hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
 include/hw/riscv/sifive_u.h |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0e12b3c..ca561d3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -34,6 +34,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
@@ -434,7 +435,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
                           TYPE_SIFIVE_U_OTP);
-    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -453,6 +453,18 @@ static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
     s->start_in_flash = value;
 }
 
+static void sifive_u_get_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void sifive_u_set_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
 static void riscv_sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s = RISCV_U_MACHINE(obj);
@@ -464,11 +476,17 @@ static void riscv_sifive_u_machine_instance_init(Object *obj)
                                     "Set on to tell QEMU's ROM to jump to " \
                                     "flash. Otherwise QEMU will jump to DRAM",
                                     NULL);
+
+    s->serial = OTP_SERIAL;
+    object_property_add(obj, "serial", "uint32", sifive_u_get_serial,
+                        sifive_u_set_serial, NULL, &s->serial, NULL);
+    object_property_set_description(obj, "serial", "Board serial number", NULL);
 }
 
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    SiFiveUState *us = RISCV_U_MACHINE(ms);
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
     const struct MemmapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
@@ -554,6 +572,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
+    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", us->serial);
     object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 82667b5..7cf742e 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -59,6 +59,7 @@ typedef struct SiFiveUState {
     int fdt_size;
 
     bool start_in_flash;
+    uint32_t serial;
 } SiFiveUState;
 
 enum {
-- 
2.7.4


