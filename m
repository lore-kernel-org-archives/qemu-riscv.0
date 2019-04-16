Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGCF5-00008A-Jo
	for mharc-qemu-riscv@gnu.org; Mon, 15 Apr 2019 20:46:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hGCF2-000064-5o
	for qemu-riscv@nongnu.org; Mon, 15 Apr 2019 20:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hGCF0-0002wl-7t
	for qemu-riscv@nongnu.org; Mon, 15 Apr 2019 20:46:28 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44692)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hGCEv-0002lx-MN; Mon, 15 Apr 2019 20:46:22 -0400
Received: by mail-lf1-x144.google.com with SMTP id h18so14514291lfj.11;
	Mon, 15 Apr 2019 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rsdyoSNBUFQCy30ybdnZsnIJbz8/AMTSta5FXgEs45M=;
	b=O4AfVascLLIoPjIUrDxfnAhZvzClnQSVOZokDRIRxirC5vVMMOX7Ob7gdklYhVRsn/
	TnlA5i0nNrRya5oPTOGdqR4wR5+6bvh2arj5gklgBCx4MVaRVgAuXyMocgWGR9XpC81p
	mp7dgTdToNK/Peij0uKQkTM1pR3P1zFsXGffCiG8czfTvQ6fyHO2NHCbQIAbuDbSVF0L
	/ooGeXhqe7QyCMQVu4O0MvfnNM1i+tnoQajcfjZ6l93k94AM3A+26DxCGJ99TTFRgZgb
	RoboRQ+NrLTQjpStciAC9dX5Ju5laq+tKC3fBaVatIFdBJHoqiBaCW14jl94JHCJGSDj
	3fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rsdyoSNBUFQCy30ybdnZsnIJbz8/AMTSta5FXgEs45M=;
	b=JdoRZgl2ubHQlMtfIB5NrWGMcVRx+PoROlyV4dbasBBZrn56fv5smn2qapJlG17FFF
	AjJhyUZxmS1r97pakNY5m9Eiu6JeWBjKuy3iOFFp72aZu8zjRYIK70N13bH5v64Vs8sl
	2y3NdjaaaQfP+iRWU9hvJjl/+GrMvsTClGylPYSRS1NvSdpyA21QZ2T0d5ZrWGbbDIO3
	eQX2fPsuf15VRPP+W75SrGrILzLS1zfuN3wejwxJT/4FtRg43fEJ1tFDY3h6JE1PsOPg
	qjFK3UslHZRL8geJyBZ82sMjoK7JuIKfwbes/+y9fFE/s6L6K+72btZH2djYfzwCoRCa
	1+ZQ==
X-Gm-Message-State: APjAAAW6hqVzaPTbBcdAY4tvtjQVPO8kox8LpA6QTngURy+1YW0wMqWW
	3Zi/DN9DpeKYMvwbXFrrtNnsPu3SxJWlE54PLyc=
X-Google-Smtp-Source: APXvYqzuSmMSc4jWAUbK3/PNzHWYuMW9FWNRLoxtuKgZszeSCAbnhOzOaMqTwGEPu1wZVrUYd0ZwHo2TdoF7EM3Ka6g=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr24315590lfi.46.1555375579070; 
	Mon, 15 Apr 2019 17:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVEkpkBAOo566s1BJk9YQBVeNkf2kpbS_kdjkn9j=3i1VA@mail.gmail.com>
	<CAKmqyKPM=XUyF+KweO2CLBQ3bEuu_BTU2fu+R7R09rV-1O9TkQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPM=XUyF+KweO2CLBQ3bEuu_BTU2fu+R7R09rV-1O9TkQ@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 15 Apr 2019 20:45:52 -0400
Message-ID: <CANnJOVFOq4-kQASRMiFhAQrAdm5tL6fZf1VofDO=s2_yrEU63w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: multipart/alternative; boundary="000000000000e206ba05869b186a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Expose time
 CSRs when allowed by [m|s]counteren
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
X-List-Received-Date: Tue, 16 Apr 2019 00:46:30 -0000

--000000000000e206ba05869b186a
Content-Type: text/plain; charset="UTF-8"

For any chip that has a CLINT, we want the frequency of the time register
and the frequency of the CLINT to match. That frequency,
SIFIVE_CLINT_TIMEBASE_FREQ
(=10MHz) is currently defined in hw/riscv/sifive_clint.h and so isn't
visible to target/riscv/cpu.c where the CPURISCVState is first created.
Instead, I first initialize the frequency to a reasonable default (1GHz)
and then let the CLINT override the value if one is attached. Phrased
differently, the values produced by the `sifive_clint.c:
cpu_riscv_read_rtc()` and `csr.c: read_time()` must match, and this is one
way of doing that.

