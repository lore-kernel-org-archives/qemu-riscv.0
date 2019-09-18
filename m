Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbrt-0006Hc-BX
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrp-0006C2-1z
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrn-0006KU-IY
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:40 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:44342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrn-0006Ii-9T
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:39 -0400
Received: by mail-pf1-f179.google.com with SMTP id q21so180120pfn.11
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=RB+TBC/eDyniAgGIqcf+2M7pyLD6M6TaKIyqIzJhdOQ=;
 b=TydpuIHh9GtvYPDQcnnIxHvMUMZALgJjj/gGrzhYdigA37WHEUWrstFJZuHulK9U5A
 gsmg3DoNgp6Q6Cx+dbBXqIHxaOrQ7mdoeweqfR0IU83DcqyweDm0qnN/GI2NEr4qN6wB
 SkeLtp4nhtlOM8nqtpDOLTTp6KsCVNjTBdmF0w7dvBZKjUQy2XNFzAa2edTOkzlJpCfc
 22UxWtmM6kWCWmxV1sWhpXbIWvISBGavKSxHf7e91YJbco4ifpl9xwbOx3rjLvgJjqrW
 WR6OMkLNRRoKsf68jFn3AAnRBycnYB9rVn7w9BeaceyrBjnTeu55cyQ+VNc0MgBuBfys
 w8cg==
X-Gm-Message-State: APjAAAVFZLICCNCMmigzLAKr/IMbVxC5YNOYn83FhVjcNxJI4hBcwXNM
 FxxKSXIV5S4Ubia8L7aWwkhjNfAOcHo=
X-Google-Smtp-Source: APXvYqy3I+LUSKVWnIT+dmqSqfscMl22YlEeN/bQ0ZmENFbbln6iXPddYPwprZMef05zRl/UTrHc1w==
X-Received: by 2002:a62:684:: with SMTP id 126mr4894441pfg.104.1568820457369; 
 Wed, 18 Sep 2019 08:27:37 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b10sm6572863pfi.85.2019.09.18.08.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:36 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:54 -0700
Message-Id: <20190918145640.17349-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.179
Subject: [Qemu-riscv] [PULL 02/48] riscv: sivive_u: Add dummy serial clock
 and aliases entry for uart
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:43 -0000

From: Guenter Roeck <linux@roeck-us.net>

The riscv uart needs valid clocks. This requires a refereence
to the clock node. Since the SOC clock is not emulated by qemu,
add a reference to a fixed clock instead. The clock-frequency
entry in the uart node does not seem to be necessary, so drop it.

In addition to a reference to the clock, the driver also needs
an aliases entry for the serial node. Add it as well.

Without this patch, the serial driver fails to instantiate with
the following error message.

sifive-serial 10013000.uart: unable to find controller clock
sifive-serial: probe of 10013000.uart failed with error -2

when trying to boot Linux.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 32167d05a1..8313f2605e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -76,6 +76,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
     uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t uartclk_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -226,6 +227,17 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
+    uartclk_phandle = phandle++;
+    nodename = g_strdup_printf("/soc/uartclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", uartclk_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", uartclk_phandle);
+    uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/uart@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -233,8 +245,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-                          SIFIVE_U_CLOCK_FREQ / 2);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks", uartclk_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
 
@@ -243,6 +254,10 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     if (cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
+
+    qemu_fdt_add_subnode(fdt, "/aliases");
+    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
+
     g_free(nodename);
 
     return fdt;
-- 
2.21.0


