Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfryh-0000Oy-D4
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 16:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59833)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hfryW-0000FO-Fh
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 16:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hfryO-0004t8-NK
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 16:23:30 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42464)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hfryC-0004XO-DE; Tue, 25 Jun 2019 16:23:14 -0400
Received: by mail-lj1-x241.google.com with SMTP id t28so17554680lje.9;
 Tue, 25 Jun 2019 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EyCBVZeBSQ4mEfMXT1jWebrr3CpVMJMCyLnfHeTEYE=;
 b=dfwfwWiahwlVkvQg8qSPVSC57RmHqsGY0Yg+gfMPwtnVEDifp6qxKzf3194LgKFvbT
 BdyqUnkrSXA8/VLKCSVMo/fQQ1jpv/8oO53kf0wHodzCq0QvWikvBYoD3uDgTMQV3Bbe
 AeShj3tD5WkHlY266L1pK8b4oTyf2hAi2snCSu8z00e5eXQnpcF14fHuuWeHKPuSEV77
 3v+9VNu8PRrRllNyHLdGRxaa7oCgZs+3P+my5c2jC0G4HZ0yBwLRHYzA84D+mSlBNajm
 fQDQyVdfa4tJM8sxHayBz8zjIZcH2kibPTL5/GJY07LxmWHwKHU53LhSN9OgilEaXzV9
 KimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EyCBVZeBSQ4mEfMXT1jWebrr3CpVMJMCyLnfHeTEYE=;
 b=TdXSZgv+aR7MTYA9Gy5nGSh5/IyarDZ1DUnfaIDYy1Q2aRPNgTHmswaq1ZruOQ717I
 EGSGOwz4Nom8sIejnqtzcTkcdKMbogEMOI98CpFsgApr3jN/l7fdfalErXvej0ILdD3+
 GJogFjtgkRSJ6xk00zx6ZVy9//jMz4UqAblI5bc1drxROpju7H0EiHG7DjS2qThW3hqD
 jWj427MKUFOxBj1hIh8aesG8NHfc6AisGESU00n1cOIi+phkRAO1QM5qWO+A5U7AyGqK
 a925pPWKOf46B5RwcfAuzKRzycbxeeQPgMHCd4udbZL4DnDznklrRFalNWBwKRZLzb1j
 GFbw==
X-Gm-Message-State: APjAAAXz8UuIKwKx6EIOmRMiKfIPK34GJ3DSfbjKF9uj5nYX6wlLTbF/
 RY+SgnppkMTrf5JycUOheU8vPwr0zrqcoyXcp+M=
X-Google-Smtp-Source: APXvYqw1uttLbi+AoTgP7aznBx+sr44msEGCe0RQOVGd54YNdq1DD2rZXJaBZugXcMuRP1rtjZJZymme3PJ/oEzcBzc=
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr248175ljl.161.1561494186396; 
 Tue, 25 Jun 2019 13:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVF7DUabc6ut92dQQUjxWud7zfdgBEkj=GPn1P+2tKw-ag@mail.gmail.com>
 <mhng-94c196fb-ebb6-4075-afa9-96989bbc037c@palmer-si-x1e>
In-Reply-To: <mhng-94c196fb-ebb6-4075-afa9-96989bbc037c@palmer-si-x1e>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 25 Jun 2019 16:22:34 -0400
Message-ID: <CANnJOVE3m9nxkbLW95nY2rCViBj1HG5HxVTKAWU+NS5ETsgsuQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004c9282058c2bb206"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH for 4.1 v3] target/riscv: Expose time CSRs
 when allowed by [m|s]counteren
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 20:23:37 -0000

--0000000000004c9282058c2bb206
Content-Type: text/plain; charset="UTF-8"

I just did some testing on a HiFive Unleashed board and can confirm what
you are saying. The low 5 bits of both mcounteren and scounteren are
writable (if you try to write 0xFFFFFFFF to them, they'll take on the value
0x1F) but even with the TM bit set in both mcounteren and scounteren the
rdtime instruction always generates an illegal instruction exception.

Reading through the relevant chapter of the spec, I still think that having
mcounteren.TM be writable but making rdtime unconditionally trap is
non-conformant. If other people feel strongly that rdtime should always
require trapping into firmware then the natural change would be to simply
hardwire mcounteren.TM to zero (the value in scounteren wouldn't matter in
that case so it could be left writable). My own (biased) personal feeling
is that this full implementation makes sense at least for the `virt`
machine type because it represents a clear case where deviating from
current hardware enables a performance boost, and would not break
compatibility with any current software: both OpenSBI and BBL try to enable
hardware handling of rdtime when the platform claims to support it.

