Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqfD-0006PP-7B
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:38:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqf7-0006N6-HM
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqf6-0006hE-Ou
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:57 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqf0-0006Zk-JY; Tue, 11 Dec 2018 17:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544567871; x=1576103871;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=NWU584To5ANJKVal7RSzaotgKjo8EEfCqELWBY2aIy8=;
	b=HCMA0TqWcJ7DRDELftXGvwHJmDNfNe2tSOYUWT7L1GPTrrYyVdHc/SKr
	P04Ys2Nm+RfwcA/Bhe6/9Fq8zL/jqGUxUgyHvmyyv7IIYYac4jF39IBev
	l/tRne4P4q8ANLl8jbGgCPsAuVZK89SAVU2nBoUn2NwIkW7SOcB5sw0qc
	KACtyOoo/SJXVFiIrNvb+6QWB9qf9ISb9jdxzDwCTqIWqcXZehtKoPC8J
	kQBCNyecRkcA220mhRB9D58IgdHjnzYINGk9tYGMvg0wKlBVNxJDxOnLd
	2eSAIDdcTJVR4wUDUSXRgaGeimv35sIkw6liqvgLXkfG83BJHEASRnyOa A==;
X-IronPort-AV: E=Sophos;i="5.56,343,1539619200"; d="scan'208";a="96357267"
Received: from mail-dm3nam03lp2054.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.54])
	by ob1.hgst.iphmx.com with ESMTP; 12 Dec 2018 06:37:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NWU584To5ANJKVal7RSzaotgKjo8EEfCqELWBY2aIy8=;
	b=aRKKVXS4izRlyaVkwRRkr/Wi4LVs6JKgtvgdGoMVQEWy9cyo4ssC9RsH3BRBEPthXn7zbgecV0+jzWfn6reAzrPR0TwezVEMFNAHrocdXycH05YOFoispwfrZyF+P98E4Jhj5DBVFdIZj85rdwUs9BezwTEr3YSR/tDMouFG5V4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0608.namprd04.prod.outlook.com (10.173.49.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.22; Tue, 11 Dec 2018 22:37:46 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Tue, 11 Dec 2018 22:37:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "stephen@eideticom.com" <stephen@eideticom.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v8 4/4] riscv: Enable VGA and PCIE_VGA
Thread-Index: AQHUkaIjHFlr/U6MGUiDwS9OQG5OFg==
Date: Tue, 11 Dec 2018 22:37:46 +0000
Message-ID: <d537d6d4bbe59fcb36fcab3280fdad4fbff7aa15.1544567709.git.alistair.francis@wdc.com>
References: <cover.1544567709.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544567709.git.alistair.francis@wdc.com>
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
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0608;
	6:wENYpgVZi7tgEffGfkyhU3mVU9MHlIMv3P+kErviiv+xr0e4nf5PlQUu+wlKvU4B1Gn7J53g6cC+heYaH2rzr4u6QtI5PKIcglyK37iXZ2LxvkrkyJJh6L5FWCxC3sHUx4GAaS66lsf7SwutJ6ka6bu1+c4aQKN67cA6gMAYyCY9+QQ5W1V8UiUFIoN9M3iqZhg35bv3ng3FpTogqLY1t6MT1DhMAJBJ0BOdRM9ID/VMTScrGJdHSUdKKZw6AUncDx8921ujGAuWmupEi6g+jTUkXh153EP/vpduCOAsu3+zPSG5PgLT2ClDvujQN7Z/HPGTuPPgeSmzwQBL0LCfdACexBbu3x/NZ8jsk6r7lu7sDsW3hLxtvvMSiLMeLwKErItx08Kbirb6olW1UtFL020rT9D8nCQbie4DPKcYyVTu8gx1dTQJjqO3BpiHL8RVIKVr7KUK4ioePU6R2EoJwA==;
	5:jid/8BVPVlm4kDTv0yhna2jUDDNnpp8vL3GhqlPdPLBsnurV4+B4fCvZZ6YIAz5lx0N44dEMzbqZGTP58XMXTuJQeg7UoJcTm0MZQGJ8r3OtK6dLz5lMDqexTigYcnsse6iCv0xRS2E2e9k68mhkwBM9jNMQ2gyGBgJLL8WSSBw=;
	7:rKjmIQ6cMju0PQ+aL8uOQwqt3IJUBE88xY0vWHHadDJZJkw6z642gmfsPn4+Y+2KKplE1Bogc+LGbZw5dB1Zv7reh148ftZturpR2RdGTL5A9XQyGEk0pG8xV03F/GpLDLQfuZGD89fUWJvqewCMgQ==
x-ms-office365-filtering-correlation-id: e7b7a532-ae34-4b30-707c-08d65fb9458f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0608; 
x-ms-traffictypediagnostic: MWHPR04MB0608:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB060814E894D7A260B807467990A60@MWHPR04MB0608.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231472)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0608; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0608; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(446003)(11346002)(7736002)(54906003)(486006)(86362001)(81166006)(8936002)(81156014)(36756003)(118296001)(476003)(478600001)(8676002)(76176011)(52116002)(2906002)(44832011)(14454004)(25786009)(4326008)(2616005)(99286004)(3846002)(66066001)(6116002)(2501003)(50226002)(110136005)(102836004)(305945005)(186003)(6436002)(26005)(6506007)(72206003)(106356001)(256004)(68736007)(6486002)(5660300001)(53936002)(71200400001)(97736004)(71190400001)(105586002)(6512007)(386003)(39060400002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0608;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: ccMduK0QvyffGcnddLOG49GYlpSMF7XEVUWGhaUt7owIrG3ip3Ioqq94IO5QyCMzZqkbQNHhn+9o0eoH8Nbi35uw9VWiSMXzMVygT/i9bs7BCgCi/u0ozUj1jcPKm+Un7WmehjzXFcgfOd2+xyLUFzdfOEMgGX9hU7uDQtoOIxVYa+exvaueTwd8yWcSYt/ofc3WIKhBGJQMuSlAmMEwHyQttMSz0jowwKDmorFZdVMaMRs1CDx5M0eAF8om86a997HtcEttUsrXeAi0fwKhBHOwevnWTSD7su8F+vkxpDtCQUm9ZUtOD4ksl4VuRyOX
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b7a532-ae34-4b30-707c-08d65fb9458f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 22:37:46.2777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0608
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v8 4/4] riscv: Enable VGA and PCIE_VGA
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
X-List-Received-Date: Tue, 11 Dec 2018 22:38:01 -0000

Enable compile support for VGA devices. This allows the user to conenct
a display by adding '-device bochs-display -display sdl' to their
command line argument.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Tested-by: Andrea Bolognani <abologna@redhat.com>
---
 default-configs/riscv32-softmmu.mak | 3 +++
 default-configs/riscv64-softmmu.mak | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index c5ea36cba5..dbc9398284 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -8,3 +8,6 @@ CONFIG_VIRTIO_MMIO=3Dy
 CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
+
+CONFIG_VGA=3Dy
+CONFIG_VGA_PCI=3Dy
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-=
softmmu.mak
index c5ea36cba5..dbc9398284 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -8,3 +8,6 @@ CONFIG_VIRTIO_MMIO=3Dy
 CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
+
+CONFIG_VGA=3Dy
+CONFIG_VGA_PCI=3Dy
--=20
2.19.1


