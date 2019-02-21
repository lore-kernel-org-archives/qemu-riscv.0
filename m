Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTG-0004Mz-8T
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT9-00048s-6y
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT5-0002MH-FD
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:05 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT0-0002AP-Cz; Wed, 20 Feb 2019 19:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709839; x=1582245839;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=S6Y3NDTcZRwin8Bpei8FNMZBOIhbNRFJWIOwEvW4088=;
	b=RnRLaKFrB5usMhSikAVEGzSSg6ahB2OY7fwKSxwrY5+HcatnreF/NCdl
	/Ikr4QDvu+fWc2jrMLY/auVfoMDlSxGo8QyIYUdTgw5unTE5Vo2IrQa1x
	+ksOBM0Dt/XNve+4sv2fypysXmbt0kc7x/CHNSNHdKzIkrYLri9GkQqFS
	9DmqNNbR97q6O1yU0ILYN7JLjoQ/62CIbvutsMTjU8hVwmyvueKbnkNgt
	6rF8mwjFJXKss8hayY20fjHZ2OofPvYSMyB908pXqxoRGS8Lq/PqFvxLI
	1NuDo75vDLKYbUeRm4XylIHn0lZD5KV4vxWFEtqUOd+oinIJdXuRf0Q+O w==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="103551742"
Received: from mail-sn1nam04lp2052.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.52])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:43:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/4eJCY3i0yvilQh83SgUwGJdWU6QwTUiY3wsGQ66N6c=;
	b=SvlbqMZ/DNUUEJMTRGuy54kkmlka0vrv8PsnF5cN/BgXIKi2NtZbYN2MZUTpLS0s05Ah+yKT0Qqj+d/XM6dZJeA1sPwu8L1Hq9kWh4clv/qaZVaBmRtm27iBCL5OI2TjsbYiTDncptOgKqS+1ECJQdDMV3VscHQFdFxjw0tla3E=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:49 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:49 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 04/11] RISC-V: Remove unnecessary disassembler
	constraints
Thread-Index: AQHUyX6CrMu4NMZBdEaacTSPjtBXHA==
Date: Thu, 21 Feb 2019 00:43:49 +0000
Message-ID: <4522706192fc368d68cca4d61028741f4806070a.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0058326a-3017-4391-5631-08d69795a4e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:5N35+tYnRy//kSjnX8KVXubSEofWqRUV/g8q+Ls?=
	=?iso-8859-1?Q?8BkOAHLirRA6jZoeoTF31m7E9Ng3KsNhTK15WxMK6oO6L2MVbjbBMLIqnr?=
	=?iso-8859-1?Q?ptnCfWVCYFGzqlQ+WZji90+ncvsBR+4V3RHAPoRblWkxoNrb4dBy3QinQi?=
	=?iso-8859-1?Q?JyT3Vno/6NomVGxJ4SKwSLmVPPjWyILiGj9NY0gN6/UYDTftKF0S6LoGdk?=
	=?iso-8859-1?Q?fvki53+9BhwNYkx4DsKy5nhtqDhPe0W34ejvIOw+8QeCS9UsEwUOkNuHZU?=
	=?iso-8859-1?Q?3sotRw7AHZ+h8NYUr25w8DmRQY0yr/KSgp6felrTXm5hiG4OOLodMyA9uV?=
	=?iso-8859-1?Q?kxORXNhgnHcG74zUK15NiU4nxfgo+tNZHysiD+9QKGl30owx6CxEOzSJ6h?=
	=?iso-8859-1?Q?N090MWXSr/DscCWdNWZqMgBSTiUdcWbLnIz7jzJtYGzkvLsECMHgsflgDR?=
	=?iso-8859-1?Q?7ypfIo52qMk4IzjotVwjOWuxc/76ho88yfLvmLGL1mNras8FVtFmjaPH9S?=
	=?iso-8859-1?Q?DoqPCBhM3QrHSEKVD3H3SrL9PXMFB5Mi4Ia/bLPUTdD55T/eTHJnHTCcwE?=
	=?iso-8859-1?Q?gcMtBoSJMRTF7RF9RVAMDpkbV7pn3xSDcSlL3w5FbHHcMVTPTonSWC9x+L?=
	=?iso-8859-1?Q?f45Yw9MPuHCqGp58OgbwnaUeR2/Vbro8uahOUfQyEFZLjASCKl6AHnfakK?=
	=?iso-8859-1?Q?X7kj3HdfyiAz6Rf0kWMPdrJSHXlub7lHSgKrIRSrg5OYyB6z/0qX7jLCVD?=
	=?iso-8859-1?Q?RYf3pTRsEWt0wfsmtvMiQr216OEyXHhjKDWPZK5z2OtChyrbvgpdoz36NL?=
	=?iso-8859-1?Q?OY9xwGZuXiu/2TDDzNuKWGH9MDzDuyO4VdHJUP2ZdhzkPszPoZz/9n02CU?=
	=?iso-8859-1?Q?H1oyr9jNGkBa8opYzMDhQezuAZi0O1gqrplN04nMbOQ6fyCECGL+7tR+ey?=
	=?iso-8859-1?Q?pkr+pnBD+XFS5B4DFkq/fEJrwNwrucqLZjcc1wL1WyJ9bG8gRu4tg+1M9e?=
	=?iso-8859-1?Q?nV8Hxqvrw5M7ZCcHLyqNXv4X84wAj7suZGOZbyebbiZUobNuWorn6mW3Oh?=
	=?iso-8859-1?Q?4MlxH0Wylk0xTeDsfxiWfa2ZBoJTLeJ6HU6WnYil+cjMWkgZ9sVB/1lHVl?=
	=?iso-8859-1?Q?CPj++/UvP40v9n1GRYJ5izVxV834i9x3srW+jNC0aVsyGgPrfHhCPWS7tH?=
	=?iso-8859-1?Q?STLaL5b//6Kf8bGhgsSlHYpzBbhOmalCPYt2TtsupwXOLnm44e1flm/vfi?=
	=?iso-8859-1?Q?QK28Y/g9Quy8+z2atIDXOr0Sbjn34zNiygGrisNjdc3gX/865fnA1/B+GY?=
	=?iso-8859-1?Q?gCmz1XfQq+USxi1n9HfK2jy?=
