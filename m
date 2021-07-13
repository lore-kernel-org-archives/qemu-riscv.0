Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3CMf-0005ZJ-IM
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 02:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m3CMZ-0005TK-J8
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 02:57:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1m3CMQ-0000rc-IA
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 02:57:51 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t9so20791565pgn.4
 for <qemu-riscv@nongnu.org>; Mon, 12 Jul 2021 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53osHZ1EyO59Yk9XGg44i4ALibTM9NAnzYDO/kyA/JE=;
 b=YNAjVr40YE1qV66U0TvxBGrEhHpKcSKzdPYeu6o5pjWmrPQ3dNuahTH3iNEQpeq1N+
 foO3cDMWugRmzCppcEB1LK3N9vZCw33VmV5YFv9cbYpqBhH9qM8dbIQHlBoDPuLsbjC1
 5GYdEVDWkV8uupdbyJAC0IVvCzpVXJZ9v9Rs3m2nkYV6Xyydeln4gOAs4WPmbYGzhQgu
 Y+sZ3KPsOGKMITOZn+8lO3sojhJzoMIm3ecY8Cq/rhNq+8KQzDy7RzP1gpunosDyGxVY
 o8lkorSiti7LYDvIza+VBQN0qUVordTy25NLxRi5LJDJO2jr9JQ9DdvZwiwgMppF6m0k
 6wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53osHZ1EyO59Yk9XGg44i4ALibTM9NAnzYDO/kyA/JE=;
 b=muxtCBCWxnAtHU4/VsPLUWCiZgvmQCID5fw6TCafFKJdwoLpeVbUR7Dsb4+PeLhUvc
 hnx6IKaZMtYHdDfSUAtfu8qBHTTe/jUPfz533DkX7NCbjTKCFrdCK5yAKS7aeAYCBvr4
 gAkgZ9UuFyorlKzPakjlAaLlv5xBrek1+2ffvSsYhqwY9iMWfONZ0UoSywO44xfDwsuX
 pD3yZWgMk8vabLd2qu24CXw3sVLNNBhy1hHJudc1lores5MJ32ktHQTnMxKVANmlOezs
 BMimDr4DrQqEjAC7HN9PQB8V61Hl1kjg/9ng11ATw/qLqQ2za/ZDH4P8L6RpopbqWLh8
 HFaQ==
X-Gm-Message-State: AOAM531Dkyf5n2dkRKf5I3zbqWNL1CWD2IseiwWSyKPs020ud+WJx0nm
 URvYhQSPOFd8Ite3SmWXS/ZvFQ==
X-Google-Smtp-Source: ABdhPJzPXNHHG35v58XOPjDSZ8+6Wlr+CgE1Mnkpv2BTOWCrqcfLBL4XrstCBEA1BJ6A3jT+6cGdsg==
X-Received: by 2002:a65:6191:: with SMTP id c17mr2944808pgv.153.1626159461116; 
 Mon, 12 Jul 2021 23:57:41 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179])
 by smtp.gmail.com with ESMTPSA id b1sm1578340pjn.11.2021.07.12.23.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 23:57:40 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id k20so13801138pgg.7;
 Mon, 12 Jul 2021 23:57:40 -0700 (PDT)
X-Received: by 2002:a62:62c2:0:b029:2fb:af56:f1c5 with SMTP id
 w185-20020a6262c20000b02902fbaf56f1c5mr3235985pfb.30.1626159460031; Mon, 12
 Jul 2021 23:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D00sbRPM0e0wqpkqnC1SQ5CFHfjUa7CsCPoLBRGeVdsYg@mail.gmail.com>
In-Reply-To: <CANzO1D00sbRPM0e0wqpkqnC1SQ5CFHfjUa7CsCPoLBRGeVdsYg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 13 Jul 2021 14:57:28 +0800
X-Gmail-Original-Message-ID: <CANzO1D30f7jvcNyepd1sa+LF4YFBfeBvWGvvc4FAEFMPFO3ndQ@mail.gmail.com>
Message-ID: <CANzO1D30f7jvcNyepd1sa+LF4YFBfeBvWGvvc4FAEFMPFO3ndQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: Frank Chang <frank.chang@sifive.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000f69f7005c6fbc0db"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Tue, 13 Jul 2021 06:57:54 -0000

--000000000000f69f7005c6fbc0db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Frank Chang <frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8813=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:53=E5=AF=AB=E9=81=93=EF=BC=9A

> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> The Core-Local Interrupt Controller (CLIC) provides low-latency,
>> vectored, pre-emptive interrupts for RISC-V systems.
>>
>> The CLIC also supports a new Selective Hardware Vectoring feature
>> that allow users to optimize each interrupt for either faster
>> response or smaller code size.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>  default-configs/devices/riscv32-softmmu.mak |   1 +
>>  default-configs/devices/riscv64-softmmu.mak |   1 +
>>  hw/intc/Kconfig                             |   3 +
>>  hw/intc/meson.build                         |   1 +
>>  hw/intc/riscv_clic.c                        | 835 ++++++++++++++++++++
>>  include/hw/intc/riscv_clic.h                | 103 +++
>>  target/riscv/cpu.h                          |   2 +
>>  7 files changed, 946 insertions(+)
>>  create mode 100644 hw/intc/riscv_clic.c
>>  create mode 100644 include/hw/intc/riscv_clic.h
>>
>> diff --git a/default-configs/devices/riscv32-softmmu.mak
>> b/default-configs/devices/riscv32-softmmu.mak
>> index d847bd5692..1430c30588 100644
>> --- a/default-configs/devices/riscv32-softmmu.mak
>> +++ b/default-configs/devices/riscv32-softmmu.mak
>> @@ -5,6 +5,7 @@
>>  #CONFIG_PCI_DEVICES=3Dn
>>  CONFIG_SEMIHOSTING=3Dy
>>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>> +CONFIG_RISCV_CLIC=3Dy
>>
>>  # Boards:
>>  #
>> diff --git a/default-configs/devices/riscv64-softmmu.mak
>> b/default-configs/devices/riscv64-softmmu.mak
>> index d5eec75f05..396800bbbd 100644
>> --- a/default-configs/devices/riscv64-softmmu.mak
>> +++ b/default-configs/devices/riscv64-softmmu.mak
>> @@ -5,6 +5,7 @@
>>  #CONFIG_PCI_DEVICES=3Dn
>>  CONFIG_SEMIHOSTING=3Dy
>>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>> +CONFIG_RISCV_CLIC=3Dy
>>
>>  # Boards:
>>  #
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index f4694088a4..5bf492b48f 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -68,6 +68,9 @@ config SIFIVE_CLINT
>>  config SIFIVE_PLIC
>>      bool
>>
>> +config RISCV_CLIC
>> +    bool
>> +
>>  config GOLDFISH_PIC
>>      bool
>>
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index 1c299039f6..2aa71b6738 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true:
>> files('s390_flic_kvm.c'))
>>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>>  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true:
>> files('sifive_clint.c'))
>>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
>> files('sifive_plic.c'))
>> +specific_ss.add(when: 'CONFIG_RISCV_CLIC', if_true:
>> files('riscv_clic.c'))
>>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>>                 if_true: files('xics_kvm.c'))
>> diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c
>> new file mode 100644
>> index 0000000000..8ad534c506
>> --- /dev/null
>> +++ b/hw/intc/riscv_clic.c
>> @@ -0,0 +1,835 @@
>> +/*
>> + * RISC-V CLIC(Core Local Interrupt Controller) for QEMU.
>> + *
>> + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserve=
d.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e
>> for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/log.h"
>> +#include "hw/sysbus.h"
>> +#include "sysemu/qtest.h"
>> +#include "target/riscv/cpu.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/intc/riscv_clic.h"
>> +
>> +/*
>> + * The 2-bit trig WARL field specifies the trigger type and polarity fo=
r
>> each
>> + * interrupt input. Bit 1, trig[0], is defined as "edge-triggered"
>> + * (0: level-triggered, 1: edge-triggered); while bit 2, trig[1], is
>> defined as
>> + * "negative-edge" (0: positive-edge, 1: negative-edge). (Section 3.6)
>> + */
>> +
>> +static inline TRIG_TYPE
>> +riscv_clic_get_trigger_type(RISCVCLICState *clic, size_t irq_offset)
>> +{
>> +    return (clic->clicintattr[irq_offset] >> 1) & 0x3;
>> +}
>> +
>> +static inline bool
>> +riscv_clic_is_edge_triggered(RISCVCLICState *clic, size_t irq_offset)
>> +{
>> +    return (clic->clicintattr[irq_offset] >> 1) & 0x1;
>> +}
>> +
>> +static inline bool
>> +riscv_clic_is_shv_interrupt(RISCVCLICState *clic, size_t irq_offset)
>> +{
>> +    return (clic->clicintattr[irq_offset] & 0x1) && clic->nvbits;
>> +}
>> +
>> +static uint8_t
>> +riscv_clic_get_interrupt_level(RISCVCLICState *clic, uint8_t intctl)
>> +{
>> +    int nlbits =3D clic->nlbits;
>> +
>> +    uint8_t mask_il =3D ((1 << nlbits) - 1) << (8 - nlbits);
>> +    uint8_t mask_padding =3D (1 << (8 - nlbits)) - 1;
>> +    /* unused level bits are set to 1 */
>> +    return (intctl & mask_il) | mask_padding;
>> +}
>> +
>> +static uint8_t
>> +riscv_clic_get_interrupt_priority(RISCVCLICState *clic, uint8_t intctl)
>> +{
>> +    int npbits =3D clic->clicintctlbits - clic->nlbits;
>> +    uint8_t mask_priority =3D ((1 << npbits) - 1) << (8 - npbits);
>> +    uint8_t mask_padding =3D (1 << (8 - npbits)) - 1;
>> +
>> +    if (npbits < 0) {
>> +        return UINT8_MAX;
>> +    }
>> +    /* unused priority bits are set to 1 */
>> +    return (intctl & mask_priority) | mask_padding;
>> +}
>> +
>> +static void
>> +riscv_clic_intcfg_decode(RISCVCLICState *clic, uint16_t intcfg,
>> +                         uint8_t *mode, uint8_t *level,
>> +                         uint8_t *priority)
>> +{
>> +    *mode =3D intcfg >> 8;
>> +    *level =3D riscv_clic_get_interrupt_level(clic, intcfg & 0xff);
>> +    *priority =3D riscv_clic_get_interrupt_priority(clic, intcfg & 0xff=
);
>> +}
>> +
>> +/*
>> + * In a system with multiple harts, the M-mode CLIC regions for all the
>> harts
>> + * are placed contiguously in the memory space, followed by the S-mode
>> CLIC
>> + * regions for all harts. (Section 3.11)
>> + */
>> +static size_t
>> +riscv_clic_get_irq_offset(RISCVCLICState *clic, int mode, int hartid,
>> int irq)
>> +{
>> +    size_t mode_offset =3D 0;
>> +    size_t unit =3D clic->num_harts * clic->num_sources;
>> +
>> +    switch (mode) {
>> +    case PRV_M:
>> +        mode_offset =3D 0;
>> +        break;
>> +    case PRV_S:
>> +        mode_offset =3D unit;
>> +        break;
>> +    case PRV_U:
>> +        mode_offset =3D clic->prv_s ? 2 * unit : unit;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid mode %d\n", mode);
>> +        exit(1);
>> +    }
>> +    return mode_offset + hartid * clic->num_sources + irq;
>> +}
>> +
>> +static void riscv_clic_next_interrupt(void *opaque, int hartid)
>> +{
>> +    /*
>> +     * Scan active list for highest priority pending interrupts
>> +     * comparing against this harts mintstatus register and interrupt
>> +     * the core if we have a higher priority interrupt to deliver
>> +     */
>> +    RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(hartid));
>> +    CPURISCVState *env =3D &cpu->env;
>> +    RISCVCLICState *clic =3D (RISCVCLICState *)opaque;
>> +
>> +    int il[4] =3D {
>> +        MAX(get_field(env->mintstatus, MINTSTATUS_UIL),
>> +            clic->mintthresh), /* PRV_U */
>> +        MAX(get_field(env->mintstatus, MINTSTATUS_SIL),
>> +            clic->sintthresh), /* PRV_S */
>> +        0,                     /* reserverd */
>> +        MAX(get_field(env->mintstatus, MINTSTATUS_MIL),
>> +            clic->uintthresh)  /* PRV_M */
>> +    };
>> +
>> +    /* Get sorted list of enabled interrupts for this hart */
>> +    size_t hart_offset =3D hartid * clic->num_sources;
>> +    CLICActiveInterrupt *active =3D &clic->active_list[hart_offset];
>> +    size_t active_count =3D clic->active_count[hartid];
>> +    uint8_t mode, level, priority;
>> +
>> +    /* Loop through the enabled interrupts sorted by mode+priority+leve=
l
>> */
>> +    while (active_count) {
>> +        size_t irq_offset;
>> +        riscv_clic_intcfg_decode(clic, active->intcfg, &mode, &level,
>> +                                 &priority);
>> +        if (mode < env->priv || (mode =3D=3D env->priv && level <=3D
>> il[mode])) {
>> +            /*
>> +             * No pending interrupts with high enough mode+priority+lev=
el
>> +             * break and clear pending interrupt for this hart
>> +             */
>> +            break;
>> +        }
>> +        irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> active->irq);
>> +        /* Check pending interrupt with high enough mode+priority+level
>> */
>> +        if (clic->clicintip[irq_offset]) {
>> +            /* Clean vector edge-triggered pending */
>> +            if (riscv_clic_is_edge_triggered(clic, irq_offset) &&
>> +                riscv_clic_is_shv_interrupt(clic, irq_offset)) {
>> +                clic->clicintip[irq_offset] =3D 0;
>> +            }
>> +            /* Post pending interrupt for this hart */
>> +            clic->exccode[hartid] =3D active->irq | mode << 12 | level =
<<
>> 14;
>> +            qemu_set_irq(clic->cpu_irqs[hartid], 1);
>> +            return;
>> +        }
>> +        /* Check next enabled interrupt */
>> +        active_count--;
>> +        active++;
>> +    }
>> +}
>>
>
> Hi Zhiwei,
>
> The global interrupt may be disabled (xstatus.xie =3D 0) at the time acti=
ve
> interrupt i
> is both enabled and pending (i.e. clicintie[i] =3D 1 && clicintip[i] =3D =
1)
> Therefore, interrupt i will not be taken right away until xstatus.xie is
> set to 1.
>
> However, during global interrupt is disabled,
> SW/HW may either disable or change pending interrupt i to non-pending.
> Interrupt i should not be active anymore.
> But current implementation can't reflect that because
> CPU_INTERRUPT_CLIC bit won't be unset.
>
> To solve this issue, in my own implementation, I tried to:
>
> In riscv_clic_update_intip(), if interrupt i turns to non-pending,
> check if interrupt i is an active pending interrupt.
> (by decoding IRQ number from env->exccode and check if
> cpu->interrupt_request flag also has CPU_INTERRUPT_CLIC bit set.)
>
> If so, interrupt i is current active pending interrupt to be disabled, we
> have to
> unset CPU_INTERRUPT_CLIC bit from interrupt request flag for the hart
> to prevent interrupt i been taken later as it's not pending anymore.
> Then call riscv_clic_next_interrupt() as usual to pick next interrupt.
>
> Same behavior is also applied in riscv_clic_update_intie() when
> interrupt i is disabled and interrupt i is also the active pending
> interrupt.
>
> Also, I think the effective interrupt level check should be moved
> from riscv_clic_update_intip() to riscv_cpu_local_irq_mode_enabled() in
> cpu_helper.c.
>

