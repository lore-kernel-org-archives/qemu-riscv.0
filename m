Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTfG-0006FQ-Ip
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTfE-0006Dp-SU; Thu, 10 Jun 2021 19:00:40 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:37683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTfC-0006gJ-NF; Thu, 10 Jun 2021 19:00:40 -0400
Received: by mail-io1-xd2b.google.com with SMTP id q7so28911608iob.4;
 Thu, 10 Jun 2021 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLmqkM/tXXG8lfAdHxwjNh587j+q3n8Fuu3VA4KPApw=;
 b=XfbzK5fAtFDf8AT4Nfecuu0jZez17B+lWuF844Ck32RPScDIShxVCaGvaUK5ay3RWP
 zO/KvTmIPG5jtXelqJLVrNsr0xvb5A++txfXTXCzhAfmzhGufretggQBKH2VjAmchVF5
 y+C3jHHW/y8SUaMKDnT9cq4pwpgyDkAFZ0ozFLmZ0htUQT200uqqcvVnrBEaQHk+GM15
 EJbk83IaVKSUCQ0E7950TuOHlSH7DmNS03SPl7nzvy4RGbYOOUd7kiYTxuoQeAMPmffu
 MFsEqTb3InTQHKoUegWBBvIuIM/Y56efqetJ+RxrnqjOd2/U+p8v0OtpyllJTBqEzcBe
 eLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLmqkM/tXXG8lfAdHxwjNh587j+q3n8Fuu3VA4KPApw=;
 b=iAlAqfIThgX5qOXn9GxpSVk4vgDbdO+vBTRBCr/Py4bhKLyoAgYf0GZFnTIgtICQsZ
 tZ444oVFPY1ptToeuQklpqTob05/8DAqkCBKDQixXyzu67oSISp1u3h11rI5I6ODwjB7
 HNwjWxuCgzooQnbjwiqfSdT8xqJuR8jeg3wBhH/oZE52TLNXhJmp9Q1YeZ52XyQIuXjk
 X21mlcdnZdQrlS6gLDoDgSLdyWx9ecca3jq3weLoMpb2XVbH0DD3hTaf5DYQeaPmrWbE
 +4PlPwvvComWb58PMKxMUeE9yjOEJkHw7Xz7QQm8jcdEUMIKqQ6+GzL9aATtQM/NCbgN
 GL1Q==
X-Gm-Message-State: AOAM531wLOz70AEhNModtJDKOnQ2lYQkHFvrhrj+eQQZKb+WMx9w+Sk6
 9EMnDYkpUJeFXqJB1PWQE1KsYNyokdLK1uSqWYw=
X-Google-Smtp-Source: ABdhPJyn/3iEMvZcfCB1t2UgaWQ13KzZtqCBiZSWyCUG2X+m7nBZjh6Ur6k7Zd/NGyDFzpZyI+nMjeVhdEOouhk0OIQ=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr722567iov.42.1623366037334; 
 Thu, 10 Jun 2021 16:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623196022.git.alistair.francis@wdc.com>
 <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
 <CAEUhbmVTNB4KZ+H096gOQxptnYDkUY7A4TvsGqHf9h8xBRw-SA@mail.gmail.com>
In-Reply-To: <CAEUhbmVTNB4KZ+H096gOQxptnYDkUY7A4TvsGqHf9h8xBRw-SA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:00:10 +1000
Message-ID: <CAKmqyKODioH-7nLup_nLV4u2M_8FtnGA6p4w-aBQYBSY8gSyCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/timer: Initial commit of Ibex Timer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:00:41 -0000

