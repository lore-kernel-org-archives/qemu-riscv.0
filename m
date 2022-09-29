Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odvzj-0004mR-LM
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 12:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1odvzg-0004kD-TA
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 12:02:37 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1odvzS-0005oj-S1
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 12:02:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id s26so1829386pgv.7
 for <qemu-riscv@nongnu.org>; Thu, 29 Sep 2022 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jHX3NbtZXPGNYrYyPj8aLVIYT2qUT1TOB4w0M9gxP7o=;
 b=4woqZK3CA1vAXxvN9tuP9rHR3TAzXAAo1wobzgaFcAbJ2r6MkQ8plrszEXSWmV0KwY
 wBqWSIxmGJ5Sbz6wHqc/QlVo2rG7CWCmNUOxa/tFK9xGWma8ODPAAu35mB221/nqhZVg
 NUNU/GLSFyZ0r9js+eDrc/litbu5KVAlst/Ok0XJiPYsBhQF1RZYcAO2pqjQU0Vl6XC6
 MrosCTi4JewP8oivsFfWxXeEPYCy00iLHLbV9VumTBX1JEEf8l2z1V/VvHlFtjayalQV
 1+Ua6d+PQV9bN0Fm4kEEvKKgAKi+KcP/WtbDMicYvXDM7y239CYCyIdAPhzSBVJFkBme
 Xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jHX3NbtZXPGNYrYyPj8aLVIYT2qUT1TOB4w0M9gxP7o=;
 b=qZf0GqcXrKzNIrzWEHh8kjf194Vgd2+GVBRFnZg9MXX5l1OM3DzkTpyuSF5SUnbk7+
 XodtVzXRBvFfxa/6KtZHPk+u9O0WtBWg1sP4v0Xwr1NuxwjQ2khL7LXKpW97vVuBG1e3
 BfZYhv2WijfebADECXXnJIkHj0MRjMMDnYTBI3Qm+0fPRsbrwG6q4kQ/QfrdF5INJhTL
 sPRHBAA6QOSpecDCqETTnUQYQUZB2CORXtmIwyy8ly/9LzKAaXLNq8aJbrx7vPp/8ZLY
 24LOQAj4xJrbGcd0eLs4X6oYT9FmhTIxkD0k6agWV8taF4JIVPFgcolpcbz8XvawkwsF
 XJvw==
X-Gm-Message-State: ACrzQf148Tnxtnv8giYtNcWp33mvSboizLwNyzayYnFpRdL/OeOZbLN2
 qQbmTOZP3gsDvcXXTNzenGx0bRnoOApw1nCnyYiGeg==
X-Google-Smtp-Source: AMsMyM7qtCsuIORHhgI3eMqQHV8557iqp07TBL3bqDBAdW9gaPyJT58+LIiS9sJuB3RVzPb4n/MCIGoXzvAGd8T1ZxE=
X-Received: by 2002:a63:1e10:0:b0:439:3c93:25ab with SMTP id
 e16-20020a631e10000000b004393c9325abmr3558956pge.317.1664467339775; Thu, 29
 Sep 2022 09:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
 <BL0PR11MB3042B671D5847E3764C951898A529@BL0PR11MB3042.namprd11.prod.outlook.com>
 <CAB88-qMQbxRV+5e=g=_WGH9VFjP-bYnhQ+=mptnsLJg3XAXkqA@mail.gmail.com>
 <BL0PR11MB30424EDE79EA4926F417DD6C8A549@BL0PR11MB3042.namprd11.prod.outlook.com>
In-Reply-To: <BL0PR11MB30424EDE79EA4926F417DD6C8A549@BL0PR11MB3042.namprd11.prod.outlook.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 29 Sep 2022 09:02:08 -0700
Message-ID: <CAB88-qOtDc3EMGcPGdiLicYE3DiUD_2NHjeMDRYzn3SoiZdmrQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
 mtime
To: "Dong, Eddie" <eddie.dong@intel.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Meng, Bin" <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000087297905e9d300a0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=tkng@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Sep 2022 16:02:37 -0000

--00000000000087297905e9d300a0
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 4:00 PM Dong, Eddie <eddie.dong@intel.com> wrote:

