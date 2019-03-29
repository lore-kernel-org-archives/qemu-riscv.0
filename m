Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11X-0000ts-Sh
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:35:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11G-0000Zd-Mb
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0Ay-0007uJ-Np
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:40:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0Aw-0007t9-Mt; Fri, 29 Mar 2019 18:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899238; x=1585435238;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=TRaVJNiQbb0CrsQH7F8HHPVRuBS0J/goCg5iyU9aYfQ=;
	b=kINQzCcs+XcA9hipoLwMCngMI/f8PUOUdVwLF3yoabB+HParOPAjQJdu
	QRrBF6n3s0KvRToO4JCP1F8fwQL3ykgbJc0zYrSzGHA4hrVsc55DAP0y6
	k7RA+bVpg3EI2EMmKHUZAUcAg5ciJgDOZwkuGlEXnAEqS3MNAXkHMyKpC
	oMvct7DZsDCgMJySZ5MxKF4D0xmTHD58j1j1XtchM7sodUdAlUMh3/GOq
	kPr5ZkSv6vRGOIY2yrzoIzqA8DH1SCJvAi8KPxxeWR+sVzDt52Me8bTdn
	4BwllGnt65QpZE0k1q74katVk06vKpXt7CpeLecH1jMsyWT/cAFXEdFC+ A==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="210282030"
Received: from mail-sn1nam02lp2055.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.55])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:40:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uulSttjDxf4KEla53VGejwEiwWvGiXEU3aCZpU+we0U=;
	b=iX79QAqud/TNmzSaZMqKp5609Y/rELC5RS9hnnOBtyQ8uiLNZuAPw9PzVgMQ2svPuxWl3XD8vHdwYYJJLo2hZEPYgRaOzyfZ7GpamkP/KZiF6aXcvliSnEfOANPrn8fEdtsazZ3jq5Uq7ih9QIE9oxA0QT2/R8mKpSN6PVzCJzA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5272.namprd04.prod.outlook.com (20.178.49.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:40:23 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:40:23 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 6/6] riscv: Add a generic spike machine
Thread-Index: AQHU5oBlttf9H8wu10Ks+Mut4xftWw==
Date: Fri, 29 Mar 2019 22:40:23 +0000
Message-ID: <7f8923d6253cdd16a5b4e78783f934304b4edeab.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR02CA0070.namprd02.prod.outlook.com
	(2603:10b6:a03:54::47) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 038bd1e7-8770-4c2b-0077-08d6b49787bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5272; 
x-ms-traffictypediagnostic: BYAPR04MB5272:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB52721F017705ADC890076033905A0@BYAPR04MB5272.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(72206003)(8676002)(6512007)(25786009)(6506007)(6346003)(102836004)(3846002)(305945005)(478600001)(386003)(99286004)(71200400001)(97736004)(446003)(76176011)(14454004)(52116002)(5660300002)(50226002)(2501003)(71190400001)(256004)(53936002)(118296001)(66066001)(6486002)(36756003)(486006)(86362001)(81156014)(68736007)(81166006)(14444005)(26005)(8936002)(476003)(44832011)(2906002)(110136005)(4326008)(6436002)(7736002)(186003)(2616005)(6116002)(105586002)(54906003)(106356001)(316002)(11346002)(41533002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5272;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /v9x0fIHhBvAjfMawX8KtRx+nDzr1omSZ8Gnq2agfRZ/3/qdumqT+koPCqnjWr94iUpXkarC+amM+IC4dXePtEqInUXtA4yja6xY4gtCpf59t08KVTkb/F9kOMsQsD/K4C89YiK99UX+54Bcs0PUQKTJS/S+DkjHiKbXZGxVlrqREeR4KZKMMYfph6jKMMI8Y75sHm0WQOL4rk1RwAoUwlJZi+cjZhdE8jxVICiLmHms+1cS+xVqzuchpXLa8T+DN0B3kg2MdbZL8RHkie9Tk/V1o0jdmnbv95eUUygCSGx/bXYaJEUHDwZlJGB9YQH5k9dtYph55wQSiloTltgUpF2rwz7n3bFX5Oa1XR4vzqFh6ruFIPiKz3zHVK/uyPKqmrkhGVeV12UNUTeCOxUl+wSt2TInjNKbAHGzy17C1jk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038bd1e7-8770-4c2b-0077-08d6b49787bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:40:23.3129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5272
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v2 6/6] riscv: Add a generic spike
 machine
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
X-List-Received-Date: Fri, 29 Mar 2019 23:34:48 -0000

