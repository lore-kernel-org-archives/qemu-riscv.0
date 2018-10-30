Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPK-0004iB-U3
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLk-0001Jj-Gq
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLg-0003cQ-9S
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:19:00 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:16020)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLX-0003Fx-6d; Tue, 30 Oct 2018 18:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937927; x=1572473927;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=donA53d0p3OpDTi6w4oZP53JAt0DC3Mhu8IGRxuY/eQ=;
	b=Bq1h0X6Bsd9CO6n69R5xNXvQTHBwBR1PG7jLQtP5VwDuYF3rzDFCtc7P
	qS/JIjKj/fe1Vhqz05ty0bqLu+vtVAl2q3/Y5S+3aNL5oyaEyd3xZ5EM3
	R3a2BYVs2Cl01P/UC0jlPw918E/JGaS5Q1nE8zVPmQD1M/TjvszMEUW12
	zuFv2/Hlfn/YxqIQeyGUjJysusd5JT23Yvjyt5bgH/Nw4XbPkfR1KjQl9
	1Bl7REkhO3q34P/vhLtOFHaqAfyC04vpzQEI/k8Z8rwtbZTWiCm5Fj7IG
	iCJ1rL8MmqDun4iuHEmZUU2ZKoDjjNZ9Qz52sc2PY1iWvb9F7CSbUc319 w==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="97857012"
Received: from mail-by2nam01lp0176.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.176])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:18:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zPjk8x4QDI+qcywMjmTThUDDzQJ1TLd9lUWqFfEHJI4=;
	b=KG4cRZ3fj+FAEr4nI2skqKmz1nIDj2Ki/wSRPBAnkmtWEO94SYyc9+svVmU7spHop5UoStarq41eMpeQq2AtBucDPoS4pE5ipep1rzI0PAvHk4r3IZTtD8lsXQQ15PgW8gmqy+kA3kDZbFxngRfgSmnO90cvKs0XRx5W5/KIfFk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.25; Tue, 30 Oct 2018 22:18:27 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:18:27 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 5/5] hw/riscv/virt: Connect a VirtIO net PCIe device
