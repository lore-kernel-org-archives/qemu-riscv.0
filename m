Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0A-0005JA-MR
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH03-0005Gr-Ej
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH02-0006OU-8E
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:07 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzv-0006F8-LI; Fri, 08 Feb 2019 19:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674019; x=1581210019;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=/ZV95K4nHrfbwHh0leF2LpjeFJuS8bDij/lV00ecMwo=;
	b=dO1lik0LGhHtoR+DK/XOgahCumhzeI4fxFDUic4ghFDo4cao9r+Bk2FS
	XGYIRgJDl240R/M7hk7d6/49ZTzYhyrJUGIM2ZST82C534U0p/Pmlj0jj
	UjXaCOwUXn1iJX+44jo807qdGQF9gVdXpDj/XZxR5sSVBbVikUQNnqDiC
	88ZwEekqXFtDe4TR7A9A+n8lNLczwCb8Se09JsOS+N1FcgjmL3pTtMfJL
	uNOP3glau4iq1pnQRPW6xZE+OHvfEeYe7LgovsOD1k5V3XzBSdUGsoXpr
	JyR+bhh7e3Z0yCHqLCSBSfikcAqKzaiJHFE5RQdXve1078n3yp8iWaM1R g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="198999504"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Oe/7r60kvHELNwLMSbBVf7H3g89G2/NlpqkIMvcRAH0=;
	b=fUgueajAt7/Zk7tsdaXWuRhfrhTLrEcZ5akW5YhbmPMma18kpTphO7tkZXeRt7Vb3y3RcnyhHxko42nmGOs+KVeFsoldV4rQDSM623KT+E40pmqQ3tT0w809H0BpidLrdD6UkXdaDsKkrNCxaRpaBLk2YHx7Sct0S0ZLvt0qyrE=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 00:59:56 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 00:59:56 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 04/11] RISC-V: Allow interrupt controllers to claim
	interrupts
Thread-Index: AQHUwBLG14WX+MEk0UCiYs+PnsSttA==
Date: Sat, 9 Feb 2019 00:59:56 +0000
Message-ID: <e1345bc6141130d7d7b3414377964d1223cf09ae.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0047.namprd02.prod.outlook.com
	(2603:10b6:a03:54::24) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:m778Cxbqt/0sAed8mcOkGzyTZ9Cnk4F3JWeixJAlwz5GtkNq0FYldIJX/2Mqmhb/ljZqyi0Pqh9wJwZL6yhU1cALzuCieGCcwGdb/z+cyJKpLlnIbtbSWO7GPmr8XTCEYMRqj+/w5PM04NYs/wnQruWF/4gCAAHwttm2e8ffI8elQzaX5IkA/+APzvt1FI8U2NzrSjDjlvZc4lSRTRCFDN8hAsV328x48dmtAU+9Pmf2cFuudks8BfLMNhAXunpa0mmbFQN/sGEo3nuyV1Mb2+ASDeNxjuDzk0h7RKdkt5EPp+6MUpnp+aTq7wc9mOB/P3Ktxbw7wSc0mFepLscJGF/j9V3DaBpeCpANAhb+xxsCawurMQ1f46vVayR2+wObrkidVPLJzfhgBz2nGsNnVrXMLexqB3gRQx1O3YqcKdpx4FOZ9ql7Q9D3o7welDram6VACVLNVNAYGsS3FpeRkQ==;
	5:F0ya3oWzpyvXf6SPqlIWui8qjnX2fOCNthPGcCuW8clvFDTM2Ls+wgOZgNirarXH9YbJ4ODlgl+/1W8wE5qNiW2nNjE26n+5TXsqkSIszo55P6gpCiYdLdZkabFuhJ9TOIhOekvOzn9mlZw560sx0ODQJRNi8/73i9K7qHW5S8W6YooWPBUyEklYSP6MRmo/UemvtUxXUmKt9HXngXGhow==;
	7:XLAPJMXt7UA5zJJTmwNPw4+N3cIekIGnu5FjTJ6qCZ8kf/PrU7iAIzsBOEEXy9FNpey9HRt6Qsokn462fJI2lPTuBPP2fn5QjVgFlzUyFasSEJpvWLqlEFr0PpGbN3zhBgPOU/dnamF3t8GcE4eVDg==
x-ms-office365-filtering-correlation-id: 69192b02-76c4-4589-ea1b-08d68e29e852
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409BDABADE3A0CA64D180E6906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(5024004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EJznk98Av8+n9SdW45kMaMXrekrDBu5fra6ZVgrYY0rxe2JDoooknZ6/0zUSq1YV0riM98UBVqfJBoYTwqllzkckCEK0CxaV7TXwij9sC6l+1QnlnqmUdObrHgUkPqNcOYNhGfhPBiAyH6Uhae8wRJHpLY+j7vKLv+7lK7rFPgK73sSCvVMGH2N8pkTUjkQ16Z5FIbvOL0HgmvQsT+JS5RAdvY7HAHAE3BXEXUgzMd/sDgdudV61KJH4McjCqtIflvTVs6OJld693vCXGo/LgkoHl45ZHkkCLkS0MdmQza4ghvmjazqS7Z1X9pS5N/q1Spx72UaCdMkjJLLjUbGEfj4dwybSzPvbdAx3ji9dz3Ml9TzLPe0faP+KiA+9wF6/jsc+s/QvD7+PHbSGYgNLTEBaADb85BzWbr0a4JpH66Y=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69192b02-76c4-4589-ea1b-08d68e29e852
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 00:59:56.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 04/11] RISC-V: Allow interrupt controllers
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
X-List-Received-Date: Sat, 09 Feb 2019 01:00:13 -0000

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
2.20.1


