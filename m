Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ly8-0000cS-Tg
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6ly7-0000YW-0Z
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqx-0005KF-27
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:46:39 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:28017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqv-0005CB-IG; Wed, 20 Mar 2019 20:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129197; x=1584665197;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=gPBRQwVjNkDPus3pZoYDL4t7/qa8M4Nn+/kT4rhTTiI=;
	b=EdDHNmMlMweGVPV8mz+rlUmRWAY/pcoiTlWS8s7Eyez43TCvh8G4Sw+0
	mf3Q6hlisFSjAPaKR6ADtnfAbRLEJ3ILPuJSX59zyO9RqTTM13PYZ7EHS
	QEEL04eHdtpp54QhYZOj/ZoqwgUKO0zQgheuw2zcBssTrAyni+s6qcX4r
	NSbJfgV1w0isEZRS/XtUv7OrV80QF6STmTRxQ4Z77XYYxZ8+mUxA/Epaz
	hxat889Gg7mlFcJ6HNjR2OqoyS5YCgTaDbA/SfUru2cATuNp5upVtoYYl
	sZxYkiusY4dk8YIP1F/pTUjVcsYSSP8HstMnX2UDZNy7wahKd/sPHjIJ6 Q==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="103877779"
Received: from mail-cys01nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.57])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:46:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gPBRQwVjNkDPus3pZoYDL4t7/qa8M4Nn+/kT4rhTTiI=;
	b=GmR4fPrV4SmiIDEKvsZJbgFsydNKKLG+EkjwAvG5rz0JrdmE01d9pLuYWtDpNTdWpbZAib+LJWMjWD5+4AWaeRMqokJo+j80MA6bKWk+akKliIxHjX4buH5kS6Gfu7RKTozBKecbg/IuuPKn7rc3IgDCZMMERJrjOWHtpCrAxNM=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:46:35 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:46:35 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 4/5] riscv: virt: Fix PLIC priority base offset
Thread-Index: AQHU33+IY/7KbTWY7EKvJCKEuWdgPQ==
Date: Thu, 21 Mar 2019 00:46:35 +0000
Message-ID: <a21bce52e1b1a4592b1b429165fd3913e86cb128.1553129005.git.alistair.francis@wdc.com>
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0102.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::43) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33ef5a66-8281-4ad5-1dd6-08d6ad96ab2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4741C1CEE929EECC288D31DF90420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(446003)(102836004)(97736004)(186003)(52116002)(118296001)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(478600001)(6512007)(68736007)(476003)(11346002)(2906002)(66066001)(4326008)(6116002)(99286004)(14444005)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(4744005)(72206003)(105586002)(76176011)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ApVpAXj1NgX4Vu2p54UTUij5H0bAgaRlEttzP3Q69HbJ1Ylb7Cu9M+3BRzniJYnFuyXXka2hqb6KN/BVQYdGqm5dEbDHOZfbomXk9qidOJwWpUUVWK3X0vyDiZdi316ZI+wl+U/uiZ8xke0nqfMQSuEhwM+uGglBM46j+xEOi5b1gkXd6bHwTqpfx+Rt6hzsarJhxi68LbRyR3MRQfZMMRTvw2wm+l9BhRFJpPgD3Egs5hQNSvEig0QNUasBdnPKeYMm5feSjeno1LfDbKcxlZJ0sQxe1QYI1GzMKx6+KVdbb67pJuPBJuXicNhb1sGiKlOELkMO+KpPaKN55jPzaTfVjaYrdx2TFRcsmSDsdMrHLadu820093IGuD/hhXuau0edEtC0xXPI3/Ejf+IuNJlQvdNhakPBPJSdIxhJrTo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ef5a66-8281-4ad5-1dd6-08d6ad96ab2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:46:35.1079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH for 4.0 v1 4/5] riscv: virt: Fix PLIC priority
 base offset
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:04 -0000

Update the virt offsets based on the newly updated SiFive U and SiFive E
offsets.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index f12deaebd6..568764b570 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,7 +59,7 @@ enum {
 #define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
-#define VIRT_PLIC_PRIORITY_BASE 0x0
+#define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
--=20
2.21.0