>
>
> From: Tyler Ng <tkng@rivosinc.com>
> Sent: Monday, September 26, 2022 4:38 PM
> To: Dong, Eddie <eddie.dong@intel.com>
> Cc: open list:RISC-V <qemu-riscv@nongnu.org>; qemu-devel@nongnu.org
> Developers <qemu-devel@nongnu.org>; Alistair Francis <
> Alistair.Francis@wdc.com>; Meng, Bin <bin.meng@windriver.com>; Thomas
> Huth <thuth@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>; Palmer
> Dabbelt <palmer@dabbelt.com>; Laurent Vivier <lvivier@redhat.com>
> Subject: Re: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes
> to mtime
>
> Hi Eddie,
>
> On Mon, Sep 26, 2022 at 2:06 PM Dong, Eddie <mailto:eddie.dong@intel.com>
> wrote:
>
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-bounces+eddie.dong=mailto:
> intel.com@nongnu.org>
> > On Behalf Of Tyler Ng
> > Sent: Thursday, September 22, 2022 8:59 AM
> > To: open list:RISC-V <mailto:qemu-riscv@nongnu.org>; mailto:
> qemu-devel@nongnu.org
> > Developers <mailto:qemu-devel@nongnu.org>
> > Cc: Alistair Francis <mailto:Alistair.Francis@wdc.com>; Meng, Bin
> > <mailto:bin.meng@windriver.com>; Thomas Huth <mailto:thuth@redhat.com>;
> Paolo
> > Bonzini <mailto:pbonzini@redhat.com>; Palmer Dabbelt <mailto:
> palmer@dabbelt.com>;
> > Laurent Vivier <mailto:lvivier@redhat.com>
> > Subject: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
> > mtime
> >
> > 1. Adds fields to hold the value of mtime in timer_upper0 and
> timer_lower0.
> >
> > 2. Changes the read and write functions to use the mtime fields.
> >
> > 3. Updates the value of mtime in update_mtime() by extrapolating the time
> > elapsed. This will need to change if/when the prescalar is implemented.
> >
> > 4. Adds a qtest for the ibex timer.
> >
> > Signed-off-by: Tyler Ng <mailto:tkng@rivosinc.com>
> > ---
> >  hw/timer/ibex_timer.c         |  98 +++++++++++++------
> >  include/hw/timer/ibex_timer.h |   6 ++
> >  tests/qtest/ibex-timer-test.c | 178 ++++++++++++++++++++++++++++++++++
> >  tests/qtest/meson.build       |   3 +-
> >  4 files changed, 256 insertions(+), 29 deletions(-)  create mode 100644
> > tests/qtest/ibex-timer-test.c
> >
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c index
> > d8b8e4e1f6..4230d60e85 100644
> > --- a/hw/timer/ibex_timer.c
> > +++ b/hw/timer/ibex_timer.c
> > @@ -52,28 +52,56 @@ REG32(INTR_STATE, 0x118)  REG32(INTR_TEST,
> > 0x11C)
> >      FIELD(INTR_TEST, T_0, 0, 1)
> >
> > -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > +static inline uint64_t get_mtime(void *opaque)
> >  {
> > -    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -                    timebase_freq, NANOSECONDS_PER_SECOND);
> > +    IbexTimerState *s = opaque;
> > +    return (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
> >  }
> >
> > -static void ibex_timer_update_irqs(IbexTimerState *s)
> > +/*
> > + * The goal of this function is to:
> > + * 1. Check if the timer is enabled. If not, return false,
> > + * 2. Calculate the amount of time that has passed since.
> > + * 3. Extrapolate the number of ticks that have passed, and add it to
> `mtime`.
> > + * 4. Return true.
> > + */
> > +static bool update_mtime(IbexTimerState *s)
> >  {
> > -    uint64_t value = s->timer_compare_lower0 |
> > -                         ((uint64_t)s->timer_compare_upper0 << 32);
> So the hardware actually implements 64 bits register (used in 32 bits
> CPU), why not use an union for this?
> Same for:
> +    uint32_t timer_lower0;
> +    uint32_t timer_upper0;
>     I'm not too sure what a C union would do for us here?
>
> I think what the hardware really implement is a 64 bits register, with 32
> bits interface to access.
> struct IbexTimerState actually defines both of them:
>   uint64_t mtimecmp;
>   uint32_t timer_compare_lower0;
>   uint32_t timer_compare_upper0;
>
>
It seems that the 64-bit mtimecmp field was added between patch versions...
Upon closer inspection I believe it duplicates functionality of the
existing 32-bit fields. It probably should be removed.


> Using a union can better reflect this. Also, it can avoid the convert from
> 2 32-bits register to 64 bits, like the above code does.
> ibex_timer_update_irqs() also does this conversion.
>
>
It took me a bit of time, but now I think I understand what you mean: a
union of 2 uint32_t's (perhaps packed into a struct or an array) and a
uint64_t would make it easier to access the components, is that what you
mean? That is pretty handy, thanks.

-Tyler


> > -    uint64_t next, diff;
> > -    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > -
> >      if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > -        /* Timer isn't active */
> > +        return false;
> > +    }
> > +    /* Get the time then extrapolate the number of ticks that have
> elapsed */
> > +    uint64_t mtime = get_mtime(s);
> > +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    int64_t elapsed = now - s->timer_last_update;
> > +    if (elapsed < 0) {
> > +        /* We jumped back in time. */
> > +        mtime -= muldiv64((uint64_t)(-elapsed), s->timebase_freq,
> > +                           NANOSECONDS_PER_SECOND);
> > +    } else {
> > +        mtime += muldiv64(elapsed, s->timebase_freq,
> > NANOSECONDS_PER_SECOND);
> > +    }
> > +    s->timer_lower0 = mtime & 0xffffffff;
> > +    s->timer_upper0 = (mtime >> 32) & 0xffffffff;
> > +    /* update last-checkpoint timestamp */
> > +    s->timer_last_update = now;
> > +    return true;
> > +}
> > +
> > +static void ibex_timer_update_irqs(IbexTimerState *s) {
> > +    if (!update_mtime(s)) {
> > +        /* Timer is not enabled? */
> >          return;
> >      }
> > +    uint64_t mtimecmp = s->timer_compare_lower0 |
> > +                         ((uint64_t)s->timer_compare_upper0 << 32);
> > +    uint64_t mtime = get_mtime(s);
> >
> >      /* Update the CPUs mtimecmp */
> > -    s->mtimecmp = value;
> > +    s->mtimecmp = mtimecmp;
> >
> > -    if (s->mtimecmp <= now) {
> > +    if (s->mtimecmp <= mtime) {
> >          /*
> >           * If the mtimecmp was in the past raise the interrupt now.
> >           */
> > @@ -84,18 +112,17 @@ static void ibex_timer_update_irqs(IbexTimerState
> > *s)
> >          }
> >          return;
> >      }
> > -
> > -    /* Setup a timer to trigger the interrupt in the future */
> > +    /* Update timers: setup a timer to trigger the interrupt in the
> > + future */
> >      qemu_irq_lower(s->m_timer_irq);
> >      qemu_set_irq(s->irq, false);
> > -
> > -    diff = s->mtimecmp - now;
> > -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > -                                 muldiv64(diff,
> > -                                          NANOSECONDS_PER_SECOND,
> > -                                          s->timebase_freq);
> > -
> > -    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> > +    /* Compute the difference, and set a timer for the next update. */
> > +    const uint64_t diff = mtimecmp - mtime;
> > +    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    const uint64_t towait = muldiv64(diff, NANOSECONDS_PER_SECOND,
> > +                                     s->timebase_freq);
> > +    /* timer_mod takes in a int64_t, not uint64_t! Need to saturate it
> */
> > +    const int64_t next = now + towait;
> > +    if (next < now) {
> >          /* We overflowed the timer, just set it as large as we can */
> >          timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
> >      } else {
> > @@ -124,11 +151,13 @@ static void ibex_timer_reset(DeviceState *dev)
> >
> >      s->timer_ctrl = 0x00000000;
> >      s->timer_cfg0 = 0x00010000;
> > +    s->timer_lower0 = 0x00000000;
> > +    s->timer_upper0 = 0x00000000;
> >      s->timer_compare_lower0 = 0xFFFFFFFF;
> >      s->timer_compare_upper0 = 0xFFFFFFFF;
> >      s->timer_intr_enable = 0x00000000;
> >      s->timer_intr_state = 0x00000000;
> > -
> > +    s->timer_last_update = 0x00000000;
> >      ibex_timer_update_irqs(s);
> >  }
> >
> > @@ -136,7 +165,6 @@ static uint64_t ibex_timer_read(void *opaque,
> > hwaddr addr,
> >                                         unsigned int size)  {
> >      IbexTimerState *s = opaque;
> > -    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> >      uint64_t retvalue = 0;
> >
> >      switch (addr >> 2) {
> > @@ -151,10 +179,12 @@ static uint64_t ibex_timer_read(void *opaque,
> > hwaddr addr,
> >          retvalue = s->timer_cfg0;
> >          break;
> >      case R_LOWER0:
> > -        retvalue = now;
> > +        update_mtime(s);
> > +        retvalue = s->timer_lower0;
> >          break;
> >      case R_UPPER0:
> > -        retvalue = now >> 32;
> > +        update_mtime(s);
> > +        retvalue = s->timer_upper0;
> >          break;
> >      case R_COMPARE_LOWER0:
> >          retvalue = s->timer_compare_lower0; @@ -192,17 +222,26 @@ static
> > void ibex_timer_write(void *opaque, hwaddr addr,
> >          qemu_log_mask(LOG_UNIMP, "Alert triggering not supported");
> >          break;
> >      case R_CTRL:
> > +        if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > +            s->timer_last_update =
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        }
> >          s->timer_ctrl = val;
> > +        /* We must update IRQs, because the QEMU timer gets updated
> here.
> > */
> > +        ibex_timer_update_irqs(s);
> >          break;
> >      case R_CFG0:
> >          qemu_log_mask(LOG_UNIMP, "Changing prescale or step not
> > supported");
> >          s->timer_cfg0 = val;
> >          break;
> >      case R_LOWER0:
> > -        qemu_log_mask(LOG_UNIMP, "Changing timer value is not
> supported");
> > +        s->timer_lower0 = val;
> > +        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        ibex_timer_update_irqs(s);
> >          break;
> >      case R_UPPER0:
> > -        qemu_log_mask(LOG_UNIMP, "Changing timer value is not
> supported");
> > +        s->timer_upper0 = val;
> > +        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        ibex_timer_update_irqs(s);
> >          break;
> >      case R_COMPARE_LOWER0:
> >          s->timer_compare_lower0 = val;
> > @@ -259,6 +298,9 @@ static const VMStateDescription vmstate_ibex_timer
> > = {
> >          VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
> >          VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
> >          VMSTATE_UINT32(timer_intr_state, IbexTimerState),
> > +        VMSTATE_INT64(timer_last_update, IbexTimerState),
> > +        VMSTATE_UINT32(timer_lower0, IbexTimerState),
> > +        VMSTATE_UINT32(timer_upper0, IbexTimerState),
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > diff --git a/include/hw/timer/ibex_timer.h
> b/include/hw/timer/ibex_timer.h
> > index 41f5c82a92..15c16035a8 100644
> > --- a/include/hw/timer/ibex_timer.h
> > +++ b/include/hw/timer/ibex_timer.h
> > @@ -36,11 +36,17 @@ struct IbexTimerState {
> >      uint64_t mtimecmp;
> >      QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
> >
> > +    int64_t timer_last_update; /* Used for extrapolating mtime. */
> > +
> >      /* <public> */
> >      MemoryRegion mmio;
> >
> >      uint32_t timer_ctrl;
> >      uint32_t timer_cfg0;
> > +
> > +
> > +    uint32_t timer_lower0;
> > +    uint32_t timer_upper0;
> >      uint32_t timer_compare_lower0;
> >      uint32_t timer_compare_upper0;
> >      uint32_t timer_intr_enable;
> > diff --git a/tests/qtest/ibex-timer-test.c
> b/tests/qtest/ibex-timer-test.c new
> > file mode 100644 index 0000000000..1c2dfb0b6c
> > --- /dev/null
> > +++ b/tests/qtest/ibex-timer-test.c
> > @@ -0,0 +1,178 @@
> > +/*
> > + * Testing the Ibex Timer
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > +obtaining a copy
> > + * of this software and associated documentation files (the
> > "Software"), to deal
> > + * in the Software without restriction, including without limitation
> > + the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> > + sell
> > + * copies of the Software, and to permit persons to whom the Software
> > + is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT
> > + SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR
> > + OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > + DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qapi/qmp/qdict.h"
> > +
> > +#define TIMER_BASE_ADDR 0x40100000UL
> > +#define TIMER_ADDR(addr) (TIMER_BASE_ADDR + addr) #define
> > +TIMER_EXPIRED_IRQ 127 #define NANOS_PER_SECOND 1000000000LL
> > +
> > +#define A_ALERT_TEST 0x0
> > +#define A_CTRL 0x4
> > +#define A_CFG0 0x100
> > +#define A_LOWER_0 0x104
> > +#define A_UPPER_0 0x108
> > +#define A_COMPARE_LOWER0 0x10C
> > +#define A_COMPARE_UPPER0 0x110
> > +#define A_INTR_ENABLE 0x114
> > +#define A_INTR_STATE 0x118
> > +#define A_INTR_TEST 0x11C
> > +
> > +/*
> > + * Tests that regs get reset properly.
> > + */
> > +static void test_reset(void)
> > +{
> > +    QTestState *test = qtest_init("-M opentitan");
> > +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> > +    /* Regs are reset; skip WO regs */
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ENABLE)), ==,
> 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_STATE)), ==,
> 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)), ==,
> 0x10000);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)),
> > ==,
> > +                     UINT32_MAX);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)),
> > ==,
> > +                     UINT32_MAX);
> > +    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +    qtest_quit(test);
> > +}
> > +
> > +/*
> > + * Test that writes worked.
> > + */
> > +static void test_writes(void)
> > +{
> > +    QTestState *test = qtest_init("-M opentitan");
> > +
> > +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> > +
> > +    /* Special regs that may/may not need to be tested yet */
> > +/*
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_ALERT_TEST)), ==,
> 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_TEST)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_STATE)), ==,
> > +0); */
> > +    /* Write to ctrl */
> > +    qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)), ==, 0x1);
> > +    /* Write to intr_enable */
> > +    qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ENABLE)), ==,
> > +0x1);
> > +
> > +    /* Writes to config? Though none of it is supported */
> > +    qtest_writel(test, TIMER_ADDR(A_CFG0), 0x20001);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)), ==,
> > + 0x20001);
> > +
> > +    /* Writes to mtime */
> > +    qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0xdeaddad);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==,
> > 0xdeaddad);
> > +    qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0xdeaddad);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==,
> > + 0xdeaddad);
> > +
> > +    /* Writes to mtimecmp */
> > +    qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 0xdeaddad);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)),
> > ==,
> > +                     0xdeaddad);
> > +    qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0xdeaddad);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)),
> > ==,
> > +                     0xdeaddad);
> > +    qtest_quit(test);
> > +}
> > +
> > +/*
> > + * Test the standard operation of the timer.
> > + */
> > +static void test_operation(void)
> > +{
> > +    /* A frequency of 1000000 Hz*/
> > +    QTestState *test = qtest_init(
> > +        "-M opentitan "
> > +        "-global driver=ibex-timer,property=timebase-freq,value=1000000"
> > +    );
> > +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> > +    /* Set mtimecmp; approx 1 second. */
> > +    qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 1000000);
> > +    qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0);
> > +
> > +    /* Wait for some amount of time. Timer should not tick. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 30);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
> > +
> > +    /* First, enable the timer. */
> > +    qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);
> > +    qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);
> > +
> > +    /* The counter should remain at 0, and no interrupts. */
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
> > +    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +
> > +    /* Let it run for half a second. No interrupts. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND / 2);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), <,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), <=,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
> > +    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +
> > +    /* Let it run for half a second again. Interrupt. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND / 2);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
> > +    g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +
> > +    /* Handle interrupt, no more interrupt after. */
> > +    qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0x0);
> > +    qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0x0);
> > +    qtest_writel(test, TIMER_ADDR(A_INTR_STATE), 0x1);
> > +    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +
> > +    /* One more second. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND);
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
> > +    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==,
> > +                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
> > +    g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));
> > +
> > +    qtest_quit(test);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    g_test_init(&argc, &argv, NULL);
> > +    qtest_add_func("ibex-timer/reset", test_reset);
> > +    qtest_add_func("ibex-timer/writes", test_writes);
> > +    qtest_add_func("ibex-timer/op", test_operation);
> > +    return g_test_run();
> > +}
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build index
> > fb63b8d3fa..7a769a79c5 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -235,7 +235,8 @@ qtests_s390x = \
> >     'migration-test']
> >
> >  qtests_riscv32 = \
> > -  ['ibex-aon-timer-test']
> > +  ['ibex-aon-timer-test',
> > +   'ibex-timer-test']
> >
> >  qos_test_ss = ss.source_set()
> >  qos_test_ss.add(
> > --
> > 2.34.1
> -Tyler
>

--00000000000087297905e9d300a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 28, 2022 at 4:00 PM Dong,=
 Eddie &lt;<a href=3D"mailto:eddie.dong@intel.com">eddie.dong@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
From: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.com" target=3D"_blank">t=
kng@rivosinc.com</a>&gt; <br>
Sent: Monday, September 26, 2022 4:38 PM<br>
To: Dong, Eddie &lt;<a href=3D"mailto:eddie.dong@intel.com" target=3D"_blan=
k">eddie.dong@intel.com</a>&gt;<br>
Cc: open list:RISC-V &lt;<a href=3D"mailto:qemu-riscv@nongnu.org" target=3D=
"_blank">qemu-riscv@nongnu.org</a>&gt;; <a href=3D"mailto:qemu-devel@nongnu=
.org" target=3D"_blank">qemu-devel@nongnu.org</a> Developers &lt;<a href=3D=
"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&=
gt;; Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com" targe=
t=3D"_blank">Alistair.Francis@wdc.com</a>&gt;; Meng, Bin &lt;<a href=3D"mai=
lto:bin.meng@windriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt=
;; Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">th=
uth@redhat.com</a>&gt;; Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat=
.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;; Palmer Dabbelt &lt;<a =
href=3D"mailto:palmer@dabbelt.com" target=3D"_blank">palmer@dabbelt.com</a>=
&gt;; Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" target=3D"_b=
lank">lvivier@redhat.com</a>&gt;<br>
Subject: Re: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes =
to mtime<br>
<br>
Hi Eddie,<br>
<br>
On Mon, Sep 26, 2022 at 2:06 PM Dong, Eddie &lt;mailto:<a href=3D"mailto:ed=
die.dong@intel.com" target=3D"_blank">eddie.dong@intel.com</a>&gt; wrote:<b=
r>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Qemu-devel &lt;qemu-devel-bounces+eddie.dong=3Dmailto:<a href=3D=
"mailto:intel.com@nongnu.org" target=3D"_blank">intel.com@nongnu.org</a>&gt=
;<br>
&gt; On Behalf Of Tyler Ng<br>
&gt; Sent: Thursday, September 22, 2022 8:59 AM<br>
&gt; To: open list:RISC-V &lt;mailto:<a href=3D"mailto:qemu-riscv@nongnu.or=
g" target=3D"_blank">qemu-riscv@nongnu.org</a>&gt;; mailto:<a href=3D"mailt=
o:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a><br>
&gt; Developers &lt;mailto:<a href=3D"mailto:qemu-devel@nongnu.org" target=
=3D"_blank">qemu-devel@nongnu.org</a>&gt;<br>
&gt; Cc: Alistair Francis &lt;mailto:<a href=3D"mailto:Alistair.Francis@wdc=
.com" target=3D"_blank">Alistair.Francis@wdc.com</a>&gt;; Meng, Bin<br>
&gt; &lt;mailto:<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank"=
>bin.meng@windriver.com</a>&gt;; Thomas Huth &lt;mailto:<a href=3D"mailto:t=
huth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;; Paolo<br>
&gt; Bonzini &lt;mailto:<a href=3D"mailto:pbonzini@redhat.com" target=3D"_b=
lank">pbonzini@redhat.com</a>&gt;; Palmer Dabbelt &lt;mailto:<a href=3D"mai=
lto:palmer@dabbelt.com" target=3D"_blank">palmer@dabbelt.com</a>&gt;;<br>
&gt; Laurent Vivier &lt;mailto:<a href=3D"mailto:lvivier@redhat.com" target=
=3D"_blank">lvivier@redhat.com</a>&gt;<br>
&gt; Subject: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes=
 to<br>
&gt; mtime<br>
&gt; <br>
&gt; 1. Adds fields to hold the value of mtime in timer_upper0 and timer_lo=
wer0.<br>
&gt; <br>
&gt; 2. Changes the read and write functions to use the mtime fields.<br>
&gt; <br>
&gt; 3. Updates the value of mtime in update_mtime() by extrapolating the t=
ime<br>
&gt; elapsed. This will need to change if/when the prescalar is implemented=
.<br>
&gt; <br>
&gt; 4. Adds a qtest for the ibex timer.<br>
&gt; <br>
&gt; Signed-off-by: Tyler Ng &lt;mailto:<a href=3D"mailto:tkng@rivosinc.com=
" target=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/timer/ibex_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9=
8 +++++++++++++------<br>
&gt;=C2=A0 include/hw/timer/ibex_timer.h |=C2=A0 =C2=A06 ++<br>
&gt;=C2=A0 tests/qtest/ibex-timer-test.c | 178 ++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
3 +-<br>
&gt;=C2=A0 4 files changed, 256 insertions(+), 29 deletions(-)=C2=A0 create=
 mode 100644<br>
&gt; tests/qtest/ibex-timer-test.c<br>
&gt; <br>
&gt; diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c index<br>
&gt; d8b8e4e1f6..4230d60e85 100644<br>
&gt; --- a/hw/timer/ibex_timer.c<br>
&gt; +++ b/hw/timer/ibex_timer.c<br>
&gt; @@ -52,28 +52,56 @@ REG32(INTR_STATE, 0x118)=C2=A0 REG32(INTR_TEST,<br=
>
&gt; 0x11C)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(INTR_TEST, T_0, 0, 1)<br>
&gt; <br>
&gt; -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)<br>
&gt; +static inline uint64_t get_mtime(void *opaque)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 timebase_freq, NANOSECONDS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 IbexTimerState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 return (s-&gt;timer_lower0) | ((uint64_t) s-&gt;timer_u=
pper0 &lt;&lt; 32);<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -static void ibex_timer_update_irqs(IbexTimerState *s)<br>
&gt; +/*<br>
&gt; + * The goal of this function is to:<br>
&gt; + * 1. Check if the timer is enabled. If not, return false,<br>
&gt; + * 2. Calculate the amount of time that has passed since.<br>
&gt; + * 3. Extrapolate the number of ticks that have passed, and add it to=
 `mtime`.<br>
&gt; + * 4. Return true.<br>
&gt; + */<br>
&gt; +static bool update_mtime(IbexTimerState *s)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 uint64_t value =3D s-&gt;timer_compare_lower0 |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0((uint64_t)s-&gt;timer_compare_upper0 &lt;&lt; 32);<br=
>
So the hardware actually implements 64 bits register (used in 32 bits CPU),=
 why not use an union for this?<br>
