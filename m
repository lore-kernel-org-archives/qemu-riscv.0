Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqnGl-0003Sm-Vm
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 21:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lqnGj-0003Op-VL; Tue, 08 Jun 2021 21:44:33 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lqnGh-0006z9-EW; Tue, 08 Jun 2021 21:44:33 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id q21so33040743ybg.8;
 Tue, 08 Jun 2021 18:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yt7x1MLwl7jSl0m7OxRo009ZXHL1jFmGxtu1kML4xwU=;
 b=uZItm+Bix07aB8IAR+Q8XjY8ZGatcoW5fR2cF0MXskrrBaamACgpBXzfTPsuk/27Zi
 cjh5WXPRkItb2fkln0VJG+MjSHiwRrsMHHh4V/M+/7d34/Z9A0YnsD5w7k316jpkwHFN
 KXBehuP6uCr4+GK5/odjQzoCcVN6hB1bSVuZS1eFy7pBsGuYXS/YXGFAebF7SYDDGiRT
 XJ1r4JxKxbn2nHResVmPohHToLNGcYUD/7Zxg/DUHb7tXN8EeMky8VIUliC+XqlL2y2l
 g8jLTSJr/+dWbORWKxoDJgEm4YXgsTK4HDqv7ExH0x8DN4diqzxD9DeoYDWK+kzY2gU1
 koSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yt7x1MLwl7jSl0m7OxRo009ZXHL1jFmGxtu1kML4xwU=;
 b=QZ6890XcOZdpnp2cHflxiCnQjL8x77ITpX4J5ctGx1e8NLunVv+iWX33uHzelmXkuz
 1aC42y2Pf39NGGZx55uFHY6FGkZAx7Ci3AX/BGQHdIaw+44E9wpwQlqhbCf2fThtk9y8
 kERNIWY/7/E1SOJ4r7NRYrDvvS9kq5kpZtSV/7z4ZATxQvo7tdo+s65gYWVodfemmAo+
 V8GvNbGyEvOY1w3UL6opBtMxoYlrr3cF6Cjr55mvulnGf7WmV9kv47euUfMJqX+2+jmG
 iUSEzaiK2L3pgfM768AMwh8B5mY0gZKhF5P0qqLJLgXOtJo4dtvy84kP1QAypEp3Xzq1
 q7sA==
X-Gm-Message-State: AOAM532ISZQK1oMHwtu822Uas4vxAXn/cetmfRZfowMrCRyVvm2IQpRQ
 BkUe4vzs15En2UbH7Sq6+xku9pKkybr0hCDnE7c=
X-Google-Smtp-Source: ABdhPJwF8tRNiQK7POt7XOFsODOFZmAMXqcBFW+ODvtm4UR9EM53CJ7LQyu72JXkZOBUfg8n2bEFAoncAAdBL9u21bQ=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr20085884ybn.152.1623203068831; 
 Tue, 08 Jun 2021 18:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623196022.git.alistair.francis@wdc.com>
 <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
In-Reply-To: <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 9 Jun 2021 09:44:17 +0800
Message-ID: <CAEUhbmVTNB4KZ+H096gOQxptnYDkUY7A4TvsGqHf9h8xBRw-SA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/timer: Initial commit of Ibex Timer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 09 Jun 2021 01:44:34 -0000

