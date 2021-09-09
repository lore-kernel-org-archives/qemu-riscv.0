Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOB9u-0007gW-Dx
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 23:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9t-0007eF-EV
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 23:55:29 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9r-0006VK-67
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 23:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631159725; x=1662695725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyY9rUqDi9RdJdYj30YVJGd7KOrfmyx3w10Rlsbjsf0=;
 b=WjP+onQPvmKtNbAo0X7nd5vuSr+yx/PHfsDkUN59A9QcjjMVSIDtnfeQ
 mQt9G49iwTVqqsQycIAFeWZro39EqMon2X76+JSt+oOhojKrCIn88+NzX
 RGtHPG9IOfvQre4kzSOBy3bACwQ4eDuCZKpqGb5o//ydUkVEu6bwEisIq
 2ssjcBLsLuwnPibFBhtI7RbaPrKj3BO3QKol6Z2KTu3HBT7b0FWjGjmgu
 y7sSNyniK4jhPzR/6Oa8yZoJaHcyWED9kZbkhsY/tKymHq72nPGoZXW6O
 Vmi3H7d6lZhnnMamGr33k8ZPSkfT3NdM6w6uJmwgvAO+T1z5wnoC8lgUj g==;
X-IronPort-AV: E=Sophos;i="5.85,279,1624291200"; d="scan'208";a="184325907"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2021 11:55:24 +0800
IronPort-SDR: BRu4XGxlPv9YLGBiPLwpp0rmKCQqY83nfm4KfmbuJ/g6oVi95sdpeb7AvoUHmR/TLXz5Mh8thj
 WXSFPOiRXlHDVeuXVrlyA1Sn+hfzoUYQ5yGfQ9e7DVa1HWxracNijf5z5MSqgqf1GstHhjtK2F
 RDLP5215y5PsK5C6YYs7sOPWankw5XEAWpb8UVQOKen+1y1sPMOsiQxkfGdXkKLAtc0XAH1joy
 AQ0JlEmG73SKLzJquEUGEWdDQth/7pGDHwFmZFweW+3tHl5oOO3LBit16PDqxRyRl2aGWFRq9f
 yiZCQzJq8J7cIUGObTwcfToO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:32:01 -0700
IronPort-SDR: 4lzP2SO7YgeXhJaePT7alwJ+oOer8Eu9PcHIRy2pDTRnmhPCJihWkdb7ONggAhCnPysjmoUH7M
 qwnyvjq26LcrE4PH5HOJ2v3UiDjqRjiUtkiz7fIH/h56efYBIIWSDHaN0evBdmleU+SgUiEvmc
 tCz5FgN4P0Tsq3anUFKvBuccI/ufUW/f8ffLoYzPQiNavVPJ+L4qGeyM4baoWehcTpxAJXZMWS
 762aQDglNd0yBWcB0R5wnxbdYScWDulbgYlVioucUQhuvX3CK884P8MwTqXSiJS1eaO5z2AUA2
 K6Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:55:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H4lXF2spLz1Rvld
 for <qemu-riscv@nongnu.org>; Wed,  8 Sep 2021 20:55:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631159724; x=1633751725; bh=uyY9rUqDi9RdJdYj30
 YVJGd7KOrfmyx3w10Rlsbjsf0=; b=eDuVTEvA+0UsLnRcWKewiVRNKq805kx8Br
 j31hME7o64Sl/e/2+24bd1YTPsEcaQVfIWAOLncq0vD14hauwZtihJBOLpY7ghLu
 sQKgtAzn6A2m37bvsbHxKGBsZWOfipyTbEJS5/gvvCSASqEF/R//zQW9apU7O0N5
 +GzRG0CJQupsJ7qYezMaPTNO+G7trQTJGprHuizxPaXGdaO5dTGRrPTSfw9emIhV
 0NlM6EgqYDzRRAELgmqB0WUgdXnwd1NaF/vSzQT8pJbl/Jg1fa79iAoC/5LlP+Wd
 OkjI9+q/IsE+kqX02Iqtp7QDOhttlwBStT27nHBDB8DkvNE7SZEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gSzaAbJ7XxVw for <qemu-riscv@nongnu.org>;
 Wed,  8 Sep 2021 20:55:24 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H4lX85gBCz1RvlP;
 Wed,  8 Sep 2021 20:55:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 2/2] sifive_u: Connect the SiFive PWM device
Date: Thu,  9 Sep 2021 13:55:15 +1000
Message-Id: <22f98648b4e012f78529a56f5ca60b0b27852a4d.1631159656.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631159656.git.alistair.francis@wdc.com>
References: <cover.1631159656.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=879ac4819=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 09 Sep 2021 03:55:29 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Connect the SiFive PWM device and expose it via the device tree.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/sifive_u.rst |  1 +
 include/hw/riscv/sifive_u.h    | 14 ++++++++-
 hw/riscv/sifive_u.c            | 55 +++++++++++++++++++++++++++++++++-
 hw/timer/sifive_pwm.c          |  1 +
 hw/riscv/Kconfig               |  1 +
 5 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.=
rst
index 01108b5ecc..7c65e9c440 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -24,6 +24,7 @@ The ``sifive_u`` machine supports the following devices=
:
 * 2 QSPI controllers
 * 1 ISSI 25WP256 flash
 * 1 SD card in SPI mode
+* PWM0 and PWM1
=20
 Please note the real world HiFive Unleashed board has a fixed configurat=
ion of
 1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bi=
t mode.
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2656b39808..f71c90c94c 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -27,6 +27,7 @@
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
 #include "hw/ssi/sifive_spi.h"
