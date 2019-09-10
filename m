Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwd-0000Jk-6p
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwX-0000BT-6g
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwV-0006wV-8p
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:37 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:43436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwV-0006vk-03
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:35 -0400
Received: by mail-wr1-f52.google.com with SMTP id q17so18736668wrx.10
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=a6jcXX8Xrwp8iQV4Dlr70PegS8xPLRqXExDZ1TMvBGU=;
 b=hwH/Do4NAB1bupmh7X/DydNU2ZMh8yQSZypo6F+KoebLsN1BqRQUCmr1ngcm4SIa84
 6nTT7W/qGCk/hUJwhahaYIx1b7PixqPC5okKVE5AMXrWVUJfzjCKy6nK0mHsxpD1gSjt
 6JI0pc3myzXB7THafzmpK+KyCWAl+8xu5GoGXroPWki3tHovvdO9AqidGS+HDtqOtDyM
 W3xSs1swnHd3+cIwv9B8xTupzOiUPF6G8mQGRl62VIoxnVBPbHi2fmaDkZxAnGEsyyDh
 yafkCUcrXJQnBzNfkbonIK9ChzPqOVSCjVz6/Kda8piVtoKyXPggeEk6KRY8N21itdr6
 fz1w==
X-Gm-Message-State: APjAAAUKnqh9/bjMx0qB/em3FDswoxJqG1DBIABGRoxP3uKPNB0U8Gw7
 0ir1V56AVxmfuiuTv98kvlcA6rV6SVHgjQ==
X-Google-Smtp-Source: APXvYqz4SVis78PVMkM8L1SX6jqlT0Y8aWlXFmeeN5QAMbtPUn03AB6oSROba9+S5AEEhB1lpO22Yw==
X-Received: by 2002:adf:84c6:: with SMTP id 64mr29094053wrg.287.1568190333354; 
 Wed, 11 Sep 2019 01:25:33 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id s19sm30988777wrb.14.2019.09.11.01.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:32 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:08 -0700
Message-Id: <20190910190513.21160-43-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.52
Subject: [Qemu-riscv] [PULL 42/47] riscv: sifive_u: Fix broken GEM support
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:40 -0000

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
index 4803e47ae4..3b61fab42c 100644
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


