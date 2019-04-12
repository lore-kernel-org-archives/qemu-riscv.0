Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hF1T9-0004zF-3m
	for mharc-qemu-riscv@gnu.org; Fri, 12 Apr 2019 15:04:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hF1T5-0004xt-FZ
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 15:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hF1T3-000504-Pj
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 15:04:07 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hF1Sz-0004xV-Jr; Fri, 12 Apr 2019 15:04:02 -0400
Received: by mail-lf1-x143.google.com with SMTP id h5so5357966lfm.1;
	Fri, 12 Apr 2019 12:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=nQVBDQdIf7uLgvydkDvWOdcylKmcIXFTHUtAzZQVE9w=;
	b=TS8M61qU/G72Ux4pS9vLex4buvOMWupJGjEt2JKiv76ZljUAQRXpi2Wg8qEn9Qadmc
	ow84TH+4JVDGQGxaNPhM8yGUmNKx50byKrKS0YplnUFsGeF2z0vzeSSwU3rklBXQCIne
	U0w55TJ02sje2dDIxNNuYFru3luTiYRJk9f+rHJG+oPVs+AkqxfMCYG/jrNHk9C9MaNT
	W/62KmyDPdj+lpONR7Ilp6MT7g0x8C73WdF+JXq72zFHsMQos9ktvm4rDCfWgzKw1M85
	WawRKC26pPeHEXHoPZxEiWSe2CEAQoiQBHqgMhj6kQIny6F9S//ZwMyOYyRIM7Z+uiYI
	wUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=nQVBDQdIf7uLgvydkDvWOdcylKmcIXFTHUtAzZQVE9w=;
	b=Dx7GguEmNc5M5D/bmt6eNVNa3xz3+7/KjprpOaJ3NzXVKzN9cQrW8o3vdfv6r/JO8K
	bWNvVpBftq16CvQeNXOqgaF8IFtciXL6JxlIQsk1N/4wjXrcFz4goY350XN1chQfqZcs
	ysIPNTtBvZE3mXnAK5unsMV/yJzU2pHO31O0M9GcF6UlLE+hZZpvpFgCTA6InMg3irbr
	ccMxZ2/oxZz1NjxcqMA2FGAuJPq1VpjENmyH5xH7vLBfgnpNJIZ6x1qOiIosgakKqWgR
	HDEoHu5NIYuM7oAQNsfn3oHfBmIBVfh2riPmcZE3ORLu9t5x9N/dBZ9KdrsJCswdiCB1
	9I1w==
X-Gm-Message-State: APjAAAU3dljtE9sPb2bdqjf7I6v1kcDiLtYnZia/OjhPenZomNTum4TO
	luvdKyyCY51C81VSVN2AB7tFBXSeJeAAYrm947SBCC+044Y=
X-Google-Smtp-Source: APXvYqyuvttJ1QVlVKHSlce2MhjoOZTwf2ALSp301MRLPZzh69Tt1/ovVa3JkiaHOuhTsm/Mqo+XQW8NRvUsqmkDi+8=
X-Received: by 2002:ac2:5487:: with SMTP id t7mr6926081lfk.41.1555095839433;
	Fri, 12 Apr 2019 12:03:59 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Fri, 12 Apr 2019 15:03:33 -0400
Message-ID: <CANnJOVEkpkBAOo566s1BJk9YQBVeNkf2kpbS_kdjkn9j=3i1VA@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000019e7a8058659f713"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: [Qemu-riscv] [PATCH] target/riscv: Expose time CSRs when allowed by
 [m|s]counteren
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
X-List-Received-Date: Fri, 12 Apr 2019 19:04:10 -0000

--00000000000019e7a8058659f713
Content-Type: text/plain; charset="UTF-8"

