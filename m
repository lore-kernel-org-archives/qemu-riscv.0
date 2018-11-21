Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVuG-0005TZ-4r
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:03:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVuD-0005Ow-Ar
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu8-0000Ei-8O
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:13 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:55621)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu7-0000CO-Rt; Wed, 21 Nov 2018 12:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819787; x=1574355787;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=kgx7RTicYUE0o9usl93YuneSFsOImfdKfU+OZWxoHwU=;
	b=PxGO3Rk47nFfMJ0mQa6CrI7WBjijEvMyteEFWieIS45yITS3QnMmFld1
	/OcwJ4/U0hIvNfmkAfE/OHK8iP2eXopOmFox78qeJ1vc4DIDkaG5PmVMu
	k1+K/PbioTjpoyrkQUrFYiOMas2KghIgLFc6XNqxIkPqnPcN2gbJhPjEB
	XbUZfbwIJb9Fkj2kCvsJpdl1H05Qc7baaAI1Z7Ap5vO6yTDdJ/FKlGYkW
	b4me3a6lb8+nfC9K1RgRQWzoU4KMiUTSYV+EIXHsFl6iGAn6+fAqDo4z3
	PFI/MHleAt0e93jkrnDpI1XK/TVBPyse8xrwcBfCTqDXNywKkg2H8ubK9 g==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="199380026"
Received: from mail-dm3nam03lp0023.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.23])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:03:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K1n5nlduBWaDn/kLUgfbuoedW+C6DTaMt35pJPw1e8A=;
	b=KUgQvG6uaMIvGAmOddw7kMLxfkm3IHSbUUrjbTh+0piZAG5u+BwGaXlwOB11IxogqI0TClr2w0o/WhJnweTi7I1U7s9l6CrYYH1fJKZEDxPYhJIxPoN+fkcHne/Ma4OIWKaABwADLXl6zpGEBuD5UYI+DxQpI1H7mKeL7Eyr+u8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:03:03 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:03:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 6/6] hw/riscv/virt: Connect a VirtIO net PCIe
	device
Thread-Index: AQHUgbwQv55PLCBga0SpfETIjY4+tA==
Date: Wed, 21 Nov 2018 17:03:03 +0000
Message-ID: <44e7883bd17c6867f0ac488bdab6c880b2420a9b.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0002.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::15) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:fCJzaSm3sIeTLVnnVZm09/MuwwaOtnH/YxB+k71g9VXPTV3fsxC4IksfJLQCnbXDiB7IF/uz5qA0NXK9BLgoscBBTuHiF6u7ktR938vXTGruqDHZJazB7sqf+FSm+DVNviWHiF/yQXQRTtwB9Oebpn5oYZDF51wMxTZ+KZ6CqTPRADDtrpAsUgZdjrguN04g+awPFQrzzZCFBtFo/3h+w3t25zLiz+Gmksj5dTOAqhS4uC3MID25tRVDwvthmHjfW7pZ9RJu3wCzzeArTsTmsbOiP+RI4uS42abmBBg5/oM2i0P/caqoC9Nf/aS4j76C1GMlhTwg2tkN4OhfxfqFWeSfV7Cefrx5BnxjRbK6AfQuoAMlu33Wipy9CjLGPnKbCdiqudxqIc0mQ3kWXGaOWHJ/Iti9hSxuN01gUOTEZCk3sAlkb+hQHX28Q31pTx34QunCqyZo0Mc+3j5DIE/JLg==;
	5:ySq4Bc5nbPz3FAQIJftw1r5EfaZS0/IVnpOalz2NQfRMp/kgE5UZEusUTL9r7C2k5HQgfwYDKur7pdMyVJKrjehuJ2Qpt0x+lLrY8WF1A9ZfAUZRXL4c2KUxzbJeKwq/4CHWlTuF34sHA9MQb4boWo+6EphBg3qkpUrBKV80n10=;
	7:rgLukJ2fiwU3DSunQVMCK+RfYgpJ/m5ys0FiL+uQBJP/EzIaYcq49JdjdH559aQ8JZiBxAbWPox8lhgpixDNDeJEdBkQUD9dSw01lwPwGJo+hhDk6k+Yy/sCcFJRurcuhnR/Rb67S5zZojAd2GDdaQ==
x-ms-office365-filtering-correlation-id: 836e4944-1f15-4dd1-5b0b-08d64fd3333c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB124973EDEDC329B02913844C90DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: rx1bIFbmsUM5RxIGE9HwHCgr3ShQq4z96s5JsK0pHckZZELvNtdgb9jw6178HwzbGTosWHTJxoKdcHKsZBLXWtQdcrzSpzEdNgExVAJVArk5AQ8HJPUC3UFQfzeRkPccFXlyQI24V53yvakwMGpoKKbPab+TTj/M3A6U3HYTFy1V43UrLhPQVoiAKnbgzXMM3N16MPerYI9VhvAuH/eQZv7Lut32oUymNnHY4kDV1kAHxAFTUGFPdpnkMTwgjdAwxdg2P2g99det5APx/DQkWCqrY5ulC5JxPeNpFZh/etYDPiFsMtF8zEMS2893cI26NVeSnW629TJeD0WUq+8Cru0UkcYvXU+4fTXXbzOhhQ8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836e4944-1f15-4dd1-5b0b-08d64fd3333c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:03:03.7978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for-3.2 v7 6/6] hw/riscv/virt: Connect a VirtIO
 net PCIe device
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:14 -0000

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
index e7f0716fb6..de6924e1c7 100644
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
@@ -392,6 +393,8 @@ static void riscv_virt_board_init(MachineState *machine=
)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
+    DeviceState *dev;
+    PCIBus *pci_bus;
     char *plic_hart_config;
     size_t plic_hart_config_len;
     int i;
@@ -506,13 +509,24 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
             qdev_get_gpio_in(DEVICE(s->plic), VIRTIO_IRQ + i));
     }
=20
-    gpex_pcie_init(system_memory,
+    dev =3D gpex_pcie_init(system_memory,
                          memmap[VIRT_PCIE_ECAM].base,
                          memmap[VIRT_PCIE_ECAM].size,
                          memmap[VIRT_PCIE_MMIO].base,
                          memmap[VIRT_PCIE_MMIO].size,
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


