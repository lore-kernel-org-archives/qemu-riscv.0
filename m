Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPK-0004eE-9e
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLF-00010i-4K
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:18:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKz-0002ue-Hi
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:18:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:24955)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKq-0002hv-Jl; Tue, 30 Oct 2018 18:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937885; x=1572473885;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=W0jl9GMc/mO3N2exPP3ueiofuVo0i+GvcuKN36o4GoQ=;
	b=SkFOlhvSZvy4CYWUQX3qTRFvlXm+UJ2AQu0nmz8QmUTez00VesTrNd6E
	GsNp0WEoiCpjuiF9zd9vH/zFE8VkWzGXTsT1bIo48nhqClMq6nNrAFF7s
	BjtxxxH/vMgGxDaMsb3+r0h9FsShSsY/6554Bf0Tabv/sjF/FThy/wqWS
	/k08gotUnOfDOHTAjZ/iMHLTu1b3unO7ik6WZMRwvoRUjApbK64gFzSR7
	TSvhKNzj9QBxG97drL8BR4Hv+m73mtmDSN3veGTcAjus5rWF9kKhU1edq
	z/H+llNps2QBGoSNYpPe0EuAzhB8TDC+94YXru/bORMnmCHNFQju64KDn g==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="94266056"
Received: from mail-sn1nam02lp0020.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.20])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:18:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4+Tg0ZqKWfbbS4DPduR5esMS/Ml8I3QjVU0KORGaBqI=;
	b=OlsRAe4Rz5FNebxf4+BXhWN9VKWj8Y+Zt7AkpowFICZXJPG0Aa0v+MEddY791knypqLxVTitGg0Q66NEn0GRg7yQpKDtSq8B1lJ9B+GVXbGtlkinBhboiTA6YtgannNC+8t+5kJj/T1TTAbLaqkfJrHOph+j+dw6JAPz60Q3r/Y=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0239.namprd04.prod.outlook.com (10.169.202.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Tue, 30 Oct 2018 22:17:59 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:17:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 2/5] hw/riscv/virt: Connect the gpex PCIe
Thread-Index: AQHUcJ5q1oOoh5HqCUyPoMHT43DXZw==
Date: Tue, 30 Oct 2018 22:17:59 +0000
Message-ID: <546aa18b75a04a281e82706ea41ee9a4a9f3e2bc.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0015.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::28) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0239;
	6:FZUQ+BuTB+lbt1JQKPv9Cx2rPlAIhIKg3M2Z0s510ZgU5wtvIYE7OPF9CgmlU77RpifIwe3k6xY95YCAebqoHZAj2N+VOvXlueoRC04m0BsL31sOZI9KHZFsIcMnergWBpMasBIZ2juS0QI/lk/MRMB04ewm+AjhpV8UQKJ97JybntYio0MWyz4HCFg1YMo+BD7cQ+fhWzrnBLOWR6LyeLsQTzg71iNgMT0/UOfHNrUr9UyCzbkTsCQU5pWmE6i8wSXIXFmaeaYp5zf8Pc8JtYZ9rzB7pKLdNRuIERIRHhdbCXvKLpfrAbZ3lTSFXUnMmQpGawB5TmP1zC9b0pKPciee0ZuzyLtKeuaa+iXtisEygBsgCLVgPMCISYu8Lf3cJf1hOKIBLw6KnwYlZ3RqCTMy5EDSwu96kC5thoM9mtvkNNLK83pjE1vWRq+L4ebc2D2drv/KPFjRRxE5HBnKBg==;
	5:v8LHDjL+IMz1LjiCuEbGSoT6SVOIZdWaS0c9/Tx3bjB3yP8znHi8peQ+96A7/icVWh+CexK0Csn0625fknRy0V+Zzr+FXL5ezYKnA6ZowJvYqnC7X7t1T1MDapWX2XVMKkiNRx5YmhnGQru8nH0zFYbIwkPUCBOfxwnL2O3vh50=;
	7:s2A7AU/dFxCRcUJR8RP5AKz0LEWKdw3jg6t/WVk7NT0d3cCKnq7Vzqp/qkGlhWz0CUPxL7cNENnKqYbv94t9/EXyJHborwpVbHoUeWW96fl5Txq/WEdLqgtX6QpT/mfLmFmFJnAHeW+CUciURiahBw==
x-ms-office365-filtering-correlation-id: 5e5a56e7-32d2-4d7f-fcaa-08d63eb58cd6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0239; 
x-ms-traffictypediagnostic: MWHPR04MB0239:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0239A74D147C26C0669C4EAF90CC0@MWHPR04MB0239.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0239; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0239; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(2501003)(53936002)(71200400001)(105586002)(54906003)(97736004)(26005)(102836004)(6116002)(110136005)(36756003)(5250100002)(50226002)(305945005)(86362001)(106356001)(186003)(316002)(7736002)(8936002)(71190400001)(386003)(6506007)(39060400002)(44832011)(72206003)(66066001)(486006)(8676002)(14454004)(118296001)(25786009)(76176011)(476003)(256004)(6512007)(4326008)(52116002)(6486002)(6436002)(2906002)(2616005)(3846002)(11346002)(446003)(2900100001)(81166006)(5660300001)(478600001)(81156014)(99286004)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0239;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: BNN6bG8PyD+0UAUsqMAo3FKGwsbNkikShvQAEVpEAssnvXSSLf9BAnMPCn56TBDRH1Bu+1xwUIb0TUPYnY2UsuQaJwlLeEXxzj9l20885I5c9/ClmM+xo8AK5Cjai/KXLaU0lLYlsf1wy09+YPh31jwPl/0LtiQOzTG2ts//yiKn5HsV6JdZWut7IaYPszOqLM4Ywggo6Ar3VFDLMKZ5+jeZaUheHHCzwD7+ouFVVGQ8qcZe4JUAU1s5A9T48jV+OpCNn62PLhpL+5LwJmZPg3xUlVvFHj8djWXqexd/ylWUZmSK28r4lKBKTA0cFnaC4eEiNmh73QVfEo5AxGqTMziw7SAeyTpxGCVMBH+IAtw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5a56e7-32d2-4d7f-fcaa-08d63eb58cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:17:59.6369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0239
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 2/5] hw/riscv/virt: Connect the gpex PCIe
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
X-List-Received-Date: Tue, 30 Oct 2018 22:18:32 -0000

