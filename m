Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVguv-0002ct-0K
	for mharc-qemu-riscv@gnu.org; Tue, 28 May 2019 14:33:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hVguo-0002Vi-LY
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 14:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hVguk-0007a2-2y
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 14:33:38 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:32872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hVguV-0007DZ-Gu; Tue, 28 May 2019 14:33:22 -0400
Received: by mail-lf1-x141.google.com with SMTP id y17so7521533lfe.0;
	Tue, 28 May 2019 11:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BWtp5YI6UTvnCspOm36FQJuYNt/B1BbK0h6pRQoDz5M=;
	b=obQrm06shK8MKOK7YmRMtupi1gGj6MwmPxfDJN4ojnouTi58JMLexkEyTiphpcoALL
	LjHpeQO6LfVyrdfBYYUFtqW7s7u+xSvQn3zykXI5G882So/nCVIfBwpxGof1VcXRk0PQ
	Ll2nau+2kxJMF4g6ntdRRE48KBT5evi8zpVaH7dkw812jgLP7PCeehcN5DJOL0BwOyof
	+U519WZBViOK+hbEQ2tgnI0NCRtFTVsh4elGPlfcnmpv98tiPwHDJJKVBvEVYItVAWMr
	ZnDogdSF265AyBt6jhBw8YfAgoFS2BP2zXhFf2U9SwK8G2mq2xrWdMO5x7Of1Yqxe+ZL
	9TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BWtp5YI6UTvnCspOm36FQJuYNt/B1BbK0h6pRQoDz5M=;
	b=YwizDM3LO9/nUpd3EaHMkhH54j4BLBgoG4YSgH7Kls2V5AGdLB16QOxyJWI4goQYJ9
	3LgpZUXmlkDfCOyz9WJH1VwTgzzw/4dSNKrpxVimVRuQKAf+TtWWp2uqqE+pMe0YNw22
	8CwAGJ2flQLCWcYF3JCAdHPc1ZwoRrX1SQHrrLnS5U0hGJ47SCGW5q43VRnPV4j/P7Ww
	1lRC4zO0NlGbuFrxOJ+5R2Hcivy2pNyaWmNVYW/Ps6bdljm7Uztmnw4+xgUjKt4bZRVX
	ELKWX7oSWtSwUFjfSfHG8LH+TPfU2FYbY6cmPoTkysB7B5wPG7VCZCjsATLqNWnfgl3N
	1o8Q==
X-Gm-Message-State: APjAAAW4uiyboh8dTKgk71KyLU8fsXni8r+yRtYBfNQiq45efq0nRE/V
	81sTl8U7ZQkTXA2NqOmC5DGmLpUEcI7QEFftGoY=
X-Google-Smtp-Source: APXvYqzGo9w0Al+wdZnAtj3zkFqHrnCyBwsllwo1Ens79yCP8yuX03ajWiUMLcnDYBZvgCNtzydExusPI1emu5WOoRo=
X-Received: by 2002:ac2:518d:: with SMTP id u13mr9769356lfi.40.1559068385419; 
	Tue, 28 May 2019 11:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVH_Jt0pCeqnqpZdCY97pUf72EiABXtOvHWLAkpfqhKbqg@mail.gmail.com>
	<mhng-8b0fe65c-259f-4804-9299-0e44154fc607@palmer-si-x1e>
In-Reply-To: <mhng-8b0fe65c-259f-4804-9299-0e44154fc607@palmer-si-x1e>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 28 May 2019 14:32:39 -0400
Message-ID: <CANnJOVHeOO6NhdVt-=6_piu2OL=ha9-BcK4S5DDg9fR8JCBCKw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004b283c0589f6e58e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [PATCH for 4.1 v2] target/riscv: Expose time CSRs
 when allowed by [m|s]counteren
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
X-List-Received-Date: Tue, 28 May 2019 18:33:41 -0000

--0000000000004b283c0589f6e58e
Content-Type: text/plain; charset="UTF-8"

Sure, I've just sent a corrected version.

Thanks,
Jonathan

