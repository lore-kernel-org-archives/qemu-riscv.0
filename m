Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTP-0004gO-HI
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTM-0004da-M5
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTL-0002QP-Mu
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:20 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:45683)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTF-0002Oe-F1; Wed, 20 Feb 2019 19:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709853; x=1582245853;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=s7cdeuwWPw4XIDx2G1GZwXBr44UKN8BU1njWfpy+Hs8=;
	b=TEAvKygoblZgjvpe8SJhesLC0zvteasHEXySrHauxNw14O+HOyWrzVN8
	xZC1SXgzsy57o59oVrWmTqILdKIwRlaN9hLOxd9opnJBCuGCRc+SyTxqU
	aotHfPwSHjBdBMP7odB53UFwJu7Wqbp8hX5j3ZohNu24jQd6OMp3OAV5X
	mtG05PlCJO/grlWpFsUqIaI3s1tcE7t7vMdutoDqmo0XDWpic4aOP5ztz
	DhxOI9Sau0PRTd7cWT8fa+8ehI0186SoF4NepNoxgoWNQnAEtMI3IUvWF
	93UG1LLS9Bp6r4bYKKXZJCAIkFBEGLdQ9YMmkmnJXPmnGMWvong5nbFE0 A==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="206985652"
Received: from mail-co1nam04lp2050.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.50])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:44:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kjRcIc+pv/5xFVaMUKn29xpMOojQmLLnxA2w6ml31Vo=;
	b=dbB5YCmbN2OVYoL4wlJR4dtAgqYMnCRXikkvHVJJCxL6onulScAeBzqxZ/wT1CX2l6l0jN3UEF04oclMZusQeWHXZnQD+yGOLg3MDNV1mzsLZrYDyoWRzG6cZKRLtV/I/phwYrfBVK/zEZc5fvh3U8ZUgf25gfOTUSuewX19xSY=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0520.namprd04.prod.outlook.com (10.173.190.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.14; Thu, 21 Feb 2019 00:44:08 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:08 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 06/11] RISC-V: linux-user support for RVE ABI
