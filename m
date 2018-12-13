Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXVpl-0000Ua-NV
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 13:35:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVpi-0000TU-OD
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 13:35:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVpg-0003tg-Kh
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 13:35:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:8832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVpB-0001gK-Hd; Thu, 13 Dec 2018 13:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544726110; x=1576262110;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=C4xXzECytiRSZwQpVDvE+YyVzGQXwPLPBg49DHifZz4=;
	b=H8xkpRWaPJ/5PM7hQKouaUJPexNCTck4hw3k+UsI4GbdfKJ8vALyTJVd
	uzJJZW7pUJvSlEI93gsz9SRyMPjGYnjRdngdXHBcAWjXvKzw3bPJ3+3TV
	e6GWjI/LaYDVzcsRAOmbig3EKDnJRM5g1mNj/UB6q6xwo78hS91lB2Xgr
	52DncexeDrhR94/1PII7/etnW0UBQ3Hbp7T0msCgqEeX3bollwMi5wg6/
	yY7xquR+jmBeYFEd951/WA6zuITi2IfWE/BTmcYwX4mpe9Bs94AU8EQOb
	7ZYrhZy+PB9+qqFxC2sUt/seMCXvPiXkrGIBg7SmCzwO1xavLy2nX1K38 A==;
X-IronPort-AV: E=Sophos;i="5.56,349,1539619200"; d="scan'208";a="194427415"
Received: from mail-by2nam03lp2054.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.54])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 02:34:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kvBbGhTjlxsId874QCWqYi5026P8krxN1vU+pmkdwoA=;
	b=eBrVd4o/5iiISWlscG4Vx3/KLYiBLo7TGYBCRGJPbNYF0Be6JAAoixpUetf/p4v9VydLcsmYL28WzS21WeFn61dV21lqfVgdO93isBLg6HFNQ7BV6RDOWqk2E7uYy4bANQUzoepWF00Bwb1LZh4q0UVczcSmcyxlCVObyBev3Cs=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1200.namprd04.prod.outlook.com (10.173.51.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Thu, 13 Dec 2018 18:34:52 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Thu, 13 Dec 2018 18:34:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, Anup Patel <Anup.Patel@wdc.com>
Thread-Topic: [PATCH v1 1/1] sifive_u: Add clock DT node for GEM ethernet
Thread-Index: AQHUkxKJWISL24wYb0OraN3SXrDM1g==
Date: Thu, 13 Dec 2018 18:34:52 +0000
Message-ID: <17339beb25e8db709cd55882df726200de31b2b0.1544726044.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0047.namprd11.prod.outlook.com
	(2603:10b6:a03:80::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1200;
	6:IAvbHxAItt4eDkcji5uTpIASE/ffeSbhslWMUeJ6agpsdmMeWmFVMgcMUrldnKZ5RyB5GAZWg/Va1BHNQt7CSPaBcZIC8yF+/vqnzGbRWSBX/uTfdtWksjl+9VhdlGE21SitLulgYSps3s92hsYwexa9YgM9+b1TnbtBth7wjyflBNWdzcx0YrHMalDSxTFd8nOK8SdMFf44FteqwjWIB/AE3CZl5qQiLdSUVMgVj/v42Dtet419dU92fW/4CnqwP4267lt5eotmZ4i6u1fvgPX44JWjMaeqEF3PUEqU0G/cFGF3cMYclzU5db9WQebzHyaHBqKLZd50OEpG1TPkZ5iSzTT5HCyNDa0iinDn1chsocTGhJAgIYB6O8akExoX4bnSsj60HNupStayZ7sDHDsfIkwhe0rCuBOuLW41MX9lfIoyM92HC+408ovr6rIuzwRJ7XsUg/qU8TB6PqA6Lg==;
	5:o+iR+9mEpJH6j5SGzDJUvnZkmxcWjCrlO82j+C3pyDH7kPbPrX2Ej/pz3lNovXNC1sS3yFQJ9iJKm+4siyNhE24yg3yCvdyCPde6HLoZ/PqIMWqidfkZTY3Y7+G7wdfBsXEaPplJI2lgWNQjQHKLOmlaQJzHDyp3ISoQrYxhi08=;
	7:d5fUMQ01sQNc3KADnhCABG2YBSHxL964ySin6eKbUUaNS+4TIupGjekZpwtkZcy4HPYbWmmrEb0aIQ7RLtW5cGyEOkqOAXEiWiMRJq5ggLnTrQKQbiRzzFro9KLV8ouOAPvpPuev00xzU5yqkX8v4A==
x-ms-office365-filtering-correlation-id: a0a44590-63a1-4fe1-0793-08d66129ab6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1200; 
x-ms-traffictypediagnostic: MWHPR04MB1200:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12001CC8DF17B8E8F780A87190A00@MWHPR04MB1200.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1200; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1200; 
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(36756003)(68736007)(81156014)(7736002)(2906002)(81166006)(8676002)(5660300001)(106356001)(99286004)(8936002)(97736004)(71190400001)(256004)(305945005)(105586002)(50226002)(86362001)(71200400001)(118296001)(52116002)(53936002)(6486002)(478600001)(6436002)(25786009)(44832011)(386003)(54906003)(39060400002)(6116002)(110136005)(102836004)(2616005)(2501003)(3846002)(476003)(26005)(6512007)(186003)(14454004)(66066001)(316002)(72206003)(4326008)(6506007)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1200;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: q9J9Rkcq/zMan8/VS3jzH6DBP4ZgBMtnSWHZp1CfXva/w27AjPVjqZQ/qCTEV1isgrEgtFJHnH3u7nN59pbtb+N/88gRLfsGJ5fgCf4Be4psiYoX/w6c0qSRHVrA/PpabTVe3GqN09p3zfSs8HbEsabSjsWt1E+ddrphc0veyADjpgw1ri+ctC3dUN2iCF+IXJnz9CNXEU+AWW9T6iJ4Nc+sasdJKY2cmwjr20FK1dVEsltuWf+hbBMskv+3zmJX83CgQnFQ0qOVfGvY48ECwm7pvr8E+9d3ZLkUJp1Zrru3SYxtQJoCEOgJW9AdasL0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a44590-63a1-4fe1-0793-08d66129ab6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 18:34:52.2131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1200
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 1/1] sifive_u: Add clock DT node for GEM
 ethernet
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
X-List-Received-Date: Thu, 13 Dec 2018 18:35:40 -0000

From: Anup Patel <anup@brainfault.org>

The GEM ethernet on SiFive unleashed has fixed input clock
of 125MHz as-per SiFive FU540 manual. This patch updates FDT
generation for QEMU sifive_u machine to provide fixed-rate
clock for GEM ethernet.

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c         | 18 +++++++++++++++++-
 include/hw/riscv/sifive_u.h |  3 ++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df2442..5c41ee5017 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -85,7 +85,8 @@ static void create_fdt(SiFiveUState *s, const struct Memm=
apEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    uint32_t plic_phandle;
+    char ethclk_names[] =3D "pclk\0hclk\0tx_clk";
+    uint32_t plic_phandle, ethclk_phandle;
=20
     fdt =3D s->fdt =3D create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -197,6 +198,17 @@ static void create_fdt(SiFiveUState *s, const struct M=
emmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
=20
+    nodename =3D g_strdup_printf("/soc/ethclk");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_GEM_CLOCK_FREQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", 3);
+    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", 3);
+    ethclk_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
+    g_free(nodename);
+
     nodename =3D g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -208,6 +220,10 @@ static void create_fdt(SiFiveUState *s, const struct M=
emmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle=
);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        ethclk_phandle, ethclk_phandle, ethclk_phandle);
+    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
+        sizeof(ethclk_names));
     qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
     g_free(nodename);
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e8b4d9ffa3..be13cc1304 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -63,7 +63,8 @@ enum {
 };
=20
 enum {
-    SIFIVE_U_CLOCK_FREQ =3D 1000000000
+    SIFIVE_U_CLOCK_FREQ =3D 1000000000,
+    SIFIVE_U_GEM_CLOCK_FREQ =3D 125000000
 };
=20
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
--=20
2.19.1


