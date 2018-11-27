Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkaV-0004Zf-Ja
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaQ-0004Ml-Rg
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaN-00044p-MC
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:02 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13550)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaG-00041P-01; Tue, 27 Nov 2018 16:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352871; x=1574888871;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=65pGOu6sDsIxToOzDZFuLeKZfHZkjGYEDkPXlkFtKMM=;
	b=ma1Io0BXkD8EpKeR6WKsFu0qttqpc+eMaZUgUJLq7ksaxd92eOIwPcH7
	rJbFVwDCsgFAEeCCPjMnM3HxHUuy6lbiZ97Lw/JP8PFaDWeVeud5wl+Bd
	5VyIl6jOpGZvupAp1BQZECcs8P8wNgr3vJEuLxRZirK8e18ObR01VwaGv
	OWq6K6vrWPNvN8UhM+yGG9fGUzlmDUk6NCuvzhkkcNVu45U/eP9wsYSOj
	3WBVwoPxH3gU014/lUSDLuJRRW+/T85W+7n7MOWpHp/8scoClQZI9XXrg
	2FfYZiy2ziCSTC3GyB/StR+7c2hQWn7rQxGhc9c5rqCYx6yA98q8cLf3b g==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="199812216"
Received: from mail-by2nam05lp0240.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.240])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IH54vgu7uHZX4bslauXRMqm0Z4tUChYP53L6iS/jAqU=;
	b=m7UJ4nV4KJGnkXfuYny6i4RADToiZhbEC3zdEDKgdAjDJ55HM0gLibFjYXrmFEzd8lBhb1vYtmig0TZmD7wpfkobYfSpdU0YJd8aL2WDIxF8NNzz8T9Z7lvSzjxjcuYywUfZpTIYGAtzB6Sup4c8yOej9DVn7m26IM2X4/HvGGw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:07:49 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:49 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 08/24] riscv: tcg-target: Add the immediate encoders
Thread-Index: AQHUhpVApDesU1dCp0yat8nOQRJJ0Q==
Date: Tue, 27 Nov 2018 21:07:49 +0000
Message-ID: <0ee380a9ce2d7290523b5d06597c74ea14ff4174.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0035.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::48) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:6/sclif7Pb7/HYly/KCQUsYs6nIL81nDvqu86UEDtwvFpXpq3sR2xZLlrgINhwXD1D31TBc7Lt8HQ8swxRiDr6LKDrcQR23WQz6zxGpjEDtWlNRteNAyGC579g1En8rMWYPAMB4qnnFgVIKkzjtwL8OrByzZlZ9xrxMDCjq1/C9EL+8xT6Mm/sU0rDckIern/iFhChHEFmF4oRMrrQRZ+AYzbpXuqlabH5GGWqkVl9oS3I3zzkNFhYLplXS2FsP2tkmaG+plZeaHXawh3JZe7/CgGHnq1CRjd8wORhsBrJIXDSfP9de9RXEAN1bjuTWzgRjaYUcrM/ER/A7pCqDGwnls3AVvSgVKV7HPlK8bOTgizrbAuKJ6poOiMogvPA2+GmhRyKusN5fXZ9o2HDxQpZdTYvoeTqHxTE52RQu6mtCHzjTPHNpAM3kgCAJJIFvp9YZaCSziTeHiSS+JTHCiFA==;
	5:Sfo+Z7LqhMc1DK7j3zzZzecFxjLHxthpLmOCkpmC6KgPcB9eMAa2V1YwM5e03pWBgW6PaYikCtPEdQXSu9AXsU/RhIZshxO9nDqoTQXbhe4wcc6Tc2XYnzYJFn1UUx5zxpv/36zmTRFY3TJaY0KJDJk8zMNqlLy6/rBDHDXAgis=;
	7:UqMXwprNGKtaX3FDoDrx+vLI2pK0eA3vLPDRCy/DlQDdBfu+1zyjxbZkk7jJKgMcnNOYopy3R5ZIE8HPbLhOWwKcCzTt/HbHFwFWCz1gIocp496lVGVkFl65Y3ABYYh93dnDsCE4DDYo89GJy3ouJQ==