I'd be open to other suggestions.

Jonathan

On Mon, Apr 15, 2019 at 8:23 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Apr 12, 2019 at 12:04 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >
> > Currently mcounteren.TM acts as though it is hardwired to zero, even
> though
> > QEMU
> > allows it to be set. This change resolves the issue by allowing reads to
> the
> > time and timeh control registers when running in a privileged mode where
> > such
> > accesses are allowed.
> >
> > Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
> > ---
> >  hw/riscv/sifive_clint.c |  1 +
> >  target/riscv/cpu.c      | 14 ++++++++++++++
> >  target/riscv/cpu.h      |  2 ++
> >  target/riscv/csr.c      | 17 +++++++++++------
> >  4 files changed, 28 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> > index d4c159e937..3ad4fe6139 100644
> > --- a/hw/riscv/sifive_clint.c
> > +++ b/hw/riscv/sifive_clint.c
> > @@ -237,6 +237,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr
> > size, uint32_t num_harts,
> >          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                    &sifive_clint_timer_cb, cpu);
> >          env->timecmp = 0;
> > +        env->time_freq = SIFIVE_CLINT_TIMEBASE_FREQ;
>
> Why do you need to set this here?
>
> Alistair
>
> >      }
> >
> >      DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_CLINT);
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d61bce6d55..ff17d54691 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -103,12 +103,20 @@ static void set_resetvec(CPURISCVState *env, int
> > resetvec)
> >  #endif
> >  }
> >
> > +static void set_time_freq(CPURISCVState *env, uint64_t freq)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    env->time_freq = freq;
> > +#endif
> > +}
> > +
> >  static void riscv_any_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  #if defined(TARGET_RISCV32)
> > @@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
> > @@ -131,6 +140,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  static void rv32imacu_nommu_cpu_init(Object *obj)
> > @@ -140,6 +150,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  #elif defined(TARGET_RISCV64)
> > @@ -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
> > @@ -162,6 +174,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  static void rv64imacu_nommu_cpu_init(Object *obj)
> > @@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  #endif
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 20bce8742e..67b1769ad3 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -173,7 +173,9 @@ struct CPURISCVState {
> >      /* temporary htif regs */
> >      uint64_t mfromhost;
> >      uint64_t mtohost;
> > +
> >      uint64_t timecmp;
> > +    uint64_t time_freq;
> >
> >      /* physical memory protection */
> >      pmp_table_t pmp_state;
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index e1d91b6c60..6083c782a1 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int
> > csrno, target_ulong *val)
> >  }
> >  #endif /* TARGET_RISCV32 */
> >
> > -#if defined(CONFIG_USER_ONLY)
> >  static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> > +#if !defined(CONFIG_USER_ONLY)
> > +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +                    env->time_freq, NANOSECONDS_PER_SECOND);
> > +#else
> >      *val = cpu_get_host_ticks();
> > +#endif
> >      return 0;
> >  }
> >
> >  #if defined(TARGET_RISCV32)
> >  static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> > +#if !defined(CONFIG_USER_ONLY)
> > +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +                    env->time_freq, NANOSECONDS_PER_SECOND) >> 32;
> > +#else
> >      *val = cpu_get_host_ticks() >> 32;
> > +#endif
> >      return 0;
> >  }
> >  #endif
> >
> > -#else /* CONFIG_USER_ONLY */
> > +#if !defined(CONFIG_USER_ONLY)
> >
> >  /* Machine constants */
> >
> > @@ -854,14 +863,10 @@ static riscv_csr_operations
> csr_ops[CSR_TABLE_SIZE] =
> > {
> >      [CSR_INSTRETH] =            { ctr,
> > read_instreth                       },
> >  #endif
> >
> > -    /* User-level time CSRs are only available in linux-user
> > -     * In privileged mode, the monitor emulates these CSRs */
> > -#if defined(CONFIG_USER_ONLY)
> >      [CSR_TIME] =                { ctr,
> > read_time                           },
> >  #if defined(TARGET_RISCV32)
> >      [CSR_TIMEH] =               { ctr,
> > read_timeh                          },
> >  #endif
> > -#endif
> >
> >  #if !defined(CONFIG_USER_ONLY)
> >      /* Machine Timers and Counters */
> > --
> > 2.20.1
>

--000000000000e206ba05869b186a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For any chip that has a CLINT, we want the frequency =
of the time register and the frequency of the  CLINT to match. That frequen=
cy, <span class=3D"gmail-im">SIFIVE_CLINT_TIMEBASE_FREQ (=3D10MHz)</span> i=
s currently defined in hw/riscv/sifive_clint.h and so isn&#39;t visible to =
target/riscv/cpu.c where the CPURISCVState is first created. Instead, I fir=
st initialize the frequency to a reasonable default (1GHz) and then let the=
 CLINT override the value if one is attached. Phrased differently, the valu=
es produced by <span class=3D"gmail-pl-en">the `sifive_clint.c: cpu_riscv_r=
ead_rtc()` and  `csr.c: read_time()` must match, and this is one way of doi=
ng that.<br></span></div><div><br></div><div>I&#39;d be open to other sugge=
stions. <br></div><div><br></div><div>Jonathan<br></div><div><br></div><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 15=
, 2019 at 8:23 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.c=
om">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, Apr 12, 2019 at 12:04 PM Jonathan Behrens &=
lt;<a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently mcounteren.TM acts as though it is hardwired to zero, even t=
hough<br>
&gt; QEMU<br>
&gt; allows it to be set. This change resolves the issue by allowing reads =
to the<br>
&gt; time and timeh control registers when running in a privileged mode whe=
re<br>
&gt; such<br>
&gt; accesses are allowed.<br>
&gt;<br>
&gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.c=
om" target=3D"_blank">fintelia@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/sifive_clint.c |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++------<br=
>
&gt;=C2=A0 4 files changed, 28 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c<br>
&gt; index d4c159e937..3ad4fe6139 100644<br>
&gt; --- a/hw/riscv/sifive_clint.c<br>
&gt; +++ b/hw/riscv/sifive_clint.c<br>
&gt; @@ -237,6 +237,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwad=
dr<br>
&gt; size, uint32_t num_harts,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timer =3D timer_new_ns(QEMU_=
CLOCK_VIRTUAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sifive_clint_t=
imer_cb, cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timecmp =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;time_freq =3D SIFIVE_CLINT_TIMEBA=
SE_FREQ;<br>
<br>
Why do you need to set this here?<br>
<br>
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL, TYPE_SIFIVE=
_CLINT);<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index d61bce6d55..ff17d54691 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -103,12 +103,20 @@ static void set_resetvec(CPURISCVState *env, int=
<br>
&gt; resetvec)<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void set_time_freq(CPURISCVState *env, uint64_t freq)<br>
&gt; +{<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 env-&gt;time_freq =3D freq;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void riscv_any_cpu_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD=
 | RVC | RVU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0, PRIV_VERSIO=
N_1_10_0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt; @@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *o=
bj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)<br>
&gt; @@ -131,6 +140,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *o=
bj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void rv32imacu_nommu_cpu_init(Object *obj)<br>
&gt; @@ -140,6 +150,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0, PRIV_VERSIO=
N_1_10_0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #elif defined(TARGET_RISCV64)<br>
&gt; @@ -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *o=
bj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)<br>
&gt; @@ -162,6 +174,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *o=
bj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void rv64imacu_nommu_cpu_init(Object *obj)<br>
&gt; @@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0, PRIV_VERSIO=
N_1_10_0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<br>
&gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 20bce8742e..67b1769ad3 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -173,7 +173,9 @@ struct CPURISCVState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* temporary htif regs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mfromhost;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mtohost;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t timecmp;<br>
&gt; +=C2=A0 =C2=A0 uint64_t time_freq;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* physical memory protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pmp_table_t pmp_state;<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index e1d91b6c60..6083c782a1 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int=
<br>
&gt; csrno, target_ulong *val)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif /* TARGET_RISCV32 */<br>
&gt;<br>
&gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt;=C2=A0 static int read_time(CPURISCVState *env, int csrno, target_ulong=
 *val)<br>
