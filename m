Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6p-0004SC-8C
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6e-0004DO-BQ
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y06-00069e-73
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:39 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:25828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y04-00068h-Oc; Fri, 15 Mar 2019 21:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699236; x=1584235236;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=3tBGFM+/SVDk9P7tr5NpIocALe/ZKiRg2MLQHz6W0B8=;
	b=R7x+rhH8qsHrua+pIIDpa6CfEPbDZBHPgop//DDdy/vZIB0o3l6lVod2
	Jn95x4NETuEAls4EsD144xgvKzhcpdpAU8rHjCcEHwNhto6Cgc/PqOiOQ
	jgQCTEVpSWMLE+7CMXiw21G2/qE4OdDfIfAiLeqBC0MksilFGjlrl8W6k
	6el5LyBC6QwPSD0zi47OI+QqZG9uRHs4Tnz0mhOR7tcslD4KurExEe8AA
	CWAkOFwWSSBM84yb9cE/eQgZ09ThGVwgAhGtvIBoBxmvaEW6LIFckt2BA
	bfl507wD/8rrOO/lv8c5M68HdeeVrXfkU0CpFHAKaWNTrnQ5RFmCeZTaV A==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="108600684"
Received: from mail-dm3nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.52])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=U6Pjeh0idsLVToRRzNDIFbue+7h5Jc0P76WkAopiz8Q=;
	b=lE5ZNQ1rNrqWOygR47sCVreyPv34mqcWfQKmJZzinD5BxB6rYrLZfITAW4k2HiW4u5ifUrdeLYuYbNJtZULi6PtqB57NCZaVtXZZpnf7VBqbxFelJ040kbSVK2GF9q+Vk4p71pqGuyZGPXEszyntXH5z2H9joQNMEqQMI4viQVY=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:29 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:29 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 04/12] RISC-V: Remove unnecessary disassembler
	constraints
Thread-Index: AQHU25ZxUtc/lDAvvkG7U5pqG6mcfg==
Date: Sat, 16 Mar 2019 01:20:28 +0000
Message-ID: <e96d5671fe1fbdbf32d509f34a56c1b332f33199.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0062.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::39) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2814ac5a-52b4-4b5d-a2f8-08d6a9ad9375
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB598980F4ED463880445676F090450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u8kWeRZ8HWlIz/b3t7KwkOslm7WZpeGCXli5auNvhZKTeQ3WcUu6iYEA5yrFOwMRuQ/JB54NkcVhtVUCz4b5tRYiwugqs+aHxd4vwBqfWg4V/RjbeZxm0bWAke5InCucI7d1/9EQnusdU7IFwT7eP7wu4+VXimLmi5c5Ca45ZDVg+A95kIyW5nV+ewYngbVVCnxBT2b4a1cglkVYjVZjadB5lzqrBiZhNAyVmyBQQZ3H2V/4H29+L8AeYkQPVTd/ZGhz/T9KkSkp0WXJr1qRE7bShGEfLRHjbqDCgufHwVAmEHsKji94nEjTNQp88/NwL2mdyr6cDF/8x+2gfPhDNPzVn6P8HduzLrv6r6OwX7hcWrhFpBCvu+zdd0LdWc45lxRyybiS9rfJ+cJEBnAu1j8irLYEPkLoB+UYvDJ8IYU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2814ac5a-52b4-4b5d-a2f8-08d6a9ad9375
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:28.9961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 04/12] RISC-V: Remove unnecessary
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:30 -0000

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
2.21.0