Add a generic spike machine (not tied to a version) and deprecate the
spike mahines that are tied to a specific version. As we can now specify
the CPU via the command line we no londer need specific versions of the
spike machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2a000a5800..9d3f7cec4d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -39,6 +39,7 @@
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "elf.h"
=20
@@ -160,7 +161,89 @@ static void create_fdt(SpikeState *s, const struct Mem=
mapEntry *memmap,
         qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
- }
+}
+
+static void spike_board_init(MachineState *machine)
+{
+    const struct MemmapEntry *memmap =3D spike_memmap;
+
+    SpikeState *s =3D g_new0(SpikeState, 1);
+    MemoryRegion *system_memory =3D get_system_memory();
+    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
+    MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
+    int i;
+
+    /* Initialize SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
+                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type"=
,
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
+                            &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized",
+                            &error_abort);
+
+    /* register system main memory (actual RAM) */
+    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
+        main_mem);
+
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+
+    /* boot rom */
+    memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
+                           memmap[SPIKE_MROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
+                                mask_rom);
+
+    if (machine->kernel_filename) {
+        load_kernel(machine->kernel_filename);
+    }
+
+    /* reset vector */
+    uint32_t reset_vec[8] =3D {
+        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) *=
/
+        0xf1402573,                  /*     csrr   a0, mhartid  */
+#if defined(TARGET_RISCV32)
+        0x0182a283,                  /*     lw     t0, 24(t0) */
+#elif defined(TARGET_RISCV64)
+        0x0182b283,                  /*     ld     t0, 24(t0) */
+#endif
+        0x00028067,                  /*     jr     t0 */
+        0x00000000,
+        memmap[SPIKE_DRAM].base,     /* start: .dword DRAM_BASE */
+        0x00000000,
+                                     /* dtb: */
+    };
+
+    /* copy in the reset vector in little_endian byte order */
+    for (i =3D 0; i < sizeof(reset_vec) >> 2; i++) {
+        reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
+    }
+    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
+                          memmap[SPIKE_MROM].base, &address_space_memory);
+
+    /* copy in the device tree */
+    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
+            memmap[SPIKE_MROM].size - sizeof(reset_vec)) {
+        error_report("not enough space to store device-tree");
+        exit(1);
+    }
+    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
+    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
+                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
+                          &address_space_memory);
+
+    /* initialize HTIF using symbols found in load_kernel */
+    htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(=
0));
+
+    /* Core Local Interruptor (timer and IPI) */
+    sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size=
,
+        smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+}
=20
 static void spike_v1_10_0_board_init(MachineState *machine)
 {
@@ -172,6 +255,12 @@ static void spike_v1_10_0_board_init(MachineState *mac=
hine)
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     int i;
=20
+    if (!qtest_enabled()) {
+        info_report("The Spike v1.10.0 machine has been depreceated. "
+                    "Please use the deneric spike machine and specify the =
ISA "
+                    "versions using -cpu.");
+    }
+
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
@@ -254,6 +343,12 @@ static void spike_v1_09_1_board_init(MachineState *mac=
hine)
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     int i;
=20
+    if (!qtest_enabled()) {
+        info_report("The Spike v1.09.1 machine has been depreceated. "
+                    "Please use the deneric spike machine and specify the =
ISA "
+                    "versions using -cpu.");
+    }
+
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
@@ -359,8 +454,17 @@ static void spike_v1_10_0_machine_init(MachineClass *m=
c)
     mc->desc =3D "RISC-V Spike Board (Privileged ISA v1.10)";
     mc->init =3D spike_v1_10_0_board_init;
     mc->max_cpus =3D 1;
+}
+
+static void spike_machine_init(MachineClass *mc)
+{
+    mc->desc =3D "RISC-V Spike Board";
+    mc->init =3D spike_board_init;
+    mc->max_cpus =3D 1;
     mc->is_default =3D 1;
+    mc->default_cpu_type =3D SPIKE_V1_10_0_CPU;
 }
=20
 DEFINE_MACHINE("spike_v1.9.1", spike_v1_09_1_machine_init)
 DEFINE_MACHINE("spike_v1.10", spike_v1_10_0_machine_init)
+DEFINE_MACHINE("spike", spike_machine_init)
--=20
2.21.0


