Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhMu-0002AN-4Q
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:18:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMr-00028n-Is
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMq-0000zo-NT
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:53 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15907)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMh-0000uC-K9; Wed, 19 Dec 2018 14:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247123; x=1576783123;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ozKkth5Lpmhh6a1f0RVhVxytCTa1O+2hS5aoA94WNaI=;
	b=jbxtYcGPpkwWbKf95RxBs1hhLQ//RfKqWAP17TI8UCCdtvL6ODOgl8DP
	QUYpeU2SONgvmMSInQ1kkkw0zIiFhuC210xmq6Y1s3OSAjSjgRh0BXNSK
	VVqBtCkkQVHW7zCqPMBPtlgvhzdGbJ9EurLW9AVcjTRjNvdQvxPE/tiVJ
	Om+yTnAbccbC4DlcydM2JtRdXmYgzZjjeV3Wp0aiAf6KRSmdhu+nWBoLZ
	PzQn6s15vg/2QgeTFZY1Gkp4iGYdE7nq2lnxfffOpfIM6JuTGAUYYjVhd
	zsMtUNzfkUlj3AGufW6UwL1oRzi5AGQI8pwlTyRnPEV9bsxtdQR84Vfdm g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="101923928"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:18:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=g3EpWwM3+GWAtHAIijlDpPzqHOHH8rmQhOfX7m+NOis=;
	b=NzjKqoj3lI6dkRHYmkTxizq/4o6oalRwAVWOecCyZ8+IF4H5FGKf+LrgagSf9JyVZQEzVbjliaByPDqisSrys8llbq4oduq1cyt3fOureu2AJ7uJGV9hdcy8dorkE8Be9ZVOQAJLOHBPi9JxhdhpCj5isXI/jIAoUXw/UJNi1oM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:18:39 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:18:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 13/23] riscv: tcg-target: Add the out load and store
	instructions
Thread-Index: AQHUl8+lt7Rg9X6Dekaasa8BTHMqAw==
Date: Wed, 19 Dec 2018 19:18:39 +0000
Message-ID: <d5d88ff29163788938368bbdbd18815d59cef6a0.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0011.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:UlfsiIv+0mCYgOI5RFqghfMVeqjbTrHZGzn1h3ZAooh0WTokDNhszSbQdZ5GhjjsBijZnDCBipxluWCFctpdOgthjsuOMo+vJBIj6gG2zqS0rV47jU422lcfvMob9CUkfxzTdQX7rFmqcbg/aKVY5RFvC68ekSGLnv7dKh/a3RgOihNtPJGclKvjfmw9Xx7uvABnj2qy+wDhxh3V4IJTaAwY3wKdMaXymyB+yhj37kzjInReaUeB/iRWw1S8ufzTowsxq+6JaU7KFHA07ZOLHWe41GKVRgTZE8PVmTBIDKP4m9swxHci8NwICyxzLArBlke6ZdNoUu7eSXwU3FrsVYrhlHNE8xuZKYeVyuxoziHRxcs/pKR6kQAeloRUYEmQbGG6SS6qn6Tx8BpKuWNews/oms+BROT/7/3N5CInV+V6fLlaBKu6qQ1xTc3z7ARV/EZadXgY24Pd0rbR0xaCZg==;
	5:tjLv5rpreUC6UakB7jic1I5msqo45m0cGbZOiwF6GX8ySQMhQ4DadI7saj3cz/r3NR8bW2ulQFHcThWG4B/ru9laJgbuUwe7XI92fnZfAWV/FTfqFAmSgGbGk3k+juuBLy3HhFap9+yGYuUN1j3FrI9qvpsM5DyVVjgFOt4pjRQ=;
	7:dvYO/BBear+qIs7DqeppFQAuyzrMi3MvTdjH5pGYR3nIAzmMJ0gE/isGhgSMDd8Yi8EbBdoMcUkYyABqZzQCtKmuQPj0ZeoGC789iAXRhpbj4hARis9FseCgsyXn5dKEKwS35egozhEv955y02is1g==
