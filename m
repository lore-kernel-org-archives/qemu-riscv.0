Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVtx-0004vC-I8
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:02:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtu-0004qb-Ko
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:02:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtl-0007gl-6N
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:02:52 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7633)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVth-0007YZ-HU; Wed, 21 Nov 2018 12:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819761; x=1574355761;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=sZ/F/KrmZnWQxH/2pmUo5z8HZwh44Nf1s8iLMybSOV0=;
	b=alJY/9MqZOcoAwyN6kQkl/ylnzVUt8fcX27Tfm+FEKFCubtjYVLiW5u3
	crJZ+qH/g8sYwh+W9zWigOLlEPFemCBdGb7YmHBINGaBciVGwOs4c8lIH
	TXw8fjU5Nd3ItdYLQzYDPZE3hEDUickyj5Bec7Fy1+ZEDj+o1HOUUV7fg
	47E9cIBcm2ZaNIjMiKphEhVS3RSBrFGeimAWXBA/yeMjUUu5zpT9XyThe
	VIQFtc5YVJBRXcz8HvPk1jIX1YZ/jGqcn/MwiQyoFsOpYV0J89n/JCPAT
	NFzNOkIkfHTvRo1RtvtcqarDUpHo7wQG+fgu0KpsBcCxDzmSSANtln91H Q==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="99635134"
Received: from mail-bn3nam04lp0118.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.118])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/WFqTLQ4OoyoIzyFn3gRYj7U4SSmnr/fDua1IkvMgDA=;
	b=jimEVoiDpLkevuFlIhQrU/VZPc7ouNT5EjkCQVKX2NzHbJfBQGxZ92TAP43kL6oVAcC1ArWYAseGgbH2Pl9tjoqoiT+e2xwQLraGhLF2vEFWcceBpuiB763+F6hFODKqqZVpLyforyELEZnuRaeicysNpZqzQENMeZUEEGYDW+E=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:02:35 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:35 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 3/6] hw/riscv/virt: Connect the gpex PCIe
Thread-Index: AQHUgbwAirzMApFMVUWELtk7/NvUaA==
Date: Wed, 21 Nov 2018 17:02:35 +0000
Message-ID: <86e2120f18412152ed2994b72bd874120b86d749.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0065.namprd11.prod.outlook.com
	(2603:10b6:a03:80::42) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:8GyDWCzEO7Czz6b59PQkYZ7jOqZXToAODQDaV8IKqRfN1ShNZzr1xFDpMizPdtLQCz/RVZqpZ9w34ObhgCgqwH4a6LTJx6bscWg8/ApjNE65b10Cyd32nHPrMKl8eJnhfdccZ+XfX+O+BHTC2uom3+vkD+8GtsJh+b1/TFcCWK1yj4JBI8izSP5y5lx/xS4h9BFbzxXvezgaB/apuirtFVIPK5+/IBc+m/d2YpbLbDDmxzGF2k1VQBhuEZRQyh50LysfZaTUYVyNeBrizH0Dk7tLWEvSnBp/vU2tvk/x3PIrom1LW8hjFw0yE1XbyQM9XrayaybyQsx42zJ07lbdPJAdlUF6ys2CMABfTUK5EHxqDwFE1XxxKwWZTKnCm9HZn+SeRyH7h7HI+M4/r6K1qFTrgFnJj47WX4VM2uESz9jsHGb3K+iby9EpGR/UdlKAL5QZ0EY0D0xyu90YhwmuYg==;
	5:Ja38WbSNjybHt6mRWdbsw5GiP7gcvkgL6PWt93rOfh9rvSQGRBLPrXAi6r6d09ujANTDz54FiqB+u6BaU0irYYlWP96m702UVLd/JtHi2hZ0P1TIolz9x6l8nVJrZTvcFOcpznCDNuzemcVLXSWqUCwSRQlv1ectuakCv0gw4rQ=;
	7:Ovj1iLzDsomMvlFab14DH5TGBNpcYRZ/mnYNuEsJ77K/qknN90TVUbISf+RpmCyDz5xa8VezTyFvisMS3q4jN0MuF8zXjkdk+dUxzvso+BU9fv9cGlzEWAXpeaQKU7V+eJlzTCzaRL8KpTpYSgXDdg==
