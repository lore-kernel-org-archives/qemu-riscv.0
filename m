Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lowem-0000fl-8x
	for mharc-qemu-riscv@gnu.org; Thu, 03 Jun 2021 19:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowek-0000fY-Pp; Thu, 03 Jun 2021 19:21:42 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:46942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowei-0000QR-0w; Thu, 03 Jun 2021 19:21:42 -0400
Received: by mail-io1-xd2d.google.com with SMTP id o21so8093958iow.13;
 Thu, 03 Jun 2021 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LRCZ2hLZAq/VfuqdRjnREIHeaI9qlSDX6C0FMy9F2X0=;
 b=tULr8vndLjCaC+lQPcliklunrHFsSaH/bw9S79AVUflkSeqr2XWucqCKySVX7hAn3Q
 dhkraHRf37aZtBnN1ax6XBzwix32kclshWCJy+iTo6dmmxHeHWCHntcxKM/4/OiV3Xxu
 4yE9SLv2dcS1otD/azhXYmXk8DiDpIl+5WLH48chC0ja78BRU49Haawkd6yqi0U/svSO
 Wn6VKGiPt+cDk8dfk95JX+BhYvi6EBv1/sPUXQAID93E1gmQeHrrLEvY+hzn4XrbBrUV
 gCRnU7fcNgj6W7KlpTTV8Lqd+5+sPsJavHILRJ/b+4I+NnAzncO+4IcEUvluPXPDEdUy
 clcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRCZ2hLZAq/VfuqdRjnREIHeaI9qlSDX6C0FMy9F2X0=;
 b=dHFqFE9slHAedKbHKRvJtLQejjVLp/ZS+GdqZ7LjDTu2Ty+UcwF25LZbpYMQFvyypQ
 R7TWuBKh/D7dT6mspZlLD8dRN5r/b/sTCcR95dVtUKdT2zY9nrvCklxjr+ujLgLw8Aop
 glecblehwzJSEmfCRrKp3G4ycl/0CpVpQvoD/QrzQvvu1bxjpI6XnCzisRfCRNImdc/V
 nGz0XE/JrNlMortTFV08AKBnO8ypxEYKVSGHJmoexIBEWidL+o/9pU6ZwLlAKN56MAcQ
 WnK/sq378OLMY8vVChTrmrq5EBYIm/a2Fu0XNCtHIY3JAswRECIDWsXoyQDH0b/6wiZh
 DEBQ==
X-Gm-Message-State: AOAM532RzdXArcpcDPjklZUps4AbwSvrJqSR43LZjKaaAaGzncnAx7TQ
 Ep8q1mi7ZjJOQiUGolN1S67ckckYqibUHY05Wvs=
X-Google-Smtp-Source: ABdhPJw5lFOcde3BIWhDfFuNvvCDgce6YduSYuPiP9epKiAkvhUFRDt9xj4CWEwFi3EPvLwVioeJTKQebngdnJ9e+dE=
X-Received: by 2002:a05:6602:29cf:: with SMTP id
 z15mr1401177ioq.176.1622762497812; 
 Thu, 03 Jun 2021 16:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <3a2dd5ce519fb1e66b539cba93750fb5cb706b1a.1622435529.git.alistair.francis@wdc.com>
 <CAEUhbmVnyTEaPjukMEuJp-cUXV_fEQGGzLfH47xkma3r3eh5RQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVnyTEaPjukMEuJp-cUXV_fEQGGzLfH47xkma3r3eh5RQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:21:11 +1000
Message-ID: <CAKmqyKMXoOdnjvNDX2q3EbmLEhXa41s8fVAuWC05X+PfkeOhHg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/timer: Initial commit of Ibex Timer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Thu, 03 Jun 2021 23:21:43 -0000

On Tue, Jun 1, 2021 at 11:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, May 31, 2021 at 12:33 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>
> Please write some commit message, for example, what is supported in
> this initial version, and what is not.

I'll add something.

>
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
> > index 0000000000..0a1030b15f
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
>
> I am not sure if compiler can optimize such, but this if block can be
> put at the beginning of this function.

