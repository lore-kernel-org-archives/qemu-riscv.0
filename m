Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfYpE-0002Pc-Ls
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jan 2019 18:24:24 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:39347 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYpA-0002LS-Lt
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:24:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYp7-0003zP-Bp
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:24:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:58626)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYox-0003wM-JA; Fri, 04 Jan 2019 18:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546644247; x=1578180247;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=QtChUhiaORXJYW/nR6baQGS5vORAX/E9ssS8P9MXg/8=;
	b=ixXpmuVXo7ZaWzoi59uuqiZ7tJaj68kkdnZE7iWoX0oGV9tsOBRY9GIO
	AqA7A2xWd7MsibQB63TkD104wY1OqGQLEjbArB3gEtZfOSsHLTV1ZbQ/3
	ZCkd3NEOIYV93zRmvOxbDlY79M5lLo9aktQH6CAYnN2u+kl26dmU6s+DU
	VHNgoVpJPiPrUbBQy6zH8+VG+Wsi2/ADhwZe243ZQVJqRyvrbZgUBhFM4
	/hwXCassoc5peSe0AaJ0P2XDCxPBWqaaoNFqWKa2OsSNopBpCHjchpFnN
	qWnIbVc1Bft5S69Tfv05liUEkbSvjt8hzugeSqIRCfCTb1vqZtTDskEV/ g==;
X-IronPort-AV: E=Sophos;i="5.56,440,1539619200"; d="scan'208";a="98004796"
Received: from mail-co1nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.51])
	by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2019 07:24:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2HTt9Vg79d0qL4TNMAdRI0ieG1UYvJRXBVEaubP/2OA=;
	b=Ahev6ph9/QJz6MHVqGx29ClCGNYHMke3StvILxxZ8+xBH/+tGOYxLwE9x4IiYYSU1b5gNaftbDHlFcR8I/M/GlXjKj3cbPHQAkuB9b/1ObbVeORvpdvYp97Tf8/bfoADIixaM08kuAC7yIPe+6ZZ3yApAsWLVLL2Asr7M/v6IYo=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3776.namprd04.prod.outlook.com (10.172.169.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Fri, 4 Jan 2019 23:24:05 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Fri, 4 Jan 2019 23:24:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 2/3] RISC-V: Implement atomic mip/sip CSR updates
Thread-Index: AQHUpISV1wIyoZb5EkGgE+ToEMLoog==
Date: Fri, 4 Jan 2019 23:24:04 +0000
Message-ID: <8c5a410e1ce4a5898e77ef49e66da289518a5298.1546644177.git.alistair.francis@wdc.com>
References: <cover.1546644177.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1546644177.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0026.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3776;
	6:pl0VgXfDUsiyrfgQvUct0LBdSwNjvuaCzNnTcrj/HbG0JkNG54fdg7AV1yOtrwhhXMCgnzU2Zj1J0yLLPsWEhGprR6N/EELG+rexkbmVowahXd+NRlrNxCo73GvHJXIJB9o3pMgFPE5M8iYiVanpPZy9+yC8SE4ZUJw+GPfvd8p6DZG+mK2TzIzKG1iJn3dCp9egr1ZbxQt92lE14mL7vDyAkaNV/0EWAOmS1KhO28LZAnP0eK0aeWFaiTBTtzbX5NHpuAT7q1/heMUZoVN6D3C1XRuOX8z/MAFyJQItiNju3pbRYS2prdCWT8NDadCqpbbyLUIzoa7LDk5NA371vUrPWxHQ9JxrNVeyiXWxciRATGLYMrWieOzLOo0xIQrKAe/kTRs8TaNOE2TPdU988URc0qjJ3lABOOAk3HI/rG26+QLNObBTUSI3DzQvOAgpXa6ivGDuG/HF2i4NjvlW6g==;
	5:qOxyjYSq3Ww4NlTUGVi83t8GHG1M0gMK0GyAcV7X4hBCjifc1Ybd7K/Y7bAG+y9ENpaZJGh2xWpliKy7opAO6LyeCWD5RntDdJJZCkeSEIQPc2sknGKHUvoBuydmn+4cHLRdfUisj5XSn+9maD5Aa9jKve+aKI2BWV7ZByvgWwu3EkVQpxFsz8NuAQZtSEI2gOjtutE7TTt1guEJxp+MRQ==;
	7:xwWcSd9W5hbar94oUVhu6sylLGD5GlQ6MA0Hc2K469goxPThA4YnLxjPT4/byYyWnrKlK+61xygZGBPWTjMRW+9reJVhdQHtkVxUHFwdTE/YXUqKhgWxwF21F4O5L1Eje5DLKkhSrE0nhNHoE5MFMw==
