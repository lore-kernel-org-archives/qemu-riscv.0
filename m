Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQoU-0003nf-RT
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:49:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoQ-0003j6-MC
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoM-0001P5-Pj
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:49:42 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42037)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoG-0001NW-QK; Fri, 07 Dec 2018 19:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230174; x=1575766174;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=NNMJxLcReNeWMhy8t2TG6+9zxcSSB/k8tJF+kJWWlI4=;
	b=ZTMozsDKPBIGvqmbtAyvRF4CbuA/UDT8d/I4tLivaw+b6+UvgHS6pXeN
	TkYyX0E7bF7xsMmPMG2q9lBg2wzkiicFUSEQ8Lz+tKb15Z3eWs9LAe3cO
	PXhmu8ke28DWUA68RdHUEyLDQvsU2aWLhLIEXC9TN8z0403TOCUZdhlws
	ltahsAf4mGuHy/ng9JtPOULV5kZBKeQcw5lSObMT5bGxPaUwomp82Mu9U
	4IoxqhBY/dr2zCusjrnIZ83CrxT3v+HnQ/GlcRZ0obEFuOvMMRCOMUFGl
	8wHe8Se1nac/o8EoGYtYFpMCNT/CleC/nqOH8J852oHQVNoJ83vVEFtgq Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="97343937"
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:49:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VdXmcCi4NUFEqcrj0GmEb6seBEv5w8m0zYwV2NCNzww=;
	b=LCw0bntNUPJpYIRWzihCGrQREfn1Qar0SmQGZp1iIiqmRkeniA36Gh3113Dxz8mfX+e1YzrIVjvoZAmmMdh5Wfd00M0cuonXIRxJY1UPND3SmWWLkIIDaP+w4fmhMEFVEK1K3tFdDOyRpGxpwbjalSjNnM474k8e3cHev87ZGYE=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1215.namprd04.prod.outlook.com (10.173.52.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Sat, 8 Dec 2018 00:49:30 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:49:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 21/24] riscv: tcg-target: Add the target init code
Thread-Index: AQHUjo/gPMgjdgGj50mGA1xxqDty4g==
Date: Sat, 8 Dec 2018 00:49:30 +0000
Message-ID: <d129ecbccbf6830893380006b8cefe2bcee569ce.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0070.namprd11.prod.outlook.com
	(2603:10b6:a03:80::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1215;
	6:GPgZVerGkK9BxiRk22wHN4AglPO1yAe1y0CLhHAkg80UaZL5UFc8IsyJbwqlTDpcL3NgU84wuJ4DmH4Z6m7VW2qItVYeVis5UrLu77y2CfgRqR+BquWwzxMB70TNooGWircQbNvd8lmgQTTq+v/PFtQr4XNK8sAE8AgNZKjgSPY2QF7A5OnhFW92S9pnrsn1kLDoEgD26A6+7HG4lFEnZIl4aMrASOLPzJv4CZhF+vRAiHQNcDEskaXDDjW7fG0HEtBiS3THpN6iAOA3CBFOrM0iVBdcthZqHPsI3R4AMQKtRU2+IKTLzIhX1U7tguF12xK53K97sdNzUc9oZh59Yzt3rrsWUkN6kYQfkkBlBS2T/Tooj/irQYxJN2veDZrz8SfHZMZw6Ji88WjrmhHzf2rQIvfXTdddI27FITNSZ/rSxuBkDvCWjAnfcU8iSOggis/RCV2vtEmUygDHJZ/8VA==;
	5:IMlkf+YXsuKAw5H3DTsnmeUgQY4WEtkj+JRac0GKHoExnuePTtlmDDKvf1ka76VYS0kOZ/ndDlhp8mJBIXrIZ1yT1K+uaHVW/5Cf14JbIoQGpfx+ZA4Bk02sHMPz25auYVzGK4LOer4wbMfuXaIKpyQ9X+Ew6Jo6czpMyej4pFU=;
	7:DgNY1COpvj2anWIkQjgKjsvUGEDsbInANYIQopGXl+giDNQcYzyAOYNGe+rofWv35yIn7d3tN+1Cz1WTTsnByEl0L3AidWbxqlVwkCrsifYrmfwe/JRRzzV7WpjEElfae15eb4HwCE8nwEGBjXXmCQ==
x-ms-office365-filtering-correlation-id: 20a0a95a-87f1-4bf3-908f-08d65ca7031c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1215; 
x-ms-traffictypediagnostic: MWHPR04MB1215:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12159A8E5F18AAA36C24938F90AB0@MWHPR04MB1215.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1215; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1215; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(476003)(44832011)(305945005)(11346002)(7736002)(81156014)(8676002)(3846002)(2616005)(118296001)(5660300001)(106356001)(446003)(81166006)(6116002)(86362001)(486006)(105586002)(6506007)(50226002)(386003)(76176011)(2906002)(8936002)(102836004)(26005)(186003)(52116002)(66066001)(97736004)(2501003)(478600001)(4326008)(54906003)(99286004)(110136005)(68736007)(25786009)(256004)(14454004)(39060400002)(71190400001)(71200400001)(6486002)(6512007)(72206003)(36756003)(53936002)(6436002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1215;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: hqUdHY4HY5kWQ5b3qoCll4K/Ll7J+yDzohxfHC+lh9iCzecpVYqAXJ/TKJc8ZZlohTJhpl1JrJ+9vKTXr1S19CH1Q2/Az0/VrC7DKbM0nVdytw5IiX3dJsCz99cSZ1IXJeoqtRqWcaMK8B73tktg3D57BYI7ip0zGdgC2e0kdh+UfajP9j1ljwg+QovPrb13WTnLv9tLKLET6d0oQ8jv/Z8tl9+/hqWCQPUFy/BgNdDHaTg9lv/JF09Wxmy2e8pktTcMjSJeRDNMQj0q5MumD/NcjyQG6LRfaZE0qf1LcEFso8VddVVfGyqm8f5x8de5oelRoOfu47C46dOpNr4Lc+oSuGxaYkCjmrXW4UfYloc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a0a95a-87f1-4bf3-908f-08d65ca7031c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:49:30.3013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1215
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v3 21/24] riscv: tcg-target: Add the target init
 code
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
X-List-Received-Date: Sat, 08 Dec 2018 00:49:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index e5a4642609..06e852d470 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1850,6 +1850,37 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_RA, 0);
 }
=20
+static void tcg_target_init(TCGContext *s)
+{
+    tcg_target_available_regs[TCG_TYPE_I32] =3D 0xffffffff;
+    if (TCG_TARGET_REG_BITS =3D=3D 64) {
+        tcg_target_available_regs[TCG_TYPE_I64] =3D 0xffffffff;
+    }
+
+    tcg_target_call_clobber_regs =3D -1u;
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S1);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S2);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S3);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S4);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S5);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S6);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S7);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S8);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S9);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S10);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S11);
+
+    s->reserved_regs =3D 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_ZERO);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
+}
+
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
--=20
2.19.1