x-microsoft-antispam-prvs: <CY4PR04MB0985504B1611347BE5AB7EC9907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xvxK85cTR0V+pv8wFn8FRwmjjdMtHyHuc+PkQ7jCCS3uLL41nNOPs3aYaPho6BfGr0UfvhnZrtW10OFQxIFQsgxP1+Lhw0HUW8X6dkX99+o7VGY01mphskFrB5CmwbEzK1axnPZtfNmRNvZPx3LsfiUM71kFF8dqT7eQXnkVqOMiIF5UA96R1VKMMSKCkS7iUZmbx1/RLyzQyb7Qbs9QFCPHUX3o2yQv4IftKl4DpiL5wJzQoqeKf/FUHuiHBk983mrXEEYMOm7Ixo8ecvwpf7DiGZbHDby3nKjN4eZQm1T+IAPSzuYEW0wi4e21qC0xCi2Le+1lWw8X+m2b09MrQUA9ivJuiUrj6SuGSMWtjhvQP1BQIPj8Ehp64qFw+ayOSsrdMHacYDTojxQHiYUwenT/25Cc9eDz8C5ovfcUWAQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0058326a-3017-4391-5631-08d69795a4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:48.9485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v2 04/11] RISC-V: Remove unnecessary
 disassembler constraints
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:08 -0000

From: Michael Clark <mjc@sifive.com>