Same for:<br>
+=C2=A0 =C2=A0 uint32_t timer_lower0;<br>
+=C2=A0 =C2=A0 uint32_t timer_upper0;<br>
=C2=A0 =C2=A0 I&#39;m not too sure what a C union would do for us here?<br>
=C2=A0<br>
I think what the hardware really implement is a 64 bits register, with 32 b=
its interface to access.<br>
struct IbexTimerState actually defines both of them:=C2=A0 <br>
=C2=A0 uint64_t mtimecmp;<br>
=C2=A0 uint32_t timer_compare_lower0;<br>
=C2=A0 uint32_t timer_compare_upper0;<br>
<br></blockquote><div><br></div><div>It seems that the 64-bit mtimecmp fiel=
d was added between patch versions... Upon closer inspection I believe it d=
uplicates functionality of the existing 32-bit fields. It probably should b=
e removed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Using a union can better reflect this. Also, it can avoid the convert from =
2 32-bits register to 64 bits, like the above code does.<br>
ibex_timer_update_irqs() also does this conversion.<br>
<br></blockquote><div><br></div><div>It took me a bit of time, but now I th=
ink I understand what you mean: a union of 2 uint32_t&#39;s (perhaps packed=
 into a struct or an array) and a uint64_t would make it easier to access t=
