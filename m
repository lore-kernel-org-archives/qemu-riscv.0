Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJtew-0002iR-8o
	for mharc-qemu-riscv@gnu.org; Wed, 10 Mar 2021 02:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yixun.lan@gmail.com>)
 id 1lJtet-0002iE-EG; Wed, 10 Mar 2021 02:53:31 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yixun.lan@gmail.com>)
 id 1lJten-0007Ax-Vq; Wed, 10 Mar 2021 02:53:29 -0500
Received: by mail-oi1-x22b.google.com with SMTP id o22so8391335oic.3;
 Tue, 09 Mar 2021 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnsXO0iqtvaSFqoq1fvHF5FpvwAOn4zce66KN9iEEps=;
 b=BjlspB7k3w3uXaLtHIOuZDLgyDalMs5+wUVwl9bpWTK3mbcQNqjMdiqrOofEiZvFul
 WZ1TFQj9T6ZP9uctljmGqreTLv/B+ltfMEnOiEi8ji2Z6FWhm9FUvLOkI4V8AkAixq1K
 qwKYIosJL6zqBpS5tWhCxC7GkK+QZOFOshpuoqisrmBiUkJoNe0CmNbBQi+XkqPmmYMo
 CWgJSyz0L5vk/s4htItdtNdIK7e/jxAcGIoHcK5M0lpVkxd9TxYWHmOHD/DJ3xqOXi1u
 o7wUYNRWInX/ejY/PeuBXPr8wQVaXlgs3pYq8tvpfIuhV65/vPUreWWUKsg2fot2r0V7
 0wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnsXO0iqtvaSFqoq1fvHF5FpvwAOn4zce66KN9iEEps=;
 b=VelMSnquuYcJq7QaXJr9XsZXt3oGI/X6IDQEFvho+VqW7HNxME9wF7JqZfPd0XEbIO
 Jp8Jc+Kfco5+Po85Ti65vkCvtFGuEZHgE86WDFu7HZnR3SNg0UsUKJwJ5mAZHL0+dRJa
 h4NYmYOkp4xruRMcmu7nbKoqZD2sQXNKs8DJn1BzR+GWnYBRGJfQka+1bOaHPhd+NIWk
 2Ry9ESak5y/vVLXKRLKP6X0HYCbrzqP9B/+p1trUcLDfwIhMDJbtp85RALLnulGhLg9n
 28QRoTM0hdC3+/PPCcLcdwMdTQP8qjQgqYyOT2yLLC+OzMri1UpSy2emzESPV6J312o1
 VBvQ==
X-Gm-Message-State: AOAM530uRaYHNIqLHBp3Z83aDGogDKrqTKibXv7dC3Fz2dehH1A3jvp2
 l5U3CQ2vrnxuFFP4i+g1g9l1Mr+sQfjO4LZrfO4=
X-Google-Smtp-Source: ABdhPJyklcyZEE9U8v57hiblDXXGlQwjF4uUbMweIKZ4iTbY14YeUu556PYhPQcJOkPY1W1QdYHoUL5jP0EUKSHIeX8=
X-Received: by 2002:aca:3683:: with SMTP id d125mr1593773oia.32.1615362803707; 
 Tue, 09 Mar 2021 23:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-2-dylan@andestech.com>
In-Reply-To: <20210310033358.30499-2-dylan@andestech.com>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Wed, 10 Mar 2021 07:50:38 +0000
Message-ID: <CALecT5iCBcHfGzakfa6iV_j-03Rncq4+a0PiyftAMYR7dNsOFg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Andes RISC-V PLIC
To: Dylan Jhong <dylan@andestech.com>, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, 
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: ruinland@andestech.com, alankao@andestech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=yixun.lan@gmail.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Wed, 10 Mar 2021 07:53:32 -0000

