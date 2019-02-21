Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTF-0004ML-SN
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTD-0004Hw-BG
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTC-0002OQ-3G
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:11 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT3-0002LI-IA; Wed, 20 Feb 2019 19:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709842; x=1582245842;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=1PiYgcM7gr2VOj4eFrg/q4577fExdLTf5WIRDk3nfZc=;
	b=pWbuT/B6WBgppRXewOwVXJeg/Ebxvp9Cn69LK5ylybLXRPdAm6vI0kK+
	W2O4pjI1cXkLCD/V9M+hBY6jB0OLZ9ThiLtbW5A5197oXd5S2qh2fqQ2a
	qR0cZnuxa7iy1yI0OxXWtWpve1YhfEtQhxf8i2GaHeoqyQbdl2x+3JPva
	sgKid1H7RPIfvjOfKLOwqUbA3YHgyF2a/R+UglEITNRPwBhOz+w4j7svJ
	sEGZPyP8rGgFSb+tY33LrVHVyYrHDmj8o1XhyT7jFezQ62wSCZH5QYALo
	gXRSLsGt9F9cviz3m/kddWQuHE1ez0HDAZclDjJBTTgrlGBEpBoVqrOR4 Q==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="103551750"
Received: from mail-by2nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.53])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:44:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yiAEUNipFoEG1WMRVcW3SIK9batgNWEQBZPp4TnqOgY=;
	b=UV2W+xo1iv20cG2VnDc/0Y9k/tzkDkuSXoQGcAdF1AFwUh/CU7MSLZszFE+uZ/bzyvU9WeNqxE2Hqnf+y99SL8a64qOzys0cc2cbNOxUmIl/YJRY1ejmJ4UbB4IMMP8SiM/rRerXJ6EpaRiyHnq5KwxfofGKHwTa5dnYXEH1dZU=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:59 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 05/11] elf: Add RISC-V PSABI ELF header defines
Thread-Index: AQHUyX6IlmX00KoT402m9PeYMJdnuQ==
Date: Thu, 21 Feb 2019 00:43:59 +0000
Message-ID: <c0de9603ba99d5d0aa5b9222366724cbc465ca0f.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ace3468-43ab-417f-d123-08d69795aa63
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:Lm7RIZM/audr2b0Ol/SCr8p/tBomnrwrwtc1iaj?=
	=?iso-8859-1?Q?oPsZ/H4C/yqufhYnm1a+Xjd0pBPI7tFxCDgKCGcNkBPchETyTf9kMWDuys?=
	=?iso-8859-1?Q?q532naYoRfTMOoP2+nWMl16XnXpwiPFRHpASd0lH7cmNt+zPQqpGc4+xIZ?=
	=?iso-8859-1?Q?a6H9lxM/8Plx118CnzC00QMBBZcd/q4mTz9snuzZzlxPilmFMI7hpACvrS?=
	=?iso-8859-1?Q?n6uGILxQzAd79uaXmRB/sKvhLrxIDLoXWXkimoxyUk/mNNQEvkzFKjtRe/?=
	=?iso-8859-1?Q?H+JQvNEzhKigIxcntoX4WzBPGJY0sJ6E/oHYd6LzbEzTZQk5Z6YDM23g84?=
	=?iso-8859-1?Q?eEJzEc8ljVSR66iasMMKF2nxARn2354/4FewHPu3aEmKRxSUW74qyVU9y3?=
	=?iso-8859-1?Q?G8shkry3DT2IvZfPAXaB4ptoEz7JwRRV72zeWlYo4YlMU47A2p4Ns1E0pZ?=
	=?iso-8859-1?Q?pIYIBhXn/SOE16t1vm2mYa+hEhZja94/QBJ7mcvNsuk16wcUZJvXZZz57n?=
	=?iso-8859-1?Q?84cn/scCy1OhXnC9FVfC+N851a8mxF8YYKn4J0OQl0CBdJL43duhwpx7K5?=
	=?iso-8859-1?Q?aniUwyPPYdIvxE0a0hWB8XBJ2+i/jI8lCCGI9v5W052hlHQ7Xma/4Ni7LR?=
	=?iso-8859-1?Q?VW6p0bID+obPpTSTcTB+DUYcaQWiJHYj7daxjPUyZAKUKZC+fLcU8dTDNF?=
	=?iso-8859-1?Q?EV+nWwLElHYJJWM8QLt6MUb66/EloX4L8MCp/RON0kfq6168KH+9bGhz5r?=
	=?iso-8859-1?Q?eUksLMVZDhlXfknL3V/exPICmMPVqL5bTyh/TnkMjgQWqyTVgvp/mR3ENT?=
	=?iso-8859-1?Q?dIiBDVQnArkaxZ7wj8vM62K9WO8b8YuO52VQLahuYpM6WEKvJuoSZ49fwu?=
	=?iso-8859-1?Q?B1Mz5VbI993W4CgZXEi6bJYvCfEYW4Hl1ZBFodi0JA6Jyw4pJGRblNIyun?=
	=?iso-8859-1?Q?pEwnRANI9RQQXIVzLPXmAsVFkCdLcmunQJveG002ifRjQr0fszJQTDbA5i?=
	=?iso-8859-1?Q?Y8sEZLW8/Z3jLt6r2gCNjkTH3AHmtu2H44l/mLwF7EG3h5+RjA/JY6XBWt?=
	=?iso-8859-1?Q?PJPxsHUtzivKClIbTUnL7+v+bR4RCy/m5DJ9XYpm1X8Tll3lfXiiiyVWbT?=
	=?iso-8859-1?Q?a1P8kPLNsjvTT7nm8lJpKK0kWkVNX0xX8XMc/ik7Bwc4hbrrm7+h/LlDhH?=
	=?iso-8859-1?Q?E3IswpXBCDdRB64CwM051gFI8fBUEnwwqJaT6NJ9inXOt1fhP0Zm52k0VE?=
	=?iso-8859-1?Q?YVbezZ1r5ERLCb71ENAdcbb+n8OghWZTssEsIpPPG3vGLNUqRThP949vwk?=
	=?iso-8859-1?Q?iX07Tsl0baNCfNUd9bz3pgU7c2YlMoVuUr2n3XjFfxPwAm5WcFDYWprmgy?=
	=?iso-8859-1?Q?azjL0hsdvmYsxp4QCO2shYfjH4trD?=
