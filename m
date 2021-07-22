Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m6m0V-0004Dj-4e
	for mharc-qemu-riscv@gnu.org; Thu, 22 Jul 2021 23:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m6m0T-0004CF-EY
 for qemu-riscv@nongnu.org; Thu, 22 Jul 2021 23:37:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m6m0R-00082q-Bo
 for qemu-riscv@nongnu.org; Thu, 22 Jul 2021 23:37:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e2so808130wrq.6
 for <qemu-riscv@nongnu.org>; Thu, 22 Jul 2021 20:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1VgRKwgeIyCsVpbdoyW+mMK5yP/IHPHBH8FJzXnoAY=;
 b=NeK4JoczZWJEe9wC+e5xXo4zvZbXk6y2AF3Nnrz3gzlaRhyfusbSNxS9WCIY3FwlEg
 5jhg7LSpqQU85Pj1AiiWVO11tbVN7DbLnA2pgsU98phDXglrQUKaeK4fzogIhdanYLB1
 ud7YIwIOMM6mzeEE6GtE2dYqjeHpQQNVAi9aHYUzub5o08PjjMrJgMO0VmNKhQNlYUOT
 IV1odLoYnlG/cw70WEz8JDkMCcsUqCQgQyu6CVTllR5N4vLzfJJe80hQWFn53LiqElyJ
 FtwTxbLaKLQiU84dTt9mkmW08nRBAfxIefcG9av0OHDv/q2m6gcY0pGJKmZtNi2UODH5
 O6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1VgRKwgeIyCsVpbdoyW+mMK5yP/IHPHBH8FJzXnoAY=;
 b=p0gw0vJG1ff1shZ17nNvXyl6K6FodApHaW8b+qiwieuXNt6k32GCVVgTD0kFzSB1AR
 MCsVyy5hiOtBuJImybhaxSnS+vMpzSaMkUT7jYb1/rzMaOcQQA2SyF3SEk0Um0Po2YvN
 YuKg7HxATYFDZ1UNqRr1Waf2qEi+vc/TAh9to7zSzn46szy13VWMyWLaP8HjDB3BqyJ7
 huyf+AnqXYTVu6ZBvRVs/bE5ExmTKJr1TGcNlFofqfGOubxiZZN6I8L218TaHcX+DyJp
 OW1ys/73Kl06ti4eF2UHzvclaqiZFr3qadS61019n3RzDlsg8zw5dkoTzOUwcfSYgzt/
 iY2g==
X-Gm-Message-State: AOAM533OSsNn5OynHbb/MTn02rOnxSXiKqoyUOrPoa2inEZUVUwIz9wN
 u4LmXwCRlpMdK77bnhKmST6pSsEHm5XSVel8l3cI3w==
X-Google-Smtp-Source: ABdhPJykTMWIJR65zwI2geHIutj1k2FnplSD0B3X7CL81kdY9WgWhVu1W5SDZuujVx34KaUaf7nnHmRh2VexvY2p6yM=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr2837862wry.128.1627011464934; 
 Thu, 22 Jul 2021 20:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
 <CAAhSdy3w7NbJLjUd3V2i98a4e3V9TKzQHic8inz1TERXMmW4+A@mail.gmail.com>
 <CAKmqyKOvS7hvYk3OHSkh97SDWkoRrTdMhf=Qvi8qsDdifm7q1w@mail.gmail.com>
In-Reply-To: <CAKmqyKOvS7hvYk3OHSkh97SDWkoRrTdMhf=Qvi8qsDdifm7q1w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Jul 2021 17:45:01 +0530
Message-ID: <CAAhSdy1gmXUTP-A+nUEiV=C9cb7EOBh1WsUw17azyQyyohL1xQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 23 Jul 2021 03:37:49 -0000

