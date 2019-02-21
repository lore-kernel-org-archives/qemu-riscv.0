Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTG-0004Mo-2z
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT9-00048v-6y
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT5-0002MI-Ey
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:05 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52069)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT0-0002Hw-DP; Wed, 20 Feb 2019 19:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709839; x=1582245839;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=AOaFML7kj36rjvBCxvBKU2+Olafu8d1NMlOnDxuHXWA=;
	b=dbnJ4TrDKnIcvjdYK5QQPaBjxjf82Bo44t8eMmLKHhn5OfLwmFmYpUym
	4D6DaYCRCt4jVdyA30cDpKJziaJL09RItlc2A3qpo9sdhJ0bR+dDB7Eq3
	2VeRp1GK8NYTK1w4eORKu8F3InvRcMuPKT3OpnvOhzmCwceJYVx5PPpSD
	iaRnjFOQn5H/gOq2CJyxaFafPM91KlFUnG2+M7nt+lvk0t+s0IiPz2I97
	MVWaYOfVqHJuvJ8SBQ2T+BH1qOXWmPIjUZpI4TyVbUaIyzGysFQqutAU7
	gnSkB2MltCOX7chWr8igyXT92a7cD35+UmCJFr493COZTg/uB0FZfTbZ5 w==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="103551718"
Received: from mail-by2nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.52])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:43:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=McK/qEiyWRH1yKxgD4bsiQmUaVqmhQgC6fbggKB8x8Y=;
	b=Gk050hYxGlfftfFbe3MnbAV+odcY9g4Ld82n7tbJnGmzyZcF45UKlRZscCKFt5kWJTLzQ1jZu2tuEcRGmJ9dsJkSuO54mWLnvcmhQ87+KkTtal+8gU9o2rVda0IzN7oTO3C8qJMHicGXQXCubUV/Z+0nJXcdXzfApgxPzjWzOOo=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:20 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 01/11] riscv: pmp: Log pmp access errors as guest
	errors
