Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i11rE-00040c-4f
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 01:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11r9-0003uA-Op
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11r8-0002SX-An
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:23 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11r5-0002Pv-Ae; Fri, 23 Aug 2019 01:11:19 -0400
Received: by mail-pl1-x642.google.com with SMTP id gn20so4880529plb.2;
 Thu, 22 Aug 2019 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Z+uJNvaih5YZepF19mpSiOvklfknBUC6Oj0NXwvSonU=;
 b=n3m0mkzXwzAqgqBJmKcPJf+FYzjpSoqH6xPXtlIEK2rqnVnLa12NtN+6VjDvND5Fxg
 m/e1PH0YEQlZM+g0Qsp3xVJBysVN8lJqEPFy6aSBgj+JERryrbGZ9yDOuda3rhN+ybhj
 8yNpex4aKYHNjyD2CB4L8cPwHj0myV/ydPP5fM4OCaDqcXTTtl+2MtMx7qa0ey3ClFWy
 FUy5yYgFBYAsKgWDj4TeByrN1SbRXXCyQ4n51K+PCCl4293B2h3+Yi9e4xSQfSmtXP6+
 lthWoUxMH+T4tjnj18ajmfuqJxG06EdvYPwsLFW6rQXU33S7/zBGpRfZ2mGhFPD0qb5K
 /IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Z+uJNvaih5YZepF19mpSiOvklfknBUC6Oj0NXwvSonU=;
 b=eKzKw2wWMJlaUli5fAGfjpGe3OjXC7Qx+TM87p4ZOwlWaJEivtzuv+pdVks2TftOo0
 wLhshRbbfuqhPjrDOdN4EkDVR7qXrZH0WnvACDqQ1pmJXaB4eGQj36V2Gmkq8iGNdKpG
 vlWvNvoqXnis+nIKBe5jpfUreyWIAYg6SXXYdX3L01Fmiq3BtkUnpdT78FdL40qeJhj6
 5qhg6IfMu1Obm8yqysraBW5txwWI3VZda93npG+QK6fnHGUL9FXdbPkUJdLumKcRHy90
 Vwt/xmYGbyhLFP2+mazSsVrvw4VFlhkPkTnJIDRkF0JLDgjWhNCFD1XQ1N4h/cByg2n3
 YNLA==
X-Gm-Message-State: APjAAAUFOYb9tIoWU2pZo4tNDLbgZ+m4hMNvkUkxT1Dkh3aZpBktpBxI
 emaqB69AbZQJMsfGZju2lW8=
X-Google-Smtp-Source: APXvYqyFcYkpvwZPrsx3TAx/oq5DbnY7O/a2JWxDVbCpiaijD7D861hkJP65OB/JOLbuRAg3akxLpg==
X-Received: by 2002:a17:902:ea:: with SMTP id
 a97mr2633484pla.182.1566537078564; 
 Thu, 22 Aug 2019 22:11:18 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:10:41 -0700
Message-Id: <1566537069-22741-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH v5 02/30] riscv: hw: Use
 qemu_fdt_setprop_cell() for property with only 1 cell
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
X-List-Received-Date: Fri, 23 Aug 2019 05:11:26 -0000

Some of the properties only have 1 cell so we should use
qemu_fdt_setprop_cell() instead of qemu_fdt_setprop_cells().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 18 +++++++++---------
 hw/riscv/virt.c     | 24 ++++++++++++------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index afe304f..3f9284e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -183,7 +183,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
-    qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
@@ -208,20 +208,20 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         0x0, memmap[SIFIVE_U_GEM].size);
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         ethclk_phandle, ethclk_phandle, ethclk_phandle);
     qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
-    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
-    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
     g_free(nodename);
 
     nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
     uartclk_phandle = phandle++;
@@ -241,9 +241,9 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
-    qemu_fdt_setprop_cells(fdt, nodename, "clocks", uartclk_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "clocks", uartclk_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 00be05a..127f005 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -233,8 +233,8 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
         (long)memmap[VIRT_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
-                           FDT_PLIC_ADDR_CELLS);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
+                          FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
                           FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
@@ -247,7 +247,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
-    qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
     g_free(nodename);
@@ -260,19 +260,19 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_cells(fdt, nodename, "reg",
             0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
             0x0, memmap[VIRT_VIRTIO].size);
-        qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-        qemu_fdt_setprop_cells(fdt, nodename, "interrupts", VIRTIO_IRQ + i);
+        qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", VIRTIO_IRQ + i);
         g_free(nodename);
     }
 
     nodename = g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
-                           FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells",
-                           FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
+                          FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
+                          FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0x2);
     qemu_fdt_setprop_string(fdt, nodename, "compatible",
                             "pci-host-ecam-generic");
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
@@ -309,8 +309,8 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         0x0, memmap[VIRT_UART0].base,
         0x0, memmap[VIRT_UART0].size);
     qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
-        qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-        qemu_fdt_setprop_cells(fdt, nodename, "interrupts", UART0_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", UART0_IRQ);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
-- 
2.7.4