On Wed, Jul 14, 2021 at 11:41 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jul 13, 2021 at 2:06 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Jul 9, 2021 at 9:01 AM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> > > CPU GPIO lines to set the timer and soft MIP bits.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  include/hw/intc/sifive_clint.h |  2 +
> > >  hw/intc/sifive_clint.c         | 72 ++++++++++++++++++++++++----------
> > >  2 files changed, 54 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
> > > index a30be0f3d6..921b1561dd 100644
> > > --- a/include/hw/intc/sifive_clint.h
> > > +++ b/include/hw/intc/sifive_clint.h
> > > @@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
> > >      uint32_t time_base;
> > >      uint32_t aperture_size;
> > >      uint32_t timebase_freq;
> > > +    qemu_irq *timer_irqs;
> > > +    qemu_irq *soft_irqs;
> > >  } SiFiveCLINTState;
> > >
> > >  DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> > > diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> > > index 0f41e5ea1c..c635a47507 100644
> > > --- a/hw/intc/sifive_clint.c
> > > +++ b/hw/intc/sifive_clint.c
> > > @@ -28,6 +28,12 @@
> > >  #include "hw/qdev-properties.h"
> > >  #include "hw/intc/sifive_clint.h"
> > >  #include "qemu/timer.h"
> > > +#include "hw/irq.h"
> > > +
> > > +typedef struct sifive_clint_callback {
> > > +    SiFiveCLINTState *s;
> > > +    int num;
> > > +} sifive_clint_callback;
> > >
> > >  static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > >  {
> > > @@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > >   * Called when timecmp is written to update the QEMU timer or immediately
> > >   * trigger timer interrupt if mtimecmp <= current timer value.
> > >   */
> > > -static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > > +static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
> > > +                                       int hartid,
> > > +                                       uint64_t value,
> > >                                         uint32_t timebase_freq)
> > >  {
> > >      uint64_t next;
> > > @@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > >      if (cpu->env.timecmp <= rtc_r) {
> > >          /* if we're setting an MTIMECMP value in the "past",
> > >             immediately raise the timer interrupt */
> > > -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > +        qemu_irq_raise(s->timer_irqs[hartid]);
> >
> > This breaks multi-socket support.
> >
> > Please use "hartid - s->hartid_base" as an index.
> >
> > >          return;
> > >      }
> > >
> > >      /* otherwise, set up the future timer interrupt */
> > > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > > +    qemu_irq_lower(s->timer_irqs[hartid]);
> > >      diff = cpu->env.timecmp - rtc_r;
> > >      /* back to ns (note args switched in muldiv64) */
> > >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > > @@ -70,8 +78,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > >   */
> > >  static void sifive_clint_timer_cb(void *opaque)
> > >  {
> > > -    RISCVCPU *cpu = opaque;
> > > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > +    sifive_clint_callback *state = opaque;
> > > +
> > > +    qemu_irq_raise(state->s->timer_irqs[state->num]);
> > >  }
> > >
> > >  /* CPU wants to read rtc or timecmp register */
> > > @@ -137,7 +146,11 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
> > >          if (!env) {
> > >              error_report("clint: invalid timecmp hartid: %zu", hartid);
> > >          } else if ((addr & 0x3) == 0) {
> > > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> > > +            if (value) {
> > > +                qemu_irq_raise(clint->soft_irqs[hartid]);
> > > +            } else {
> > > +                qemu_irq_lower(clint->soft_irqs[hartid]);
> > > +            }
> >
> > Eventthis is broken for multi-socket.
> >
> > Use "hartid - clint->hartid_base" as index.
>
> Thanks for testing this. I have fixed this and will send a v2. I also
> added multi-socket tests to my automated tests.

Thanks, I will rebase the ACLINT series on your v2 series.

Regards,
Anup

>
> Alistair
>
> >
> > >          } else {
> > >              error_report("clint: invalid sip write: %08x", (uint32_t)addr);
> > >          }
> > > @@ -153,13 +166,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
> > >          } else if ((addr & 0x7) == 0) {
> > >              /* timecmp_lo */
> > >              uint64_t timecmp_hi = env->timecmp >> 32;
> > > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > > +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
> > >                  timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
> > >              return;
> > >          } else if ((addr & 0x7) == 4) {
> > >              /* timecmp_hi */
> > >              uint64_t timecmp_lo = env->timecmp;
> > > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > > +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
> > >                  value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
> > >          } else {
> > >              error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
> > > @@ -205,6 +218,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
> > >      memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
> > >                            TYPE_SIFIVE_CLINT, s->aperture_size);
> > >      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > > +
> > > +    s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> > > +    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
> > > +
> > > +    s->soft_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> > > +    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
> > >  }
> > >
> > >  static void sifive_clint_class_init(ObjectClass *klass, void *data)
> > > @@ -228,7 +247,6 @@ static void sifive_clint_register_types(void)
> > >
> > >  type_init(sifive_clint_register_types)
> > >
> > > -
> > >  /*
> > >   * Create CLINT device.
> > >   */
> > > @@ -238,29 +256,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> > >      bool provide_rdtime)
> > >  {
> > >      int i;
> > > +
> > > +    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> > > +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > > +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > > +    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> > > +    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> > > +    qdev_prop_set_uint32(dev, "time-base", time_base);
> > > +    qdev_prop_set_uint32(dev, "aperture-size", size);
> > > +    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > > +
> > >      for (i = 0; i < num_harts; i++) {
> > >          CPUState *cpu = qemu_get_cpu(hartid_base + i);
> > > +        RISCVCPU *rvcpu = RISCV_CPU(cpu);
> > >          CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > > +        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
> > > +
> > >          if (!env) {
> > > +            g_free(cb);
> > >              continue;
> > >          }
> > >          if (provide_rdtime) {
> > >              riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> > >          }
> > > +
> > > +        cb->s = SIFIVE_CLINT(dev);
> > > +        cb->num = i;
> > >          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > -                                  &sifive_clint_timer_cb, cpu);
> > > +                                  &sifive_clint_timer_cb, cb);
> > >          env->timecmp = 0;
> > > +
> > > +        qdev_connect_gpio_out_named(dev, NULL, i,
> > > +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> > > +        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
> > > +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
> > >      }
> > >
> > > -    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> > > -    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > > -    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > > -    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> > > -    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> > > -    qdev_prop_set_uint32(dev, "time-base", time_base);
> > > -    qdev_prop_set_uint32(dev, "aperture-size", size);
> > > -    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > > -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > >      return dev;
> > >  }
> > > --
> > > 2.31.1
> > >
> > >
> >
> > Regards,
> > Anup