Currently mcounteren.TM acts as though it is hardwired to zero, even though
QEMU
allows it to be set. This change resolves the issue by allowing reads to the
time and timeh control registers when running in a privileged mode where
such
accesses are allowed.

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
---
 hw/riscv/sifive_clint.c |  1 +
 target/riscv/cpu.c      | 14 ++++++++++++++
 target/riscv/cpu.h      |  2 ++
 target/riscv/csr.c      | 17 +++++++++++------
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index d4c159e937..3ad4fe6139 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -237,6 +237,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr
size, uint32_t num_harts,
         env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &sifive_clint_timer_cb, cpu);
         env->timecmp = 0;
+        env->time_freq = SIFIVE_CLINT_TIMEBASE_FREQ;
     }

     DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_CLINT);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d61bce6d55..ff17d54691 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -103,12 +103,20 @@ static void set_resetvec(CPURISCVState *env, int
resetvec)
 #endif
 }

+static void set_time_freq(CPURISCVState *env, uint64_t freq)
+{
+#ifndef CONFIG_USER_ONLY
+    env->time_freq = freq;
+#endif
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 #if defined(TARGET_RISCV32)
@@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
@@ -131,6 +140,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 static void rv32imacu_nommu_cpu_init(Object *obj)
@@ -140,6 +150,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 #elif defined(TARGET_RISCV64)
@@ -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
@@ -162,6 +174,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 static void rv64imacu_nommu_cpu_init(Object *obj)
@@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_PMP);
+    set_time_freq(env, NANOSECONDS_PER_SECOND);
 }

 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 20bce8742e..67b1769ad3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,7 +173,9 @@ struct CPURISCVState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
+
     uint64_t timecmp;
+    uint64_t time_freq;

     /* physical memory protection */
     pmp_table_t pmp_state;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e1d91b6c60..6083c782a1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int
csrno, target_ulong *val)
 }
 #endif /* TARGET_RISCV32 */

-#if defined(CONFIG_USER_ONLY)
 static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    env->time_freq, NANOSECONDS_PER_SECOND);
+#else
     *val = cpu_get_host_ticks();
+#endif
     return 0;
 }

 #if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    env->time_freq, NANOSECONDS_PER_SECOND) >> 32;
+#else
     *val = cpu_get_host_ticks() >> 32;
+#endif
     return 0;
 }
 #endif

-#else /* CONFIG_USER_ONLY */
+#if !defined(CONFIG_USER_ONLY)

 /* Machine constants */

