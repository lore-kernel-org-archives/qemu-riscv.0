Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVu4-0005Dl-QW
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:03:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtw-0004sq-In
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtp-0007pW-Lj
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:02:56 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21533)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtl-0007bD-94; Wed, 21 Nov 2018 12:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819765; x=1574355765;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=8eToc+l7a1UdYY4yQAUWHjfHiF8PpPTPWHbrUVhZmnM=;
	b=XL9PWL39YD2/hzkoh8qvra+05MUzuHW+EUW/H35fhnWoLlRMTN+w7BPT
	KmEtM32jZ9WalfNgeSSyURf6IuZUBzPaxcxASItdOCN0bjEa/MlpFSaFO
	b0TYgQvlSia//tifd+ayjWiKlP9i4C4ZvISyh/Gw+67/vjLDMfl0CHNB8
	sxgMQanURqh+Yc7I1tUKf81IgUZIa2J5uSIBAuGr6Rk9qxYi6cgkVheQg
	e/nRMvikONqeN/RFGsZHYwYbSRV9HWO4QhQnoqLzvxc32whg5Q9qO1iUA
	9schvCLE0LGywsTvm2HPDgP1ZszjMoOzq089TmErBOY2cLbf/prOHeGfp w==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="96547363"
Received: from mail-co1nam05lp0080.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([216.32.181.80])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iGfif8BGFsVH46YZN5D3urTN6h79U8PWMGTpqvdy4eM=;
	b=lDn1ED0AS/hekYXim2ZjuJFkQU4c532clAcAkoHgeDwdsklPhL/ykto6U+0JFnj6WarH5Zqt5tktF+gFFxm+Po68fs065CEr5wrbFM2PGvFTHTIYh9BXlJR6u4lBn+OOr1xdvst2trmVTGZNE0i91+4OE6r8I5nYtg85/osQfMU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:02:17 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:17 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 1/6] hw/riscv/virt: Increase the number of
	interrupts
Thread-Index: AQHUgbv1UUmY9RApZkWp4OUt71d3vw==
Date: Wed, 21 Nov 2018 17:02:17 +0000
Message-ID: <a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0061.namprd11.prod.outlook.com
	(2603:10b6:a03:80::38) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:XUzmtHwD18H53SAyaKltjtn7PHP2jD+1fhncwToK2Z2ikD5twXqS3ldZ8oN2FsGwzJ1t+gylkDfhfyD76I/n3EozIDgQHSugzb2kGb1YIMrclJUIDa9T5ZWren1LuuU5kfwW5zs+nSRbIlqgKqBJDDl47zIhzgDbMqnS+pLD22dOKubVt7Wrkht7UT1ulcbp0QFVvLDFGEj0gfkkav0+R+AUt/r+1z110LS5OyyRUNwE3SkQzwr5JPh6Sm5O5ynxTIkkvx7mZC3ozbLEmEizvaUNhtIGkgaAPggLpIDHdNOliZHaoYDn6yg+qS87TAxZ2Mpy0mmMN6V0GkrhayCgklXmfFHE0AT+P+36CPFqxCI7SP5MsmBtVclLjoF8/co6V3AzwsAtSIub6K5b6P2AxD7oUHMSHHEc4v4aZ3R4OCQtbPoDGWBi/B5h0bkOTv2V9+4v1XoHtnzzpiAZZkn5ZQ==;
	5:h5Mx+LWiOxNIrIEzUUTJOAX514QnjznDeyhZOSX3mM1WqWXU4j4G8W4IdzmcQjqYvztYcJzPe61C6/3d2tzq4WJ0kgGUbUefy8L+16jUIAeLorngxI/2OimS85TUo48uf5C9rgf5HLY9scbrKvdDjAC/Vc98zWpwkHoLT5P5n1A=;
	7:uIzasH64H6xrO05fKGWDP1UE8a2ZmvfOR6mU/oAyu/5N+EQPTRN6MhEXkq5EV1Q1erDUK4N+nG0Ts7B/Idm7XzZV4sni+tTmcCsJtBu0pSRGJOOx+795uCnjNdKm9oCSgVlQ1cTTTTKdwwW0cppHsQ==
x-ms-office365-filtering-correlation-id: 73752c8c-7b6f-4b0b-a7ee-08d64fd31776
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12496AE6DA5CFDFAA6EBF1F190DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201703061421075)(201703161042150)(20161123564045)(6042181)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1249; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1249; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(189003)(199004)(36756003)(72206003)(14444005)(97736004)(305945005)(68736007)(2906002)(71200400001)(86362001)(71190400001)(8676002)(7736002)(106356001)(498600001)(105586002)(39060400002)(6512007)(102836004)(3846002)(2900100001)(76176011)(14454004)(25786009)(52116002)(8936002)(118296001)(44832011)(6116002)(186003)(50226002)(6486002)(476003)(66066001)(2616005)(26005)(5660300001)(486006)(2501003)(81156014)(81166006)(4326008)(386003)(6506007)(110136005)(54906003)(256004)(11346002)(99286004)(446003)(6436002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1249;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: a1B8fgq54BjvBRqHPDpNTx9v9nxC9S15ssXEjLn9CI1axvOpkfyU5GOpckJnV/fDLZh/ET93iHpWefwzukfpFpKstN19x6BOLntp4h44lDmZbbLysnN8Jt8OQyNy29vWVXYzTUOrxWNyQw1qn+1cEbg6TCRXfKNfalYaytEZR9A8JhL3xv6DuSEBaj9GtpoJ3K3bnwHfnDrRv8q0yl+pP84H4qRb9jWL3NZb3U6Fh2dWRyOoGyBZLRgBXJhglaeoQaL6uxI+dmtSlwqjzCdOB4xht9ldtMOIkWcUnW80DtSapkmu6l5h3L7y4zOYK9FDGxMhEdk+seuwpIZRHnTOCGvLSBTVj7EQjWc9AeGpzAY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73752c8c-7b6f-4b0b-a7ee-08d64fd31776
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:17.5006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH for-3.2 v7 1/6] hw/riscv/virt: Increase the
 number of interrupts
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:03 -0000

Increase the number of interrupts to match the HiFive Unleashed board.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 91163d6cbf..7cb2742070 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,7 +45,7 @@ enum {
     UART0_IRQ =3D 10,
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
-    VIRTIO_NDEV =3D 10
+    VIRTIO_NDEV =3D 0x35
 };
=20
 enum {
--=20
2.19.1


