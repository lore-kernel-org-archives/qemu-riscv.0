Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhMo-00026j-V6
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:18:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMm-00023Q-8M
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMh-0000w0-J8
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:20534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMS-0000jI-Up; Wed, 19 Dec 2018 14:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247131; x=1576783131;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=3K1t5ycFKANZv8qXhlf1+cRC7lfmjANhZRnlk8JSQgk=;
	b=dZ/CvS0YD82T4RR6BU0dfIoXVWzf2x9MSufWOUR0GCH2I/VklJOdjfAd
	NVU4jqAZEanuwhBMDxQUCfDFPVx7nsu4XD1wKmz2r/jBgAexFHz0s5Wif
	kFFRYm2zZKSpuqGrim4RtoSE3N28v/oCA7dI/2Hyv1dKav8h6BenbyDFF
	6rhgXnXX6DPjyLjuLdCHRaC4Qix2jlAQeIXrmxNZF5QwO96vQ1SL8fak5
	obf9XDlmjgyy/XlWKZlVjXDdT/5GA4YCFyI7LS2kGzNg2T5482AWMRWhb
	G1lL23BSBQF7eiN0hRguUI1KWO0Ic5poycfMAOrsqe2FlBP6drgmKbp13 Q==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="194939618"
Received: from mail-bl2nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.51])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:18:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=81b5rd3nAMjuF+2/kfEvbbwaYyygcyOJWfMpuK5aMe8=;
	b=Hu9UHPryheoIyC93xpA95UIgcqYydlyo2h5tuxQcnCIlJ0u9S6u23rWmNz5ZDiPJQyg1GmcKSpnN7lzA2fRCgn/nNtOkHf1SfhIDbMng1kL6y/yZvDViKHCgDwwJ71nJa6RGRrRtXiu29/4tY4Q2K4RJ3J8NDlierFAJc2vWh+Y=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:18:17 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:18:17 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 11/23] riscv: tcg-target: Add the mov and movi
	instruction
Thread-Index: AQHUl8+Y3mU3RVUjCUabGuNHNB7+YQ==
Date: Wed, 19 Dec 2018 19:18:17 +0000
Message-ID: <bd6a45c73a67b77ddaa2fe590a6bb8ee422b9683.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0070.namprd05.prod.outlook.com
	(2603:10b6:a03:74::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:RBL/ycqOfIWKLVFUWtwUyznTzqg6bRRR+gTiTa5aKTthK/YwAmed8EcMcnQcjuGlN6t7gTixeb23KJ0r6ZW6YfKzAPIolHfbi7cd3Gg+vhdd7lnHL1jiSbjCmsMUmtY7RIqOi4yHTdqRS10IIiIC2PL+oEMX6JDCcG0hSzkLB7DeogUAAy26cw0ie7E3YX7oGK5gqbxS+G5WXRmxmnQ00oG0OcbHkPv+2xz316SBrH/iFaCJAd8DkOz15UWsd4c6fUEEyQSiKl9pKtbXHpj+kofWND0vdw08jCV/cSZc1a3eXDQu1wlRY7ghgiC/nnJWw6u0BwJg7gQccHlRxbE7MEQn/ouJZUj7mcFEW4g0OFOcbtpulB3LQcBDzWnutdLLCu56Skq7LHD0st0PQoOBs29h3EoVfhEcS7L+5jS/8Tmf9f1fE3mdn3E0VwMKeepvt3yw7oEIU7QtpDtW8xmCxQ==;
	5:vRYzj7j3CSYHek53vcPTng2+GDGKl4Bmc8BcLOwhw8su8mxJVUfg9gDea9g3Y+FK0/f7GAiaTRMKCv2sN0F0CKH6CLTyIQ5gH0RLjOLHRWeqkhRbB0CTpeBBX7FyLN2Ik4sucyOoeOR9fKIbRLQTayB8t0z6ZZw30Yc2QaQdY7s=;
	7:NAToUJETiMPNfkWEHjietjqG0rgJBi0VhGLg/R9ig74exUQRRVoc8Te/+POIvwZU51qCMm23z8T6EUZYyKc9cKr9JyLODS/7DCYXIkb3Wp7+QmOEZ2HZKUApHlbtWd0PhvWIQvrc6bVLCvyXUdjweg==
x-ms-office365-filtering-correlation-id: e8b7a079-3fa3-4622-cbc7-08d665e6bae8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08484A0457850C62A941B20590BE0@MWHPR04MB0848.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: Rf0tZnZm7RLzwPyPRZwxvfzgJazNvSEibMT2I7+cK+nE/cMGo/TQgtCE8SuNcH4iHfo3dKAQ2AgpxQ5jCaKBvr/grCZneyk9D7r0D/6K7fv5slBG/EqEDGTFpY5bqcfZIKCl4b94BmrY44aKJawpeM8gorBcIT3vV/6Sgf2o+tmwsv8vs4CmKM2la1yi59OxMBg/7+mJcS4nhZ2YuWveebfw8nPlb/xgrXNToteqJYQOdVT8Pn2ul51CTdFORMeSpCFSi76OmWoIwW5xOnksxOtnxiPN4NITMP0gn2rznF0cDvO53NMDFBD5WcBcl6vi
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b7a079-3fa3-4622-cbc7-08d665e6bae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:18:17.4377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v2 11/23] riscv: tcg-target: Add the mov and
 movi instruction
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
X-List-Received-Date: Wed, 19 Dec 2018 19:18:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 86 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index a26744052f..01b4443d6d 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -510,3 +510,89 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int t=
ype,
         tcg_abort();
     }
 }
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg ar=
g)
+{
+    if (ret =3D=3D arg) {
+        return;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    tcg_target_long lo, hi, tmp;
+    int shift, ret;
+
+    if (TCG_TARGET_REG_BITS =3D=3D 64 && type =3D=3D TCG_TYPE_I32) {
+        val =3D (int32_t)val;
+    }
+
+    lo =3D sextreg(val, 0, 12);
+    if (val =3D=3D lo) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, lo);
+        return;
+    }
+
+    hi =3D val - lo;
+    if (TCG_TARGET_REG_BITS =3D=3D 32 || val =3D=3D (int32_t)val) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, hi);
+        if (lo !=3D 0) {
+            tcg_out_opc_imm(s, OPC_ADDIW, rd, rd, lo);
+        }
+        return;
+    }
+
+    /* We can only be here if TCG_TARGET_REG_BITS !=3D 32 */
+    tmp =3D tcg_pcrel_diff(s, (void *)val);
+    if (tmp =3D=3D (int32_t)tmp) {
+        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
+        ret =3D reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
+        tcg_debug_assert(ret =3D=3D true);
+        return;
+    }
+
+    /* Look for a single 20-bit section.  */
+    shift =3D ctz64(val);
+    tmp =3D val >> shift;
+    if (tmp =3D=3D sextreg(tmp, 0, 20)) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp << 12);
+        if (shift > 12) {
+            tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift - 12);
+        } else {
+            tcg_out_opc_imm(s, OPC_SRAI, rd, rd, 12 - shift);
+        }
+        return;
+    }
+
+    /* Look for a few high zero bits, with lots of bits set in the middle.=
  */
+    shift =3D clz64(val);
+    tmp =3D val << shift;
+    if (tmp =3D=3D sextreg(tmp, 12, 20) << 12) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    } else if (tmp =3D=3D sextreg(tmp, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    }
+
+    /* Drop into the constant pool.  */
+    new_pool_label(s, val, R_RISCV_CALL, s->code_ptr, 0);
+    tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+    tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
+}
--=20
2.19.1