he components, is that what you mean? That is pretty handy, thanks.<br></di=
v><div><br></div><div>-Tyler<br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; -=C2=A0 =C2=A0 uint64_t next, diff;<br>
&gt; -=C2=A0 =C2=A0 uint64_t now =3D cpu_riscv_read_rtc(s-&gt;timebase_freq=
);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;timer_ctrl &amp; R_CTRL_ACTIVE_MASK)) =
{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer isn&#39;t active */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Get the time then extrapolate the number of ticks th=
at have elapsed */<br>
&gt; +=C2=A0 =C2=A0 uint64_t mtime =3D get_mtime(s);<br>
&gt; +=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
&gt; +=C2=A0 =C2=A0 int64_t elapsed =3D now - s-&gt;timer_last_update;<br>
&gt; +=C2=A0 =C2=A0 if (elapsed &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We jumped back in time. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime -=3D muldiv64((uint64_t)(-elapsed),=
 s-&gt;timebase_freq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime +=3D muldiv64(elapsed, s-&gt;timeba=
se_freq,<br>
&gt; NANOSECONDS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_lower0 =3D mtime &amp; 0xffffffff;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_upper0 =3D (mtime &gt;&gt; 32) &amp; 0xffff=
ffff;<br>
&gt; +=C2=A0 =C2=A0 /* update last-checkpoint timestamp */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_last_update =3D now;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ibex_timer_update_irqs(IbexTimerState *s) {<br>
&gt; +=C2=A0 =C2=A0 if (!update_mtime(s)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer is not enabled? */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 uint64_t mtimecmp =3D s-&gt;timer_compare_lower0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0((uint64_t)s-&gt;timer_compare_upper0 &lt;&lt; 32);<br=
>
&gt; +=C2=A0 =C2=A0 uint64_t mtime =3D get_mtime(s);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Update the CPUs mtimecmp */<br>
&gt; -=C2=A0 =C2=A0 s-&gt;mtimecmp =3D value;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;mtimecmp =3D mtimecmp;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 if (s-&gt;mtimecmp &lt;=3D now) {<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;mtimecmp &lt;=3D mtime) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the mtimecmp was in the p=
ast raise the interrupt now.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; @@ -84,18 +112,17 @@ static void ibex_timer_update_irqs(IbexTimerState=
<br>
&gt; *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Setup a timer to trigger the interrupt in the future=
 */<br>
&gt; +=C2=A0 =C2=A0 /* Update timers: setup a timer to trigger the interrup=
t in the<br>
&gt; + future */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;m_timer_irq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, false);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 diff =3D s-&gt;mtimecmp - now;<br>
&gt; -=C2=A0 =C2=A0 next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muldiv64(diff,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NANOSECONDS_PER_SECOND,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s-&gt;timebase_freq);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (next &lt; qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {<=
br>
&gt; +=C2=A0 =C2=A0 /* Compute the difference, and set a timer for the next=
 update. */<br>
&gt; +=C2=A0 =C2=A0 const uint64_t diff =3D mtimecmp - mtime;<br>
&gt; +=C2=A0 =C2=A0 const int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);<br>
&gt; +=C2=A0 =C2=A0 const uint64_t towait =3D muldiv64(diff, NANOSECONDS_PE=
R_SECOND,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;timeba=
se_freq);<br>
&gt; +=C2=A0 =C2=A0 /* timer_mod takes in a int64_t, not uint64_t! Need to =
saturate it */<br>
&gt; +=C2=A0 =C2=A0 const int64_t next =3D now + towait;<br>
&gt; +=C2=A0 =C2=A0 if (next &lt; now) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We overflowed the timer, just set=
 it as large as we can */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;mtimer, 0x7FFFFFFFFF=
FFFFFF);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; @@ -124,11 +151,13 @@ static void ibex_timer_reset(DeviceState *dev)<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_ctrl =3D 0x00000000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_cfg0 =3D 0x00010000;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_lower0 =3D 0x00000000;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_upper0 =3D 0x00000000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_compare_lower0 =3D 0xFFFFFFFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_compare_upper0 =3D 0xFFFFFFFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_intr_enable =3D 0x00000000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_intr_state =3D 0x00000000;<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_last_update =3D 0x00000000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ibex_timer_update_irqs(s);<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; @@ -136,7 +165,6 @@ static uint64_t ibex_timer_read(void *opaque,<br>
&gt; hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int size)=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IbexTimerState *s =3D opaque;<br>
&gt; -=C2=A0 =C2=A0 uint64_t now =3D cpu_riscv_read_rtc(s-&gt;timebase_freq=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t retvalue =3D 0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (addr &gt;&gt; 2) {<br>
&gt; @@ -151,10 +179,12 @@ static uint64_t ibex_timer_read(void *opaque,<br=
>
&gt; hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D s-&gt;timer_cfg0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_LOWER0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D now;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_mtime(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D s-&gt;timer_lower0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_UPPER0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D now &gt;&gt; 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_mtime(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D s-&gt;timer_upper0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_COMPARE_LOWER0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D s-&gt;timer_compare_low=
er0; @@ -192,17 +222,26 @@ static<br>
&gt; void ibex_timer_write(void *opaque, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;Alert=
 triggering not supported&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;timer_ctrl &amp; R_CTRL_ACTIV=
E_MASK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_last_update =3D=
 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_ctrl =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We must update IRQs, because the QEMU =
timer gets updated here.<br>
&gt; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_timer_update_irqs(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_CFG0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;Chang=
ing prescale or step not<br>
&gt; supported&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_cfg0 =3D val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_LOWER0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;Changing t=
imer value is not supported&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_lower0 =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_last_update =3D qemu_clock_ge=
t_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_timer_update_irqs(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_UPPER0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;Changing t=
imer value is not supported&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_upper0 =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_last_update =3D qemu_clock_ge=
t_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_timer_update_irqs(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case R_COMPARE_LOWER0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timer_compare_lower0 =3D val;<=
br>
&gt; @@ -259,6 +298,9 @@ static const VMStateDescription vmstate_ibex_timer=
<br>
&gt; =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(timer_compare_upper0,=
 IbexTimerState),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(timer_intr_enable, Ib=
exTimerState),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(timer_intr_state, Ibe=
xTimerState),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT64(timer_last_update, IbexTime=
rState),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(timer_lower0, IbexTimerSta=
te),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(timer_upper0, IbexTimerSta=
te),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_tim=
er.h<br>
&gt; index 41f5c82a92..15c16035a8 100644<br>
&gt; --- a/include/hw/timer/ibex_timer.h<br>
&gt; +++ b/include/hw/timer/ibex_timer.h<br>
&gt; @@ -36,11 +36,17 @@ struct IbexTimerState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mtimecmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMUTimer *mtimer; /* Internal timer for M-mode in=
terrupt */<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 int64_t timer_last_update; /* Used for extrapolating mt=
ime. */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* &lt;public&gt; */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t timer_ctrl;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t timer_cfg0;<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t timer_lower0;<br>
&gt; +=C2=A0 =C2=A0 uint32_t timer_upper0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t timer_compare_lower0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t timer_compare_upper0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t timer_intr_enable;<br>
&gt; diff --git a/tests/qtest/ibex-timer-test.c b/tests/qtest/ibex-timer-te=
st.c new<br>
&gt; file mode 100644 index 0000000000..1c2dfb0b6c<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qtest/ibex-timer-test.c<br>
&gt; @@ -0,0 +1,178 @@<br>
&gt; +/*<br>
&gt; + * Testing the Ibex Timer<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person<br>
&gt; +obtaining a copy<br>
&gt; + * of this software and associated documentation files (the<br>
&gt; &quot;Software&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation<=
br>
&gt; + the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or<br>
&gt; + sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
<br>
&gt; + is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be<br>
&gt; + included in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND,<br>
&gt; + EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
&gt; + MERCHANTABILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO<br>
&gt; EVENT<br>
&gt; + SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,<br>
&gt; DAMAGES OR<br>
&gt; + OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br=
>
&gt; ARISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
&gt; + DEALINGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;libqtest.h&quot;<br>
&gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; +<br>
&gt; +#define TIMER_BASE_ADDR 0x40100000UL<br>
&gt; +#define TIMER_ADDR(addr) (TIMER_BASE_ADDR + addr) #define<br>
&gt; +TIMER_EXPIRED_IRQ 127 #define NANOS_PER_SECOND 1000000000LL<br>
&gt; +<br>
&gt; +#define A_ALERT_TEST 0x0<br>
&gt; +#define A_CTRL 0x4<br>
&gt; +#define A_CFG0 0x100<br>
&gt; +#define A_LOWER_0 0x104<br>
&gt; +#define A_UPPER_0 0x108<br>
&gt; +#define A_COMPARE_LOWER0 0x10C<br>
&gt; +#define A_COMPARE_UPPER0 0x110<br>
&gt; +#define A_INTR_ENABLE 0x114<br>
&gt; +#define A_INTR_STATE 0x118<br>
&gt; +#define A_INTR_TEST 0x11C<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Tests that regs get reset properly.<br>
&gt; + */<br>
&gt; +static void test_reset(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 qtest_irq_intercept_in(test, &quot;/machine/soc/plic&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 /* Regs are reset; skip WO regs */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)),=
 =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_EN=
ABLE)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ST=
ATE)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)),=
 =3D=3D, 0x10000);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE=
_LOWER0)),<br>
&gt; =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UINT32_MAX);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE=
_UPPER0)),<br>
&gt; =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UINT32_MAX);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Test that writes worked.<br>
&gt; + */<br>
&gt; +static void test_writes(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_irq_intercept_in(test, &quot;/machine/soc/plic&qu=
ot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Special regs that may/may not need to be tested yet =
*/<br>
&gt; +/*<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_ALERT_T=
EST)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_TE=
ST)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ST=
ATE)), =3D=3D,<br>
&gt; +0); */<br>
&gt; +=C2=A0 =C2=A0 /* Write to ctrl */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)),=
 =3D=3D, 0x1);<br>
&gt; +=C2=A0 =C2=A0 /* Write to intr_enable */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_EN=
ABLE)), =3D=3D,<br>
&gt; +0x1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Writes to config? Though none of it is supported */<=
br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_CFG0), 0x20001);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)),=
 =3D=3D,<br>
