Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghkh-000413-LO
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkX-0003v4-Gz
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkV-0004Ke-Cr
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351246; x=1681887246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e2Z1mPMjuALcbIIiDbdx4iqIL8NEKphMfAicrXHlSr0=;
 b=B2cjsIZ0YKdXE2npA4CB+02vzDT9P7n1BnGueJaHsK8sOoWl+GNragwc
 4E4aFdVeX55z8v5/eOq0v6dw+JgINbDlQGsbPiWsNxZjhfg6E25yfwvxS
 xcBcKmzJG3Pg29xwU+Xrvec0lqGhnVHAertwGsnvH5Ke4G9TsAN3sOHXV
 3rhxjt3GyHx0XHmbM0XWsM++50tbDd2mm6/z5qr1NDRwHUhOpYh6pZ/eA
 87QrjLo8bIXIhUtTBCLiIxAg5PArBeibBcei6Uth+fK3lwnvXzIl7Jwq2
 71YaKz/Wa3cobOn+4HNqIX6DmrXGMtePQxoR7L2LlZLh1TlT0KJdOybPM w==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="198236511"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:54:02 +0800
IronPort-SDR: lSL5ZqRI86QFAQg2mt0MaUMCkBHS19uCJDE6FE9FHg/2vFhda7/NIgjXvKCcsPIrMLCTFqohbB
 lFAZvdkMUi9qgQu+OUbJwO6SUWKpg0OjwDGv1yWaQlahiwf7KDmFka4uxmX5syybJumbPw7bBK
 xmhDFS2j6GloEUzu/v1QJRkI8Ej3qmAXKHLQAGZzDJEbiTfFsM+Na/wXijCtxnxILfLbh37cel
 wleH1nbcWeJQVkzow/Y/d9PrLMHINGXYTNsFJTv3cmuW/Y0hFglg65vIilQf5u0LzRetz5k0h8
 PJq4WmsBUSI4YvWFa15u0iox
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:25:08 -0700
IronPort-SDR: EU+VrHAiBuqdyO4Q+8eEK3weFKeDTCW/UGDxGwiVSSzZT2orcuYLwzsNl9vdTQ/F91oOTUmmy9
 nhwZ8X0TPly9qo2AknqKhfEOoyeRpUWh+Cf41gpzZUvWgcmwL01CbQjmkjwTRqu+O3hBs6UUNd
 mFi/uWiDU0n4y0fs74FHzE/jvn02WVbDPCXmNPpqgZGxlaBUf+47Elmtqk1VucGfoD71Sj5BMq
 e059dZ1WvcXxdo8eaVAlZZXsE34setEBPHWW3dfrGRSxcnxe3rER4b/1NnUVvjS0Q/OCgx7hfT
 h5g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:54:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDzt1VcBz1SVp0
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:54:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351241; x=1652943242; bh=e2Z1mPMjuALcbIIiDb
 dx4iqIL8NEKphMfAicrXHlSr0=; b=kXA+xrDizK/NLS7EXmyRC63UM0+I2StEeh
 TcGk2b6qjxAGFtZNskE2xbjXKB/9j/DyxmITLI/o5hIPEfZB3bM8GBNj12UR4v5t
 hjqv/LmMmBIX6RwoV7TRBDigm0ETsxhb8hYFdiIpxw9HW2hNbZoirXlds2QNC0eF
 x5IwHaz4pNvIoAw7XwHTbmjIpJmllxM7X211EU12VFx9Q5oX8IeYb+sW5Hsbu3Gy
 dEgU4p0mbvTV7/Rrvwe236xt0MxeEje31Ea3sfORRAEOZWwqJLdhFFYDcCzv+GH+
 mcPVj73kVJXAs42XuqBDoRHrsHGPhYEra2vBexwP0D0h8lljZe2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kV91US2PC21y for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:54:01 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzp2xkmz1SVp1;
 Mon, 18 Apr 2022 23:53:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 3/6] hw/riscv: virt: Create a platform bus
