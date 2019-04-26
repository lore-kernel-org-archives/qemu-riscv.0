Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJpGC-0007DT-1b
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 21:02:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hJpG6-0007BJ-N1
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 21:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hJpG4-0003f3-E9
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 21:02:34 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:38857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hJpFv-0003aC-GV; Thu, 25 Apr 2019 21:02:24 -0400
Received: by mail-lj1-x241.google.com with SMTP id p14so1328337ljg.5;
	Thu, 25 Apr 2019 18:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m73h981IeJ/Cy24CkH7Sw8UIt4Ycjw85/FvE7TOLg3s=;
	b=J9KCQ/d+jI9k9qGQuptzUDLSzRBmW1kwKNaMJj/cDNuWobq+KbCS6LdfvNZDdxfh0G
	XThWU3Ir/10UHIsQo9HOEhFeEZncTlBsmiBDRyp8lO0Fsa6FF8kjNRtZNncp3or9HAJn
	/0d5TeycmHylY0NAauU+3sdDrDwp0NjAofgmH7OjDGmAjL2vA0dHjh+T7/8pGox3eX6a
	oDMLaIsz47BDqiGSeErt4BVIh0zaHT1KM3HZ3Z4Z2WtNPsvQxkj7qVpBiJFJK4kx+Js2
	ygkJUkZ6aJbWwSzjUDPckIRgaw/mOFzCihmpxJpJN32Fa6uQcuEbiD2x75vKj0wrGDHT
	Od/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m73h981IeJ/Cy24CkH7Sw8UIt4Ycjw85/FvE7TOLg3s=;
	b=Lx+qatpPBC7zKabAObnU+hdg3RiT4bYB7U6Emr62ECwOQBPmACiBEMXqESaumPYCyH
	2ahBINZvxFLechstmq6zXOtgs/PT+VJR5/9fUAe5bQ/Lp/5CwVZe6LrkLAaqI8duxQJJ
	d26AOGqY4N/ANoxcRUrydZ+LaQWhI2Y86NMwTV45E6yzqMwCQo/ZYm4HMQ7RVbVLjS++
	SMTGLIpd5PvWYo4OdTa7wSedM1//Tro2nKbQ6Lkjk8HX2x25VCSPQnU8t34HDov7vnin
	bcP54y+1v9U4UOzKBnbLWIVfgGTywret+kfON47UsPawaSRdbSWUm8Y46KC1wcMe/NfM
	HB1A==
X-Gm-Message-State: APjAAAWoDn6czwztc6Ks8gmGBL0wxGXKwtUPgGI5V2UG4ES6OiVFBX1n
	cDrAiGRn7pkxlvA4+6dq08yqZO/1uWphz1gbtao=
X-Google-Smtp-Source: APXvYqzbnbTWx0jBDQZWwSY6wubMEEcbTxQJ80Zl94uuaplIegULHiqjgqHM29Cjtr5byx+I5JhAgM19Skf05lZqIKU=
X-Received: by 2002:a2e:7605:: with SMTP id r5mr1421586ljc.161.1556240540953; 
	Thu, 25 Apr 2019 18:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKOZ2Dfhk1HgnJqG1hSHHSpm0bpuE-MK8A0aHNjmcT9=ug@mail.gmail.com>
	<mhng-54197190-bad4-4193-8ccc-f07679f414ef@palmer-si-x1e>
In-Reply-To: <mhng-54197190-bad4-4193-8ccc-f07679f414ef@palmer-si-x1e>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Thu, 25 Apr 2019 21:01:54 -0400
Message-ID: <CANnJOVGtJRq5HdtZr5wuyoS7dO1JErUHuaNohoJQsA+cu3X_jg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: multipart/alternative; boundary="000000000000a0f0600587647c65"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Fri, 26 Apr 2019 01:02:38 -0000

--000000000000a0f0600587647c65
Content-Type: text/plain; charset="UTF-8"

No, I've still been meaning to send it. After thinking about this some more
I realized that it didn't actually make sense for the CLINT to decide the
timer frequency and that it should instead be a property of the board
itself. I got a bit sidetracked in the process of making those changes, but
I should have a new version out in the next few days.

