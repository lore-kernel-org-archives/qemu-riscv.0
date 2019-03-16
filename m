Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6n-0004Q9-FI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6m-00047t-24
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xza-00060L-ET
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:07 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xzZ-0005yv-5I; Fri, 15 Mar 2019 21:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699300; x=1584235300;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=+hqIpo5a9YhuyBdhynG8cEaQSV9r/uP5EU6jB1XIViM=;
	b=Th7mBpSAPdjYxzOmUJdVoLRM/u2aZRtnkJ0Br2pa29SyNF79Ab3nzIjy
	2vl6bwiq37vN2535mfCCUmZXZ9CBa5dhRyJtYxAuBaiEEdk7JCSTN6ovq
	wKiIZAXB1B/M0ivMuEEqAX+fwMMw8hIICzqmwOjoCubWoYAbbJ9lytSiR
	3sVTBjxxsSEgGhCKsJ+ka4TtxkeT6jJQ77sv2bka4OuCJ2hce3TeZViXU
	Tydgkzi5F/aUTLyOkidmHYD9Hq7kxosa55qw0F3xlkbO+g6s9ES0AwbqL
	UvAC4Offuy+ztYlAHYwNEwUD7LbHnMauOydHpBiaa8kYHtLHlYKfe26Y3 w==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="202186830"
Received: from mail-sn1nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.59])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=boSQ8se//WXTxJwNXyj1xFize+SDXMerIuH7UI1WiO0=;
	b=nPRKkta3w1tYmZ4qB3m4riCxjHU0X585D+OQG/0uErUcR7LrpSkVRt713KZx6wZZ0QhesRphtXAcOVLcI6Mc3WwvYJfXdmahuAFou67EVJmTSsqc/8KeGtxHu4FjOa0AFVCwP2ys9HhUOktFcEMOEeIWsBJivRQHICFLqLkTIak=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:02 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:02 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 01/12] riscv: pmp: Log pmp access errors as guest
	errors
Thread-Index: AQHU25ZhSkdMNrmxrEKk9WePJOogmQ==
Date: Sat, 16 Mar 2019 01:20:02 +0000
Message-ID: <07d2c6f05d4092419de488237910e7f9f85dcd4f.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR02CA0046.namprd02.prod.outlook.com
	(2603:10b6:a03:54::23) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35c6d3ec-699f-4146-5e8b-08d6a9ad83bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5989658DE2E24E7B31A5A17490450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ECRpHFAYfS4MI7GeOZ6QI0tHYBQTb+KdJJz78EHEuVAWddtCCm0W0Wk0Tn7Zc1GSDE5r7/0XPuWaRXPPjKBKJBIFH3pzoAIsE9OOYITth+yifX1oNC8mOtC1aRA396DfAkF/FAkCeuqS7AMRHU/HT/+Ovm64Mg2Q8MjYr3IZRBBKPLl/HrIg1yJYxKk9IcoVkuIGBt4tjfzFy+byDH4e421218S4KRdlI56ly3JyP7CDsLJ+SUkkDvX2vF0x3qRjlr8EhT0NMwlhoXWyXknt9llSpxqbw/a0LdLDm9zGC1gcXaPFxnFeu7qad8A5Ha43CZFVTOgrfG+ac7uTAMbmitgSaIzO4Np2uRHWi9ApOBIAtbViRPVTq3x+4ehjqGDZfKyrNjC6YxatJzHnuRLmLwHBNIEUv2EUDz/7PeXlY70=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c6d3ec-699f-4146-5e8b-08d6a9ad83bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:02.6117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 01/12] riscv: pmp: Log pmp access errors as
 guest errors
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:33 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 15a5366616..b11c4ae22f 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -113,10 +113,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
             env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
             pmp_update_rule(env, pmp_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked=
\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - out of bounds\n");
     }
 }
=20
@@ -249,7 +250,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulon=
g addr,
=20
         /* partially inside */
         if ((s + e) =3D=3D 1) {
-            PMP_DEBUG("pmp violation - access is partially inside");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pmp violation - access is partially inside\n");
             ret =3D 0;
             break;
         }
@@ -306,7 +308,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_=
index,
         env->mhartid, reg_index, val);
=20
     if ((reg_index & 1) && (sizeof(target_ulong) =3D=3D 8)) {
-        PMP_DEBUG("ignoring write - incorrect address");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - incorrect address\n");
         return;
     }
=20
@@ -353,10 +356,12 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
             env->pmp_state.pmp[addr_index].addr_reg =3D val;
             pmp_update_rule(env, addr_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ignoring pmpaddr write - locked\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr write - out of bounds\n");
     }
 }
=20
@@ -372,7 +377,8 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint3=
2_t addr_index)
     if (addr_index < MAX_RISCV_PMPS) {
         return env->pmp_state.pmp[addr_index].addr_reg;
     } else {
-        PMP_DEBUG("ignoring read - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr read - out of bounds\n");
         return 0;
     }
 }
--=20
2.21.0


