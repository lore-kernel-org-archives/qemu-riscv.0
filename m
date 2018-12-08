Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQlz-0008Ea-Nj
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:47:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlv-0008DE-8V
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlu-0000W1-J4
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:07 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52345)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlo-0000Us-Qa; Fri, 07 Dec 2018 19:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230055; x=1575766055;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=H59KDdt0JZqwQU/CrTGaHtfj76A6VvuKsZgqktm4aOgfZHpye+RCihvp
	5jIOz01xdA4WjTQeHflLqD4VdEiUJzWo1zNRUU8B9LZDkWfke2GYSEGWt
	yPkN/nQq/DeMtTQdP0baQV3MYE4/kMD5t/Ulc8/hhR/DPmIXA5SCNWzWE
	yd4LDOsthFPfMT2NXmtMcIXGj09W514P0YPwZyuq2kj95gvdU+/pH7xmS
	WqFoCuT+n7fZ+3n0pKn4jeJIDLQ/CCL7H/MKnjXSJskF+TDOuayDB8oHl
	zxH2NhJKrArr7lMlk77gr4ZbV9hoaDIQvp8a3l3loTJHEjgxCEDXIFXFy g==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="194003388"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:47:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=kVW9OAXm20wNsjMOKkUq2JW4WpZoT7ewinnkEAGAezmP3zk5utzB3FhEIMTkqO3PYRJEFHNV3571BqV21E3ns+RQFQ2UUHONQpij9+MhmmCB35BHRk6LAkoRbqmd8etsgg51ZXXnDro8JJ3gGpzQRl4kWM5xx3N2plaeNp78iC8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:46:58 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:46:58 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 05/24] exec: Add RISC-V GCC poison macro
Thread-Index: AQHUjo+FG3HknWA4BUypeEvwL2ZiNg==
Date: Sat, 8 Dec 2018 00:46:57 +0000
Message-ID: <75f471d6ea7b31650c252ba6ff05d92c2819d2b3.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0020.namprd04.prod.outlook.com
	(2603:10b6:a03:40::33) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:dnFwRr40gumpzrhSlhdmLN9LM4i6FnFsFPPIc7PZwfwn1uj2ExAAquuSjXpt6wRh6easEiT9mH1dvVYY9h2kcJgfZSpRnX240sO2K0o4dftBHqdTBp75mkGM5Pk2uZmKybPp0wSQWpf5jQsV/12vhGwwQgQRlExsirD33+gFim8IqbcWFnw2lfBdR2xgy4LAyvv5IeSXEpwaZbUZQqbGRMCXuXGx6GXrc4L/ljd5Fzig/43PbD6e+8ItehD8hm3xR4IThw+np6xtYpc9CcQ1fJEi53zdc9q08EpNADN7fP5SWbg534kDI6XDinZryvZ7SjQLi1Po7Ff2ptB4S2x/pRRDkkS6MrsU3NIuxpdH/lYU159AzhnjvypZYAufD76GKwGmALrw21xD3CsmcfdI8IXvIwQqTx8YwTVybST+x8LeJx4pvoEGZfl22P+9nHgLlnkE8b3D9+iIxdjjiMj+ng==;
	5:qC5CFvYd3LRPMYTheTo6/95uQIvOjtY1pQ/iOtBf34ativz09/ifvAu0q8RbfhWTfhsn++dHMfHrd9qosIGtxo5DuZToNQA+PN03WLg2wygizqk1K5Oc9lgQsmYba8YBSe9+pX0/xmNy4ziTRY9OUtv3R7J8smUhgZawc+aG0RY=;
	7:v6s0XdwirF0oc3JcAV0j0pzhMmx2cQfRXsKjHr7j2TyBvpCNx+2dhSE1VVpLjEoDwKTAKHJfIevFFmUZ8udvbDBF7YsvOKatzkMEpKHtl/e/wKOgi9UiSQ7hiklNKGaCHcryoIKTKojiptzTBsRWjg==
x-ms-office365-filtering-correlation-id: d9185051-c65d-4af9-a1bb-08d65ca6a835
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37254B2538482C5E9E19535B90AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: Fv65DlaTZVW6HMHwoTPQdfUy32WHvQ+FtUYLDbIHWTwUf4I69km3P1I59nwJoebapMygcIskgl4ZDL8hxcSU9CQdtB3QoXusGz2Ei/M464/zEycEGVEy6b0gHI+0eM+IuKxe44IcXYvqpuAfnw9T/1zbiVhSZGE3lzY322DLWYS/Kh+0/E8ytb5hNSlGU+T2vOiP/+OlJTkpKy2WE2DYlEPfg0pz2CAT13L98BY0vO4KNxZs1JBhqp+6NdZRaRVLboCo18ZO3fG8bjiib3DbMAVOqYZGmkWdscTLzRXx0bjs4kaGn0viC/WipcIA9hJsF5Uk7Ns/ndxxIv2aqNUKkIs/9ai2oAf6Bq3FWdZA6bA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9185051-c65d-4af9-a1bb-08d65ca6a835
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:46:57.8569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v3 05/24] exec: Add RISC-V GCC poison macro
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
X-List-Received-Date: Sat, 08 Dec 2018 00:47:10 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/poison.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 32d53789f8..ecdc83c147 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -79,6 +79,7 @@
 #pragma GCC poison CONFIG_MOXIE_DIS
 #pragma GCC poison CONFIG_NIOS2_DIS
 #pragma GCC poison CONFIG_PPC_DIS
+#pragma GCC poison CONFIG_RISCV_DIS
 #pragma GCC poison CONFIG_S390_DIS
 #pragma GCC poison CONFIG_SH4_DIS
 #pragma GCC poison CONFIG_SPARC_DIS
--=20
2.19.1


