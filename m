Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKVkF-00072x-NT
	for mharc-qemu-riscv@gnu.org; Wed, 07 Nov 2018 16:52:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=842139a6e=Alistair.Francis@wdc.com>)
	id 1gKVkE-000725-3R
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=842139a6e=Alistair.Francis@wdc.com>)
	id 1gKVkD-0004TR-6f
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:52:14 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:63397)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=842139a6e=Alistair.Francis@wdc.com>)
	id 1gKVk6-0004Kd-Rz; Wed, 07 Nov 2018 16:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1541627527; x=1573163527;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=0k1J/TAVrTAXhz/FxNOdEdfHxwPw5raBLiKcpq87mVI=;
	b=rsAfQ1Xu/v25iuVdXNKsd6AOiHHNgGS7smrFvC9R4yAcj/pVWTVD64zv
	HAEz9ZM9VkVXT2OiGU2MSOXMko4z80hIxUt04JG2r/kaa2BKHMKEApRf6
	kSyXl4sQ3UFuQtSxqTViBtoQ53bI+uBjo4GAZccSiVcXLnVeVyGa3A8cg
	bGamI6ow3ppSpbdjpDuLJo3M+GU8U/1cpdROCXj/YX6TtIy7QVAj/j/cA
	/EZX2p6M9x3uu9pv/TTpKEfKmWFYN2f/L+mrpRK58N2ciZUsAl0nNGO00
	qmc7+NBG+/0BDxoT7h9FOc+4e9TGY3ZcSkZtR2R7lZoMnRS17/jdLspjx g==;
X-IronPort-AV: E=Sophos;i="5.54,477,1534780800"; d="scan'208";a="93742844"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2018 05:51:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1gN6bQVPgKEeYD+8P6/1p1OXwU+U055HX3e11GHcF9g=;
	b=BlTV/yZN4zF+C9aFdO8vC+SPUTXUCOz3gdCMlrWjtlHZsNnJMAAm+RMjZKJaaTbUykPOxqk10qR7dTCiKKX09jMxfyOmMGXKAYAQZ5wMNEXlumIvhTZ/vrZy7fvAEVFrk/lYS3pznjugXHaz0OcRMgvLsOphuVzuNPpb/ZUKGbk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1264.namprd04.prod.outlook.com (10.174.175.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Wed, 7 Nov 2018 21:51:46 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.034;
	Wed, 7 Nov 2018 21:51:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "palmer@sifive.com" <palmer@sifive.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the test device tree
	node name
Thread-Index: AQHUduQTe0LNJSJeB0KufUFeW8U+lQ==
Date: Wed, 7 Nov 2018 21:51:45 +0000
Message-ID: <1793576616012e06e68cd9e0215eb907ff2ef12b.1541627403.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0075.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::16) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1264;
	6:Va8dYGrrtdCHC84p2v+NMV3LOkT9PHWtg0/84lPDSIf+4+3LNZad5CLVJY0R8Xd2HhDhpWMMEqXHZ8HhCFRCHW1BWHLzSoFG2bDiLmbEi/PZx4NhGqeKhfpdhaVLx9/sIj++/0eC6TOfeioXv1AzA/NtkmDZpTc/CJBsXGCiLrqFUhef12O0rRV6JuEkLotywDORqdcGE4lzAuYwV1xnHGG57yqemm+78/hQWFypBm8M62nmFhLil2P4O1T8LGFpIajzs+njLIJKDwsCGuXx1OI15uwVv6R8WBrOcLupPGmksh9m+6D3H7WgSpCvcVUYbo930uD8mJ1zbLVLpfvUtmU8l6WirMZlV4l3Zt+rpzIC85fwFLYN6cRXCftxVTS7ElkPeQEx/ISxBbFcNneKLHdv5+t5Zv2tM2HYic2fuXnaqx0CCyi+l22P+t/4ySCjn1N/jVLdSLmfEAv8UZQ2Gg==;
	5:8GtNCzo1YnythsQTJot6i0U4i50OBGg2dgXJgb5EWV0QKeb/4o1LHbxh+L8BH/20t9dtLJ8YJ64jYFv+lbPjpwVsr2nPniVPuB4QxtACTAgL2kTxkAqYQx8ij3fOKRHNeM54r2h5W2CQuBcBFjcNVgNKOlWtlMom9c3SDI52aOo=;
	7:7NTkwdvAvsYwDEo8rLDgpykBsvDG5mIaUmw34sVvETuPNZ4XsvVbyNZzF7qySgKH0tsamDCinUVo5FVKFzSGqftKQkIxrDrySKt1KNf0GOMf4ZGieY7Nb3Y49YXHBQ1HTDBhz3ybCmC6wJFkKM4x0Q==
x-ms-office365-filtering-correlation-id: 6fcb7913-5788-4286-809b-08d644fb361f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1264; 
x-ms-traffictypediagnostic: MWHPR04MB1264:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1264DCEAC7149169C822944790C40@MWHPR04MB1264.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1264; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1264; 
x-forefront-prvs: 08497C3D99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(8676002)(105586002)(81166006)(81156014)(5660300001)(44832011)(4326008)(66066001)(72206003)(25786009)(118296001)(478600001)(102836004)(26005)(386003)(6506007)(2900100001)(186003)(7736002)(476003)(486006)(39060400002)(99286004)(36756003)(52116002)(97736004)(8936002)(2616005)(71190400001)(71200400001)(6436002)(110136005)(6486002)(2906002)(3846002)(6116002)(54906003)(305945005)(68736007)(50226002)(6512007)(86362001)(316002)(2201001)(106356001)(256004)(53936002)(2501003)(14454004)(20703003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1264;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: EaJ4g76+EykbdVT4pNrbDAWVRMnbIiKmAFchM7ObYBqeWVQDuvvm6UnDoSri4dwYidjwo6jPDGfPBx2j3/WsxmyvcUk0gfAzia5VErEltsK1HTMmt5NBE6MLdit4I/xfsPIb2TOVVqEnQl16/S/MxSQNxeIaE0EnsUjqUZvMDyjV60k8z4eE3NfgVxiMVHGaHpLkkU3Et6TpOieSe7b1DTSQ0j/3YR3OD1+VVrhlDyXjycMLO3i01Ez14aFbHPMhzwOvue/2596Bv/RQfg3r3fk8whaqkWvNvlb3PkBQPX2rQT9eryaWpkOFF9MiAYL4CPde+PYdLXTiJqzrEaXIUpmFR2M1zWD5SV41KtyrrDQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcb7913-5788-4286-809b-08d644fb361f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2018 21:51:46.0052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1264
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the test
 device tree node name
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
X-List-Received-Date: Wed, 07 Nov 2018 21:52:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a137a503c..2b38f89070 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct=
 MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
+    g_free(nodename);
=20
     nodename =3D g_strdup_printf("/uart@%lx",
         (long)memmap[VIRT_UART0].base);
--=20
2.19.1


