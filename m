Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAPc-0000Bq-3U
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPZ-00009T-Ra
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPX-0001GE-Qz
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:13 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39067)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPQ-000181-3K; Wed, 12 Dec 2018 14:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643784; x=1576179784;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mF4O0+bfADNh8fzyDt27zpjmLYs6qg05LJuV8MMK3Jo=;
	b=KOOYsPCtl0E3Fyn5KgzdXFP+dD1zdFSgJYDfIP64IhsAuTkZ/UkjCU5G
	r46ZNh6FhzbN8iC68X5tmAmF7ohe3S1WHustSIaiJNDyZ58mK4hh4pwO5
	QmNK9Vu4asAXPIh2baVmVl5FZQ/+dgTYbCZJwdrA6XpeVKMbS2jrGRYwo
	geF3qbWHr0dxB2XNICvRGf9dxinLNrGnJiQj0ok6xREXXzdiaNTP4zVKv
	+hKwiaCKrrF3gph4uV3EF3S5OlQ1B7JvBpGlmp2bP8lYsGfg6nwgsyqCs
	FIQLkHeI/ZchX/LWIiILpCL/K/1HYVzSaP7PrQFVYAzYWhBxb5Vo8mA1L w==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="101342189"
Received: from mail-by2nam05lp2058.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.58])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:43:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pjqulYK6IymM7ZlRic1bd6OprINR9qsdhN20yySqNEE=;
	b=Dy+xclwe5v3BaqP8/5WsAi7LACz4yv+36hWa1GoaQ6xy3LHYuYbVvi+kHIHag+oOO2fo9ZDuy5Vrb4sh46hWymWaw1eO03MgT5+5ZVCWDarqXaM0G/qFPHjbi4cS5EJkIOVx2m1AOcAoZ6b5KIKHYco7rAivtz/h4eaCBMEcVig=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3744.namprd04.prod.outlook.com (10.172.169.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.19; Wed, 12 Dec 2018 19:43:00 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:43:00 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 01/23] elf.h: Add the RISCV ELF magic numbers
Thread-Index: AQHUklLjtBwPb3tJ202ZJfv96JcjxQ==
Date: Wed, 12 Dec 2018 19:43:00 +0000
Message-ID: <da0e24e750d8c8f664369daebf99109c4346afbf.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0002.namprd04.prod.outlook.com
	(2603:10b6:a03:40::15) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3744;
	6:KV4SrlleAV3Yo/XPGlynV6QaBL/xSltzRe3LRk7AHJRQmKJuxdumMCCW8LZNCAa4SSnr/y6xtqgeWJpMRYjRUXrL/q/y7LJNSixqmZXqY0htsJGZsnaXYzek9WuI6rGfdgIYaS+X+ZumpXuajo9uFkxYFwfXFBen14JIHce2o6o1RhaOQy8OY3lbBe+8oPUDIBwr/LSkhp0RDcQTQ6F5kZ8pThand+EqGsdUfU0epqI8tZUdbqrlDHO1HBDL8YxllUPLVDzC39MuuvDGcusGEUgKB+mMMc8cCORs+k4gCFbwcRICpGwmFRKKp6TLfc9y5J5gRTj//6ohkl9A9u1e/E77eQonuWF0tyKTgAffFDn3gm10CbTTs9+DFdoAmmCeRYE0nLU3fQ1HW2Sqe9GD2ciTlJ8V0Xlkin19mGy+uYZoYn+MW8YFfXeoeOab81EqM+Tg83bI1pOudt+g8z64qQ==;
	5:1lT+zlEg5e7mNv5RlLNJ9SVFzmlsdBUPlchViQiSXUd7n1slFsLnLEgpTutJRQZTahJPLDpuO5t7i9N6ztsRdPmZeHyo54Fle0GIbwXgQooiQtbzimHjX55fMKNsFdtFLn6vu9ikTk45/LO214REL1axRcDFsgSdczBnGfJQd6E=;
	7:uTAoh6N1jCVSrTsJh65tL/IK7oFdnzaYMUJYCp9//LaQnrmRwxd9CZ6RB5IiN3ncIya8+EYBXpCB3jjMuE6MDoDnRk4mw0qSEhdd3KYTgQ/WP2K4CR6bBNRW9h+o/qJih2obh8wOg0beL8BOYnV8aQ==