x-microsoft-antispam-prvs: <CY4PR04MB09857DA5C8721D5DD2ABA722907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(966005)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(8936002)(50226002)(66066001)(4744005)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6306002)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f/zO9rWtIGT5K7mevzgF/T8qB4Jv103jHYEaazzwaYQV+W6jc4CMoyuuvcJcZUitiIiSRYomO3Du4IvZTnBYVQj8evWMvQD23eD9oOYmwXC8BKScGmXVeggOMjiWRExntzrnb69/CKkQd0znDQKRzHnZHSuHeYutZ7Ukzs6LCuUQyC8JGoN8MiaBpXRg0H4l9iSXK+BNRqXnv2H38lUUu/qdzQMJ6wvcwEj69NC/+jYNr9UQm+Sdti0+QmJ6XFMLxt2H3YLx8AvK5/ok2QDOJMN5LKTltDq8/972CQAibb5+syFmS6Vqb3sSa9iG+MIf1VUemI9wguqo3abIoJi9U4MXIvYVo2tJUCOTcZeqYZnxLcqpvZMfVqS1yFSw/6R+KgCCrs5s4G6VY/dsfw0SSUEV13CBxG0PmaaTAfwuFCs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ace3468-43ab-417f-d123-08d69795aa63
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:58.1801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v2 05/11] elf: Add RISC-V PSABI ELF header
 defines
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:12 -0000

From: Michael Clark <mjc@sifive.com>

Refer to the RISC-V PSABI specification for details:

- https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/elf.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index b35347eee7..ea7708a4ea 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1393,6 +1393,16 @@ typedef struct {
 #define R_RISCV_SET16         55
 #define R_RISCV_SET32         56
=20
+/* RISC-V ELF Flags.  */
+#define EF_RISCV_RVC              0x0001
+#define EF_RISCV_FLOAT_ABI        0x0006
+#define EF_RISCV_FLOAT_ABI_SOFT   0x0000
+#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
+#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
+#define EF_RISCV_FLOAT_ABI_QUAD   0x0006
+#define EF_RISCV_RVE              0x0008
+#define EF_RISCV_TSO              0x0010
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
--=20
2.20.1


