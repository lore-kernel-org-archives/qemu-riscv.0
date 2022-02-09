Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHcr9-0005Xc-0B
	for mharc-qemu-riscv@gnu.org; Tue, 08 Feb 2022 21:37:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nHcr7-0005X5-9e
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 21:37:17 -0500
Received: from [2a00:1450:4864:20::631] (port=36413
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nHcr3-000517-DZ
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 21:37:16 -0500
Received: by mail-ej1-x631.google.com with SMTP id yw18so2245925ejb.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Feb 2022 18:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhcDS0gBdjA25m0+Dvc9g8impCRMrRJAyFx4AjBzNFM=;
 b=niESOYWimIC0VROc90rnKjrpIWJ0W/VMnSKeWoA6P5eO8YiP3FcYwO3RhyvhUy6PAR
 MFDBh6ZU0AAWXbidGCjIPHMttSnSgw5ls/C8GiyrAbbyNzP+mpi6VXRTiJxwO/4bVsld
 SqyrKAShUW+n3Mwmy6ae0rZwaCjqccZBUz4gIySjVrK/c7leDa5SFZBZgC1wjkci5RjS
 MU9VxExd+u4blDljviAXf+VFEX7f4b+dz9m8Oh7KkrIHjOgiOh3HrfWHYmkJjbhI7cYt
 dwrfJhfUGjI04jCixyMmndrMzeALgOh1uMQ5kFewpXYu5EbZisLnn19bnIozbXVreTXH
 zVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhcDS0gBdjA25m0+Dvc9g8impCRMrRJAyFx4AjBzNFM=;
 b=7IZ9rJG9EjBYIC34fKkL35grWDcoxYIEZQbTBxCb48PuSchXg14Z40L2APtGtZhwLA
 dAVt9BfxYw24dEE/QIkscQHX7O3l+slDFwLCbSyg1LWT3pgm8OySwz9BUNF47ovi06d6
 wFeG6LhdVwN/V0f2rJszHstwlPjcT2redNPgnjEan5ibkoCBfgHVcHziwWJ2V80VMuFi
 NVA/XJ4pvvqaO0VR3rYyqAYU30pcuqitw5snRoUZbEYjvRgOHXS19wPCLWSHftHQZYBl
 q4+kITP2GgY0s9Xvw7D6liycS3S4qC0QgKgEsrn9Y3UqNsx1725Vl3a1QR34JbdFZJnk
 Njtw==
X-Gm-Message-State: AOAM5300L1qKiuPJ9GvK0K93XsQDPDyNg8/S0pVWmrpA3TbpTJa0KouK
 PWLDu5WgIb0W+X9m5vB/H3DhBvvDL2nfOeHPce+SUA==
X-Google-Smtp-Source: ABdhPJx/WbW7TPe8T9br3Yq2DDpHhU9iexr6e5Ju+cRFTQSgvqnsDctCPBBSyg+FcInoMOnUpauIteeld36weZlVnlw=
X-Received: by 2002:a17:906:2ccc:: with SMTP id
 r12mr68880ejr.549.1644374225506; 
 Tue, 08 Feb 2022 18:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20220126095448.2964-1-frank.chang@sifive.com>
 <CAKmqyKO9oQRW+-D4BUDJHGJDezjL78BjWQHohb1osRkMaV0scg@mail.gmail.com>
In-Reply-To: <CAKmqyKO9oQRW+-D4BUDJHGJDezjL78BjWQHohb1osRkMaV0scg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 9 Feb 2022 10:36:54 +0800
Message-ID: <CAE_xrPikqNFLH5zkcAMBTgzo75A-MwA4eGPquNKzEVD+u6-VNg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="00000000000096ee4b05d78cb56a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Feb 2022 02:37:17 -0000

--00000000000096ee4b05d78cb56a
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 10:34 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Jan 26, 2022 at 7:55 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > RISC-V privilege spec defines that mtime is exposed as a memory-mapped
> > machine-mode read-write register. However, as QEMU uses host monotonic
> > timer as timer source, this makes mtime to be read-only in RISC-V
> > ACLINT.
> >
> > This patch makes mtime to be writable by recording the time delta value
> > between the mtime value to be written and the timer value at the time
> > mtime is written. Time delta value is then added back whenever the timer
> > value is retrieved.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  hw/intc/riscv_aclint.c         | 58 ++++++++++++++++++++++------------
> >  include/hw/intc/riscv_aclint.h |  1 +
> >  target/riscv/cpu.h             |  8 ++---
> >  target/riscv/cpu_helper.c      |  4 +--
> >  4 files changed, 44 insertions(+), 27 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > index f1a5d3d284..ffbe211a3d 100644
> > --- a/hw/intc/riscv_aclint.c
> > +++ b/hw/intc/riscv_aclint.c
> > @@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
> >      int num;
> >  } riscv_aclint_mtimer_callback;
> >
> > -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > +static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
> >  {
> >      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >          timebase_freq, NANOSECONDS_PER_SECOND);
> >  }
> >
> > +static uint64_t cpu_riscv_read_rtc(void *opaque)
> > +{
> > +    RISCVAclintMTimerState *mtimer = opaque;
> > +    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) +
> mtimer->time_delta;
> > +}
> > +
> >  /*
> >   * Called when timecmp is written to update the QEMU timer or
> immediately
> >   * trigger timer interrupt if mtimecmp <= current timer value.
> > @@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t
> timebase_freq)
> >  static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState
> *mtimer,
> >                                                RISCVCPU *cpu,
> >                                                int hartid,
> > -                                              uint64_t value,
> > -                                              uint32_t timebase_freq)
> > +                                              uint64_t value)
> >  {
> > +    uint32_t timebase_freq = mtimer->timebase_freq;
> >      uint64_t next;
> >      uint64_t diff;
> >
> > -    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> > +    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
> >
> >      cpu->env.timecmp = value;
> >      if (cpu->env.timecmp <= rtc_r) {
> > @@ -140,10 +146,10 @@ static uint64_t riscv_aclint_mtimer_read(void
> *opaque, hwaddr addr,
> >          }
> >      } else if (addr == mtimer->time_base) {
> >          /* time_lo */
> > -        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
> > +        return cpu_riscv_read_rtc(mtimer) & 0xFFFFFFFF;
> >      } else if (addr == mtimer->time_base + 4) {
> >          /* time_hi */
> > -        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) &
> 0xFFFFFFFF;
> > +        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
> >      }
> >
> >      qemu_log_mask(LOG_UNIMP,
> > @@ -156,6 +162,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
> >      uint64_t value, unsigned size)
> >  {
> >      RISCVAclintMTimerState *mtimer = opaque;
> > +    int i;
> >
> >      if (addr >= mtimer->timecmp_base &&
> >          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
> > @@ -170,31 +177,40 @@ static void riscv_aclint_mtimer_write(void
> *opaque, hwaddr addr,
> >              /* timecmp_lo */
> >              uint64_t timecmp_hi = env->timecmp >> 32;
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> hartid,
> > -                timecmp_hi << 32 | (value & 0xFFFFFFFF),
> > -                mtimer->timebase_freq);
> > +                timecmp_hi << 32 | (value & 0xFFFFFFFF));
> >              return;
> >          } else if ((addr & 0x7) == 4) {
> >              /* timecmp_hi */
> >              uint64_t timecmp_lo = env->timecmp;
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> hartid,
> > -                value << 32 | (timecmp_lo & 0xFFFFFFFF),
> > -                mtimer->timebase_freq);
> > +                value << 32 | (timecmp_lo & 0xFFFFFFFF));
> >          } else {
> >              qemu_log_mask(LOG_UNIMP,
> >                            "aclint-mtimer: invalid timecmp write: %08x",
> >                            (uint32_t)addr);
> >          }
> >          return;
> > -    } else if (addr == mtimer->time_base) {
> > -        /* time_lo */
> > -        qemu_log_mask(LOG_UNIMP,
> > -                      "aclint-mtimer: time_lo write not implemented");
> > -        return;
> > -    } else if (addr == mtimer->time_base + 4) {
> > -        /* time_hi */
> > -        qemu_log_mask(LOG_UNIMP,
> > -                      "aclint-mtimer: time_hi write not implemented");
> > -        return;
> > +    } else if (addr == mtimer->time_base || addr == mtimer->time_base +
> 4) {
> > +        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
> > +
> > +        if (addr == mtimer->time_base) {
> > +            /* time_lo */
> > +            mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) -
> rtc_r;
> > +        } else {
> > +            /* time_hi */
> > +            mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) -
> rtc_r;
> > +        }
>
> We should be checking the size here, for RV64 a 64-bit memory access
> to mtime or mtimecmp can occur.
>
> Alistair
>

