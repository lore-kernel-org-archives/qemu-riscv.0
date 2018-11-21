Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVuD-0005Ps-K8
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:03:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu7-0005HF-3d
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu0-0008Cy-G0
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu0-00087a-7X; Wed, 21 Nov 2018 12:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819780; x=1574355780;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=t7b+VELoxNMEjmK4ptBlecX8rpRkfoh/6JGfMY+1low=;
	b=OgKF4sfZvB6EysubSgQv0gvRJF8e4EXdDQFPrSDAs8Uo0PLGJrMKuIhO
	MmYgVtB4xi+xjpa/0asf/w7FTXJk/nmXH02hTnL/1wf8sNb437ZKvu81i
	lK2kfpkmXMETCiZcqyYrKrg5ojYSK6WvjNPzO8bpPZGfeG/bocm6rHoAE
	YC/acTQAZRyRtcoA2t1p5VHn7uISnknwp3I1zyxTl1aKxTSdlmtTMVMxp
	rShTudjviokRxnpOZG/T38LxnPjsiV8DZypq26alERT5zoOXC7506vcdw
	6MKzta0P4zHA08fsDUi/Sj826A00TNFYCDh5OlazpjDQQDvLjVF1lk26e g==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="99635157"
Received: from mail-bn3nam04lp0118.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.118])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QTWlYzlKVIZqZXrEc7IaDwAkSP8xjTnp0bfVdIoT6Qs=;
	b=FFNDIm3seoB0ldH9+L70Pl9YM+5wHILVAUchOouH1dgVd0nsIx673jBLh8PQhPckEjCH56Jrzx492Ju5r63aXn4uUoXn80V9/aaCvDnVADPZZGu0iYZb7lLxMy7jOkIYLSZMZoR4bSNHbqxtZOWiUitQCbTVqJsUioxW04QXcto=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:02:54 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect the Xilinx PCIe
Thread-Index: AQHUgbwLmh5Br8JFYUulQs74tJkUfQ==
Date: Wed, 21 Nov 2018 17:02:54 +0000
Message-ID: <85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0107.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::48) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:xF12KUm6bIocqjq/n60ALeXpPHux0OLdAl/9+GTdrHTOgS/2pJC8H1Az7PVn92LPm9Fkj3MqQb4twtsYJg/VzRe3wyv/iRnD7RYMj1auxfrwTNiBtrpl5Ok4fieF4+rrbtKLIUD4JnlcILOnqysVqTn+if3XJvL3q66TIty0Ql7FNqojeie5ZBNGypkl8v5aoU50zXibSs5K8TGv2EMM/Sd+T1kAm9benM/s5i53JuT93QMc/vyrYlmQ24sOarWk3O0dObuY38Q18jLZS7oAK7igL1EQxKk1YsswaGq5hMNmTMcEIe8f0Z09RpWpCdfENe6XOHrBNOFviEsK3huaaATI0DLLzbeYNh2AI2jeZDjv3GPS/t2dTuaN9jgyzc+f1Cwbf0efbFWF0kB1p/FJevmaSOtl6LXioiXlHVdJ8763/0I89btCItpN2PEwf6OOPdVerKdmL7Jzj5uQ4UW3CA==;
	5:kc0xRQ7sDTl2c4xOIrIooedZMWcLpdD4k4Mz2w4ld6YQZX/VgjjaEh0Rtynv2Bu2/j+4rpOcjXfLR8vnO8QvWRbBl5UBtQzfK3X9/lbkAblYKoAjHZpmh5P1Xm7vDiVItfBL6SuwKYFZdM1H/PXdtRwDHc4Te/k3wPDPPdgAWJw=;
	7:FH8C/Ge45IwOokXZ9FuPjijfyrIVsk0q86fMduDDXLsdBqJj2hIvTXsrzYuXa3eWVhWAZrDslfPc2wAYlXY2j2nwgFkQy/CYjTiFsnQefMNepzxJu455vq+SMnk8Wda+a/pNyT6IXXqsEZ296x6pAw==
x-ms-office365-filtering-correlation-id: a2eca09c-b95f-4c93-3624-08d64fd32dc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1249AB522CDB056A23E98E4A90DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1249; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1249; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(36756003)(72206003)(14444005)(97736004)(305945005)(68736007)(2906002)(71200400001)(86362001)(71190400001)(8676002)(7736002)(106356001)(478600001)(105586002)(39060400002)(6512007)(102836004)(3846002)(2900100001)(76176011)(14454004)(25786009)(52116002)(8936002)(118296001)(44832011)(6116002)(186003)(50226002)(6486002)(476003)(66066001)(316002)(2616005)(26005)(5660300001)(486006)(2501003)(81156014)(81166006)(4326008)(386003)(6506007)(110136005)(54906003)(256004)(11346002)(99286004)(446003)(6436002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1249;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: PUwbFZWC/pO3ttLQ5YQB0fk3nbEbwHx/imaJeBf47wzVzBUYtx4AM9CnAwz+547fjK7adwHHBLL/dVGXK2cBxv8I8vZt3iscxj7kMZLn6HuMgOMf6l9H/fAT9rYXswSGx80g1BWys1gGyLzd00es4KFU7lU5WdOrHtML+mY/fVhNJNzmwONYdf35coHlzi2Ol9vsPxAlGxMvmCdRdeuSpTvD5HDmMPlOgn/GMn671Df03YXZEVflHvDYsvdxNdnbrUuCennBqA1lz+MRzdtGLopsPsfgSEd+jMfI8TZBjfB/V8XLImhXlBJrQU2PkTGHsK3eohWQ0a0et21H3JBDEr5yFr1DjW9w603PZBRs8gI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eca09c-b95f-4c93-3624-08d64fd32dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:54.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect the
 Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:12 -0000

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


