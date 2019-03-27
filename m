Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Dh7-0002ud-Cn
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 14:54:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9Dh4-0002eu-Vq
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:54:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9De4-0004nj-Eb
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:51:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9De0-0004kx-O6; Wed, 27 Mar 2019 14:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553712685; x=1585248685;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=yF4aZexhKeBVTzXnA5qX4VN0ZVC2x6zPGoj/kIT3EhY=;
	b=c7I40q1Gb1FgEPuzKQKAGN+NA59neBsfaaYU6Gjh1ng1DMBgaBYPOeni
	955b0Gk4RK8mB4YmefnlckzWq8eP/4ECQTnK4ebgCRGVgbOjOlcUCeNO7
	s68c+NPwKqG35tW+TdQnWUN5oj6xNvA+GDDjgHJMD1+ftTFlIhH3XF7qb
	N1rvoAlOYhld7hZ40icft39hArbChGn713dYQakpvrShEvu9mkmkFqBms
	knrw01v2LtqnvUi6iQdRaWWyEe8XAIWfyr5ug8cqih9tTcCbUJ6PGmX3G
	+/jzoK9HNopgmrcMYV1XILJBY8H8SVctLnHlhfOHQqYgTBFGyjNZSzeGJ A==;
X-IronPort-AV: E=Sophos;i="5.60,277,1549900800"; d="scan'208";a="105751996"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
	by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2019 02:51:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mw/V1mwRNxIEJY6+IOfnCkSAFz49CrTTz4JSszq83CA=;
	b=hb4Ht75QGW6MXYvbbPF4fYDDjLcIpWJOZzTvp2cMZ5VRTF2W1VSjeohfF91A2jfhWX4PCcN7F8u1nWHs3RxsjYUldjCbjUJsrhn2VAJ8eVdc6tzGdTJE3bbyPnfe1k2iYhQ64Le6SobDnqB8ZUxcra3Aj+oub2yuXHqgK0zVRRU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4821.namprd04.prod.outlook.com (52.135.240.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Wed, 27 Mar 2019 18:51:15 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 27 Mar 2019 18:51:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v2 0/2]  Update the QEMU PLIC addresses
Thread-Index: AQHU5M4OC/dnq9Az60anYIEGnwiLRA==
Date: Wed, 27 Mar 2019 18:51:15 +0000
Message-ID: <cover.1553712571.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
	To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d8708a3-0a6a-45ca-6373-08d6b2e530a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4821; 
x-ms-traffictypediagnostic: BYAPR04MB4821:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB482144F03B690BA48D55C37590580@BYAPR04MB4821.namprd04.prod.outlook.com>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(186003)(486006)(4326008)(53936002)(106356001)(7736002)(105586002)(50226002)(3846002)(68736007)(110136005)(2906002)(44832011)(476003)(2616005)(15650500001)(81166006)(8936002)(316002)(54906003)(8676002)(6116002)(66066001)(97736004)(25786009)(81156014)(99286004)(5660300002)(26005)(966005)(478600001)(14454004)(6306002)(86362001)(72206003)(52116002)(4744005)(6512007)(386003)(102836004)(36756003)(71200400001)(71190400001)(305945005)(6486002)(6436002)(6506007)(2501003)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4821;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YJsISP6HIvC/rlmj0a91S1/2E9FU0A4xB3XBB/GjdKpR1qNQmnqVr8eW13eNyXrjmAntmexIrsObjH3nLmMSFiPjlBsDjL8RjY/Xf/dHTiJRWg9kghMQuxiD2A5c67vmZX4kB5gjYc2hAiYSNSqsOa0jCf8dR6p8o/hxnvBcbb6yDY1byFsZuQgL1mDflhkxGn4hv8N/qFvhuHrM6/CaQcPQ9UYhTcunyrkr7dSvyqUmpuxF+IUgpHqqzQlFDwDwWrTVcweelCNy2CVLPtsQGlZdnjs3s22fZibjZCExcKLm2OtM4eSHLhIVqTUCGGKmWBfVuy4ph/11x/cI5qKPPHPq38HSJNac5Ko4K0qH4D4ZXr8XmucxIhQ8wL2yEe9sXD011EeIKPU/Xb8CoDA9jXxMSVMhj7ofHLxzrOZqZaY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8708a3-0a6a-45ca-6373-08d6b2e530a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 18:51:15.7233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4821
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.0 v2 0/2] Update the QEMU PLIC addresses
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
X-List-Received-Date: Wed, 27 Mar 2019 18:54:36 -0000

This series updates the PLIC address to match the documentation.

This fixes: https://github.com/riscv/opensbi/issues/97

V2:
 - Squash patches to ensure biesctability

Alistair Francis (2):
  riscv: plic: Fix incorrect irq calculation
  riscv: plic: Log guest errors

 hw/riscv/sifive_plic.c      | 16 +++++++++++-----
 hw/riscv/sifive_u.c         |  2 +-
 include/hw/riscv/sifive_e.h |  2 +-
 include/hw/riscv/sifive_u.h |  4 ++--
 include/hw/riscv/virt.h     |  2 +-
 5 files changed, 16 insertions(+), 10 deletions(-)

--=20
2.21.0


