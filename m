Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh59n-00081I-L1
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh59l-0007vt-GF
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 03:53:45 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh59i-0007MA-CI
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 03:53:44 -0400
Received: by mail-ed1-x532.google.com with SMTP id b24so1167319edu.10
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4HFnli/JzkEvfYGogWMd39LsbtpgKBiIybEj140pYQ=;
 b=el3LcRGruM+xxmafiprasrkBHuv070yGhoJvHhdIrP/CI5ayZazK+tcowf7xUxvSFS
 ctWiLpVpM1rv8ZImFzzfzbhgDqr/JCziV5eLh2jzURFL77LxGpeWUt3KKJpXdXFWDCgW
 A0zKHg0piGLqCH2GaYfpur8v7oLa3gNlk4W09vuerfT2epm1uAmDmCQkq1+6LVASUO69
 xr2gqGflHDO8TL9HfFuYhRI/o96ayTIojvH/f6wZccw5HiLouwdFHpmO1oGFyv56zcfG
 I31S8KyPriUj9PK8sCtLoPXYEfCR55+F8VByJXQE9Y0FcNA3rUE9+clTczGOfDlt223r
 gvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4HFnli/JzkEvfYGogWMd39LsbtpgKBiIybEj140pYQ=;
 b=r+y4UyrQFThUkIAp6LymtxNBYmzxnWf5L+OmcieMj2bbDOo9l94TZFPKMZ6QT8mb/V
 GWVLsvT8AEulv8bRZqn/ESAYYSXG09V7isQaV7Rb3WEBG5KK305iUD9pCb+lvlZ00H+y
 jhNc7pxbr0tx5/l4DgcT/R0x+Wd+R67mtucJUait1yI1Ni0Dsl7EFIuPadslPFlwIPSM
 PLxrSEGOg8Bu3d9Z/AHnIZHiC4HFGaOiTHprblC+BRpGQvIOkLf30Xg4Fy8hf7y22/QW
 ORGKRVdOEwedjQJaAYCMTwXL7P4cHkpFRazKMq6dxbjpMwC/GlrJFZ1hz5iAW2I+QHsH
 7dvg==
X-Gm-Message-State: AOAM530m0mP8TbwouQhvXZobAnYvL+ta4+bOM7DPCR8bsXMzLXz1rgpi
 wzMduwcrhHdCwlBVmb1iD45tIjLOj7YgiRO0P2cdDg==
X-Google-Smtp-Source: ABdhPJyMh8a12ux9aZLyRiVUCqjmqQpZizcq2CtYHm+OunGNjVAi6Mlogq9A10xVAfZpgF26uUtvo5URoszkwAeZ5/s=
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id
 u19-20020aa7d553000000b004164dfc126dmr21464227edr.213.1650441220580; Wed, 20
 Apr 2022 00:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220419090848.9018-1-frank.chang@sifive.com>
 <20220419090848.9018-4-frank.chang@sifive.com>
 <CAKmqyKPHrna2n3ewcx+7Pc00xFP9DkCG7c4YCbfX+s=-x2y1YQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPHrna2n3ewcx+7Pc00xFP9DkCG7c4YCbfX+s=-x2y1YQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 20 Apr 2022 15:53:29 +0800
Message-ID: <CAE_xrPgJ0zZBDViom3qCPJUn1Vyd-ok33voxpszrB+VMGpPr9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000ad018505dd114ac8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 07:53:45 -0000

