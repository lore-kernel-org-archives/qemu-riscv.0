Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsu-0007q7-Fc
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsj-0007XH-Cq
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsh-000722-IZ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsh-00071X-Cx
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id a24so59474pgj.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=UnkXUGp6XScn3Tlb0U0higNXtqaisVpQUddGn1OKHD4=;
 b=U7rWusLksW9RASxBX5Cx/r4D5UF4lSR099X1RrZGDujPvtekj4oq7Tn6Vvd+hDdZNb
 K5VbI6GDQ5Gv7+Xbp7NMF0pxAfYXo06yz2sLWVbMneOGOT8BZ7wEASlWQT8iJBvTuEbQ
 e7L+cbcrYd4gXvTlXasuB1Kb2UlFKji6V50Ov/2Ep1S7JzJnk5QMKZsGAUkwYHL5EoDd
 0MnqaCc+3NIYTECEFhf9TD6mkcwRCmRLLFgGpo4yPXLsBLCnnsnBErg8ooT9xXFQV4Y7
 m6PS2Hj2PQxvACJLYeoFYcaQFYS56wWRCQgPWUXfGum2mOK+qLhPRRkPINVukfOqa4T5
 wvSQ==
X-Gm-Message-State: APjAAAVw8hru7nmEKzJzhEjUAHS12H6lQD0NJTdN/xSJfeOnIgJAC3ee
 vo+8i2hrLbDnuD7j6HufwpdNctMofNY=
X-Google-Smtp-Source: APXvYqxp2DfFwc7taqfUazBU/vFLyfd4Q8H0SdrWYKwtHyUUFf1zmLl+tDmZ2ICCI1bF8tShgbvj1w==
X-Received: by 2002:a17:90a:8001:: with SMTP id
 b1mr4337115pjn.10.1568820514009; 
 Wed, 18 Sep 2019 08:28:34 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f22sm5513400pgb.4.2019.09.18.08.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:33 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:27 -0700
Message-Id: <20190918145640.17349-36-palmer@sifive.com>
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
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 35/48] riscv: sifive_u: Add PRCI block to the SoC
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:42 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Add PRCI mmio base address and size mappings to sifive_u machine,
and generate the corresponding device tree node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 24 +++++++++++++++++++++++-
 include/hw/riscv/sifive_u.h |  3 +++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7eefe9796a..f6b868f49b 100644
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
@@ -60,6 +61,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
+    [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
@@ -77,7 +79,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     char ethclk_names[] = "pclk\0hclk\0tx_clk";
-    uint32_t plic_phandle, ethclk_phandle, phandle = 1;
+    uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
     uint32_t hfclk_phandle, rtcclk_phandle;
 
@@ -188,6 +190,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
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
@@ -402,6 +419,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", SIFIVE_U_CPU);
 
+    sysbus_init_child_obj(obj, "prci", &s->prci, sizeof(s->prci),
+                          TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -475,6 +494,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
 
+    object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
+
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
     }
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 24418145aa..bb46745356 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -22,6 +22,7 @@
 #include "hw/net/cadence_gem.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
+#include "hw/riscv/sifive_u_prci.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -37,6 +38,7 @@ typedef struct SiFiveUSoCState {
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
+    SiFiveUPRCIState prci;
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
@@ -55,6 +57,7 @@ enum {
     SIFIVE_U_MROM,
     SIFIVE_U_CLINT,
     SIFIVE_U_PLIC,
+    SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
     SIFIVE_U_DRAM,
-- 
2.21.0


