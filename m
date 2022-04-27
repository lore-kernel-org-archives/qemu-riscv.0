Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrIW-0004vF-AC
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIU-0004sT-Cd
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:15 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIR-0004VC-1t
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102931; x=1682638931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ji0DQnewFcftQy6tWCq9bnk/8ky3/PfRyw3CuGiKMp8=;
 b=eiCYfU/z+dBUdFuilBf0B2bNKkWaMY2kvVAguO9ZyS7AgqFK/ptkNQbj
 0AAj43UV3k/6eDX9N7mU59G7wEn3LJwv95Nk6TWhVp8BJWmVZ8h98kSG9
 u6fujwj/q1vvTIWX2WRwaC+ssMG0iYSNKsTYpDNzrFl9shEVLLNB4/xmW
 QXLQIDdqv5urvDNtuOfJof2JheLksOyeysncQ56KqRZth1sv9SI0FEobN
 nJYpb5qOg+5jKyH77jUI7vN/hpc2hLyK6/2NH7QUB+3FrV8pz0rN45qIt
 Ccx0f9JUYgQ2oQgU/i+vojlz4UihqMvM4scjQZxBvzNBbq0zfA2ljMajR w==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844537"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:09 +0800
IronPort-SDR: FtwSj0CMjvDH9Fz8yxSbfJB4E1ujfSMReovQxtwQ5+NX1LI7I1BxIgMpi5Bx7ZS2PM6Dr8vsLY
 8fPBp/5xebo65myZ51KoSxd0FOpmVUnTsnQDq8MHaKAGaS497XmReH68WgwzmBbGxMqyFV7q2A
 Bnw8tol1t0lOWVXR69q6ON1xX2KfO7d/lPGfdw2lpjH9EbaRJLLM0Fz/WPc/z/V69IV4HbQnqQ
 +SRQwd5vuqSWFcPKXKG8Lu4g29mizJoRD7tMXzxSS/0ZlebSszviWQmc31F3DLCpsAMjijUd69
 frxsgi9Qynztg8f2aq7fFyJz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:13:01 -0700
IronPort-SDR: HJhmkSWUkzqAmlhzYw8te81EwImUBUJ+zKvg60qiIVFGWTjZ+bOn9gjkJhfEFQlTnj32wJia1o
 naepUkt4/wTRs3jBnaqpvJ3ObVgUGEhEIowD9LGgVeiCQ83rD+lfAbztlBZaP+ONCz+8N5UAdd
 R5NV4tSFlndpbGG1vfRmg5gMWtFxFmO9I129lP0UzxN4fXUE0cm03kXaiQPhP2kw859wA/FzvS
 wNKG0I0C5V+G7xBe/wAWiUgOEI6ATKRMjzkWSl1RTFviGl7X944W3cWDfjFEyOIOYtXdubpI4e
 xe4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzN4hw0z1SVny
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:42:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102927; x=1653694928; bh=ji0DQnewFcftQy6tWC
 q9bnk/8ky3/PfRyw3CuGiKMp8=; b=tR9YB0mqfUKXPW14K25jhafVUJXOA79Yw8
 wtoD86OIGXfIpp2cq3emfAsrSxYsZjRWnP5vHR4ClvFQh3SnGqVkITRlhctxcNzG
 cFEter4yn4APfjQhf8Pi7FnlcUqAFm3r8zzARhd2yewQgDQ9+C0NJvuwoyyiiZED
 HGroII4wDOo27LmcEx446zbxfECR7sbQUy+Vy44/mW3efIZWEYpfcPNGa7uH35pX
 Sd96Z939f83wDTq5EBvoKePE7YXo5YebpZFuwiOPUKUT6IO2ZbHE/oRdk2zZy0yo
 oAXnKjxZwF5dlndZTx5OoWatfXyhGMFt5HwhxezPkbQ+4YSi1qCw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5zh7ktsBpx2Y for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:42:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzJ0xJ6z1Rvlx;
 Wed, 27 Apr 2022 16:42:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 3/6] hw/riscv: virt: Create a platform bus
Date: Thu, 28 Apr 2022 09:41:43 +1000
Message-Id: <20220427234146.1130752-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:15 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Create a platform bus to allow dynamic devices to be connected. This is
based on the ARM implementation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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
index 99ab3d4bca..312138e7bf 100644
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
@@ -1162,6 +1164,32 @@ static DeviceState *virt_create_aia(RISCVVirtAIATy=
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
 static void virt_machine_done(Notifier *notifier, void *data)
 {
     RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
@@ -1418,6 +1446,8 @@ static void virt_machine_init(MachineState *machine=
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


