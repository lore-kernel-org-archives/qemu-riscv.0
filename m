Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lozjB-0004Ps-Hn
	for mharc-qemu-riscv@gnu.org; Thu, 03 Jun 2021 22:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lozj7-0004KJ-93; Thu, 03 Jun 2021 22:38:25 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lozj4-0007JJ-G6; Thu, 03 Jun 2021 22:38:25 -0400
Received: by mail-io1-xd34.google.com with SMTP id a8so8472565ioa.12;
 Thu, 03 Jun 2021 19:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s4L4VamFPVovmBa31FiTnLewOM5PJvF2YKuoT/8Tk7E=;
 b=MoOvysf+yMScKV0Da4BoLYJxXqbndky2TwUnv2bjmzZPAj6hP7VY9slYYCFzHC5JED
 /KKz1c5WzsJ1cz0uLEPymssk7szAWx57cqi3YAaARpdEXBYySdtRh9Ld7tHV1iMryiuC
 fgwc4F8/48X9qCpDhYocMavjulUXwDh/n/Ur9x3uUSeTCb3btU7TOxp0ip0eeIywiiTd
 pjV1G4w1SXMXgtl3M2EhjPJPbTQY9lAyJ/p+4OML2N2SHV4oSuBUr0c6gu1GGeB30NoJ
 uyNx+x9ZboN7ZVqR43zRdqXBpfWvAwPYRS92pGI+mwFhkpnZGYruXdtNcg4vYEIDzF6P
 wRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4L4VamFPVovmBa31FiTnLewOM5PJvF2YKuoT/8Tk7E=;
 b=ULU9l+4hLlhggdnnk0qpH0OG65ln9WdqD/sUuz6a40fOJLqvHcLO3qx7VyEwlNnnm6
 QXVhJHly2XEn5QsPTxDaGSMrptinV3Jwf4W2RPxOBTfo5q7+tcg8Wlw8GUiktwU8pB2M
 ICdrUDv+lJ7TQLGukujJ5SOa0F0WJqeAZbvnTT7iKK24o/NdimrGUGk4qyQaI524mVNC
 G7kUxfkagzJgGl7rFgXx9NDHKqkTmvDSYc0YZswEbP5SqkenlKUmMcVa0N1SmiGeLD6z
 oE1XtQixsOdIZAFLGyqJ60BCOfZuDREVmJSTffQXX5r7Kd8c3gLBSqDekZG8wtlK/ImZ
 BSDg==
X-Gm-Message-State: AOAM531Z2bJDPieF8qxD/Yc8GHBUHHjJMO2Fe3w3Hz5ZkZ1Gou6lTKZa
 U0sZVi85BlBnLxF9sfhqd0N3fE7Lvho/Y19f+ho=
X-Google-Smtp-Source: ABdhPJzhkLN+LVFcIjJ9jfYIiwX2NkRUl2ld/YQP/j5Kv6ryzMk4nxad/jFqQIf/2Bykhy9i6iNG8uyKAUpiLuWkYmI=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr1875600jak.91.1622774300863; 
 Thu, 03 Jun 2021 19:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <3a2dd5ce519fb1e66b539cba93750fb5cb706b1a.1622435529.git.alistair.francis@wdc.com>
 <CAEUhbmVnyTEaPjukMEuJp-cUXV_fEQGGzLfH47xkma3r3eh5RQ@mail.gmail.com>
 <CAKmqyKMXoOdnjvNDX2q3EbmLEhXa41s8fVAuWC05X+PfkeOhHg@mail.gmail.com>
 <CAEUhbmUQEoxkjoiAVxuyikdzNumDo40iZQxdTmGRS39Oc4gThQ@mail.gmail.com>
 <CAKmqyKN0D5_BXjaH+cqNfGhLiQeGAqOzRNpa=rHTF7V3bFtLgA@mail.gmail.com>
 <CAEUhbmW-8g8ZHXYxPYEOXdrF+xzYpuTsaFz2SCqDmQFtrug2cg@mail.gmail.com>
In-Reply-To: <CAEUhbmW-8g8ZHXYxPYEOXdrF+xzYpuTsaFz2SCqDmQFtrug2cg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 12:37:54 +1000
Message-ID: <CAKmqyKPPqi1nY=uc+1fbctiK3vNs6n36q56ROUxR1_C0zEAUag@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/timer: Initial commit of Ibex Timer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
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
X-List-Received-Date: Fri, 04 Jun 2021 02:38:25 -0000

