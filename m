Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQDr-0005hQ-I7
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDm-0005et-BY
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDl-0003dD-Lp
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:46 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:40007)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDb-0003Xo-St; Thu, 15 Nov 2018 17:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321275; x=1573857275;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=8XuyCNM4UeQJHsY2OiKRcmAQLJvDhaz/9/Mfz8Md8rk=;
	b=J/NNBDn/w+ny86vGAtFcMvyRZQWfou1N03i73GkraPT7xbXOpmnoKYsG
	ADHFyW/0whuebhwMBAa+DCn7HQh7Q0jLWG6yVsQVORHsVKX2rCNquFVIx
	Z7K7xt/8C/56NKW+RXIwBApSUYMZtQNxk9tGz1olrb9Qbq5eP2IvB43HE
	gxfishRHfLooJy1R45OOUHgxTWM2efh6YBEwHm6TwkL+p9cKYn+OOh/0j
	SvS8p0Vmr0GXPNJWloJGFIo44HQaJQ0oiX6Ac9HQBb4K9zvtWFpRTKw4O
	LqkZSBylhX91owTKth7W4qAASvMd6Vd5LXnblrlUDHX4v1gC5YJxQHu0g g==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884208"
Received: from mail-sn1nam02lp0018.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.18])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8XuyCNM4UeQJHsY2OiKRcmAQLJvDhaz/9/Mfz8Md8rk=;
	b=D+qWNO0rqEHA2RkQCyqaC65E9+VZjxwIF9IOXVL+SFgKgJ/DSM8GoJT+Fdg9IHuxj3NBnaN6Xw6z7Fb7D4QT9d7vYQ8lJ9P5drJoHvYdzukqN4FpDEcNFA9Ue29fqgULX5nrFtxLavy49yTfVQTbA9+o5hOk4OSInygui+AiaO8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0910.namprd04.prod.outlook.com (10.174.174.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.25; Thu, 15 Nov 2018 22:34:28 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:28 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 04/23] exec: Add RISC-V GCC poison macro
Thread-Index: AQHUfTNeup70yBQNgkC919p+jgPyyA==
Date: Thu, 15 Nov 2018 22:34:28 +0000
Message-ID: <970c4b6a1b54c1976c8d36261f18678072dc1c54.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0048.namprd11.prod.outlook.com
	(2603:10b6:a03:80::25) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0910;
	6:Lbcxk9Jj25NodGYzKona2eI7lRRocjhTR7LbcK/S82IO//1S1tHEyD/e/gq1RwyTYCGZy+EoVU3QdnuN8pAlbD5IaKUr5VjFoFS7LrbuXbxXiMtKHN1InZRKofbQ7BStQoDg4maRs+KWuF5O6xDproqpzDVskMlGJoZ9mLPzrM0qJo+duookzSBK5OEftljU5yT7aL9Of3iR3GlghTKCJaICoYOOtgSTb8BVF+UMI9kuQGnm8InjwmLjci1YMzVdRrDqoHNV9QHnR1qlmHYZEZbMpGlAXXjb61cwW2Y3pfhifaZUahS/17+HekhKo8wVO3cC0Euwi1afPL1bs9AQTdn5jOLyRzpprdriNF9ektW96xxh03WDGVjltxGO7X2+lB8RefMKR0l1L9hPeuCLEOIVCfKCbg7hupvA2Es2ypYYvM5juFnsLxVHSL7aSzwPtGC8FXwaSffg5iYgPLna9w==;
	5:7f0dvRmyXFG2ghtnYAROWP7RR7ydr/QIKLCtdbfXO2qhwF03RVbIMOfy2xSlm2svry+0qjBf51Bc9z5HPeJeN4JsJgxICGEdu78TynI+Aj5Bc7W8jg+tiSn9Ye34V+aKQ3M+YKTU1spK5HI82Kc14Yqh+oGlR4pMigv0D/BevHQ=;
	7:VI5gUmZEgWuxgb136wkvCeQiAdbpdXOfQuPTeYnyQBrmX3XzeHdt4OmlXyNlXFJuJkOOdrMNlyP92AnuhA/kmdFqXZ3diY+JnnOV4KIcwAIdWUoh9RZPfiY7Ozmx9wpL0sn1BUJI+iaaJ3LNcz8d2A==
x-ms-office365-filtering-correlation-id: 82124d42-5a11-4b8c-c408-08d64b4a80df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0910; 
x-ms-traffictypediagnostic: MWHPR04MB0910:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0910D8B9EE943544A7D87B5E90DC0@MWHPR04MB0910.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231415)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0910; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0910; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(76176011)(486006)(50226002)(8676002)(4326008)(44832011)(446003)(2616005)(14454004)(52116002)(476003)(6486002)(2501003)(6506007)(11346002)(256004)(478600001)(26005)(39060400002)(53936002)(102836004)(6512007)(2900100001)(6436002)(186003)(8936002)(2906002)(386003)(72206003)(81166006)(66066001)(25786009)(81156014)(105586002)(54906003)(110136005)(316002)(86362001)(5660300001)(118296001)(97736004)(106356001)(7736002)(6116002)(68736007)(99286004)(36756003)(3846002)(305945005)(71190400001)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0910;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 7tdGbnOJSPq0W7JynO/hirwtCkcucx1G3IYsnE1uYhWM2w1mN7LTqC/h4LIe5oSOgGnP2oqLb2jR9gLkb8epJs0ERYiW6CDXTcElOOsSkJQ9TkVHMq4kLMUOc6zyynwA8hcoXX4n+dGnfKTpT/H/EJ0PrvhwgWAJ7SUzfSRXdU8gUC3T2iAmnfhroWYjJPHvaNHnHPkG/+qRKsZWsTEtsvnjQg9l/2Xoruldx5+0fX0aXvsSjMxwFXopuGZXvTYB6WVkcjgVgG3ZmpR+Igzq4M3JZOaA4ZocE/zI4sY8NxeCb5aBXeeGqFslwwGNfaOiaMklV6C04CeZ16Hfcw9D/BCHQc/Ez9gutAgjkMYtkek=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82124d42-5a11-4b8c-c408-08d64b4a80df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:28.5528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0910
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 04/23] exec: Add RISC-V GCC poison macro
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:50 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
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


