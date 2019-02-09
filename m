Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0x-00063o-89
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:01:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0t-0005yz-8f
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0r-0007pf-KO
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:59 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26315)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0o-0007jj-Ht; Fri, 08 Feb 2019 20:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674054; x=1581210054;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=jA326jaOdBclUs98XFCb2NG8T31aNeTLMFQGs/nKT80=;
	b=RJTm3V0YAD8+qjrDaRP5Sw6OxaaC3hP1TjI0DGMiHjTg5OdjhYpqYwmz
	3j444TVmejhaWUyEAF9kV5LKVP8ngxsPqLb9s9Px7POQBT98JOQ4xcjlv
	ydIxdqTUX243mSSSsm2bu2wlZpgJ+p5Dd8/g8XLVGrq6W3u3fiy9Zdc9s
	/PwPOSeykgPRgWqkMp1nZoqmfXtQ4h6RtL5l5gq/wbJY+gHo8n8xLfKWD
	JXg1dyxarMkd0E3czWKA44TFX806vaj66iXwxOSna4sIK+UEP1bdiiTk9
	mjbQmEW/P5Tn710gbVLStN52iYmHGz7UqRiY1jwcOO0ndEq8MaLnaFI+x A==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="102121004"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e1aBIdKwiQXxbw1qyJlO6TeKNFNC/yH4hPJBCczM79I=;
	b=QcW1s/cZ0tt17Abv2qgGAjEsef7zorMpPALAvcAmpePTfTnwzUaVEqoNDKG6fNJWxlVjUC1eDrO1dURyiKzWLKEOSP1p8uOsJuGXFLqHzJkP9wqw7QOKzcYRfVWitButQPN/GOczA4lBd9BQiP2Z3GfdH3lBpGL2QEz+p0CB3xw=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:52 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 10/11] RISC-V: Convert trap debugging to trace events
Thread-Index: AQHUwBLnmf2sxB9j80mOclMiz1cp/g==
Date: Sat, 9 Feb 2019 01:00:51 +0000
Message-ID: <539d54b254204d3bcafb60af6d3b9bc7c9fab28b.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR05CA0055.namprd05.prod.outlook.com
	(2603:10b6:a03:74::32) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:wadHJvX2eRjtwZxPB9H1Id47EYCOMoEx4q5YAgtuzeN7L28ODRBymTrKi7zMqQaIwNOzU4PqXWf9acFoc6e5Dv8q4RGsN5nxrEglxzmsPqFUMyouyBK2oD0akBKVmv/V/On8fixZ6AuTKdqxn4Q8D1XQ+E8TopteMn+LXWS5fJ0AoYI1xIQirjSc0M19zFpymPnsgr9WqKLHALMnRaYTRFsFe8WIlRzsLkKJtsRYii9vSGKu2eWHG/xMQWDLMr8FChuUiJW4oUF4M8QFZ+MioLQtMqNAH1rLh/iKevZbJljoDoQS8Tp4KXnd7SWjfJ48BiwKEimUT/WumpV354pvVmSjVQ72mDaICVKbTo2kof0+3IsFwZ6wSe+AVXw4spktjeiLp33E83sRU2mcILhkMi30/8mz1TILfGeL7JNxVWqS3v/kGc+dg1CgMc2cmBKvNHTJ7cYfYUt7/Fpqe8xoGQ==;
	5:c8P9jMoVpFA7UBVz3u032yaRc5+cwxDKOhiqSbCRI/N4YmA4ElU/4hCwxI62InH/fI/XJ1iJRqQsXeKer+xyxkHBzYaMhbAX2T7VGZXgrc3OImuIOJ6ILt+yzxNmR4PD4ycwrp3IHyZNBK3TeqAadJQntMuGjDjAPpyQ+2okkN737zjyd7sqG3Y64A/pvAxNjRFgu3nYDWnUAALmg8wbvw==;
	7:shpTOjQ8nccZYAJfGiZNTaxTSSs/pFCrimwzsZNFh0waHhMkJc1V6X6Xze6o02wNjLthZC0d3erKvovljRBXqwudaPycOBgkmzXFo2mzETHGRB6Zb7bZzWdwlhpVd7GXfbOenxxH7kTKxQErWLTU3Q==
x-ms-office365-filtering-correlation-id: bc840b3c-3bf5-4bd3-c1d3-08d68e2a094f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409DF32E450FFE042CCB9B7906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MPnTMZlcQAi6hGgKM9dT/q/Lq1ennfvhDRdGVhwbRRQk6rF19FygA+LO11cQyRPaVWz4o1V1gct8GQ9szDEzSH52ffVaujmS6dLndiFeSr7LVuNrygG/ZlfheodrU2XhowqukNLmjwiU0aEjniyLvdWNtDpUWrO2/7HPmy7YdZLbEq6AKAuH/uJkZNDfYh+Yx63cJ7dqGX1iHN42DsGsaTFGtqx+wgzNh6Yhg/MLhVrBywyG9zwte28tHIHGpNClInYhoaTje5B2n3zKcC7E9RZdiC9UAFua9euaJ/ZFoiqSZeZggvoNP/WOVjs6mTHK6UFgoVrJNohrohBYN/aOSCY98ly3eGupzMQKUlePk/C3r+PuuAoQS/rYfJP3tLZom5uPiA4hG+0IcvVR8ixufYv65JLc+hrGMYlIvu4J3Qo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc840b3c-3bf5-4bd3-c1d3-08d68e2a094f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:51.3514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 10/11] RISC-V: Convert trap debugging to
 trace events
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
X-List-Received-Date: Sat, 09 Feb 2019 01:01:00 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 Makefile.objs             |  1 +
 target/riscv/cpu_helper.c | 12 +++---------
 target/riscv/trace-events |  2 ++
 3 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index b7aae33367..a2c5b2d186 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -196,6 +196,7 @@ trace-events-subdirs +=3D target/arm
 trace-events-subdirs +=3D target/i386
 trace-events-subdirs +=3D target/mips
 trace-events-subdirs +=3D target/ppc
+trace-events-subdirs +=3D target/riscv
 trace-events-subdirs +=3D target/s390x
 trace-events-subdirs +=3D target/sparc
 trace-events-subdirs +=3D ui
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a02f4dad8c..6d3fbc3401 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,8 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
-
-#define RISCV_DEBUG_INTERRUPT 0
+#include "trace.h"
=20
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -493,13 +492,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
=20
-    if (RISCV_DEBUG_INTERRUPT) {
-        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
-            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
-            env->mhartid, async ? "intr" : "trap",
-            (async ? riscv_intr_names : riscv_excp_names)[cause],
-            env->pc, tval);
-    }
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 16=
 ?
+        (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)"=
);
=20
     if (env->priv <=3D PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
new file mode 100644
index 0000000000..48af0373df
--- /dev/null
+++ b/target/riscv/trace-events
@@ -0,0 +1,2 @@
+# target/riscv/cpu_helper.c
+riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, uint=
64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", ep=
c:0x%"PRIx64", tval:0x%"PRIx64", desc=3D%s"
--=20
2.20.1