Sorry, I mean from riscv_clic_next_interrupt() to
riscv_cpu_local_irq_mode_enabled().


>
> Consider the following scenario:
>     a. Active pending interrupt i is not been handled due to global
> interrupt is disabled.
>     b. Software accesses xnxti CSR with write side effect (xstatus.xie is
> still set to 0).
>         xintstatus.xil will be updated to the interrupt level of interrup=
t
> i.
>     c. Interrupt i turns to non-pending/disabled.
>     d. Interrupt j is enabled and pending.
>     e. Interrupt j won't be selected in riscv_clic_next_interrupt() if it=
s
> interrupt level
>         is lower than interrupt i (xinitstatus.xil still holds the
> interrupt level of interrupt i),
>         which is incorrect because interrupt i is not pending and active
> anymore.
>
> By moving effective interrupt level check from
> riscv_clic_update_intip() to riscv_cpu_local_irq_mode_enabled()
>

Should be riscv_clic_next_interrupt(), not riscv_clic_update_intip().

Regards,
Frank Chang


> can eliminate the issue of lower-priority interrupt been masked out
> by higher-interrupt-level non active interrupt.
>
> Let me know if I miss anything.
>
> Regards,
> Frank Chang
>
>
>> +
>> +/*
>> + * Any interrupt i that is not accessible to S-mode or U-Mode
>> + * appears as hard-wired zeros in clicintip[i], clicintie[i],
>> + * clicintattr[i], and clicintctl[i].(Section 3.9)(Section 3.10)
>> + */
>> +static bool
>> +riscv_clic_check_visible(RISCVCLICState *clic, int mode, int hartid, in=
t
>> irq)
>> +{
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    if (!clic->prv_s && !clic->prv_u) { /* M */
>> +        return mode =3D=3D PRV_M;
>> +    } else if (!clic->prv_s) { /* M/U */
>> +        switch (clic->nmbits) {
>> +        case 0:
>> +            return mode =3D=3D PRV_M;
>> +        case 1:
>> +            return clic->clicintattr[irq_offset] & 0x80 ? (mode =3D=3D
>> PRV_M) :
>> +                                                          (mode =3D=3D
>> PRV_U);
>> +        default:
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                "clic: nmbits can only be 0 or 1 for M/U hart");
>> +            exit(1);
>> +        }
>> +    } else { /* M/S/U */
>> +        switch (clic->nmbits) {
>> +        case 0:
>> +            return mode =3D=3D PRV_M;
>> +        case 1:
>> +            return clic->clicintattr[irq_offset] & 0x80 ? (mode =3D=3D
>> PRV_M) :
>> +                                                          (mode =3D=3D
>> PRV_S);
>> +        case 2:
>> +            return mode =3D=3D clic->clicintattr[irq_offset];
>> +        case 3:
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                "clic: nmbits can only be 0 or 1 or 2 for M/S/U hart");
>> +            exit(1);
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +/*
>> + * For level-triggered interrupts, software writes to pending bits are
>> + * ignored completely. (Section 3.4)
>> + */
>> +static bool
>> +riscv_clic_validate_intip(RISCVCLICState *clic, int mode, int hartid,
>> int irq)
>> +{
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    return riscv_clic_is_edge_triggered(clic, irq_offset);
>> +}
>> +
>> +static void
>> +riscv_clic_update_intip(RISCVCLICState *clic, int mode, int hartid,
>> +                        int irq, uint64_t value)
>> +{
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    clic->clicintip[irq_offset] =3D !!value;
>> +    riscv_clic_next_interrupt(clic, hartid);
>> +}
>> +
>> +/*
>> + * For security purpose, the field can only be set to a privilege
>> + * level that is equal mode to or lower than the currently running
>> + * privilege level.(Section 3.6)
>> + */
>> +
>> +static bool riscv_clic_validate_intattr(RISCVCLICState *clic, uint64_t
>> value)
>> +{
>> +    int mode =3D extract64(value, 6, 2);
>> +
>> +    if (!qtest_enabled()) {
>> +        CPURISCVState *env =3D current_cpu->env_ptr;
>> +        if (env->priv < mode) {
>> +            return false;
>> +        }
>> +    }
>> +    return true;
>> +}
>> +
>> +static inline int riscv_clic_encode_priority(const CLICActiveInterrupt
>> *i)
>> +{
>> +    return ((i->intcfg & 0x3ff) << 12) | /* Highest mode+level+priority
>> */
>> +           (i->irq & 0xfff);             /* Highest irq number */
>> +}
>> +
>> +static int riscv_clic_active_compare(const void *a, const void *b)
>> +{
>> +    return riscv_clic_encode_priority(b) - riscv_clic_encode_priority(a=
);
>> +}
>> +
>> +static void
>> +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int hartid,
>> +                        int irq, uint64_t new_intie)
>> +{
>> +    size_t hart_offset =3D hartid * clic->num_sources;
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    CLICActiveInterrupt *active_list =3D &clic->active_list[hart_offset=
];
>> +    size_t *active_count =3D &clic->active_count[hartid];
>> +
>> +    uint8_t old_intie =3D clic->clicintie[irq_offset];
>> +    clic->clicintie[irq_offset] =3D !!new_intie;
>> +
>> +    /* Add to or remove from list of active interrupts */
>> +    if (new_intie && !old_intie) {
>> +        active_list[*active_count].intcfg =3D (mode << 8) |
>> +                                            clic->clicintctl[irq_offset=
];
>> +        active_list[*active_count].irq =3D irq;
>> +        (*active_count)++;
>> +    } else if (!new_intie && old_intie) {
>> +        CLICActiveInterrupt key =3D {
>> +            (mode << 8) | clic->clicintctl[irq_offset], irq
>> +        };
>> +        CLICActiveInterrupt *result =3D bsearch(&key,
>> +                                              active_list, *active_coun=
t,
>> +
>> sizeof(CLICActiveInterrupt),
>> +                                              riscv_clic_active_compare=
);
>> +        size_t elem =3D (result - active_list) /
>> sizeof(CLICActiveInterrupt);
>> +        size_t sz =3D (--(*active_count) - elem) *
>> sizeof(CLICActiveInterrupt);
>> +        assert(result);
>> +        memmove(&result[0], &result[1], sz);
>> +    }
>> +
>> +    /* Sort list of active interrupts */
>> +    qsort(active_list, *active_count,
>> +          sizeof(CLICActiveInterrupt),
>> +          riscv_clic_active_compare);
>> +
>> +    riscv_clic_next_interrupt(clic, hartid);
>> +}
>> +
>> +static void
>> +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,
>> +                      uint64_t value, unsigned size,
>> +                      int mode, int hartid, int irq)
>> +{
>> +    int req =3D extract32(addr, 0, 2);
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +
>> +    if (hartid >=3D clic->num_harts) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx "\n",
>> +                      hartid, addr);
>> +        return;
>> +    }
>> +
>> +    if (irq >=3D clic->num_sources) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx "\n", irq=
,
>> addr);
>> +        return;
>> +    }
>> +
>> +    switch (req) {
>> +    case 0: /* clicintip[i] */
>> +        if (riscv_clic_validate_intip(clic, mode, hartid, irq)) {
>> +            /*
>> +             * The actual pending bit is located at bit 0 (i.e., the
>> +             * leastsignificant bit). In case future extensions expand
>> the bit
>> +             * field, from FW perspective clicintip[i]=3Dzero means no
>> interrupt
>> +             * pending, and clicintip[i]!=3D0 (not just 1) indicates an
>> +             * interrupt is pending. (Section 3.4)
>> +             */
>> +            if (value !=3D clic->clicintip[irq_offset]) {
>> +                riscv_clic_update_intip(clic, mode, hartid, irq, value)=
;
>> +            }
>> +        }
>> +        break;
>> +    case 1: /* clicintie[i] */
>> +        if (clic->clicintie[irq_offset] !=3D value) {
>> +            riscv_clic_update_intie(clic, mode, hartid, irq, value);
>> +        }
>> +        break;
>> +    case 2: /* clicintattr[i] */
>> +        if (riscv_clic_validate_intattr(clic, value)) {
>> +            if (clic->clicintattr[irq_offset] !=3D value) {
>> +                /* When nmbits=3D2, check WARL */
>> +                bool invalid =3D (clic->nmbits =3D=3D 2) &&
>> +                               (extract64(value, 6, 2) =3D=3D 0b10);
>> +                if (invalid) {
>> +                    uint8_t old_mode =3D
>> extract32(clic->clicintattr[irq_offset],
>> +                                                 6, 2);
>> +                    value =3D deposit32(value, 6, 2, old_mode);
>> +                }
>> +                clic->clicintattr[irq_offset] =3D value;
>> +                riscv_clic_next_interrupt(clic, hartid);
>> +            }
>> +        }
>> +        break;
>> +    case 3: /* clicintctl[i] */
>> +        if (value !=3D clic->clicintctl[irq_offset]) {
>> +            clic->clicintctl[irq_offset] =3D value;
>> +            riscv_clic_next_interrupt(clic, hartid);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t
>> +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int mode,
>> +                     int hartid, int irq)
>> +{
>> +    int req =3D extract32(addr, 0, 2);
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +
>> +    if (hartid >=3D clic->num_harts) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid hartid %u: 0x%" HWADDR_PRIx "\n",
>> +                      hartid, addr);
>> +        return 0;
>> +    }
>> +
>> +    if (irq >=3D clic->num_sources) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx "\n", irq=
,
>> addr);
>> +        return 0;
>> +    }
>> +
>> +    switch (req) {
>> +    case 0: /* clicintip[i] */
>> +        return clic->clicintip[irq_offset];
>> +    case 1: /* clicintie[i] */
>> +        return clic->clicintie[irq_offset];
>> +    case 2: /* clicintattr[i] */
>> +        /*
>> +         * clicintattr register layout
>> +         * Bits Field
>> +         * 7:6 mode
>> +         * 5:3 reserved (WPRI 0)
>> +         * 2:1 trig
>> +         * 0 shv
>> +         */
>> +        return clic->clicintattr[irq_offset] & ~0x38;
>> +    case 3: /* clicintctrl */
>> +        /*
>> +         * The implemented bits are kept left-justified in the
>> most-significant
>> +         * bits of each 8-bit clicintctl[i] register, with the lower
>> +         * unimplemented bits treated as hardwired to 1.(Section 3.7)
>> +         */
>> +        return clic->clicintctl[irq_offset] |
>> +               ((1 << (8 - clic->clicintctlbits)) - 1);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Return target interrupt mode */
>> +static int riscv_clic_get_mode(RISCVCLICState *clic, hwaddr addr)
>> +{
>> +    int mode =3D addr / (4 * clic->num_harts * clic->num_sources);
>> +    switch (mode) {
>> +    case 0:
>> +        return PRV_M;
>> +    case 1:
>> +        assert(clic->prv_s || clic->prv_u);
>> +        return clic->prv_s ? PRV_S : PRV_U;
>> +    case 2:
>> +        assert(clic->prv_s && clic->prv_u);
>> +        return PRV_U;
>> +    default:
>> +        g_assert_not_reached();
>> +        break;
>> +    }
>> +}
>> +
>> +/* Return target hart id */
>> +static int riscv_clic_get_hartid(RISCVCLICState *clic, hwaddr addr)
>> +{
>> +    int mode_unit =3D 4 * clic->num_harts * clic->num_sources;
>> +    int hart_unit =3D 4 * clic->num_sources;
>> +
>> +    return (addr % mode_unit) / hart_unit;
>> +}
>> +
>> +/* Return target interrupt number */
>> +static int riscv_clic_get_irq(RISCVCLICState *clic, hwaddr addr)
>> +{
>> +    int hart_unit =3D 4 * clic->num_sources;
>> +    return (addr % hart_unit) / 4;
>> +}
>> +
>> +static void
>> +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value, unsigned
>> size)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    hwaddr clic_size =3D clic->clic_size;
>> +    int hartid, mode, irq;
>> +
>> +    if (addr < clic_size) {
>> +        if (addr < 0x1000) {
>> +            assert(addr % 4 =3D=3D 0);
>> +            int index =3D addr / 4;
>> +            switch (index) {
>> +            case 0: /* cliccfg */
>> +                {
>> +                    uint8_t nlbits =3D extract32(value, 1, 4);
>> +                    uint8_t nmbits =3D extract32(value, 5, 2);
>> +
>> +                    /*
>> +                     * The 4-bit cliccfg.nlbits WARL field.
>> +                     * Valid values are 0=E2=80=948.
>> +                     */
>> +                    if (nlbits <=3D 8) {
>> +                        clic->nlbits =3D nlbits;
>> +                    }
>> +                    /* Valid values are given by implemented priviledge=
s
>> */
>> +                    if (clic->prv_s && clic->prv_u) {
>> +                        if (nmbits <=3D 2) {
>> +                            clic->nmbits =3D nmbits;
>> +                        }
>> +                    } else if (clic->prv_u) {
>> +                        if (nmbits <=3D 1) {
>> +                            clic->nmbits =3D nmbits;
>> +                        }
>> +                    } else {
>> +                        assert(!clic->prv_s);
>> +                        if (nmbits =3D=3D 0) {
>> +                            clic->nmbits =3D 0;
>> +                        }
>> +                    }
>> +                    clic->nvbits =3D extract32(value, 0, 1);
>> +                    break;
>> +                }
>> +            case 1: /* clicinfo, read-only register */
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "clic: write read-only clicinfo.\n");
>> +                break;
>> +            case 0x10 ... 0x2F: /* clicinttrig */
>> +                {
>> +                    uint32_t interrupt_number =3D value &
>> MAKE_64BIT_MASK(0, 13);
>> +                    if (interrupt_number <=3D clic->num_sources) {
>> +                        value &=3D ~MAKE_64BIT_MASK(13, 18);
>> +                        clic->clicinttrig[index - 0x10] =3D value;
>> +                    }
>> +                    break;
>> +                }
>> +            case 2: /* mintthresh */
>> +                if (!strcmp(clic->version, "v0.8")) {
>> +                    clic->mintthresh =3D value;
>> +                    break;
>> +                }
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "clic: invalid write addr: 0x%"
>> HWADDR_PRIx "\n",
>> +                              addr);
>> +                break;
>> +            default:
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "clic: invalid write addr: 0x%"
>> HWADDR_PRIx "\n",
>> +                              addr);
>> +                return;
>> +            }
>> +        } else {
>> +            addr -=3D 0x1000;
>> +            hartid =3D riscv_clic_get_hartid(clic, addr);
>> +            mode =3D riscv_clic_get_mode(clic, addr);
>> +            irq =3D riscv_clic_get_irq(clic, addr);
>> +
>> +            if (riscv_clic_check_visible(clic, mode, hartid, irq)) {
>> +                riscv_clic_hart_write(clic, addr, value, size, mode,
>> +                                      hartid, irq);
>> +            }
>> +        }
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid write: 0x%" HWADDR_PRIx "\n", addr=
);
>> +    }
>> +}
>> +
>> +static uint64_t riscv_clic_read(void *opaque, hwaddr addr, unsigned siz=
e)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    hwaddr clic_size =3D clic->clic_size;
>> +    int hartid, mode, irq;
>> +
>> +    if (addr < clic_size) {
>> +        if (addr < 0x1000) {
>> +            assert(addr % 4 =3D=3D 0);
>> +            int index =3D addr / 4;
>> +            switch (index) {
>> +            case 0: /* cliccfg */
>> +                return clic->nvbits |
>> +                       (clic->nlbits << 1) |
>> +                       (clic->nmbits << 5);
>> +            case 1: /* clicinfo */
>> +                /*
>> +                 * clicinfo register layout
>> +                 *
>> +                 * Bits Field
>> +                 * 31 reserved (WARL 0)
>> +                 * 30:25 num_trigger
>> +                 * 24:21 CLICINTCTLBITS
>> +                 * 20:13 version (for version control)
>> +                 * 12:0 num_interrupt
>> +                 */
>> +                return clic->clicinfo & ~INT32_MAX;
>> +            case 0x10 ... 0x2F: /* clicinttrig */
>> +                /*
>> +                 * clicinttrig register layout
>> +                 *
>> +                 * Bits Field
>> +                 * 31 enable
>> +                 * 30:13 reserved (WARL 0)
>> +                 * 12:0 interrupt_number
>> +                 */
>> +                return clic->clicinttrig[index - 0x10] &
>> +                       ~MAKE_64BIT_MASK(13, 18);
>> +            case 2: /* mintthresh */
>> +                if (!strcmp(clic->version, "v0.8")) {
>> +                    return clic->mintthresh;
>> +                    break;
>> +                }
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "clic: invalid read : 0x%" HWADDR_PRIx
>> "\n",
>> +                              addr);
>> +                break;
>> +            default:
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "clic: invalid read : 0x%" HWADDR_PRIx
>> "\n",
>> +                              addr);
>> +                break;
>> +            }
>> +        } else {
>> +            addr -=3D 0x1000;
>> +            hartid =3D riscv_clic_get_hartid(clic, addr);
>> +            mode =3D riscv_clic_get_mode(clic, addr);
>> +            irq =3D riscv_clic_get_irq(clic, addr);
>> +
>> +            if (riscv_clic_check_visible(clic, mode, hartid, irq)) {
>> +                return riscv_clic_hart_read(clic, addr, mode, hartid,
>> irq);
>> +            }
>> +        }
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "clic: invalid read: 0x%" HWADDR_PRIx "\n", addr)=
;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void riscv_clic_set_irq(void *opaque, int id, int level)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    int irq, hartid, mode;
>> +    hwaddr addr =3D 4 * id;
>> +    TRIG_TYPE type;
>> +
>> +    hartid =3D riscv_clic_get_hartid(clic, addr);
>> +    mode =3D riscv_clic_get_mode(clic, addr);
>> +    irq =3D riscv_clic_get_irq(clic, addr);
>> +    type =3D riscv_clic_get_trigger_type(clic, id);
>> +
>> +    /*
>> +     * In general, the edge-triggered interrupt state should be kept in
>> pending
>> +     * bit, while the level-triggered interrupt should be kept in the
>> level
>> +     * state of the incoming wire.
>> +     *
>> +     * For CLIC, model the level-triggered interrupt by read-only
>> pending bit.
>> +     */
>> +    if (level) {
>> +        switch (type) {
>> +        case POSITIVE_LEVEL:
>> +        case POSITIVE_EDGE:
>> +            riscv_clic_update_intip(clic, mode, hartid, irq, level);
>> +            break;
>> +        case NEG_LEVEL:
>> +            riscv_clic_update_intip(clic, mode, hartid, irq, !level);
>> +            break;
>> +        case NEG_EDGE:
>> +            break;
>> +        }
>> +    } else {
>> +        switch (type) {
>> +        case POSITIVE_LEVEL:
>> +            riscv_clic_update_intip(clic, mode, hartid, irq, level);
>> +            break;
>> +        case POSITIVE_EDGE:
>> +            break;
>> +        case NEG_LEVEL:
>> +        case NEG_EDGE:
>> +            riscv_clic_update_intip(clic, mode, hartid, irq, !level);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static void riscv_clic_cpu_irq_handler(void *opaque, int irq, int level=
)
>> +{
>> +    CPURISCVState *env =3D (CPURISCVState *)opaque;
>> +    RISCVCLICState *clic =3D env->clic;
>> +    CPUState *cpu =3D env_cpu(env);
>> +
>> +    if (level) {
>> +        env->exccode =3D clic->exccode[cpu->cpu_index];
>> +        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_CLIC);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps riscv_clic_ops =3D {
>> +    .read =3D riscv_clic_read,
>> +    .write =3D riscv_clic_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 1,
>> +        .max_access_size =3D 8
>> +    }
>> +};
>> +
>> +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>> +{
>> +    RISCVCLICState *clic =3D RISCV_CLIC(dev);
>> +    size_t harts_x_sources =3D clic->num_harts * clic->num_sources;
>> +    int irqs, i;
>> +
>> +    if (clic->prv_s && clic->prv_u) {
>> +        irqs =3D 3 * harts_x_sources;
>> +    } else if (clic->prv_s || clic->prv_u) {
>> +        irqs =3D 2 * harts_x_sources;
>> +    } else {
>> +        irqs =3D harts_x_sources;
>> +    }
>> +
>> +    clic->clic_size =3D irqs * 4 + 0x1000;
>> +    memory_region_init_io(&clic->mmio, OBJECT(dev), &riscv_clic_ops,
>> clic,
>> +                          TYPE_RISCV_CLIC, clic->clic_size);
>> +
>> +    clic->clicintip =3D g_new0(uint8_t, irqs);
>> +    clic->clicintie =3D g_new0(uint8_t, irqs);
>> +    clic->clicintattr =3D g_new0(uint8_t, irqs);
>> +    clic->clicintctl =3D g_new0(uint8_t, irqs);
>> +    clic->active_list =3D g_new0(CLICActiveInterrupt, irqs);
>> +    clic->active_count =3D g_new0(size_t, clic->num_harts);
>> +    clic->exccode =3D g_new0(uint32_t, clic->num_harts);
>> +    clic->cpu_irqs =3D g_new0(qemu_irq, clic->num_harts);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &clic->mmio);
>> +
>> +    /* Allocate irq through gpio, so that we can use qtest */
>> +    qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);
>> +    qdev_init_gpio_out(dev, clic->cpu_irqs, clic->num_harts);
>> +
>> +    for (i =3D 0; i < clic->num_harts; i++) {
>> +        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(i));
>> +        qemu_irq irq =3D qemu_allocate_irq(riscv_clic_cpu_irq_handler,
>> +                                         &cpu->env, 1);
>> +        qdev_connect_gpio_out(dev, i, irq);
>> +        cpu->env.clic =3D clic;
>> +    }
>> +}
>> +
>> +static Property riscv_clic_properties[] =3D {
>> +    DEFINE_PROP_BOOL("prv-s", RISCVCLICState, prv_s, false),
>> +    DEFINE_PROP_BOOL("prv-u", RISCVCLICState, prv_u, false),
>> +    DEFINE_PROP_UINT32("num-harts", RISCVCLICState, num_harts, 0),
>> +    DEFINE_PROP_UINT32("num-sources", RISCVCLICState, num_sources, 0),
>> +    DEFINE_PROP_UINT32("clicintctlbits", RISCVCLICState, clicintctlbits=
,
>> 0),
>> +    DEFINE_PROP_UINT64("mclicbase", RISCVCLICState, mclicbase, 0),
>> +    DEFINE_PROP_STRING("version", RISCVCLICState, version),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void riscv_clic_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D riscv_clic_realize;
>> +    device_class_set_props(dc, riscv_clic_properties);
>> +}
>> +
>> +static const TypeInfo riscv_clic_info =3D {
>> +    .name          =3D TYPE_RISCV_CLIC,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(RISCVCLICState),
>> +    .class_init    =3D riscv_clic_class_init,
>> +};
>> +
>> +static void riscv_clic_register_types(void)
>> +{
>> +    type_register_static(&riscv_clic_info);
>> +}
>> +
>> +type_init(riscv_clic_register_types)
>> +
>> +/*
>> + * riscv_clic_create:
>> + *
>> + * @addr: base address of M-Mode CLIC memory-mapped registers
>> + * @prv_s: have smode region
>> + * @prv_u: have umode region
>> + * @num_harts: number of CPU harts
>> + * @num_sources: number of interrupts supporting by each aperture
>> + * @clicintctlbits: bits are actually implemented in the clicintctl
>> registers
>> + * @version: clic version, such as "v0.9"
>> + *
>> + * Returns: the device object
>> + */
>> +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool prv_u,
>> +                               uint32_t num_harts, uint32_t num_sources=
,
>> +                               uint8_t clicintctlbits,
>> +                               const char *version)
>> +{
>> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_CLIC);
>> +
>> +    assert(num_sources <=3D 4096);
>> +    assert(num_harts <=3D 1024);
>> +    assert(clicintctlbits <=3D 8);
>> +    assert(!strcmp(version, "v0.8") || !strcmp(version, "v0.9"));
>> +
>> +    qdev_prop_set_bit(dev, "prv-s", prv_s);
>> +    qdev_prop_set_bit(dev, "prv-u", prv_u);
>> +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
>> +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
>> +    qdev_prop_set_uint32(dev, "clicintctlbits", clicintctlbits);
>> +    qdev_prop_set_uint64(dev, "mclicbase", addr);
>> +    qdev_prop_set_string(dev, "version", version);
>> +
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>> +    return dev;
>> +}
>> +
>> +void riscv_clic_get_next_interrupt(void *opaque, int hartid)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    riscv_clic_next_interrupt(clic, hartid);
>> +}
>> +
>> +bool riscv_clic_shv_interrupt(void *opaque, int mode, int hartid, int
>> irq)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    return riscv_clic_is_shv_interrupt(clic, irq_offset);
>> +}
>> +
>> +bool riscv_clic_edge_triggered(void *opaque, int mode, int hartid, int
>> irq)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    return riscv_clic_is_edge_triggered(clic, irq_offset);
>> +}
>> +
>> +void riscv_clic_clean_pending(void *opaque, int mode, int hartid, int
>> irq)
>> +{
>> +    RISCVCLICState *clic =3D opaque;
>> +    size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, hartid,
>> irq);
>> +    clic->clicintip[irq_offset] =3D 0;
>> +}
>> +
>> +/*
>> + * The new CLIC interrupt-handling mode is encoded as a new state in
>> + * the existing WARL xtvec register, where the low two bits of  are 11.
>> + */
>> +bool riscv_clic_is_clic_mode(CPURISCVState *env)
>> +{
>> +    target_ulong xtvec =3D (env->priv =3D=3D PRV_M) ? env->mtvec : env-=
>stvec;
>> +    return env->clic && ((xtvec & 0x3) =3D=3D 3);
>> +}
>> +
>> +void riscv_clic_decode_exccode(uint32_t exccode, int *mode,
>> +                               int *il, int *irq)
>> +{
>> +    *irq =3D extract32(exccode, 0, 12);
>> +    *mode =3D extract32(exccode, 12, 2);
>> +    *il =3D extract32(exccode, 14, 8);
>> +}
>> diff --git a/include/hw/intc/riscv_clic.h b/include/hw/intc/riscv_clic.h
>> new file mode 100644
>> index 0000000000..e5f89672a6
>> --- /dev/null
>> +++ b/include/hw/intc/riscv_clic.h
>> @@ -0,0 +1,103 @@
>> +/*
>> + * RISC-V CLIC(Core Local Interrupt Controller) interface.
>> + *
>> + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserve=
d.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e
>> for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef RISCV_CLIC_H
>> +#define RISCV_CLIC_H
>> +
>> +#include "hw/irq.h"
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_RISCV_CLIC "riscv_clic"
>> +#define RISCV_CLIC(obj) \
>> +    OBJECT_CHECK(RISCVCLICState, (obj), TYPE_RISCV_CLIC)
>> +
>> +/*
>> + * CLIC per hart active interrupts
>> + *
>> + * We maintain per hart lists of enabled interrupts sorted by
>> + * mode+level+priority. The sorting is done on the configuration path
>> + * so that the interrupt delivery fastpath can linear scan enabled
>> + * interrupts in priority order.
>> + */
>> +typedef struct CLICActiveInterrupt {
>> +    uint16_t intcfg;
>> +    uint16_t irq;
>> +} CLICActiveInterrupt;
>> +
>> +typedef enum TRIG_TYPE {
>> +    POSITIVE_LEVEL,
>> +    POSITIVE_EDGE,
>> +    NEG_LEVEL,
>> +    NEG_EDGE,
>> +} TRIG_TYPE;
>> +
>> +typedef struct RISCVCLICState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +
>> +    /* Implementaion parameters */
>> +    bool prv_s;
>> +    bool prv_u;
>> +    uint32_t num_harts;
>> +    uint32_t num_sources;
>> +    uint32_t clic_size;
>> +    uint32_t clic_mmode_base;
>> +    uint32_t clicintctlbits;
>> +    uint64_t mclicbase;
>> +    char *version;
>> +
>> +    /* Global configuration */
>> +    uint8_t nmbits;
>> +    uint8_t nlbits;
>> +    uint8_t nvbits;
>> +    uint32_t clicinfo;
>> +    uint32_t clicinttrig[32];
>> +
>> +    /* Aperture configuration */
>> +    uint8_t *clicintip;
>> +    uint8_t *clicintie;
>> +    uint8_t *clicintattr;
>> +    uint8_t *clicintctl;
>> +
>> +    /* Complatible with v0.8 */
>> +    uint32_t mintthresh;
>> +    uint32_t sintthresh;
>> +    uint32_t uintthresh;
>> +
>> +    /* QEMU implementaion related fields */
>> +    uint32_t *exccode;
>> +    CLICActiveInterrupt *active_list;
>> +    size_t *active_count;
>> +    MemoryRegion mmio;
>> +    qemu_irq *cpu_irqs;
>> +} RISCVCLICState;
>> +
>> +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool prv_u,
>> +                               uint32_t num_harts, uint32_t num_sources=
,
>> +                               uint8_t clicintctlbits,
>> +                               const char *version);
>> +
>> +void riscv_clic_decode_exccode(uint32_t exccode, int *mode, int *il, in=
t
>> *irq);
>> +void riscv_clic_clean_pending(void *opaque, int mode, int hartid, int
>> irq);
>> +bool riscv_clic_edge_triggered(void *opaque, int mode, int hartid, int
>> irq);
>> +bool riscv_clic_shv_interrupt(void *opaque, int mode, int hartid, int
>> irq);
>> +void riscv_clic_get_next_interrupt(void *opaque, int hartid);
>> +bool riscv_clic_is_clic_mode(CPURISCVState *env);
>> +#endif
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index a5eab26a69..9e389d7bbf 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -33,6 +33,7 @@
>>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
>>  #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>> +#define CPU_INTERRUPT_CLIC CPU_INTERRUPT_TGT_EXT_0
>>
>>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>> @@ -247,6 +248,7 @@ struct CPURISCVState {
>>      /* Fields from here on are preserved across CPU reset. */
>>      QEMUTimer *timer; /* Internal timer */
>>      void *clic;       /* clic interrupt controller */
>> +    uint32_t exccode; /* clic irq encode */
>>  };
>>
>>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
>> --
>> 2.25.1
>>
>>
>>