&gt; + 0x20001);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Writes to mtime */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0xdeaddad);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D,<br>
&gt; 0xdeaddad);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0xdeaddad);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D,<br>
&gt; + 0xdeaddad);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Writes to mtimecmp */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 0xdead=
dad);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE=
_LOWER0)),<br>
&gt; =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00xdeaddad);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0xdead=
dad);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE=
_UPPER0)),<br>
&gt; =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00xdeaddad);<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Test the standard operation of the timer.<br>
&gt; + */<br>
&gt; +static void test_operation(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* A frequency of 1000000 Hz*/<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-M opentitan &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-global driver=3Dibex-timer,propert=
y=3Dtimebase-freq,value=3D1000000&quot;<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 qtest_irq_intercept_in(test, &quot;/machine/soc/plic&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 /* Set mtimecmp; approx 1 second. */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 100000=
0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Wait for some amount of time. Timer should not tick.=
 */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 30);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* First, enable the timer. */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* The counter should remain at 0, and no interrupts. *=
/<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Let it run for half a second. No interrupts. */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND / 2);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), &lt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), &lt;=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Let it run for half a second again. Interrupt. */<br=
>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND / 2);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Handle interrupt, no more interrupt after. */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0x0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0x0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, TIMER_ADDR(A_INTR_STATE), 0x1);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* One more second. */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0=
)), =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0=
)), =3D=3D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;ibex-timer/reset&quot;, test_reset=
);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;ibex-timer/writes&quot;, test_writ=
es);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;ibex-timer/op&quot;, test_operatio=
n);<br>
&gt; +=C2=A0 =C2=A0 return g_test_run();<br>
&gt; +}<br>
&gt; diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build index<b=
r>
&gt; fb63b8d3fa..7a769a79c5 100644<br>
&gt; --- a/tests/qtest/meson.build<br>
&gt; +++ b/tests/qtest/meson.build<br>
&gt; @@ -235,7 +235,8 @@ qtests_s390x =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;migration-test&#39;]<br>
&gt; <br>
&gt;=C2=A0 qtests_riscv32 =3D \<br>
&gt; -=C2=A0 [&#39;ibex-aon-timer-test&#39;]<br>
&gt; +=C2=A0 [&#39;ibex-aon-timer-test&#39;,<br>
&gt; +=C2=A0 =C2=A0&#39;ibex-timer-test&#39;]<br>
&gt; <br>
&gt;=C2=A0 qos_test_ss =3D ss.source_set()<br>
&gt;=C2=A0 qos_test_ss.add(<br>
&gt; --<br>
&gt; 2.34.1<br>
-Tyler <br>
</blockquote></div></div>

--00000000000087297905e9d300a0--

