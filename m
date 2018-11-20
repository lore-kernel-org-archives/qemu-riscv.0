Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPFKo-0002nj-2n
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 18:21:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPF0l-00033W-Fx
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:00:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPF0k-0005FI-4d
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:00:51 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPF0g-0004wH-FH; Tue, 20 Nov 2018 18:00:46 -0500
Received: by mail-pl1-x641.google.com with SMTP id gn14so2460651plb.10;
	Tue, 20 Nov 2018 15:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+x+1GVBl0qYjPoLLrCIwSe8DEDJvmsOgpSgY435r34g=;
	b=rxU6Aa7mwCEwGJyEJfay5CkJCBQ3blpwU0gpZBL2t9M72ZA1bPnbR3yWM3cluNjs9h
	vKqkRHnlNDm6YBqLWYSwT9lhDW0T46oxv3Y9rr/xJy2XwKsRtr9AqX3ecexTbhhtMy/e
	MLenbZm5WzFdYc8Vrl/e1mzfey6NeT+RXSYk5g1V7rIrSmE16mDkWn3yWp5AxUwqM1qP
	ybec+7TV1QAdCmSMosTtqm7LssBz45KJL0W7lEiiHdiSdWAGWXmUco1KX6ybhbt7UwH8
	EZB/+ePfxNzf/svrFOTEyJ5pkDogCCFtX/zoh/VSO7KfpkDm9iSlE6RgI04WO0YeWsPc
	K0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=+x+1GVBl0qYjPoLLrCIwSe8DEDJvmsOgpSgY435r34g=;
	b=jM8zJO7iHg9LZvDY6RmgvjtZynbPMIWbsmacFgxfdNZHa+FLUK1gmvS3tUZhk/HwJl
	iN+WbQwj+0+axYLaVMkVhgD7y6QejFDQ5o9vkrnO8mGgYw2yofaGUszlBYyafTTnP0cT
	AWvw8SpwDD8XOoBTT4/lbjqzW5S5hn9/dlG0biYMbXNKPEYCPdCONZaNBnD4n72S4jKj
	VVarclypMyNIwdOhY3PVnWDEE5ZXqziKNyZhQQArHAwjO1qzSgABsSpiJ+em+o50cEqX
	Ym3naMsbSUxBmMwumOoOLvI4WOWXlsTCrgYlYG4EtyDcURrzspgMDBlFNpuMWz4WMfuj
	uEtA==
X-Gm-Message-State: AGRZ1gLqiRzHdJGurv10GSN0C+OCDH/ccxSjmIBmFjzWshjlNdBb35MF
	p0h6zfgERpSISN4uaa0VQGo=
X-Google-Smtp-Source: AJdET5dkGe8n3MLR6bhzEfO3rS/oW1Qh+jO733olILgCp3zlixfUK7iGw7pgNnO0kOoiVpMyyOha+Q==
X-Received: by 2002:a62:9a09:: with SMTP id
	o9-v6mr4260542pfe.229.1542754838391; 
	Tue, 20 Nov 2018 15:00:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id v5sm63199542pgn.5.2018.11.20.15.00.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 15:00:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrea Bolognani <abologna@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Date: Tue, 20 Nov 2018 15:00:31 -0800
Message-Id: <1542754831-25567-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-Mailman-Approved-At: Tue, 20 Nov 2018 18:21:33 -0500
Subject: [Qemu-riscv] [PATCH 2/2] riscv: virt: Fix interrupt mapping
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
X-List-Received-Date: Tue, 20 Nov 2018 23:00:52 -0000

- Interrupt map width is 6, not 7
	address (3), pci interrupt (1), controller phandle (1), irq (1)
- Since the interrupt map is the default pci interrupt map, we can not
  omit devfn from the mapping function.
- It is not necessary to specify "interrupt-parent" and "interrupts"
  since both are part of interrupt-map.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/riscv/virt.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 675899d..fb3a492 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -65,35 +65,37 @@ static const struct MemmapEntry {
     [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
 };
 
-#define INTERREUPT_MAP_WIDTH 7
+#define INTERRUPT_MAP_WIDTH 6
 
 static void create_pcie_irq_map(void *fdt, char *nodename,
                                 uint32_t plic_phandle)
 {
-    int pin;
-    uint32_t full_irq_map[GPEX_NUM_IRQS * INTERREUPT_MAP_WIDTH] = { 0 };
+    int devfn, pin;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * 4 * INTERRUPT_MAP_WIDTH] = { 0 };
     uint32_t *irq_map = full_irq_map;
 
+    for (devfn = 0; devfn <= 0x18; devfn += 0x8) {
         for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
-            int irq_nr = PCIE_IRQ + (pin % PCI_NUM_PINS);
+            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % PCI_NUM_PINS);
             int i;
 
-            uint32_t map[] = {
-                0, 0, 0,
-                pin + 1, plic_phandle, 0, irq_nr};
+            uint32_t map[INTERRUPT_MAP_WIDTH] = {
+                devfn << 8, 0, 0,
+                pin + 1, plic_phandle, irq_nr};
 
             /* Convert map to big endian */
-            for (i = 0; i < INTERREUPT_MAP_WIDTH; i++) {
+            for (i = 0; i < INTERRUPT_MAP_WIDTH; i++) {
                 irq_map[i] = cpu_to_be32(map[i]);
             }
-            irq_map += INTERREUPT_MAP_WIDTH;
+            irq_map += INTERRUPT_MAP_WIDTH;
         }
+    }
 
     qemu_fdt_setprop(fdt, nodename, "interrupt-map",
                      full_irq_map, sizeof(full_irq_map));
 
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
-                           0, 0, 0, 0x7);
+                           0x1800, 0, 0, 0x7);
 }
 
 static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
@@ -261,8 +263,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
                                  2, memmap[VIRT_PCIE_MMIO_HIGH].base,
                                  2, memmap[VIRT_PCIE_MMIO_HIGH].size);
 
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
     create_pcie_irq_map(fdt, nodename, plic_phandle);
 
     nodename = g_strdup_printf("/test@%lx",
-- 
2.7.4