@@ -854,14 +863,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
{
     [CSR_INSTRETH] =            { ctr,
read_instreth                       },
 #endif

-    /* User-level time CSRs are only available in linux-user
-     * In privileged mode, the monitor emulates these CSRs */
-#if defined(CONFIG_USER_ONLY)
     [CSR_TIME] =                { ctr,
read_time                           },
 #if defined(TARGET_RISCV32)
     [CSR_TIMEH] =               { ctr,
read_timeh                          },
 #endif
-#endif

 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-- 
2.20.1

--00000000000019e7a8058659f713
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Currently mcounteren.TM acts as though it=
 is hardwired to zero, even though QEMU<br>allows it to be set. This change=
 resolves the issue by allowing reads to the<br>time and timeh control regi=
sters when running in a privileged mode where such<br>accesses are allowed.=
<br><br>Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmai=
l.com">fintelia@gmail.com</a>&gt;<br>---<br>=C2=A0hw/riscv/sifive_clint.c |=
=C2=A0 1 +<br>=C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +=
+++++++++++++<br>=C2=A0target/riscv/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++<br>=C2=A0target/riscv/csr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 =
+++++++++++------<br>=C2=A04 files changed, 28 insertions(+), 6 deletions(-=
)<br><br>diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c<br>=
index d4c159e937..3ad4fe6139 100644<br>--- a/hw/riscv/sifive_clint.c<br>+++=
 b/hw/riscv/sifive_clint.c<br>@@ -237,6 +237,7 @@ DeviceState *sifive_clint=
_create(hwaddr addr, hwaddr size, uint32_t num_harts,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env-&gt;timer =3D timer_new_ns(QEMU_CLOCK_VI=
RTUAL,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;sif=
ive_clint_timer_cb, cpu);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 env-&gt;timecmp =3D 0;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
nv-&gt;time_freq =3D SIFIVE_CLINT_TIMEBASE_FREQ;<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 }<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D qdev_creat=
e(NULL, TYPE_SIFIVE_CLINT);<br>diff --git a/target/riscv/cpu.c b/target/ris=
cv/cpu.c<br>index d61bce6d55..ff17d54691 100644<br>--- a/target/riscv/cpu.c=
<br>+++ b/target/riscv/cpu.c<br>@@ -103,12 +103,20 @@ static void set_reset=
vec(CPURISCVState *env, int resetvec)<br>=C2=A0#endif<br>=C2=A0}<br>=C2=A0<=
br>+static void set_time_freq(CPURISCVState *env, uint64_t freq)<br>+{<br>+=
#ifndef CONFIG_USER_ONLY<br>+=C2=A0=C2=A0=C2=A0 env-&gt;time_freq =3D freq;=
<br>+#endif<br>+}<br>+<br>=C2=A0static void riscv_any_cpu_init(Object *obj)=
<br>=C2=A0{<br>=C2=A0=C2=A0=C2=A0=C2=A0 CPURISCVState *env =3D &amp;RISCV_C=
PU(obj)-&gt;env;<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_misa(env, RVXLEN | RVI | R=
VM | RVA | RVF | RVD | RVC | RVU);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_versions=
(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>+=C2=A0=C2=A0=C2=A0 set_time_freq=
(env, NANOSECONDS_PER_SECOND);<br>=C2=A0}<br>=C2=A0<br>=C2=A0#if defined(TA=
RGET_RISCV32)<br>@@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_in=
it(Object *obj)<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_resetvec(env, DEFAULT_RSTVE=
C);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>+=C2=A0=C2=A0=
=C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>=C2=A0}<br>=C2=A0<br>=
=C2=A0static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)<br>@@ -131,6 +1=
40,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 set_feature(env, RISCV_FEATURE_MMU);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_fe=
ature(env, RISCV_FEATURE_PMP);<br>+=C2=A0=C2=A0=C2=A0 set_time_freq(env, NA=
NOSECONDS_PER_SECOND);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static void rv32imacu_=
nommu_cpu_init(Object *obj)<br>@@ -140,6 +150,7 @@ static void rv32imacu_no=
mmu_cpu_init(Object *obj)<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_versions(env, USE=
R_VERSION_2_02_0, PRIV_VERSION_1_10_0);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_res=
etvec(env, DEFAULT_RSTVEC);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_feature(env, RI=
SCV_FEATURE_PMP);<br>+=C2=A0=C2=A0=C2=A0 set_time_freq(env, NANOSECONDS_PER=
_SECOND);<br>=C2=A0}<br>=C2=A0<br>=C2=A0#elif defined(TARGET_RISCV64)<br>@@=
 -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>=C2=A0=C2=A0=C2=A0=C2=