&gt;=C2=A0 {<br>
&gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt; +=C2=A0 =C2=A0 *val =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 env-&gt;time_freq, NANOSECONDS_PER_SECOND);<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;=C2=A0 static int read_timeh(CPURISCVState *env, int csrno, target_ulon=
g *val)<br>
&gt;=C2=A0 {<br>
&gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt; +=C2=A0 =C2=A0 *val =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 env-&gt;time_freq, NANOSECONDS_PER_SECOND) &gt;&gt; 32;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt; 32;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; -#else /* CONFIG_USER_ONLY */<br>
&gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt;<br>
&gt;=C2=A0 /* Machine constants */<br>
&gt;<br>
&gt; @@ -854,14 +863,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SI=
ZE] =3D<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_INSTRETH] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { ctr,<br>
&gt; read_instreth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* User-level time CSRs are only available in linux-use=
r<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* In privileged mode, the monitor emulates these =
CSRs */<br>
&gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIME] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 { ctr,<br>
&gt; read_time=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIMEH] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{ ctr,<br>
&gt; read_timeh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 #endif<br>
&gt; -#endif<br>
&gt;<br>
&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Timers and Counters */<br>
&gt; --<br>
&gt; 2.20.1<br>
</blockquote></div></div>

--000000000000e206ba05869b186a--

