Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQGC-0007lM-GW
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:37:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG4-0007b2-2P
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG0-0004vl-L2
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:07 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:18123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFt-0004qt-Pl; Thu, 15 Nov 2018 17:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321417; x=1573857417;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=R1D3mUhadKf8E/Xc4LVi5ZVgt9L5Bxe3N2Z5lHT9eR8=;
	b=P/qY21sI/WGbF7oNXc+hAKA4WL5l/IHRxFMfw/Epckvbnmlfl6GcoE+n
	zPRGpzLax2KXZS4f+kYl8f+U1JflS/NLBNIhxHgNrB8jvC+uhiIFJSqkB
	DgYXaSDCrcwXasyzKGlFMQA22PAqReU40YDxe4veao9bfgEyHCKm3H20D
	kzR6+3e7cu857QKeTMAvrCBkT9ohiPFEnML2lnNZxdj6dfFDzxOfRqRgz
	5yeKIasRWfXjbgB/mcC3If/mndqSK7dyYteaYSFmd/agdPgcmYjk+BioK
	f2ygISefZHYXeLoEjCiFsYAvCS/rQZA3bS1eNC/r6ytxnPjkNxxIpHkYg Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884510"
Received: from mail-cys01nam02lp0056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.56])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L/2REaYTQNBMFZ1Y5DzEq8/DAR1Xn0k7rwxuYYJSjqM=;
	b=lHSkE9cWFxuVa6ptXelfVGdf6lHH7mIvfhuLNYlUs/qKxieYUNTee3+SrLOA6eObT4ZaRcdrVWfHdqiCsD/etHBibPxHxxBrb8sihzGeQDGlzRnoyxjo7vrRQ2nipPAljdsDgTiyy/dkGB8b3x+GAwaMBwVlLnVcstyltyyZi68=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:36:55 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:55 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 20/23] riscv: tcg-target: Add the target init code
Thread-Index: AQHUfTO24B1g2SO13UKkQ6rSeWsicA==
Date: Thu, 15 Nov 2018 22:36:55 +0000
Message-ID: <cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0102.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::43) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:xhKeTNPlHQkXwdEQkUDiJITvVO5Or1avxJOnFg9AZ8vxldvbKvsPaoWAaKFqp1XVaotRgIsga0kV5hlVwzYJx1LUrUKIBzhKbt4q3V8nPx285rMBAgnwsPa/v3AKXoRZiVjKV5+XqFkTVcKJ6dguuq3eLUmzJn9I82wWFzIC1P1bFyMKP/60549t3kc+TKSXuBcZltDBreeC5fX57u8qqrxV96sXnCsTwSWoWG/VIegFxMbSt0YOFcPGV+qXjoQlPGQZLNCM6u88fBdwZejeXLf79IINiZ9/5vuCubpRA3WQ4eEbQtmw/OewaheTUUH1pPzcPtjKv00FKno/pEJDaQdkpWq2nJoVJa0JkkOhioBWcIpKeREqEs8EueRvGJ+TsQE82raGkmLRN7TvMHYmm7WcM6O+X265qyG0AZ/I0oDX/2TLbzI60ZBUdGVYyvyEtsEf+cH7epWbsdXZKFt8yw==;
	5:inmucr2tXv1muE4+sqYKjjGQEWzhMEyy/ypgpwQ8/GgifBklSffFwwK+uqKgwLPqpODogj4dPCZISp6nsIBGndG/gKAuSA1hQqkFD7AK2y92HM+Jcbc+20n9qoLJJnHTfg9BRz1g1aChJE6nWX2srmfaqm70neINV7xhSzX7hMk=;
	7:VrDBHRg+8VHA6XjtV26VF+aL9j5OR4pADf/ChYxg6IhJwFLMHb6qFdXolzSKx6KymzY4KYRpO5j9MmXpyUgrGvmR2yJNajPESdNV0DFGkGp7ZVXdzgQaQbKOrAXkQ+5YHncon5BWpg9aYGNjS3+F6w==
x-ms-office365-filtering-correlation-id: 358f9b88-c5ca-45d4-2511-08d64b4ad84e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0865CE8D4C021765C4B51D1990DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0865; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0865; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(118296001)(8936002)(256004)(6486002)(25786009)(86362001)(2501003)(72206003)(105586002)(106356001)(2906002)(97736004)(478600001)(66066001)(186003)(99286004)(54906003)(386003)(11346002)(2616005)(446003)(36756003)(2900100001)(486006)(6512007)(476003)(6506007)(26005)(39060400002)(102836004)(5660300001)(305945005)(50226002)(71190400001)(71200400001)(110136005)(6436002)(68736007)(53936002)(3846002)(316002)(4326008)(6116002)(7736002)(14454004)(44832011)(52116002)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0865;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: Xn86enIjxsl/QRzy56CxW32K++2QgJldM78i3rMAOnQg/RvGEFzHvxoX97tHCKKlwo47oW2Y6//BJ1ZgZGqUwHaY7DmO2032Peh8g4X6y3Xnf8KXlzaUGnWrp8gUYqOxtbqR2AQmgdkneWWw4UQ51ALCNGoZEDXxl6tGotr+MqysUsc7nWLHj+5G5Ai6eI3kG1j23chGI/aFpMxRKMASJg9tBkVWa/5NoCbj67o8ARXBg+1tulZntBNbkzyYIBsOi9qaHnaDXihxQwVkUBhDcsCSz87y2i4VlNTQWLYGSEs3yQgyGyTuGyrxppWDK8e+t9/IupvQNuqg1NLuwG+9tgzO6I3+jfD+7LEc1J7V3qw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358f9b88-c5ca-45d4-2511-08d64b4ad84e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:55.1980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 20/23] riscv: tcg-target: Add the target init
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
X-List-Received-Date: Thu, 15 Nov 2018 22:37:11 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 4b8f65f367..dfc4e8b44c 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1641,6 +1641,39 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


