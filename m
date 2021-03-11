Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKNTc-0002To-MK
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 10:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKNTZ-0002Jt-Mk; Thu, 11 Mar 2021 10:43:49 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKNTS-0000bg-NK; Thu, 11 Mar 2021 10:43:49 -0500
Received: by mail-io1-xd2a.google.com with SMTP id o9so22386048iow.6;
 Thu, 11 Mar 2021 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iHIK2kOcd3S8jQDMYuCs2OSgeVurDXYZhk2DjhWnslw=;
 b=eVfTZp3QMVfcICJ9nxPjjnB517JTkJqMRXKcmIhnuyDXDpUFDguioG/vqaxCKOirza
 ijrtiDYHZAx0F/x+qVbE+lvDxqHZ6AFXvZsDNqqr5IlGoJZG3b8QHL4uocHSdwXB9iMg
 k2IRs5aPyJGj0WIZHhesdqNXsHMb96GRMOhZNyXYlYQdkdWo9h0XQfGXleeNqkyWsIT7
 cCYuUWP2ed3G3v2AzbqDhV08BWduDAXlof/iA2oWptO3D0ixpFtj1HKwptx1FElZ/5wS
 4VDPi1uu7Pu5bWv9FgfIDuO794jBS3u9aalLWiP0jC+AlTTKncdeNYZFJbWe687l5NOC
 KvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHIK2kOcd3S8jQDMYuCs2OSgeVurDXYZhk2DjhWnslw=;
 b=Fmo0UFW44xZpzJ+1tqFvNrc87Lbz1BSE5I+bM5vKo54H6rCnb3XdUtYH9/Fhxd9zO0
 /sZnT9yqkKTZPU9wnfyAb0urRCcVdfCXxcvOODp4TEfykW07S3cP4y0aQi9KIoVm6hwx
 OvUljKIhLy/o2ILz/9NpB1zkNbxdzRmmDwuwNYg2QKVuUzmpq5+R1PZNFg3dKc6rdJEA
 B0WUo3XTxCVv2Ik7PmoNE7u7BLcDBfoer5utkxzLhWdO0O1fledA2v3nqLdS3Xl7ZMon
 d6NQJfAbNsSblhBPisQjGJxALrZkD281/2uGYfKqVw1Es2dEC4imdIulDMzZ6Uj318v5
 jPAA==
X-Gm-Message-State: AOAM532xKheXcVk9Xs9wcog2ET7PgTGkJ+A2GLjZmdL3UICLyzSwoEEl
 wf62llpmJA1mjbY0pmIQD0SXqfTCxY16b7Hw5QE=
X-Google-Smtp-Source: ABdhPJzIJD+SxH9yz5d/mdCehnUlmjMT7FB+bKoSbXKa8aWfxWiJhtpLG7/EK6Rx4tnHQNLIIsVh8Ailn7uvkVBTuzY=
X-Received: by 2002:a5d:854b:: with SMTP id b11mr6610591ios.105.1615477420293; 
 Thu, 11 Mar 2021 07:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-2-dylan@andestech.com>
 <CALecT5iCBcHfGzakfa6iV_j-03Rncq4+a0PiyftAMYR7dNsOFg@mail.gmail.com>
In-Reply-To: <CALecT5iCBcHfGzakfa6iV_j-03Rncq4+a0PiyftAMYR7dNsOFg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Mar 2021 10:42:18 -0500
Message-ID: <CAKmqyKMwyKreAHnBN=9tPG6EgTLm7kTZL-jPtyJuorQuTOJwPQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Andes RISC-V PLIC
To: Yixun Lan <yixun.lan@gmail.com>
Cc: Dylan Jhong <dylan@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ruinland@andestech.com, 
 alankao@andestech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Thu, 11 Mar 2021 15:43:50 -0000

