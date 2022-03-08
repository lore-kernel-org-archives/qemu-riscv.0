Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRhRy-0003bo-9y
	for mharc-qemu-riscv@gnu.org; Tue, 08 Mar 2022 16:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRhRt-0003ZI-OE; Tue, 08 Mar 2022 16:32:54 -0500
Received: from [2607:f8b0:4864:20::d31] (port=37724
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRhRr-00008s-On; Tue, 08 Mar 2022 16:32:53 -0500
Received: by mail-io1-xd31.google.com with SMTP id c23so605198ioi.4;
 Tue, 08 Mar 2022 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zT+FWsTPdj5fVI6/NkialtamJcWiR6sBvK3DkbhNn7k=;
 b=XzeXiGmcpTPP0hK6nbnYSoRLajadjiRz+AeeCjcMc+828m1EV8Ss9efSzbGxmAxMSH
 QOIsyHj0qHcmRGWyAcxGCZJR1ALhDSIV3/avRzLTRnxbMGCYfx/OiFxJiSjdcMWGNRXs
 aeg4U7m+fS3H9SES74hLPSeN2cY7l0xhjtGYCrGZrA+CQ7Md0Q4OWEKo0WGAsk0g62ty
 9GB5AFbk695BbMK1eGied0NOa2MPt/thYyhkQapPBITpXSnnU4NL6yb8aHxGG3p3PvWD
 JBw20dJQQbP766eim9kNd+46nymtlR/dnUjzkQFwq+E2xNJUpXDMfbV+/1w3CT5xJppY
 Ueqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zT+FWsTPdj5fVI6/NkialtamJcWiR6sBvK3DkbhNn7k=;
 b=gZOnTqOQYVBoTwPw868N1tNlZCcMgXTm9IZ1ne57T32G95jb5fmYUPsfawtK+GxIDy
 5ayYDni8+JA2qq0NUBeyRQ1XAUwRofIt3naNzx3nx1uCzSdWayID+7Onsq7ZWmRYAo1D
 pGqWE6gWO+Igth7yWn6Hhl5eBQM6LkDmZj7QG9KgmeqIp34r3OUdc7jZtXvzpSuTmauD
 LZ/m83a9YiBUtLXOt0a7oWHghRt0JOJIQY2GRYbhqDtzKN48VZfBIj1/PVDHIBqSmnFv
 oxDTh24IvdUlXnUWFnzka7I4GgT7gP0A+X02qY2mQCrahJxPRsIMloYpLmFjFIRYThCN
 V0Fg==
X-Gm-Message-State: AOAM531+VqiOGP9M4t1z63XBN0uhdY4E88xJCOZc9paSTRl7w0EMlp8t
 2fsfQe8u4vJOsU9nQsjPKxQJy94pq+ZHakEU1QM=
X-Google-Smtp-Source: ABdhPJyzzU3y/eOiLg2SH3guhGWenAIjlClXlOafRV8qYyLlXZUgkECwfwajbiwYePhE8G7qUyadj88+90ia1LqFb7w=
X-Received: by 2002:a02:a1dd:0:b0:317:b0c9:254b with SMTP id
 o29-20020a02a1dd000000b00317b0c9254bmr13204207jah.68.1646775170162; Tue, 08
 Mar 2022 13:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20220304032023.730344-1-atishp@rivosinc.com>
 <20220304032023.730344-2-atishp@rivosinc.com>
 <CAAhSdy2W4aDauH50zS_BNaeghTsDNVMsYHQtkaeydz5Ob-O_SQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2W4aDauH50zS_BNaeghTsDNVMsYHQtkaeydz5Ob-O_SQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Mar 2022 07:32:24 +1000
Message-ID: <CAKmqyKOLh4bHdRiTj6oMZR36+Wo4mLhEw=8G5US-NUobjWdhCw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/riscv: Rename timer & timecmp to mtimer
 and mtimecmp
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 08 Mar 2022 21:32:55 -0000

On Fri, Mar 4, 2022 at 2:08 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Mar 4, 2022 at 8:50 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Currently, the aclint and ibex timer devices uses the "timer" &
> > "timecmp" to generate the m-mode timer interrupt. In future,
> > we will have timer interrupt injected to S/VS mode directly.
> > No functionality change introduced in this patch.
>
> s/have timer/have a timer/
>
> >
> > Add a prefix "m" these enviornment variables to indicate its
> > true purpose.
>
> s/enviornment/environment/
>
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> I suggest we should remove mtimecmp and mtimer from
> target/riscv because mtimer is a memory mapped device.

I agree. I guess this is in the CPU as it's per hart, and it's easy to
store here instead of in the timer, but we could convert aclint to use
an array of timers (Ibex only ever has one hart).

That would probably be a closer match to hardware, as the timer is
external to the CPU

Alistair

>
> Regards,
> Anup
>
> > ---
> >  hw/intc/riscv_aclint.c | 20 ++++++++++----------
> >  hw/timer/ibex_timer.c  | 14 +++++++-------
> >  target/riscv/cpu.h     |  4 ++--
> >  target/riscv/machine.c |  2 +-
> >  4 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > index f1a5d3d284fd..642794a06865 100644
> > --- a/hw/intc/riscv_aclint.c
> > +++ b/hw/intc/riscv_aclint.c
> > @@ -59,8 +59,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >
> >      uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> >
> > -    cpu->env.timecmp = value;
> > -    if (cpu->env.timecmp <= rtc_r) {
> > +    cpu->env.mtimecmp = value;
> > +    if (cpu->env.mtimecmp <= rtc_r) {
> >          /*
> >           * If we're setting an MTIMECMP value in the "past",
> >           * immediately raise the timer interrupt
> > @@ -71,7 +71,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >
> >      /* otherwise, set up the future timer interrupt */
> >      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> > -    diff = cpu->env.timecmp - rtc_r;
> > +    diff = cpu->env.mtimecmp - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> >      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> >
> > @@ -96,7 +96,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >          next = MIN(next, INT64_MAX);
> >      }
> >
> > -    timer_mod(cpu->env.timer, next);
> > +    timer_mod(cpu->env.mtimer, next);
> >  }
> >
> >  /*
> > @@ -127,11 +127,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
> >                            "aclint-mtimer: invalid hartid: %zu", hartid);
> >          } else if ((addr & 0x7) == 0) {
> >              /* timecmp_lo */
> > -            uint64_t timecmp = env->timecmp;
> > +            uint64_t timecmp = env->mtimecmp;
> >              return timecmp & 0xFFFFFFFF;
> >          } else if ((addr & 0x7) == 4) {
> >              /* timecmp_hi */
> > -            uint64_t timecmp = env->timecmp;
> > +            uint64_t timecmp = env->mtimecmp;
> >              return (timecmp >> 32) & 0xFFFFFFFF;
> >          } else {
> >              qemu_log_mask(LOG_UNIMP,
> > @@ -168,14 +168,14 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> >                            "aclint-mtimer: invalid hartid: %zu", hartid);
> >          } else if ((addr & 0x7) == 0) {
> >              /* timecmp_lo */
> > -            uint64_t timecmp_hi = env->timecmp >> 32;
> > +            uint64_t timecmp_hi = env->mtimecmp >> 32;
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> >                  timecmp_hi << 32 | (value & 0xFFFFFFFF),
> >                  mtimer->timebase_freq);
> >              return;
> >          } else if ((addr & 0x7) == 4) {
> >              /* timecmp_hi */
> > -            uint64_t timecmp_lo = env->timecmp;
> > +            uint64_t timecmp_lo = env->mtimecmp;
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> >                  value << 32 | (timecmp_lo & 0xFFFFFFFF),
> >                  mtimer->timebase_freq);
> > @@ -304,9 +304,9 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
> >
> >          cb->s = RISCV_ACLINT_MTIMER(dev);
> >          cb->num = i;
> > -        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +        env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                    &riscv_aclint_mtimer_cb, cb);
> > -        env->timecmp = 0;
> > +        env->mtimecmp = 0;
> >
> >          qdev_connect_gpio_out(dev, i,
> >                                qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > index 8c2ca364daab..4c34f9e08282 100644
> > --- a/hw/timer/ibex_timer.c
> > +++ b/hw/timer/ibex_timer.c
> > @@ -73,9 +73,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >      }
> >
> >      /* Update the CPUs mtimecmp */
> > -    cpu->env.timecmp = value;
> > +    cpu->env.mtimecmp = value;
> >
> > -    if (cpu->env.timecmp <= now) {
> > +    if (cpu->env.mtimecmp <= now) {
> >          /*
> >           * If the mtimecmp was in the past raise the interrupt now.
> >           */
> > @@ -91,7 +91,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >      qemu_irq_lower(s->m_timer_irq);
> >      qemu_set_irq(s->irq, false);
> >
> > -    diff = cpu->env.timecmp - now;
> > +    diff = cpu->env.mtimecmp - now;
> >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> >                                   muldiv64(diff,
> >                                            NANOSECONDS_PER_SECOND,
> > @@ -99,9 +99,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >
> >      if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> >          /* We overflowed the timer, just set it as large as we can */
> > -        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
> > +        timer_mod(cpu->env.mtimer, 0x7FFFFFFFFFFFFFFF);
> >      } else {
> > -        timer_mod(cpu->env.timer, next);
> > +        timer_mod(cpu->env.mtimer, next);
> >      }
> >  }
> >
> > @@ -122,9 +122,9 @@ static void ibex_timer_reset(DeviceState *dev)
> >
> >      CPUState *cpu = qemu_get_cpu(0);
> >      CPURISCVState *env = cpu->env_ptr;
> > -    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +    env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                &ibex_timer_cb, s);
> > -    env->timecmp = 0;
> > +    env->mtimecmp = 0;
> >
> >      s->timer_ctrl = 0x00000000;
> >      s->timer_cfg0 = 0x00010000;
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 5d914bd34550..94234c59ffa8 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -265,7 +265,7 @@ struct CPURISCVState {
> >      /* temporary htif regs */
> >      uint64_t mfromhost;
> >      uint64_t mtohost;
> > -    uint64_t timecmp;
> > +    uint64_t mtimecmp;
> >
> >      /* physical memory protection */
> >      pmp_table_t pmp_state;
> > @@ -316,7 +316,7 @@ struct CPURISCVState {
> >      float_status fp_status;
> >
> >      /* Fields from here on are preserved across CPU reset. */
> > -    QEMUTimer *timer; /* Internal timer */
> > +    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
> >
> >      hwaddr kernel_addr;
> >      hwaddr fdt_addr;
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index ebc33c9e2781..be3022082a46 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -303,7 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> >          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> > +        VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
> >
> >          VMSTATE_END_OF_LIST()
> >      },
> > --
> > 2.30.2
> >
> >
>