On Tue, Jun 25, 2019 at 5:56 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Mon, 24 Jun 2019 16:03:20 PDT (-0700), fintelia@gmail.com wrote:
> > Apparently my previous message didn't make it out onto the list (sorry
> > about all these email glitches!). I've included the message again below.
> > Hopefully either a patch like this one or something simpler that just
> hard
> > codes mcounteren.TM to zero (so QEMU is at least conformant) can be
> merged
> > in time for 4.1.
> >
> > On Fri, Jun 14, 2019 at 8:55 AM Jonathan Behrens <jonathan@fintelia.io>
> > wrote:
> >
> >> I'm not sure that is accurate. Based on the discussion here
> >> <https://forums.sifive.com/t/possible-bug-in-counteren-csrs/2123> the
> >> HiFive Unleashed actually does support reading the timer CSR from
> >> unprivileged modes (from that discussion it does so a little too well...
> >> but it should presumably be fixed in later iterations of the processor).
> >> And even if no real hardware supported this capability, it still might
> make
> >> sense to provide it in QEMU as an optimization.
>
> time and cycle are different registers: rdtime should trap, but rdcycle
> should
> work.  The hardware traps rdtime into machine mode and emulates it via a
> memory
> mapped register.  The bug in the FU540-C000 appears to be related to the
> counter enables, not the presence of the counters.
>
> >>
> >> On Fri, Jun 14, 2019 at 7:52 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> >>
> >>> On Tue, 28 May 2019 11:30:20 PDT (-0700), jonathan@fintelia.io wrote:
> >>> > Currently mcounteren.TM acts as though it is hardwired to zero, even
> >>> though QEMU allows it to be set. This change resolves the issue by
> allowing
> >>> reads to the time and timeh control registers when running in a
> privileged
> >>> mode where such accesses are allowed.
> >>> >
> >>> > The frequency of the time register is stored in the time_freq field
> of
> >>> each hart so that it is accessible during CSR reads, but must be the
> same
> >>> across all harts. Each board can initialize it to a custom value,
> although
> >>> all currently use a 10 MHz frequency.
> >>> >
> >>> > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> >>> > ---
> >>> >  hw/riscv/riscv_hart.c           |  4 ++++
> >>> >  hw/riscv/sifive_clint.c         | 30 ++++++++++++++++++++++--------
> >>> >  hw/riscv/sifive_e.c             |  2 ++
> >>> >  hw/riscv/sifive_u.c             |  4 +++-
> >>> >  hw/riscv/spike.c                |  6 +++++-
> >>> >  hw/riscv/virt.c                 |  4 +++-
> >>> >  include/hw/riscv/riscv_hart.h   |  1 +
> >>> >  include/hw/riscv/sifive_clint.h |  4 ----
> >>> >  include/hw/riscv/sifive_e.h     |  4 ++++
> >>> >  include/hw/riscv/sifive_u.h     |  1 +
> >>> >  include/hw/riscv/spike.h        |  1 +
> >>> >  include/hw/riscv/virt.h         |  1 +
> >>> >  target/riscv/cpu.h              |  2 ++
> >>> >  target/riscv/csr.c              | 17 +++++++++++------
> >>> >  14 files changed, 60 insertions(+), 21 deletions(-)
> >>> >
> >>> > diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> >>> > index e34a26a0ef..c39cd55330 100644
> >>> > --- a/hw/riscv/riscv_hart.c
> >>> > +++ b/hw/riscv/riscv_hart.c
> >>> > @@ -19,6 +19,7 @@
> >>> >   */
> >>> >
> >>> >  #include "qemu/osdep.h"
> >>> > +#include "qemu/timer.h"
> >>> >  #include "qapi/error.h"
> >>> >  #include "hw/sysbus.h"
> >>> >  #include "target/riscv/cpu.h"
> >>> > @@ -27,6 +28,8 @@
> >>> >  static Property riscv_harts_props[] = {
> >>> >      DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts,
> 1),
> >>> >      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> >>> > +    DEFINE_PROP_UINT64("timebase-frequency", RISCVHartArrayState,
> >>> time_freq,
> >>> > +                       NANOSECONDS_PER_SECOND),
> >>> >      DEFINE_PROP_END_OF_LIST(),
> >>> >  };
> >>> >
> >>> > @@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceState *dev,
> >>> Error **errp)
> >>> >                                  sizeof(RISCVCPU), s->cpu_type,
> >>> >                                  &error_abort, NULL);
> >>> >          s->harts[n].env.mhartid = n;
> >>> > +        s->harts[n].env.time_freq = s->time_freq;
> >>> >          qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
> >>> >          object_property_set_bool(OBJECT(&s->harts[n]), true,
> >>> >                                   "realized", &err);
> >>> > diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> >>> > index d4c159e937..71edf4dcc6 100644
> >>> > --- a/hw/riscv/sifive_clint.c
> >>> > +++ b/hw/riscv/sifive_clint.c
> >>> > @@ -26,10 +26,10 @@
> >>> >  #include "hw/riscv/sifive_clint.h"
> >>> >  #include "qemu/timer.h"
> >>> >
> >>> > -static uint64_t cpu_riscv_read_rtc(void)
> >>> > +static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)
> >>> >  {
> >>> >      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >>> > -        SIFIVE_CLINT_TIMEBASE_FREQ, NANOSECONDS_PER_SECOND);
> >>> > +        env->time_freq, NANOSECONDS_PER_SECOND);
> >>> >  }
> >>> >
> >>> >  /*
> >>> > @@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(RISCVCPU
> *cpu,
> >>> uint64_t value)
> >>> >      uint64_t next;
> >>> >      uint64_t diff;
> >>> >
> >>> > -    uint64_t rtc_r = cpu_riscv_read_rtc();
> >>> > +    uint64_t rtc_r = cpu_riscv_read_rtc(&cpu->env);
> >>> >
> >>> >      cpu->env.timecmp = value;
> >>> >      if (cpu->env.timecmp <= rtc_r) {
> >>> > @@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(RISCVCPU
> *cpu,
> >>> uint64_t value)
> >>> >      diff = cpu->env.timecmp - rtc_r;
> >>> >      /* back to ns (note args switched in muldiv64) */
> >>> >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> >>> > -        muldiv64(diff, NANOSECONDS_PER_SECOND,
> >>> SIFIVE_CLINT_TIMEBASE_FREQ);
> >>> > +        muldiv64(diff, NANOSECONDS_PER_SECOND, cpu->env.time_freq);
> >>> >      timer_mod(cpu->env.timer, next);
> >>> >  }
> >>> >
> >>> > @@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(void *opaque,
> >>> hwaddr addr, unsigned size)
> >>> >              return 0;
> >>> >          }
> >>> >      } else if (addr == clint->time_base) {
> >>> > -        /* time_lo */
> >>> > -        return cpu_riscv_read_rtc() & 0xFFFFFFFF;
> >>> > +        /* All harts must have the same time frequency, so just use
> >>> hart 0 */
> >>> > +        CPUState *cpu = qemu_get_cpu(0);
> >>> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> >>> > +        if (!env) {
> >>> > +            error_report("clint: hart 0 not valid?!");
> >>> > +        } else {
> >>> > +            /* time_lo */
> >>> > +            return cpu_riscv_read_rtc(env) & 0xFFFFFFFF;
> >>> > +        }
> >>> >      } else if (addr == clint->time_base + 4) {
> >>> > -        /* time_hi */
> >>> > -        return (cpu_riscv_read_rtc() >> 32) & 0xFFFFFFFF;
> >>> > +        /* All harts must have the same time frequency, so just use
> >>> hart 0 */
> >>> > +        CPUState *cpu = qemu_get_cpu(0);
> >>> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> >>> > +        if (!env) {
> >>> > +            error_report("clint: hart 0 not valid?!");
> >>> > +        } else {
> >>> > +            /* time_hi */
> >>> > +            return (cpu_riscv_read_rtc(env) >> 32) & 0xFFFFFFFF;
> >>> > +        }
> >>> >      }
> >>> >
> >>> >      error_report("clint: invalid read: %08x", (uint32_t)addr);
> >>> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> >>> > index 80ac56fa7d..2d6f768ff1 100644
> >>> > --- a/hw/riscv/sifive_e.c
> >>> > +++ b/hw/riscv/sifive_e.c
> >>> > @@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
> >>> >                              &error_abort);
> >>> >      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
> >>> >                              &error_abort);
> >>> > +    object_property_set_int(OBJECT(&s->cpus),
> SIFIVE_E_TIMEBASE_FREQ,
> >>> > +                            "timebase-frequency", &error_abort);
> >>> >      sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
> >>> >                            &s->gpio, sizeof(s->gpio),
> >>> >                            TYPE_SIFIVE_GPIO);
> >>> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >>> > index 5ecc47cea3..ab2b00106b 100644
> >>> > --- a/hw/riscv/sifive_u.c
> >>> > +++ b/hw/riscv/sifive_u.c
> >>> > @@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *s, const
> >>> struct MemmapEntry *memmap,
> >>> >
> >>> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> >>> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> >>> > +        SIFIVE_U_TIMEBASE_FREQ);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >>> >
> >>> > @@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
> >>> >                              &error_abort);
> >>> >      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
> >>> >                              &error_abort);
> >>> > +    object_property_set_int(OBJECT(&s->cpus),
> SIFIVE_U_TIMEBASE_FREQ,
> >>> > +                            "timebase-frequency", &error_abort);
> >>> >
> >>> >      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
> >>> >                            TYPE_CADENCE_GEM);
> >>> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> >>> > index 5b33d4be3b..7c1872aad0 100644
> >>> > --- a/hw/riscv/spike.c
> >>> > +++ b/hw/riscv/spike.c
> >>> > @@ -106,7 +106,7 @@ static void create_fdt(SpikeState *s, const
> struct
> >>> MemmapEntry *memmap,
> >>> >
> >>> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> >>> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> >>> > +        SPIKE_TIMEBASE_FREQ);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >>> >
> >>> > @@ -180,6 +180,8 @@ static void spike_board_init(MachineState
> *machine)
> >>> >                              &error_abort);
> >>> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >>> >                              &error_abort);
> >>> > +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> >>> > +                            "timebase-frequency", &error_abort);
> >>> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >>> >                              &error_abort);
> >>> >
> >>> > @@ -268,6 +270,8 @@ static void spike_v1_10_0_board_init(MachineState
> >>> *machine)
> >>> >                              &error_abort);
> >>> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >>> >                              &error_abort);
> >>> > +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> >>> > +                            "timebase-frequency", &error_abort);
> >>> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >>> >                              &error_abort);
> >>> >
> >>> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >>> > index 84d94d0c42..e3a2474cea 100644
> >>> > --- a/hw/riscv/virt.c
> >>> > +++ b/hw/riscv/virt.c
> >>> > @@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtState *s, const
> >>> struct MemmapEntry *memmap,
> >>> >
> >>> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> >>> > -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> >>> > +                          VIRT_TIMEBASE_FREQ);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >>> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >>> >
> >>> > @@ -403,6 +403,8 @@ static void riscv_virt_board_init(MachineState
> >>> *machine)
> >>> >                              &error_abort);
> >>> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >>> >                              &error_abort);
> >>> > +    object_property_set_int(OBJECT(&s->soc), VIRT_TIMEBASE_FREQ,
> >>> > +                            "timebase-frequency", &error_abort);
> >>> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >>> >                              &error_abort);
> >>> >
> >>> > diff --git a/include/hw/riscv/riscv_hart.h
> >>> b/include/hw/riscv/riscv_hart.h
> >>> > index 0671d88a44..2e82e85b2b 100644
> >>> > --- a/include/hw/riscv/riscv_hart.h
> >>> > +++ b/include/hw/riscv/riscv_hart.h
> >>> > @@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {
> >>> >      /*< public >*/
> >>> >      uint32_t num_harts;
> >>> >      char *cpu_type;
> >>> > +    uint64_t time_freq;
> >>> >      RISCVCPU *harts;
> >>> >  } RISCVHartArrayState;
> >>> >
> >>> > diff --git a/include/hw/riscv/sifive_clint.h
> >>> b/include/hw/riscv/sifive_clint.h
> >>> > index e2865be1d1..aaa2a58c6e 100644
> >>> > --- a/include/hw/riscv/sifive_clint.h
> >>> > +++ b/include/hw/riscv/sifive_clint.h
> >>> > @@ -47,8 +47,4 @@ enum {
> >>> >      SIFIVE_TIME_BASE    = 0xBFF8
> >>> >  };
> >>> >
> >>> > -enum {
> >>> > -    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
> >>> > -};
> >>> > -
> >>> >  #endif
> >>> > diff --git a/include/hw/riscv/sifive_e.h
> b/include/hw/riscv/sifive_e.h
> >>> > index 3b14eb7462..95bd33d872 100644
> >>> > --- a/include/hw/riscv/sifive_e.h
> >>> > +++ b/include/hw/riscv/sifive_e.h
> >>> > @@ -71,6 +71,10 @@ enum {
> >>> >      SIFIVE_E_GPIO0_IRQ0 = 8
> >>> >  };
> >>> >
> >>> > +enum {
> >>> > +    SIFIVE_E_TIMEBASE_FREQ = 10000000,
> >>> > +};
> >>> > +
> >>> >  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> >>> >  #define SIFIVE_E_PLIC_NUM_SOURCES 127
> >>> >  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
> >>> > diff --git a/include/hw/riscv/sifive_u.h
> b/include/hw/riscv/sifive_u.h
> >>> > index 892f0eee21..85ee1eca78 100644
> >>> > --- a/include/hw/riscv/sifive_u.h
> >>> > +++ b/include/hw/riscv/sifive_u.h
> >>> > @@ -63,6 +63,7 @@ enum {
> >>> >  };
> >>> >
> >>> >  enum {
> >>> > +    SIFIVE_U_TIMEBASE_FREQ = 10000000,
> >>> >      SIFIVE_U_CLOCK_FREQ = 1000000000,
> >>> >      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
> >>> >  };
> >>> > diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> >>> > index 641b70da67..2d391d1559 100644
> >>> > --- a/include/hw/riscv/spike.h
> >>> > +++ b/include/hw/riscv/spike.h
> >>> > @@ -36,6 +36,7 @@ enum {
> >>> >  };
> >>> >
> >>> >  enum {
> >>> > +    SPIKE_TIMEBASE_FREQ = 10000000,
> >>> >      SPIKE_CLOCK_FREQ = 1000000000
> >>> >  };
> >>> >
> >>> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> >>> > index d01a1a85c4..53d4318f76 100644
> >>> > --- a/include/hw/riscv/virt.h
> >>> > +++ b/include/hw/riscv/virt.h
> >>> > @@ -53,6 +53,7 @@ enum {
> >>> >  };
> >>> >
> >>> >  enum {
> >>> > +    VIRT_TIMEBASE_FREQ = 10000000,
> >>> >      VIRT_CLOCK_FREQ = 1000000000
> >>> >  };
> >>> >
> >>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>> > index 74e726c1c9..9c09bbbffd 100644
> >>> > --- a/target/riscv/cpu.h
> >>> > +++ b/target/riscv/cpu.h
> >>> > @@ -175,7 +175,9 @@ struct CPURISCVState {
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
> >>> > index f9e2910643..303c362782 100644
> >>> > --- a/target/riscv/csr.c
> >>> > +++ b/target/riscv/csr.c
> >>> > @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env,
> int
> >>> csrno, target_ulong *val)
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
> >>> > @@ -856,14 +865,10 @@ static riscv_csr_operations
> >>> csr_ops[CSR_TABLE_SIZE] = {
> >>> >      [CSR_INSTRETH] =            { ctr,  read_instreth
> >>>      },
> >>> >  #endif
> >>> >
> >>> > -    /* User-level time CSRs are only available in linux-user
> >>> > -     * In privileged mode, the monitor emulates these CSRs */
> >>> > -#if defined(CONFIG_USER_ONLY)
> >>> >      [CSR_TIME] =                { ctr,  read_time
> >>>      },
> >>> >  #if defined(TARGET_RISCV32)
> >>> >      [CSR_TIMEH] =               { ctr,  read_timeh
> >>>       },
> >>> >  #endif
> >>> > -#endif
> >>>
> >>> I would prefer to avoid making the timer CSRs availiable to S-mode and
> >>> below,
> >>> as that doesn't match what implementations actually do.
> >>>
> >>> >  #if !defined(CONFIG_USER_ONLY)
> >>> >      /* Machine Timers and Counters */
> >>>
> >>
>

--0000000000004c9282058c2bb206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just did some testing on a HiFive Unleashed board a=
nd can confirm what you are saying. The low 5 bits of both mcounteren and s=
counteren are writable (if you try to write 0xFFFFFFFF to them, they&#39;ll=
 take on the value 0x1F) but even with the TM bit set in both mcounteren an=
d scounteren the rdtime instruction always generates an illegal instruction=
 exception.<br></div><div><br></div><div>Reading through the relevant chapt=
er of the spec, I still think that having mcounteren.TM be writable but mak=
ing rdtime unconditionally trap is non-conformant. If other people feel str=
ongly that rdtime should always require trapping into firmware then the nat=
ural change would be to simply hardwire mcounteren.TM to zero (the value in=
 scounteren wouldn&#39;t matter in that case so it could be left writable).=
 My own (biased) personal feeling is that this full implementation makes se=
nse at least for the `virt` machine type because it represents a clear case=
 where deviating from current hardware enables a performance boost, and wou=
ld not break compatibility with any current software: both OpenSBI and BBL =
try to enable hardware handling of rdtime when the platform claims to suppo=
rt it.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Jun 25, 2019 at 5:56 AM Palmer Dabbelt &lt;<a href=3D"m=
ailto:palmer@sifive.com">palmer@sifive.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, 24 Jun 2019 16:03:20 PDT =
(-0700), <a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@g=
mail.com</a> wrote:<br>
&gt; Apparently my previous message didn&#39;t make it out onto the list (s=
orry<br>
&gt; about all these email glitches!). I&#39;ve included the message again =
below.<br>
&gt; Hopefully either a patch like this one or something simpler that just =
hard<br>
&gt; codes mcounteren.TM to zero (so QEMU is at least conformant) can be me=
rged<br>
&gt; in time for 4.1.<br>
&gt;<br>
&gt; On Fri, Jun 14, 2019 at 8:55 AM Jonathan Behrens &lt;<a href=3D"mailto=
:jonathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; I&#39;m not sure that is accurate. Based on the discussion here<br=
>
&gt;&gt; &lt;<a href=3D"https://forums.sifive.com/t/possible-bug-in-counter=
en-csrs/2123" rel=3D"noreferrer" target=3D"_blank">https://forums.sifive.co=
m/t/possible-bug-in-counteren-csrs/2123</a>&gt; the<br>
&gt;&gt; HiFive Unleashed actually does support reading the timer CSR from<=
br>
&gt;&gt; unprivileged modes (from that discussion it does so a little too w=
ell...<br>
&gt;&gt; but it should presumably be fixed in later iterations of the proce=
ssor).<br>
&gt;&gt; And even if no real hardware supported this capability, it still m=
ight make<br>
&gt;&gt; sense to provide it in QEMU as an optimization.<br>
<br>
time and cycle are different registers: rdtime should trap, but rdcycle sho=
uld<br>
work.=C2=A0 The hardware traps rdtime into machine mode and emulates it via=
 a memory<br>
mapped register.=C2=A0 The bug in the FU540-C000 appears to be related to t=
he<br>
counter enables, not the presence of the counters.<br>
<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Jun 14, 2019 at 7:52 AM Palmer Dabbelt &lt;<a href=3D"mail=
to:palmer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt;&gt; On Tue, 28 May 2019 11:30:20 PDT (-0700), <a href=3D"mailto:jo=
nathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a> wrote:<br>
&gt;&gt;&gt; &gt; Currently mcounteren.TM acts as though it is hardwired to=
 zero, even<br>
&gt;&gt;&gt; though QEMU allows it to be set. This change resolves the issu=
e by allowing<br>
&gt;&gt;&gt; reads to the time and timeh control registers when running in =
a privileged<br>
&gt;&gt;&gt; mode where such accesses are allowed.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The frequency of the time register is stored in the time_=
freq field of<br>
&gt;&gt;&gt; each hart so that it is accessible during CSR reads, but must =
be the same<br>
&gt;&gt;&gt; across all harts. Each board can initialize it to a custom val=
ue, although<br>
&gt;&gt;&gt; all currently use a 10 MHz frequency.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:jon=
athan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/riscv_hart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/sifive_clint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 30 ++++++++++++++++++++++--------<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/sifive_u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/spike.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
&gt;&gt;&gt; &gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/riscv_hart.h=C2=A0 =C2=A0|=C2=A0 1=
 +<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/sifive_clint.h |=C2=A0 4 ----<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/sifive_e.h=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++++<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/sifive_u.h=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/spike.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 1 +<br>
&gt;&gt;&gt; &gt;=C2=A0 include/hw/riscv/virt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt;&gt;&gt; &gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;&gt;&gt; &gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 17 +++++++++++------<br>
&gt;&gt;&gt; &gt;=C2=A0 14 files changed, 60 insertions(+), 21 deletions(-)=
<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.=
c<br>
&gt;&gt;&gt; &gt; index e34a26a0ef..c39cd55330 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/riscv_hart.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/riscv_hart.c<br>
&gt;&gt;&gt; &gt; @@ -19,6 +19,7 @@<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;&gt; &gt; +#include &quot;qemu/timer.h&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;hw/sysbus.h&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;target/riscv/cpu.h&quot;<br>
&gt;&gt;&gt; &gt; @@ -27,6 +28,8 @@<br>
&gt;&gt;&gt; &gt;=C2=A0 static Property riscv_harts_props[] =3D {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-harts&qu=
ot;, RISCVHartArrayState, num_harts, 1),<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;cpu-type&quo=
t;, RISCVHartArrayState, cpu_type),<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;timebase-frequenc=
y&quot;, RISCVHartArrayState,<br>
&gt;&gt;&gt; time_freq,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND),<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceS=
tate *dev,<br>
&gt;&gt;&gt; Error **errp)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(RISCV=
CPU), s-&gt;cpu_type,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_a=
bort, NULL);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;harts[n].env.mhar=
tid =3D n;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;harts[n].env.time_freq=
 =3D s-&gt;time_freq;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_register_reset(ris=
cv_harts_cpu_reset, &amp;s-&gt;harts[n]);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_boo=
l(OBJECT(&amp;s-&gt;harts[n]), true,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
realized&quot;, &amp;err);<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_cl=
int.c<br>
&gt;&gt;&gt; &gt; index d4c159e937..71edf4dcc6 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/sifive_clint.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/sifive_clint.c<br>
&gt;&gt;&gt; &gt; @@ -26,10 +26,10 @@<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;hw/riscv/sifive_clint.h&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -static uint64_t cpu_riscv_read_rtc(void)<br>
&gt;&gt;&gt; &gt; +static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)<b=
r>
&gt;&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEM=
U_CLOCK_VIRTUAL),<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ, =
NANOSECONDS_PER_SECOND);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;time_freq, NANOSECON=
DS_PER_SECOND);<br>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 /*<br>
&gt;&gt;&gt; &gt; @@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(=
RISCVCPU *cpu,<br>
&gt;&gt;&gt; uint64_t value)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t next;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t diff;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc();<b=
r>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(&amp=
;cpu-&gt;env);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.timecmp =3D value;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.timecmp &lt;=3D rtc_r=
) {<br>
&gt;&gt;&gt; &gt; @@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(=
RISCVCPU *cpu,<br>
&gt;&gt;&gt; uint64_t value)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 diff =3D cpu-&gt;env.timecmp - rtc_r;=
<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* back to ns (note args switched in =
muldiv64) */<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 next =3D qemu_clock_get_ns(QEMU_CLOCK=
_VIRTUAL) +<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(diff, NANOSECONDS_P=
ER_SECOND,<br>
&gt;&gt;&gt; SIFIVE_CLINT_TIMEBASE_FREQ);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(diff, NANOSECONDS_P=
ER_SECOND, cpu-&gt;env.time_freq);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 timer_mod(cpu-&gt;env.timer, next);<b=
r>
&gt;&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(v=
oid *opaque,<br>
&gt;&gt;&gt; hwaddr addr, unsigned size)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;=
<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D clint-&gt;time=
_base) {<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_riscv_read_rtc() =
&amp; 0xFFFFFFFF;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All harts must have the s=
ame time frequency, so just use<br>
&gt;&gt;&gt; hart 0 */<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_c=
pu(0);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu ?=
 cpu-&gt;env_ptr : NULL;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!env) {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&=
quot;clint: hart 0 not valid?!&quot;);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_ris=
cv_read_rtc(env) &amp; 0xFFFFFFFF;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D clint-&gt;time=
_base + 4) {<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_riscv_read_rtc()=
 &gt;&gt; 32) &amp; 0xFFFFFFFF;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All harts must have the s=
