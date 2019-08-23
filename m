Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i11rb-0004Xf-OU
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 01:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rV-0004O7-3Q
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rT-0002kX-Jg
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:44 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rQ-0002hu-Oy; Fri, 23 Aug 2019 01:11:40 -0400
Received: by mail-pg1-x542.google.com with SMTP id w10so5085891pgj.7;
 Thu, 22 Aug 2019 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=gzKK8rRBlaOT9StgChRk3Wx3n8XaQ040/gAsONq7Icg=;
 b=iTxX3ISrd3wPcwCGvHCzKa47EmS053LtTVUpfoKut+E9cZjza+Xy+N1/ioSDyFXIBr
 YhBsm1vueO6mN9ZZK6Wplz3IhQpHLYoXVPVHZED599OcXKyg6BghGL/tQa+es7ZfI271
 2NKm4rWJH1tfbQ3AtQxoZNd9G+LEr/bHfwfM3MUUEwHRBRNvX4IGlspFM3fjH731XD7O
 rL/cfXFLr09gI1XWE/y15O3zQ9sZmzxSVcSntpSI+REWmKExJlNk97iE2KYEhTMjzZru
 mV7piE2dCZ23pNuF35i8DOK36UbUq/1Sc7J8dh3sIJ1gwcltcqrZnb2u7FyKrwYAZIGt
 CGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=gzKK8rRBlaOT9StgChRk3Wx3n8XaQ040/gAsONq7Icg=;
 b=M6qo0nmo3mrhDkbIhhfMm2ZbhNXSdHASwBr/6WLNWwbqj3FDN1nQxTCOC6BJGTLld7
 6Ne0tl/bWLwxND8HqAlmLphAT6oV3K6WqVibNlx7yZMoOVyQXIu0htyLDsYI1jtJhHSe
 Stc2VAH37pYAbrWkvkqnpvRL1VNXGqtg4/lU9rS/Yqq/4vQS2WKEMk3pXxbYGN+PqPb6
 BTlWkrxGNaIXc1jSgVMM8MgqMq5Uvxk6ZKIQF+iMYYx7FBBlQ6TIYbmQUEjskrhAlkFx
 hzPo194bmHGxmE+tiuz38zYI0eGcymHgUkyofpivo0hXUxQFYTL8QZhUxoS5xirLkGpE
 2Y6w==
X-Gm-Message-State: APjAAAVW3bApIcwIFKBm3olSEmagHDSCOQqglh6AVQzke0HaLVmzVdMY
 kptMbowvZnprCPCIJiQ6Ceg=
X-Google-Smtp-Source: APXvYqzUkVROAwuqf0dhbGzV9R1bAmeOou24STKXk5npeJTLCo6jk1YXz3mHbFda/Xm6PY8H0vFOBA==
X-Received: by 2002:a63:cc14:: with SMTP id x20mr2407421pgf.142.1566537099941; 
 Thu, 22 Aug 2019 22:11:39 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.38
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:11:00 -0700
Message-Id: <1566537069-22741-22-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH v5 21/30] riscv: sifive_u: Add PRCI block to
 the SoC
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
X-List-Received-Date: Fri, 23 Aug 2019 05:11:48 -0000

Add PRCI mmio base address and size mappings to sifive_u machine,
and generate the corresponding device tree node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v5:
- create sifive_u_prci block directly in the machine codes, instead
  of calling sifive_u_prci_create()

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c         | 24 +++++++++++++++++++++++-
 include/hw/riscv/sifive_u.h |  3 +++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 08db741..c777d41 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -9,6 +9,7 @@
  * 0) UART
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
+ * 3) PRCI (Power, Reset, Clock, Interrupt)
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -61,6 +62,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
+    [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
@@ -78,7 +80,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
-    uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
     uint32_t hfclk_phandle, rtcclk_phandle;
 
@@ -189,6 +191,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    prci_phandle = phandle++;
+    nodename = g_strdup_printf("/soc/clock-controller@%lx",
+        (long)memmap[SIFIVE_U_PRCI].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", prci_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        hfclk_phandle, rtcclk_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_PRCI].base,
+        0x0, memmap[SIFIVE_U_PRCI].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "sifive,fu540-c000-prci");
+    g_free(nodename);
+
     plic_phandle = phandle++;
     cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
@@ -411,6 +428,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
                                 "cpu-type", &error_abort);
     }
 
+    sysbus_init_child_obj(obj, "prci", &s->prci, sizeof(s->prci),
+                          TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -484,6 +503,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
 
+    object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
+
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
     }
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index debbf28..2a023be 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -21,6 +21,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "hw/riscv/sifive_cpu.h"
+#include "hw/riscv/sifive_u_prci.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -36,6 +37,7 @@ typedef struct SiFiveUSoCState {
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
+    SiFiveUPRCIState prci;
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
@@ -54,6 +56,7 @@ enum {
     SIFIVE_U_MROM,
     SIFIVE_U_CLINT,
     SIFIVE_U_PLIC,
+    SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
     SIFIVE_U_DRAM,
-- 
2.7.4


