Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3Y7M-0008D6-4Z
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 02:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3Y7K-00089e-30; Wed, 14 Jul 2021 02:11:34 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3Y7I-00075k-30; Wed, 14 Jul 2021 02:11:33 -0400
Received: by mail-io1-xd34.google.com with SMTP id z11so720113iow.0;
 Tue, 13 Jul 2021 23:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VS0VL0sqQNRiNw1MxUGsjZ9fId/m1jO+TNUMBxlvLfM=;
 b=qr1Y1Y5wmCq7mQl4CcmGFxvh+G90L6vfs12KnLL//g7g5GQ3kLqnNdtYWwwcDK75iG
 dq/5LB2n5XIpdE2mTJShH153rVkcwZ9MzpatD2NgGHI2QMKyiq/q1WkI/RhvXRrwTulu
 bScqdyJ+zoJDwS3ANX4eXCxlC+O922+gO8cCAS2v8Jo4WSnj+J+qroFs5UDnkM5TOqb7
 lP4O2SmV6WTZRTbVaCLBQKCRuSnXXD9cwLl3yvIXvt0WgpLMQV5orISSTPrM+iJrAiUb
 uETteiVVTqxLWA8Z2Scev6j70AGpo0S6fNtjU5cPFaJFEd1gHFVJFGrJlkuOHIU7rp4Z
 PcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS0VL0sqQNRiNw1MxUGsjZ9fId/m1jO+TNUMBxlvLfM=;
 b=bBAdLhsRh3op1YWc5J8oaIfhjYWpFfhziz0fK5xAwm1ZEd9sYs6iwSMeiQD2BWE+5R
 vQDw9sl1WmugH6bQvXFGpzVacKbsu5cITslV/ajpJ6DG5b2irkaSPy6H0sJ/zjjaVZq3
 8neWIXqmqp34by8YiafpVXtPu2ITEZyTHNOrgWbPmItOX4iVJJf9P1/mDg7H2z0561mV
 4WF/40wU8Of6cisxGDkaWUlMpnO+5Uum545rGsaClB8aTiyM500/x0XbPoIsQdUqHwUh
 4TAz8wbLCXBhxuNHokW+RNgYUNrO3K3wd02RIpVibhAdn9FT4swa/WXTdR/48UOWE2DF
 Zoug==
X-Gm-Message-State: AOAM533VpoFk69C0n7MoLrnhyrF1QOZrUyJ8MWKrg+vIdR5SJs8+btnY
 E/VTa7QxkxY5ByxFvdPDbEn1Yuw50uV5ycUO1cY=
X-Google-Smtp-Source: ABdhPJxyt12uE07DWEuIS69qkl0bALf6+5/pNa100fbELQiVESYPxIAnq8hg5DT3n3KwU43NTfhIIJkwCPFuF+JEA5M=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr6200840iob.176.1626243089892; 
 Tue, 13 Jul 2021 23:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
 <CAAhSdy3w7NbJLjUd3V2i98a4e3V9TKzQHic8inz1TERXMmW4+A@mail.gmail.com>
In-Reply-To: <CAAhSdy3w7NbJLjUd3V2i98a4e3V9TKzQHic8inz1TERXMmW4+A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 14 Jul 2021 16:11:03 +1000
Message-ID: <CAKmqyKOvS7hvYk3OHSkh97SDWkoRrTdMhf=Qvi8qsDdifm7q1w@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Anup Patel <anup@brainfault.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 14 Jul 2021 06:11:34 -0000