ame time frequency, so just use<br>
&gt;&gt;&gt; hart 0 */<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_c=
pu(0);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu ?=
 cpu-&gt;env_ptr : NULL;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!env) {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&=
quot;clint: hart 0 not valid?!&quot;);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_ri=
scv_read_rtc(env) &gt;&gt; 32) &amp; 0xFFFFFFFF;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 error_report(&quot;clint: invalid rea=
d: %08x&quot;, (uint32_t)addr);<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br=
>
&gt;&gt;&gt; &gt; index 80ac56fa7d..2d6f768ff1 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/sifive_e.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/sifive_e.c<br>
&gt;&gt;&gt; &gt; @@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(O=
bject *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s=
-&gt;cpus), smp_cpus, &quot;num-harts&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;=
cpus), SIFIVE_E_TIMEBASE_FREQ,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &=
amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sysbus_init_child_obj(obj, &quot;risc=
v.sifive.e.gpio0&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;gpio, sizeof(s-&gt;gpi=
o),<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_GPIO);<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br=
>
&gt;&gt;&gt; &gt; index 5ecc47cea3..ab2b00106b 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/sifive_u.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/sifive_u.c<br>
&gt;&gt;&gt; &gt; @@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *=
s, const<br>
&gt;&gt;&gt; struct MemmapEntry *memmap,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus=
&quot;);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;timebase-frequency&quot;,<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);=
<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_U_TIMEBASE_FREQ);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#size-cells&quot;, 0x0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#address-cells&quot;, 0x1);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(O=
bject *obj)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s=
-&gt;cpus), smp_cpus, &quot;num-harts&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;=
cpus), SIFIVE_U_TIMEBASE_FREQ,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &=
amp;error_abort);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sysbus_init_child_obj(obj, &quot;gem&=
quot;, &amp;s-&gt;gem, sizeof(s-&gt;gem),<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_CADENCE_GEM);<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c<br>
&gt;&gt;&gt; &gt; index 5b33d4be3b..7c1872aad0 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/spike.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/spike.c<br>
&gt;&gt;&gt; &gt; @@ -106,7 +106,7 @@ static void create_fdt(SpikeState *s,=
 const struct<br>
&gt;&gt;&gt; MemmapEntry *memmap,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus=
&quot;);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;timebase-frequency&quot;,<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);=
<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPIKE_TIMEBASE_FREQ);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#size-cells&quot;, 0x0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#address-cells&quot;, 0x1);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -180,6 +180,8 @@ static void spike_board_init(MachineS=
tate *machine)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s=
-&gt;soc), smp_cpus, &quot;num-harts&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;=
soc), SPIKE_TIMEBASE_FREQ,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &=
amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;=
s-&gt;soc), true, &quot;realized&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -268,6 +270,8 @@ static void spike_v1_10_0_board_init(=
MachineState<br>
&gt;&gt;&gt; *machine)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s=
-&gt;soc), smp_cpus, &quot;num-harts&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;=
soc), SPIKE_TIMEBASE_FREQ,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &=
amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;=
s-&gt;soc), true, &quot;realized&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
&gt;&gt;&gt; &gt; index 84d94d0c42..e3a2474cea 100644<br>
&gt;&gt;&gt; &gt; --- a/hw/riscv/virt.c<br>
&gt;&gt;&gt; &gt; +++ b/hw/riscv/virt.c<br>
&gt;&gt;&gt; &gt; @@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtStat=
e *s, const<br>
&gt;&gt;&gt; struct MemmapEntry *memmap,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus=
&quot;);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;timebase-frequency&quot;,<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VIRT_TIMEBASE_FREQ);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#size-cells&quot;, 0x0);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpu=
s&quot;, &quot;#address-cells&quot;, 0x1);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; @@ -403,6 +403,8 @@ static void riscv_virt_board_init(Mac=
hineState<br>
&gt;&gt;&gt; *machine)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s=
-&gt;soc), smp_cpus, &quot;num-harts&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;=
soc), VIRT_TIMEBASE_FREQ,<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &=
amp;error_abort);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;=
s-&gt;soc), true, &quot;realized&quot;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/riscv_hart.h<br>
&gt;&gt;&gt; b/include/hw/riscv/riscv_hart.h<br>
&gt;&gt;&gt; &gt; index 0671d88a44..2e82e85b2b 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/riscv_hart.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/riscv_hart.h<br>
&gt;&gt;&gt; &gt; @@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint32_t num_harts;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 char *cpu_type;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 uint64_t time_freq;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *harts;<br>
&gt;&gt;&gt; &gt;=C2=A0 } RISCVHartArrayState;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/sifive_clint.h<br>
&gt;&gt;&gt; b/include/hw/riscv/sifive_clint.h<br>
&gt;&gt;&gt; &gt; index e2865be1d1..aaa2a58c6e 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/sifive_clint.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/sifive_clint.h<br>
&gt;&gt;&gt; &gt; @@ -47,8 +47,4 @@ enum {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_TIME_BASE=C2=A0 =C2=A0 =3D 0xB=
FF8<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -enum {<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ =3D 10000000<br=
>
&gt;&gt;&gt; &gt; -};<br>
&gt;&gt;&gt; &gt; -<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/sifive_e.h b/include/hw/ris=
cv/sifive_e.h<br>
&gt;&gt;&gt; &gt; index 3b14eb7462..95bd33d872 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/sifive_e.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/sifive_e.h<br>
&gt;&gt;&gt; &gt; @@ -71,6 +71,10 @@ enum {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_E_GPIO0_IRQ0 =3D 8<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; +enum {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 SIFIVE_E_TIMEBASE_FREQ =3D 10000000,<br>
&gt;&gt;&gt; &gt; +};<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 #define SIFIVE_E_PLIC_HART_CONFIG &quot;M&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 #define SIFIVE_E_PLIC_NUM_SOURCES 127<br>
&gt;&gt;&gt; &gt;=C2=A0 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/sifive_u.h b/include/hw/ris=
cv/sifive_u.h<br>
&gt;&gt;&gt; &gt; index 892f0eee21..85ee1eca78 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/sifive_u.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/sifive_u.h<br>
&gt;&gt;&gt; &gt; @@ -63,6 +63,7 @@ enum {<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 enum {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 SIFIVE_U_TIMEBASE_FREQ =3D 10000000,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_U_CLOCK_FREQ =3D 1000000000,<b=
r>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_U_GEM_CLOCK_FREQ =3D 125000000=
<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/=
spike.h<br>
&gt;&gt;&gt; &gt; index 641b70da67..2d391d1559 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/spike.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/spike.h<br>
&gt;&gt;&gt; &gt; @@ -36,6 +36,7 @@ enum {<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 enum {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 SPIKE_TIMEBASE_FREQ =3D 10000000,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SPIKE_CLOCK_FREQ =3D 1000000000<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/v=
irt.h<br>
&gt;&gt;&gt; &gt; index d01a1a85c4..53d4318f76 100644<br>
&gt;&gt;&gt; &gt; --- a/include/hw/riscv/virt.h<br>
&gt;&gt;&gt; &gt; +++ b/include/hw/riscv/virt.h<br>
&gt;&gt;&gt; &gt; @@ -53,6 +53,7 @@ enum {<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 enum {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 VIRT_TIMEBASE_FREQ =3D 10000000,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 VIRT_CLOCK_FREQ =3D 1000000000<br>
&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; index 74e726c1c9..9c09bbbffd 100644<br>
&gt;&gt;&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt;&gt; &gt; @@ -175,7 +175,9 @@ struct CPURISCVState {<br>
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
&gt;&gt;&gt; &gt; index f9e2910643..303c362782 100644<br>
&gt;&gt;&gt; &gt; --- a/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; +++ b/target/riscv/csr.c<br>
&gt;&gt;&gt; &gt; @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVSt=
ate *env, int<br>
&gt;&gt;&gt; csrno, target_ulong *val)<br>
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
&gt;&gt;&gt; &gt; @@ -856,14 +865,10 @@ static riscv_csr_operations<br>
&gt;&gt;&gt; csr_ops[CSR_TABLE_SIZE] =3D {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_INSTRETH] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 { ctr,=C2=A0 read_instreth<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 /* User-level time CSRs are only available=
 in linux-user<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0* In privileged mode, the monitor em=
ulates these CSRs */<br>
&gt;&gt;&gt; &gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIME] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { ctr,=C2=A0 read_time<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt;&gt; &gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_TIMEH] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ ctr,=C2=A0 read_timeh<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt;&gt; &gt;=C2=A0 #endif<br>
&gt;&gt;&gt; &gt; -#endif<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I would prefer to avoid making the timer CSRs availiable to S-=
mode and<br>
&gt;&gt;&gt; below,<br>
&gt;&gt;&gt; as that doesn&#39;t match what implementations actually do.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Timers and Counters */<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000004c9282058c2bb206--