On Wed, Jun 9, 2021 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jun 9, 2021 at 7:49 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Add support for the Ibex timer. This is used with the RISC-V
> > mtime/mtimecmp similar to the SiFive CLINT.
> >
> > We currently don't support changing the prescale or the timervalue.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/timer/ibex_timer.h |  52 ++++++
> >  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
> >  MAINTAINERS                   |   6 +-
> >  hw/timer/meson.build          |   1 +
> >  4 files changed, 360 insertions(+), 4 deletions(-)
> >  create mode 100644 include/hw/timer/ibex_timer.h
> >  create mode 100644 hw/timer/ibex_timer.c
> >
> > diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> > new file mode 100644
> > index 0000000000..6a43537003
> > --- /dev/null
> > +++ b/include/hw/timer/ibex_timer.h
> > @@ -0,0 +1,52 @@
> > +/*
> > + * QEMU lowRISC Ibex Timer device
> > + *
> > + * Copyright (c) 2021 Western Digital
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > + * of this software and associated documentation files (the "Software"), to deal
> > + * in the Software without restriction, including without limitation the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_IBEX_TIMER_H
> > +#define HW_IBEX_TIMER_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_IBEX_TIMER "ibex-timer"
> > +OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
> > +
> > +struct IbexTimerState {
> > +    /* <private> */
> > +    SysBusDevice parent_obj;
> > +
> > +    /* <public> */
> > +    MemoryRegion mmio;
> > +
> > +    uint32_t timer_ctrl;
> > +    uint32_t timer_cfg0;
> > +    uint32_t timer_compare_lower0;
> > +    uint32_t timer_compare_upper0;
> > +    uint32_t timer_intr_enable;
> > +    uint32_t timer_intr_state;
> > +    uint32_t timer_intr_test;
> > +
> > +    uint32_t timebase_freq;
> > +
> > +    qemu_irq irq;
> > +};
> > +#endif /* HW_IBEX_TIMER_H */
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > new file mode 100644
> > index 0000000000..4d55eb5088
> > --- /dev/null
> > +++ b/hw/timer/ibex_timer.c
> > @@ -0,0 +1,305 @@
> > +/*
> > + * QEMU lowRISC Ibex Timer device
> > + *
> > + * Copyright (c) 2021 Western Digital
> > + *
> > + * For details check the documentation here:
> > + *    https://docs.opentitan.org/hw/ip/rv_timer/doc/
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > + * of this software and associated documentation files (the "Software"), to deal
> > + * in the Software without restriction, including without limitation the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/timer.h"
> > +#include "hw/timer/ibex_timer.h"
> > +#include "hw/irq.h"
> > +#include "hw/qdev-properties.h"
> > +#include "target/riscv/cpu.h"
> > +#include "migration/vmstate.h"
> > +
> > +REG32(CTRL, 0x00)
> > +    FIELD(CTRL, ACTIVE, 0, 1)
> > +REG32(CFG0, 0x100)
> > +    FIELD(CFG0, PRESCALE, 0, 12)
> > +    FIELD(CFG0, STEP, 16, 8)
> > +REG32(LOWER0, 0x104)
> > +REG32(UPPER0, 0x108)
> > +REG32(COMPARE_LOWER0, 0x10C)
> > +REG32(COMPARE_UPPER0, 0x110)
> > +REG32(INTR_ENABLE, 0x114)
> > +    FIELD(INTR_ENABLE, IE_0, 0, 1)
> > +REG32(INTR_STATE, 0x118)
> > +    FIELD(INTR_STATE, IS_0, 0, 1)
> > +REG32(INTR_TEST, 0x11C)
> > +    FIELD(INTR_TEST, T_0, 0, 1)
> > +
> > +static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > +{
> > +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +                    timebase_freq, NANOSECONDS_PER_SECOND);
> > +}
> > +
> > +static void ibex_timer_update_irqs(IbexTimerState *s)
> > +{
> > +    CPUState *cs = qemu_get_cpu(0);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    uint64_t value = s->timer_compare_lower0 |
> > +                         ((uint64_t)s->timer_compare_upper0 << 32);
> > +    uint64_t next, diff;
> > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > +
> > +    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > +        /* Timer isn't active */
> > +        return;
> > +    }
> > +
> > +    /* Update the CPUs mtimecmp */
> > +    cpu->env.timecmp = value;
> > +
> > +    if (cpu->env.timecmp <= now) {
> > +        /*
> > +         * If the mtimecmp was in the past raise the interrupt now.
> > +         */
> > +        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +        if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > +            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > +            qemu_set_irq(s->irq, true);
> > +        }
> > +        return;
> > +    }
> > +
> > +    /* Setup a timer to trigger the interrupt in the future */
> > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > +    qemu_set_irq(s->irq, false);
> > +
> > +    diff = cpu->env.timecmp - now;
> > +    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > +                                 muldiv64(diff,
> > +                                          NANOSECONDS_PER_SECOND,
> > +                                          s->timebase_freq);
> > +
> > +    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> > +        /* We overflowed the timer, just set it as large as we can */
> > +        timer_mod(cpu->env.timer, 0x07FFFFFFFFFFFFFF);
>
> Still not correct? should be 0x7FFFFFFFFFFFFFFF?

Argh! Thanks

I have actually fixed this.

Alistair

>
> > +    } else {
> > +        timer_mod(cpu->env.timer, next);
> > +    }
> > +}
> > +
>
> Regards,
> Bin

