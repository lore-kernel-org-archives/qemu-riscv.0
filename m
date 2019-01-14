Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC7k-0003mv-BJ
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7h-0003ks-If
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7f-0000dJ-Jf
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:29 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59843)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7P-0000Qi-8c; Mon, 14 Jan 2019 18:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510292; x=1579046292;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=3smbf5frSpe93gHGpJPlYqSXqqqaOmk52V7Ej3pj3TE=;
	b=VVE9kZ9F52n+eiLE9TTwWviLNo63ui7YcjOz5qqj7MB+mqYvU6niSSoX
	TqHl55d+K0vOK7jUM0ej8rAl1h/2qin4rBxAP8k7Ylg+SJy787QZKd6q0
	Ya8AfF6QWxZmrj8tOSu+y5T6XBAsa1RGk/ep2chqZh8jIfUwu+cxxWLpd
	KoX7xUfgDpF/QEMhlMMibg0hcNqZH+idwcIjP3yOYdXXoPbYV9OhoOmHh
	rPGvzzdGuyaVUNBzT/NPy51lbrqq2uzS00f9yOa7qJQuDoEKtjFiCWRc4
	4DBfiaWcuck5wb00NRTKsmK+d5PTsEIEVi1c8IoDeP20LWYlzW8cfPYN7 g==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765684"
Received: from mail-by2nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.56])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:58:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NoHUUstuZPomDehsTxgZ2TwkLQHHELr1TcsjGvKIYGM=;
	b=ILJWLBjD7nwfH6l/e8Uu6WNitiO/8VUE8hO3OxoIMFXkBpRnZsexd0MAulKYCSFigouGVEVluOv44QZ+a6tm1wQ4c4wtxZ+tQrAdCzTo95DAyVQ5d+YKbAV1fghUaD2nWjEyK8+OinR8ZRk+8l/1BJyD3turSv5OXgqEzDZgQnc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:58:08 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:58:08 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 3/8] RISC-V: Implement mstatus.TSR/TW/TVM
Thread-Index: AQHUrGT/ENV0Pl66UUaKSb8PwPK3aA==
Date: Mon, 14 Jan 2019 23:58:08 +0000
Message-ID: <1fb62bc8ef624c022bcf5553b8e8d9512b328823.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR20CA0036.namprd20.prod.outlook.com
	(2603:10b6:300:ed::22) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:c3DRqO6s7BEAKKkAmoz7njZKQZSscEShYiT0+heYhTeHSwcLaUE+Z5awUpiu0sLlW5imNFP7fQ499GhzFZSqev/4pyi2Q5F8TMW4X2fAWBs9/9gFNt7zlshKYYMeVFeCUS8paAnlnOoHbB6TOkDCUH77wTgFxyyD61NZdX3tC0w5tm1da/ng6Nq4v2kHFmNLB7l/VtIqztT2EVTupifc16azfdHv3yIll7eOSuLoAwlfoOzHh6Jc4iIwujtmFz/6Ug2oKbKGfmYg0sBD2UaqdiLlGRH/vZj+yVYUfetHH1kqEXZC61dqDkV3keF6PLAALAUf9udJ+ri2JtTKzPbuuH/qfACPvOEr+iyzRhWrcF7Vol/h7olH3iI0qljk7Pos+U3xN7SQ7UUS7yWCtSFYnj5VqoflfXUqcGckx/pXRfBanHayvmJFcQCm4Lriy5/WNOfcEzR59pttoz0BYtjong==;
	5:fUHJ9bEkUVAdKRsK2yeG1Hnvjh1Sopl1krgjWCZeUV594k3U+dWfP0MW/THp9odoWmUvA9SvO9FH70kETolt6eTejtiE4ehMgya4EGyLhTHM2+WcbvTh12xDkFj2MYVuoP8i777h3zv9r4jX35drPAT5H7X5orASJb6NhlJUBJqlwivkqM+0zknSx325Qhlbs3VgLm3bPona/ixXxVZXWQ==;
	7:0702MQEgtNIb46nOzxbUtkAy7HWAOLEzWAvvAxx9We7BJ7U+TXw5R5ZdkIJB69eT/1GXBB+b8mFN5UpHWbuOJGIzs3porotZBTcPcHnOMCBXcA3wPKg98XdMEgBzwn+5op6t0LB9eNvnGfQRKHWRVw==