On Wed, Jun 9, 2021 at 7:49 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add support for the Ibex timer. This is used with the RISC-V
> mtime/mtimecmp similar to the SiFive CLINT.
>
> We currently don't support changing the prescale or the timervalue.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/timer/ibex_timer.h |  52 ++++++
>  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   6 +-
>  hw/timer/meson.build          |   1 +
>  4 files changed, 360 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/timer/ibex_timer.h
>  create mode 100644 hw/timer/ibex_timer.c
>
> diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> new file mode 100644
> index 0000000000..6a43537003
> --- /dev/null
> +++ b/include/hw/timer/ibex_timer.h
> @@ -0,0 +1,52 @@
> +/*
> + * QEMU lowRISC Ibex Timer device
> + *
> + * Copyright (c) 2021 Western Digital
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_IBEX_TIMER_H
> +#define HW_IBEX_TIMER_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_IBEX_TIMER "ibex-timer"
> +OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
> +
> +struct IbexTimerState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +
> +    uint32_t timer_ctrl;
> +    uint32_t timer_cfg0;
> +    uint32_t timer_compare_lower0;
> +    uint32_t timer_compare_upper0;
> +    uint32_t timer_intr_enable;
> +    uint32_t timer_intr_state;
> +    uint32_t timer_intr_test;
> +
> +    uint32_t timebase_freq;
> +
> +    qemu_irq irq;
> +};
> +#endif /* HW_IBEX_TIMER_H */
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> new file mode 100644
> index 0000000000..4d55eb5088
> --- /dev/null
> +++ b/hw/timer/ibex_timer.c
> @@ -0,0 +1,305 @@
> +/*
> + * QEMU lowRISC Ibex Timer device
> + *
> + * Copyright (c) 2021 Western Digital
> + *
> + * For details check the documentation here:
> + *    https://docs.opentitan.org/hw/ip/rv_timer/doc/
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/timer.h"
> +#include "hw/timer/ibex_timer.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "target/riscv/cpu.h"
> +#include "migration/vmstate.h"
> +
> +REG32(CTRL, 0x00)
> +    FIELD(CTRL, ACTIVE, 0, 1)
> +REG32(CFG0, 0x100)
> +    FIELD(CFG0, PRESCALE, 0, 12)
> +    FIELD(CFG0, STEP, 16, 8)
> +REG32(LOWER0, 0x104)
> +REG32(UPPER0, 0x108)
> +REG32(COMPARE_LOWER0, 0x10C)
> +REG32(COMPARE_UPPER0, 0x110)
> +REG32(INTR_ENABLE, 0x114)
> +    FIELD(INTR_ENABLE, IE_0, 0, 1)
> +REG32(INTR_STATE, 0x118)
> +    FIELD(INTR_STATE, IS_0, 0, 1)
> +REG32(INTR_TEST, 0x11C)
> +    FIELD(INTR_TEST, T_0, 0, 1)
> +
> +static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> +{
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                    timebase_freq, NANOSECONDS_PER_SECOND);
> +}
> +
> +static void ibex_timer_update_irqs(IbexTimerState *s)
> +{
> +    CPUState *cs = qemu_get_cpu(0);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    uint64_t value = s->timer_compare_lower0 |
> +                         ((uint64_t)s->timer_compare_upper0 << 32);
> +    uint64_t next, diff;
> +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> +
> +    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> +        /* Timer isn't active */
> +        return;
> +    }
> +
> +    /* Update the CPUs mtimecmp */
> +    cpu->env.timecmp = value;
> +
> +    if (cpu->env.timecmp <= now) {
> +        /*
> +         * If the mtimecmp was in the past raise the interrupt now.
> +         */
> +        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> +        if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> +            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> +            qemu_set_irq(s->irq, true);
> +        }
> +        return;
> +    }
> +
> +    /* Setup a timer to trigger the interrupt in the future */
> +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> +    qemu_set_irq(s->irq, false);
> +
> +    diff = cpu->env.timecmp - now;
> +    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                                 muldiv64(diff,
> +                                          NANOSECONDS_PER_SECOND,
> +                                          s->timebase_freq);
> +
> +    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> +        /* We overflowed the timer, just set it as large as we can */
> +        timer_mod(cpu->env.timer, 0x07FFFFFFFFFFFFFF);

Still not correct? should be 0x7FFFFFFFFFFFFFFF?

> +    } else {
> +        timer_mod(cpu->env.timer, next);
> +    }
> +}
> +

Regards,
Bin