Connect the gpex PCIe device based on the device tree included in the
HiFive Unleashed ROM.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/riscv32-softmmu.mak |   6 +-
 default-configs/riscv64-softmmu.mak |   6 +-
 hw/riscv/virt.c                     | 111 ++++++++++++++++++++++++++++
 include/hw/riscv/virt.h             |   8 +-
 4 files changed, 127 insertions(+), 4 deletions(-)

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
index 4a137a503c..2fbe58ba4b 100644
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
@@ -55,6 +57,10 @@ static const struct MemmapEntry {
     [VIRT_UART0] =3D    { 0x10000000,      0x100 },
     [VIRT_VIRTIO] =3D   { 0x10001000,     0x1000 },
     [VIRT_DRAM] =3D     { 0x80000000,        0x0 },
+    [VIRT_PCIE_MMIO] =3D { 0x2000000000, 0x4000000 },
+    [VIRT_PCIE_PIO] =3D { 0x2010000, 0x40000000 },
+    [VIRT_PCIE_ECAM] =3D { 0x40000000, 0x20000000 },
+
 };
=20
 static uint64_t load_kernel(const char *kernel_filename)
@@ -98,6 +104,37 @@ static hwaddr load_initrd(const char *filename, uint64_=
t mem_size,
     return *start + size;
 }
=20
+#define INTERREUPT_MAP_WIDTH 7
+
+static void create_pcie_irq_map(void *fdt, char *nodename,
+                                uint32_t plic_phandle)
+{
+    int pin;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * INTERREUPT_MAP_WIDTH] =3D { 0 };
+    uint32_t *irq_map =3D full_irq_map;
+
+        for (pin =3D 0; pin < GPEX_NUM_IRQS; pin++) {
+            int irq_nr =3D PCIE_IRQ + (pin % PCI_NUM_PINS);
+            int i;
+
+            uint32_t map[] =3D {
+                0, 0, 0,
+                pin + 1, plic_phandle, 0, irq_nr};
+
+            /* Convert map to big endian */
+            for (i =3D 0; i < INTERREUPT_MAP_WIDTH; i++) {
+                irq_map[i] =3D cpu_to_be32(map[i]);
+            }
+            irq_map +=3D INTERREUPT_MAP_WIDTH;
+        }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
+                     full_irq_map, sizeof(full_irq_map));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
+                           0, 0, 0, 0x7);
+}
+
 static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memma=
p,
     uint64_t mem_size, const char *cmdline)
 {
@@ -233,6 +270,31 @@ static void *create_fdt(RISCVVirtState *s, const struc=
t MemmapEntry *memmap,
         g_free(nodename);
     }
=20
+    nodename =3D g_strdup_printf("/pci@%lx",
+        (long) memmap[VIRT_PCIE_MMIO].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
+    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
+    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                            "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
+                           memmap[VIRT_PCIE_ECAM].base /
+                               PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
+                           0, memmap[VIRT_PCIE_ECAM].size);
+    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
+                           memmap[VIRT_PCIE_PIO].base,
+                               0, memmap[VIRT_PCIE_PIO].size,
+                           0, memmap[VIRT_PCIE_MMIO].base,
+                               0, memmap[VIRT_PCIE_MMIO].size);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle=
);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
+    create_pcie_irq_map(fdt, nodename, plic_phandle);
+
     nodename =3D g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -262,6 +324,47 @@ static void *create_fdt(RISCVVirtState *s, const struc=
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
@@ -384,6 +487,14 @@ static void riscv_virt_board_init(MachineState *machin=
e)
             qdev_get_gpio_in(DEVICE(s->plic), VIRTIO_IRQ + i));
     }
=20
+    gpex_pcie_init(system_memory,
+                         memmap[VIRT_PCIE_MMIO].base,
+                         memmap[VIRT_PCIE_MMIO].size,
+                         memmap[VIRT_PCIE_ECAM].base,
+                         memmap[VIRT_PCIE_ECAM].size,
+                         memmap[VIRT_PCIE_PIO].base,
+                         DEVICE(s->plic), true);
+
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 7cb2742070..dd4feddb42 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -38,14 +38,18 @@ enum {
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
-    VIRTIO_NDEV =3D 0x35
+    PCIE_IRQ =3D 0x20, /* 32 to 35 */
+    VIRTIO_NDEV =3D 0x36
 };
=20
 enum {
--=20
2.19.1