QEMU's style guide prefers declarations at the start of blocks, so I
think we should leave this as is.

https://github.com/qemu/qemu/blob/master/docs/devel/style.rst#declarations

>
> > +
> > +    /* Update the CPUs mtimecmp */
> > +    cpu->env.timecmp = value;
>
> The existing env.timecmp seems to be only valid for CLINT. Should we
> move it out of env?

This is the CLINT equivalent for OpenTitan, so in this case it's the
correct use.

In saying that as a future improvement it's probably good to move this
stuff out of env if we can.

>
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
> > +        timer_mod(cpu->env.timer, 0x0FFFFFFFFFFFFFFF);
>
> Should it be 0x7FFFFFFFFFFFFFFF?

Yeah, you are right.

>
> > +    } else {
> > +        timer_mod(cpu->env.timer, next);
> > +    }
> > +}
> > +
> > +static void ibex_timer_cb(void *opaque)
> > +{
> > +    IbexTimerState *s = opaque;
> > +    CPUState *cs = qemu_get_cpu(0);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +    if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > +        s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > +        qemu_set_irq(s->irq, true);
> > +    }
> > +}
> > +
> > +static void ibex_timer_reset(DeviceState *dev)
> > +{
> > +    IbexTimerState *s = IBEX_TIMER(dev);
> > +
> > +    CPUState *cpu = qemu_get_cpu(0);
> > +    CPURISCVState *env = cpu->env_ptr;
> > +    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                              &ibex_timer_cb, s);
> > +    env->timecmp = 0;
> > +
> > +    s->timer_ctrl = 0x00000000;
> > +    s->timer_cfg0 = 0x00000000;
> > +    s->timer_compare_lower0 = 0x0000003c;
> > +    s->timer_compare_upper0 = 0x00000000;
>
> The reset values seem not to conform with the spec?

You are right! Fixed

