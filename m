Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6lyb-0001FA-65
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lyY-0000d0-Io
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lpn-00024c-Ct
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:45:28 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:27935)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lpl-0001nj-D0; Wed, 20 Mar 2019 20:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129125; x=1584665125;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=ZJUdjNCZ0tvuRKqdRldCECX3YttAC0bBCuTa4ckIaPU=;
	b=ppRu2t7oziaOPYOkKvn3mSYRNgdxTjcOXrvmAFxjef86TtuEGBwbPVdd
	3DQ/va12uuQT4UjRY5Wgi3OIA4SV6D5fZn0PjNokAS2zspcK1kn5GMI13
	ikz5Xq7eLBlCKk3S8KVf+iuwcpuP0v4gRd7diBBljJiWqOzpNYK7DNGbp
	3ITAwA6wnPAPIM/VEa74SfHO2cpzbBkIcHh6ZipVbIPkVVs5RJTdTE+ri
	xc7NDxW5OlgjouKk3TWl/mQnZ/Nv56E+uZ/zD/shWFJfFbhXHPKih7iTW
	u3FHtZQHxRxlXUfqqH5HEFXxH9FFsrV7dVVtE9n04lgrbWPpZueuW0aed w==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="103877715"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:45:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6juLeMRe5eKHSFlWhSrN4C9mZxeByJTbjO8dE4fW76E=;
	b=GBig+b7FtgUiACtIc2s7Z3NwTJTtDNggXgMAwScSgUBPx053S7ZMr/ciLkSmeZAyo7ugeIAenvDchWiW7CdFiPw2v3T+nUBS81W8N7h7kcXpA6IJ6Sd2++KR8l67xHd3lMJUKyl3Rz3AylvZYzCe5R/sH9LYR/NXdeIWDEZsSqU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:45:15 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:45:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 0/5]  Update the QEMU PLIC addresses
Thread-Index: AQHU339ZJJO3/AM6UUuhwbeH0TKK7Q==
Date: Thu, 21 Mar 2019 00:45:15 +0000
Message-ID: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0019.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::32) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1daede02-40b2-4d3b-d19b-08d6ad967bc1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4741D3F3BF982906CBA6373890420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(102836004)(97736004)(186003)(52116002)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(6306002)(478600001)(6512007)(68736007)(476003)(2906002)(66066001)(4326008)(6116002)(99286004)(966005)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(4744005)(72206003)(105586002)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(15650500001)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5b8cUubsF+fjp7IoVWQFJn7CSeCkyYeuoA80s2PmJV0+13pXKCW4TWsKVsqC0yOXxJ+lzWFgb9wShDIgqd/sPs2S9ZZW9Uc5d4MAjYrg9HkkmrNBlqSfPGM9uKjvFflFBPwYqGowSULFGKP0X3wYHGKw43YDoXsCABv8uH39U2VmRpp6maKJAtkhJNEBf0zGg16Wo4ilegi18WvFJlC85EZNTyAdO3GY9sAzWQCxfGxu7eGOZD3AVMl6x7aSGVLDwdqKU8z0OzqTIJCF/yR7vhHxY+ZggT2VHXDuWJ/dxTu5DI/utNjSZXOmit3l6Bozr7amnfw+84W/txy0W942/5J51jl4U1pXsmKuyufg89lfrp9L8R7p9oh4BS7w/NziI1lKfOa8glHWtyRy708eCd2/DMhPq8ON466BWGfnLFE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1daede02-40b2-4d3b-d19b-08d6ad967bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:45:15.7606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH for 4.0 v1 0/5] Update the QEMU PLIC addresses
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:31 -0000

This series updates the PLIC address to match the documentation.

This fixes: https://github.com/riscv/opensbi/issues/97

Alistair Francis (5):
  riscv: plic: Fix incorrect irq calculation
  riscv: sifive_u: Fix PLIC priority base offset and numbering
  riscv: sifive_e: Fix PLIC priority base offset
  riscv: virt: Fix PLIC priority base offset
  riscv: plic: Log guest errors

 hw/riscv/sifive_plic.c      | 16 +++++++++++-----
 hw/riscv/sifive_u.c         |  2 +-
 include/hw/riscv/sifive_e.h |  2 +-
 include/hw/riscv/sifive_u.h |  4 ++--
 include/hw/riscv/virt.h     |  2 +-
 5 files changed, 16 insertions(+), 10 deletions(-)

--=20
2.21.0


