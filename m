Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPL-0004jN-6P
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLk-0001Jl-Ie
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLf-0003c5-PQ
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:19:00 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLV-00031t-Fz; Tue, 30 Oct 2018 18:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937925; x=1572473925;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=t7b+VELoxNMEjmK4ptBlecX8rpRkfoh/6JGfMY+1low=;
	b=K1C33KvkTC7SntqLs93+y0R57cU5tJbp2dMIBSLeAZXJG0CdF7v6l5Uk
	xgFtFBBiQRF3sAO1YhHpuhWHX+JLOWix+A9eriqC/tqClOmLhw5SYpsp2
	T66pyT1L6wiSyfukZOtd8cseXbU+PIth2j5eixP19dwkGl2DzhWovAKt6
	6QCtYtWovdnwK2QEXVZYUojVoq7YaP7VVWj6cZ6afTZDYAZyjt62BpLvf
	/jB0itZvmJIq/vMHnhY4puZCTrg+TaHW0xwM1O/1qKCaO0qNq0PXbi894
	slTsU1aJzngCZEhQagacZ9nU+6VhJtsjKxzSC138s7SVlUz+kF3n0JiaN A==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="97856994"
Received: from mail-by2nam01lp0175.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.175])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:18:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QTWlYzlKVIZqZXrEc7IaDwAkSP8xjTnp0bfVdIoT6Qs=;
	b=OkxAFaM1spMqOGpCzfYRlBOSQmo9IWLhG7/ySxJJNt8xIaj3C9LquzvzvspfQAFBQuJ+zMdYy4BbkZMVeRHyrlh9ErccOyJRPRHY0925A15Ylza761KElYPxULt7dvn6DP8FKwEP8r4Pv0gk0sf0mJ2Zdt1+uQT3Riv3/e0RqQI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.25; Tue, 30 Oct 2018 22:18:18 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:18:18 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 4/5] hw/riscv/sifive_u: Connect the Xilinx PCIe
Thread-Index: AQHUcJ517A5XNpjliU2rfdW3b/nlFQ==
Date: Tue, 30 Oct 2018 22:18:18 +0000
Message-ID: <27888cbc7494b9e496716b3b055f0d72c93e42e5.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0014.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::27) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0976;
	6:vMKzTFLMzdO9JECxXJPuZM3j3jDGklIL31Ty9lfScQaPm0sZ1zmYA+UQgc/R2bMyf42y2sKrGxnqvLu6GPAzePnKSgecNoHZue7R91685z6dHAq8Jg1cdmbvewpDL51151JFGdGfkbptoN9nFhOCxoGbiZbU9aRI0YjJH/fX+Rq00V4R6liW2fzYTnLCeFNMNgproctwnTTKkadSeZqED+QJ5BBQz4iuhu+4IUdpEXJPVl/Ps63sC41OEU1EVYSBATD55/q1YFGVTbIcYyrM22dD+Y2qnCzZugOXrnVbgbouyH9Hsr6Ndp54YYTO7jwER87XpmF3n5jK+Y8r1UWFUIWxP42bQLLRkAS4vroJxJ/udgRsfH9oB3hMQRuMYx+Zw0CzC0V5ZHIwmEYr3iSMAN7KiX+tiVeVEfjywUSeITbefkZJdhsv+gDxpJj/qYQN13mw8x8RnOUmr5MegNYekg==;
	5:3Qg8W3OzIQywAdOSJRT/9LiOhMXEL0cQxP3j4zAHc6+LpdgY4b3IyWQsyNY5uKnPjnzo0J0HCJHx2s4EF9F3KmYT00fkDuCcZkBlV2VtXnDyLl56CT4RBMZsE40MgwePxHsD9Dbot5VyneAi2vEQI4ICSfsKdxb9ePLw/gSX2v4=;
	7:7pVRNT6bSPC1ym/XCWBqHjc3DpsR77x3wtnBo3ZWCbC5W9q7A47mQebJmQ+85/ILuqlVcpnla/dhEOrEWm9VC3aDkuaBCjICngQay8wpdCQ9SLF6joKU7n+50F5PxIcUbMwjLenOIRhI5E9QqcEP2g==
x-ms-office365-filtering-correlation-id: c99f0876-e0aa-484a-dbed-08d63eb597d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0976; 
x-ms-traffictypediagnostic: MWHPR04MB0976:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0976374C18005A14C35CBFC990CC0@MWHPR04MB0976.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0976; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0976; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(97736004)(52116002)(486006)(6506007)(25786009)(26005)(76176011)(102836004)(386003)(4326008)(14444005)(99286004)(68736007)(72206003)(256004)(14454004)(7736002)(81166006)(8676002)(305945005)(110136005)(5250100002)(2501003)(2900100001)(54906003)(6436002)(6512007)(316002)(53936002)(6486002)(50226002)(71190400001)(5660300001)(118296001)(36756003)(106356001)(66066001)(105586002)(81156014)(86362001)(71200400001)(186003)(446003)(8936002)(39060400002)(44832011)(478600001)(2616005)(11346002)(6116002)(3846002)(2906002)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0976;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 9hxkgmZYoUmisMhE8S9D7ZxbB1Iwf+JqfdNK3Y3CviPc2pUQt8iX/HPuIfAkoB19+NU/RcKcVnfYeMdAhX8TnpRTEe6oy9gVc2cznQQZZbkROgHB4BquBGOj5L9GXdnpJ8yROeP7+WuOZFB9EwoAq8MY3ATvk7q9kIvCE9xAa3jmORIVMshwh4/nv23YsTu4HpdcesCTE1uJNJr4Wkb++LuxhJGdhmxJDPFDcdwEHssSYIjmCyT61BR/7hcHCJoUBKbM79p7WxA0g/6XibUVfBI7tUjk/BGxviYYvX/ICC7qoqajNz02AkIXcfCKo0xuder7Wfs5mv2l+9YK0Dp5BXkMFWu3E9jlWT0bi0P03Ms=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99f0876-e0aa-484a-dbed-08d63eb597d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:18:18.1743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0976
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 4/5] hw/riscv/sifive_u: Connect the Xilinx
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
X-List-Received-Date: Tue, 30 Oct 2018 22:19:05 -0000

