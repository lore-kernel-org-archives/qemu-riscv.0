Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkao-00058Y-MV
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaj-00053P-RI
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkag-0004Dj-Li
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:21 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaX-00047w-7D; Tue, 27 Nov 2018 16:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352889; x=1574888889;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=sidNXU5yVM+7IqPohoBeW2p2HhG15ntJbitTAMuLA18=;
	b=iYhXmkaXjgJyVyKnr5lt2LIcWC+l5XCoJ1xn2TS7X+TZKluJ4NyONHRR
	3jFhJUZRtcne9k+jWubJ0ROPxTV97m8Wt/zCppc6eAkoKYp6JxYY8pyvU
	5GAC3W2jh9wIZTvkdloLp/vSan6Q3+Fmi0mgFwAQ8GJTWK8XEBLdI6VO5
	UuIr5LAAoqzOwVcRW3aUC84KpybOWQHWSEDum89pZK0KVSO1bvCH8/M5z
	F9LW1DkULLbp3CWXd4EkQrPvfTCfTrlSKWhAp7T0+stKJF0iEDaTb6dw0
	ceFcq0wCwH4KYASTfjmtJoEMoHVVAczdTlTewrF/AoiY4m0Snz63Cjdj7 w==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="199812224"
Received: from mail-by2nam05lp0243.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.243])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=t9cw4SFWlVxaaORXxIiFgpHRQymXQ849web67No3N9Y=;
	b=XcmTsJrJWtuQWZ3A+V/L8pSKJkwz7GKyKcQf+hZL2IwSnoOCR3b5ob4x1uq02NaxP8Rhy5DKQN/Sbvs/cDod8x+ft1cpOxvx8xqHY0uiZpQwNE1hl9Po/fNE7CthZqWE7JbmOFoqKSvmgs+82rTmm5SBFY53FpfmKcy30lSESi8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:07:58 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:58 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 09/24] riscv: tcg-target: Add the instruction emitters
Thread-Index: AQHUhpVGMzq5Z3IDFkSDRVNXRu38xg==
Date: Tue, 27 Nov 2018 21:07:58 +0000
Message-ID: <9075ac8fdc90ead4b5e27fd598b8b51679d454a6.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0036.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::49) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:+fc6/fGHQmQsQXpTsDXG4DLdU6AkagG8XlDnFbVVY/yghKUqOFsYVesp2AwQykqe772EB/39qXKy+hS15fBzSEZaNg5nLHxsogXUxe5QAKtOgCzr6s1iDUnBFl3i4MmmXclrHdFCPGXb1lFjxcgTQqgjczLaGXp/eq6zqHX3eGb1iqVpZJgODyjEPdzW/IptSXPIDSjE/2dE5PozmZHB3mtTQXQsV75rJDvfDAjX9qwIOeSP4k5dDXptzJKi/4Af0adjzhINZ7LdH7CYQxkUEdW0prEgi6JKbFmGIl3qFG3L9EvZGTcLKIY4EPA++CoUrcVYFQ+yeo0ehX3mhAuZ+hre0pid7whW3ewWxaITHR3xBWJUo6F5l6I4tNMirXThD28fQvGjdoFZjnCF4FMuMPs6fl9u9HXQh7Z64BATYOz30xleYvtw9vsEzOE3RyaJLywRjchMIxv/8p8qIoCTCA==;
	5:8vtIQpALrvuhwe4AqQB79L9LjmRQQXwj1yCogajBCGsdBSxgxdIC4x2isH+3JZr19jDMbQWfz2dSWFB8zdeGibRB4UyV32XsrLI4pq0cvoNj0s9AGhQFawDXk9o3bMUlm0nJZzH9SMR55giWFVSNw9+zxyFQdHvnGrQCSJRtrD0=;
	7:t90/xx4TcUCPmnjYJ52cutfCWemu3pcOqGWT8AQE2BuaZxFFkUMvtJu4s5Y5RMuWlMfSg0ZQg+gaXXMKkeHSja4ErbBlU8/5xO9UcTWVaRTed2fegJ0C/yFK1VCXZvCKCoNNd1Yg/9Ixgq4B5mhYVg==
x-ms-office365-filtering-correlation-id: 314ae4d6-ecf4-45c1-4536-08d654ac686f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB094386E5B66490C004DCD7B490D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(118296001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: F3ze0K8MH6Wei5xmvu4MFqaaxewye3KUS0Mtlv9g/SyNwCg7Y8/DkFzSaWAdSJYAOeBy1O4bOv+zOKs61JEagMlQiZUispIjOHUBJkK5U/kPhgZFjxeGcC1pMehNlyk42lSd5geRB/n91R8xWzYUd+kzSZYEvvvM9RWMEnP3eGD3RhJg2ku0cTha0QY53jbLKZK+sK7XQFILDDRbqqwDwQhC3TuFBcBND3iKE5HHFHDev4Yq4I3p4bGElofm+8UgH6KXmTmM/UaoII0xYzkNBfgwUnXHP1zsKyZh97l7sBwAyDM8FhLTD1p36VY19o89LxXCCji5gmKZf+lYPjrTsW4Nqbqb+QPHs3s1+NFvaew=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314ae4d6-ecf4-45c1-4536-08d654ac686f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:58.5703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v2 09/24] riscv: tcg-target: Add the instruction
 emitters
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:25 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index c659c4de39..ca7ae8939a 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -343,6 +343,46 @@ static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uin=
t32_t imm)
     return opc | (rd & 0x1f) << 7 | encode_ujimm12(imm);
 }
=20
+/*
+ * RISC-V instruction emitters
+ */
+
+static void tcg_out_opc_reg(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGReg rs2)
+{
+    tcg_out32(s, encode_r(opc, rd, rs1, rs2));
+}
+
+static void tcg_out_opc_imm(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGArg imm)
+{
+    tcg_out32(s, encode_i(opc, rd, rs1, imm));
+}
+
+static void tcg_out_opc_store(TCGContext *s, RISCVInsn opc,
+                              TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_s(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_branch(TCGContext *s, RISCVInsn opc,
+                               TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_sb(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_upper(TCGContext *s, RISCVInsn opc,
+                              TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_u(opc, rd, imm));
+}
+
+static void tcg_out_opc_jump(TCGContext *s, RISCVInsn opc,
+                             TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_uj(opc, rd, imm));
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


