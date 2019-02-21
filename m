Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcT3-0003xP-7d
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT0-0003vt-RB
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcSz-0002Ja-I6
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:43:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcSm-0002AP-Ht; Wed, 20 Feb 2019 19:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709825; x=1582245825;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=wqyPAUZjMVhPgNm0BDyTlOvNdQLqii5VbENem7yOcVc=;
	b=BblwYoYTnR+UiAIDFJReF2La2B6LcM9TY8rUa6graDoaSaY9yGfrxbW+
	g4NqGC+ZuQRfTH50RlAse4YL3Gx7YxBCpZ3fpLTfZ5/YYFhQ8kBp630q7
	TRa7ehA9ZQtQ3HM1jIHQeC6bL3z1WkErWmIh4SafH4myXGb1zEo3sNnBQ
	ZL6bUuO1A3BZFgxGQh9D269ezucMmS0YtFFPsNUdrZq8NYrpamFAYWue2
	hSgs7RPpSr0ElgJRbG5zCQzBLY+v19LmzP1g9b3a2MtA8G/3Phg+OQWq8
	K96QFgBjoH6oFAfiCR7pxkjHS+sN56qQBw+7xOB4Dm04dz4vQ+oK8i+5z A==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="103551709"
Received: from mail-by2nam05lp2058.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.58])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:43:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FuKgVjBuoiFxztqb5dACiSsn50zXRpqPtaf/gCGRzCY=;
	b=IU3aNmi3G8Nn7fc52DvAGP/Np/GH9V8PeMFUd8mEu/3AtQE7s7XgGY/8sIOMRLpWhzb8pS6ulpLqXcQfyHogw2fPm896wnfabWbX3dRj8dUgSB8hG47u/cVf0yrM6DFV2yDlROgv4Yunw0vdm+lSKkMcOTx3gdmo3tlDUVMnIFU=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:10 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:10 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 00/11]  Upstream RISC-V fork patches, part 4
Thread-Index: AQHUyX5roY0JPRjY7kOWNTAFJXqvtw==
Date: Thu, 21 Feb 2019 00:43:10 +0000
Message-ID: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0023.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::36) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9e17a75-d34f-48e8-a69e-08d697958d56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:kzCe9liq4FI4L1jyiZXWPmpi8RDwyrlO10Qeizf?=
	=?iso-8859-1?Q?fO5gOEd5E1PmYp+wpBZSbRJwcBAgtdmbA+dKy99/WNeI9Yq2TGKwDGQE+x?=
	=?iso-8859-1?Q?nRQe7VogY1Akgj6MjmtNcrcIH0SQNb0ZApq3IY4WxKnEPrMq4w6zGBS9JR?=
	=?iso-8859-1?Q?8KPwDHMpH2nCw0l+QUGOZI8LDXNGS1N0ZaDQX8/pS+fRjwX0cBXaTpjesz?=
	=?iso-8859-1?Q?BTCHyv4/2tcsQTEBvWnANAYlYX0WPzYvfzknEuDbG4jcog8gTkjexOswiq?=
	=?iso-8859-1?Q?XS+SlrF1oz7PWQhrEfRSZcDFygHrqmzGMcyMVCvFQ2JqfS+42L+2Du/C4X?=
	=?iso-8859-1?Q?Z+hf4Iu+NeLId/By0LBNdPZf+zi48P+vKdpieeGu5vPVejsWqNf90i8tF4?=
	=?iso-8859-1?Q?5SJSysNRr1KWozKJs1ZSXl3WJOZjpxUcJX0U48evnCeWeImi4OX0r90YTD?=
	=?iso-8859-1?Q?BiZDU4nDVBt5roYPErtoxvxRruWj5MKAVrw6cmiV3XuSUBMfRoSXwHVyqJ?=
	=?iso-8859-1?Q?v7lkXmXhFpBItJX5Tmyd75vxhzixPbS0kXEcaIvkbkbFdhjxOj4cvKtGvv?=
	=?iso-8859-1?Q?9Ld9t0LqjE+OyYgaeYjxgA3yySJBc5LzZxTKQhGO7r5isn51t2JPfZkSa3?=
	=?iso-8859-1?Q?Mnd3mk1OT1WJYJR1qNFYRZonRw2Kv1FyeDU+2Bj0XK2/61rBzaLjce/cjT?=
	=?iso-8859-1?Q?xiYYpMZbVRiiCV0/7C1SpHluVYJePmFnzbZDZtz4IQMCcg5BjDgNb7seIL?=
	=?iso-8859-1?Q?+v0DdQuz1AIWUfMhpU252nzMrDdIc3zIXoqRirKsOJFdef9umy+siol+dv?=
	=?iso-8859-1?Q?X8AB1EVOln0pNuuk15wnmN5Sxab5QE6VlXWAbqTjbRjQKrGpFV2zTOePeq?=
	=?iso-8859-1?Q?N1Z4zlCCzjXcf/9+MQDuu2aDjMgJChwsLjlP4lZN/iQY4KmirtoVXoFXPW?=
	=?iso-8859-1?Q?nzhZ9y7NifV9hpygzfkFpx9tqiUoyoujAKpYPX3jZtrarssWnxsrvZYXsC?=
	=?iso-8859-1?Q?R1+Kpj44ueVrHG2xxnu4zt4mxhfoYZonFVRw/uF9Tad0C+cPlpJHt6i/LB?=
	=?iso-8859-1?Q?dZcMOss58uKbknmVXd/or1IKCOHYMyOWH2fadan5k9T6iAruVvIQI3MZYA?=
	=?iso-8859-1?Q?OGW1eJsXRmJJNsrxdR5x4fcdH5txja1iprEfhmxEmIKdnoFBH4tPJCk3UA?=
	=?iso-8859-1?Q?Fje+kOn8ralNOf7c8g2HgwHGkGs3S81gZ6dwr6PzyzcdcPNtYKDEW6c3pf?=
	=?iso-8859-1?Q?JRnP3qo4l7WJne/Cw?=