Thread-Index: AQHUcJ56LxxTgNocSEu0BmtNyC7OnQ==
Date: Tue, 30 Oct 2018 22:18:27 +0000
Message-ID: <f5b4c9a7b35be2a4c1f9e7b0bb8d7403bb43bd0c.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0033.namprd04.prod.outlook.com
	(2603:10b6:a03:40::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0976;
	6:MLEFVuJ9D5cSmOB5b8NvP2UVIVi5Ypp013c/orjpBm4YJ50q9lVl5FxyqL5aiAX2Q/zUQ3T+g3mUv6q0Y27+CJrkPwA34LqKXqADmMTn3gmpDVOMvkUlPndYkV6lW7g05yQnuuwgg4mujHw2463F6s/3W1J94a7g5QiEjNh45pKu4DSsYyvvWQo9GicIkclf7XzcZ1WD2wqTXKCsNgne+o0O4LXU2UMpEogN9j73UVTsExIErP7Dt8LVFzhq4RmSXkiPDvZAOXjkvuAYunnhgUw9lH+EMdrVgLB4qgETMifYO37ODyzjIsgJchow8NP9guEWTX4X2HUF8agQqoJpP+CKLsOEmVx/Fo9kMl6W8j24CeRxKvQ/7uwcoGLeVhj2I01DV8lAo39KqsGgnjGrIgm4VE1kJjNi4XRzg83r7nPuoD6NE1/SoqIh9BFsjIzry6GLAb8oMTRvclTvygZp9A==;
	5:DAmxls1sTk17GemH/5PnEtA+1jVjP5pfdgwDv4UB+q6Ea86wT5ShiWqgva+vEebQprLP3Zxj6snUzmFf/W0SWK09nHyiXYyI0rNQqCO7XZexa21oLwaEkL0dM+ZgmF/lxjNzN/7d5Ub2G4I5O8mDI/nwuMpIGyEEalykE65UQgA=;
	7:MhMhPI5rIlrfgXuVFNvfxrhlfqw92UHgGFzTXonN3v/wX3uUPJ2Al0nHVT4TM0sFqkAfNdWJnBqS288UgKol9iLv+7TL6NvZUabuo69sZbkv9/b/zM+Qcj9FxJ2aqg1q4+z2gB8U96y+hOQ6pkROAg==
x-ms-office365-filtering-correlation-id: b518bdef-3e15-4bd1-1693-08d63eb59d4c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0976; 
x-ms-traffictypediagnostic: MWHPR04MB0976:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09762423981A3827D3FDCB1690CC0@MWHPR04MB0976.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: RF9rPQC031/SliTgfnIHGDrgHY/5/Phe9edjglZMI/iFKQEIYzXD4pCu4LP6f+PSBc70Z1LLrS3avUWABNLdTP7VRtHThO53nKUJnNYVcev6lKlLAmvL5WJCzKEpci+DBXpJogeWO4lXwOVPkq0mLA8RbxwltGgOYth6eHftYSqevg74mS5VgjZajR+i/PMcJzy5ue7qNKzQ3cEk2MZmksdK2xTJqA+5ndmQU2J3AxBtVvrT8SAx8PIKugTFeBX/pd5G4bgQ8+3MeE99GlpTyByvFFtFAC5RTZqEV6g7VX9Mikhl17MtRL+diregKD9zL5mdEzdlcpwc+H4EEXkeHlFjCszAnvocW4NNIeaRO5E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b518bdef-3e15-4bd1-1693-08d63eb59d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:18:27.2138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0976
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 5/5] hw/riscv/virt: Connect a VirtIO net
 PCIe device
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/riscv32-softmmu.mak |  1 +
 default-configs/riscv64-softmmu.mak |  1 +
 hw/riscv/virt.c                     | 16 +++++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index 05fae82f1b..bb3dd34606 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -9,6 +9,7 @@ CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
 CONFIG_PCI_XILINX=3Dy
+CONFIG_VIRTIO_PCI=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_VGA_PCI=3Dy
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-=
softmmu.mak
index 05fae82f1b..bb3dd34606 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -9,6 +9,7 @@ CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
 CONFIG_PCI_XILINX=3Dy
+CONFIG_VIRTIO_PCI=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_VGA_PCI=3Dy
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2fbe58ba4b..920ca4e489 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -36,6 +36,7 @@
 #include "hw/riscv/sifive_test.h"
 #include "hw/riscv/virt.h"
 #include "chardev/char.h"
+#include "net/net.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "exec/address-spaces.h"
@@ -373,6 +374,8 @@ static void riscv_virt_board_init(MachineState *machine=
)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
+    DeviceState *dev;
+    PCIBus *pci_bus;
     char *plic_hart_config;
     size_t plic_hart_config_len;
     int i;
@@ -487,13 +490,24 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
             qdev_get_gpio_in(DEVICE(s->plic), VIRTIO_IRQ + i));
     }
=20
-    gpex_pcie_init(system_memory,
+    dev =3D gpex_pcie_init(system_memory,
                          memmap[VIRT_PCIE_MMIO].base,
                          memmap[VIRT_PCIE_MMIO].size,
                          memmap[VIRT_PCIE_ECAM].base,
                          memmap[VIRT_PCIE_ECAM].size,
                          memmap[VIRT_PCIE_PIO].base,
                          DEVICE(s->plic), true);
+    pci_bus =3D PCI_HOST_BRIDGE(dev)->bus;
+
+    for (i =3D 0; i < nb_nics; i++) {
+        NICInfo *nd =3D &nd_table[i];
+
+        if (!nd->model) {
+            nd->model =3D g_strdup("virtio");
+        }
+
+        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+    }
=20
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
--=20
2.19.1