x-ms-office365-filtering-correlation-id: e0751d74-f43b-44b0-291b-08d6729bb79f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3776; 
x-ms-traffictypediagnostic: MWHPR04MB3776:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB3776D22C1EDE662364B1207C908E0@MWHPR04MB3776.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(10201501046)(93006095)(93001095)(6055026)(6041310)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3776; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3776; 
x-forefront-prvs: 0907F58A24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(36756003)(256004)(14444005)(446003)(2616005)(186003)(14454004)(476003)(26005)(305945005)(71200400001)(11346002)(71190400001)(50226002)(6116002)(44832011)(5024004)(316002)(4326008)(486006)(118296001)(3846002)(25786009)(8676002)(2501003)(5660300001)(39060400002)(8936002)(81166006)(81156014)(52116002)(6512007)(97736004)(6436002)(53936002)(86362001)(102836004)(575784001)(6486002)(2906002)(68736007)(105586002)(66066001)(106356001)(478600001)(7736002)(110136005)(54906003)(72206003)(15650500001)(6506007)(99286004)(386003)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3776;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OPvufLNab5g6jB+3q/ZeQ5XB9t2DZzdp3/rOw3xEVl6roLY1E6aCeadbDpWVu1olkX2OM5z/G908TYh5lW3hzskRNYifGazStH8rVMIjGO5xzpOa/U5ziMmeOFmPtLrwI41AZbkJZkmBf2iiktnlZv9N1sic6sKvocWEl7//aBYWvMuQtOB8waRRGzaN4kgBrxSm2bpiuqAcYqUcIkyPPL+MdALEhxNjAO1ZCSkLTJtjGWhMGz+2QNXPSRbtMm6nSBPaRXSqHYgoALbbbpVP9aJ+w/AO9FOHGRgXMYo4WBAUFL1qgbAcwISmg0SL19BK
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0751d74-f43b-44b0-291b-08d6729bb79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2019 23:24:04.8318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3776
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 2/3] RISC-V: Implement atomic mip/sip CSR
 updates
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
X-List-Received-Date: Fri, 04 Jan 2019 23:24:23 -0000

From: Michael Clark <mjc@sifive.com>

Use the new CSR read/modify/write interface to implement
atomic updates to mip/sip.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 56 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b61b0ef379..44ea8b7cb6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -487,25 +487,31 @@ static int write_mbadaddr(CPURISCVState *env, int csr=
no, target_ulong val)
     return 0;
 }
=20
-static int read_mip(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val =3D atomic_read(&env->mip);
-    return 0;
-}
-
-static int write_mip(CPURISCVState *env, int csrno, target_ulong val)
+static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                   target_ulong new_value, target_ulong write_mask)
 {
     RISCVCPU *cpu =3D riscv_env_get_cpu(env);
+    target_ulong mask =3D write_mask & delegable_ints;
+    uint32_t old_mip;
+
+    /* We can't allow the supervisor to control SEIP as this would allow t=
he
+     * supervisor to clear a pending external interrupt which will result =
in
+     * lost a interrupt in the case a PLIC is attached. The SEIP bit must =
be
+     * hardware controlled when a PLIC is attached. This should be an opti=
on
+     * for CPUs with software-delegated Supervisor External Interrupts. */
+    mask &=3D ~MIP_SEIP;
+
+    if (mask) {
+        qemu_mutex_lock_iothread();
+        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+        qemu_mutex_unlock_iothread();
+    } else {
+        old_mip =3D atomic_read(&env->mip);
+    }
=20
-    /*
-     * csrs, csrc on mip.SEIP is not decomposable into separate read and
-     * write steps, so a different implementation is needed
-     */
-
-    qemu_mutex_lock_iothread();
-    riscv_cpu_update_mip(cpu, MIP_SSIP | MIP_STIP,
-                         (val & (MIP_SSIP | MIP_STIP)));
-    qemu_mutex_unlock_iothread();
+    if (ret_value) {
+        *ret_value =3D old_mip;
+    }
=20
     return 0;
 }
@@ -623,17 +629,11 @@ static int write_sbadaddr(CPURISCVState *env, int csr=
no, target_ulong val)
     return 0;
 }
=20
-static int read_sip(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val =3D atomic_read(&env->mip) & env->mideleg;
-    return 0;
-}
-
-static int write_sip(CPURISCVState *env, int csrno, target_ulong val)
+static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                   target_ulong new_value, target_ulong write_mask)
 {
-    target_ulong newval =3D (atomic_read(&env->mip) & ~env->mideleg)
-                          | (val & env->mideleg);
-    return write_mip(env, CSR_MIP, newval);
+    return rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+                   write_mask & env->mideleg);
 }
=20
 /* Supervisor Protection and Translation */
@@ -812,7 +812,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
     [CSR_MEPC] =3D                { read_mepc,        write_mepc        },
     [CSR_MCAUSE] =3D              { read_mcause,      write_mcause      },
     [CSR_MBADADDR] =3D            { read_mbadaddr,    write_mbadaddr    },
-    [CSR_MIP] =3D                 { read_mip,         write_mip         },
+    [CSR_MIP] =3D                 { NULL,     NULL,     rmw_mip         },
=20
     /* Supervisor Trap Setup */
     [CSR_SSTATUS] =3D             { read_sstatus,     write_sstatus     },
@@ -825,7 +825,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
     [CSR_SEPC] =3D                { read_sepc,        write_sepc        },
     [CSR_SCAUSE] =3D              { read_scause,      write_scause      },
     [CSR_SBADADDR] =3D            { read_sbadaddr,    write_sbadaddr    },
-    [CSR_SIP] =3D                 { read_sip,         write_sip         },
+    [CSR_SIP] =3D                 { NULL,     NULL,     rmw_sip         },
=20
     /* Supervisor Protection and Translation */
     [CSR_SATP] =3D                { read_satp,        write_satp        },
--=20
2.19.1


