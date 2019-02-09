Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0D-0005PE-SO
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:00:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0B-0005KS-PE
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH09-0006Xd-Dv
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:15 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH05-0006QC-U8; Fri, 08 Feb 2019 20:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674010; x=1581210010;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=S6Y3NDTcZRwin8Bpei8FNMZBOIhbNRFJWIOwEvW4088=;
	b=WH2C/p2PkCTA+cT4l+cqreMgO3s4jaQ1fEUqyPynCmGZBqMwX+9DK8lh
	nBYRZBW2kOrngARLnOvegL495pgIz2m7pZvK6WAjS6NeyrjwCox0mDfLK
	bjyQ+e8L3gqLLiS5ntU5oUf3ZslMCY20uOi3oXHoiKnR1KJTRDeQJrJm+
	xzh+fA26fptqr2pYW5EjKNaJmj0M73+Jcg5xw8YWrcN7eMgzpZt6GwSSc
	o9G9Oib30q8qoU9AFD0/lTK5XS3b/J71n1NQ0ZgHVl7IWaByBcJV8uB05
	dzOqNYydRxRn1o3jTUlcQxvABFaEeKQWRcMGnmrQhPE+0F7ZNeV/w1c6y A==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="102120950"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/4eJCY3i0yvilQh83SgUwGJdWU6QwTUiY3wsGQ66N6c=;
	b=eTp6J49uQluIanw9+nfpEhvh5EnJaFsuOuN88Izymk3kTMHGEwd63MyrvFEIcNCacLdpgoZtd/enM94/6QCPJU/FKA3xx84WWXr+atryFGytwpxPTeQk37eDzNKYhCVrxMx8/eAc/uoWw8jNXQJbmgHaspIgreAsN4dzE3JDshk=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:05 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 05/11] RISC-V: Remove unnecessary disassembler
	constraints
Thread-Index: AQHUwBLLuqT48gA+OE+NUmpSedDc8g==
Date: Sat, 9 Feb 2019 01:00:05 +0000
Message-ID: <875b00b989a60fabb3a03353253ce8d939b5ce28.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR04CA0028.namprd04.prod.outlook.com
	(2603:10b6:a03:40::41) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:uAfM4nopF8Nz/Uis3qWawWxWN5byJ19kyY3n0tHCskC82/HVBHJLDEfb1nuJlCXgUJFkP4+g7gW/IiBbFrZWzvktWBpFxSDQk4TuJsWmV72WOodoUknJH3TmJHKKs4bLPC7ujzqp+UyNYoy650dxN9pVSOiwt34vQsvpDm513oeyrX7qy+3VwTsTv4shOQEWretgH4E1fcRuH7abpxihZkO6vgEBOzKvR9i1PHYGAQHIVhiOtSWdWzeyCHoD1IlRHYT6LyMp0PbHqFKbtNI8hbSlL2ElDsm2s2Vws3T4Jee/fF7Xm0oVCndhwMrdU+NIj/vr2sZWUtka9tk8CgtZOkMuC+lQJy0Gh9Pd7UV+AWcpzNe9WuPqGPXYBdfn46GPXgmmYWseDNVDl1HlWB0EZCU34rzMfkiG5Gv0b8ZkD3FuedNfKnwwY8tyj/ZsAGMySwcg4KrAO7Zz5Hc4IkmLsQ==;
	5:UUWxSoeZbB1lmqf0vQ6Zw3BI3xGUmw6yITjPlb7pONdAZOFDSzNwJ1/re6IFTCoenLaIoNklMtEgOJT3vLRYtE8gTx8IVnwQL4moUPygey1HimCrorycnODfu1NAPj0bBHp6SmL/LTsQ2UVAT7wMj//e0Hstw9sWF3CFFsM/2rp1aW7TfqFGuo0XadmoQ7mLRzCUfXGg0JahvTwm+620YQ==;
	7:hcgateeV3SadDyhVvNWqq2dWRWp7QGXCWghwhzpkZr5ZMYVYbpKaIKkRvEYwzNynutpD7+quNxtSLkDOA5lF3JqZO4y9gHPy6DZlf3YjdbQRLaj1NrSn7dn6Gib6Y78j0xcZIsCJDfDjAviynlR0rA==
x-ms-office365-filtering-correlation-id: 0f446a34-1030-4a31-19ff-08d68e29edd3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409861798FF1C3D8B9E814D906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TkfU2wsBhqoK2xiyKI+BdULSnHDjXgaD2fE7NThF6leaa/ItbMJgmWgJj3wmfY98+zF+oBQrxarX3Xiw6+Yss5hYpQucIYIuPjYAO6E0xY+L7ikMy0awDgmLgUmihZ8RXwXC+CHz2lnGTdDIW/MsEtZ6PSD2NMNdJ4skGkekaFKq5y/coSkHP3PU70M6gMCLgpJdDgpP/Jq2lyEJTrzQvOJYMaQuCzwZDO9tIcDz9fR0tU7JlSU7AsTu+kCsiqZxQvmVPQo/hio4fd37PBQo8PVoHxeATH6mevzrEFPGNRqcExaHZgXRreiUEAh5zMWKZzlre1KUOVCNwVbyF64+vu/33yy9wqh2fahUl4e8apOernpl1rid9SUktD7ZjioakJTrh2xPqmhx0E9WrOczucore25tStAlxPi92I1+ncc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f446a34-1030-4a31-19ff-08d68e29edd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:05.2350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 05/11] RISC-V: Remove unnecessary
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
X-List-Received-Date: Sat, 09 Feb 2019 01:00:16 -0000

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