On Thu, Apr 25, 2019 at 5:44 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Fri, 19 Apr 2019 16:05:35 PDT (-0700), alistair23@gmail.com wrote:
> > On Mon, Apr 15, 2019 at 5:46 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >>
> >> For any chip that has a CLINT, we want the frequency of the time
> register and the frequency of the CLINT to match. That frequency,
> SIFIVE_CLINT_TIMEBASE_FREQ (=10MHz) is currently defined in
> hw/riscv/sifive_clint.h and so isn't visible to target/riscv/cpu.c where
> the CPURISCVState is first created. Instead, I first initialize the
> frequency to a reasonable default (1GHz) and then let the CLINT override
> the value if one is attached. Phrased differently, the values produced by
> the `sifive_clint.c: cpu_riscv_read_rtc()` and `csr.c: read_time()` must
> match, and this is one way of doing that.
> >
> > Ah that seems fine. Can you add a comment in the code to indicate that
> > it will be overwritten later?
>
> I don't see a v2, did I miss something?
>
> >
> > Alistair
> >
> >>
> >> I'd be open to other suggestions.
> >>
> >> Jonathan
> >>
> >> On Mon, Apr 15, 2019 at 8:23 PM Alistair Francis <alistair23@gmail.com>
> wrote:
> >>>
> >>> On Fri, Apr 12, 2019 at 12:04 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >>> >
> >>> > Currently mcounteren.TM acts as though it is hardwired to zero, even
> though
> >>> > QEMU
> >>> > allows it to be set. This change resolves the issue by allowing
> reads to the
> >>> > time and timeh control registers when running in a privileged mode
> where
> >>> > such
> >>> > accesses are allowed.
> >>> >
> >>> > Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
> >>> > ---
> >>> >  hw/riscv/sifive_clint.c |  1 +
> >>> >  target/riscv/cpu.c      | 14 ++++++++++++++
> >>> >  target/riscv/cpu.h      |  2 ++
> >>> >  target/riscv/csr.c      | 17 +++++++++++------
> >>> >  4 files changed, 28 insertions(+), 6 deletions(-)
> >>> >
> >>> > diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> >>> > index d4c159e937..3ad4fe6139 100644
> >>> > --- a/hw/riscv/sifive_clint.c
> >>> > +++ b/hw/riscv/sifive_clint.c
> >>> > @@ -237,6 +237,7 @@ DeviceState *sifive_clint_create(hwaddr addr,
> hwaddr
> >>> > size, uint32_t num_harts,
> >>> >          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >>> >                                    &sifive_clint_timer_cb, cpu);
> >>> >          env->timecmp = 0;
> >>> > +        env->time_freq = SIFIVE_CLINT_TIMEBASE_FREQ;
> >>>
> >>> Why do you need to set this here?
> >>>
> >>> Alistair
> >>>
> >>> >      }
> >>> >
> >>> >      DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_CLINT);
> >>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >>> > index d61bce6d55..ff17d54691 100644
> >>> > --- a/target/riscv/cpu.c
> >>> > +++ b/target/riscv/cpu.c
> >>> > @@ -103,12 +103,20 @@ static void set_resetvec(CPURISCVState *env,
> int
> >>> > resetvec)
> >>> >  #endif
> >>> >  }
> >>> >
> >>> > +static void set_time_freq(CPURISCVState *env, uint64_t freq)
> >>> > +{
> >>> > +#ifndef CONFIG_USER_ONLY
> >>> > +    env->time_freq = freq;
> >>> > +#endif
> >>> > +}
> >>> > +
> >>> >  static void riscv_any_cpu_init(Object *obj)
> >>> >  {
> >>> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >>> >      set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >>> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  #if defined(TARGET_RISCV32)
> >>> > @@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object
> *obj)
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_MMU);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
> >>> > @@ -131,6 +140,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object
> *obj)
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_MMU);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  static void rv32imacu_nommu_cpu_init(Object *obj)
> >>> > @@ -140,6 +150,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
> >>> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  #elif defined(TARGET_RISCV64)
> >>> > @@ -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object
> *obj)
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_MMU);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
> >>> > @@ -162,6 +174,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object
> *obj)
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_MMU);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  static void rv64imacu_nommu_cpu_init(Object *obj)
> >>> > @@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
> >>> >      set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
> >>> >      set_resetvec(env, DEFAULT_RSTVEC);
> >>> >      set_feature(env, RISCV_FEATURE_PMP);
> >>> > +    set_time_freq(env, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  #endif
> >>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>> > index 20bce8742e..67b1769ad3 100644
> >>> > --- a/target/riscv/cpu.h
> >>> > +++ b/target/riscv/cpu.h
> >>> > @@ -173,7 +173,9 @@ struct CPURISCVState {
> >>> >      /* temporary htif regs */
> >>> >      uint64_t mfromhost;
> >>> >      uint64_t mtohost;
> >>> > +
> >>> >      uint64_t timecmp;
> >>> > +    uint64_t time_freq;
> >>> >
> >>> >      /* physical memory protection */
> >>> >      pmp_table_t pmp_state;
> >>> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >>> > index e1d91b6c60..6083c782a1 100644
> >>> > --- a/target/riscv/csr.c
> >>> > +++ b/target/riscv/csr.c
> >>> > @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env,
> int
> >>> > csrno, target_ulong *val)
> >>> >  }
> >>> >  #endif /* TARGET_RISCV32 */
> >>> >
> >>> > -#if defined(CONFIG_USER_ONLY)
> >>> >  static int read_time(CPURISCVState *env, int csrno, target_ulong
> *val)
> >>> >  {
> >>> > +#if !defined(CONFIG_USER_ONLY)
> >>> > +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >>> > +                    env->time_freq, NANOSECONDS_PER_SECOND);
> >>> > +#else
> >>> >      *val = cpu_get_host_ticks();
> >>> > +#endif
> >>> >      return 0;
> >>> >  }
> >>> >
> >>> >  #if defined(TARGET_RISCV32)
> >>> >  static int read_timeh(CPURISCVState *env, int csrno, target_ulong
> *val)
> >>> >  {
> >>> > +#if !defined(CONFIG_USER_ONLY)
> >>> > +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >>> > +                    env->time_freq, NANOSECONDS_PER_SECOND) >> 32;
> >>> > +#else
> >>> >      *val = cpu_get_host_ticks() >> 32;
> >>> > +#endif
> >>> >      return 0;
> >>> >  }
> >>> >  #endif
> >>> >
> >>> > -#else /* CONFIG_USER_ONLY */
> >>> > +#if !defined(CONFIG_USER_ONLY)
> >>> >
> >>> >  /* Machine constants */
> >>> >
> >>> > @@ -854,14 +863,10 @@ static riscv_csr_operations
> csr_ops[CSR_TABLE_SIZE] =
> >>> > {
> >>> >      [CSR_INSTRETH] =            { ctr,
> >>> > read_instreth                       },
> >>> >  #endif
> >>> >
> >>> > -    /* User-level time CSRs are only available in linux-user
> >>> > -     * In privileged mode, the monitor emulates these CSRs */
> >>> > -#if defined(CONFIG_USER_ONLY)
> >>> >      [CSR_TIME] =                { ctr,
> >>> > read_time                           },
> >>> >  #if defined(TARGET_RISCV32)
> >>> >      [CSR_TIMEH] =               { ctr,
> >>> > read_timeh                          },
> >>> >  #endif
> >>> > -#endif
> >>> >
> >>> >  #if !defined(CONFIG_USER_ONLY)
> >>> >      /* Machine Timers and Counters */
> >>> > --
> >>> > 2.20.1
>

--000000000000a0f0600587647c65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, I&#39;ve still been meaning to send it. After thinking=
 about this some more I realized that it didn&#39;t actually make sense for=
 the CLINT to decide the timer frequency and that it should instead be a pr=
operty of the board itself. I got a bit sidetracked in the process of makin=
g those changes, but I should have a new version out in the next few days.<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Apr 25, 2019 at 5:44 PM Palmer Dabbelt &lt;<a href=3D"mailto:pal=
mer@sifive.com">palmer@sifive.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, 19 Apr 2019 16:05:35 PDT (-0700), =
<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.=
com</a> wrote:<br>
&gt; On Mon, Apr 15, 2019 at 5:46 PM Jonathan Behrens &lt;<a href=3D"mailto=
:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; For any chip that has a CLINT, we want the frequency of the time r=
egister and the frequency of the CLINT to match. That frequency, SIFIVE_CLI=
NT_TIMEBASE_FREQ (=3D10MHz) is currently defined in hw/riscv/sifive_clint.h=
 and so isn&#39;t visible to target/riscv/cpu.c where the CPURISCVState is =
first created. Instead, I first initialize the frequency to a reasonable de=
fault (1GHz) and then let the CLINT override the value if one is attached. =
Phrased differently, the values produced by the `sifive_clint.c: cpu_riscv_=
read_rtc()` and `csr.c: read_time()` must match, and this is one way of doi=
ng that.<br>
&gt;<br>
&gt; Ah that seems fine. Can you add a comment in the code to indicate that=
<br>
&gt; it will be overwritten later?<br>
<br>
I don&#39;t see a v2, did I miss something?<br>
<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d be open to other suggestions.<br>
&gt;&gt;<br>
&gt;&gt; Jonathan<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Apr 15, 2019 at 8:23 PM Alistair Francis &lt;<a href=3D"ma=
ilto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Apr 12, 2019 at 12:04 PM Jonathan Behrens &lt;<a href=
=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Currently mcounteren.TM acts as though it is hardwired to=
 zero, even though<br>
&gt;&gt;&gt; &gt; QEMU<br>
&gt;&gt;&gt; &gt; allows it to be set. This change resolves the issue by al=
lowing reads to the<br>
&gt;&gt;&gt; &gt; time and timeh control registers when running in a privil=
eged mode where<br>
&gt;&gt;&gt; &gt; such<br>
&gt;&gt;&gt; &gt; accesses are allowed.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fin=
telia@gmail.com" target=3D"_blank">fintelia@gmail.com</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/sifive_clint.c |=C2=A0 1 +<br>
&gt;&gt;&gt; &gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 | 14 +++++++=
+++++++<br>
&gt;&gt;&gt; &gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++=
<br>
&gt;&gt;&gt; &gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 17 +++++++=
++++------<br>
&gt;&gt;&gt; &gt;=C2=A0 4 files changed, 28 insertions(+), 6 deletions(-)<b=
r>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_cl=
int.c<br>
&gt;&gt;&gt; &gt; index d4c159e937..3ad4fe6139 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/sifive_clint.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/sifive_clint.c<br>
&gt;&gt;&gt; &gt; @@ -237,6 +237,7 @@ DeviceState *sifive_clint_create(hwad=
dr addr, hwaddr<br>
&gt;&gt;&gt; &gt; size, uint32_t num_harts,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timer =3D timer=
_new_ns(QEMU_CLOCK_VIRTUAL,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;=
sifive_clint_timer_cb, cpu);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timecmp =3D 0;<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;time_freq =3D SIFIVE=
_CLINT_TIMEBASE_FREQ;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Why do you need to set this here?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alistair<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL=
, TYPE_SIFIVE_CLINT);<br>
&gt;&gt;&gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt;&gt; &gt; index d61bce6d55..ff17d54691 100644<br>
&gt;&gt;&gt; &gt; --- a/target/riscv/cpu.c<br>
&gt;&gt;&gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt;&gt; &gt; @@ -103,12 +103,20 @@ static void set_resetvec(CPURISCVSt=
ate *env, int<br>
&gt;&gt;&gt; &gt; resetvec)<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; +static void set_time_freq(CPURISCVState *env, uint64_t f=
req)<br>
&gt;&gt;&gt; &gt; +{<br>
&gt;&gt;&gt; &gt; +#ifndef CONFIG_USER_ONLY<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 env-&gt;time_freq =3D freq;<br>
&gt;&gt;&gt; &gt; +#endif<br>
&gt;&gt;&gt; &gt; +}<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 static void riscv_any_cpu_init(Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU=
(obj)-&gt;env;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, RVXLEN | RVI | RVM | RV=
A | RVF | RVD | RVC | RVU);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0=
, PRIV_VERSION_1_10_0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;&gt;&gt; &gt; @@ -121,6 +129,7 @@ static void rv32gcsu_priv1_09_1_cpu_i=
nit(Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 static void rv32gcsu_priv1_10_0_cpu_init(Object *ob=
j)<br>
&gt;&gt;&gt; &gt; @@ -131,6 +140,7 @@ static void rv32gcsu_priv1_10_0_cpu_i=
nit(Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 static void rv32imacu_nommu_cpu_init(Object *obj)<b=
r>
&gt;&gt;&gt; &gt; @@ -140,6 +150,7 @@ static void rv32imacu_nommu_cpu_init(=
Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0=
, PRIV_VERSION_1_10_0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #elif defined(TARGET_RISCV64)<br>
&gt;&gt;&gt; &gt; @@ -152,6 +163,7 @@ static void rv64gcsu_priv1_09_1_cpu_i=
nit(Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 static void rv64gcsu_priv1_10_0_cpu_init(Object *ob=
j)<br>
&gt;&gt;&gt; &gt; @@ -162,6 +174,7 @@ static void rv64gcsu_priv1_10_0_cpu_i=
nit(Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_MMU);<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 static void rv64imacu_nommu_cpu_init(Object *obj)<b=
r>
&gt;&gt;&gt; &gt; @@ -171,6 +184,7 @@ static void rv64imacu_nommu_cpu_init(=
Object *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_versions(env, USER_VERSION_2_02_0=
, PRIV_VERSION_1_10_0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, DEFAULT_RSTVEC);<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_PMP);<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 set_time_freq(env, NANOSECONDS_PER_SECOND)=
;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; index 20bce8742e..67b1769ad3 100644<br>
&gt;&gt;&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; @@ -173,7 +173,9 @@ struct CPURISCVState {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* temporary htif regs */<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mfromhost;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mtohost;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t timecmp;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 uint64_t time_freq;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* physical memory protection */<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 pmp_table_t pmp_state;<br>
&gt;&gt;&gt; &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; index e1d91b6c60..6083c782a1 100644<br>
&gt;&gt;&gt; &gt; --- a/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; +++ b/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVSt=
ate *env, int<br>
&gt;&gt;&gt; &gt; csrno, target_ulong *val)<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif /* TARGET_RISCV32 */<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;=C2=A0 static int read_time(CPURISCVState *env, int csrno,=
 target_ulong *val)<br>
&gt;&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt;&gt; &gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D muldiv64(qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL),<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 env-&gt;time_freq, NANOSECONDS_PER_SECOND);<br>
&gt;&gt;&gt; &gt; +#else<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
&gt;&gt;&gt; &gt; +#endif<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;&gt;&gt; &gt;=C2=A0 static int read_timeh(CPURISCVState *env, int csrno=
, target_ulong *val)<br>
&gt;&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt;&gt; &gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 *val =3D muldiv64(qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL),<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 env-&gt;time_freq, NANOSECONDS_PER_SECOND) &gt;&gt; 32;<br>
&gt;&gt;&gt; &gt; +#else<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt=
; 32;<br>
&gt;&gt;&gt; &gt; +#endif<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -#else /* CONFIG_USER_ONLY */<br>
&gt;&gt;&gt; &gt; +#if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 /* Machine constants */<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -854,14 +863,10 @@ static riscv_csr_operations csr_ops=
[CSR_TABLE_SIZE] =3D<br>
&gt;&gt;&gt; &gt; {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_INSTRETH] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 { ctr,<br>
&gt;&gt;&gt; &gt; read_instreth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 /* User-level time CSRs are only available=
 in linux-user<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0* In privileged mode, the monitor em=
ulates these CSRs */<br>
&gt;&gt;&gt; &gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIME] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { ctr,<br>
&gt;&gt;&gt; &gt; read_time=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt; &gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIMEH] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ ctr,<br>
&gt;&gt;&gt; &gt; read_timeh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt; -#endif<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Timers and Counters */<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; 2.20.1<br>
</blockquote></div>

--000000000000a0f0600587647c65--

