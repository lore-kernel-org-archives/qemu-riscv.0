Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hHfiX-0005zM-12
	for mharc-qemu-riscv@gnu.org; Fri, 19 Apr 2019 22:27:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=0062c52f7=Alistair.Francis@wdc.com>)
	id 1hHfiV-0005xL-17
	for qemu-riscv@nongnu.org; Fri, 19 Apr 2019 22:27:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=0062c52f7=Alistair.Francis@wdc.com>)
	id 1hHfiU-0003Yx-4q
	for qemu-riscv@nongnu.org; Fri, 19 Apr 2019 22:26:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28896)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=0062c52f7=Alistair.Francis@wdc.com>)
	id 1hHfiR-0003Wi-KK; Fri, 19 Apr 2019 22:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1555727216; x=1587263216;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=2nl6/bYHIMuD3KcWftC1PLmcua/jZ327LpcxzznBLng=;
	b=ONJRFybMUIGjNklu9afJ+q4qDRUQGmWpfU1GeL6ahvrMY0DvR8xsxodh
	0mQqA2iNB2I/hl9vvBWwz4ODyC5WrMGyytR4uBolUj8pSw/81VsM+a7ig
	bTEEyKBmuzEmQz3GljE9EyZthBnd8VEV8V36DlvP9AsNWJFy6eVTZwtmX
	zhBQFrgMovGWDZgKN8wEH6MePXNZhq/4JwPvDtse86Qghte60fybUqZBZ
	7XsyROfN8M3YYHR/OmZffiMkOHADOvgU5LzuT50WL8SPngGa+lHrI+okl
	1+mR7uqMPaOu/tSZPQbe194voD6E+DtJOFzbsfnav5Xwt7E30APcwh7pz g==;
X-IronPort-AV: E=Sophos;i="5.60,372,1549900800"; d="scan'208";a="107617959"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
	by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2019 10:26:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2nl6/bYHIMuD3KcWftC1PLmcua/jZ327LpcxzznBLng=;
	b=Gcc9JKFHHgi/UwD8lns26oKa+GMMpohNjuilJ8Ajlh0chEU8xYjA6Vpbkln+kUweZ6lw2WCvb5PlAApNWk9KT2auCtfvxsZWQJYS6yGHf5WctvhoKCRH09Df2Jx2aeLFW1IGSzsWXclq37ovqFOMpwAIJnkcGlnaFkCOEm9ZXSw=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5319.namprd04.prod.outlook.com (20.178.49.208) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1813.14; Sat, 20 Apr 2019 02:26:38 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1813.011;
	Sat, 20 Apr 2019 02:26:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 0/8] RISC-V: Add some prep patches for the Hypervisor
Thread-Index: AQHU9yB7uihVrUvdTUeugj0oS1JeTw==
Date: Sat, 20 Apr 2019 02:26:37 +0000
Message-ID: <cover.1555727081.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BY5PR16CA0011.namprd16.prod.outlook.com
	(2603:10b6:a03:1a0::24) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e98669e5-65ff-4c21-324f-08d6c5379d93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5319; 
x-ms-traffictypediagnostic: BYAPR04MB5319:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5319964C0ACDCD61801E749890200@BYAPR04MB5319.namprd04.prod.outlook.com>
x-forefront-prvs: 0013079544
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(50226002)(52116002)(6486002)(14454004)(6436002)(476003)(486006)(3846002)(6116002)(97736004)(2616005)(7736002)(81156014)(8676002)(478600001)(8936002)(72206003)(386003)(6506007)(81166006)(102836004)(26005)(186003)(36756003)(316002)(6512007)(44832011)(53936002)(68736007)(66066001)(25786009)(4326008)(305945005)(99286004)(54906003)(2906002)(110136005)(2501003)(256004)(64756008)(14444005)(66446008)(66556008)(73956011)(66946007)(4744005)(66476007)(71200400001)(5660300002)(71190400001)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5319;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n8mR6rOBOS8MkV7g9fdEqFxzVFY1zCPp0mf124/elKoXZxYsfFbYZpNC1tS+hF75ijP1ZoyBmyaykOXGBBakCkKg/4P8yTUiSVk8i45Sky+3ZO+CpVdp3RFKRBj3epWdJySW7PArYLEB2o2SbaxA54cgu4HJ+1Hq6Ob1ex5jbEaI40sgfUrsRJf+jyFMjV2oAUKQcC4TqcQpZV2EW8tdAqGvFCPQH3SlrEpy1zxCcBjV1y3gim0cPFsZ8MOW5Gqi3lWYac2Dk6ytHr31m4F6h4XmRuwzXQYCDoJQ4h0lzcXe+k2mCmZrEeAKXvIjS+oJdlNEojrH15IS9SkVm2sMr/eazUdmpyOPbUkI14eEMNyhjltPj1Ftfm+Se1lsYfMYP5Tj5eJFrYFqvDfzT5FeLNUqa9aiEKeBeTRoohKK47U=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98669e5-65ff-4c21-324f-08d6c5379d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2019 02:26:38.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5319
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 0/8] RISC-V: Add some prep patches for the
 Hypervisor
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
X-List-Received-Date: Sat, 20 Apr 2019 02:27:00 -0000

DQpBbGlzdGFpciBGcmFuY2lzICg4KToNCiAgdGFyZ2V0L3Jpc2N2OiBNYXJrIHByaXZpbGVnZSBs
ZXZlbCAyIGFzIHJlc2VydmVkDQogIHRhcmdldC9yaXNjdjogVHJpZ2dlciBpbnRlcnJ1cHQgb24g
TUlQIHVwZGF0ZSBhc3luY2hyb25vdXNseQ0KICB0YXJnZXQvcmlzY3Y6IEltcHJvdmUgdGhlIHNj
YXVzZSBsb2dpYw0KICB0YXJnZXQvcmlzY3Y6IEFkZCB0aGUgTVBWIGFuZCBNVEwgbXN0YXR1cyBi
aXRzDQogIHRhcmdldC9yaXNjdjogQWxsb3cgc2V0dGluZyBtc3RhdHVzIHZpcnR1bGlzYXRpb24g
Yml0cw0KICB0YXJnZXQvcmlzY3Y6IEFkZCBIeXBlcnZpc29yIENTUiBtYWNyb3MNCiAgdGFyZ2V0
L3Jpc2N2OiBBZGQgdGhlIEhTVEFUVVMgcmVnaXN0ZXIgbWFza3MNCiAgdGFyZ2V0L3Jpc2N2OiBB
ZGQgdGhlIEhHQVRQIHJlZ2lzdGVyIG1hc2tzDQoNCiB0YXJnZXQvcmlzY3YvY3B1X2JpdHMuaCAg
IHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQogdGFyZ2V0L3Jp
c2N2L2NwdV9oZWxwZXIuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KIHRh
cmdldC9yaXNjdi9jc3IuYyAgICAgICAgfCAxOSArKysrKysrLS0tLS0tLS0tLQ0KIDMgZmlsZXMg
Y2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yMS4w
DQoNCg==

