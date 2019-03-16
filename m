Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6l-0004OM-Ui
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6e-00047y-CT
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y05-00069U-Fk
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:38 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:25828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y03-00068h-Oq; Fri, 15 Mar 2019 21:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699235; x=1584235235;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=PyM/VTVWLfdxcfoCMquKLE9hn8oU03RmcoUlQYk+0ds=;
	b=m+Mxw4w+qyq9z005p6VAU822DpalcclvGBCOfSL+99EPnnMmCPfHvYQW
	pn9aiOP9PONCP2qbzN9l189EcFlF+MhfmIzGL+utVrD8/25UQykHK05bB
	nt1djwwV9cRv68Irk3vWNH9JO7TEAAvCl0pf/eyTtWbXrj8DhMJ1QKqKA
	CSslkLyWD5OpC/iAOitULVIJp/MflOjCfSB7xh2BUQm4bozoMYSrC7hxR
	vLt6a0yUOrDtSrUZYatMNx/Crw1BMp+1Fymj7I4Dualzd7T/eiRbnI7A1
	w+c415FzZ+9Gvpog1FV/h3/w5oe4FxGwTCmoNfedTY51GLNL8AqftTWYp Q==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="108600677"
Received: from mail-dm3nam05lp2055.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.55])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+u5bBAQ295ArTfym6Nyck5uw5f8bL+E+uojFpleAE+o=;
	b=U6c8wxBcVEVr1JMMboQ7nO3AcTQDSEi5puE7LDsAZ5JE79kXwwH4Dk5zS/innERGgogNXXmFnayVFnrsklIWDOpngQg/p3ar3sw3wK9SIy1jZ/UUwNUhFokOuUKRcln7a6qqxiOH4JJkKXey4QJSo4rVK5O6as03O/SE6UTife0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:20 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 03/12] RISC-V: Allow interrupt controllers to claim
	interrupts
Thread-Index: AQHU25Zr4ikHYvjax0uxbNfk4kk+wQ==
Date: Sat, 16 Mar 2019 01:20:20 +0000
Message-ID: <420e983718a216769da60c147bfcde8205bf5785.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BY5PR13CA0020.namprd13.prod.outlook.com
	(2603:10b6:a03:180::33) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d69a997f-f5a8-41d4-fcf4-08d6a9ad8e36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5989337FEF238509CEABB64490450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(5024004)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fxSFFK0itnbGDt4lo3S5ehf0e59H5sPhomSRaktVjJ2KFDSPBTIMDRLEyaEJswZhb2qs+N0q7VfW+tFlrI6/odRAHAPw4JP0izVVDf2xACizbCDNtzBJPFUufizbfEnJWm2tDjs+EXHT8IBVTvq+XsuzdcORqT1HHrmO7kVOb6KOa0/CZlpPaFh3DNYIYakC0RC3n8fqorfugL6vbUsm2ZC3k9QhzV8HhXuoKtA7UlAWkSyK9iaSh5Y9HaAvQurG/bgLECBPXnql1jmyWaaBMAoTi04C0g1mm1ixpFmvuWxf4BLnuqctaESzo62Ok1/SdiwkBXCof/uAp122OI3T0Hu7ZyzS7NZFUKBqd8JoYbDDkh7yMqUfppsQvZuG/GuZFveO65JCtXHMUHGwdO6txdJpNCvFiYLwQwpofaN5AaE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69a997f-f5a8-41d4-fcf4-08d6a9ad8e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:20.1359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 03/12] RISC-V: Allow interrupt controllers
 to claim interrupts
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:30 -0000

From: Michael Clark <mjc@sifive.com>

We can't allow the supervisor to control SEIP as this would allow the
supervisor to clear a pending external interrupt which will result in
lost a interrupt in the case a PLIC is attached. The SEIP bit must be
hardware controlled when a PLIC is attached.

This logic was previously hard-coded so SEIP was always masked even
if no PLIC was attached. This patch adds riscv_cpu_claim_interrupts
so that the PLIC can register control of SEIP. In the case of models
without a PLIC (spike), the SEIP bit remains software controlled.

This interface allows for hardware control of supervisor timer and
software interrupts by other interrupt controller models.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c    | 15 +++++++++++++++
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 11 +++++++++++
 target/riscv/csr.c        | 10 ++--------
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index b859f919a7..1c703e1a37 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -23,6 +23,7 @@
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
 #include "hw/riscv/sifive_plic.h"
=20
 #define RISCV_DEBUG_PLIC 0
@@ -431,6 +432,7 @@ static void sifive_plic_irq_request(void *opaque, int i=
rq, int level)
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
     SiFivePLICState *plic =3D SIFIVE_PLIC(dev);
+    int i;
=20
     memory_region_init_io(&plic->mmio, OBJECT(dev), &sifive_plic_ops, plic=
,
                           TYPE_SIFIVE_PLIC, plic->aperture_size);
@@ -443,6 +445,19 @@ static void sifive_plic_realize(DeviceState *dev, Erro=
r **errp)
     plic->enable =3D g_new0(uint32_t, plic->bitfield_words * plic->num_add=
rs);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
+
+    /* We can't allow the supervisor to control SEIP as this would allow t=
he
+     * supervisor to clear a pending external interrupt which will result =
in
+     * lost a interrupt in the case a PLIC is attached. The SEIP bit must =
be
+     * hardware controlled when a PLIC is attached.
+     */
+    for (i =3D 0; i < smp_cpus; i++) {
+        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
+            error_report("SEIP already claimed");
+            exit(1);
+        }
+    }
 }
=20
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c2aebf132..a0b3c22dec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -140,6 +140,7 @@ struct CPURISCVState {
      * mip is 32-bits to allow atomic_read on 32-bit hosts.
      */
     uint32_t mip;
+    uint32_t miclaim;
=20
     target_ulong mie;
     target_ulong mideleg;
@@ -263,6 +264,7 @@ void riscv_cpu_list(FILE *f, fprintf_function cpu_fprin=
tf);
 #define cpu_mmu_index riscv_cpu_mmu_index
=20
 #ifndef CONFIG_USER_ONLY
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value=
);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value =
*/
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f49e98ed59..555756d40c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,6 +72,17 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)
=20
 #if !defined(CONFIG_USER_ONLY)
=20
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+{
+    CPURISCVState *env =3D &cpu->env;
+    if (env->miclaim & interrupts) {
+        return -1;
+    } else {
+        env->miclaim |=3D interrupts;
+        return 0;
+    }
+}
+
 /* iothread_mutex must be held */
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value=
)
 {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 960d2b0aa9..938c10897c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -550,16 +550,10 @@ static int rmw_mip(CPURISCVState *env, int csrno, tar=
get_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     RISCVCPU *cpu =3D riscv_env_get_cpu(env);
-    target_ulong mask =3D write_mask & delegable_ints;
+    /* Allow software control of delegable interrupts not claimed by hardw=
are */
+    target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
     uint32_t old_mip;
=20
-    /* We can't allow the supervisor to control SEIP as this would allow t=
he
-     * supervisor to clear a pending external interrupt which will result =
in
-     * lost a interrupt in the case a PLIC is attached. The SEIP bit must =
be
-     * hardware controlled when a PLIC is attached. This should be an opti=
on
-     * for CPUs with software-delegated Supervisor External Interrupts. */
-    mask &=3D ~MIP_SEIP;
-
     if (mask) {
         qemu_mutex_lock_iothread();
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
--=20
2.21.0