On Tue, May 28, 2019 at 1:09 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Tue, 30 Apr 2019 10:36:01 PDT (-0700), fintelia@gmail.com wrote:
> > Currently mcounteren.TM acts as though it is hardwired to zero, even
> though
> > QEMU allows it to be set. This change resolves the issue by allowing
> reads
> > to the time and timeh control registers when running in a privileged mode
> > where such accesses are allowed.
> >
> > The frequency of the time register is stored in the time_freq field of
> each
> > hart so that it is accessible during CSR reads, but must be the same
> across
> > all harts. Each board can initialize it to a custom value, although all
> > currently use a 10 MHz frequency.
> > ---
> >  hw/riscv/riscv_hart.c           |  4 ++++
> >  hw/riscv/sifive_clint.c         | 30 ++++++++++++++++++++++--------
> >  hw/riscv/sifive_e.c             |  2 ++
> >  hw/riscv/sifive_u.c             |  4 +++-
> >  hw/riscv/spike.c                |  6 +++++-
> >  hw/riscv/virt.c                 |  4 +++-
> >  include/hw/riscv/riscv_hart.h   |  1 +
> >  include/hw/riscv/sifive_clint.h |  4 ----
> >  include/hw/riscv/sifive_e.h     |  4 ++++
> >  include/hw/riscv/sifive_u.h     |  1 +
> >  include/hw/riscv/spike.h        |  1 +
> >  include/hw/riscv/virt.h         |  1 +
> >  target/riscv/cpu.h              |  2 ++
> >  target/riscv/csr.c              | 17 +++++++++++------
> >  14 files changed, 60 insertions(+), 21 deletions(-)
> >
> > diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> > index e34a26a0ef..c39cd55330 100644
> > --- a/hw/riscv/riscv_hart.c
> > +++ b/hw/riscv/riscv_hart.c
> > @@ -19,6 +19,7 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qemu/timer.h"
> >  #include "qapi/error.h"
> >  #include "hw/sysbus.h"
> >  #include "target/riscv/cpu.h"
> > @@ -27,6 +28,8 @@
> >  static Property riscv_harts_props[] = {
> >      DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
> >      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> > +    DEFINE_PROP_UINT64("timebase-frequency", RISCVHartArrayState,
> > time_freq,
> > +                       NANOSECONDS_PER_SECOND),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > @@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceState *dev, Error
> > **errp)
> >                                  sizeof(RISCVCPU), s->cpu_type,
> >                                  &error_abort, NULL);
> >          s->harts[n].env.mhartid = n;
> > +        s->harts[n].env.time_freq = s->time_freq;
> >          qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
> >          object_property_set_bool(OBJECT(&s->harts[n]), true,
> >                                   "realized", &err);
> > diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> > index d4c159e937..71edf4dcc6 100644
> > --- a/hw/riscv/sifive_clint.c
> > +++ b/hw/riscv/sifive_clint.c
> > @@ -26,10 +26,10 @@
> >  #include "hw/riscv/sifive_clint.h"
> >  #include "qemu/timer.h"
> >
> > -static uint64_t cpu_riscv_read_rtc(void)
> > +static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)
> >  {
> >      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -        SIFIVE_CLINT_TIMEBASE_FREQ, NANOSECONDS_PER_SECOND);
> > +        env->time_freq, NANOSECONDS_PER_SECOND);
> >  }
> >
> >  /*
> > @@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> > uint64_t value)
> >      uint64_t next;
> >      uint64_t diff;
> >
> > -    uint64_t rtc_r = cpu_riscv_read_rtc();
> > +    uint64_t rtc_r = cpu_riscv_read_rtc(&cpu->env);
> >
> >      cpu->env.timecmp = value;
> >      if (cpu->env.timecmp <= rtc_r) {
> > @@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> > uint64_t value)
> >      diff = cpu->env.timecmp - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > -        muldiv64(diff, NANOSECONDS_PER_SECOND,
> SIFIVE_CLINT_TIMEBASE_FREQ);
> > +        muldiv64(diff, NANOSECONDS_PER_SECOND, cpu->env.time_freq);
> >      timer_mod(cpu->env.timer, next);
> >  }
> >
> > @@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(void *opaque,
> > hwaddr addr, unsigned size)
> >              return 0;
> >          }
> >      } else if (addr == clint->time_base) {
> > -        /* time_lo */
> > -        return cpu_riscv_read_rtc() & 0xFFFFFFFF;
> > +        /* All harts must have the same time frequency, so just use
> hart 0
> > */
> > +        CPUState *cpu = qemu_get_cpu(0);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("clint: hart 0 not valid?!");
> > +        } else {
> > +            /* time_lo */
> > +            return cpu_riscv_read_rtc(env) & 0xFFFFFFFF;
> > +        }
> >      } else if (addr == clint->time_base + 4) {
> > -        /* time_hi */
> > -        return (cpu_riscv_read_rtc() >> 32) & 0xFFFFFFFF;
> > +        /* All harts must have the same time frequency, so just use
> hart 0
> > */
> > +        CPUState *cpu = qemu_get_cpu(0);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("clint: hart 0 not valid?!");
> > +        } else {
> > +            /* time_hi */
> > +            return (cpu_riscv_read_rtc(env) >> 32) & 0xFFFFFFFF;
> > +        }
> >      }
> >
> >      error_report("clint: invalid read: %08x", (uint32_t)addr);
> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> > index b1cd11363c..0a6bb629b6 100644
> > --- a/hw/riscv/sifive_e.c
> > +++ b/hw/riscv/sifive_e.c
> > @@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
> >                              &error_abort);
> >      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
> >                              &error_abort);
> > +    object_property_set_int(OBJECT(&s->cpus), SIFIVE_E_TIMEBASE_FREQ,
> > +                            "timebase-frequency", &error_abort);
> >  }
> >
> >  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 5ecc47cea3..ab2b00106b 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *s, const struct
> > MemmapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> > +        SIFIVE_U_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >
> > @@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
> >                              &error_abort);
> >      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
> >                              &error_abort);
> > +    object_property_set_int(OBJECT(&s->cpus), SIFIVE_U_TIMEBASE_FREQ,
> > +                            "timebase-frequency", &error_abort);
> >
> >      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
> >                            TYPE_CADENCE_GEM);
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index 2a000a5800..6b85083308 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -105,7 +105,7 @@ static void create_fdt(SpikeState *s, const struct
> > MemmapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> > +        SPIKE_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >
> > @@ -179,6 +179,8 @@ static void spike_v1_10_0_board_init(MachineState
> > *machine)
> >                              &error_abort);
> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >                              &error_abort);
> > +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> > +                            "timebase-frequency", &error_abort);
> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >                              &error_abort);
> >
> > @@ -261,6 +263,8 @@ static void spike_v1_09_1_board_init(MachineState
> > *machine)
> >                              &error_abort);
> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >                              &error_abort);
> > +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> > +                            "timebase-frequency", &error_abort);
> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >                              &error_abort);
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3526463034..beeccba4ac 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtState *s, const
> struct
> > MemmapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> > +                          VIRT_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >
> > @@ -403,6 +403,8 @@ static void riscv_virt_board_init(MachineState
> *machine)
> >                              &error_abort);
> >      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
> >                              &error_abort);
> > +    object_property_set_int(OBJECT(&s->soc), VIRT_TIMEBASE_FREQ,
> > +                            "timebase-frequency", &error_abort);
> >      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> >                              &error_abort);
> >
> > diff --git a/include/hw/riscv/riscv_hart.h
> b/include/hw/riscv/riscv_hart.h
> > index 0671d88a44..2e82e85b2b 100644
> > --- a/include/hw/riscv/riscv_hart.h
> > +++ b/include/hw/riscv/riscv_hart.h
> > @@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {
> >      /*< public >*/
> >      uint32_t num_harts;
> >      char *cpu_type;
> > +    uint64_t time_freq;
> >      RISCVCPU *harts;
> >  } RISCVHartArrayState;
> >
> > diff --git a/include/hw/riscv/sifive_clint.h
> > b/include/hw/riscv/sifive_clint.h
> > index e2865be1d1..aaa2a58c6e 100644
> > --- a/include/hw/riscv/sifive_clint.h
> > +++ b/include/hw/riscv/sifive_clint.h
> > @@ -47,8 +47,4 @@ enum {
> >      SIFIVE_TIME_BASE    = 0xBFF8
> >  };
> >
> > -enum {
> > -    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
> > -};
> > -
> >  #endif
> > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> > index 7b6d8aed96..b83e60493e 100644
> > --- a/include/hw/riscv/sifive_e.h
> > +++ b/include/hw/riscv/sifive_e.h
> > @@ -67,6 +67,10 @@ enum {
> >      SIFIVE_E_UART1_IRQ = 4
> >  };
> >
> > +enum {
> > +    SIFIVE_E_TIMEBASE_FREQ = 10000000,
> > +};
> > +
> >  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> >  #define SIFIVE_E_PLIC_NUM_SOURCES 127
> >  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
> > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> > index be13cc1304..e94eb89866 100644
> > --- a/include/hw/riscv/sifive_u.h
> > +++ b/include/hw/riscv/sifive_u.h
> > @@ -63,6 +63,7 @@ enum {
> >  };
> >
> >  enum {
> > +    SIFIVE_U_TIMEBASE_FREQ = 10000000,
> >      SIFIVE_U_CLOCK_FREQ = 1000000000,
> >      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
> >  };
> > diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> > index 641b70da67..2d391d1559 100644
> > --- a/include/hw/riscv/spike.h
> > +++ b/include/hw/riscv/spike.h
> > @@ -36,6 +36,7 @@ enum {
> >  };
> >
> >  enum {
> > +    SPIKE_TIMEBASE_FREQ = 10000000,
> >      SPIKE_CLOCK_FREQ = 1000000000
> >  };
> >
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index f12deaebd6..f807bbfe1e 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -53,6 +53,7 @@ enum {
> >  };
> >
> >  enum {
> > +    VIRT_TIMEBASE_FREQ = 10000000,
> >      VIRT_CLOCK_FREQ = 1000000000
> >  };
> >
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
>
> This is failing to apply for me
>
>     Applying: target/riscv: Expose time CSRs when allowed by [m|s]counteren
>     error: corrupt patch at line 35
>     error: could not build fake ancestor
>     Patch failed at 0001 target/riscv: Expose time CSRs when allowed by
> [m|s]counteren
>     hint: Use 'git am --show-current-patch' to see the failed patch
>     When you have resolved this problem, run "git am --continue".
>     If you prefer to skip this patch, run "git am --skip" instead.
>     To restore the original branch and stop patching, run "git am --abort".
>
> it appears the patch is corrupt?  Do you mind re-sending it based on the
> latest
> master?  My PR just got merged.
>