On 3/10/21 3:33 AM, Dylan Jhong wrote:
> Andes PLIC (Platform-Level Interrupt Controller) device provides an
> interrupt controller functionality based on Andes's PLIC specification.
>
> The Andes PLIC can handle either external interrupts (PLIC)
> or interprocessor interrupts (PLICSW).
>
> While Andes PLIC spec includes vector interrupt and interrupt preemption,
> we leave them as future items for now.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>   hw/intc/Kconfig              |   3 +
>   hw/intc/andes_plic.c         | 505 +++++++++++++++++++++++++++++++++++
>   hw/intc/meson.build          |   1 +
>   include/hw/intc/andes_plic.h | 130 +++++++++
>   4 files changed, 639 insertions(+)
>   create mode 100644 hw/intc/andes_plic.c
>   create mode 100644 include/hw/intc/andes_plic.h
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 66bf0b90b4..b1735c937a 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -67,3 +67,6 @@ config SIFIVE_CLINT
>
>   config SIFIVE_PLIC
>       bool
> +
> +config ANDES_PLIC
> +    bool
> diff --git a/hw/intc/andes_plic.c b/hw/intc/andes_plic.c
> new file mode 100644
> index 0000000000..51b5583566
> --- /dev/null
> +++ b/hw/intc/andes_plic.c
> @@ -0,0 +1,505 @@
> +/*
> + * Andes PLIC (Platform Level Interrupt Controller)
> + *
> + * Copyright (c) 2021 Andes Tech. Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/qdev-properties.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/andes_plic.h"
> +
> +/* #define DEBUG_ANDES_PLIC */
> +#define LOGGE(x...) qemu_log_mask(LOG_GUEST_ERROR, x)
> +#define xLOG(x...)
> +#define yLOG(x...) qemu_log(x)
> +#ifdef DEBUG_ANDES_PLIC
> +  #define LOG(x...) yLOG(x)
> +#else
> +  #define LOG(x...) xLOG(x)
> +#endif
> +
> +enum register_names {
> +    REG_FEATURE_ENABLE = 0x0000,
> +    REG_TRIGGER_TYPE_BASE = 0x1080,
> +    REG_NUM_IRQ_TARGET = 0x1100,
> +    REG_VER_MAX_PRIORITY = 0x1104,
> +};
> +
> +enum feature_enable_register {
> +    FER_PREEMPT = (1u << 0),
> +    FER_VECTORED = (1u << 0),
> +};
> +
> +static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t value)
> +{
> +    uint32_t old, new, cmp = qatomic_read(a);
> +
> +    do {
> +        old = cmp;
> +        new = (old & ~mask) | (value & mask);
> +        cmp = qatomic_cmpxchg(a, old, new);
> +    } while (old != cmp);
> +
> +    return old;
> +}
> +
> +static void andes_plic_set_pending(AndesPLICState *plic, int irq, bool level)
> +{
> +    atomic_set_masked(&plic->pending[irq >> 5], 1 << (irq & 31), -!!level);
> +}
> +
> +static void andes_plic_set_claimed(AndesPLICState *plic, int irq, bool level)
> +{
> +    atomic_set_masked(&plic->claimed[irq >> 5], 1 << (irq & 31), -!!level);
> +}
> +
> +static int andes_plic_irqs_pending(AndesPLICState *plic, uint32_t target_id)
> +{
> +    int i, j;
> +    for (i = 0; i < plic->bitfield_words; i++) {
> +        uint32_t pending_enabled_not_claimed =
> +            (plic->pending[i] & ~plic->claimed[i]) &
> +            plic->enable[target_id * plic->bitfield_words + i];
> +        if (!pending_enabled_not_claimed) {
> +            continue;
> +        }
> +
> +        for (j = 0; j < 32; j++) {
> +            int irq = (i << 5) + j;
> +            uint32_t prio = plic->source_priority[irq];
> +            int enabled = pending_enabled_not_claimed & (1 << j);
> +            if (enabled && prio > plic->target_priority[target_id]) {
> +                return 1;
> +            }
> +        }
> +    }
> +    return 0;
> +}
> +
> +void andes_plichw_update(AndesPLICState *plic)
> +{
> +    int target_id;
> +
> +    /* raise irq on harts where this irq is enabled */
> +    for (target_id = 0; target_id < plic->num_addrs; target_id++) {
> +        uint32_t hart_id = plic->addr_config[target_id].hart_id;
> +        AndesPLICMode mode = plic->addr_config[target_id].mode;
> +        CPUState *cpu = qemu_get_cpu(hart_id);
> +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +        if (!env) {
> +            continue;
> +        }
> +        int level = andes_plic_irqs_pending(plic, target_id);
> +
> +        switch (mode) {
> +        case PlicMode_M:
> +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> +            break;
> +        case PlicMode_S:
> +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +void andes_plicsw_update(AndesPLICState *plic)
> +{
> +    int target_id;
> +
> +    /* raise irq on harts where this irq is enabled */
> +    for (target_id = 0; target_id < plic->num_addrs; target_id++) {
> +        uint32_t hart_id = plic->addr_config[target_id].hart_id;
> +        AndesPLICMode mode = plic->addr_config[target_id].mode;
> +        CPUState *cpu = qemu_get_cpu(hart_id);
> +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +        if (!env) {
> +            continue;
> +        }
> +        int level = andes_plic_irqs_pending(plic, target_id);
> +
> +        switch (mode) {
> +        case PlicMode_M:
> +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(level));
> +            break;
> +        case PlicMode_S:
> +            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SSIP, BOOL_TO_MASK(level));
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static uint32_t andes_plic_claim(AndesPLICState *plic, uint32_t target_id)
> +{
> +    int i, j;
> +    uint32_t max_irq = 0;
> +    uint32_t max_prio = plic->target_priority[target_id];
> +
> +    for (i = 0; i < plic->bitfield_words; i++) {
> +        uint32_t pending_enabled_not_claimed =
> +            (plic->pending[i] & ~plic->claimed[i]) &
> +            plic->enable[target_id * plic->bitfield_words + i];
> +        if (!pending_enabled_not_claimed) {
> +            continue;
> +        }
> +        for (j = 0; j < 32; j++) {
> +            int irq = (i << 5) + j;
> +            uint32_t prio = plic->source_priority[irq];
> +            int enabled = pending_enabled_not_claimed & (1 << j);
> +            if (enabled && prio > max_prio) {
> +                max_irq = irq;
> +                max_prio = prio;
> +            }
> +        }
> +    }
> +
> +    if (max_irq) {
> +        andes_plic_set_pending(plic, max_irq, false);
> +        andes_plic_set_claimed(plic, max_irq, true);
> +    }
> +    return max_irq;
> +}
> +
> +static AndesPLICMode char_to_mode(char c)
> +{
> +    switch (c) {
> +    case 'U': return PlicMode_U;
> +    case 'S': return PlicMode_S;
> +    case 'H': return PlicMode_H;
> +    case 'M': return PlicMode_M;
> +    default:
> +        error_report("plic: invalid mode '%c'", c);
> +        exit(1);
> +    }
> +}
> +
> +static uint64_t
> +andes_plic_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    AndesPLICState *plic = ANDES_PLIC(opaque);
> +
> +    if ((addr & 0x3)) {
> +        error_report("%s: invalid register read: %08x",
> +            __func__, (uint32_t)addr);
> +    }
> +
> +    if (addr_between(addr,
> +            plic->priority_base,
> +            (plic->num_sources << 2))) {
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        return plic->source_priority[irq];
> +    } else if (addr_between(addr,
> +                plic->pending_base,
> +                (plic->num_sources >> 3))) {
> +        uint32_t word = (addr - plic->pending_base) >> 2;
> +        return plic->pending[word];
> +    } else if (addr_between(addr,
> +                plic->enable_base,
> +                (plic->num_addrs * plic->enable_stride))) {
> +        uint32_t target_id = (addr - plic->enable_base) / plic->enable_stride;
> +        uint32_t wordid = (addr & (plic->enable_stride - 1)) >> 2;
> +        if (wordid < plic->bitfield_words) {
> +            return plic->enable[target_id * plic->bitfield_words + wordid];
> +        }
> +    } else if (addr_between(addr,
> +                plic->threshold_base,
> +                (plic->num_addrs * plic->threshold_stride))) {
> +        uint32_t target_id =
> +            (addr - plic->threshold_base) / plic->threshold_stride;
> +        uint32_t contextid = (addr & (plic->threshold_stride - 1));
> +        if (contextid == 0) {
> +            return plic->target_priority[target_id];
> +        } else if (contextid == 4) {
> +            uint32_t value = andes_plic_claim(plic, target_id);
> +            plic->andes_plic_update(plic);
> +            return value;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void
> +andes_plic_write(void *opaque, hwaddr addr, uint64_t value, unsigned size)
> +{
> +
> +    AndesPLICState *plic = ANDES_PLIC(opaque);
> +
> +    if ((addr & 0x3)) {
> +        error_report("%s: invalid register write: %08x",
> +            __func__, (uint32_t)addr);
> +    }
> +
> +    if (addr_between(addr,
> +            plic->priority_base,
> +            (plic->num_sources << 2))) {
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        plic->source_priority[irq] = value & 7;
> +        plic->andes_plic_update(plic);
> +        return;
> +    } else if (addr_between(addr,
> +                plic->pending_base,
> +                (plic->num_sources >> 3))) {
> +        uint32_t word = (addr - plic->pending_base) >> 2;
> +        uint32_t xchg = plic->pending[word] ^ (uint32_t)value;
> +        if (xchg) {
> +            plic->pending[word] |= value;
> +            plic->andes_plic_update(plic);
> +        }
> +        return;
> +    } else if (addr_between(addr,
> +                plic->enable_base,
> +                (plic->num_addrs * plic->enable_stride))) {
> +        uint32_t target_id = (addr - plic->enable_base) / plic->enable_stride;
> +        uint32_t wordid = (addr & (plic->enable_stride - 1)) >> 2;
> +        if (wordid < plic->bitfield_words) {
> +            plic->enable[target_id * plic->bitfield_words + wordid] = value;
> +            return;
> +        }
> +    } else if (addr_between(addr,
> +                plic->threshold_base,
> +                (plic->num_addrs * plic->threshold_stride))) {
> +        uint32_t target_id =
> +            (addr - plic->threshold_base) / plic->threshold_stride;
> +        uint32_t contextid = (addr & (plic->threshold_stride - 1));
> +        if (contextid == 0) {
> +            if (value <= plic->num_priorities) {
> +                plic->target_priority[target_id] = value;
> +                plic->andes_plic_update(plic);
> +            }
> +            return;
> +        } else if (contextid == 4) {
> +            if (value < plic->num_sources) {
> +                andes_plic_set_claimed(plic, value, false);
> +                plic->andes_plic_update(plic);
> +            }
> +            return;
> +        }
> +    }
> +}
> +
> +/*
> + * parse PLIC hart/mode address offset config
> + *
> + * "M"              1 hart with M mode
> + * "MS,MS"          2 harts, 0-1 with M and S mode
> + * "M,MS,MS,MS,MS"  5 harts, 0 with M mode, 1-5 with M and S mode
> + */
> +static void parse_hart_config(AndesPLICState *plic)
> +{
> +    int target_id, hart_id, modes;
> +    const char *p;
> +    char c;
> +
> +    /* count and validate hart/mode combinations */
> +    target_id = 0, hart_id = 0, modes = 0;
> +    p = plic->hart_config;
> +    while ((c = *p++)) {
> +        if (c == ',') {
> +            target_id += ctpop8(modes);
> +            modes = 0;
> +            hart_id++;
> +        } else {
> +            int m = 1 << char_to_mode(c);
> +            if (modes == (modes | m)) {
> +                error_report("plic: duplicate mode '%c' in config: %s",
> +                             c, plic->hart_config);
> +                exit(1);
> +            }
> +            modes |= m;
> +        }
> +    }
> +    if (modes) {
> +        target_id += ctpop8(modes);
> +    }
> +    hart_id++;
> +
> +    plic->num_addrs = target_id;
> +    plic->num_harts = hart_id;
> +
> +    /* store hart/mode combinations */
> +    plic->addr_config = g_new(AndesPLICAddr, plic->num_addrs);
> +    target_id = 0, hart_id = plic->hartid_base;
> +    p = plic->hart_config;
> +    while ((c = *p++)) {
> +        if (c == ',') {
> +            hart_id++;
> +        } else {
> +            plic->addr_config[target_id].target_id = target_id;
> +            plic->addr_config[target_id].hart_id = hart_id;
> +            plic->addr_config[target_id].mode = char_to_mode(c);
> +            target_id++;
> +        }
> +    }
> +}
> +
> +static void andes_plic_irq_request(void *opaque, int irq, int level)
> +{
> +    AndesPLICState *plic = opaque;
> +    andes_plic_set_pending(plic, irq, level > 0);
> +    plic->andes_plic_update(plic);
> +}
> +
> +static const MemoryRegionOps andes_plic_ops = {
> +    .read = andes_plic_read,
> +    .write = andes_plic_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8
> +    }
> +};
> +
> +static void
> +andes_plic_realize(DeviceState *dev, Error **errp)
> +{
> +    LOG("%s:\n", __func__);
> +    AndesPLICState *plic = ANDES_PLIC(dev);
> +
> +    memory_region_init_io(&plic->mmio, OBJECT(dev), &andes_plic_ops, plic,
> +                          TYPE_ANDES_PLIC, plic->aperture_size);
> +
> +    parse_hart_config(plic);
> +    plic->bitfield_words = (plic->num_sources + 31) >> 5;
> +    plic->num_enables = plic->bitfield_words * plic->num_addrs;
> +    plic->source_priority = g_new0(uint32_t, plic->num_sources);
> +    plic->target_priority = g_new0(uint32_t, plic->num_addrs);
> +    plic->pending = g_new0(uint32_t, plic->bitfield_words);
> +    plic->claimed = g_new0(uint32_t, plic->bitfield_words);
> +    plic->enable = g_new0(uint32_t, plic->num_enables);
> +
> +    if (strstr(plic->plic_name , "SW") != NULL) {
> +        plic->andes_plic_update = andes_plicsw_update;
> +    } else {
> +        plic->andes_plic_update = andes_plichw_update;
> +    }
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
> +    qdev_init_gpio_in(dev, andes_plic_irq_request, plic->num_sources);
> +}
> +
> +static Property andes_plic_properties[] = {
> +    DEFINE_PROP_STRING("plic-name", AndesPLICState, plic_name),
> +    DEFINE_PROP_UINT32("plic-base", AndesPLICState, plic_base, 0),
> +    DEFINE_PROP_STRING("hart-config", AndesPLICState, hart_config),
> +    DEFINE_PROP_UINT32("num-sources", AndesPLICState, num_sources, 0),
> +    DEFINE_PROP_UINT32("num-priorities", AndesPLICState, num_priorities, 0),
> +    DEFINE_PROP_UINT32("priority-base", AndesPLICState, priority_base, 0),
> +    DEFINE_PROP_UINT32("pending-base", AndesPLICState, pending_base, 0),
> +    DEFINE_PROP_UINT32("enable-base", AndesPLICState, enable_base, 0),
> +    DEFINE_PROP_UINT32("enable-stride", AndesPLICState, enable_stride, 0),
> +    DEFINE_PROP_UINT32("threshold-base", AndesPLICState, threshold_base, 0),
> +    DEFINE_PROP_UINT32("threshold-stride", AndesPLICState, threshold_stride, 0),
> +    DEFINE_PROP_UINT32("aperture-size", AndesPLICState, aperture_size, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void andes_plic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    /* TODO: add own properties */
> +    device_class_set_props(dc, andes_plic_properties);
> +    dc->realize = andes_plic_realize;
> +}
> +
> +static const TypeInfo andes_plic_info = {
> +    .name          = TYPE_ANDES_PLIC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AndesPLICState),
> +    .class_init    = andes_plic_class_init,
> +};
> +
> +static void andes_plic_register_types(void)
> +{
> +    LOG("%s:\n", __func__);
> +    type_register_static(&andes_plic_info);
> +}
> +
> +type_init(andes_plic_register_types)
> +
> +/*
> + * Create PLIC device.
> + */
> +DeviceState *andes_plic_create(hwaddr plic_base,
> +    const char *plic_name, char *hart_config,
> +    uint32_t num_sources, uint32_t num_priorities,
> +    uint32_t priority_base, uint32_t pending_base,
> +    uint32_t enable_base, uint32_t enable_stride,
> +    uint32_t threshold_base, uint32_t threshold_stride,
> +    uint32_t aperture_size)
> +{
> +    DeviceState *dev = qdev_new(TYPE_ANDES_PLIC);
> +
> +    assert(enable_stride == (enable_stride & -enable_stride));
> +    assert(threshold_stride == (threshold_stride & -threshold_stride));
> +    qdev_prop_set_string(dev, "plic-name", plic_name);
> +    qdev_prop_set_uint32(dev, "plic-base", plic_base);
> +    qdev_prop_set_string(dev, "hart-config", hart_config);
> +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
> +    qdev_prop_set_uint32(dev, "num-priorities", num_priorities);
> +    qdev_prop_set_uint32(dev, "priority-base", priority_base);
> +    qdev_prop_set_uint32(dev, "pending-base", pending_base);
> +    qdev_prop_set_uint32(dev, "enable-base", enable_base);
> +    qdev_prop_set_uint32(dev, "enable-stride", enable_stride);
> +    qdev_prop_set_uint32(dev, "threshold-base", threshold_base);
> +    qdev_prop_set_uint32(dev, "threshold-stride", threshold_stride);
> +    qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, plic_base);
> +    return dev;
> +}
> +
> +/*
> + * Create PLICSW device.
> + */
> +DeviceState *andes_plicsw_create(hwaddr plic_base,
> +    const char *plic_name, char *hart_config,
> +    uint32_t num_sources, uint32_t num_priorities,
> +    uint32_t priority_base, uint32_t pending_base,
> +    uint32_t enable_base, uint32_t enable_stride,
> +    uint32_t threshold_base, uint32_t threshold_stride,
> +    uint32_t aperture_size)
> +{
> +    DeviceState *dev = qdev_new(TYPE_ANDES_PLIC);
> +
> +    assert(enable_stride == (enable_stride & -enable_stride));
> +    assert(threshold_stride == (threshold_stride & -threshold_stride));
> +    qdev_prop_set_string(dev, "plic-name", plic_name);
> +    qdev_prop_set_uint32(dev, "plic-base", plic_base);
> +    qdev_prop_set_string(dev, "hart-config", hart_config);
> +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
> +    qdev_prop_set_uint32(dev, "num-priorities", num_priorities);
> +    qdev_prop_set_uint32(dev, "priority-base", priority_base);
> +    qdev_prop_set_uint32(dev, "pending-base", pending_base);
> +    qdev_prop_set_uint32(dev, "enable-base", enable_base);
> +    qdev_prop_set_uint32(dev, "enable-stride", enable_stride);
> +    qdev_prop_set_uint32(dev, "threshold-base", threshold_base);
> +    qdev_prop_set_uint32(dev, "threshold-stride", threshold_stride);
> +    qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, plic_base);
> +    return dev;
> +}
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index b3d9345a0d..0d2cb94a2f 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -25,6 +25,7 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
>   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
>
>   specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
> +specific_ss.add(when: 'CONFIG_ANDES_PLIC', if_true: files('andes_plic.c'))
>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> diff --git a/include/hw/intc/andes_plic.h b/include/hw/intc/andes_plic.h
> new file mode 100644
> index 0000000000..9e1212ba09
> --- /dev/null
> +++ b/include/hw/intc/andes_plic.h
> @@ -0,0 +1,130 @@
> +/*
> + * Andes PLIC (Platform Level Interrupt Controller) interface
> + *
> + * Copyright (c) 2018 Andes Tech. Corp.
> + *
> + * This provides a RISC-V PLIC device with Andes' extensions.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_ANDES_PLIC_H
> +#define HW_ANDES_PLIC_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define ANDES_AE350_PLIC_NAME             "ANDES_PLIC"
> +#define ANDES_AE350_PLIC_HART_CONFIG      "MS"
> +#define ANDES_AE350_PLIC_NUM_SOURCES      128
> +#define ANDES_AE350_PLIC_NUM_PRIORITIES   32
> +#define ANDES_AE350_PLIC_PRIORITY_BASE    0x04
> +#define ANDES_AE350_PLIC_PENDING_BASE     0x1000
> +#define ANDES_AE350_PLIC_ENABLE_BASE      0x2000
> +#define ANDES_AE350_PLIC_ENABLE_STRIDE    0x80
> +#define ANDES_AE350_PLIC_THRESHOLD_BASE   0x200000
> +#define ANDES_AE350_PLIC_THRESHOLD_STRIDE 0x1000
> +
> +#define ANDES_AE350_PLICSW_NAME           "ANDES_PLICSW"
> +#define ANDES_AE350_PLICSW_HART_CONFIG    "M"
> +#define ANDES_AE350_PLICSW_NUM_SOURCES    64
> +#define ANDES_AE350_PLICSW_NUM_PRIORITIES 8
> +#define ANDES_AE350_PLICSW_PRIORITY_BASE  0x4
> +#define ANDES_AE350_PLICSW_PENDING_BASE   0x1000
> +#define ANDES_AE350_PLICSW_ENABLE_BASE    0x2000
> +#define ANDES_AE350_PLICSW_ENABLE_STRIDE  0x80
> +#define ANDES_AE350_PLICSW_THRESHOLD_BASE   0x200000
> +#define ANDES_AE350_PLICSW_THRESHOLD_STRIDE 0x1000
> +
> +#define TYPE_ANDES_PLIC "riscv.andes.plic"
> +
> +typedef struct AndesPLICState AndesPLICState;
> +DECLARE_INSTANCE_CHECKER(AndesPLICState, ANDES_PLIC,
> +                         TYPE_ANDES_PLIC)
> +
> +typedef enum AndesPLICMode {
> +    PlicMode_U,
> +    PlicMode_S,
> +    PlicMode_H,
> +    PlicMode_M
> +} AndesPLICMode;
> +
> +typedef struct AndesPLICAddr {
> +    uint32_t target_id;
> +    uint32_t hart_id;
> +    AndesPLICMode mode;
> +} AndesPLICAddr;
> +
> +typedef struct AndesPLICState {
> +    /*< private >*/
> +    SysBusDevice parent_mmio;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +    uint32_t num_addrs;
> +    uint32_t num_harts;
> +    uint32_t bitfield_words;
> +    uint32_t num_enables;
> +    AndesPLICAddr *addr_config;
> +    uint32_t *source_priority;
> +    uint32_t *target_priority;
> +    uint32_t *pending;
> +    uint32_t *claimed;
> +    uint32_t *enable;
> +
> +    /* config */
> +    char *hart_config;
> +    char *plic_name;
> +    uint32_t plic_base;
> +    uint32_t hartid_base;
> +    uint32_t num_sources;
> +    uint32_t num_priorities;
> +    uint32_t priority_base;
> +    uint32_t pending_base;
> +    uint32_t enable_base;
> +    uint32_t enable_stride;
> +    uint32_t threshold_base;
> +    uint32_t threshold_stride;
> +    uint32_t aperture_size;
> +
> +    /* interface */
> +    void (*andes_plic_update)(AndesPLICState *plic);
> +} AndesPLICState;
> +

Try to follow up Bin's PLIC question ..

The above data structures are quite similar to SiFive's [1]
So, is it possible to merge into a common file? for better maintenance

[1] include/hw/intc/sifive_plic.h


> +void andes_plichw_update(AndesPLICState *plic);
> +void andes_plicsw_update(AndesPLICState *plic);
> +
> +static inline bool addr_between(uint32_t addr, uint32_t base, uint32_t offset)
> +{
> +    return (addr >= base && addr < base + offset);
> +}
> +
> +DeviceState *
> +andes_plic_create(hwaddr addr,
> +    const char *plic_name, char *hart_config,
> +    uint32_t num_sources, uint32_t num_priorities,
> +    uint32_t priority_base, uint32_t pending_base,
> +    uint32_t enable_base, uint32_t enable_stride,
> +    uint32_t threshold_base, uint32_t threshold_stride,
> +    uint32_t aperture_size);
> +
> +DeviceState *
> +andes_plicsw_create(hwaddr addr,
> +    const char *plic_name, char *hart_config,
> +    uint32_t num_sources, uint32_t num_priorities,
> +    uint32_t priority_base, uint32_t pending_base,
> +    uint32_t enable_base, uint32_t enable_stride,
> +    uint32_t threshold_base, uint32_t threshold_stride,
> +    uint32_t aperture_size);
> +
> +#endif
>