Remove machine generated constraints that are not
referenced by the pseudo-instruction constraints.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 138 --------------------------------------------------
 1 file changed, 138 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7fd1019623..27546dd790 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -87,33 +87,10 @@ typedef enum {
=20
 typedef enum {
     rvc_end,
-    rvc_simm_6,
-    rvc_imm_6,
-    rvc_imm_7,
-    rvc_imm_8,
-    rvc_imm_9,
-    rvc_imm_10,
-    rvc_imm_12,
-    rvc_imm_18,
-    rvc_imm_nz,
-    rvc_imm_x2,
-    rvc_imm_x4,
-    rvc_imm_x8,
-    rvc_imm_x16,
-    rvc_rd_b3,
-    rvc_rs1_b3,
-    rvc_rs2_b3,
-    rvc_rd_eq_rs1,
     rvc_rd_eq_ra,
-    rvc_rd_eq_sp,
     rvc_rd_eq_x0,
-    rvc_rs1_eq_sp,
     rvc_rs1_eq_x0,
     rvc_rs2_eq_x0,
-    rvc_rd_ne_x0_x2,
-    rvc_rd_ne_x0,
-    rvc_rs1_ne_x0,
-    rvc_rs2_ne_x0,
     rvc_rs2_eq_rs1,
     rvc_rs1_eq_ra,
     rvc_imm_eq_zero,
@@ -2522,111 +2499,16 @@ static bool check_constraints(rv_decode *dec, cons=
t rvc_constraint *c)
     uint8_t rd =3D dec->rd, rs1 =3D dec->rs1, rs2 =3D dec->rs2;
     while (*c !=3D rvc_end) {
         switch (*c) {
-        case rvc_simm_6:
-            if (!(imm >=3D -32 && imm < 32)) {
-                return false;
-            }
-            break;
-        case rvc_imm_6:
-            if (!(imm <=3D 63)) {
-                return false;
-            }
-            break;
-        case rvc_imm_7:
-            if (!(imm <=3D 127)) {
-                return false;
-            }
-            break;
-        case rvc_imm_8:
-            if (!(imm <=3D 255)) {
-                return false;
-            }
-            break;
-        case rvc_imm_9:
-            if (!(imm <=3D 511)) {
-                return false;
-            }
-            break;
-        case rvc_imm_10:
-            if (!(imm <=3D 1023)) {
-                return false;
-            }
-            break;
-        case rvc_imm_12:
-            if (!(imm <=3D 4095)) {
-                return false;
-            }
-            break;
-        case rvc_imm_18:
-            if (!(imm <=3D 262143)) {
-                return false;
-            }
-            break;
-        case rvc_imm_nz:
-            if (!(imm !=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x2:
-            if (!((imm & 0b1) =3D=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x4:
-            if (!((imm & 0b11) =3D=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x8:
-            if (!((imm & 0b111) =3D=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_imm_x16:
-            if (!((imm & 0b1111) =3D=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_rd_b3:
-            if (!(rd  >=3D 8 && rd  <=3D 15)) {
-                return false;
-            }
-            break;
-        case rvc_rs1_b3:
-            if (!(rs1 >=3D 8 && rs1 <=3D 15)) {
-                return false;
-            }
-            break;
-        case rvc_rs2_b3:
-            if (!(rs2 >=3D 8 && rs2 <=3D 15)) {
-                return false;
-            }
-            break;
-        case rvc_rd_eq_rs1:
-            if (!(rd =3D=3D rs1)) {
-                return false;
-            }
-            break;
         case rvc_rd_eq_ra:
             if (!(rd =3D=3D 1)) {
                 return false;
             }
             break;
-        case rvc_rd_eq_sp:
-            if (!(rd =3D=3D 2)) {
-                return false;
-            }
-            break;
         case rvc_rd_eq_x0:
             if (!(rd =3D=3D 0)) {
                 return false;
             }
             break;
-        case rvc_rs1_eq_sp:
-            if (!(rs1 =3D=3D 2)) {
-                return false;
-            }
-            break;
         case rvc_rs1_eq_x0:
             if (!(rs1 =3D=3D 0)) {
                 return false;
@@ -2637,26 +2519,6 @@ static bool check_constraints(rv_decode *dec, const =
rvc_constraint *c)
                 return false;
             }
             break;
-        case rvc_rd_ne_x0_x2:
-            if (!(rd !=3D 0 && rd !=3D 2)) {
-                return false;
-            }
-            break;
-        case rvc_rd_ne_x0:
-            if (!(rd !=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_rs1_ne_x0:
-            if (!(rs1 !=3D 0)) {
-                return false;
-            }
-            break;
-        case rvc_rs2_ne_x0:
-            if (!(rs2 !=3D 0)) {
-                return false;
-            }
-            break;
         case rvc_rs2_eq_rs1:
             if (!(rs2 =3D=3D rs1)) {
                 return false;
--=20
2.20.1


