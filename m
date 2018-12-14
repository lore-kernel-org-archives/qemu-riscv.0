Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXbBi-0000QY-O1
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 19:18:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBg-0000PC-TQ
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBd-0002NI-NM
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:40 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBZ-00028u-57; Thu, 13 Dec 2018 19:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544746712; x=1576282712;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Yj47o0scm99gzB+xz9x5v2Uk40MeUTyBLuk9laPLBco=;
	b=gpfinAkLG3AFR4pavzO0yhv2RQP3kV9WqTv22biA8DiaHQxjVq/jRZ6a
	TAMIr5PDmFWuNRmECKqQ3b286Ht2DGXLMEBciU4xBgjrUGwbwBmqUcimZ
	Geo6ciI/O7iJrrb+7n9X7xONJRjJ/7NhRaPGgz3Bp2AsshslTLE4a8mDP
	ASh8yaga95I0wElRAwuHJP0Fszh2HBRj9QK9mP7uZTtm+0aWUxkDkO0H1
	h7YTnMNCAtr0ydyfSojCTpj57x7LLq4IcTEMep/86LZKRQNOfInY3qHhZ
	8uSJ9rMeQ429Cc/ONI0vLSNPR3/EIdx/jnCpQSdz+XNTJ3ZQxHY1IGakt g==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="101454238"
Received: from mail-by2nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.51])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 08:18:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mx20Gjmy87dfovxbpEJ2WCRAUCL1EYSydHGqbS7Tjeo=;
	b=VNQPuYji2oFouOWousmt/Ab++W8NCO0CyVyxdV9qOs7C7hFZUpzl6RMAz4c3nrcUNt94X4060w//875RrMft8GryOJAUvM4N0kc4sNtK/2xN1sMd6KCF6L4Gm//aioYvLVhjcB9/27KOfPTar1VjKp7i+XUcTdRzSBcTfMCqiCk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0497.namprd04.prod.outlook.com (10.173.49.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.27; Fri, 14 Dec 2018 00:18:30 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Fri, 14 Dec 2018 00:18:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 1/5] RISC-V: Add hartid and \n to interrupt logging
Thread-Index: AQHUk0KKnj0PoIBaoU2IBeWChk9aYg==
Date: Fri, 14 Dec 2018 00:18:30 +0000
Message-ID: <12779d199ff308501e5cb35b70ee04dc8f5edd22.1544746653.git.alistair.francis@wdc.com>
References: <cover.1544746653.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544746653.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0106.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0497;
	6:4Ni4pRgWEbdQrkrnaQy9Xx6fwpg8UrEvGpWN1NZi5arwzTnHkxlgj03XYWsuUWBc4JS0WwMTTkO9HG0iYfRxCaBePcDMgBAHGQZ8FnR0kzd8qUQugcgygiURv+VPfz6anWSsgVmQbCqSQTIRvk6lSGFfGclB9WM9cjOn1+AZq6RckxIB3ButXMZpmyq9anQbkfoyAlv1+PzsOlAiLrMbH1xsAL//qolu87D+fYgsKRCNWDHSyMnao5VLUDkoH75QKsOe+14vzpqkSioWw/kwQXlhpLRim6GlxgEn17lGvUT8tR410wx14sTYoG2rs22TyjbUb8tkCMhE2/k+RygFdunhoTSGlxcaf05Gzql5zcBJ1hSCfK1nLfMaOhwEiO5xgNUNQF9G6NQNtA0Ix/tEHAD6ksoXbHzPpL6f0vS++1Azn0zaMUZ5gJAsOYhOt331ZaqvuFsxEUO4CkQ6OTY0iQ==;
	5:Nh9zCcN+twHRmJaxdPmARqujFminHqVrxRhdCmrzvl8WlxgPM6OSnC44xlL2Ug17uusDAWz8DKSpw5mBjHy6XPXTnf5mQsCmg9niuItsS5k1zpIXYOzsLtCTRlIb9YquGdvvTOw0EJqeIsa5r/8ngRjzrzY89aFztC/W3XpggUM=;
	7:j0xbU2ukdhdEA3WthNlq3PlT5zvWWRpSM18oiPO9EqMy7YYNiozzdUjz+kg+zANmfNpWX+Kis1lmrOOh7+RFOT31HGXYpntuLFt8d6TGEuHdjCXc9gnJauh9hLI/QZBnXt5Q1yHT3Ol0ARovJWTTLA==