x-ms-office365-filtering-correlation-id: 58b773ef-c467-4aaf-baa0-08d654ac62d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0943993A34ECAE6F156563B190D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(118296001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001)(14773001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: O+Z5fhPoG0wlrdkFHZYD05wePN7/QDbfxRwpK+pHkbptyHJdvgT6TDJeAO0HENi26eZ09A7UldIU6x3ZRmsaR+9BfPAqeyHYk15k7p+kow+cslKWPyF/Wor+uMh48IHCISfNa8LJlp4JLT3ckosa+1pRXEodnvfVpxuugM4MMN9evOoz4Puy1cUibHljN3BUCNsUSeYQLcsi5HXlVsI3BFGEBku4u+WVbkOU5bgXv7J70gsuDUcMCKX9e5PZT8/f+9Xz1HsC91qItIgBBrY3g5uBoa17hsHFspoaL/B9q78uFYVSEnCjtMSKWnBnJzcRxAc0X7sHxnIAZYkA/IgRGqgbvs7tnUYNey4OHngS1cw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b773ef-c467-4aaf-baa0-08d654ac62d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:49.2107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v2 08/24] riscv: tcg-target: Add the immediate
 encoders
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 105 +++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 5719af3c08..c659c4de39 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -252,3 +252,108 @@ typedef enum {
     OPC_FENCE_R_RW =3D 0x0230000f,
     OPC_FENCE_RW_W =3D 0x0310000f,
 } RISCVInsn;
+
+/*
+ * RISC-V immediate and instruction encoders (excludes 16-bit RVC)
+ */
+
+/* Type-R */
+
+static int32_t encode_r(RISCVInsn opc, TCGReg rd, TCGReg rs1, TCGReg rs2)
+{
+    return opc | (rd & 0x1f) << 7 | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 2=
0;
+}
+
+/* Type-I */
+
+static int32_t encode_imm12(uint32_t imm)
+{
+    return (imm & 0xfff) << 20;
+}
+
+static int32_t encode_i(RISCVInsn opc, TCGReg rd, TCGReg rs1, uint32_t imm=
)
+{
+    return opc | (rd & 0x1f) << 7 | (rs1 & 0x1f) << 15 | encode_imm12(imm)=
;
+}
+
+/* Type-S */
+
+static int32_t encode_simm12(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0xFE0) << 20;
+    ret |=3D (imm & 0x1F) << 7;
+
+    return ret;
+}
+
+static int32_t encode_s(RISCVInsn opc, TCGReg rs1, TCGReg rs2, uint32_t im=
m)
+{
+    return opc | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 20 | encode_simm12(i=
mm);
+}
+
+/* Type-SB */
+
+static int32_t encode_sbimm12(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0x1000) << 19;
+    ret |=3D (imm & 0x7e0) << 20;
+    ret |=3D (imm & 0x1e) << 7;
+    ret |=3D (imm & 0x800) >> 4;
+
+    return ret;
+}
+
+static int32_t encode_sb(RISCVInsn opc, TCGReg rs1, TCGReg rs2, uint32_t i=
mm)
+{
+    return opc | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 20 | encode_sbimm12(=
imm);
+}
+
+/* Type-U */
+
+static int32_t encode_uimm20(uint32_t imm)
+{
+    return imm & 0xfffff000;
+}
+
+static int32_t encode_u(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_uimm20(imm);
+}
+
+/* Type-UJ */
+
+static int32_t encode_ujimm12(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0x100000) << 11;
+    ret |=3D (imm & 0xffe) << 20;
+    ret |=3D (imm & 0x800) << 9;
+    ret |=3D imm & 0xff000;
+
+    return ret;
+}
+
+static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_ujimm12(imm);
+}
+
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
+                              uintptr_t addr)
+{
+    intptr_t offset =3D (intptr_t)addr - (intptr_t)jmp_addr;
+    tcg_debug_assert(offset =3D=3D (int32_t)offset);
+
+    int32_t hi20 =3D ((offset + 0x800) >> 12) << 12;
+    int32_t lo12 =3D offset - hi20;
+
+    atomic_set((uint32_t *)jmp_addr, encode_uimm20(hi20));
+    atomic_set((uint32_t *)jmp_addr + 4, encode_imm12(lo12));
+
+    flush_icache_range(jmp_addr, jmp_addr + 8);
+}
--=20
2.19.1