Connect the Xilinx PCIe device based on the information in the device
tree stored in the ROM of the HiFish Unleashed board.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c         | 64 +++++++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  4 ++-
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df2442..0c51c61082 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -45,6 +45,8 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "exec/address-spaces.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/xilinx-pcie.h"
 #include "elf.h"
=20
 #include <libfdt.h>
@@ -61,6 +63,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_UART1] =3D    { 0x10023000,     0x1000 },
     [SIFIVE_U_DRAM] =3D     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =3D      { 0x100900FC,     0x2000 },
+    [SIFIVE_U_PCIE] =3D     { 0x2000000000, 0x4000000 },
 };
=20
 #define GEM_REVISION        0x10070109
@@ -218,6 +221,32 @@ static void create_fdt(SiFiveUState *s, const struct M=
emmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x0);
     g_free(nodename);
=20
+    nodename =3D g_strdup_printf("/pci@%lx",
+        (long) memmap[SIFIVE_U_PCIE].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
+    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
+    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                            "xlnx,axi-pcie-host-1.00.a");
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0x0, 0x0,
+                           memmap[SIFIVE_U_PCIE].size);
+    qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
+    qemu_fdt_setprop_cells(fdt, nodename, "ranges", 0x2000000, 0x0,
+                           0x40000000, 0x0, 0x40000000, 0x0, 0x20000000);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle=
);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_PCIE_IRQ)=
;
+    g_free(nodename);
+
+    nodename =3D g_strdup_printf("/pci@%lx/interrupt-controller",
+            (long) memmap[SIFIVE_U_PCIE].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x00);
+    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
+    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+    g_free(nodename);
+
     nodename =3D g_strdup_printf("/soc/uart@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -236,6 +265,37 @@ static void create_fdt(SiFiveUState *s, const struct M=
emmapEntry *memmap,
     g_free(nodename);
 }
=20
+static inline DeviceState *
+xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
+                 hwaddr cfg_base, uint64_t cfg_size,
+                 hwaddr mmio_base, uint64_t mmio_size,
+                 qemu_irq irq, bool link_up)
+{
+    DeviceState *dev;
+    MemoryRegion *cfg, *mmio;
+
+    dev =3D qdev_create(NULL, TYPE_XILINX_PCIE_HOST);
+
+    qdev_prop_set_uint32(dev, "bus_nr", bus_nr);
+    qdev_prop_set_uint64(dev, "cfg_base", cfg_base);
+    qdev_prop_set_uint64(dev, "cfg_size", cfg_size);
+    qdev_prop_set_uint64(dev, "mmio_base", mmio_base);
+    qdev_prop_set_uint64(dev, "mmio_size", mmio_size);
+    qdev_prop_set_bit(dev, "link_up", link_up);
+
+    qdev_init_nofail(dev);
+
+    cfg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_add_subregion_overlap(sys_mem, cfg_base, cfg, 0);
+
+    mmio =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_add_subregion_overlap(sys_mem, 0, mmio, 0);
+
+    qdev_connect_gpio_out_named(dev, "interrupt_out", 0, irq);
+
+    return dev;
+}
+
 static void riscv_sifive_u_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap =3D sifive_u_memmap;
@@ -375,6 +435,10 @@ static void riscv_sifive_u_soc_realize(DeviceState *de=
v, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem), 0, memmap[SIFIVE_U_GEM].base)=
;
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        plic_gpios[SIFIVE_U_GEM_IRQ]);
+
+    xilinx_pcie_init(system_memory, 0, memmap[SIFIVE_U_PCIE].base,
+                     memmap[SIFIVE_U_PCIE].size, 0x40000000, 0x20000000,
+                     qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_PCIE_IRQ),=
 true);
 }
=20
 static void riscv_sifive_u_machine_init(MachineClass *mc)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e8b4d9ffa3..e7292ea83b 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -53,12 +53,14 @@ enum {
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
     SIFIVE_U_DRAM,
-    SIFIVE_U_GEM
+    SIFIVE_U_GEM,
+    SIFIVE_U_PCIE
 };
=20
 enum {
     SIFIVE_U_UART0_IRQ =3D 3,
     SIFIVE_U_UART1_IRQ =3D 4,
+    SIFIVE_U_PCIE_IRQ =3D 0x20,
     SIFIVE_U_GEM_IRQ =3D 0x35
 };
=20
--=20
2.19.1