>
> > +    s->timer_intr_enable = 0x00000000;
> > +    s->timer_intr_state = 0x00000000;
> > +    s->timer_intr_test = 0x00000000;
> > +
> > +    ibex_timer_update_irqs(s);
> > +}
> > +
> > +static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
> > +                                       unsigned int size)
> > +{
> > +    IbexTimerState *s = opaque;
> > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > +    uint64_t retvalue = 0;
> > +
> > +    switch (addr >> 2) {
> > +    case R_CTRL:
> > +        retvalue = s->timer_ctrl;
> > +        break;
> > +    case R_CFG0:
> > +        retvalue = s->timer_cfg0;
> > +        break;
> > +    case R_LOWER0:
> > +        retvalue = now;
> > +        break;
> > +    case R_UPPER0:
> > +        retvalue = now >> 32;
> > +        break;
> > +    case R_COMPARE_LOWER0:
> > +        retvalue = s->timer_compare_lower0;
> > +        break;
> > +    case R_COMPARE_UPPER0:
> > +        retvalue = s->timer_compare_upper0;
> > +        break;
> > +    case R_INTR_ENABLE:
> > +        retvalue = s->timer_intr_enable;
> > +        break;
> > +    case R_INTR_STATE:
> > +        retvalue = s->timer_intr_state;
> > +        break;
> > +    case R_INTR_TEST:
> > +        retvalue = s->timer_intr_test;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> > +        return 0;
> > +    }
> > +
> > +    return retvalue;
> > +}
> > +
> > +static void ibex_timer_write(void *opaque, hwaddr addr,
> > +                             uint64_t val64, unsigned int size)
> > +{
> > +    IbexTimerState *s = opaque;
> > +    uint32_t val = val64;
> > +
> > +    switch (addr >> 2) {
> > +    case R_CTRL:
> > +        s->timer_ctrl = val;
> > +        break;
> > +    case R_CFG0:
> > +        qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
> > +        s->timer_cfg0 = val;
> > +        break;
> > +    case R_LOWER0:
> > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > +        break;
> > +    case R_UPPER0:
> > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > +        break;
> > +    case R_COMPARE_LOWER0:
> > +        s->timer_compare_lower0 = val;
> > +        ibex_timer_update_irqs(s);
> > +        break;
> > +    case R_COMPARE_UPPER0:
> > +        s->timer_compare_upper0 = val;
> > +        ibex_timer_update_irqs(s);
> > +        break;
> > +    case R_INTR_ENABLE:
> > +        s->timer_intr_enable = val;
>
> Does this register connect to MIE?

No, it's a little confusing.

The timer is connected to MIE AND it also has its own interrupt. This
controls it's custom interrupt.

Alistair

>
> > +        break;
> > +    case R_INTR_STATE:
> > +        /* Write 1 to clear */
> > +        s->timer_intr_state &= ~val;
> > +        break;
> > +    case R_INTR_TEST:
> > +        s->timer_intr_test = val;
> > +        if (s->timer_intr_enable &
> > +            s->timer_intr_test &
> > +            R_INTR_ENABLE_IE_0_MASK) {
> > +            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > +            qemu_set_irq(s->irq, true);
> > +        }
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps ibex_timer_ops = {
> > +    .read = ibex_timer_read,
> > +    .write = ibex_timer_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .impl.min_access_size = 4,
> > +    .impl.max_access_size = 4,
> > +};
> > +
> > +static int ibex_timer_post_load(void *opaque, int version_id)
> > +{
> > +    IbexTimerState *s = opaque;
> > +
> > +    ibex_timer_update_irqs(s);
> > +    return 0;
> > +}
> > +
> > +static const VMStateDescription vmstate_ibex_timer = {
> > +    .name = TYPE_IBEX_TIMER,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .post_load = ibex_timer_post_load,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT32(timer_ctrl, IbexTimerState),
> > +        VMSTATE_UINT32(timer_cfg0, IbexTimerState),
> > +        VMSTATE_UINT32(timer_compare_lower0, IbexTimerState),
> > +        VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
> > +        VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
> > +        VMSTATE_UINT32(timer_intr_state, IbexTimerState),
> > +        VMSTATE_UINT32(timer_intr_test, IbexTimerState),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static Property ibex_timer_properties[] = {
> > +    DEFINE_PROP_UINT32("timebase-freq", IbexTimerState, timebase_freq, 10000),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void ibex_timer_init(Object *obj)
> > +{
> > +    IbexTimerState *s = IBEX_TIMER(obj);
> > +
> > +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> > +
> > +    memory_region_init_io(&s->mmio, obj, &ibex_timer_ops, s,
> > +                          TYPE_IBEX_TIMER, 0x400);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> > +}
> > +
> > +static void ibex_timer_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->reset = ibex_timer_reset;
> > +    dc->vmsd = &vmstate_ibex_timer;
> > +    device_class_set_props(dc, ibex_timer_properties);
> > +}
> > +
> > +static const TypeInfo ibex_timer_info = {
> > +    .name          = TYPE_IBEX_TIMER,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(IbexTimerState),
> > +    .instance_init = ibex_timer_init,
> > +    .class_init    = ibex_timer_class_init,
> > +};
> > +
> > +static void ibex_timer_register_types(void)
> > +{
> > +    type_register_static(&ibex_timer_info);
> > +}
> > +
> > +type_init(ibex_timer_register_types)
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5f55404f2f..c46d4e281e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1355,11 +1355,9 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
> >  L: qemu-riscv@nongnu.org
> >  S: Supported
> >  F: hw/riscv/opentitan.c
> > -F: hw/char/ibex_uart.c
> > -F: hw/intc/ibex_plic.c
> > +F: hw/*/ibex_*.c
> >  F: include/hw/riscv/opentitan.h
> > -F: include/hw/char/ibex_uart.h
> > -F: include/hw/intc/ibex_plic.h
> > +F: include/hw/*/ibex_*.h
> >
> >  Microchip PolarFire SoC Icicle Kit
> >  M: Bin Meng <bin.meng@windriver.com>
> > diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> > index 157f540ecd..1aa3cd2284 100644
> > --- a/hw/timer/meson.build
> > +++ b/hw/timer/meson.build
> > @@ -33,5 +33,6 @@ softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
> >  softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
> >  softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
> >  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
> > +specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
> >
> >  specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
> > --
>
> Regards,
> Bin