x-ms-office365-filtering-correlation-id: 08f08168-b97e-418e-08f3-08d6606a061c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3744; 
x-ms-traffictypediagnostic: MWHPR04MB3744:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37442C82CDB752E068C1D23190A70@MWHPR04MB3744.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3744; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3744; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(217873002)(2501003)(81166006)(81156014)(8936002)(7736002)(76176011)(316002)(575784001)(97736004)(8676002)(86362001)(256004)(386003)(6506007)(52116002)(102836004)(6512007)(26005)(186003)(50226002)(6486002)(4326008)(39060400002)(6436002)(66066001)(53936002)(6116002)(14454004)(72206003)(25786009)(3846002)(36756003)(446003)(478600001)(11346002)(2616005)(476003)(486006)(106356001)(44832011)(68736007)(105586002)(71190400001)(71200400001)(5660300001)(305945005)(2906002)(118296001)(99286004)(54906003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3744;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: hft+XxAlmkNUYpcT+8pkKOUFVbSwwomciIhuSAS4urrS7DqSYfzUp2e+RVnSgvIdc4II3ZnZtm+LSHLHD55XoohvI1IfQniol8+RjFv9uyzC9XLRdSSDjkFKT2remdQfTI6wX01ymoNjssMGOlTpi+rLJ2cYcClLGy4wKwuB6nKjprAGY3gG/x6KpHf8RmQ+oq+BloMUe3ZSO61KTX9X79l00x30R/ut8uDTw4NKwjITuHrldP8eaUaTZCFN0SJiipBaCWz7pUIBiQ1XkPIslZ8vJSaSxYb79jhwgwZkRD7Bvb2YvyBSYLt719lvKM0P
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f08168-b97e-418e-08f3-08d6606a061c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:43:00.7460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3744
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 01/23] elf.h: Add the RISCV ELF magic numbers
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index c151164b63..0ac7911b7b 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1338,6 +1338,61 @@ typedef struct {
 #define R_IA64_DTPREL64LSB	0xb7	/* @dtprel(sym + add), data8 LSB */
 #define R_IA64_LTOFF_DTPREL22	0xba	/* @ltoff(@dtprel(s+a)), imm22 */
=20
+/* RISC-V relocations.  */
+#define R_RISCV_NONE          0
+#define R_RISCV_32            1
+#define R_RISCV_64            2
+#define R_RISCV_RELATIVE      3
+#define R_RISCV_COPY          4
+#define R_RISCV_JUMP_SLOT     5
+#define R_RISCV_TLS_DTPMOD32  6
+#define R_RISCV_TLS_DTPMOD64  7
+#define R_RISCV_TLS_DTPREL32  8
+#define R_RISCV_TLS_DTPREL64  9
+#define R_RISCV_TLS_TPREL32   10
+#define R_RISCV_TLS_TPREL64   11
+#define R_RISCV_BRANCH        16
+#define R_RISCV_JAL           17
+#define R_RISCV_CALL          18
+#define R_RISCV_CALL_PLT      19
+#define R_RISCV_GOT_HI20      20
+#define R_RISCV_TLS_GOT_HI20  21
+#define R_RISCV_TLS_GD_HI20   22
+#define R_RISCV_PCREL_HI20    23
+#define R_RISCV_PCREL_LO12_I  24
+#define R_RISCV_PCREL_LO12_S  25
+#define R_RISCV_HI20          26
+#define R_RISCV_LO12_I        27
+#define R_RISCV_LO12_S        28
+#define R_RISCV_TPREL_HI20    29
+#define R_RISCV_TPREL_LO12_I  30
+#define R_RISCV_TPREL_LO12_S  31
+#define R_RISCV_TPREL_ADD     32
+#define R_RISCV_ADD8          33
+#define R_RISCV_ADD16         34
+#define R_RISCV_ADD32         35
+#define R_RISCV_ADD64         36
+#define R_RISCV_SUB8          37
+#define R_RISCV_SUB16         38
+#define R_RISCV_SUB32         39
+#define R_RISCV_SUB64         40
+#define R_RISCV_GNU_VTINHERIT 41
+#define R_RISCV_GNU_VTENTRY   42
+#define R_RISCV_ALIGN         43
+#define R_RISCV_RVC_BRANCH    44
+#define R_RISCV_RVC_JUMP      45
+#define R_RISCV_RVC_LUI       46
+#define R_RISCV_GPREL_I       47
+#define R_RISCV_GPREL_S       48
+#define R_RISCV_TPREL_I       49
+#define R_RISCV_TPREL_S       50
+#define R_RISCV_RELAX         51
+#define R_RISCV_SUB6          52
+#define R_RISCV_SET6          53
+#define R_RISCV_SET8          54
+#define R_RISCV_SET16         55
+#define R_RISCV_SET32         56
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
--=20
2.19.1


