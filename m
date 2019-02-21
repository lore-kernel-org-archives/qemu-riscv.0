Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTB-0004Ht-W3
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT9-00049b-GB
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT7-0002N8-Dg
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT1-0002HA-EV; Wed, 20 Feb 2019 19:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709840; x=1582245840;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=/ZV95K4nHrfbwHh0leF2LpjeFJuS8bDij/lV00ecMwo=;
	b=rT1cDBHhrPfwbGtlMYjJCbzyNlyFnBbELrzux8fOCwyF9x67fZi3b5/r
	eMgw5snVdtLi5Kmf8Z/MZKChthk82qOOHE4KcOYiW3/bINDps+m0nPq5F
	9b9GHzl6Cgq2GZRExBVPrzHnZjjHmq6/cVO8ZzU9AtDFPCWs2kLetkoVi
	DN0EMuIYwfscgJp2NZqtr00ZvvIMd9QcrgMnfryVoSbjO1o2P6jWperzv
	1yr54Ubdz+JsDwMQIeukAtvbF3FT5RsOBiPujGhzPLSZA5ltRBbySJjyy
	b2gnyaj5qGK4p4hOiozL2mZze1g9QWOzpIuIWB2zwLR9oHaPLJK6GJlIm A==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="106761240"
Received: from mail-by2nam05lp2056.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.56])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:43:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Oe/7r60kvHELNwLMSbBVf7H3g89G2/NlpqkIMvcRAH0=;
	b=Qbfn8r3djCFlBoqY5EjThoWlL8/tqXCKKWzm2IyesN4EPXEZ/iPfmjOaxkVBdQOilO+yz55ah1FvxNl7uepweyI6oVkGEYcHnKEUav50rA+SqVrX5NcAht4Xh0AgNK9ULeXiLPcbHW0SYzdKR3c2h5/b+Ty1uI19/DHa2IJAhHg=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:39 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 03/11] RISC-V: Allow interrupt controllers to claim
	interrupts
Thread-Index: AQHUyX58klKGwelybEih6gRuuWGrKw==
Date: Thu, 21 Feb 2019 00:43:39 +0000
Message-ID: <7835d3381c5acb91cbb7d8cc947d3df0e3a2c74f.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3a95b1a-2cba-4b5e-f6a2-08d697959f2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:rh1UDDKFqQVjsT1B/+LfqVX/ZrEEGQRmVhf62IY?=
	=?iso-8859-1?Q?DUfnNaADtVHq7xExuuQ2KXtEHye8+xcvEY5acejaS8xSASZ3Vt/voo4jyq?=
	=?iso-8859-1?Q?z8Z2sbzdsuGwW5JsmSuncBAXRrtKLYkVELQJ2eKCzmH0mK4n495Ah+PgbA?=
	=?iso-8859-1?Q?holJRXWOQod1xvz3fLknELXdXec3+x3Hz/toNGfTYlSmdxmDdskipXvyGV?=
	=?iso-8859-1?Q?40pLMwotFDqKdFtMIuzLrUyfxV1F+m5bbNU8GHbkybALpzq72U+823dlXh?=
	=?iso-8859-1?Q?Gr7oL0lWaNrZvkZN1Dbr339oaI7PfewmoGgpy803dMGh8QuODkBEgpMHvZ?=
	=?iso-8859-1?Q?Hev5Zne8qjWLt/0MTndH/5BWzZm/LsXLsqYxtVXwr6Z6QoOwIfGKRdO0qZ?=
	=?iso-8859-1?Q?NAPHdv3F2B74C6aSWQ/KUu12zakJLOC0lx8NauIdRWqMvX33NtYbgujQb5?=
	=?iso-8859-1?Q?XRs1VAlvjIUn1ChGcVAkJtHG4cuYkVqW9X+K06XFLQ9TkV+x8rKuFB5V2l?=
	=?iso-8859-1?Q?h9rZyCwQ9kUU1NSvel6VcH+1iEhCwnQqmcjRuT5DBGk1sGWg189yYgmKSV?=
	=?iso-8859-1?Q?S9GyflSiEOB5nrPSKYOi3Qt6etyXRebycuHWB2xP/dQPWPR9FPfo7Ob0h0?=
	=?iso-8859-1?Q?Ia4lw3geNZYTXxffDJ5z2nK9IHhtYprDVyHMTG8ZXhiyJlDI5PcwwxY+PI?=
	=?iso-8859-1?Q?3KgV1dLb0+cueB80WtCrCCLH65yLSnF2/Wwggt+H/rYYaOYr24BvoA1RNT?=
	=?iso-8859-1?Q?AIIJVEtcm4fXzRclTxzOGTViSs/QhEbYy5D4Mvn0bu80D7vtBgiNRwHCsQ?=
	=?iso-8859-1?Q?FL1KIyZPt9lUjF3nw0rVJOGIi+1d9aV45eg7q8/Lj618MTra7vddY6Mmxy?=
	=?iso-8859-1?Q?mITGNQo/ExmRu/Vc7pkTjyJjqEQuuPE2fBRfNclP+eR+DJuwTb4mNt/NFe?=
	=?iso-8859-1?Q?9WrFRVWdw2XX9kZTtldBfXysNgovSkzoXwU3A84B6vLz43Wm7niDvIlZT6?=
	=?iso-8859-1?Q?2RyR2J85krTPg0KEf36gxvpFDQV+phAprf2bop+Q+vDbflD6lIhPjUdNrc?=
	=?iso-8859-1?Q?+eysO2Aj9goeOe7MD8abZWK1UeszKaemSvyy/TD3iZ/raMJADAE+G48BZN?=
	=?iso-8859-1?Q?u+NjX1AeZ0NPHeg1r+a4KfB2K2GGQwAM/+zqoJkxm8wKgCMnmHdPKooI0Y?=
	=?iso-8859-1?Q?lFiu6Fdlh3gpkhGbUzMtnf9vIj1e2bCJq9BzRtEAS1JvoaJROcP8CZwrM2?=
	=?iso-8859-1?Q?o1wZPsO7n546wg5xAFIqabTI9peSZmABRds+hQjmV+w4YfTsN/E8SyktuO?=
	=?iso-8859-1?Q?SEgNNzVbay3Hu6Bpmod6qbvUrjzeKvg3ilIb6PsPlnj4GF5GoUAafWiOiB?=
	=?iso-8859-1?Q?cgxuZVVA=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB09856F3C65462A48B31DE57F907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002)(5024004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bxU4jxZL6PaN3nun/et6XeKvE003GZOV7QKLAzYzk6B3K8IFYbNcG9DbE2sIJEzAG0hD4+xCAyQqsBzm8Uo+cWbPt2N/Sc3VRAfTNgbajYfEukMd7cjHygbUUWuVOHcED7lmoJ+etCWVAwS8Qvxn33hDa5NtsIlkBWE4LNEIVqiyIMgvDOhmjrLbgIg6izsUut8/vM0A1GpJ8tDoepYfTebSWCzgzMZUxfdfzdDOLUGAuEJIWOs0YjBHUPSTHqw5gn4tv+RBcJXxFilshX7aN2x3J4FPHy5zWsREsKLpC1Mth+Hw6cBW+YdC4BwmmIDimyJEbJWOf9oj3Wnyi+FDenAVGPMesKJybKsIQxbiNOlbaIv/c2SyndKAtTye1yC8rRimcXnnOmrVXEks69VlkKM7+xvL/nyKb4X/lhE3Z80=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a95b1a-2cba-4b5e-f6a2-08d697959f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:39.3526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 03/11] RISC-V: Allow interrupt controllers
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:08 -0000

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