+#include "hw/timer/sifive_pwm.h"
=20
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -49,6 +50,7 @@ typedef struct SiFiveUSoCState {
     SiFiveSPIState spi0;
     SiFiveSPIState spi2;
     CadenceGEMState gem;
+    SiFivePwmState pwm[2];
=20
     uint32_t serial;
     char *cpu_type;
@@ -92,7 +94,9 @@ enum {
     SIFIVE_U_DEV_FLASH0,
     SIFIVE_U_DEV_DRAM,
     SIFIVE_U_DEV_GEM,
-    SIFIVE_U_DEV_GEM_MGMT
+    SIFIVE_U_DEV_GEM_MGMT,
+    SIFIVE_U_DEV_PWM0,
+    SIFIVE_U_DEV_PWM1
 };
=20
 enum {
@@ -126,6 +130,14 @@ enum {
     SIFIVE_U_PDMA_IRQ5 =3D 28,
     SIFIVE_U_PDMA_IRQ6 =3D 29,
     SIFIVE_U_PDMA_IRQ7 =3D 30,
+    SIFIVE_U_PWM0_IRQ0 =3D 42,
+    SIFIVE_U_PWM0_IRQ1 =3D 43,
+    SIFIVE_U_PWM0_IRQ2 =3D 44,
+    SIFIVE_U_PWM0_IRQ3 =3D 45,
+    SIFIVE_U_PWM1_IRQ0 =3D 46,
+    SIFIVE_U_PWM1_IRQ1 =3D 47,
+    SIFIVE_U_PWM1_IRQ2 =3D 48,
+    SIFIVE_U_PWM1_IRQ3 =3D 49,
     SIFIVE_U_QSPI0_IRQ =3D 51,
     SIFIVE_U_GEM_IRQ =3D 53
 };
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6cc1a62b0f..2301f5dd4f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -17,6 +17,7 @@
  * 7) DMA (Direct Memory Access Controller)
  * 8) SPI0 connected to an SPI flash
  * 9) SPI2 connected to an SD card
+ * 10) PWM0 and PWM1
  *
  * This board currently generates devicetree dynamically that indicates =
at least
  * two harts and up to five harts.
@@ -75,6 +76,8 @@ static const MemMapEntry sifive_u_memmap[] =3D {
     [SIFIVE_U_DEV_PRCI] =3D     { 0x10000000,     0x1000 },
     [SIFIVE_U_DEV_UART0] =3D    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =3D    { 0x10011000,     0x1000 },
+    [SIFIVE_U_DEV_PWM0] =3D     { 0x10020000,     0x1000 },
+    [SIFIVE_U_DEV_PWM1] =3D     { 0x10021000,     0x1000 },
     [SIFIVE_U_DEV_QSPI0] =3D    { 0x10040000,     0x1000 },
     [SIFIVE_U_DEV_QSPI2] =3D    { 0x10050000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =3D     { 0x10060000,     0x1000 },
@@ -441,6 +444,38 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
=20
+    nodename =3D g_strdup_printf("/soc/pwm@%lx",
+        (long)memmap[SIFIVE_U_DEV_PWM0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
+        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandl=
e);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
+                           SIFIVE_U_PWM0_IRQ0, SIFIVE_U_PWM0_IRQ1,
+                           SIFIVE_U_PWM0_IRQ2, SIFIVE_U_PWM0_IRQ3);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+                           prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
+    g_free(nodename);
+
+    nodename =3D g_strdup_printf("/soc/pwm@%lx",
+        (long)memmap[SIFIVE_U_DEV_PWM1].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_PWM1].base,
+        0x0, memmap[SIFIVE_U_DEV_PWM1].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandl=
e);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
+                           SIFIVE_U_PWM1_IRQ0, SIFIVE_U_PWM1_IRQ1,
+                           SIFIVE_U_PWM1_IRQ2, SIFIVE_U_PWM1_IRQ3);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+                           prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
+    g_free(nodename);
+
     nodename =3D g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_DEV_UART1].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -765,6 +800,8 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
     object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
+    object_initialize_child(obj, "pwm0", &s->pwm[0], TYPE_SIFIVE_PWM);
+    object_initialize_child(obj, "pwm1", &s->pwm[1], TYPE_SIFIVE_PWM);
 }
=20
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -777,7 +814,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
-    int i;
+    int i, j;
     NICInfo *nd =3D &nd_table[0];
=20
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus -=
 1);
@@ -904,6 +941,22 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
rror **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_GEM_IR=
Q));
=20
+    /* PWM */
+    for (i =3D 0; i < 2; i++) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->pwm[i]), 0,
+                                memmap[SIFIVE_U_DEV_PWM0].base + (0x1000=
 * i));
+
+        /* Connect PWM interrupts to the PLIC */
+        for (j =3D 0; j < SIFIVE_PWM_IRQS; j++) {
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm[i]), j,
+                               qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_U_PWM0_IRQ0 + (i * 4) + j=
));
+        }
+    }
+
     create_unimplemented_device("riscv.sifive.u.gem-mgmt",
         memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT=
].size);
=20
diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
index 5565ff812a..c664480ccf 100644
--- a/hw/timer/sifive_pwm.c
+++ b/hw/timer/sifive_pwm.c
@@ -25,6 +25,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "trace.h"
 #include "hw/irq.h"
 #include "hw/timer/sifive_pwm.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ff75add6f3..d56c339ef6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -69,6 +69,7 @@ config SIFIVE_U
     select SIFIVE_UART
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
+    select SIFIVE_PWM
     select SSI_M25P80
     select SSI_SD
     select UNIMP
--=20
2.31.1