x-ms-office365-filtering-correlation-id: d43a4b43-ff51-4dfe-05f8-08d64fd32255
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12495AC21F8026A029F6B7CD90DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1249; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1249; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(36756003)(72206003)(97736004)(305945005)(68736007)(2906002)(71200400001)(86362001)(71190400001)(8676002)(7736002)(106356001)(478600001)(105586002)(39060400002)(6512007)(102836004)(3846002)(2900100001)(76176011)(14454004)(25786009)(52116002)(8936002)(118296001)(44832011)(6116002)(186003)(50226002)(6486002)(476003)(66066001)(316002)(2616005)(26005)(5660300001)(486006)(2501003)(81156014)(81166006)(4326008)(386003)(6506007)(110136005)(54906003)(256004)(11346002)(99286004)(446003)(6436002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1249;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: xe3pW+3+ZmrpxF+99Us3P4aLkB1xTfykIN+5dmH+byI34tmuNzJCyHeBh/aUAGK3jkBvvNnpl+qtU7IC2n2XCOTGYSU1Aos0GRwTuiPSyNy1uHdxq1aSvc07tf5BO7eNcJWnR1YRezyZZDeOfvJdzjw9XPu/h5aaJbLp/pQ9II2tG83CaamJ/CFuRXQxv9AHTZBWbMsT3OjvE2V3zAyKLriwy7QQsWBPsSUjK4+YKY69ee+PL4qVQxWX8fGZi830bvnKVITLRtaMpR3c2HWW/WSGlLQP1808APcCCk6AjBXer1dHJ2qIZ485LGQgcDq0fMWB+cR+ramEm9bHLPtW9tDw0d6JQ1e/RZk86xr6r9A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43a4b43-ff51-4dfe-05f8-08d64fd32255
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:35.5163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH for-3.2 v7 3/6] hw/riscv/virt: Connect the gpex
 PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 17:02:56 -0000

Connect the gpex PCIe device based on the device tree included in the
HiFive Unleashed ROM.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 default-configs/riscv32-softmmu.mak |   6 +-
 default-configs/riscv64-softmmu.mak |   6 +-
 hw/riscv/virt.c                     | 131 +++++++++++++++++++++++++++-
 include/hw/riscv/virt.h             |  13 ++-
 4 files changed, 152 insertions(+), 4 deletions(-)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index 7937c69e22..3e3d195f37 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -1,7 +1,11 @@
 # Default configuration for riscv-softmmu
=20
+include pci.mak
+
 CONFIG_SERIAL=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
-include virtio.mak
=20
 CONFIG_CADENCE=3Dy
+
+CONFIG_PCI_GENERIC=3Dy
+CONFIG_PCI_XILINX=3Dy
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-=
softmmu.mak
index 7937c69e22..3e3d195f37 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -1,7 +1,11 @@
 # Default configuration for riscv-softmmu
=20
+include pci.mak
+
 CONFIG_SERIAL=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
-include virtio.mak
=20
 CONFIG_CADENCE=3Dy
+
+CONFIG_PCI_GENERIC=3Dy
+CONFIG_PCI_XILINX=3Dy
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6b6fa39aaa..e7f0716fb6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -39,6 +39,8 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "exec/address-spaces.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/gpex.h"
 #include "elf.h"
=20
 #include <libfdt.h>
@@ -55,6 +57,9 @@ static const struct MemmapEntry {
     [VIRT_UART0] =3D       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
     [VIRT_DRAM] =3D        { 0x80000000,           0x0 },
+    [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
+    [VIRT_PCIE_PIO] =3D    { 0x03000000,    0x00010000 },
+    [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
 };
=20
 static uint64_t load_kernel(const char *kernel_filename)
@@ -98,6 +103,51 @@ static hwaddr load_initrd(const char *filename, uint64_=
t mem_size,
     return *start + size;
 }
=20
+static void create_pcie_irq_map(void *fdt, char *nodename,
+                                uint32_t plic_phandle)
+{
+    int pin, dev;
+    uint32_t
+        full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS * FDT_INT_MAP_WIDTH] =
=3D {};
+    uint32_t *irq_map =3D full_irq_map;
+
+    /* This code creates a standard swizzle of interrupts such that
+     * each device's first interrupt is based on it's PCI_SLOT number.
+     * (See pci_swizzle_map_irq_fn())
+     *
+     * We only need one entry per interrupt in the table (not one per
+     * possible slot) seeing the interrupt-map-mask will allow the table
+     * to wrap to any number of devices.
+     */
+    for (dev =3D 0; dev < GPEX_NUM_IRQS; dev++) {
+        int devfn =3D dev * 0x8;
+
+        for (pin =3D 0; pin < GPEX_NUM_IRQS; pin++) {
+            int irq_nr =3D PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_=
IRQS);
+            int i =3D 0;
+
+            irq_map[i] =3D cpu_to_be32(devfn << 8);
+
+            i +=3D FDT_PCI_ADDR_CELLS;
+            irq_map[i] =3D cpu_to_be32(pin + 1);
+
+            i +=3D FDT_PCI_INT_CELLS;
+            irq_map[i++] =3D cpu_to_be32(plic_phandle);
+
+            i +=3D FDT_PLIC_ADDR_CELLS;
+            irq_map[i] =3D cpu_to_be32(irq_nr);
+
+            irq_map +=3D FDT_INT_MAP_WIDTH;
+        }
+    }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
+                     full_irq_map, sizeof(full_irq_map));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
+                           0x1800, 0, 0, 0x7);
+}
+
 static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memma=