--000000000000f69f7005c6fbc0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Frank Chang &lt;<a href=3D"mailto:frank.c=
hang@sifive.com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B47=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:53=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a=
 href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.co=
m</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =
=E4=B8=8B=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The Core-Local=
 Interrupt Controller (CLIC) provides low-latency,<br>
vectored, pre-emptive interrupts for RISC-V systems.<br>
<br>
The CLIC also supports a new Selective Hardware Vectoring feature<br>
that allow users to optimize each interrupt for either faster<br>
response or smaller code size.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0default-configs/devices/riscv32-softmmu.mak |=C2=A0 =C2=A01 +<br>
=C2=A0default-configs/devices/riscv64-softmmu.mak |=C2=A0 =C2=A01 +<br>
=C2=A0hw/intc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/intc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/intc/riscv_clic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 835 ++++++++++++++++++++<br>
=C2=A0include/hw/intc/riscv_clic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 103 +++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A07 files changed, 946 insertions(+)<br>
=C2=A0create mode 100644 hw/intc/riscv_clic.c<br>
=C2=A0create mode 100644 include/hw/intc/riscv_clic.h<br>
<br>
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/=
devices/riscv32-softmmu.mak<br>
index d847bd5692..1430c30588 100644<br>
--- a/default-configs/devices/riscv32-softmmu.mak<br>
+++ b/default-configs/devices/riscv32-softmmu.mak<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#CONFIG_PCI_DEVICES=3Dn<br>
=C2=A0CONFIG_SEMIHOSTING=3Dy<br>
=C2=A0CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy<br>
+CONFIG_RISCV_CLIC=3Dy<br>
<br>
=C2=A0# Boards:<br>
=C2=A0#<br>
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/=
devices/riscv64-softmmu.mak<br>
index d5eec75f05..396800bbbd 100644<br>
--- a/default-configs/devices/riscv64-softmmu.mak<br>
+++ b/default-configs/devices/riscv64-softmmu.mak<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#CONFIG_PCI_DEVICES=3Dn<br>
=C2=A0CONFIG_SEMIHOSTING=3Dy<br>
=C2=A0CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy<br>
+CONFIG_RISCV_CLIC=3Dy<br>
<br>
=C2=A0# Boards:<br>
=C2=A0#<br>
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
index f4694088a4..5bf492b48f 100644<br>
--- a/hw/intc/Kconfig<br>
+++ b/hw/intc/Kconfig<br>
@@ -68,6 +68,9 @@ config SIFIVE_CLINT<br>
=C2=A0config SIFIVE_PLIC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config RISCV_CLIC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config GOLDFISH_PIC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
index 1c299039f6..2aa71b6738 100644<br>
--- a/hw/intc/meson.build<br>
+++ b/hw/intc/meson.build<br>
@@ -50,6 +50,7 @@ specific_ss.add(when: &#39;CONFIG_S390_FLIC_KVM&#39;, if_=
true: files(&#39;s390_flic_kvm.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SH_INTC&#39;, if_true: files(&#39;s=
h_intc.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SIFIVE_CLINT&#39;, if_true: files(&=
#39;sifive_clint.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SIFIVE_PLIC&#39;, if_true: files(&#=
39;sifive_plic.c&#39;))<br>
+specific_ss.add(when: &#39;CONFIG_RISCV_CLIC&#39;, if_true: files(&#39;ris=
cv_clic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_XICS&#39;, if_true: files(&#39;xics=
.c&#39;))<br>
=C2=A0specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_XICS&#39;],<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_true: files(&#39=
;xics_kvm.c&#39;))<br>
diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c<br>
new file mode 100644<br>
index 0000000000..8ad534c506<br>
--- /dev/null<br>
+++ b/hw/intc/riscv_clic.c<br>
@@ -0,0 +1,835 @@<br>
+/*<br>
+ * RISC-V CLIC(Core Local Interrupt Controller) for QEMU.<br>
+ *<br>
+ * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserved.<=
br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;sysemu/qtest.h&quot;<br>
+#include &quot;target/riscv/cpu.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/intc/riscv_clic.h&quot;<br>
+<br>
+/*<br>
+ * The 2-bit trig WARL field specifies the trigger type and polarity for e=
ach<br>
+ * interrupt input. Bit 1, trig[0], is defined as &quot;edge-triggered&quo=
t;<br>
+ * (0: level-triggered, 1: edge-triggered); while bit 2, trig[1], is defin=
ed as<br>
+ * &quot;negative-edge&quot; (0: positive-edge, 1: negative-edge). (Sectio=
n 3.6)<br>
+ */<br>
+<br>
+static inline TRIG_TYPE<br>
+riscv_clic_get_trigger_type(RISCVCLICState *clic, size_t irq_offset)<br>
+{<br>
+=C2=A0 =C2=A0 return (clic-&gt;clicintattr[irq_offset] &gt;&gt; 1) &amp; 0=
x3;<br>
+}<br>
+<br>
+static inline bool<br>
+riscv_clic_is_edge_triggered(RISCVCLICState *clic, size_t irq_offset)<br>
+{<br>
+=C2=A0 =C2=A0 return (clic-&gt;clicintattr[irq_offset] &gt;&gt; 1) &amp; 0=
x1;<br>
+}<br>
+<br>
+static inline bool<br>
+riscv_clic_is_shv_interrupt(RISCVCLICState *clic, size_t irq_offset)<br>
+{<br>
+=C2=A0 =C2=A0 return (clic-&gt;clicintattr[irq_offset] &amp; 0x1) &amp;&am=
p; clic-&gt;nvbits;<br>
+}<br>
+<br>
+static uint8_t<br>
+riscv_clic_get_interrupt_level(RISCVCLICState *clic, uint8_t intctl)<br>
+{<br>
+=C2=A0 =C2=A0 int nlbits =3D clic-&gt;nlbits;<br>
+<br>
+=C2=A0 =C2=A0 uint8_t mask_il =3D ((1 &lt;&lt; nlbits) - 1) &lt;&lt; (8 - =
nlbits);<br>
+=C2=A0 =C2=A0 uint8_t mask_padding =3D (1 &lt;&lt; (8 - nlbits)) - 1;<br>
+=C2=A0 =C2=A0 /* unused level bits are set to 1 */<br>
+=C2=A0 =C2=A0 return (intctl &amp; mask_il) | mask_padding;<br>
+}<br>
+<br>
+static uint8_t<br>
+riscv_clic_get_interrupt_priority(RISCVCLICState *clic, uint8_t intctl)<br=
>
+{<br>
+=C2=A0 =C2=A0 int npbits =3D clic-&gt;clicintctlbits - clic-&gt;nlbits;<br=
>
+=C2=A0 =C2=A0 uint8_t mask_priority =3D ((1 &lt;&lt; npbits) - 1) &lt;&lt;=
 (8 - npbits);<br>
+=C2=A0 =C2=A0 uint8_t mask_padding =3D (1 &lt;&lt; (8 - npbits)) - 1;<br>
+<br>
+=C2=A0 =C2=A0 if (npbits &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return UINT8_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* unused priority bits are set to 1 */<br>
+=C2=A0 =C2=A0 return (intctl &amp; mask_priority) | mask_padding;<br>
+}<br>
+<br>
+static void<br>
+riscv_clic_intcfg_decode(RISCVCLICState *clic, uint16_t intcfg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint8_t *mode, uint8_t *level,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint8_t *priority)<br>
+{<br>
+=C2=A0 =C2=A0 *mode =3D intcfg &gt;&gt; 8;<br>
+=C2=A0 =C2=A0 *level =3D riscv_clic_get_interrupt_level(clic, intcfg &amp;=
 0xff);<br>
+=C2=A0 =C2=A0 *priority =3D riscv_clic_get_interrupt_priority(clic, intcfg=
 &amp; 0xff);<br>
+}<br>
+<br>
+/*<br>
+ * In a system with multiple harts, the M-mode CLIC regions for all the ha=
rts<br>
+ * are placed contiguously in the memory space, followed by the S-mode CLI=
C<br>
+ * regions for all harts. (Section 3.11)<br>
+ */<br>
+static size_t<br>
+riscv_clic_get_irq_offset(RISCVCLICState *clic, int mode, int hartid, int =
irq)<br>
+{<br>
+=C2=A0 =C2=A0 size_t mode_offset =3D 0;<br>
+=C2=A0 =C2=A0 size_t unit =3D clic-&gt;num_harts * clic-&gt;num_sources;<b=
r>
+<br>
+=C2=A0 =C2=A0 switch (mode) {<br>
+=C2=A0 =C2=A0 case PRV_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_offset =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case PRV_S:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_offset =3D unit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case PRV_U:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_offset =3D clic-&gt;prv_s ? 2 * unit : un=
it;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid mode %d\n&quot;, mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return mode_offset + hartid * clic-&gt;num_sources + irq;<br=
>
+}<br>
+<br>
+static void riscv_clic_next_interrupt(void *opaque, int hartid)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Scan active list for highest priority pending interr=
upts<br>
+=C2=A0 =C2=A0 =C2=A0* comparing against this harts mintstatus register and=
 interrupt<br>
+=C2=A0 =C2=A0 =C2=A0* the core if we have a higher priority interrupt to d=
eliver<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(hartid));<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D (RISCVCLICState *)opaque;<br>
+<br>
+=C2=A0 =C2=A0 int il[4] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX(get_field(env-&gt;mintstatus, MINTSTATUS_U=
IL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;mintthresh), /* PRV_U *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX(get_field(env-&gt;mintstatus, MINTSTATUS_S=
IL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;sintthresh), /* PRV_S *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reserverd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX(get_field(env-&gt;mintstatus, MINTSTATUS_M=
IL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;uintthresh)=C2=A0 /* PR=
V_M */<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 /* Get sorted list of enabled interrupts for this hart */<br=
>
+=C2=A0 =C2=A0 size_t hart_offset =3D hartid * clic-&gt;num_sources;<br>
+=C2=A0 =C2=A0 CLICActiveInterrupt *active =3D &amp;clic-&gt;active_list[ha=
rt_offset];<br>
+=C2=A0 =C2=A0 size_t active_count =3D clic-&gt;active_count[hartid];<br>
+=C2=A0 =C2=A0 uint8_t mode, level, priority;<br>
+<br>
+=C2=A0 =C2=A0 /* Loop through the enabled interrupts sorted by mode+priori=
ty+level */<br>
+=C2=A0 =C2=A0 while (active_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t irq_offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_intcfg_decode(clic, active-&gt;intc=
fg, &amp;mode, &amp;level,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;priority);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mode &lt; env-&gt;priv || (mode =3D=3D env=
-&gt;priv &amp;&amp; level &lt;=3D il[mode])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* No pending interrupts wi=
th high enough mode+priority+level<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* break and clear pending =
interrupt for this hart<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_offset =3D riscv_clic_get_irq_offset(clic,=
 mode, hartid, active-&gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check pending interrupt with high enough mo=
de+priority+level */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clic-&gt;clicintip[irq_offset]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clean vector edge-triggered p=
ending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_is_edge_triggered=
(clic, irq_offset) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_is_shv_=
interrupt(clic, irq_offset)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;clicintip=
[irq_offset] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Post pending interrupt for th=
is hart */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;exccode[hartid] =3D act=
ive-&gt;irq | mode &lt;&lt; 12 | level &lt;&lt; 14;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(clic-&gt;cpu_irqs[h=
artid], 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check next enabled interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 active_count--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 active++;<br>
+=C2=A0 =C2=A0 }<br>
+}<br></blockquote><div><br></div><div>Hi Zhiwei,</div><div><br></div><div>=
The global interrupt may be disabled (xstatus.xie =3D 0) at the time active=
 interrupt i<br></div><div>is both enabled and pending (i.e. clicintie[i] =
=3D 1 &amp;&amp; clicintip[i] =3D 1)</div><div>Therefore, interrupt i will =
not be taken right away until xstatus.xie is set to 1.</div><div><br></div>=
<div>However, during global interrupt is disabled,</div><div>SW/HW may eith=
er disable or change pending interrupt i to non-pending.</div><div>Interrup=
t i should not be active anymore.</div><div>But current implementation can&=
#39;t reflect that because</div><div>CPU_INTERRUPT_CLIC bit won&#39;t be un=
set.</div><div><br></div><div>To solve this issue, in my own implementation=
, I tried to:</div><div><br></div><div>In riscv_clic_update_intip(), if int=
errupt i turns to non-pending,<br></div><div>check if interrupt i is an act=
ive pending interrupt.</div><div>(by decoding IRQ number from env-&gt;excco=
de and check if</div><div>cpu-&gt;interrupt_request flag also has CPU_INTER=
RUPT_CLIC bit set.)</div><div><br></div><div>If so, interrupt i is current =
active pending interrupt to be disabled, we have to</div><div>unset CPU_INT=
ERRUPT_CLIC bit from interrupt request flag for the hart<br></div><div>to p=
revent interrupt i been taken later as it&#39;s not pending anymore.<br></d=
iv><div>Then call riscv_clic_next_interrupt() as usual to pick next interru=
pt.<br></div><div><div><br></div><div>Same behavior is also applied in risc=
v_clic_update_intie() when</div><div>interrupt i is disabled and interrupt =
i is also the active pending interrupt.</div></div><div><br></div><div>Also=
, I think the effective interrupt level check should be moved</div><div>fro=
m riscv_clic_update_intip() to=C2=A0riscv_cpu_local_irq_mode_enabled() in c=
pu_helper.c.</div></div></div></blockquote><div><br></div><div>Sorry, I mea=
n from riscv_clic_next_interrupt() to riscv_cpu_local_irq_mode_enabled().</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Consider the fo=
llowing scenario:<br></div><div>=C2=A0 =C2=A0 a. Active pending interrupt i=
 is not been handled due to global interrupt is disabled.</div><div><div>=
=C2=A0 =C2=A0 b. Software accesses xnxti CSR with write side effect (xstatu=
s.xie is still set to 0).</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 xintstatus.=
xil will be updated to the interrupt level of interrupt i.</div></div><div>=
=C2=A0 =C2=A0 c. Interrupt i turns to non-pending/disabled.</div><div>=C2=
=A0 =C2=A0 d. Interrupt j is enabled and pending.</div><div>=C2=A0 =C2=A0 e=
. Interrupt j won&#39;t be selected in riscv_clic_next_interrupt() if its i=
nterrupt level</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 is lower than interrup=
t i (xinitstatus.xil still holds the interrupt level of interrupt i),</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 which is incorrect because interrupt i is =
not pending and active anymore.</div><div><br></div><div>By moving effectiv=
e interrupt level check from=C2=A0</div><div>riscv_clic_update_intip() to=
=C2=A0riscv_cpu_local_irq_mode_enabled()</div></div></div></blockquote><div=
><br></div><div>Should be riscv_clic_next_interrupt(), not riscv_clic_updat=
e_intip().</div><div><br></div><div>Regards,</div><div>Frank Chang</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div>can eliminate the issue of lower-prio=
rity interrupt been masked out</div><div>by higher-interrupt-level non acti=
ve interrupt.</div><div><br></div><div>Let me know if I miss anything.</div=
><div><br></div><div>Regards,<br></div><div>Frank Chang</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+/*<br>
+ * Any interrupt i that is not accessible to S-mode or U-Mode<br>
+ * appears as hard-wired zeros in clicintip[i], clicintie[i],<br>
+ * clicintattr[i], and clicintctl[i].(Section 3.9)(Section 3.10)<br>
+ */<br>
+static bool<br>
+riscv_clic_check_visible(RISCVCLICState *clic, int mode, int hartid, int i=
rq)<br>
+{<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 if (!clic-&gt;prv_s &amp;&amp; !clic-&gt;prv_u) { /* M */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mode =3D=3D PRV_M;<br>
+=C2=A0 =C2=A0 } else if (!clic-&gt;prv_s) { /* M/U */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (clic-&gt;nmbits) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mode =3D=3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintattr[irq_=
offset] &amp; 0x80 ? (mode =3D=3D PRV_M) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mode =3D=3D PRV_U)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: nmbits=
 can only be 0 or 1 for M/U hart&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else { /* M/S/U */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (clic-&gt;nmbits) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mode =3D=3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintattr[irq_=
offset] &amp; 0x80 ? (mode =3D=3D PRV_M) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mode =3D=3D PRV_S)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mode =3D=3D clic-&gt;clic=
intattr[irq_offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: nmbits=
 can only be 0 or 1 or 2 for M/S/U hart&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+/*<br>
+ * For level-triggered interrupts, software writes to pending bits are<br>
+ * ignored completely. (Section 3.4)<br>
+ */<br>
+static bool<br>
+riscv_clic_validate_intip(RISCVCLICState *clic, int mode, int hartid, int =
irq)<br>
+{<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 return riscv_clic_is_edge_triggered(clic, irq_offset);<br>
+}<br>
+<br>
+static void<br>
+riscv_clic_update_intip(RISCVCLICState *clic, int mode, int hartid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int irq, uint64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 clic-&gt;clicintip[irq_offset] =3D !!value;<br>
+=C2=A0 =C2=A0 riscv_clic_next_interrupt(clic, hartid);<br>
+}<br>
+<br>
+/*<br>
+ * For security purpose, the field can only be set to a privilege<br>
+ * level that is equal mode to or lower than the currently running<br>
+ * privilege level.(Section 3.6)<br>
+ */<br>
+<br>
+static bool riscv_clic_validate_intattr(RISCVCLICState *clic, uint64_t val=
ue)<br>
+{<br>
+=C2=A0 =C2=A0 int mode =3D extract64(value, 6, 2);<br>
+<br>
+=C2=A0 =C2=A0 if (!qtest_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D current_cpu-&gt;env_ptr=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv &lt; mode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static inline int riscv_clic_encode_priority(const CLICActiveInterrupt *i)=
<br>
+{<br>
+=C2=A0 =C2=A0 return ((i-&gt;intcfg &amp; 0x3ff) &lt;&lt; 12) | /* Highest=
 mode+level+priority */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i-&gt;irq &amp; 0xfff);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Highest irq number */<br>
+}<br>
+<br>
+static int riscv_clic_active_compare(const void *a, const void *b)<br>
+{<br>
+=C2=A0 =C2=A0 return riscv_clic_encode_priority(b) - riscv_clic_encode_pri=
ority(a);<br>
+}<br>
+<br>
+static void<br>
+riscv_clic_update_intie(RISCVCLICState *clic, int mode, int hartid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int irq, uint64_t new_intie)<br>
+{<br>
+=C2=A0 =C2=A0 size_t hart_offset =3D hartid * clic-&gt;num_sources;<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 CLICActiveInterrupt *active_list =3D &amp;clic-&gt;active_li=
st[hart_offset];<br>
+=C2=A0 =C2=A0 size_t *active_count =3D &amp;clic-&gt;active_count[hartid];=
<br>
+<br>
+=C2=A0 =C2=A0 uint8_t old_intie =3D clic-&gt;clicintie[irq_offset];<br>
+=C2=A0 =C2=A0 clic-&gt;clicintie[irq_offset] =3D !!new_intie;<br>
+<br>
+=C2=A0 =C2=A0 /* Add to or remove from list of active interrupts */<br>
+=C2=A0 =C2=A0 if (new_intie &amp;&amp; !old_intie) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 active_list[*active_count].intcfg =3D (mode &l=
t;&lt; 8) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 clic-&gt;clicintctl[irq_offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 active_list[*active_count].irq =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*active_count)++;<br>
+=C2=A0 =C2=A0 } else if (!new_intie &amp;&amp; old_intie) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLICActiveInterrupt key =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mode &lt;&lt; 8) | clic-&gt;cli=
cintctl[irq_offset], irq<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLICActiveInterrupt *result =3D bsearch(&amp;k=
ey,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 active_list, *active_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sizeof(CLICActiveInterrupt),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 riscv_clic_active_compare);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t elem =3D (result - active_list) / sizeo=
f(CLICActiveInterrupt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t sz =3D (--(*active_count) - elem) * siz=
eof(CLICActiveInterrupt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(result);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(&amp;result[0], &amp;result[1], sz);<b=
r>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Sort list of active interrupts */<br>
+=C2=A0 =C2=A0 qsort(active_list, *active_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(CLICActiveInterrupt),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_active_compare);<br>
+<br>
+=C2=A0 =C2=A0 riscv_clic_next_interrupt(clic, hartid);<br>
+}<br>
+<br>
+static void<br>
+riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint64_t value, unsigned size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int mode, int hartid, int irq)<br>
+{<br>
+=C2=A0 =C2=A0 int req =3D extract32(addr, 0, 2);<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+<br>
+=C2=A0 =C2=A0 if (hartid &gt;=3D clic-&gt;num_harts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid hartid %u: 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hartid, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (irq &gt;=3D clic-&gt;num_sources) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid irq %u: 0x%&quot; HWADDR_PRIx &quot;\n&quot;, irq, =
addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (req) {<br>
+=C2=A0 =C2=A0 case 0: /* clicintip[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_validate_intip(clic, mode, hart=
id, irq)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The actual pending bit i=
s located at bit 0 (i.e., the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* leastsignificant bit). I=
n case future extensions expand the bit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* field, from FW perspecti=
ve clicintip[i]=3Dzero means no interrupt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pending, and clicintip[i=
]!=3D0 (not just 1) indicates an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interrupt is pending. (S=
ection 3.4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value !=3D clic-&gt;clicinti=
p[irq_offset]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_=
intip(clic, mode, hartid, irq, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 1: /* clicintie[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clic-&gt;clicintie[irq_offset] !=3D value)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_intie(clic, mo=
de, hartid, irq, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2: /* clicintattr[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_validate_intattr(clic, value)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clic-&gt;clicintattr[irq_off=
set] !=3D value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* When nmbits=3D2=
, check WARL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool invalid =3D (=
clic-&gt;nmbits =3D=3D 2) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(extract64(value, 6, 2) =3D=3D 0b10);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (invalid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
8_t old_mode =3D extract32(clic-&gt;clicintattr[irq_offset],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A06, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valu=
e =3D deposit32(value, 6, 2, old_mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;clicintat=
tr[irq_offset] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_next_in=
terrupt(clic, hartid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 3: /* clicintctl[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value !=3D clic-&gt;clicintctl[irq_offset]=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;clicintctl[irq_offset] =
=3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_next_interrupt(clic, =
hartid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t<br>
+riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int hartid, int irq)<br>
+{<br>
+=C2=A0 =C2=A0 int req =3D extract32(addr, 0, 2);<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+<br>
+=C2=A0 =C2=A0 if (hartid &gt;=3D clic-&gt;num_harts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid hartid %u: 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hartid, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (irq &gt;=3D clic-&gt;num_sources) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid irq %u: 0x%&quot; HWADDR_PRIx &quot;\n&quot;, irq, =
addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (req) {<br>
+=C2=A0 =C2=A0 case 0: /* clicintip[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintip[irq_offset];<br>
+=C2=A0 =C2=A0 case 1: /* clicintie[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintie[irq_offset];<br>
+=C2=A0 =C2=A0 case 2: /* clicintattr[i] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clicintattr register layout<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Bits Field<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 7:6 mode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 5:3 reserved (WPRI 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 2:1 trig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 shv<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintattr[irq_offset] &amp; =
~0x38;<br>
+=C2=A0 =C2=A0 case 3: /* clicintctrl */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The implemented bits are kept left-jus=
tified in the most-significant<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* bits of each 8-bit clicintctl[i] regis=
ter, with the lower<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unimplemented bits treated as hardwire=
d to 1.(Section 3.7)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;clicintctl[irq_offset] |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((1 &lt;&lt; (8 - c=
lic-&gt;clicintctlbits)) - 1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/* Return target interrupt mode */<br>
+static int riscv_clic_get_mode(RISCVCLICState *clic, hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 int mode =3D addr / (4 * clic-&gt;num_harts * clic-&gt;num_s=
ources);<br>
+=C2=A0 =C2=A0 switch (mode) {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PRV_M;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(clic-&gt;prv_s || clic-&gt;prv_u);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;prv_s ? PRV_S : PRV_U;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(clic-&gt;prv_s &amp;&amp; clic-&gt;prv_=
u);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PRV_U;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/* Return target hart id */<br>
+static int riscv_clic_get_hartid(RISCVCLICState *clic, hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 int mode_unit =3D 4 * clic-&gt;num_harts * clic-&gt;num_sour=
ces;<br>
+=C2=A0 =C2=A0 int hart_unit =3D 4 * clic-&gt;num_sources;<br>
+<br>
+=C2=A0 =C2=A0 return (addr % mode_unit) / hart_unit;<br>
+}<br>
+<br>
+/* Return target interrupt number */<br>
+static int riscv_clic_get_irq(RISCVCLICState *clic, hwaddr addr)<br>
+{<br>
+=C2=A0 =C2=A0 int hart_unit =3D 4 * clic-&gt;num_sources;<br>
+=C2=A0 =C2=A0 return (addr % hart_unit) / 4;<br>
+}<br>
+<br>
+static void<br>
+riscv_clic_write(void *opaque, hwaddr addr, uint64_t value, unsigned size)=
<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr clic_size =3D clic-&gt;clic_size;<br>
+=C2=A0 =C2=A0 int hartid, mode, irq;<br>
+<br>
+=C2=A0 =C2=A0 if (addr &lt; clic_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; 0x1000) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(addr % 4 =3D=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index =3D addr / 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* cliccfg */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
8_t nlbits =3D extract32(value, 1, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
8_t nmbits =3D extract32(value, 5, 2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* The 4-bit cliccfg.nlbits WARL field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* Valid values are 0=E2=80=948.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
nlbits &lt;=3D 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clic-&gt;nlbits =3D nlbits;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* V=
alid values are given by implemented priviledges */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (nmbits &lt;=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;nmbits =3D nmbits;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se if (clic-&gt;prv_u) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (nmbits &lt;=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;nmbits =3D nmbits;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert(!clic-&gt;prv_s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (nmbits =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clic-&gt;nmbits =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic=
-&gt;nvbits =3D extract32(value, 0, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* clicinfo, read-only r=
egister */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: write read-only clicinfo.\n&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x10 ... 0x2F: /* clicinttr=
ig */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
32_t interrupt_number =3D value &amp; MAKE_64BIT_MASK(0, 13);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
interrupt_number &lt;=3D clic-&gt;num_sources) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value &amp;=3D ~MAKE_64BIT_MASK(13, 18);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clic-&gt;clicinttrig[index - 0x10] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* mintthresh */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(clic-&=
gt;version, &quot;v0.8&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic=
-&gt;mintthresh =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: invalid write addr: 0x%&quot; H=
WADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: invalid write addr: 0x%&quot; H=
WADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D 0x1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hartid =3D riscv_clic_get_hartid=
(clic, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D riscv_clic_get_mode(cli=
c, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D riscv_clic_get_irq(clic,=
 addr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_check_visible(cli=
c, mode, hartid, irq)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_hart_wr=
ite(clic, addr, value, size, mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hartid, irq);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid write: 0x%&quot; HWADDR_PRIx &quot;\n&quot;, addr);=
<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t riscv_clic_read(void *opaque, hwaddr addr, unsigned size)<=
br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr clic_size =3D clic-&gt;clic_size;<br>
+=C2=A0 =C2=A0 int hartid, mode, irq;<br>
+<br>
+=C2=A0 =C2=A0 if (addr &lt; clic_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; 0x1000) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(addr % 4 =3D=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index =3D addr / 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* cliccfg */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;nv=
bits |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(clic-&gt;nlbits &lt;&lt; 1) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(clic-&gt;nmbits &lt;&lt; 5);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* clicinfo */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clicinfo r=
egister layout<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Bits Field=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 31 reserve=
d (WARL 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 30:25 num_=
trigger<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 24:21 CLIC=
INTCTLBITS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 20:13 vers=
ion (for version control)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 12:0 num_i=
nterrupt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;cl=
icinfo &amp; ~INT32_MAX;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x10 ... 0x2F: /* clicinttr=
ig */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clicinttri=
g register layout<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Bits Field=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 31 enable<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 30:13 rese=
rved (WARL 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 12:0 inter=
rupt_number<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return clic-&gt;cl=
icinttrig[index - 0x10] &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~MAKE_64BIT_MASK(13, 18);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* mintthresh */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(clic-&=
gt;version, &quot;v0.8&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn clic-&gt;mintthresh;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: invalid read : 0x%&quot; HWADDR=
_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clic: invalid read : 0x%&quot; HWADDR=
_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D 0x1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hartid =3D riscv_clic_get_hartid=
(clic, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D riscv_clic_get_mode(cli=
c, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D riscv_clic_get_irq(clic,=
 addr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_check_visible(cli=
c, mode, hartid, irq)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_clic_=
hart_read(clic, addr, mode, hartid, irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;clic: invalid read: 0x%&quot; HWADDR_PRIx &quot;\n&quot;, addr);<=
br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void riscv_clic_set_irq(void *opaque, int id, int level)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 int irq, hartid, mode;<br>
+=C2=A0 =C2=A0 hwaddr addr =3D 4 * id;<br>
+=C2=A0 =C2=A0 TRIG_TYPE type;<br>
+<br>
+=C2=A0 =C2=A0 hartid =3D riscv_clic_get_hartid(clic, addr);<br>
+=C2=A0 =C2=A0 mode =3D riscv_clic_get_mode(clic, addr);<br>
+=C2=A0 =C2=A0 irq =3D riscv_clic_get_irq(clic, addr);<br>
+=C2=A0 =C2=A0 type =3D riscv_clic_get_trigger_type(clic, id);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* In general, the edge-triggered interrupt state shoul=
d be kept in pending<br>
+=C2=A0 =C2=A0 =C2=A0* bit, while the level-triggered interrupt should be k=
ept in the level<br>
+=C2=A0 =C2=A0 =C2=A0* state of the incoming wire.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* For CLIC, model the level-triggered interrupt by rea=
d-only pending bit.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case POSITIVE_LEVEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case POSITIVE_EDGE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_intip(clic, mo=
de, hartid, irq, level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case NEG_LEVEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_intip(clic, mo=
de, hartid, irq, !level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case NEG_EDGE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case POSITIVE_LEVEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_intip(clic, mo=
de, hartid, irq, level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case POSITIVE_EDGE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case NEG_LEVEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case NEG_EDGE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_update_intip(clic, mo=
de, hartid, irq, !level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void riscv_clic_cpu_irq_handler(void *opaque, int irq, int level)<b=
r>
+{<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D (CPURISCVState *)opaque;<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D env-&gt;clic;<br>
+=C2=A0 =C2=A0 CPUState *cpu =3D env_cpu(env);<br>
+<br>
+=C2=A0 =C2=A0 if (level) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;exccode =3D clic-&gt;exccode[cpu-&gt;c=
pu_index];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_interrupt(env_cpu(env), CPU_INTERRUPT_CLIC=
);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps riscv_clic_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D riscv_clic_read,<br>
+=C2=A0 =C2=A0 .write =3D riscv_clic_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 8<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void riscv_clic_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D RISCV_CLIC(dev);<br>
+=C2=A0 =C2=A0 size_t harts_x_sources =3D clic-&gt;num_harts * clic-&gt;num=
_sources;<br>
+=C2=A0 =C2=A0 int irqs, i;<br>
+<br>
+=C2=A0 =C2=A0 if (clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 3 * harts_x_sources;<br>
+=C2=A0 =C2=A0 } else if (clic-&gt;prv_s || clic-&gt;prv_u) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D 2 * harts_x_sources;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs =3D harts_x_sources;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 clic-&gt;clic_size =3D irqs * 4 + 0x1000;<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;clic-&gt;mmio, OBJECT(dev), &amp;=
riscv_clic_ops, clic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_RISCV_CLIC, clic-&gt;clic_size);<br>
+<br>
+=C2=A0 =C2=A0 clic-&gt;clicintip =3D g_new0(uint8_t, irqs);<br>
+=C2=A0 =C2=A0 clic-&gt;clicintie =3D g_new0(uint8_t, irqs);<br>
+=C2=A0 =C2=A0 clic-&gt;clicintattr =3D g_new0(uint8_t, irqs);<br>
+=C2=A0 =C2=A0 clic-&gt;clicintctl =3D g_new0(uint8_t, irqs);<br>
+=C2=A0 =C2=A0 clic-&gt;active_list =3D g_new0(CLICActiveInterrupt, irqs);<=
br>
+=C2=A0 =C2=A0 clic-&gt;active_count =3D g_new0(size_t, clic-&gt;num_harts)=
;<br>
+=C2=A0 =C2=A0 clic-&gt;exccode =3D g_new0(uint32_t, clic-&gt;num_harts);<b=
r>
+=C2=A0 =C2=A0 clic-&gt;cpu_irqs =3D g_new0(qemu_irq, clic-&gt;num_harts);<=
br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;clic-&gt;mmio);<b=
r>
+<br>
+=C2=A0 =C2=A0 /* Allocate irq through gpio, so that we can use qtest */<br=
>
+=C2=A0 =C2=A0 qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out(dev, clic-&gt;cpu_irqs, clic-&gt;num_hart=
s);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; clic-&gt;num_harts; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(i));<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq irq =3D qemu_allocate_irq(riscv_clic_=
cpu_irq_handler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;cpu-&gt;env, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, i, irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.clic =3D clic;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static Property riscv_clic_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;prv-s&quot;, RISCVCLICState, prv_s, f=
alse),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;prv-u&quot;, RISCVCLICState, prv_u, f=
alse),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-harts&quot;, RISCVCLICState, nu=
m_harts, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-sources&quot;, RISCVCLICState, =
num_sources, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;clicintctlbits&quot;, RISCVCLICStat=
e, clicintctlbits, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;mclicbase&quot;, RISCVCLICState, mc=
licbase, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;version&quot;, RISCVCLICState, vers=
ion),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void riscv_clic_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D riscv_clic_realize;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, riscv_clic_properties);<br>
+}<br>
+<br>
+static const TypeInfo riscv_clic_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_RISCV_CLIC,=
<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RISCVCLICState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D riscv_clic_class_init,<br>
+};<br>
+<br>
+static void riscv_clic_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;riscv_clic_info);<br>
+}<br>
+<br>
+type_init(riscv_clic_register_types)<br>
+<br>
+/*<br>
+ * riscv_clic_create:<br>
+ *<br>
+ * @addr: base address of M-Mode CLIC memory-mapped registers<br>
+ * @prv_s: have smode region<br>
+ * @prv_u: have umode region<br>
+ * @num_harts: number of CPU harts<br>
+ * @num_sources: number of interrupts supporting by each aperture<br>
+ * @clicintctlbits: bits are actually implemented in the clicintctl regist=
ers<br>
+ * @version: clic version, such as &quot;v0.9&quot;<br>
+ *<br>
+ * Returns: the device object<br>
+ */<br>
+DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool prv_u,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_harts, uint32_t num_sour=
ces,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t clicintctlbits,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *version)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D qdev_new(TYPE_RISCV_CLIC);<br>
+<br>
+=C2=A0 =C2=A0 assert(num_sources &lt;=3D 4096);<br>
+=C2=A0 =C2=A0 assert(num_harts &lt;=3D 1024);<br>
+=C2=A0 =C2=A0 assert(clicintctlbits &lt;=3D 8);<br>
+=C2=A0 =C2=A0 assert(!strcmp(version, &quot;v0.8&quot;) || !strcmp(version=
, &quot;v0.9&quot;));<br>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;prv-s&quot;, prv_s);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;prv-u&quot;, prv_u);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-harts&quot;, num_harts);=
<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-sources&quot;, num_sourc=
es);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;clicintctlbits&quot;, clicin=
tctlbits);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;mclicbase&quot;, addr);<br>
+=C2=A0 =C2=A0 qdev_prop_set_string(dev, &quot;version&quot;, version);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &amp;error_fat=
al);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
+=C2=A0 =C2=A0 return dev;<br>
+}<br>
+<br>
+void riscv_clic_get_next_interrupt(void *opaque, int hartid)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 riscv_clic_next_interrupt(clic, hartid);<br>
+}<br>
+<br>
+bool riscv_clic_shv_interrupt(void *opaque, int mode, int hartid, int irq)=
<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 return riscv_clic_is_shv_interrupt(clic, irq_offset);<br>
+}<br>
+<br>
+bool riscv_clic_edge_triggered(void *opaque, int mode, int hartid, int irq=
)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 return riscv_clic_is_edge_triggered(clic, irq_offset);<br>
+}<br>
+<br>
+void riscv_clic_clean_pending(void *opaque, int mode, int hartid, int irq)=
<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCLICState *clic =3D opaque;<br>
+=C2=A0 =C2=A0 size_t irq_offset =3D riscv_clic_get_irq_offset(clic, mode, =
hartid, irq);<br>
+=C2=A0 =C2=A0 clic-&gt;clicintip[irq_offset] =3D 0;<br>
+}<br>
+<br>
+/*<br>
+ * The new CLIC interrupt-handling mode is encoded as a new state in<br>
+ * the existing WARL xtvec register, where the low two bits of=C2=A0 are 1=
1.<br>
+ */<br>
+bool riscv_clic_is_clic_mode(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 target_ulong xtvec =3D (env-&gt;priv =3D=3D PRV_M) ? env-&gt=
;mtvec : env-&gt;stvec;<br>
+=C2=A0 =C2=A0 return env-&gt;clic &amp;&amp; ((xtvec &amp; 0x3) =3D=3D 3);=
<br>
+}<br>
+<br>
+void riscv_clic_decode_exccode(uint32_t exccode, int *mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *il, int *irq)<br>
+{<br>
+=C2=A0 =C2=A0 *irq =3D extract32(exccode, 0, 12);<br>
+=C2=A0 =C2=A0 *mode =3D extract32(exccode, 12, 2);<br>
+=C2=A0 =C2=A0 *il =3D extract32(exccode, 14, 8);<br>
+}<br>
diff --git a/include/hw/intc/riscv_clic.h b/include/hw/intc/riscv_clic.h<br=
>
new file mode 100644<br>
index 0000000000..e5f89672a6<br>
--- /dev/null<br>
+++ b/include/hw/intc/riscv_clic.h<br>
@@ -0,0 +1,103 @@<br>
+/*<br>
+ * RISC-V CLIC(Core Local Interrupt Controller) interface.<br>
+ *<br>
+ * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserved.<=
br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#ifndef RISCV_CLIC_H<br>
+#define RISCV_CLIC_H<br>
+<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+<br>
+#define TYPE_RISCV_CLIC &quot;riscv_clic&quot;<br>
+#define RISCV_CLIC(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(RISCVCLICState, (obj), TYPE_RISCV_CLIC)<br>
+<br>
+/*<br>
+ * CLIC per hart active interrupts<br>
+ *<br>
+ * We maintain per hart lists of enabled interrupts sorted by<br>
+ * mode+level+priority. The sorting is done on the configuration path<br>
+ * so that the interrupt delivery fastpath can linear scan enabled<br>
+ * interrupts in priority order.<br>
+ */<br>
+typedef struct CLICActiveInterrupt {<br>
+=C2=A0 =C2=A0 uint16_t intcfg;<br>
+=C2=A0 =C2=A0 uint16_t irq;<br>
+} CLICActiveInterrupt;<br>
+<br>
+typedef enum TRIG_TYPE {<br>
+=C2=A0 =C2=A0 POSITIVE_LEVEL,<br>
+=C2=A0 =C2=A0 POSITIVE_EDGE,<br>
+=C2=A0 =C2=A0 NEG_LEVEL,<br>
+=C2=A0 =C2=A0 NEG_EDGE,<br>
+} TRIG_TYPE;<br>
+<br>
+typedef struct RISCVCLICState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 /* Implementaion parameters */<br>
+=C2=A0 =C2=A0 bool prv_s;<br>
+=C2=A0 =C2=A0 bool prv_u;<br>
+=C2=A0 =C2=A0 uint32_t num_harts;<br>
+=C2=A0 =C2=A0 uint32_t num_sources;<br>
+=C2=A0 =C2=A0 uint32_t clic_size;<br>
+=C2=A0 =C2=A0 uint32_t clic_mmode_base;<br>
+=C2=A0 =C2=A0 uint32_t clicintctlbits;<br>
+=C2=A0 =C2=A0 uint64_t mclicbase;<br>
+=C2=A0 =C2=A0 char *version;<br>
+<br>
+=C2=A0 =C2=A0 /* Global configuration */<br>
+=C2=A0 =C2=A0 uint8_t nmbits;<br>
+=C2=A0 =C2=A0 uint8_t nlbits;<br>
+=C2=A0 =C2=A0 uint8_t nvbits;<br>
+=C2=A0 =C2=A0 uint32_t clicinfo;<br>
+=C2=A0 =C2=A0 uint32_t clicinttrig[32];<br>
+<br>
+=C2=A0 =C2=A0 /* Aperture configuration */<br>
+=C2=A0 =C2=A0 uint8_t *clicintip;<br>
+=C2=A0 =C2=A0 uint8_t *clicintie;<br>
+=C2=A0 =C2=A0 uint8_t *clicintattr;<br>
+=C2=A0 =C2=A0 uint8_t *clicintctl;<br>
+<br>
+=C2=A0 =C2=A0 /* Complatible with v0.8 */<br>
+=C2=A0 =C2=A0 uint32_t mintthresh;<br>
+=C2=A0 =C2=A0 uint32_t sintthresh;<br>
+=C2=A0 =C2=A0 uint32_t uintthresh;<br>
+<br>
+=C2=A0 =C2=A0 /* QEMU implementaion related fields */<br>
+=C2=A0 =C2=A0 uint32_t *exccode;<br>
+=C2=A0 =C2=A0 CLICActiveInterrupt *active_list;<br>
+=C2=A0 =C2=A0 size_t *active_count;<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+=C2=A0 =C2=A0 qemu_irq *cpu_irqs;<br>
+} RISCVCLICState;<br>
+<br>
+DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool prv_u,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_harts, uint32_t num_sour=
ces,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t clicintctlbits,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *version);<br>
+<br>
+void riscv_clic_decode_exccode(uint32_t exccode, int *mode, int *il, int *=
irq);<br>
+void riscv_clic_clean_pending(void *opaque, int mode, int hartid, int irq)=
;<br>
+bool riscv_clic_edge_triggered(void *opaque, int mode, int hartid, int irq=
);<br>
+bool riscv_clic_shv_interrupt(void *opaque, int mode, int hartid, int irq)=
;<br>
+void riscv_clic_get_next_interrupt(void *opaque, int hartid);<br>
+bool riscv_clic_is_clic_mode(CPURISCVState *env);<br>
+#endif<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index a5eab26a69..9e389d7bbf 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -33,6 +33,7 @@<br>
=C2=A0#define RISCV_CPU_TYPE_SUFFIX &quot;-&quot; TYPE_RISCV_CPU<br>
=C2=A0#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU<br>
+#define CPU_INTERRUPT_CLIC CPU_INTERRUPT_TGT_EXT_0<br>
<br>
=C2=A0#define TYPE_RISCV_CPU_ANY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 RISCV_CPU_TYPE_NAME(&quot;any&quot;)<br>
=C2=A0#define TYPE_RISCV_CPU_BASE32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0RISCV_CPU_TYPE_NAME(&quot;rv32&quot;)<br>
@@ -247,6 +248,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved across CPU reset. =
*/<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer *timer; /* Internal timer */<br>
=C2=A0 =C2=A0 =C2=A0void *clic;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clic interrupt=
 controller */<br>
+=C2=A0 =C2=A0 uint32_t exccode; /* clic irq encode */<br>
=C2=A0};<br>
<br>
=C2=A0OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000f69f7005c6fbc0db--