--0000000000004b283c0589f6e58e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, I&#39;ve just sent a corrected version. <br></d=
iv><div><br></div><div>Thanks,<br></div><div>Jonathan<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May =
28, 2019 at 1:09 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com"=
 target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, 30 Apr 2019 10:36:01 PDT (-0700=
), <a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.c=
om</a> wrote:<br>
&gt; Currently mcounteren.TM acts as though it is hardwired to zero, even t=
hough<br>
&gt; QEMU allows it to be set. This change resolves the issue by allowing r=
eads<br>
&gt; to the time and timeh control registers when running in a privileged m=
ode<br>
&gt; where such accesses are allowed.<br>
&gt;<br>
&gt; The frequency of the time register is stored in the time_freq field of=
 each<br>
&gt; hart so that it is accessible during CSR reads, but must be the same a=
cross<br>
&gt; all harts. Each board can initialize it to a custom value, although al=
l<br>
&gt; currently use a 10 MHz frequency.<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/riscv_hart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++++<br>
&gt;=C2=A0 hw/riscv/sifive_clint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++=
++++++++++++++++++++--------<br>
&gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 hw/riscv/sifive_u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 +++-<br>
&gt;=C2=A0 hw/riscv/spike.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 6 +++++-<br>
&gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;=C2=A0 include/hw/riscv/riscv_hart.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 include/hw/riscv/sifive_clint.h |=C2=A0 4 ----<br>
&gt;=C2=A0 include/hw/riscv/sifive_e.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br=
>
&gt;=C2=A0 include/hw/riscv/sifive_u.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 include/hw/riscv/spike.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<=
br>
&gt;=C2=A0 include/hw/riscv/virt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 17 +++++++++++------<br>
&gt;=C2=A0 14 files changed, 60 insertions(+), 21 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c<br>
&gt; index e34a26a0ef..c39cd55330 100644<br>
&gt; --- a/hw/riscv/riscv_hart.c<br>
&gt; +++ b/hw/riscv/riscv_hart.c<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/sysbus.h&quot;<br>
&gt;=C2=A0 #include &quot;target/riscv/cpu.h&quot;<br>
&gt; @@ -27,6 +28,8 @@<br>
&gt;=C2=A0 static Property riscv_harts_props[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-harts&quot;, RISCVHar=
tArrayState, num_harts, 1),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;cpu-type&quot;, RISCVHart=
ArrayState, cpu_type),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;timebase-frequency&quot;, RISC=
VHartArrayState,<br>
&gt; time_freq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; @@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceState *dev, Er=
ror<br>
&gt; **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(RISCVCPU), s-&gt;cp=
u_type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort, NULL);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;harts[n].env.mhartid =3D n;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;harts[n].env.time_freq =3D s-&gt;ti=
me_freq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_register_reset(riscv_harts_cpu_=
reset, &amp;s-&gt;harts[n]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp=
;s-&gt;harts[n]), true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;realized&quot;=
, &amp;err);<br>
&gt; diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c<br>
&gt; index d4c159e937..71edf4dcc6 100644<br>
&gt; --- a/hw/riscv/sifive_clint.c<br>
&gt; +++ b/hw/riscv/sifive_clint.c<br>
&gt; @@ -26,10 +26,10 @@<br>
&gt;=C2=A0 #include &quot;hw/riscv/sifive_clint.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;<br>
&gt; -static uint64_t cpu_riscv_read_rtc(void)<br>
&gt; +static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ, NANOSECONDS_P=
ER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;time_freq, NANOSECONDS_PER_SECOND=
);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; @@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu=
,<br>
&gt; uint64_t value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t next;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t diff;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc();<br>
&gt; +=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(&amp;cpu-&gt;env)=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.timecmp =3D value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.timecmp &lt;=3D rtc_r) {<br>
&gt; @@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu=
,<br>
&gt; uint64_t value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 diff =3D cpu-&gt;env.timecmp - rtc_r;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* back to ns (note args switched in muldiv64) */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(diff, NANOSECONDS_PER_SECOND, SI=
FIVE_CLINT_TIMEBASE_FREQ);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 muldiv64(diff, NANOSECONDS_PER_SECOND, cp=
u-&gt;env.time_freq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 timer_mod(cpu-&gt;env.timer, next);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(void *opaque,<=
br>
&gt; hwaddr addr, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D clint-&gt;time_base) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_riscv_read_rtc() &amp; 0xFFFFF=
FFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All harts must have the same time freq=
uency, so just use hart 0<br>
&gt; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu ? cpu-&gt;env_=
ptr : NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!env) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;clint: h=
art 0 not valid?!&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_lo */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpu_riscv_read_rtc(e=
nv) &amp; 0xFFFFFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (addr =3D=3D clint-&gt;time_base + 4) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_riscv_read_rtc() &gt;&gt; 32)=
 &amp; 0xFFFFFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All harts must have the same time freq=