--000000000000ad018505dd114ac8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 3:42 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Apr 19, 2022 at 7:10 PM <frank.chang@sifive.com> wrote:
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
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/intc/riscv_aclint.c         | 71 ++++++++++++++++++++++++----------
> >  include/hw/intc/riscv_aclint.h |  1 +
> >  target/riscv/cpu.h             |  8 ++--
> >  target/riscv/cpu_helper.c      |  4 +-
> >  4 files changed, 57 insertions(+), 27 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > index ad3c49706f..ad7ccf96cd 100644
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
> > @@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void
> *opaque, hwaddr addr,
> >          }
> >      } else if (addr == mtimer->time_base) {
> >          /* time_lo for RV32/RV64 or timecmp for RV64 */
> > -        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
> > +        uint64_t rtc = cpu_riscv_read_rtc(mtimer);
> >          return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
> >      } else if (addr == mtimer->time_base + 4) {
> >          /* time_hi */
> > -        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) &
> 0xFFFFFFFF;
> > +        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
> >      }
> >
> >      qemu_log_mask(LOG_UNIMP,
> > @@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
> >      uint64_t value, unsigned size)
> >  {
> >      RISCVAclintMTimerState *mtimer = opaque;
> > +    int i;
> >
> >      if (addr >= mtimer->timecmp_base &&
> >          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
> > @@ -172,20 +179,18 @@ static void riscv_aclint_mtimer_write(void
> *opaque, hwaddr addr,
> >                  /* timecmp_lo for RV32/RV64 */
> >                  uint64_t timecmp_hi = env->timecmp >> 32;
> >                  riscv_aclint_mtimer_write_timecmp(mtimer,
> RISCV_CPU(cpu), hartid,
> > -                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
> > -                    mtimer->timebase_freq);
> > +                    timecmp_hi << 32 | (value & 0xFFFFFFFF));
> >              } else {
> >                  /* timecmp for RV64 */
> >                  riscv_aclint_mtimer_write_timecmp(mtimer,
> RISCV_CPU(cpu), hartid,
> > -                                                  value,
> mtimer->timebase_freq);
> > +                                                  value);
> >              }
> >          } else if ((addr & 0x7) == 4) {
> >              if (size == 4) {
> >                  /* timecmp_hi for RV32/RV64 */
> >                  uint64_t timecmp_lo = env->timecmp;
> >                  riscv_aclint_mtimer_write_timecmp(mtimer,
> RISCV_CPU(cpu), hartid,
> > -                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
> > -                    mtimer->timebase_freq);
> > +                    value << 32 | (timecmp_lo & 0xFFFFFFFF));
> >              } else {
> >                  qemu_log_mask(LOG_UNIMP,
> >                                "aclint-mtimer: invalid timecmp_hi write:
> %08x",
> > @@ -197,15 +202,39 @@ static void riscv_aclint_mtimer_write(void
> *opaque, hwaddr addr,
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
> > +    } else if (addr == mtimer->time_base || addr == mtimer->time_base +
> 4) {
> > +        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
> > +
> > +        if (addr == mtimer->time_base) {
> > +            if (size == 4) {
> > +                /* time_lo for RV32/RV64 */
> > +                mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value)
> - rtc_r;
> > +            } else {
> > +                /* time for RV64 */
> > +                mtimer->time_delta = value - rtc_r;
> > +            }
> > +        } else {
> > +            if (size == 4) {
> > +                /* time_hi for RV32/RV64 */
> > +                mtimer->time_delta = (value << 32 | (rtc_r &
> 0xFFFFFFFF)) - rtc_r;
> > +            } else {
> > +                qemu_log_mask(LOG_UNIMP,
>
> This should be a guest error instead
>

Thanks, I'll fix this in the next version patchset.

Regards,
Frank Chang


>
> Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > +                              "aclint-mtimer: invalid time_hi write:
> %08x",
> > +                              (uint32_t)addr);
> > +                return;
> > +            }
> > +        }
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
> >          return;
> >      }
> >
> > @@ -315,7 +344,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr,
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
> > index 249fce4c3b..0cb7c2a05a 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -286,8 +286,8 @@ struct CPUArchState {
> >      type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
> >
> >      /* machine specific rdtime callback */
> > -    uint64_t (*rdtime_fn)(uint32_t);
> > -    uint32_t rdtime_fn_arg;
> > +    uint64_t (*rdtime_fn)(void *);
> > +    void *rdtime_fn_arg;
> >
> >      /* machine specific AIA ireg read-modify-write callback */
> >  #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> > @@ -505,8 +505,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState
> *env);
> >  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> >  uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
> value);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip
> value */
> > -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t
> (*fn)(uint32_t),
> > -                             uint32_t arg);
> > +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> > +                             void *arg);
> >  void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> >                                     int (*rmw_fn)(void *arg,
> >                                                   target_ulong reg,
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index b5bbe6fc39..51a3d96a66 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -632,8 +632,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
> uint64_t mask, uint64_t value)
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
> > 2.35.1
> >
> >
>

