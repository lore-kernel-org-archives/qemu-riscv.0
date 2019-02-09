Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0J-0005WV-LY
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:00:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0H-0005UV-Il
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0G-0006zJ-M4
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:21 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0E-0006iV-1Q; Fri, 08 Feb 2019 20:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674018; x=1581210018;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=1PiYgcM7gr2VOj4eFrg/q4577fExdLTf5WIRDk3nfZc=;
	b=M+xY83Mci2lB1NOe0oB7sILLL5qgICc9VbKQMt0+5MJdkUx2xvoC1/vb
	LxmMCcnv/EAuCzRdQJgM3pukIzihMZfrXMtU3gm9cRsEYwmjaa/nTVa0O
	6HPeQqHgc+oWiC0Di3mHbIW7QqPI8gDfqXbWveQr0wQuBmcX7UIPXTpn7
	lmf6ZCm/2efSQmdnqUCeG7SuOtkzDpl1QACPcXdsNa4dACxdgwHewcfR3
	/K0zDe2AyVRhxwgPKqBFxxD8054oSSmEQc6GHhzX5DBAAR+VNnQxHTbnF
	7iTHj2pXgO2N7P8GaKBODujLMmNvMT55Lh+LzRy+BAONnKPqJqVIdBf3c g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="205937703"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yiAEUNipFoEG1WMRVcW3SIK9batgNWEQBZPp4TnqOgY=;
	b=AcFPENPGkvWyBMEvOsIR552ixjWq2Gcz2Q/EPZPMEvWhADpDNfGe9VquPLum2UOvJdkCU1LWlGQvLeO9HAdVL2cXwGjKAWq3GYt6aSDnKFNpbcQz2EJZrEhmOiNQ0JK4Vd6G1yYCMeii/zOxhHvSDcwlC7XN9/MdMCTltR8yY1o=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:14 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 06/11] elf: Add RISC-V PSABI ELF header defines
Thread-Index: AQHUwBLQ7SxWUWfnGk6MIQgNJiEIng==
Date: Sat, 9 Feb 2019 01:00:14 +0000
Message-ID: <9bff68f6edb19516f63ba853aa63984d4d3eef4b.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR11CA0060.namprd11.prod.outlook.com
	(2603:10b6:a03:80::37) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:q8GET1foJDn1PIac7bHjvn6OTIsILQzGYcEtqd1QWJo20ypr2Aal1dEwuCQCQkxi5Pg3FO2gUnLLj2wgE6pKwyIrcM7A5ZdZexqIM5VcEnSLO1WTs9j+10ESuxlqe+pZ+g3bkcO+nR+aph9bHDkDKjYWfmQ/FtcRJ8IQzk/MzlNOFtM2/4xzWdrRmJFXSW7VGfOaccuJ06hsTZ8GzaVSyTuZpLWxtlfqLTISNXZjraZ9SXhV5cqNAG9vag2xxR6H0iS+4VF0LPWCWsfuifW4YGIvARQakCiLj2oavIq9XHXLchASlRW7hihBDcfWVO5Epu5EKkCFEshmzOC//Dp/gnNuqlcO94HLK0GBMiMgs/uoBi7Fs0pAYW+6Gd96pJv72u9suI+FxO2g4/lZvYJcQF28DMiSq+8+LCqCDrg0AXBgHik58WVBxZz0o7uPCc8dbT2hznTr/p9sg1SVtCMGkQ==;
	5:Q4HpBGhvHocR7rfdxGxuPdg+ETvEYgf4rzjYFm7wcfB6sUKfN0UJK5qGNpUQQk6i79RTNfwtJ41wjfgPVHnFMMp1dV1MUrfU7iqwDscdcX3+UB6l8EAbHWFjo7lQPFM/FDfQpwzypzWoLrmRCDkqYQIr7wOOVq8HmbvN6fYF3MF6QZTB7f4ofUg/UDhJ04OtEK1nmfn090lpkwWCQ+ISNg==;
	7:gNKAczLo228ajkwAdc2+qLcqQw107YNFEo3gcNc7P5yI6p2gCFS+PwURxek7LnXDNLoOt/yaEvgEeB96+FL2pTO3k/ZV6+/SNqaCa/UDLz3u34rHEXw/Us5SKLZ8j0Zid0k3/VMXW6fBFs0+Z9LOsQ==
x-ms-office365-filtering-correlation-id: 994a11b1-6a91-4b08-079a-08d68e29f323
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB040925E35E1F6BA4C1DF7AFD906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(6306002)(53936002)(217873002)(97736004)(44832011)(256004)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(4744005)(6436002)(50226002)(966005)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CuTewRrMZseK/uBrS8Gqf7Fg43lqzXJowK9zYkKlVnGhJEHaDvRJ/GcQAMZRvZZDUvkCug7Wt1xd++mq5D5Q9f2gMRb1qhPmUhH1dal+ueHeGzu7lKbAAyBZGv6s+94tphDlr/+aSkEY11yMVFQ1gmGiSyAEm+wX7xVGCzZl1nC+sb8lvLlJo6Flj2YXASzWA13FVrlsB2eHryRfu0tKUVnKb8uZ+NpXHEqzuohuL547MdYrydEkzcLIfMzknoh/x6SziDsC7We0yVv7tX/GBEykjpdQ0IaWb7vYg+gDooJ21g2Cf4dTFDI0XQoftIbhk0hDlXstFy/K518QfCgkR9DZ2Z3Lx3kkL1BK/9R78O+hLIh+BqLcEUi55QDFPky0XOCfNDyL47q7eoszLwbs6LK10TZZIT2XBly/X4tKLfg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994a11b1-6a91-4b08-079a-08d68e29f323
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:14.1484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 06/11] elf: Add RISC-V PSABI ELF header
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
X-List-Received-Date: Sat, 09 Feb 2019 01:00:22 -0000

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