x-ms-office365-filtering-correlation-id: 13b0f60f-6830-4c5c-8e8f-08d66159acec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0497; 
x-ms-traffictypediagnostic: MWHPR04MB0497:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB04973E7F13A665785837303890A10@MWHPR04MB0497.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0497; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0497; 
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39850400004)(199004)(189003)(50226002)(106356001)(3846002)(81166006)(11346002)(5660300001)(81156014)(68736007)(8936002)(71190400001)(36756003)(71200400001)(105586002)(8676002)(7736002)(256004)(2906002)(6436002)(72206003)(6486002)(478600001)(102836004)(53936002)(14454004)(305945005)(25786009)(6512007)(4326008)(476003)(52116002)(316002)(118296001)(54906003)(97736004)(66066001)(39060400002)(486006)(2616005)(2501003)(44832011)(6116002)(386003)(76176011)(6506007)(186003)(86362001)(110136005)(26005)(446003)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0497;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: VBXDpYsTVykGiSsMQ9qDGV76Q6Nm3CtTENiFlECNsHwAooyYOmQ+tIwH6tawTislenIZFni+aJyc0T8ZYQJmSMLkunJ67gX5uWSWFTjJaIm4D8t6U9ipk9ShwU6Rgir7RsPLNH05wkYHJKSthDeSU4A99wgSD9cRA/SsrYioI776ydVezrTCuSpB7m+vDFb2tnUvj8un8EOJzlTFOC9WIxGzYHtcsPvVgAkF3cCQR2yNsdpFR9IeYjlKj8ZxisoKFkNXnNRC6hLuKS1I+2lAKtAFZOVukYUc199nJYwKomXOe3Wg9yrYcgxphVm4Q86u
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b0f60f-6830-4c5c-8e8f-08d66159acec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 00:18:30.2702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0497
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 1/5] RISC-V: Add hartid and \n to interrupt
 logging
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
X-List-Received-Date: Fri, 14 Dec 2018 00:18:41 -0000

From: Michael Clark <mjc@sifive.com>

Add carriage return that was erroneously removed
when converting to qemu_log. Change hard coded
core number to the actual hartid.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 86f9f4730c..0234c2d528 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -445,11 +445,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     if (RISCV_DEBUG_INTERRUPT) {
         int log_cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
         if (cs->exception_index & RISCV_EXCP_INT_FLAG) {
-            qemu_log_mask(LOG_TRACE, "core   0: trap %s, epc 0x" TARGET_FM=
T_lx,
-                riscv_intr_names[log_cause], env->pc);
+            qemu_log_mask(LOG_TRACE, "core "
+                TARGET_FMT_ld ": trap %s, epc 0x" TARGET_FMT_lx "\n",
+                env->mhartid, riscv_intr_names[log_cause], env->pc);
         } else {
-            qemu_log_mask(LOG_TRACE, "core   0: intr %s, epc 0x" TARGET_FM=
T_lx,
-                riscv_excp_names[log_cause], env->pc);
+            qemu_log_mask(LOG_TRACE, "core "
+                TARGET_FMT_ld ": intr %s, epc 0x" TARGET_FMT_lx "\n",
+                env->mhartid, riscv_excp_names[log_cause], env->pc);
         }
     }
=20
@@ -511,8 +513,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
         if (hasbadaddr) {
             if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld
-                    ": badaddr 0x" TARGET_FMT_lx, env->mhartid, env->badad=
dr);
+                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr =
0x"
+                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
             }
             env->sbadaddr =3D env->badaddr;
         } else {
@@ -536,8 +538,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
         if (hasbadaddr) {
             if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld
-                    ": badaddr 0x" TARGET_FMT_lx, env->mhartid, env->badad=
dr);
+                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr =
0x"
+                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
             }
             env->mbadaddr =3D env->badaddr;
         } else {
--=20
2.19.1