Thread-Index: AQHUyX6OYH4cewxYd0KLFO5tx1Oj6Q==
Date: Thu, 21 Feb 2019 00:44:08 +0000
Message-ID: <87a626176be2061cbf7a524789685157d17922a0.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17943925-9dbd-49a4-480b-08d69795b06d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0520; 
x-ms-traffictypediagnostic: CY4PR04MB0520:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0520;
	23:aO2FddQebrBMUkEOOBMruNypD7ZEGJdXKHkw0Wn?=
	=?iso-8859-1?Q?5wrc+jUGHfOCZ8xO36V40AR2lW3TXslS8J39rGTqpOXEnI9I/XQSaqdQDW?=
	=?iso-8859-1?Q?FsynlUPk6mIii2vwXO/37yHhQYQ8yLJ9t3hG4cb9s+oGVFbvMY0aEfgI0P?=
	=?iso-8859-1?Q?72aS240cBYQ2zftIrsOxKEzh/OoqPUf+cFKRa9WNu0dbkkYAgwN6nOKwWo?=
	=?iso-8859-1?Q?bLrgg2RSBUynUcfUK62zszUGFdLxp8oZIKpbNMw00yDM+xvZvTga4MGEkD?=
	=?iso-8859-1?Q?xB2mMQLHb6TOXxTiNCShpXzMRr9K2EpMIpqFcESaugcrmF7zXzJp/TFWi3?=
	=?iso-8859-1?Q?WldyuDlRYgA/pFmr+/2O0ow0h8XIe1aqHDd3wmHcm1Is0OXZfa2/RM2yEn?=
	=?iso-8859-1?Q?kl5BcmE3/qw8cWqrJ+XOl5hxrLsa9SFOyrkmxkDXop4dLkND+omGi5FKKY?=
	=?iso-8859-1?Q?Tg6+tAZsP3r7eFwMkKHA9dkm9Jn3KTAnvwdezRiPxFa2UR7AecpCEmTQ+h?=
	=?iso-8859-1?Q?szz+HTckiFoqyQ0hxLWtzHF78OT5RAYU9EhCIruenUIZrGJdzXGkKL/kC4?=
	=?iso-8859-1?Q?9/zc2MyTW2/mWiS1xgUnGcYRtCMm3DDdx0JtVKXJhVTQ0zwa58uCePlfy7?=
	=?iso-8859-1?Q?c3Theb5iVP9XKIqBPvJtR2Q2zVJfAjeBy9RUWzsqHxjWOfZOzgQysXWGKI?=
	=?iso-8859-1?Q?kAGk6Td9UOJX1iaba7DtxXI4G/ai0OV+9uRv7xbLy4+lqg8DcdWBxJsN0s?=
	=?iso-8859-1?Q?GLnKoMz6Wt0FHvRd2KwM+FOVXj2T+Y4ToC5AWBiKunBFhvb6AicCwH5su3?=
	=?iso-8859-1?Q?dKFDZSC9/btp0ixy0bfIUoQ9r+1Xuj9GDkpYPw2i4gYeYIxsyu+cjNL9RZ?=
	=?iso-8859-1?Q?NEr/94mlKUXLce7ZosvU32beE6naz8cLp64GeMjJw9Od8aRJZaDflaWtuJ?=
	=?iso-8859-1?Q?5oajMhsdD/wS0VbG0PuNcwyPKW+ofBWKVrOpm/ZXSsgxYZVLs7k3kzJFG4?=
	=?iso-8859-1?Q?qeC8NnyW1RWfbdRJa40zjaYCflRyi5XeaChAcvuh//BlBJ1C/0pt5hVKfI?=
	=?iso-8859-1?Q?jveaLYcq4X1Ii9fdjXtWOBnWK5pJqEbkv7q/XCIcNsI6iUnz7Fmu4h11iJ?=
	=?iso-8859-1?Q?xMoreJyXxSy63Yk6M4TvdY6n+H/ZTvgg1oDo6mdc8G/KbM7QBard1oH9rX?=
	=?iso-8859-1?Q?lwIn0O9/gytUVZ/RuWF5hfVmENNe0EoNlStHVkvhKQgxK3h5lmbsD2RZ7v?=
	=?iso-8859-1?Q?uUtw4k390lYidxevOoB/3R2UMqx7iylyCSdY/rvVQkuwWm9dKjN/2Y65bt?=
	=?iso-8859-1?Q?9+Jqxzwhmj/qqv5FTd31HS23qWj+jW0kcVT2jS9V2KNfA=3D=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB05204A56E848914A8721CA1F907E0@CY4PR04MB0520.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(50226002)(316002)(26005)(6436002)(81166006)(6506007)(118296001)(2501003)(6486002)(53936002)(36756003)(3846002)(68736007)(2616005)(14454004)(476003)(8676002)(81156014)(6116002)(52116002)(5660300002)(186003)(8936002)(446003)(305945005)(102836004)(6512007)(486006)(386003)(7736002)(478600001)(72206003)(97736004)(44832011)(11346002)(99286004)(2906002)(105586002)(106356001)(110136005)(54906003)(14444005)(256004)(66066001)(86362001)(4326008)(71200400001)(25786009)(71190400001)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0520;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZkIeQDSKqyZ9I/Vz+ZQ+BG/7OoxIvKOW9S8EedwXVTG2Rv0y49wh1IzSdYf0BPzjnvqB8l0PPG3/4cnrxCQfmz03T7KwEOA1AITx9EJKl2a6/ams+sH6tXn3o18J+Wu46JKESglj0pXIIr0pQrFNysInWpyOGmSe02jQW6+LUE7nrmwTomZscI7BDcpnX6ZSG7ryGZvz8brsQxR9M4Oa0yuatKXsELhZas9FJRyMnVthgttItCJhazxEc/1xu3RKtH0ihbYN2/xia4bkVM4ki7MOhIyFo7r0UGlbGONBta5NsnuQ7YkawZ/1CznPsVWJwLt0MvebV9xN10R1F60JovZ2DJIUC5n8yg72OXmerR5F+G8WLqoJevgjRVXdeGxip1Vf7dc3WKACN06AfCbdVf3mC446/unRSvxbqX1SdsI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17943925-9dbd-49a4-480b-08d69795b06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:08.3035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0520
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v2 06/11] RISC-V: linux-user support for RVE ABI
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:21 -0000

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