x-microsoft-antispam-prvs: <CY4PR04MB0985C6C973128122C02CA018907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(52116002)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sNFO/a5zbHec/y7Nz+H8T14ju67mGUy16pQnbC7KkohArmWXA9n1C5rvwe9wrrI2VFWQl1IVsv7x8VM3WXEu2KEe+XNAzQDw78wdm+LKN/RPPi80jlu3oITjJbMbqIhxD8yQ4hG0UUUOu3WpiZx/D0vgNtfsmQimW5zX6TTpYr/pyUND+pepkjLF/rl73s4nXn+w/tZlGw4Pex02AltAKFB+T2uQE7rXqkrEPOrr5p67VhdkpybUW2Ap2qQEXLbAjC8suWi6kinj03uzr04gaNdODlelZK8pJB2sh6RUD18voI317exI3QygvNU0Z38mS2fQkMFXvPZgjOa9jUKbXtt+kKQmk4lb/Z3jLfiOuvAE5fHFwbZtAUZap7Gxk7nnU5Yk/BCU38Q/yV0X5/Bzr0CGpUq2+ZB1ZEEusotCbBk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e17a75-d34f-48e8-a69e-08d697958d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:09.4359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v2 00/11]  Upstream RISC-V fork patches, part 4
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
X-List-Received-Date: Thu, 21 Feb 2019 00:43:59 -0000

v2:
 - Add a patch for SiFive U SMP support
 - Rebase on master

Alistair Francis (2):
  riscv: pmp: Log pmp access errors as guest errors
  riscv: sifive_u: Allow up to 4 CPUs to be created

Kito Cheng (1):
  RISC-V: linux-user support for RVE ABI

Michael Clark (8):
  RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
  RISC-V: Allow interrupt controllers to claim interrupts
  RISC-V: Remove unnecessary disassembler constraints
  elf: Add RISC-V PSABI ELF header defines
  RISC-V: Change local interrupts from edge to level
  RISC-V: Add support for vectored interrupts
  RISC-V: Convert trap debugging to trace events
  RISC-V: Update load reservation comment in do_interrupt

 Makefile.objs               |   1 +
 disas/riscv.c               | 138 -----------------------------
 hw/riscv/sifive_plic.c      |  19 +++-
 hw/riscv/sifive_u.c         |   5 +-
 include/elf.h               |  10 +++
 linux-user/riscv/cpu_loop.c |  15 +++-
 target/riscv/cpu.h          |   6 ++
 target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
 target/riscv/cpu_user.h     |   3 +-
 target/riscv/csr.c          |  22 ++---
 target/riscv/pmp.c          |  20 +++--
 target/riscv/trace-events   |   2 +
 12 files changed, 148 insertions(+), 261 deletions(-)
 create mode 100644 target/riscv/trace-events

--=20
2.20.1


