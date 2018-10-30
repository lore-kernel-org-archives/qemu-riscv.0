Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPK-0004d4-3J
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKm-0000ks-H3
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKk-0002dn-8G
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:17:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:24949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKf-0002Wl-G6; Tue, 30 Oct 2018 18:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937874; x=1572473874;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=8eToc+l7a1UdYY4yQAUWHjfHiF8PpPTPWHbrUVhZmnM=;
	b=JEMWvOur+jGe0eSE4vxcQGh1WsVItaOYIxkDZ/dsjd4uVvJQd3mW5tWu
	0LpQMNf1ayqEZRP2fKT9a5KBTiF3xTuw/mmmzzuNNCEevUNrh//L0TZ01
	L/yJuOTqJkWChR0djJnXi/aSR2LuV792xjzZKdmS2DB+8ILrBCWKXKA60
	PZToLTW0SqpgNuArehawHzkCrcG/XCkrK6ccjjPuKvKi6scysW03grQwe
	p2fmFMZIbOL8ptecdIIUhDmcQf/xrGUndvQ/1I3zkcWiqBx+ZwDA3Vqd7
	jst+sgXsDgclydsBxHpkO7OtLVBUmmxXwb8lSpYGxoCGlmGXvUZFr3nqU Q==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="94266053"
Received: from mail-sn1nam02lp0016.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.16])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:17:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iGfif8BGFsVH46YZN5D3urTN6h79U8PWMGTpqvdy4eM=;
	b=mpzf03qXVRPmAjQiXJKk8EImaM+7BH3pjDkVm9Qh67doUiDB5qlaCEm5lqQDvdQxDERouhkTAGSifN4sLlWO8U/bW0jBR2BTQaYIvw5qvWkWITi7oJlogU61U4EcYkH7o9AZF8Mb5tBy+KtUDccVB3X3r/MAe5KV1POXziJbJGU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0239.namprd04.prod.outlook.com (10.169.202.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Tue, 30 Oct 2018 22:17:50 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:17:50 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 1/5] hw/riscv/virt: Increase the number of interrupts
Thread-Index: AQHUcJ5kAYAnI69bTk6zL4jgQ2Dn6w==
Date: Tue, 30 Oct 2018 22:17:50 +0000
Message-ID: <eec5d3aa1a28b7982e70610b0036862b788cabe2.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0050.namprd07.prod.outlook.com
	(2603:10b6:a03:60::27) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0239;
	6:6/qHM0ZLYj4mN9qf0kL9M+TOswNzar//SlIYkBM0oANwAgSFj4saHS17pCf47M7aLX8Op8f1fKim798ugVqQAZVXeZY+DhPynL43FSqgiWJJxfhEtHzMaQA0+1k/3aFWCr8Dja69QAn4hvCZ6rHE2HXkMyrUuPTL0/+PHe4lx+fBZbodLqXU4KZRfV/GDffAdJ3+KTCZoxCKtI7YA+pMmzb5hopIYZvkzoLS/qVvhC3IcOCEicb9HokNVkISbX5+11vXHTw2gJu1aLg2kHW9QrdRB7IzlzadKgxCja5OtdR7G/FHQqyUQd6jo59kxL/OGbgRiYmNVMurxWssQ8g2Z7FoEBvAiT/Fpia1tP0EQEuqx6XuHC5TeBFJRPl5xDkbq+zOVSV0RHmEmcNKooyoEqHFlwaX6IJMilE60fDvBLbnyAsAq+BoZObC+BPV+NWDEeLvkum5Q/XQuEeBhnMp2g==;
	5:VkexXCVNQvkMNYwu7TlQP/msSpzgIsps5cfgB1fQxPGnyKjnvzUUUFxqM0gyyE1ipsbQcpyWd6DVKYDoQA+8/5HRLbrxYlPRqN6gGAyrJMUrA6TDqJp46x35+lLtsAvBttqyPObyyFU5IvYIdpziXldEJBOjVgWXtC8WQhJwWgY=;
	7:py9cBxqD7URsidJ/EF/N9JHp8E8zah54rjWWzGAVGwTaZVgkVVh9ywqGb7cYqzjqPfQVZK6/MUh3wjFr7M6XikjoRqPvAvIcOccnSxpBDRVHZvKv3opTuAT6rY7zE7oGnUqc1y6Oo3Qeb+CIyP6A5g==
x-ms-office365-filtering-correlation-id: 5533e2e4-cb30-4dc0-f05c-08d63eb58739
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0239; 
x-ms-traffictypediagnostic: MWHPR04MB0239:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0239322BE58F450D64F8874190CC0@MWHPR04MB0239.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0239; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0239; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(2501003)(53936002)(71200400001)(105586002)(54906003)(97736004)(26005)(102836004)(6116002)(110136005)(36756003)(5250100002)(50226002)(305945005)(86362001)(106356001)(186003)(316002)(7736002)(8936002)(71190400001)(386003)(6506007)(39060400002)(44832011)(72206003)(66066001)(14444005)(486006)(8676002)(14454004)(118296001)(25786009)(76176011)(476003)(256004)(6512007)(4326008)(52116002)(6486002)(6436002)(2906002)(2616005)(3846002)(11346002)(446003)(2900100001)(81166006)(5660300001)(478600001)(81156014)(99286004)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0239;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: g/fHWbvPY1KVTi8+cSK6w/3BP28kWeGovpY+o0w8H5aCVwaFDM0UN5ep4Fmq3Tly2+JzUclvsJ3rVdjjCajbU0ZtX59RZrPjgJaWsGuqaWB6uVpbGs7lec6uNxS92Xy9H+Joie5fj1oOMeQX7bLdGRjlp1F88+oVpymDjUqsKpO0cB1K9bXNu2wDqQqRBKB9yWaxthcJhz4uLjPvGrs0ijGiJa60Ik4LG61pdCTRZ4iJJPtQEB2VvBJ3eYjaKRydS0zexRg44IN7gR0BxrztpvP98Hi7zjp60sTdZNSLVoMuHWyue2pfmzaa5aBGGPj2DpamtzznMC9Ow4DH1WHH4WvPaZhHYe1sOW3XZ/F4jSg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5533e2e4-cb30-4dc0-f05c-08d63eb58739
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:17:50.2451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0239
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 1/5] hw/riscv/virt: Increase the number of
 interrupts
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
X-List-Received-Date: Tue, 30 Oct 2018 22:18:04 -0000

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


