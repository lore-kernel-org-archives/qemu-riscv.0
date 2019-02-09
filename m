Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0j-0005sl-9b
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:00:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0f-0005r2-5g
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0X-0007Z1-Af
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21525)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0M-000750-9D; Fri, 08 Feb 2019 20:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674031; x=1581210031;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=s7cdeuwWPw4XIDx2G1GZwXBr44UKN8BU1njWfpy+Hs8=;
	b=hBbusw/qHQXfm6LjZYXypKVflaUCYLwgW64OkEQ3qa7wfE8Tet0xZc4T
	FS9hcsnA0CtpuUorBKEB5yRjcFgsut9iN7uiYZs9esnEXxV2A3Pia4VUy
	0FxDTF3fbRGO1L3lucXVsVLJP645UyyoTOZcKmPu4lo9vbz/HiPZTgzds
	ChMjQO57D0rjxiZQGP5LAMiYxYCmAXU1XJOxTTwP1jSYE2/1QxTbYd6+6
	Q+K70dhNEQ10JyZ2dZ1NcbBKmc7f5PxhNQixyu6YHJw/dvg+qkzLcLBJ1
	FlTgAkCcH1uaOVuJ21s8PF+se0MCE7Ye7+3s5KcHfqCCaeRGo7VDZ9J2k g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="198999544"
Received: from mail-cys01nam02lp2054.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.54])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kjRcIc+pv/5xFVaMUKn29xpMOojQmLLnxA2w6ml31Vo=;
	b=iLhjRHNzq+Rfrghghz9Zj6l27xuo8ctjeAzhEcFZBybkQwaEQrfKBRNnTTnroRwnvvrboW7z9fCkiiAk/HITnhmcEdXi2r7U0ucU/AgkQENWZvIHaSQH0irk444CvAv7jgrK69sIChHVF3vID3+rEtyTpodP/ID5YHCexI/ayRc=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:24 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:24 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 07/11] RISC-V: linux-user support for RVE ABI
Thread-Index: AQHUwBLWcPgSkCvCJ0ikpwB+FvePzQ==
Date: Sat, 9 Feb 2019 01:00:24 +0000
Message-ID: <324185f0d64e77f4c16896fa160e1b81d23eb47f.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR11CA0051.namprd11.prod.outlook.com
	(2603:10b6:a03:80::28) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:UNP3CeFaefeU4gRHYC6Lj5pRmXMPpuPFbqZ47orEZcs+giR+WMTFqUXd5tO6bE/wbxYrklWYXJk1qBq4kjdYxurdDLE3onSTeNq4CuHj1x7Z85Uv7liVTlsDUOtDwuNoZRpP2fm7Uq0QONDrFmcHQl8MOVs0hqCUCWjOs3XOpTnyUtpmG+EqYINIXamYADiTazVDOTqFVowO2jTpFfhalTSWEFNOJWYrrvHPuQ6EGI3OEpBPWAkLF3hvDkXJ2Y31T0iuxPm8k5/cHdEMSnldmXLHMH0N01mRINQ7rs/1XPXOSwDiW9X8ges1v/FSdDvb2cDc7EqpNHO+26CJlG9nmFuOoVl7T94k6WkRJ55MgMgk4aVN3s5MvmuHewDmnRKBSYLam++mBqn5o7jTUvySu/AGrpPooUDQpdJD2dguw5DBTwknAlw1KO4QkT1U81L4v9zq5pmtLcwEq2fvE4b+uQ==;
	5:6Fu3uUdE1GRY26PskBQnJWiQhXTH2LA3+pOW7+bsfLHByA7ZRuXQBlczW1azbpN3fnyZdfX7j9Z7VZtbibiRDe205e/Y6YO/Wnp1Ax48TE33JMFrawP+fn3Yqg8cKM19Ar/aHXmc9FLfX6w0MWeLaaAsbKAs11NtO5zHU8UOy6OnlnYq7Z2bucIQy6fmfWdsnVKieZFPyvtwMgzMTW3lTQ==;
	7:jVn1bIaND0KhwyZflfmP7ZLd14MWxct/uWb7RL4F0EX4kpbTjhrHrRXRE+pg3uzlWInYiDho16a+BOw8r4maSZtwevjUGIE+8KbEV9liD9f2QKeOvVwtOD3WtwRqZnsFwitUnXmmz0nLe68FDzatHA==
x-ms-office365-filtering-correlation-id: a5203f93-54c7-4a42-e066-08d68e29f8b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409282095803565DCCD9AA4906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y1OFkGjjc4kBAK9ZB8DevYbksyKmbSosNeb2LmfsVAW2NJ/dCErv6Obs+BQfOE9okeIzqlrbNVcu500rIR4IWanHPJlwlklsM9fkK5OSvI27mbQnzV3iciLEBc3k/i0pBhCsPH+LmLDHGXhtRglqMNFrJUPX8ZU0z8YYKH6HfbvQakbwRyB9dBBRljg2lRezLLeX0QGQlsnzZfeo0KC7SalrvaUWr4zECsSDBx8lVqzByF7wNNgYUS/J1SHb11Or5rJXNPVzCKECycDNmhxUkniagLPkNRPuWNAuz3VeFyhiu1i8WKIcHsCtIVDNPrPawgM0fAWuhVBeWbbU2DIeGD6ToSGVz7fbWa7ttNa8yuUMMizFNGCQTpgEfcffscpaufSN3E/nANPZwYZZC/V9iVjbAkSRI4arNHqP47/Whk0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5203f93-54c7-4a42-e066-08d68e29f8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:23.4732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 07/11] RISC-V: linux-user support for RVE ABI
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
X-List-Received-Date: Sat, 09 Feb 2019 01:00:47 -0000

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
2.20.1