On Tue, Jul 13, 2021 at 2:06 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jul 9, 2021 at 9:01 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> > CPU GPIO lines to set the timer and soft MIP bits.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/intc/sifive_clint.h |  2 +
> >  hw/intc/sifive_clint.c         | 72 ++++++++++++++++++++++++----------
> >  2 files changed, 54 insertions(+), 20 deletions(-)
> >
> > diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
> > index a30be0f3d6..921b1561dd 100644
> > --- a/include/hw/intc/sifive_clint.h
> > +++ b/include/hw/intc/sifive_clint.h
> > @@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
> >      uint32_t time_base;
> >      uint32_t aperture_size;
> >      uint32_t timebase_freq;
> > +    qemu_irq *timer_irqs;
> > +    qemu_irq *soft_irqs;
> >  } SiFiveCLINTState;
> >
> >  DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> > diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> > index 0f41e5ea1c..c635a47507 100644
> > --- a/hw/intc/sifive_clint.c
> > +++ b/hw/intc/sifive_clint.c
> > @@ -28,6 +28,12 @@
> >  #include "hw/qdev-properties.h"
> >  #include "hw/intc/sifive_clint.h"
> >  #include "qemu/timer.h"
> > +#include "hw/irq.h"
> > +
> > +typedef struct sifive_clint_callback {
> > +    SiFiveCLINTState *s;
> > +    int num;
> > +} sifive_clint_callback;
> >
> >  static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> >  {
> > @@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> >   * Called when timecmp is written to update the QEMU timer or immediately
> >   * trigger timer interrupt if mtimecmp <= current timer value.
> >   */
> > -static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > +static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
> > +                                       int hartid,
> > +                                       uint64_t value,
> >                                         uint32_t timebase_freq)
> >  {
> >      uint64_t next;
> > @@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> >      if (cpu->env.timecmp <= rtc_r) {
> >          /* if we're setting an MTIMECMP value in the "past",
> >             immediately raise the timer interrupt */
> > -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +        qemu_irq_raise(s->timer_irqs[hartid]);
>
> This breaks multi-socket support.
>
> Please use "hartid - s->hartid_base" as an index.
>
> >          return;
> >      }
> >
> >      /* otherwise, set up the future timer interrupt */
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > +    qemu_irq_lower(s->timer_irqs[hartid]);
> >      diff = cpu->env.timecmp - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > @@ -70,8 +78,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> >   */
> >  static void sifive_clint_timer_cb(void *opaque)
> >  {
> > -    RISCVCPU *cpu = opaque;
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +    sifive_clint_callback *state = opaque;
> > +
> > +    qemu_irq_raise(state->s->timer_irqs[state->num]);
> >  }
> >
> >  /* CPU wants to read rtc or timecmp register */
> > @@ -137,7 +146,11 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
> >          if (!env) {
> >              error_report("clint: invalid timecmp hartid: %zu", hartid);
> >          } else if ((addr & 0x3) == 0) {
> > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> > +            if (value) {
> > +                qemu_irq_raise(clint->soft_irqs[hartid]);
> > +            } else {
> > +                qemu_irq_lower(clint->soft_irqs[hartid]);
> > +            }
>
> Eventthis is broken for multi-socket.
>
> Use "hartid - clint->hartid_base" as index.

Thanks for testing this. I have fixed this and will send a v2. I also
added multi-socket tests to my automated tests.

Alistair

>
> >          } else {
> >              error_report("clint: invalid sip write: %08x", (uint32_t)addr);
> >          }
> > @@ -153,13 +166,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
> >          } else if ((addr & 0x7) == 0) {
> >              /* timecmp_lo */
> >              uint64_t timecmp_hi = env->timecmp >> 32;
> > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
> >                  timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
> >              return;
> >          } else if ((addr & 0x7) == 4) {
> >              /* timecmp_hi */
> >              uint64_t timecmp_lo = env->timecmp;
> > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
> >                  value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
> >          } else {
> >              error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
> > @@ -205,6 +218,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
> >      memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
> >                            TYPE_SIFIVE_CLINT, s->aperture_size);
> >      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > +
> > +    s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> > +    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
> > +
> > +    s->soft_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> > +    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
> >  }
> >
> >  static void sifive_clint_class_init(ObjectClass *klass, void *data)
> > @@ -228,7 +247,6 @@ static void sifive_clint_register_types(void)
> >
> >  type_init(sifive_clint_register_types)
> >
> > -
> >  /*
> >   * Create CLINT device.
> >   */
> > @@ -238,29 +256,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> >      bool provide_rdtime)
> >  {
> >      int i;
> > +
> > +    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> > +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > +    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> > +    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> > +    qdev_prop_set_uint32(dev, "time-base", time_base);
> > +    qdev_prop_set_uint32(dev, "aperture-size", size);
> > +    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > +
> >      for (i = 0; i < num_harts; i++) {
> >          CPUState *cpu = qemu_get_cpu(hartid_base + i);
> > +        RISCVCPU *rvcpu = RISCV_CPU(cpu);
> >          CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
> > +
> >          if (!env) {
> > +            g_free(cb);
> >              continue;
> >          }
> >          if (provide_rdtime) {
> >              riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> >          }
> > +
> > +        cb->s = SIFIVE_CLINT(dev);
> > +        cb->num = i;
> >          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > -                                  &sifive_clint_timer_cb, cpu);
> > +                                  &sifive_clint_timer_cb, cb);
> >          env->timecmp = 0;
> > +
> > +        qdev_connect_gpio_out_named(dev, NULL, i,
> > +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> > +        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
> > +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
> >      }
> >
> > -    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> > -    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > -    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > -    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> > -    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> > -    qdev_prop_set_uint32(dev, "time-base", time_base);
> > -    qdev_prop_set_uint32(dev, "aperture-size", size);
> > -    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> >      return dev;
> >  }
> > --
> > 2.31.1
> >
> >
>
> Regards,
> Anup

