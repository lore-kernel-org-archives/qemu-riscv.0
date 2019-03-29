Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11V-0000rk-Dk
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:34:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11J-0000lT-PD
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0A4-0007Tk-OZ
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:39:45 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55795)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0A3-0007SU-8J; Fri, 29 Mar 2019 18:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899204; x=1585435204;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=DoF4bQPL/ldFzbKe9L+HnefRDNsUjORf7nJMDlHPmlY=;
	b=a40yGz+oWWWVg4/Op1Jvf4sSHTAYhPa5QFtTelQL/coa4OhqDDHWYfdL
	vTx1yr72Xihr3XW4ORNxWgr+MAP+uHBWsqBWWiKQRX4r73Fvhfdn/Gxzn
	qLSCNmi16YMAsU4EWx6vpjn1XqUqW7c5yQtP9iTEFuT4LKQpsL89jE4M2
	VrW75aG50hRSWqsEpKf8kqJfEyeZfIqieqmZ1HOat6tgaN0kbYIQnOIon
	0DSbjtODvoE9cjTcCfphoSVMxA60zKGzTUi/sT6ccJvDRiwe8gx+uSZ1u
	Uwy6Y5iXfos6qAv8pZDqGS1x4HpQbaNFUBeSl1wMxMrklkPY7bdBwNVmY A==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="203405996"
Received: from mail-sn1nam02lp2054.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.54])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:40:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=J71ZN9x58BA+k6kZUUx+A7a8Z/XrCBdcCDaInXqaSWQ=;
	b=NbEBf9wCi3kJR1eJd048uEKKuYRKS+YiiNws88vu9z0QEpHcKbBkc5o2dHfv4aNaTG13r9OdXhB/SB0bqIndQyXjg7115hebZDwg7t/NkqQohH046xY8brIqKs+EtOwTn4ILmZYsYL4iieIUUxcdfxOiZV4zCw8294MS1AcOtZI=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:39:39 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:39:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 1/6] linux-user/riscv: Add the CPU type as a
	comment
Thread-Index: AQHU5oBLqJC+7vZKdEiIjJDEdVQntA==
Date: Fri, 29 Mar 2019 22:39:39 +0000
Message-ID: <21a17584f4028f8fb4b05d0fc61a2f0939660a78.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
	To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32cb1e26-d18a-467b-2d7f-08d6b4976dd5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB54007BBB7D15A45EC2709B11905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(4744005)(118296001)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(11346002)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(8936002)(446003)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(76176011)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L7h1xJKynitsJO4i2ZNi32nW85FfG6NkEWleCSJSjpUWfo1EQbUiiXfiNNA3m1Ghx8qrRPdxvj/o8x+5YMJOE2l6uTwLUNOlbVTFXmTJuo0pdTIfC8USApSs5oj/Hd9M0xw0SzgnNJrv442le2EecxJWiJZrUoh0dcM/a8c5T5FsnAyh0Ek90lj3hfCBAl+wVrbWmnM1Mop4tUoK3/R6rkaaM4cuobUod1AZ8n6wovPGA70NAPoADvewbQiXNobWkQXDWX5r2UBIvHT3nMldl1WMWWJ3aCAy3l6vmaLg4vOWatB1aV3F2IqhOT6G/HgyslyHSqeHGOaBVnVRqLSvpKbFfpGAiqJcE08VHWbnxLiZo+9alDgD8uWo8fte2A2Rqr//BpiFo3P5O9acehDWEFuSsmcasgnqaeoUeuBCmKA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cb1e26-d18a-467b-2d7f-08d6b4976dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:39:39.8214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH for 4.1 v2 1/6] linux-user/riscv: Add the CPU
 type as a comment
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
X-List-Received-Date: Fri, 29 Mar 2019 23:34:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/target_elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.h
index a6716a6aac..9dd65652ee 100644
--- a/linux-user/riscv/target_elf.h
+++ b/linux-user/riscv/target_elf.h
@@ -9,6 +9,7 @@
 #define RISCV_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
+    /* TYPE_RISCV_CPU_ANY */
     return "any";
 }
 #endif
--=20
2.21.0