From Privilege v1.12 spec:

In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part of
the register.
For RV64, naturally aligned 64-bit memory accesses to the mtime and
mtimecmp registers are
additionally supported and are atomic.

It seems that both mtimecmp and mtime should check the sizes of 4 and 8-bit
memory accesses.
I will refine that in my next patch.

Regards,
Frank Chang


>
> > +
> > +        /* Check if timer interrupt is triggered for each hart. */
> > +        for (i = 0; i < mtimer->num_harts; i++) {
> > +            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
> > +            CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +            if (!env) {
> > +                continue;
> > +            }
> > +            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> > +                                              i, env->timecmp);
> > +        }
> >      }
> >
> >      qemu_log_mask(LOG_UNIMP,
> > @@ -299,7 +315,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr,
> hwaddr size,
> >              continue;
> >          }
> >          if (provide_rdtime) {
> > -            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc,
> timebase_freq);
> > +            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
> >          }
> >
> >          cb->s = RISCV_ACLINT_MTIMER(dev);
> > diff --git a/include/hw/intc/riscv_aclint.h
> b/include/hw/intc/riscv_aclint.h
> > index 229bd08d25..26d4048687 100644
> > --- a/include/hw/intc/riscv_aclint.h
> > +++ b/include/hw/intc/riscv_aclint.h
> > @@ -31,6 +31,7 @@
> >  typedef struct RISCVAclintMTimerState {
> >      /*< private >*/
> >      SysBusDevice parent_obj;
> > +    uint64_t time_delta;
> >
> >      /*< public >*/
> >      MemoryRegion mmio;
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 55635d68d5..46cac9df76 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -249,8 +249,8 @@ struct CPURISCVState {
> >      target_ulong mseccfg;
> >
> >      /* machine specific rdtime callback */
> > -    uint64_t (*rdtime_fn)(uint32_t);
> > -    uint32_t rdtime_fn_arg;
> > +    uint64_t (*rdtime_fn)(void *);
> > +    void *rdtime_fn_arg;
> >
> >      /* True if in debugger mode.  */
> >      bool debugger;
> > @@ -413,8 +413,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState
> *env);
> >  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
> >  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t
> value);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip
> value */
> > -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t
> (*fn)(uint32_t),
> > -                             uint32_t arg);
> > +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> > +                             void *arg);
> >  #endif
> >  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 327a2c4f1d..73bf1bafa7 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -345,8 +345,8 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu,
> uint32_t mask, uint32_t value)
> >      return old;
> >  }
> >
> > -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t
> (*fn)(uint32_t),
> > -                             uint32_t arg)
> > +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> > +                             void *arg)
> >  {
> >      env->rdtime_fn = fn;
> >      env->rdtime_fn_arg = arg;
> > --
> > 2.31.1
> >
> >
>

--00000000000096ee4b05d78cb56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 1, 2022 at 10:34 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Jan 26, 2022 at 7:55 PM &lt;<a href=3D"mail=
to:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; RISC-V privilege spec defines that mtime is exposed as a memory-mapped=
<br>
&gt; machine-mode read-write register. However, as QEMU uses host monotonic=
<br>
&gt; timer as timer source, this makes mtime to be read-only in RISC-V<br>
&gt; ACLINT.<br>
&gt;<br>
&gt; This patch makes mtime to be writable by recording the time delta valu=
e<br>
&gt; between the mtime value to be written and the timer value at the time<=
br>
&gt; mtime is written. Time delta value is then added back whenever the tim=
er<br>
&gt; value is retrieved.<br>
&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/riscv_aclint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 58 +++=
+++++++++++++++++++------------<br>
&gt;=C2=A0 include/hw/intc/riscv_aclint.h |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 ++---<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
&gt;=C2=A0 4 files changed, 44 insertions(+), 27 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
&gt; index f1a5d3d284..ffbe211a3d 100644<br>
&gt; --- a/hw/intc/riscv_aclint.c<br>
&gt; +++ b/hw/intc/riscv_aclint.c<br>
&gt; @@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int num;<br>
&gt;=C2=A0 } riscv_aclint_mtimer_callback;<br>
&gt;<br>
&gt; -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)<br>
&gt; +static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timebase_freq, NANOSECONDS_PER_SECON=
D);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static uint64_t cpu_riscv_read_rtc(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVAclintMTimerState *mtimer =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 return cpu_riscv_read_rtc_raw(mtimer-&gt;timebase_freq)=
 + mtimer-&gt;time_delta;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Called when timecmp is written to update the QEMU timer =
or immediately<br>
&gt;=C2=A0 =C2=A0* trigger timer interrupt if mtimecmp &lt;=3D current time=
r value.<br>
&gt; @@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timeba=
se_freq)<br>
&gt;=C2=A0 static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerS=
tate *mtimer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t value,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t timebase_freq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t value)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 uint32_t timebase_freq =3D mtimer-&gt;timebase_freq;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t next;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t diff;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(timebase_freq);<b=
r>
&gt; +=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.timecmp =3D value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.timecmp &lt;=3D rtc_r) {<br>
&gt; @@ -140,10 +146,10 @@ static uint64_t riscv_aclint_mtimer_read(void *o=
paque, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_riscv_read_rtc(mtimer-&gt;time=
base_freq) &amp; 0xFFFFFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_riscv_read_rtc(mtimer) &amp; 0=
xFFFFFFFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base + 4) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_riscv_read_rtc(mtimer-&gt;tim=
ebase_freq) &gt;&gt; 32) &amp; 0xFFFFFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_riscv_read_rtc(mtimer) &gt;&g=
t; 32) &amp; 0xFFFFFFFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; @@ -156,6 +162,7 @@ static void riscv_aclint_mtimer_write(void *opaque=
, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVAclintMTimerState *mtimer =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (addr &gt;=3D mtimer-&gt;timecmp_base &amp;&amp=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr &lt; (mtimer-&gt;timecmp_base +=
 (mtimer-&gt;num_harts &lt;&lt; 3))) {<br>
&gt; @@ -170,31 +177,40 @@ static void riscv_aclint_mtimer_write(void *opaq=
ue, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timecmp_lo */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp_hi =
=3D env-&gt;timecmp &gt;&gt; 32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aclint_mtimer_wr=
ite_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timecmp_hi &l=
t;&lt; 32 | (value &amp; 0xFFFFFFFF),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;ti=
mebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timecmp_hi &l=
t;&lt; 32 | (value &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 4=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timecmp_hi */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp_lo =
=3D env-&gt;timecmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aclint_mtimer_wr=
ite_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &lt;&lt=
; 32 | (timecmp_lo &amp; 0xFFFFFFFF),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;ti=
mebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &lt;&lt=
; 32 | (timecmp_lo &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIM=
P,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;aclint-mtimer: invalid timecmp write: %08=
x&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint32_t)addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -=C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;aclint-mtimer: time_lo write not implemented&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -=C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base + 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;aclint-mtimer: time_hi write not implemented&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base || addr =3D=
=3D mtimer-&gt;time_base + 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc_raw=
(mtimer-&gt;timebase_freq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr =3D=3D mtimer-&gt;time_base) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_delta =3D (=
(rtc_r &amp; ~0xFFFFFFFFULL) | value) - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;time_delta =3D (=
value &lt;&lt; 32 | (rtc_r &amp; 0xFFFFFFFF)) - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
We should be checking the size here, for RV64 a 64-bit memory access<br>
to mtime or mtimecmp can occur.<br>
<br>
Alistair<br></blockquote><div><br></div><div>From Privilege v1.12 spec:</di=
v><div><br></div><div>In RV32, memory-mapped writes to mtimecmp modify only=
 one 32-bit part of the register.<br>For RV64, naturally aligned 64-bit mem=
ory accesses to the mtime and mtimecmp registers are<br>additionally suppor=
ted and are atomic.<br></div><div><br></div><div>It seems that both mtimecm=
p and mtime should check the sizes of 4 and 8-bit memory accesses.</div><di=
v>I will refine that in my next patch.<br></div><div><br></div><div>Regards=
,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if timer interrupt is triggered =
for each hart. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; mtimer-&gt;num_harts=
; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_=
cpu(mtimer-&gt;hartid_base + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu =
? cpu-&gt;env_ptr : NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!env) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aclint_mtimer_write_t=
imecmp(mtimer, RISCV_CPU(cpu),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 i, env-&gt;timecmp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; @@ -299,7 +315,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr add=
r, hwaddr size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (provide_rdtime) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_rdtime_fn(env=
, cpu_riscv_read_rtc, timebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_rdtime_fn(env=
, cpu_riscv_read_rtc, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cb-&gt;s =3D RISCV_ACLINT_MTIMER(dev=
);<br>
&gt; diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_ac=
lint.h<br>
&gt; index 229bd08d25..26d4048687 100644<br>
&gt; --- a/include/hw/intc/riscv_aclint.h<br>
&gt; +++ b/include/hw/intc/riscv_aclint.h<br>
&gt; @@ -31,6 +31,7 @@<br>
&gt;=C2=A0 typedef struct RISCVAclintMTimerState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +=C2=A0 =C2=A0 uint64_t time_delta;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 55635d68d5..46cac9df76 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -249,8 +249,8 @@ struct CPURISCVState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mseccfg;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* machine specific rdtime callback */<br>
&gt; -=C2=A0 =C2=A0 uint64_t (*rdtime_fn)(uint32_t);<br>
&gt; -=C2=A0 =C2=A0 uint32_t rdtime_fn_arg;<br>
&gt; +=C2=A0 =C2=A0 uint64_t (*rdtime_fn)(void *);<br>
&gt; +=C2=A0 =C2=A0 void *rdtime_fn_arg;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* True if in debugger mode.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool debugger;<br>
&gt; @@ -413,8 +413,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState =
*env);<br>
&gt;=C2=A0 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupt=
s);<br>
&gt;=C2=A0 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint=
32_t value);<br>
&gt;=C2=A0 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_=
mip value */<br>
&gt; -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint3=
2_t),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t arg);<br>
&gt; +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void =
*),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *arg);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv=
);<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 327a2c4f1d..73bf1bafa7 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -345,8 +345,8 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint3=
2_t mask, uint32_t value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return old;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint3=
2_t),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t arg)<br>
&gt; +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void =
*),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *arg)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;rdtime_fn =3D fn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;rdtime_fn_arg =3D arg;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000096ee4b05d78cb56a--