x-ms-office365-filtering-correlation-id: d8a5ec49-f9dc-4a16-cab9-08d67a7c21e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895D74B226DB33B40C862F490800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(14444005)(386003)(6506007)(68736007)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(26005)(446003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 12DCLRFWGq7vyXK6Z7R6MJ9Lqs6WrDXJoCam+iRftvDgth6opVRX7CihQCoTUm7s0FxEAeesLAIOt2f3acOlvD9E4MfVHtffvQ+0M0WouLWyuBF9AS2h+x9ec1SRNLJ6MHUEqYaSQexEpIFdnKjZ5C0UEQCRderHpAmbkQgg7zkYFx5Wa5VHjWwRPgxsyIG10rn6u0WbMKA+7qwEdBv46XDh8ee3CcDo1AFTrFIK0MF4SmNma/X6477vvcnUvPMJ0UlZyTd0Nrcks2xXSo5894hDFr/tEiBZJKYAKZcixCFv1nFYF6gsMJrbhJ4kumg6AJIfjyNDDUCBxELT9sg79bzWCXv0pFoAR52eT06uSxmysbgn3lNcYJbV1D8w3nXnjAO6DDGEM2GnzTIpJvVHq3i7T45yBq1v9Y3/jOb7QKA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a5ec49-f9dc-4a16-cab9-08d67a7c21e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:58:08.1495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 3/8] RISC-V: Implement mstatus.TSR/TW/TVM
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
X-List-Received-Date: Mon, 14 Jan 2019 23:58:31 -0000

From: Michael Clark <mjc@sifive.com>

This adds the necessary minimum to support S-mode
virtualization for priv ISA >=3D v1.10

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Matthew Suozzo <msuozzo@google.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Co-authored-by: Matthew Suozzo <msuozzo@google.com>
Co-authored-by: Michael Clark <mjc@sifive.com>
---
 target/riscv/csr.c       | 17 +++++++++++++----
 target/riscv/op_helper.c | 25 +++++++++++++++++++++----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5714147689..390d3a9a56 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -305,7 +305,8 @@ static int write_mstatus(CPURISCVState *env, int csrno,=
 target_ulong val)
         }
         mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
             MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
-            MSTATUS_MPP | MSTATUS_MXR;
+            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
+            MSTATUS_TW;
     }
=20
     /* silenty discard mstatus.mpp writes for unsupported modes */
@@ -642,7 +643,11 @@ static int read_satp(CPURISCVState *env, int csrno, ta=
rget_ulong *val)
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         *val =3D 0;
     } else if (env->priv_ver >=3D PRIV_VERSION_1_10_0) {
-        *val =3D env->satp;
+        if (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TVM)=
) {
+            return -1;
+        } else {
+            *val =3D env->satp;
+        }
     } else {
         *val =3D env->sptbr;
     }
@@ -663,8 +668,12 @@ static int write_satp(CPURISCVState *env, int csrno, t=
arget_ulong val)
         validate_vm(env, get_field(val, SATP_MODE)) &&
         ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
     {
-        tlb_flush(CPU(riscv_env_get_cpu(env)));
-        env->satp =3D val;
+        if (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TVM)=
) {
+            return -1;
+        } else {
+            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            env->satp =3D val;
+        }
     }
     return 0;
 }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 81bd1a77ea..77c79ba36e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -82,6 +82,11 @@ target_ulong helper_sret(CPURISCVState *env, target_ulon=
g cpu_pc_deb)
         do_raise_exception_err(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
     }
=20
+    if (env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TSR)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong mstatus =3D env->mstatus;
     target_ulong prev_priv =3D get_field(mstatus, MSTATUS_SPP);
     mstatus =3D set_field(mstatus,
@@ -125,16 +130,28 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs =3D CPU(riscv_env_get_cpu(env));
=20
-    cs->halted =3D 1;
-    cs->exception_index =3D EXCP_HLT;
-    cpu_loop_exit(cs);
+    if (env->priv =3D=3D PRV_S &&
+        env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TW)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else {
+        cs->halted =3D 1;
+        cs->exception_index =3D EXCP_HLT;
+        cpu_loop_exit(cs);
+    }
 }
=20
 void helper_tlb_flush(CPURISCVState *env)
 {
     RISCVCPU *cpu =3D riscv_env_get_cpu(env);
     CPUState *cs =3D CPU(cpu);
-    tlb_flush(cs);
+    if (env->priv =3D=3D PRV_S &&
+        env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
+        get_field(env->mstatus, MSTATUS_TVM)) {
+        do_raise_exception_err(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else {
+        tlb_flush(cs);
+    }
 }
=20
 #endif /* !CONFIG_USER_ONLY */
--=20
2.19.1


