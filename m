Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbt5-00086D-H0
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbst-0007oh-O9
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsr-00079z-HF
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsr-00079Q-7v
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so63089pgc.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/t0JDGthpWUDMaM/dePXHh2KVT7C/teZt20eIzku/C8=;
 b=cjhII7ZNkQRi7ROT2IiQQWzK5X3VtucdlUGFqNASpe0NlLahZe4C5dwzUnH7bhfv2K
 qVMLqOlUUFDVDKh0vemTrkjBqFjIngVWk1lqyh4c5DprIRdv+j21CVgJJTHzI4Sxrk2n
 Jj6PYPSgJNmswQWuRezOKjp+mAiB1GH3IK7/2rm19qEpdmDfFt+wOjMdhx4AI4mj/7CQ
 +mLNkfyyS6sxL/4+LqVe9qDJlXGNmNkqUzOemZvwqCugGTN2QfJL0FjIQOmMqjrV115K
 r+hmdMoz5lCYvqIdZzb+2F+9THR8v2c9YwSGj3STlLGDrg+CnUngPVeVn1TDigHZ0h2a
 sL4g==
X-Gm-Message-State: APjAAAU3hxZrckcp+MRB4h6ySHvjNQ7l6PcXlQvMGpvQpT/mbCH7Eyjb
 f4zHtSlCvWkA2rW1kLBUTp4VMlKY0RU=
X-Google-Smtp-Source: APXvYqzMTtJ9uKgovtYp0Pq5wiKX6OPYLF/tCkvC55sYdvJ2gELp/+C3STt3t1Q0bXe7fgqj3VsUQg==
X-Received: by 2002:a62:1a4d:: with SMTP id a74mr4807945pfa.179.1568820523809; 
 Wed, 18 Sep 2019 08:28:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o9sm8761828pfp.67.2019.09.18.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:43 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:34 -0700
Message-Id: <20190918145640.17349-43-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PULL 42/48] riscv: sifive_u: Fix broken GEM support
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:51 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the GEM support in sifive_u machine is seriously broken.
The GEM block register base was set to a weird number (0x100900FC),
which for no way could work with the cadence_gem model in QEMU.

Not like other GEM variants, the FU540-specific GEM has a management
block to control 10/100/1000Mbps link speed changes, that is mapped
to 0x100a0000. We can simply map it into MMIO space without special
handling using create_unimplemented_device().

Update the GEM node compatible string to use the official name used
by the upstream Linux kernel, and add the management block reg base
& size to the <reg> property encoding.

Tested with upstream U-Boot and Linux kernel MACB drivers.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/Kconfig            |  1 +
 hw/riscv/sifive_u.c         | 24 ++++++++++++++++++++----
 include/hw/riscv/sifive_u.h |  3 ++-
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 33e54b031d..fb19b2df3a 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config SIFIVE_U
     select CADENCE
     select HART
     select SIFIVE
+    select UNIMP
 
 config SPIKE
     bool
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f5f0c3cbb2..7c07452a57 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
  *
  * Provides a board compatible with the SiFive Freedom U SDK:
  *
@@ -11,6 +12,7 @@
  * 2) PLIC (Platform Level Interrupt Controller)
  * 3) PRCI (Power, Reset, Clock, Interrupt)
  * 4) OTP (One-Time Programmable) memory with stored serial number
+ * 5) GEM (Gigabit Ethernet Controller) and management block
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -37,6 +39,7 @@
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/cpu/cluster.h"
+#include "hw/misc/unimp.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_plic.h"
@@ -45,6 +48,7 @@
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "chardev/char.h"
+#include "net/eth.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
@@ -67,7 +71,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
-    [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
+    [SIFIVE_U_GEM] =      { 0x10090000,     0x2000 },
+    [SIFIVE_U_GEM_MGMT] = { 0x100a0000,     0x1000 },
 };
 
 #define OTP_SERIAL          1
@@ -84,7 +89,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
-    uint32_t hfclk_phandle, rtcclk_phandle;
+    uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -254,21 +259,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
+    phy_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "cdns,macb");
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "sifive,fu540-c000-gem");
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_GEM].base,
-        0x0, memmap[SIFIVE_U_GEM].size);
+        0x0, memmap[SIFIVE_U_GEM].size,
+        0x0, memmap[SIFIVE_U_GEM_MGMT].base,
+        0x0, memmap[SIFIVE_U_GEM_MGMT].size);
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
+    qemu_fdt_setprop_cell(fdt, nodename, "phy-handle", phy_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
     qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
+    qemu_fdt_setprop(fdt, nodename, "local-mac-address",
+        s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
     g_free(nodename);
@@ -276,6 +288,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", phy_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
@@ -525,6 +538,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem), 0, memmap[SIFIVE_U_GEM].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        plic_gpios[SIFIVE_U_GEM_IRQ]);
+
+    create_unimplemented_device("riscv.sifive.u.gem-mgmt",
+        memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
 }
 
 static void riscv_sifive_u_machine_init(MachineClass *mc)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 4d4733cb6a..5270851aa2 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -64,7 +64,8 @@ enum {
     SIFIVE_U_UART1,
     SIFIVE_U_OTP,
     SIFIVE_U_DRAM,
-    SIFIVE_U_GEM
+    SIFIVE_U_GEM,
+    SIFIVE_U_GEM_MGMT
 };
 
 enum {
-- 
2.21.0