On Wed, Mar 10, 2021 at 9:58 AM Yixun Lan <yixun.lan@gmail.com> wrote:
>
> On 3/10/21 3:33 AM, Dylan Jhong wrote:
> > Andes PLIC (Platform-Level Interrupt Controller) device provides an
> > interrupt controller functionality based on Andes's PLIC specification.
> >
> > The Andes PLIC can handle either external interrupts (PLIC)
> > or interprocessor interrupts (PLICSW).
> >
> > While Andes PLIC spec includes vector interrupt and interrupt preemption,
> > we leave them as future items for now.
> >
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > ---
> >   hw/intc/Kconfig              |   3 +
> >   hw/intc/andes_plic.c         | 505 +++++++++++++++++++++++++++++++++++
> >   hw/intc/meson.build          |   1 +
> >   include/hw/intc/andes_plic.h | 130 +++++++++
> >   4 files changed, 639 insertions(+)
> >   create mode 100644 hw/intc/andes_plic.c
> >   create mode 100644 include/hw/intc/andes_plic.h
> >
> > diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> > index 66bf0b90b4..b1735c937a 100644
> > --- a/hw/intc/Kconfig
> > +++ b/hw/intc/Kconfig
> > @@ -67,3 +67,6 @@ config SIFIVE_CLINT
> >
> >   config SIFIVE_PLIC
> >       bool
> > +
> > +config ANDES_PLIC
> > +    bool
> > diff --git a/hw/intc/andes_plic.c b/hw/intc/andes_plic.c
> > new file mode 100644
> > index 0000000000..51b5583566
> > --- /dev/null
> > +++ b/hw/intc/andes_plic.c
> > @@ -0,0 +1,505 @@
> > +/*
> > + * Andes PLIC (Platform Level Interrupt Controller)
> > + *
> > + * Copyright (c) 2021 Andes Tech. Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/log.h"
> > +#include "qapi/error.h"
> > +#include "hw/qdev-properties.h"
> > +#include "target/riscv/cpu.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/intc/andes_plic.h"
> > +
> > +/* #define DEBUG_ANDES_PLIC */
> > +#define LOGGE(x...) qemu_log_mask(LOG_GUEST_ERROR, x)
> > +#define xLOG(x...)
> > +#define yLOG(x...) qemu_log(x)
> > +#ifdef DEBUG_ANDES_PLIC
> > +  #define LOG(x...) yLOG(x)
> > +#else
> > +  #define LOG(x...) xLOG(x)
> > +#endif
> > +
> > +enum register_names {
> > +    REG_FEATURE_ENABLE = 0x0000,
> > +    REG_TRIGGER_TYPE_BASE = 0x1080,
> > +    REG_NUM_IRQ_TARGET = 0x1100,
> > +    REG_VER_MAX_PRIORITY = 0x1104,
> > +};
> > +
> > +enum feature_enable_register {
> > +    FER_PREEMPT = (1u << 0),
> > +    FER_VECTORED = (1u << 0),
> > +};
> > +
> > +static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t value)
> > +{
> > +    uint32_t old, new, cmp = qatomic_read(a);
> > +
> > +    do {
> > +        old = cmp;
> > +        new = (old & ~mask) | (value & mask);
> > +        cmp = qatomic_cmpxchg(a, old, new);
> > +    } while (old != cmp);
> > +
> > +    return old;
> > +}
> > +
> > +static void andes_plic_set_pending(AndesPLICState *plic, int irq, bool level)
> > +{
> > +    atomic_set_masked(&plic->pending[irq >> 5], 1 << (irq & 31), -!!level);
> > +}
> > +
> > +static void andes_plic_set_claimed(AndesPLICState *plic, int irq, bool level)
> > +{
> > +    atomic_set_masked(&plic->claimed[irq >> 5], 1 << (irq & 31), -!!level);
> > +}
> > +
> > +static int andes_plic_irqs_pending(AndesPLICState *plic, uint32_t target_id)
> > +{
> > +    int i, j;
> > +    for (i = 0; i < plic->bitfield_words; i++) {
> > +        uint32_t pending_enabled_not_claimed =
> > +            (plic->pending[i] & ~plic->claimed[i]) &
> > +            plic->enable[target_id * plic->bitfield_words + i];
> > +        if (!pending_enabled_not_claimed) {
> > +            continue;
> > +        }
> > +
> > +        for (j = 0; j < 32; j++) {
> > +            int irq = (i << 5) + j;
> > +            uint32_t prio = plic->source_priority[irq];
> > +            int enabled = pending_enabled_not_claimed & (1 << j);
> > +            if (enabled && prio > plic->target_priority[target_id]) {
> > +                return 1;
> > +            }
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> > +void andes_plichw_update(AndesPLICState *plic)
> > +{
> > +    int target_id;
> > +
> > +    /* raise irq on harts where this irq is enabled */
> > +    for (target_id = 0; target_id < plic->num_addrs; target_id++) {
> > +        uint32_t hart_id = plic->addr_config[target_id].hart_id;
> > +        AndesPLICMode mode = plic->addr_config[target_id].mode;
> > +        CPUState *cpu = qemu_get_cpu(hart_id);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            continue;
> > +        }
> > +        int level = andes_plic_irqs_pending(plic, target_id);
> > +
> > +        switch (mode) {
> > +        case PlicMode_M:
> > +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> > +            break;
> > +        case PlicMode_S:
> > +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> > +            break;
> > +        default:
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> > +void andes_plicsw_update(AndesPLICState *plic)
> > +{
> > +    int target_id;
> > +
> > +    /* raise irq on harts where this irq is enabled */
> > +    for (target_id = 0; target_id < plic->num_addrs; target_id++) {
> > +        uint32_t hart_id = plic->addr_config[target_id].hart_id;
> > +        AndesPLICMode mode = plic->addr_config[target_id].mode;
> > +        CPUState *cpu = qemu_get_cpu(hart_id);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            continue;
> > +        }
> > +        int level = andes_plic_irqs_pending(plic, target_id);
> > +
> > +        switch (mode) {
> > +        case PlicMode_M:
> > +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(level));
> > +            break;
> > +        case PlicMode_S:
> > +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SSIP, BOOL_TO_MASK(level));
> > +            break;
> > +        default:
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> > +static uint32_t andes_plic_claim(AndesPLICState *plic, uint32_t target_id)
> > +{
> > +    int i, j;
> > +    uint32_t max_irq = 0;
> > +    uint32_t max_prio = plic->target_priority[target_id];
> > +
> > +    for (i = 0; i < plic->bitfield_words; i++) {
> > +        uint32_t pending_enabled_not_claimed =
> > +            (plic->pending[i] & ~plic->claimed[i]) &
> > +            plic->enable[target_id * plic->bitfield_words + i];
> > +        if (!pending_enabled_not_claimed) {
> > +            continue;
> > +        }
> > +        for (j = 0; j < 32; j++) {
> > +            int irq = (i << 5) + j;
> > +            uint32_t prio = plic->source_priority[irq];
> > +            int enabled = pending_enabled_not_claimed & (1 << j);
> > +            if (enabled && prio > max_prio) {
> > +                max_irq = irq;
> > +                max_prio = prio;
> > +            }
> > +        }
> > +    }
> > +
> > +    if (max_irq) {
> > +        andes_plic_set_pending(plic, max_irq, false);
> > +        andes_plic_set_claimed(plic, max_irq, true);
> > +    }
> > +    return max_irq;
> > +}
> > +
> > +static AndesPLICMode char_to_mode(char c)
> > +{
> > +    switch (c) {
> > +    case 'U': return PlicMode_U;
> > +    case 'S': return PlicMode_S;
> > +    case 'H': return PlicMode_H;
> > +    case 'M': return PlicMode_M;
> > +    default:
> > +        error_report("plic: invalid mode '%c'", c);
> > +        exit(1);
> > +    }
> > +}
> > +
> > +static uint64_t
> > +andes_plic_read(void *opaque, hwaddr addr, unsigned size)
> > +{
> > +    AndesPLICState *plic = ANDES_PLIC(opaque);
> > +
> > +    if ((addr & 0x3)) {
> > +        error_report("%s: invalid register read: %08x",
> > +            __func__, (uint32_t)addr);
> > +    }
> > +
> > +    if (addr_between(addr,
> > +            plic->priority_base,
> > +            (plic->num_sources << 2))) {
> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> > +        return plic->source_priority[irq];
> > +    } else if (addr_between(addr,
> > +                plic->pending_base,
> > +                (plic->num_sources >> 3))) {
> > +        uint32_t word = (addr - plic->pending_base) >> 2;
> > +        return plic->pending[word];
> > +    } else if (addr_between(addr,
> > +                plic->enable_base,
> > +                (plic->num_addrs * plic->enable_stride))) {
> > +        uint32_t target_id = (addr - plic->enable_base) / plic->enable_stride;
> > +        uint32_t wordid = (addr & (plic->enable_stride - 1)) >> 2;
> > +        if (wordid < plic->bitfield_words) {
> > +            return plic->enable[target_id * plic->bitfield_words + wordid];
> > +        }
> > +    } else if (addr_between(addr,
> > +                plic->threshold_base,
> > +                (plic->num_addrs * plic->threshold_stride))) {
> > +        uint32_t target_id =
> > +            (addr - plic->threshold_base) / plic->threshold_stride;
> > +        uint32_t contextid = (addr & (plic->threshold_stride - 1));
> > +        if (contextid == 0) {
> > +            return plic->target_priority[target_id];
> > +        } else if (contextid == 4) {
> > +            uint32_t value = andes_plic_claim(plic, target_id);
> > +            plic->andes_plic_update(plic);
> > +            return value;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void
> > +andes_plic_write(void *opaque, hwaddr addr, uint64_t value, unsigned size)
> > +{
> > +
> > +    AndesPLICState *plic = ANDES_PLIC(opaque);
> > +
> > +    if ((addr & 0x3)) {
> > +        error_report("%s: invalid register write: %08x",
> > +            __func__, (uint32_t)addr);
> > +    }
> > +
> > +    if (addr_between(addr,
> > +            plic->priority_base,
> > +            (plic->num_sources << 2))) {
> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> > +        plic->source_priority[irq] = value & 7;
> > +        plic->andes_plic_update(plic);
> > +        return;
> > +    } else if (addr_between(addr,
> > +                plic->pending_base,
> > +                (plic->num_sources >> 3))) {
> > +        uint32_t word = (addr - plic->pending_base) >> 2;
> > +        uint32_t xchg = plic->pending[word] ^ (uint32_t)value;
> > +        if (xchg) {
> > +            plic->pending[word] |= value;
> > +            plic->andes_plic_update(plic);
> > +        }
> > +        return;
> > +    } else if (addr_between(addr,
> > +                plic->enable_base,
> > +                (plic->num_addrs * plic->enable_stride))) {
> > +        uint32_t target_id = (addr - plic->enable_base) / plic->enable_stride;
> > +        uint32_t wordid = (addr & (plic->enable_stride - 1)) >> 2;
> > +        if (wordid < plic->bitfield_words) {
> > +            plic->enable[target_id * plic->bitfield_words + wordid] = value;
> > +            return;
> > +        }
> > +    } else if (addr_between(addr,
> > +                plic->threshold_base,
> > +                (plic->num_addrs * plic->threshold_stride))) {
> > +        uint32_t target_id =
> > +            (addr - plic->threshold_base) / plic->threshold_stride;
> > +        uint32_t contextid = (addr & (plic->threshold_stride - 1));
> > +        if (contextid == 0) {
> > +            if (value <= plic->num_priorities) {
> > +                plic->target_priority[target_id] = value;
> > +                plic->andes_plic_update(plic);
> > +            }
> > +            return;
> > +        } else if (contextid == 4) {
> > +            if (value < plic->num_sources) {
> > +                andes_plic_set_claimed(plic, value, false);
> > +                plic->andes_plic_update(plic);
> > +            }
> > +            return;
> > +        }
> > +    }
> > +}
> > +
> > +/*
> > + * parse PLIC hart/mode address offset config
> > + *
> > + * "M"              1 hart with M mode
> > + * "MS,MS"          2 harts, 0-1 with M and S mode
> > + * "M,MS,MS,MS,MS"  5 harts, 0 with M mode, 1-5 with M and S mode
> > + */
> > +static void parse_hart_config(AndesPLICState *plic)
> > +{
> > +    int target_id, hart_id, modes;
> > +    const char *p;
> > +    char c;
> > +
> > +    /* count and validate hart/mode combinations */
> > +    target_id = 0, hart_id = 0, modes = 0;
> > +    p = plic->hart_config;
> > +    while ((c = *p++)) {
> > +        if (c == ',') {
> > +            target_id += ctpop8(modes);
> > +            modes = 0;
> > +            hart_id++;
> > +        } else {
> > +            int m = 1 << char_to_mode(c);
> > +            if (modes == (modes | m)) {
> > +                error_report("plic: duplicate mode '%c' in config: %s",
> > +                             c, plic->hart_config);
> > +                exit(1);
> > +            }
> > +            modes |= m;
> > +        }
> > +    }
> > +    if (modes) {
> > +        target_id += ctpop8(modes);
> > +    }
> > +    hart_id++;
> > +
> > +    plic->num_addrs = target_id;
> > +    plic->num_harts = hart_id;
> > +
> > +    /* store hart/mode combinations */
> > +    plic->addr_config = g_new(AndesPLICAddr, plic->num_addrs);
> > +    target_id = 0, hart_id = plic->hartid_base;
> > +    p = plic->hart_config;
> > +    while ((c = *p++)) {
> > +        if (c == ',') {
> > +            hart_id++;
> > +        } else {
> > +            plic->addr_config[target_id].target_id = target_id;
> > +            plic->addr_config[target_id].hart_id = hart_id;
> > +            plic->addr_config[target_id].mode = char_to_mode(c);
> > +            target_id++;
> > +        }
> > +    }
> > +}
> > +
> > +static void andes_plic_irq_request(void *opaque, int irq, int level)
> > +{
> > +    AndesPLICState *plic = opaque;
> > +    andes_plic_set_pending(plic, irq, level > 0);
> > +    plic->andes_plic_update(plic);
> > +}
> > +
> > +static const MemoryRegionOps andes_plic_ops = {
> > +    .read = andes_plic_read,
> > +    .write = andes_plic_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8
> > +    }
> > +};
> > +
> > +static void
> > +andes_plic_realize(DeviceState *dev, Error **errp)
> > +{
> > +    LOG("%s:\n", __func__);
> > +    AndesPLICState *plic = ANDES_PLIC(dev);
> > +
> > +    memory_region_init_io(&plic->mmio, OBJECT(dev), &andes_plic_ops, plic,
> > +                          TYPE_ANDES_PLIC, plic->aperture_size);
> > +
> > +    parse_hart_config(plic);
> > +    plic->bitfield_words = (plic->num_sources + 31) >> 5;
> > +    plic->num_enables = plic->bitfield_words * plic->num_addrs;
> > +    plic->source_priority = g_new0(uint32_t, plic->num_sources);
> > +    plic->target_priority = g_new0(uint32_t, plic->num_addrs);
> > +    plic->pending = g_new0(uint32_t, plic->bitfield_words);
> > +    plic->claimed = g_new0(uint32_t, plic->bitfield_words);
> > +    plic->enable = g_new0(uint32_t, plic->num_enables);
> > +
> > +    if (strstr(plic->plic_name , "SW") != NULL) {
> > +        plic->andes_plic_update = andes_plicsw_update;
> > +    } else {
> > +        plic->andes_plic_update = andes_plichw_update;
> > +    }
> > +
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
> > +    qdev_init_gpio_in(dev, andes_plic_irq_request, plic->num_sources);
> > +}
> > +
> > +static Property andes_plic_properties[] = {
> > +    DEFINE_PROP_STRING("plic-name", AndesPLICState, plic_name),
> > +    DEFINE_PROP_UINT32("plic-base", AndesPLICState, plic_base, 0),
> > +    DEFINE_PROP_STRING("hart-config", AndesPLICState, hart_config),
> > +    DEFINE_PROP_UINT32("num-sources", AndesPLICState, num_sources, 0),
> > +    DEFINE_PROP_UINT32("num-priorities", AndesPLICState, num_priorities, 0),
> > +    DEFINE_PROP_UINT32("priority-base", AndesPLICState, priority_base, 0),
> > +    DEFINE_PROP_UINT32("pending-base", AndesPLICState, pending_base, 0),
> > +    DEFINE_PROP_UINT32("enable-base", AndesPLICState, enable_base, 0),
> > +    DEFINE_PROP_UINT32("enable-stride", AndesPLICState, enable_stride, 0),
> > +    DEFINE_PROP_UINT32("threshold-base", AndesPLICState, threshold_base, 0),
> > +    DEFINE_PROP_UINT32("threshold-stride", AndesPLICState, threshold_stride, 0),
> > +    DEFINE_PROP_UINT32("aperture-size", AndesPLICState, aperture_size, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void andes_plic_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    /* TODO: add own properties */
> > +    device_class_set_props(dc, andes_plic_properties);
> > +    dc->realize = andes_plic_realize;
> > +}
> > +
> > +static const TypeInfo andes_plic_info = {
> > +    .name          = TYPE_ANDES_PLIC,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(AndesPLICState),
> > +    .class_init    = andes_plic_class_init,
> > +};
> > +
> > +static void andes_plic_register_types(void)
> > +{
> > +    LOG("%s:\n", __func__);
> > +    type_register_static(&andes_plic_info);
> > +}
> > +
> > +type_init(andes_plic_register_types)
> > +
> > +/*
> > + * Create PLIC device.
> > + */
> > +DeviceState *andes_plic_create(hwaddr plic_base,
> > +    const char *plic_name, char *hart_config,
> > +    uint32_t num_sources, uint32_t num_priorities,
> > +    uint32_t priority_base, uint32_t pending_base,
> > +    uint32_t enable_base, uint32_t enable_stride,
> > +    uint32_t threshold_base, uint32_t threshold_stride,
> > +    uint32_t aperture_size)
> > +{
> > +    DeviceState *dev = qdev_new(TYPE_ANDES_PLIC);
> > +
> > +    assert(enable_stride == (enable_stride & -enable_stride));
> > +    assert(threshold_stride == (threshold_stride & -threshold_stride));
> > +    qdev_prop_set_string(dev, "plic-name", plic_name);
> > +    qdev_prop_set_uint32(dev, "plic-base", plic_base);
> > +    qdev_prop_set_string(dev, "hart-config", hart_config);
> > +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
> > +    qdev_prop_set_uint32(dev, "num-priorities", num_priorities);
> > +    qdev_prop_set_uint32(dev, "priority-base", priority_base);
> > +    qdev_prop_set_uint32(dev, "pending-base", pending_base);
> > +    qdev_prop_set_uint32(dev, "enable-base", enable_base);
> > +    qdev_prop_set_uint32(dev, "enable-stride", enable_stride);
> > +    qdev_prop_set_uint32(dev, "threshold-base", threshold_base);
> > +    qdev_prop_set_uint32(dev, "threshold-stride", threshold_stride);
> > +    qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
> > +
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, plic_base);
> > +    return dev;
> > +}
> > +
> > +/*
> > + * Create PLICSW device.
> > + */
> > +DeviceState *andes_plicsw_create(hwaddr plic_base,
> > +    const char *plic_name, char *hart_config,
> > +    uint32_t num_sources, uint32_t num_priorities,
> > +    uint32_t priority_base, uint32_t pending_base,
> > +    uint32_t enable_base, uint32_t enable_stride,
> > +    uint32_t threshold_base, uint32_t threshold_stride,
> > +    uint32_t aperture_size)
> > +{
> > +    DeviceState *dev = qdev_new(TYPE_ANDES_PLIC);
> > +
> > +    assert(enable_stride == (enable_stride & -enable_stride));
> > +    assert(threshold_stride == (threshold_stride & -threshold_stride));
> > +    qdev_prop_set_string(dev, "plic-name", plic_name);
> > +    qdev_prop_set_uint32(dev, "plic-base", plic_base);
> > +    qdev_prop_set_string(dev, "hart-config", hart_config);
> > +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
> > +    qdev_prop_set_uint32(dev, "num-priorities", num_priorities);
> > +    qdev_prop_set_uint32(dev, "priority-base", priority_base);
> > +    qdev_prop_set_uint32(dev, "pending-base", pending_base);
> > +    qdev_prop_set_uint32(dev, "enable-base", enable_base);
> > +    qdev_prop_set_uint32(dev, "enable-stride", enable_stride);
> > +    qdev_prop_set_uint32(dev, "threshold-base", threshold_base);
> > +    qdev_prop_set_uint32(dev, "threshold-stride", threshold_stride);
> > +    qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
> > +
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, plic_base);
> > +    return dev;
> > +}
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index b3d9345a0d..0d2cb94a2f 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -25,6 +25,7 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
> >   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
> >
> >   specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
> > +specific_ss.add(when: 'CONFIG_ANDES_PLIC', if_true: files('andes_plic.c'))
> >   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
> >   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
> >   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> > diff --git a/include/hw/intc/andes_plic.h b/include/hw/intc/andes_plic.h
> > new file mode 100644
> > index 0000000000..9e1212ba09
> > --- /dev/null
> > +++ b/include/hw/intc/andes_plic.h
> > @@ -0,0 +1,130 @@
> > +/*
> > + * Andes PLIC (Platform Level Interrupt Controller) interface
> > + *
> > + * Copyright (c) 2018 Andes Tech. Corp.
> > + *
> > + * This provides a RISC-V PLIC device with Andes' extensions.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef HW_ANDES_PLIC_H
> > +#define HW_ANDES_PLIC_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qom/object.h"
> > +
> > +#define ANDES_AE350_PLIC_NAME             "ANDES_PLIC"
> > +#define ANDES_AE350_PLIC_HART_CONFIG      "MS"
> > +#define ANDES_AE350_PLIC_NUM_SOURCES      128
> > +#define ANDES_AE350_PLIC_NUM_PRIORITIES   32
> > +#define ANDES_AE350_PLIC_PRIORITY_BASE    0x04
> > +#define ANDES_AE350_PLIC_PENDING_BASE     0x1000
> > +#define ANDES_AE350_PLIC_ENABLE_BASE      0x2000
> > +#define ANDES_AE350_PLIC_ENABLE_STRIDE    0x80
> > +#define ANDES_AE350_PLIC_THRESHOLD_BASE   0x200000
> > +#define ANDES_AE350_PLIC_THRESHOLD_STRIDE 0x1000
> > +
> > +#define ANDES_AE350_PLICSW_NAME           "ANDES_PLICSW"
> > +#define ANDES_AE350_PLICSW_HART_CONFIG    "M"
> > +#define ANDES_AE350_PLICSW_NUM_SOURCES    64
> > +#define ANDES_AE350_PLICSW_NUM_PRIORITIES 8
> > +#define ANDES_AE350_PLICSW_PRIORITY_BASE  0x4
> > +#define ANDES_AE350_PLICSW_PENDING_BASE   0x1000
> > +#define ANDES_AE350_PLICSW_ENABLE_BASE    0x2000
> > +#define ANDES_AE350_PLICSW_ENABLE_STRIDE  0x80
> > +#define ANDES_AE350_PLICSW_THRESHOLD_BASE   0x200000
> > +#define ANDES_AE350_PLICSW_THRESHOLD_STRIDE 0x1000
> > +
> > +#define TYPE_ANDES_PLIC "riscv.andes.plic"
> > +
> > +typedef struct AndesPLICState AndesPLICState;
> > +DECLARE_INSTANCE_CHECKER(AndesPLICState, ANDES_PLIC,
> > +                         TYPE_ANDES_PLIC)
> > +
> > +typedef enum AndesPLICMode {
> > +    PlicMode_U,
> > +    PlicMode_S,
> > +    PlicMode_H,
> > +    PlicMode_M
> > +} AndesPLICMode;
> > +
> > +typedef struct AndesPLICAddr {
> > +    uint32_t target_id;
> > +    uint32_t hart_id;
> > +    AndesPLICMode mode;
> > +} AndesPLICAddr;
> > +
> > +typedef struct AndesPLICState {
> > +    /*< private >*/
> > +    SysBusDevice parent_mmio;
> > +
> > +    /*< public >*/
> > +    MemoryRegion mmio;
> > +    uint32_t num_addrs;
> > +    uint32_t num_harts;
> > +    uint32_t bitfield_words;
> > +    uint32_t num_enables;
> > +    AndesPLICAddr *addr_config;
> > +    uint32_t *source_priority;
> > +    uint32_t *target_priority;
> > +    uint32_t *pending;
> > +    uint32_t *claimed;
> > +    uint32_t *enable;
> > +
> > +    /* config */
> > +    char *hart_config;
> > +    char *plic_name;
> > +    uint32_t plic_base;
> > +    uint32_t hartid_base;
> > +    uint32_t num_sources;
> > +    uint32_t num_priorities;
> > +    uint32_t priority_base;
> > +    uint32_t pending_base;
> > +    uint32_t enable_base;
> > +    uint32_t enable_stride;
> > +    uint32_t threshold_base;
> > +    uint32_t threshold_stride;
> > +    uint32_t aperture_size;
> > +
> > +    /* interface */
> > +    void (*andes_plic_update)(AndesPLICState *plic);
> > +} AndesPLICState;
> > +
>
> Try to follow up Bin's PLIC question ..
>
> The above data structures are quite similar to SiFive's [1]
> So, is it possible to merge into a common file? for better maintenance
>
> [1] include/hw/intc/sifive_plic.h

+1 on this. From a quick look it seems similar to the SiFive PLIC.
Could this be combined with that?

Alistair

>
>
> > +void andes_plichw_update(AndesPLICState *plic);
> > +void andes_plicsw_update(AndesPLICState *plic);
> > +
> > +static inline bool addr_between(uint32_t addr, uint32_t base, uint32_t offset)
> > +{
> > +    return (addr >= base && addr < base + offset);
> > +}
> > +
> > +DeviceState *
> > +andes_plic_create(hwaddr addr,
> > +    const char *plic_name, char *hart_config,
> > +    uint32_t num_sources, uint32_t num_priorities,
> > +    uint32_t priority_base, uint32_t pending_base,
> > +    uint32_t enable_base, uint32_t enable_stride,
> > +    uint32_t threshold_base, uint32_t threshold_stride,
> > +    uint32_t aperture_size);
> > +
> > +DeviceState *
> > +andes_plicsw_create(hwaddr addr,
> > +    const char *plic_name, char *hart_config,
> > +    uint32_t num_sources, uint32_t num_priorities,
> > +    uint32_t priority_base, uint32_t pending_base,
> > +    uint32_t enable_base, uint32_t enable_stride,
> > +    uint32_t threshold_base, uint32_t threshold_stride,
> > +    uint32_t aperture_size);
> > +
> > +#endif
> >
>