On Fri, Jun 4, 2021 at 12:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jun 4, 2021 at 10:33 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Jun 4, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Jun 4, 2021 at 7:21 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Tue, Jun 1, 2021 at 11:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > On Mon, May 31, 2021 at 12:33 PM Alistair Francis
> > > > > <alistair.francis@wdc.com> wrote:
> > > > >
> > > > > Please write some commit message, for example, what is supported in
> > > > > this initial version, and what is not.
> > > >
> > > > I'll add something.
> > > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > >  include/hw/timer/ibex_timer.h |  52 ++++++
> > > > > >  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
> > > > > >  MAINTAINERS                   |   6 +-
> > > > > >  hw/timer/meson.build          |   1 +
> > > > > >  4 files changed, 360 insertions(+), 4 deletions(-)
> > > > > >  create mode 100644 include/hw/timer/ibex_timer.h
> > > > > >  create mode 100644 hw/timer/ibex_timer.c
> > > > > >
> > > > > > diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> > > > > > new file mode 100644
> > > > > > index 0000000000..6a43537003
> > > > > > --- /dev/null
> > > > > > +++ b/include/hw/timer/ibex_timer.h
> > > > > > @@ -0,0 +1,52 @@
> > > > > > +/*
> > > > > > + * QEMU lowRISC Ibex Timer device
> > > > > > + *
> > > > > > + * Copyright (c) 2021 Western Digital
> > > > > > + *
> > > > > > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > > > > > + * of this software and associated documentation files (the "Software"), to deal
> > > > > > + * in the Software without restriction, including without limitation the rights
> > > > > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > > > > > + * copies of the Software, and to permit persons to whom the Software is
> > > > > > + * furnished to do so, subject to the following conditions:
> > > > > > + *
> > > > > > + * The above copyright notice and this permission notice shall be included in
> > > > > > + * all copies or substantial portions of the Software.
> > > > > > + *
> > > > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > > > > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > > > > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > > > > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > > > > > + * THE SOFTWARE.
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef HW_IBEX_TIMER_H
> > > > > > +#define HW_IBEX_TIMER_H
> > > > > > +
> > > > > > +#include "hw/sysbus.h"
> > > > > > +
> > > > > > +#define TYPE_IBEX_TIMER "ibex-timer"
> > > > > > +OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
> > > > > > +
> > > > > > +struct IbexTimerState {
> > > > > > +    /* <private> */
> > > > > > +    SysBusDevice parent_obj;
> > > > > > +
> > > > > > +    /* <public> */
> > > > > > +    MemoryRegion mmio;
> > > > > > +
> > > > > > +    uint32_t timer_ctrl;
> > > > > > +    uint32_t timer_cfg0;
> > > > > > +    uint32_t timer_compare_lower0;
> > > > > > +    uint32_t timer_compare_upper0;
> > > > > > +    uint32_t timer_intr_enable;
> > > > > > +    uint32_t timer_intr_state;
> > > > > > +    uint32_t timer_intr_test;
> > > > > > +
> > > > > > +    uint32_t timebase_freq;
> > > > > > +
> > > > > > +    qemu_irq irq;
> > > > > > +};
> > > > > > +#endif /* HW_IBEX_TIMER_H */
> > > > > > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > > > > > new file mode 100644
> > > > > > index 0000000000..0a1030b15f
> > > > > > --- /dev/null
> > > > > > +++ b/hw/timer/ibex_timer.c
> > > > > > @@ -0,0 +1,305 @@
> > > > > > +/*
> > > > > > + * QEMU lowRISC Ibex Timer device
> > > > > > + *
> > > > > > + * Copyright (c) 2021 Western Digital
> > > > > > + *
> > > > > > + * For details check the documentation here:
> > > > > > + *    https://docs.opentitan.org/hw/ip/rv_timer/doc/
> > > > > > + *
> > > > > > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > > > > > + * of this software and associated documentation files (the "Software"), to deal
> > > > > > + * in the Software without restriction, including without limitation the rights
> > > > > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > > > > > + * copies of the Software, and to permit persons to whom the Software is
> > > > > > + * furnished to do so, subject to the following conditions:
> > > > > > + *
> > > > > > + * The above copyright notice and this permission notice shall be included in
> > > > > > + * all copies or substantial portions of the Software.
> > > > > > + *
> > > > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > > > > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > > > > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > > > > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > > > > > + * THE SOFTWARE.
> > > > > > + */
> > > > > > +
> > > > > > +#include "qemu/osdep.h"
> > > > > > +#include "qemu/log.h"
> > > > > > +#include "qemu/timer.h"
> > > > > > +#include "hw/timer/ibex_timer.h"
> > > > > > +#include "hw/irq.h"
> > > > > > +#include "hw/qdev-properties.h"
> > > > > > +#include "target/riscv/cpu.h"
> > > > > > +#include "migration/vmstate.h"
> > > > > > +
> > > > > > +REG32(CTRL, 0x00)
> > > > > > +    FIELD(CTRL, ACTIVE, 0, 1)
> > > > > > +REG32(CFG0, 0x100)
> > > > > > +    FIELD(CFG0, PRESCALE, 0, 12)
> > > > > > +    FIELD(CFG0, STEP, 16, 8)
> > > > > > +REG32(LOWER0, 0x104)
> > > > > > +REG32(UPPER0, 0x108)
> > > > > > +REG32(COMPARE_LOWER0, 0x10C)
> > > > > > +REG32(COMPARE_UPPER0, 0x110)
> > > > > > +REG32(INTR_ENABLE, 0x114)
> > > > > > +    FIELD(INTR_ENABLE, IE_0, 0, 1)
> > > > > > +REG32(INTR_STATE, 0x118)
> > > > > > +    FIELD(INTR_STATE, IS_0, 0, 1)
> > > > > > +REG32(INTR_TEST, 0x11C)
> > > > > > +    FIELD(INTR_TEST, T_0, 0, 1)
> > > > > > +
> > > > > > +static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > > > > > +{
> > > > > > +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > > > > > +                    timebase_freq, NANOSECONDS_PER_SECOND);
> > > > > > +}
> > > > > > +
> > > > > > +static void ibex_timer_update_irqs(IbexTimerState *s)
> > > > > > +{
> > > > > > +    CPUState *cs = qemu_get_cpu(0);
> > > > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > > > +    uint64_t value = s->timer_compare_lower0 |
> > > > > > +                         ((uint64_t)s->timer_compare_upper0 << 32);
> > > > > > +    uint64_t next, diff;
> > > > > > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > > > > > +
> > > > > > +    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > > > > > +        /* Timer isn't active */
> > > > > > +        return;
> > > > > > +    }
> > > > >
> > > > > I am not sure if compiler can optimize such, but this if block can be
> > > > > put at the beginning of this function.
> > > >
> > > > QEMU's style guide prefers declarations at the start of blocks, so I
> > > > think we should leave this as is.
> > > >
> > > > https://github.com/qemu/qemu/blob/master/docs/devel/style.rst#declarations
> > > >
> > > > >
> > > > > > +
> > > > > > +    /* Update the CPUs mtimecmp */
> > > > > > +    cpu->env.timecmp = value;
> > > > >
> > > > > The existing env.timecmp seems to be only valid for CLINT. Should we
> > > > > move it out of env?
> > > >
> > > > This is the CLINT equivalent for OpenTitan, so in this case it's the
> > > > correct use.
> > > >
> > > > In saying that as a future improvement it's probably good to move this
> > > > stuff out of env if we can.
> > > >
> > > > >
> > > > > > +
> > > > > > +    if (cpu->env.timecmp <= now) {
> > > > > > +        /*
> > > > > > +         * If the mtimecmp was in the past raise the interrupt now.
> > > > > > +         */
> > > > > > +        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > > > > +        if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > > > > > +            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > > > > > +            qemu_set_irq(s->irq, true);
> > > > > > +        }
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* Setup a timer to trigger the interrupt in the future */
> > > > > > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > > > > > +    qemu_set_irq(s->irq, false);
> > > > > > +
> > > > > > +    diff = cpu->env.timecmp - now;
> > > > > > +    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > > > > > +                                 muldiv64(diff,
> > > > > > +                                          NANOSECONDS_PER_SECOND,
> > > > > > +                                          s->timebase_freq);
> > > > > > +
> > > > > > +    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> > > > > > +        /* We overflowed the timer, just set it as large as we can */
> > > > > > +        timer_mod(cpu->env.timer, 0x0FFFFFFFFFFFFFFF);
> > > > >
> > > > > Should it be 0x7FFFFFFFFFFFFFFF?
> > > >
> > > > Yeah, you are right.
> > > >
> > > > >
> > > > > > +    } else {
> > > > > > +        timer_mod(cpu->env.timer, next);
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > > +static void ibex_timer_cb(void *opaque)
> > > > > > +{
> > > > > > +    IbexTimerState *s = opaque;
> > > > > > +    CPUState *cs = qemu_get_cpu(0);
> > > > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > > > +
> > > > > > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > > > > +    if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > > > > > +        s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > > > > > +        qemu_set_irq(s->irq, true);
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > > +static void ibex_timer_reset(DeviceState *dev)
> > > > > > +{
> > > > > > +    IbexTimerState *s = IBEX_TIMER(dev);
> > > > > > +
> > > > > > +    CPUState *cpu = qemu_get_cpu(0);
> > > > > > +    CPURISCVState *env = cpu->env_ptr;
> > > > > > +    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > > > > +                              &ibex_timer_cb, s);
> > > > > > +    env->timecmp = 0;
> > > > > > +
> > > > > > +    s->timer_ctrl = 0x00000000;
> > > > > > +    s->timer_cfg0 = 0x00000000;
> > > > > > +    s->timer_compare_lower0 = 0x0000003c;
> > > > > > +    s->timer_compare_upper0 = 0x00000000;
> > > > >
> > > > > The reset values seem not to conform with the spec?
> > > >
> > > > You are right! Fixed
> > > >
> > > > >
> > > > > > +    s->timer_intr_enable = 0x00000000;
> > > > > > +    s->timer_intr_state = 0x00000000;
> > > > > > +    s->timer_intr_test = 0x00000000;
> > > > > > +
> > > > > > +    ibex_timer_update_irqs(s);
> > > > > > +}
> > > > > > +
> > > > > > +static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
> > > > > > +                                       unsigned int size)
> > > > > > +{
> > > > > > +    IbexTimerState *s = opaque;
> > > > > > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > > > > > +    uint64_t retvalue = 0;
> > > > > > +
> > > > > > +    switch (addr >> 2) {
> > > > > > +    case R_CTRL:
> > > > > > +        retvalue = s->timer_ctrl;
> > > > > > +        break;
> > > > > > +    case R_CFG0:
> > > > > > +        retvalue = s->timer_cfg0;
> > > > > > +        break;
> > > > > > +    case R_LOWER0:
> > > > > > +        retvalue = now;
> > > > > > +        break;
> > > > > > +    case R_UPPER0:
> > > > > > +        retvalue = now >> 32;
> > > > > > +        break;
> > > > > > +    case R_COMPARE_LOWER0:
> > > > > > +        retvalue = s->timer_compare_lower0;
> > > > > > +        break;
> > > > > > +    case R_COMPARE_UPPER0:
> > > > > > +        retvalue = s->timer_compare_upper0;
> > > > > > +        break;
> > > > > > +    case R_INTR_ENABLE:
> > > > > > +        retvalue = s->timer_intr_enable;
> > > > > > +        break;
> > > > > > +    case R_INTR_STATE:
> > > > > > +        retvalue = s->timer_intr_state;
> > > > > > +        break;
> > > > > > +    case R_INTR_TEST:
> > > > > > +        retvalue = s->timer_intr_test;
> > > > > > +        break;
> > > > > > +    default:
> > > > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > > > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> > > > > > +        return 0;
> > > > > > +    }
> > > > > > +
> > > > > > +    return retvalue;
> > > > > > +}
> > > > > > +
> > > > > > +static void ibex_timer_write(void *opaque, hwaddr addr,
> > > > > > +                             uint64_t val64, unsigned int size)
> > > > > > +{
> > > > > > +    IbexTimerState *s = opaque;
> > > > > > +    uint32_t val = val64;
> > > > > > +
> > > > > > +    switch (addr >> 2) {
> > > > > > +    case R_CTRL:
> > > > > > +        s->timer_ctrl = val;
> > > > > > +        break;
> > > > > > +    case R_CFG0:
> > > > > > +        qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
> > > > > > +        s->timer_cfg0 = val;
> > > > > > +        break;
> > > > > > +    case R_LOWER0:
> > > > > > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > > > > > +        break;
> > > > > > +    case R_UPPER0:
> > > > > > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > > > > > +        break;
> > > > > > +    case R_COMPARE_LOWER0:
> > > > > > +        s->timer_compare_lower0 = val;
> > > > > > +        ibex_timer_update_irqs(s);
> > > > > > +        break;
> > > > > > +    case R_COMPARE_UPPER0:
> > > > > > +        s->timer_compare_upper0 = val;
> > > > > > +        ibex_timer_update_irqs(s);
> > > > > > +        break;
> > > > > > +    case R_INTR_ENABLE:
> > > > > > +        s->timer_intr_enable = val;
> > > > >
> > > > > Does this register connect to MIE?
> > > >
> > > > No, it's a little confusing.
> > > >
> > > > The timer is connected to MIE AND it also has its own interrupt. This
> > > > controls it's custom interrupt.
> > > >
> > >
> > > I don't see codes to connect this to MIE, so in this version we only
> > > support connecting interrupt to PLIC?
> >
> > We call `riscv_cpu_update_mip()` which updates the bits in MIP.
> >
>
> I think that's for MIP, not MIE?

Yep. Sorry I misinterpreted what your first email meant.

R_INTR_ENABLE does not connect to MIE.

R_INTR_ENABLE is to enable or disable the PLIC interrupt line. The
timer will also trigger MIP (MIE is then controlled via teh CSR
access).

Alistair

>
> Regards,
> Bin

