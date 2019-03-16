Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6l-0004NC-8A
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6a-00047t-G2
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0M-0006DB-36
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:55 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0H-0006Ca-9G; Fri, 15 Mar 2019 21:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699250; x=1584235250;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=a5TiXgw7pNwtPWyET/yKetGgGkZBlgNb/FayHcBIcq8=;
	b=EmIcUMbtBfcnqEdpWmsB9OeAXWxOPCFzTkDVRPfAT2wsxksWnFYjoZU5
	VGfhxaVrGfP0JNqSv7WXG6f4XJ+za5Pbb7i/jjMMyGiIWWMyKk15sqAA6
	nc2Z5TKyERKzPZ7tJwuOB9J/ksjkWjZNwbeDmbhc4begIwwwgQBw/YWqr
	0XWPHXRw0EpS61COido8reGw6d9M1arC5tTyzyBK0tjSzOQQRP5yOxyDc
	OpQh3Mgs/fE2GPm7pcIXZLKsvgnqn5TO08stz1gWLtkmw4BsnrII37xUV
	DemDtjOgFGhiaisiUCA+2jkQEXOn1qtoNFzaikykk4yPrI4YlcJV800IX w==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549467"
Received: from mail-dm3nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.52])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1rlPyqIumzA6YaJI3kwG1XOwA9O92Qo8iNYyDd93xYg=;
	b=iKQ/M+8IE2uF27/KTC2ALy/5fvaVw/zTvdjZEQdvi1MFYTiGxIZoWTtTyGEh6yP36jwa7B96je+7BSCC1H5L/Cw+WndETKtQbQDLFqOFim3BKVeHwTXG9Fy+ZGqpiPyw4hZj+DBrEI3+0wmpFm2lX9Aoaykvic//L4xG5IPX2Dw=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:46 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 06/12] RISC-V: linux-user support for RVE ABI
Thread-Index: AQHU25Z7PBpw+o8FYkeldASFvplTBw==
Date: Sat, 16 Mar 2019 01:20:46 +0000
Message-ID: <076c09aed282a59c1493518534aafb3ced608414.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0072.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::49) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7c9ede1-a835-4400-1611-08d6a9ad9dac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB598914C3F15A3CDEA835648190450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fzsh9VrsKXfWZ+z1fmU6ozhA39+2zGaVvRCxppjQWn0s7e+Q0fM+M4aZPoOkHxrpyUHp4YQtWHNr4dHgEPlKNe08mPeROKaIov5zKSbnNrkZ/ZHK7OC17yRSEkIXk4Z1THweSLZ/d7qpkzNWG36v345SF13NcJCdfFgT3wvmvfJKFqBdw3W6tNriiqOZM5W76T/MzUNEgO9qw1ZQf22M8RnpX6v18/WVFrUcQpQaK0eHU4wvD3ZjcPHUnFoFRZXcS1UQZEDwVlbGgVN3IQoV6AYq+aNcRD/p738BemAqwZfXM/s98+xREPOx/C+u5y2nPMfeCJ2eMmd6f+CaM7qSKUoQW1m12sdpk7GXTEvnyen7lyE1uqpkZeu+7hzRICXkfkpApOzxftl3haNW16uBK23ZXeZolEygN9or8RxIfN0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c9ede1-a835-4400-1611-08d6a9ad9dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:46.1592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 06/12] RISC-V: linux-user support for RVE ABI
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:24 -0000

From: Kito Cheng <kito.cheng@gmail.com>

This change checks elf_flags for EF_RISCV_RVE and if
present uses the RVE linux syscall ABI which uses t0
for the syscall number instead of a7.

Warn and exit if a non-RVE ABI binary is run on a
cpu with the RVE extension as it is incompatible.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Co-authored-by: Kito Cheng <kito.cheng@gmail.com>
Co-authored-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/cpu_loop.c | 15 ++++++++++++++-
 target/riscv/cpu.h          |  4 ++++
 target/riscv/cpu_user.h     |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 4cf3e94632..a9bac4ca79 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -18,8 +18,10 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "elf.h"
=20
 void cpu_loop(CPURISCVState *env)
 {
@@ -53,7 +55,8 @@ void cpu_loop(CPURISCVState *env)
                 ret =3D 0;
             } else {
                 ret =3D do_syscall(env,
-                                 env->gpr[xA7],
+                                 env->gpr[(env->elf_flags & EF_RISCV_RVE)
+                                    ? xT0 : xA7],
                                  env->gpr[xA0],
                                  env->gpr[xA1],
                                  env->gpr[xA2],
@@ -113,6 +116,16 @@ void cpu_loop(CPURISCVState *env)
=20
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
+    CPUState *cpu =3D ENV_GET_CPU(env);
+    TaskState *ts =3D cpu->opaque;
+    struct image_info *info =3D ts->info;
+
     env->pc =3D regs->sepc;
     env->gpr[xSP] =3D regs->sp;
+    env->elf_flags =3D info->elf_flags;
+
+    if ((env->misa & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
+        error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
+        exit(EXIT_FAILURE);
+    }
 }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a0b3c22dec..8e4b5cfe26 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -123,6 +123,10 @@ struct CPURISCVState {
=20
     uint32_t features;
=20
+#ifdef CONFIG_USER_ONLY
+    uint32_t elf_flags;
+#endif
+
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
     target_ulong resetvec;
diff --git a/target/riscv/cpu_user.h b/target/riscv/cpu_user.h
index c2199610ab..52d380aa98 100644
--- a/target/riscv/cpu_user.h
+++ b/target/riscv/cpu_user.h
@@ -10,4 +10,5 @@
 #define xA4 14
 #define xA5 15
 #define xA6 16
-#define xA7 17  /* syscall number goes here */
+#define xA7 17  /* syscall number for RVI ABI */
+#define xT0 5   /* syscall number for RVE ABI */
--=20
2.21.0