=A0 set_feature(env, RISCV_FEATURE_PMP);<br>+=C2=A0=C2=A0=C2=A0 set_time_fr=
eq(env, NANOSECONDS_PER_SECOND);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static void =
rv64gcsu_priv1_10_0_cpu_init(Object *obj)<br>@@ -162,6 +174,7 @@ static voi=
d rv64gcsu_priv1_10_0_cpu_init(Object *obj)<br>=C2=A0=C2=A0=C2=A0=C2=A0 set=
_resetvec(env, DEFAULT_RSTVEC);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_feature(env=
, RISCV_FEATURE_MMU);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_feature(env, RISCV_FE=
ATURE_PMP);<br>+=C2=A0=C2=A0=C2=A0 set_time_freq(env, NANOSECONDS_PER_SECON=
D);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static void rv64imacu_nommu_cpu_init(Obje=
ct *obj)<br>@@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(Object=
 *obj)<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_versions(env, USER_VERSION_2_02_0, P=
RIV_VERSION_1_10_0);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_resetvec(env, DEFAULT_=
RSTVEC);<br>=C2=A0=C2=A0=C2=A0=C2=A0 set_feature(env, RISCV_FEATURE_PMP);<b=
r>+=C2=A0=C2=A0=C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>=C2=A0=
}<br>=C2=A0<br>=C2=A0#endif<br>diff --git a/target/riscv/cpu.h b/target/ris=
cv/cpu.h<br>index 20bce8742e..67b1769ad3 100644<br>--- a/target/riscv/cpu.h=
<br>+++ b/target/riscv/cpu.h<br>@@ -173,7 +173,9 @@ struct CPURISCVState {<=
br>=C2=A0=C2=A0=C2=A0=C2=A0 /* temporary htif regs */<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 uint64_t mfromhost;<br>=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t mtohost;<br=
>+<br>=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t timecmp;<br>+=C2=A0=C2=A0=C2=A0 uin=
t64_t time_freq;<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 /* physical memory p=
rotection */<br>=C2=A0=C2=A0=C2=A0=C2=A0 pmp_table_t pmp_state;<br>diff --g=
it a/target/riscv/csr.c b/target/riscv/csr.c<br>index e1d91b6c60..6083c782a=
1 100644<br>--- a/target/riscv/csr.c<br>+++ b/target/riscv/csr.c<br>@@ -191=
,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>=C2=A0}<br>=C2=A0#endif /* TARGET_RISCV32 */<br>=C2=A0<br=
>-#if defined(CONFIG_USER_ONLY)<br>=C2=A0static int read_time(CPURISCVState=
 *env, int csrno, target_ulong *val)<br>=C2=A0{<br>+#if !defined(CONFIG_USE=
R_ONLY)<br>+=C2=A0=C2=A0=C2=A0 *val =3D muldiv64(qemu_clock_get_ns(QEMU_CLO=
CK_VIRTUAL),<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env-&gt;time_freq=
, NANOSECONDS_PER_SECOND);<br>+#else<br>=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D c=
pu_get_host_ticks();<br>+#endif<br>=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<br>=
=C2=A0}<br>=C2=A0<br>=C2=A0#if defined(TARGET_RISCV32)<br>=C2=A0static int =
read_timeh(CPURISCVState *env, int csrno, target_ulong *val)<br>=C2=A0{<br>=
+#if !defined(CONFIG_USER_ONLY)<br>+=C2=A0=C2=A0=C2=A0 *val =3D muldiv64(qe=
mu_clock_get_ns(QEMU_CLOCK_VIRTUAL),<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 env-&gt;time_freq, NANOSECONDS_PER_SECOND) &gt;&gt; 32;<br>+#else<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt; 32;<br>+#e=
ndif<br>=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<br>=C2=A0}<br>=C2=A0#endif<br>=
=C2=A0<br>-#else /* CONFIG_USER_ONLY */<br>+#if !defined(CONFIG_USER_ONLY)<=
br>=C2=A0<br>=C2=A0/* Machine constants */<br>=C2=A0<br>@@ -854,14 +863,10 =
@@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 [CSR_INSTRETH] =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 { ctr,=C2=A0 read_instreth=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<br>=C2=A0#endif<br>=C2=A0<br>-=C2=
=A0=C2=A0=C2=A0 /* User-level time CSRs are only available in linux-user<br=
>-=C2=A0=C2=A0=C2=A0=C2=A0 * In privileged mode, the monitor emulates these=
 CSRs */<br>-#if defined(CONFIG_USER_ONLY)<br>=C2=A0=C2=A0=C2=A0=C2=A0 [CSR=
_TIME] =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 { ctr,=C2=A0 read_time=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<br>=C2=A0#if d=
efined(TARGET_RISCV32)<br>=C2=A0=C2=A0=C2=A0=C2=A0 [CSR_TIMEH] =3D=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 { ctr,=C2=A0 read_timeh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 },<br>=C2=A0#endif<br>-#endif<br>=C2=A0<br>=C2=A0#=
if !defined(CONFIG_USER_ONLY)<br>=C2=A0=C2=A0=C2=A0=C2=A0 /* Machine Timers=
 and Counters */<br>-- <br>2.20.1</div><div dir=3D"ltr"><br></div></div>

--00000000000019e7a8058659f713--