x-ms-office365-filtering-correlation-id: c6d20c31-a033-4078-bdc9-08d665e6c80a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08484D1470C5601A16FCA51A90BE0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(6486002)(14454004)(4326008)(72206003)(8936002)(86362001)(2501003)(50226002)(71190400001)(71200400001)(97736004)(6436002)(8676002)(81156014)(81166006)(36756003)(68736007)(25786009)(5660300001)(478600001)(118296001)(105586002)(53936002)(256004)(305945005)(7736002)(6512007)(316002)(44832011)(39060400002)(66066001)(54906003)(110136005)(2906002)(52116002)(6116002)(76176011)(26005)(186003)(102836004)(99286004)(486006)(446003)(476003)(6506007)(11346002)(2616005)(3846002)(106356001)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: Ei5uMt9Nmc2a1fAFRcOXLrSsykXYk8/xrEbS+licNOsnI7G7ouH8IGV0NHYw4CggyICpLlNjnJGdZC1eWHEEFwluyyp5Kzv9XQQdcEnoMSrRJ2N5md2963ZA1hMWoxqMz+02t0ycEoQN/3rq54JZ9tpTN1sKXa5ptjOmDZuBgKz1OgA398Ymxy8hSqHvC6Arphcss2H66BUnDqSGQ8HxQ804Yk1PwVZlPDIU62b9BLIu4ennLJGC6ijHT0+hDMM8YyeBSIMi44pKaLpBVDy0pfdxcm7d7qTG5GjWbeQzCUer+wRvvg9lbGUMsdqOlWfp
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d20c31-a033-4078-bdc9-08d665e6c80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:18:39.4696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 13/23] riscv: tcg-target: Add the out load
 and store instructions
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
X-List-Received-Date: Wed, 19 Dec 2018 19:18:55 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 48399480b2..65718df7ad 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -630,3 +630,68 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, =
TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
 }
+
+static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
+                         TCGReg addr, intptr_t offset)
+{
+    intptr_t imm12 =3D sextreg(offset, 0, 12);
+
+    if (offset !=3D imm12) {
+        intptr_t diff =3D offset - (uintptr_t)s->code_ptr;
+
+        if (addr =3D=3D TCG_REG_ZERO && diff =3D=3D (int32_t)diff) {
+            imm12 =3D sextreg(diff, 0, 12);
+            tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP2, diff - imm12);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP2, offset - imm12);
+            if (addr !=3D TCG_REG_ZERO) {
+                tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, ad=
dr);
+            }
+        }
+        addr =3D TCG_REG_TMP2;
+    }
+
+    switch (opc) {
+    case OPC_SB:
+    case OPC_SH:
+    case OPC_SW:
+    case OPC_SD:
+        tcg_out_opc_store(s, opc, addr, data, imm12);
+        break;
+    case OPC_LB:
+    case OPC_LBU:
+    case OPC_LH:
+    case OPC_LHU:
+    case OPC_LW:
+    case OPC_LWU:
+    case OPC_LD:
+        tcg_out_opc_imm(s, opc, data, addr, imm12);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is32bit =3D (TCG_TARGET_REG_BITS =3D=3D 32 || type =3D=3D TCG_TYP=
E_I32);
+    tcg_out_ldst(s, is32bit ? OPC_LW : OPC_LD, arg, arg1, arg2);
+}
+
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is32bit =3D (TCG_TARGET_REG_BITS =3D=3D 32 || type =3D=3D TCG_TYP=
E_I32);
+    tcg_out_ldst(s, is32bit ? OPC_SW : OPC_SD, arg, arg1, arg2);
+}
+
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
+{
+    if (val =3D=3D 0) {
+        tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
+        return true;
+    }
+    return false;
+}
--=20
2.19.1


