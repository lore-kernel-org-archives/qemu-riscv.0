Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6V-0004EV-Gs
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6S-00047t-Up
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0z-0006RP-Kl
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4487)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0y-0006PE-F4; Fri, 15 Mar 2019 21:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699293; x=1584235293;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=u74TnXoHqgJaMI9YwC42BRc60BX/MkgX5r7bYbIyldk=;
	b=QxxZpm0+lFhLmeH+ml7XAuvdiFuaYsb1LwpAqpHewy3zNUgGsngby/zd
	G0bN+Vdu8vW3IO3/0ndx3JfZs9sJwLp08SgwU7+Q17YehKfG1AlmtWZ/w
	YiZUL07CUPA8mt9cJk4/XwwlWJFK+HJfCwSZe/XoGdLQIB8Zajw0t6Azi
	bx4BbdqTe8cCmcFMO6cMzrPY3PlMd1ZTmoPIOPuvswmPNhiMnZahpv4Jo
	JxqpHWKqJqVjEN9YIgwaMxgiA1znkjDHd6Yp0kU97atbVRwqpk+GTrD0S
	vgJIbHC1R7lZh+26G4i5zfWHgDpipH+avdhtzsqSFN961JXSeVUO9yIn8 Q==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549502"
Received: from mail-dm3nam05lp2057.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.57])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OIgiKuH00UQNf5djeqV/Ev0+4HL/0E8uTpexQKP+cwM=;
	b=VLe4Dp0kr4TcCtHXNZbE78+nOZBds7pbVDN/mdMWSdZCSOejzE3A6ysiPrPHYrtnf1UrsCyfhM9Xjq1no7XasHjELiDZMlR2N8fPMd6YoSJ1YzyRxTG/y2PKGpUqcJNY69R+WwbBJWo+1WbWKWs7+wW8INbEpK9u4bVKqt4fzKE=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:21:30 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:21:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 11/12] riscv: sifive_u: Allow up to 4 CPUs to be
	created
Thread-Index: AQHU25aV0/HA9wQnfU6rSIigQWcfSQ==
Date: Sat, 16 Mar 2019 01:21:29 +0000
Message-ID: <5aabc96cb72f00354da01b1527975c62c91f1f00.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR11CA0081.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::22) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f876777a-19db-44f2-2c22-08d6a9adb7c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59897B5553D94FD071AA4C3F90450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(4744005)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8HtUU4oNUUKpcS3Sm/TFrUfyZ/v+AZehVBFRnnapDT1GRqCNyEI3bEg7yaxRssbyAUL56ESVC+fIsqkNUqSevPJudZGr7JLpGsOm3lUvuECAHb84INMkvYaNeYpkqnsjTmQdPRSoGQtAi44vHtldPVazLylWPJq/6NsFxPOLFFjOt0+TpxyN3OWiEHLAaWVrX/M1U5B5cE4aK4LxG1T8HNanCfIzJjbKgnz9uemS7B7zI6pWsAxo5rjc7bmQcFe7FTVm15jKjSRoRB0j8utGC59z/1GDf6Hgc3jSDAp8qYsIV0DSNWUtSr3f/tBW8JR7ors7r8MrG66ErD8seug+5Q0FK372AAE68ewaCeK2nlX8ngNwCWxZR/TFBhlNsREdhqrUB8Akye3mOhj36ZHJWke16hOmN5PxCzBzxgAj82I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f876777a-19db-44f2-2c22-08d6a9adb7c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:21:29.8741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 11/12] riscv: sifive_u: Allow up to 4 CPUs
 to be created
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7bc25820fe..3199238ba0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -398,7 +398,10 @@ static void riscv_sifive_u_machine_init(MachineClass *=
mc)
 {
     mc->desc =3D "RISC-V Board compatible with SiFive U SDK";
     mc->init =3D riscv_sifive_u_init;
-    mc->max_cpus =3D 1;
+    /* The real hardware has 5 CPUs, but one of them is a small embedded p=
ower
+     * management CPU.
+     */
+    mc->max_cpus =3D 4;
 }
=20
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
--=20
2.21.0