Date: Tue, 19 Apr 2022 16:53:39 +1000
Message-Id: <20220419065342.878415-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2022 06:54:11 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Create a platform bus to allow dynamic devices to be connected. This is
based on the ARM implementation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/riscv/virt.h |  7 ++++-
 hw/riscv/virt.c         | 68 +++++++++++++++++++++++++++++------------
 hw/riscv/Kconfig        |  1 +
 3 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 8b8db3fb7c..984e55c77f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -46,6 +46,7 @@ struct RISCVVirtState {
=20
     /*< public >*/
     Notifier machine_done;
+    DeviceState *platform_bus_dev;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
@@ -76,6 +77,7 @@ enum {
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
+    VIRT_PLATFORM_BUS,
     VIRT_PCIE_ECAM
 };
=20
@@ -85,9 +87,12 @@ enum {
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
     PCIE_IRQ =3D 0x20, /* 32 to 35 */
-    VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 96 */
+    VIRTIO_NDEV =3D 96 /* Arbitrary maximum number of interrupts */
 };
=20
+#define VIRT_PLATFORM_BUS_NUM_IRQS 32
+
 #define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3d48469367..169da70350 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -37,6 +37,7 @@
 #include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
+#include "hw/platform-bus.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
@@ -68,25 +69,26 @@
 #endif
=20
 static const MemMapEntry virt_memmap[] =3D {
-    [VIRT_DEBUG] =3D       {        0x0,         0x100 },
-    [VIRT_MROM] =3D        {     0x1000,        0xf000 },
-    [VIRT_TEST] =3D        {   0x100000,        0x1000 },
-    [VIRT_RTC] =3D         {   0x101000,        0x1000 },
-    [VIRT_CLINT] =3D       {  0x2000000,       0x10000 },
-    [VIRT_ACLINT_SSWI] =3D {  0x2F00000,        0x4000 },
-    [VIRT_PCIE_PIO] =3D    {  0x3000000,       0x10000 },
-    [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * =
2) },
-    [VIRT_APLIC_M] =3D     {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
-    [VIRT_APLIC_S] =3D     {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
-    [VIRT_UART0] =3D       { 0x10000000,         0x100 },
-    [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
-    [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
-    [VIRT_FLASH] =3D       { 0x20000000,     0x4000000 },
-    [VIRT_IMSIC_M] =3D     { 0x24000000, VIRT_IMSIC_MAX_SIZE },
-    [VIRT_IMSIC_S] =3D     { 0x28000000, VIRT_IMSIC_MAX_SIZE },
-    [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
-    [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
-    [VIRT_DRAM] =3D        { 0x80000000,           0x0 },
+    [VIRT_DEBUG] =3D        {        0x0,         0x100 },
+    [VIRT_MROM] =3D         {     0x1000,        0xf000 },
+    [VIRT_TEST] =3D         {   0x100000,        0x1000 },
+    [VIRT_RTC] =3D          {   0x101000,        0x1000 },
+    [VIRT_CLINT] =3D        {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] =3D  {  0x2F00000,        0x4000 },
+    [VIRT_PCIE_PIO] =3D     {  0x3000000,       0x10000 },
+    [VIRT_PLATFORM_BUS] =3D {  0x4000000,     0x2000000 },
+    [VIRT_PLIC] =3D         {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX *=
 2) },
+    [VIRT_APLIC_M] =3D      {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_UART0] =3D        { 0x10000000,         0x100 },
+    [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
+    [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_IMSIC_S] =3D      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_PCIE_ECAM] =3D    { 0x30000000,    0x10000000 },
+    [VIRT_PCIE_MMIO] =3D    { 0x40000000,    0x40000000 },
+    [VIRT_DRAM] =3D         { 0x80000000,           0x0 },
 };
=20
 /* PCIe high mmio is fixed for RV32 */
@@ -1156,6 +1158,32 @@ static DeviceState *virt_create_aia(RISCVVirtAIATy=
pe aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+    const MemMapEntry *memmap =3D virt_memmap;
+    int i;
+    MemoryRegion *sysmem =3D get_system_memory();
+
+    dev =3D qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
+    qdev_prop_set_uint32(dev, "mmio_size", memmap[VIRT_PLATFORM_BUS].siz=
e);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s->platform_bus_dev =3D dev;
+
+    sysbus =3D SYS_BUS_DEVICE(dev);
+    for (i =3D 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
+        int irq =3D VIRT_PLATFORM_BUS_IRQ + i;
+        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
+    }
+
+    memory_region_add_subregion(sysmem,
+                                memmap[VIRT_PLATFORM_BUS].base,
+                                sysbus_mmio_get_region(sysbus, 0));
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -1407,6 +1435,8 @@ static void virt_machine_init(MachineState *machine=
)
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_irqchip));
=20
+    create_platform_bus(s, DEVICE(mmio_irqchip));
+
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c4..da790f5936 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -48,6 +48,7 @@ config RISCV_VIRT
     select SIFIVE_TEST
     select VIRTIO_MMIO
     select FW_CFG_DMA
+    select PLATFORM_BUS
=20
 config SIFIVE_E
     bool
--=20
2.35.1