--000000000000ad018505dd114ac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Apr 20, 2022 at 3:42 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Apr 19, 2022 at 7:10 PM &lt;<a href=3D"mail=
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
&gt; Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" target=
=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/riscv_aclint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 71 +++=
+++++++++++++++++++++----------<br>
&gt;=C2=A0 include/hw/intc/riscv_aclint.h |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 ++--<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 4 files changed, 57 insertions(+), 27 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
&gt; index ad3c49706f..ad7ccf96cd 100644<br>
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
&gt; @@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void *o=
paque, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo for RV32/RV64 or timecmp =
for RV64 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rtc =3D cpu_riscv_read_rtc(mtime=
r-&gt;timebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rtc =3D cpu_riscv_read_rtc(mtime=
r);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (size =3D=3D 4) ? (rtc &amp; =
0xFFFFFFFF) : rtc;<br>
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
&gt; @@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque=
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
&gt; @@ -172,20 +179,18 @@ static void riscv_aclint_mtimer_write(void *opaq=
ue, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timec=
mp_lo for RV32/RV64 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t=
 timecmp_hi =3D env-&gt;timecmp &gt;&gt; 32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_ac=
lint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 timecmp_hi &lt;&lt; 32 | (value &amp; 0xFFFFFFFF),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mtimer-&gt;timebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 timecmp_hi &lt;&lt; 32 | (value &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timec=
mp for RV64 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_ac=
lint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value, mtimer-&gt;timebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 4=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 4) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timec=
mp_hi for RV32/RV64 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t=
 timecmp_lo =3D env-&gt;timecmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_ac=
lint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 value &lt;&lt; 32 | (timecmp_lo &amp; 0xFFFFFFFF),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mtimer-&gt;timebase_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 value &lt;&lt; 32 | (timecmp_lo &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log=
_mask(LOG_UNIMP,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;aclint-mtimer: invalid time=
cmp_hi write: %08x&quot;,<br>
&gt; @@ -197,15 +202,39 @@ static void riscv_aclint_mtimer_write(void *opaq=
ue, hwaddr addr,<br>
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
&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D mtimer-&gt;time_base || addr =3D=
=3D mtimer-&gt;time_base + 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc_raw=
(mtimer-&gt;timebase_freq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr =3D=3D mtimer-&gt;time_base) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo fo=
r RV32/RV64 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;ti=
me_delta =3D ((rtc_r &amp; ~0xFFFFFFFFULL) | value) - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time for R=
V64 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;ti=
me_delta =3D value - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi fo=
r RV32/RV64 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;ti=
me_delta =3D (value &lt;&lt; 32 | (rtc_r &amp; 0xFFFFFFFF)) - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask=
(LOG_UNIMP,<br>
<br>
This should be a guest error instead<br></blockquote><div><br></div><div>Th=
anks, I&#39;ll fix this in the next version patchset.</div><div><br></div><=
div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Otherwise:<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;aclint-mtimer: invalid time_hi wr=
ite: %08x&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint32_t)addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; @@ -315,7 +344,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr add=
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
&gt; index 249fce4c3b..0cb7c2a05a 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -286,8 +286,8 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* machine specific rdtime callback */<br>
&gt; -=C2=A0 =C2=A0 uint64_t (*rdtime_fn)(uint32_t);<br>
&gt; -=C2=A0 =C2=A0 uint32_t rdtime_fn_arg;<br>
&gt; +=C2=A0 =C2=A0 uint64_t (*rdtime_fn)(void *);<br>
&gt; +=C2=A0 =C2=A0 void *rdtime_fn_arg;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* machine specific AIA ireg read-modify-write cal=
lback */<br>
&gt;=C2=A0 #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \=
<br>
&gt; @@ -505,8 +505,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState =
*env);<br>
&gt;=C2=A0 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupt=
s);<br>
&gt;=C2=A0 uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint=
64_t value);<br>
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
&gt;=C2=A0 void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t =
priv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*rmw_fn)=
(void *arg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong reg,<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index b5bbe6fc39..51a3d96a66 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -632,8 +632,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint6=
4_t mask, uint64_t value)<br>
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
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000ad018505dd114ac8--