uency, so just use hart 0<br>
&gt; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D cpu ? cpu-&gt;env_=
ptr : NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!env) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;clint: h=
art 0 not valid?!&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time_hi */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (cpu_riscv_read_rtc(=
env) &gt;&gt; 32) &amp; 0xFFFFFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 error_report(&quot;clint: invalid read: %08x&quot;=
, (uint32_t)addr);<br>
&gt; diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
&gt; index b1cd11363c..0a6bb629b6 100644<br>
&gt; --- a/hw/riscv/sifive_e.c<br>
&gt; +++ b/hw/riscv/sifive_e.c<br>
&gt; @@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(Object *obj)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;cpus), s=
mp_cpus, &quot;num-harts&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;cpus), SIFIVE=
_E_TIMEBASE_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &amp;error_abo=
rt);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void riscv_sifive_e_soc_realize(DeviceState *dev, Error *=
*errp)<br>
&gt; diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br>
&gt; index 5ecc47cea3..ab2b00106b 100644<br>
&gt; --- a/hw/riscv/sifive_u.c<br>
&gt; +++ b/hw/riscv/sifive_u.c<br>
&gt; @@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *s, const stru=
ct<br>
&gt; MemmapEntry *memmap,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;timebase-frequency&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_U_TIMEBASE_FREQ);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#size-cells&quot;, 0x0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#address-cells&quot;, 0x1);<br>
&gt;<br>
&gt; @@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(Object *obj)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;cpus), s=
mp_cpus, &quot;num-harts&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;cpus), SIFIVE=
_U_TIMEBASE_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &amp;error_abo=
rt);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sysbus_init_child_obj(obj, &quot;gem&quot;, &amp;s=
-&gt;gem, sizeof(s-&gt;gem),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_CADENCE_GEM);<br>
&gt; diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c<br>
&gt; index 2a000a5800..6b85083308 100644<br>
&gt; --- a/hw/riscv/spike.c<br>
&gt; +++ b/hw/riscv/spike.c<br>
&gt; @@ -105,7 +105,7 @@ static void create_fdt(SpikeState *s, const struct=
<br>
&gt; MemmapEntry *memmap,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;timebase-frequency&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SPIKE_TIMEBASE_FREQ);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#size-cells&quot;, 0x0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#address-cells&quot;, 0x1);<br>
&gt;<br>
&gt; @@ -179,6 +179,8 @@ static void spike_v1_10_0_board_init(MachineState<=
br>
&gt; *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), sm=
p_cpus, &quot;num-harts&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), SPIKE_T=
IMEBASE_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &amp;error_abo=
rt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;s-&gt;soc), t=
rue, &quot;realized&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;<br>
&gt; @@ -261,6 +263,8 @@ static void spike_v1_09_1_board_init(MachineState<=
br>
&gt; *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), sm=
p_cpus, &quot;num-harts&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), SPIKE_T=
IMEBASE_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &amp;error_abo=
rt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;s-&gt;soc), t=
rue, &quot;realized&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;<br>
&gt; diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
&gt; index 3526463034..beeccba4ac 100644<br>
&gt; --- a/hw/riscv/virt.c<br>
&gt; +++ b/hw/riscv/virt.c<br>
&gt; @@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtState *s, const s=
truct<br>
&gt; MemmapEntry *memmap,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/cpus&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;timebase-frequency&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 VIRT_TIMEBASE_FREQ);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#size-cells&quot;, 0x0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/cpus&quot;, &quo=
t;#address-cells&quot;, 0x1);<br>
&gt;<br>
&gt; @@ -403,6 +403,8 @@ static void riscv_virt_board_init(MachineState *ma=
chine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), sm=
p_cpus, &quot;num-harts&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&amp;s-&gt;soc), VIRT_TI=
MEBASE_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timebase-frequency&quot;, &amp;error_abo=
rt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(&amp;s-&gt;soc), t=
rue, &quot;realized&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt;<br>
&gt; diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_ha=
rt.h<br>
&gt; index 0671d88a44..2e82e85b2b 100644<br>
&gt; --- a/include/hw/riscv/riscv_hart.h<br>
&gt; +++ b/include/hw/riscv/riscv_hart.h<br>
&gt; @@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t num_harts;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *cpu_type;<br>
&gt; +=C2=A0 =C2=A0 uint64_t time_freq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *harts;<br>
&gt;=C2=A0 } RISCVHartArrayState;<br>
&gt;<br>
&gt; diff --git a/include/hw/riscv/sifive_clint.h<br>
&gt; b/include/hw/riscv/sifive_clint.h<br>
&gt; index e2865be1d1..aaa2a58c6e 100644<br>
&gt; --- a/include/hw/riscv/sifive_clint.h<br>
&gt; +++ b/include/hw/riscv/sifive_clint.h<br>
&gt; @@ -47,8 +47,4 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_TIME_BASE=C2=A0 =C2=A0 =3D 0xBFF8<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -enum {<br>
&gt; -=C2=A0 =C2=A0 SIFIVE_CLINT_TIMEBASE_FREQ =3D 10000000<br>
&gt; -};<br>
&gt; -<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h=
<br>
&gt; index 7b6d8aed96..b83e60493e 100644<br>
&gt; --- a/include/hw/riscv/sifive_e.h<br>
&gt; +++ b/include/hw/riscv/sifive_e.h<br>
&gt; @@ -67,6 +67,10 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_E_UART1_IRQ =3D 4<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_TIMEBASE_FREQ =3D 10000000,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #define SIFIVE_E_PLIC_HART_CONFIG &quot;M&quot;<br>
&gt;=C2=A0 #define SIFIVE_E_PLIC_NUM_SOURCES 127<br>
&gt;=C2=A0 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7<br>
&gt; diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h=
<br>
&gt; index be13cc1304..e94eb89866 100644<br>
&gt; --- a/include/hw/riscv/sifive_u.h<br>
&gt; +++ b/include/hw/riscv/sifive_u.h<br>
&gt; @@ -63,6 +63,7 @@ enum {<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 enum {<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_U_TIMEBASE_FREQ =3D 10000000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_U_CLOCK_FREQ =3D 1000000000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_U_GEM_CLOCK_FREQ =3D 125000000<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h<br>
&gt; index 641b70da67..2d391d1559 100644<br>
&gt; --- a/include/hw/riscv/spike.h<br>
&gt; +++ b/include/hw/riscv/spike.h<br>
&gt; @@ -36,6 +36,7 @@ enum {<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 enum {<br>
&gt; +=C2=A0 =C2=A0 SPIKE_TIMEBASE_FREQ =3D 10000000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SPIKE_CLOCK_FREQ =3D 1000000000<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h<br>
&gt; index f12deaebd6..f807bbfe1e 100644<br>
&gt; --- a/include/hw/riscv/virt.h<br>
&gt; +++ b/include/hw/riscv/virt.h<br>
&gt; @@ -53,6 +53,7 @@ enum {<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 enum {<br>
&gt; +=C2=A0 =C2=A0 VIRT_TIMEBASE_FREQ =3D 10000000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VIRT_CLOCK_FREQ =3D 1000000000<br>
&gt;=C2=A0 };<br>
&gt;<br>
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
<br>
This is failing to apply for me<br>
<br>
=C2=A0 =C2=A0 Applying: target/riscv: Expose time CSRs when allowed by [m|s=
]counteren<br>
=C2=A0 =C2=A0 error: corrupt patch at line 35<br>
=C2=A0 =C2=A0 error: could not build fake ancestor<br>
=C2=A0 =C2=A0 Patch failed at 0001 target/riscv: Expose time CSRs when allo=
wed by [m|s]counteren<br>
=C2=A0 =C2=A0 hint: Use &#39;git am --show-current-patch&#39; to see the fa=
iled patch<br>
=C2=A0 =C2=A0 When you have resolved this problem, run &quot;git am --conti=
nue&quot;.<br>
=C2=A0 =C2=A0 If you prefer to skip this patch, run &quot;git am --skip&quo=
t; instead.<br>
=C2=A0 =C2=A0 To restore the original branch and stop patching, run &quot;g=
it am --abort&quot;.<br>
<br>
it appears the patch is corrupt?=C2=A0 Do you mind re-sending it based on t=
he latest<br>
master?=C2=A0 My PR just got merged.<br>
</blockquote></div>

--0000000000004b283c0589f6e58e--