p,
     uint64_t mem_size, const char *cmdline)
 {
@@ -203,7 +253,10 @@ static void *create_fdt(RISCVVirtState *s, const struc=
t MemmapEntry *memmap,
     nodename =3D g_strdup_printf("/soc/interrupt-controller@%lx",
         (long)memmap[VIRT_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
+                           FDT_PLIC_ADDR_CELLS);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
+                          FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
@@ -233,6 +286,33 @@ static void *create_fdt(RISCVVirtState *s, const struc=
t MemmapEntry *memmap,
         g_free(nodename);
     }
=20
+    nodename =3D g_strdup_printf("/soc/pci@%lx",
+        (long) memmap[VIRT_PCIE_ECAM].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
+                           FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells",
+                           FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                            "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
+                           memmap[VIRT_PCIE_ECAM].base /
+                               PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0, memmap[VIRT_PCIE_ECAM]=
.base,
+                           0, memmap[VIRT_PCIE_ECAM].size);
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
+        1, FDT_PCI_RANGE_IOPORT, 2, 0,
+        2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
+        1, FDT_PCI_RANGE_MMIO,
+        2, memmap[VIRT_PCIE_MMIO].base,
+        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
+    create_pcie_irq_map(fdt, nodename, plic_phandle);
+    g_free(nodename);
+
     nodename =3D g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -263,6 +343,47 @@ static void *create_fdt(RISCVVirtState *s, const struc=
t MemmapEntry *memmap,
     return fdt;
 }
=20
+
+static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
+                                          hwaddr ecam_base, hwaddr ecam_si=
ze,
+                                          hwaddr mmio_base, hwaddr mmio_si=
ze,
+                                          hwaddr pio_base,
+                                          DeviceState *plic, bool link_up)
+{
+    DeviceState *dev;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    MemoryRegion *mmio_alias, *mmio_reg;
+    qemu_irq irq;
+    int i;
+
+    dev =3D qdev_create(NULL, TYPE_GPEX_HOST);
+
+    qdev_init_nofail(dev);
+
+    ecam_alias =3D g_new0(MemoryRegion, 1);
+    ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, ecam_size);
+    memory_region_add_subregion(get_system_memory(), ecam_base, ecam_alias=
);
+
+    mmio_alias =3D g_new0(MemoryRegion, 1);
+    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, mmio_base, mmio_size);
+    memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias=
);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
+
+    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
+        irq =3D qdev_get_gpio_in(plic, PCIE_IRQ + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
+    }
+
+    return dev;
+}
+
 static void riscv_virt_board_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap =3D virt_memmap;
@@ -385,6 +506,14 @@ static void riscv_virt_board_init(MachineState *machin=
e)
             qdev_get_gpio_in(DEVICE(s->plic), VIRTIO_IRQ + i));
     }
=20
+    gpex_pcie_init(system_memory,
+                         memmap[VIRT_PCIE_ECAM].base,
+                         memmap[VIRT_PCIE_ECAM].size,
+                         memmap[VIRT_PCIE_MMIO].base,
+                         memmap[VIRT_PCIE_MMIO].size,
+                         memmap[VIRT_PCIE_PIO].base,
+                         DEVICE(s->plic), true);
+
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 7cb2742070..2cce019aca 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -38,13 +38,17 @@ enum {
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
-    VIRT_DRAM
+    VIRT_DRAM,
+    VIRT_PCIE_MMIO,
+    VIRT_PCIE_PIO,
+    VIRT_PCIE_ECAM
 };
=20
 enum {
     UART0_IRQ =3D 10,
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
+    PCIE_IRQ =3D 0x20, /* 32 to 35 */
     VIRTIO_NDEV =3D 0x35
 };
=20
@@ -62,6 +66,13 @@ enum {
 #define VIRT_PLIC_CONTEXT_BASE 0x200000
 #define VIRT_PLIC_CONTEXT_STRIDE 0x1000
=20
+#define FDT_PCI_ADDR_CELLS    3
+#define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
+#define FDT_PLIC_INT_CELLS    1
+#define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 =
+ \
+                               FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
+
 #if defined(TARGET_RISCV32)
 #define VIRT_CPU TYPE_RISCV_CPU_RV32GCSU_V1_10_0
 #elif defined(TARGET_RISCV64)
--=20
2.19.1