Thread-Index: AQHUyX5xWOKxmYl+bUua2Zq+OVeL0A==
Date: Thu, 21 Feb 2019 00:43:20 +0000
Message-ID: <b8787125d5156d8185be03e30d7f2731832cef4e.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR11CA0050.namprd11.prod.outlook.com
	(2603:10b6:a03:80::27) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d95cb58a-ca19-427c-d576-08d697959347
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:a/aWecqDbg+dDIuyZC78Zs5XGxIDKFRIZxdZ6Yb?=
	=?iso-8859-1?Q?r7/vTw/ILXo5AZt/hxxOXWP+TkAuLVe7yiKjbUjt8fm6FdW1AleAwhKIYc?=
	=?iso-8859-1?Q?YBca7zeTy5WqHaN2GBj/DuoG3p3ge/Xedqto0qXuYXJRMP14wyogj+/S6L?=
	=?iso-8859-1?Q?3DjSgkUTqrq+lLryN7cgp8AIFeBmiCWwmS+KENzXusqq6FU1CCr9kJrVr5?=
	=?iso-8859-1?Q?PKi5dvAVqxsEvtuseqqPlASG4QOjGDjFASxzkPnBw5k4vqLYNC+8GyoAyM?=
	=?iso-8859-1?Q?ndQU8siBoAI4G4746XLzcI+FKaMQSd6VSJxOd1qiGz38pxmdfXyjh0KBUS?=
	=?iso-8859-1?Q?tty+vQKmdRCqbOQjlVOuMxjmMj8assb7/B8VwSgryl7rksqdWH2QhEbEAM?=
	=?iso-8859-1?Q?E+lYkP+I5tvGKsOzMYnsVHyCRWe0sEq34gIOx0JTGmaIQ8TZdNltXEDNwF?=
	=?iso-8859-1?Q?f/tq5eAeIF6KBeev+pMW3DGXkxnkaGPw0fVinzyCfEtCUQouLZDRRtIiGw?=
	=?iso-8859-1?Q?7OqLo3/l/n/qyNd2YANtBRPdvuRE3Z4dG5GA0KmlUQYK/jGCE8bWfLpDgB?=
	=?iso-8859-1?Q?9oqS0QQSOwM8QbONzsO1DGJPweqLyPRCcDiegqnyEJgeAcCR7Hqn2MJoZR?=
	=?iso-8859-1?Q?ZNURmY6Z8i++DkkrWdpqdsBI9Utth2WjshPA6UH+TKyr2GxcCzXqloD3NE?=
	=?iso-8859-1?Q?2QUzMuUU5bKmwTW5TUnDhIpOWDw9ate/t/Idfa9Q+fWpF+YMV1fhiqtlcr?=
	=?iso-8859-1?Q?LlwiJipqQGEuJ7EtD/a1fwcqBFATUoH16U+NnIGtXPdkJ77ilrEJKQod/c?=
	=?iso-8859-1?Q?IkEsJyDTzfj1kDTQXq8QsXhoiKjySaxadbJODJ7QBf6ilxmxye1frfv29T?=
	=?iso-8859-1?Q?VJj9XiBD2nh1BuyXWqA2ow6Eix3fPJFgdetkJRJPy8e/OIjeTt3ZqbfywC?=
	=?iso-8859-1?Q?JXIl3xSmMnevyHDA1WbzpC9l8uR0Tw4xuRREXj+TNHCh+Yg7ew8vRgwcyQ?=
	=?iso-8859-1?Q?odgf/qUi7hgVJAK4gzfQcGiw6zmNj5Krg5WPOYvr2eIV8TAgoxMp+fumHd?=
	=?iso-8859-1?Q?yTqYQPCV8+/elIvUenn3LczUxmgHi8bCiNVMT6OCZ26mHTdUrlVvLUC+Fy?=
	=?iso-8859-1?Q?ORRGD58lXW1iVIfyujuAKtmKNijiCz/TciV2OZNB7wBXwhcr3rc+PU0V+3?=
	=?iso-8859-1?Q?AFt/Gy6SSs2OQNgc+bLQj1S8+x9a6RmFcof592+Itwkd1PM/B0O+JWDaPb?=
	=?iso-8859-1?Q?Ugc+MNZ7n2TeTQv4iKp34zHc5adnnVTNSI5R/0guCmCSXt1bYYZb1PzgcN?=
	=?iso-8859-1?Q?uZ728BAyW10BlGXWAYCBtao7qQmfjGGdIDTM699Msnq1A=3D=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB0985299F69BE9F5574D1073C907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xT0c5+KPX/7qJBWGapZxyup9sqsBq1rJ7XLccgRvv0bnaoVCF3p6GhhixriaZnAFoGvP1hiikqFtDGY/huozSiv77fCCin1X7zcDy9mrtIe4NPb00cfmfcVwZ8K6xE3GIH9zqElvDndf/sq4iH6B5eR4kWBLE0EVVyJ+DgRTpe0lCo9+0kwC8KFjfaLNuhrrxlicgdusYy7q5cnW4K0aO7+IbQ0G+FoFvq8AY/rjRmfLanzdr29oVvWzdvQ/7kZvEmWtlZzkAXfFNcpIuAlI0WBR7MxvQcC+N7SMAFaCw38TLJWIIf4Kiu1wxS4eSO1ICsKG6+dJO0zZHzZoavI7kuMDMVnDZ2r5lWE8LPFDfU8cR+CJQnd+Fg88OBFyLwe+ujjKiF0N/KIg/8WQVMHUzrYP2ZwdM2Y7vs4jIdWtRP4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95cb58a-ca19-427c-d576-08d697959347
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:19.4101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v2 01/11] riscv: pmp: Log pmp access errors as
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:08 -0000

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
2.20.1


