Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ly3tB-0001gY-KW
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 22:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3t8-0001eU-M7; Mon, 28 Jun 2021 22:54:14 -0400
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:41441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3sz-0001rf-Ld; Mon, 28 Jun 2021 22:54:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07860123|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0912083-0.00106352-0.907728;
 FP=13543244093792453554|2|2|6|0|-1|-1|-1; HT=ay29a033018047193;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.KZYBar9_1624935238; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KZYBar9_1624935238)
 by smtp.aliyun-inc.com(10.147.41.121);
 Tue, 29 Jun 2021 10:53:58 +0800
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D2vPxsOfpfLKROyHhD5rRGPn7YpGwx-PE9vCByzeMG15A@mail.gmail.com>
 <CANzO1D2WdE56pgJe1z8iLzw2ao4huSs-K3F-1SJbfXzJWt+jdQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <eedc7ca1-b59f-f6fb-9e35-9d9043b568ff@c-sky.com>
Date: Tue, 29 Jun 2021 10:52:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANzO1D2WdE56pgJe1z8iLzw2ao4huSs-K3F-1SJbfXzJWt+jdQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6A70CDA918DBB859CEF8A6B5"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.51; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-51.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Jun 2021 02:54:15 -0000

This is a multi-part message in MIME format.
--------------6A70CDA918DBB859CEF8A6B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/6/26 下午11:26, Frank Chang wrote:
> Frank Chang <frank.chang@sifive.com <mailto:frank.chang@sifive.com>> 於 
> 2021年6月26日 週六 下午11:03寫道：
>
>     LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於
>     2021年4月9日 週五 下午3:57寫道：
>
>         The Core-Local Interrupt Controller (CLIC) provides low-latency,
>         vectored, pre-emptive interrupts for RISC-V systems.
>
>         The CLIC also supports a new Selective Hardware Vectoring feature
>         that allow users to optimize each interrupt for either faster
>         response or smaller code size.
>
>         Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com
>         <mailto:zhiwei_liu@c-sky.com>>
>         ---
>          default-configs/devices/riscv32-softmmu.mak |   1 +
>          default-configs/devices/riscv64-softmmu.mak |   1 +
>          hw/intc/Kconfig                             |   3 +
>          hw/intc/meson.build                         |   1 +
>          hw/intc/riscv_clic.c                        | 835
>         ++++++++++++++++++++
>          include/hw/intc/riscv_clic.h                | 103 +++
>          target/riscv/cpu.h                          |   2 +
>          7 files changed, 946 insertions(+)
>          create mode 100644 hw/intc/riscv_clic.c
>          create mode 100644 include/hw/intc/riscv_clic.h
>
>         diff --git a/default-configs/devices/riscv32-softmmu.mak
>         b/default-configs/devices/riscv32-softmmu.mak
>         index d847bd5692..1430c30588 100644
>         --- a/default-configs/devices/riscv32-softmmu.mak
>         +++ b/default-configs/devices/riscv32-softmmu.mak
>         @@ -5,6 +5,7 @@
>          #CONFIG_PCI_DEVICES=n
>          CONFIG_SEMIHOSTING=y
>          CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>         +CONFIG_RISCV_CLIC=y
>
>          # Boards:
>          #
>         diff --git a/default-configs/devices/riscv64-softmmu.mak
>         b/default-configs/devices/riscv64-softmmu.mak
>         index d5eec75f05..396800bbbd 100644
>         --- a/default-configs/devices/riscv64-softmmu.mak
>         +++ b/default-configs/devices/riscv64-softmmu.mak
>         @@ -5,6 +5,7 @@
>          #CONFIG_PCI_DEVICES=n
>          CONFIG_SEMIHOSTING=y
>          CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>         +CONFIG_RISCV_CLIC=y
>
>          # Boards:
>          #
>         diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>         index f4694088a4..5bf492b48f 100644
>         --- a/hw/intc/Kconfig
>         +++ b/hw/intc/Kconfig
>         @@ -68,6 +68,9 @@ config SIFIVE_CLINT
>          config SIFIVE_PLIC
>              bool
>
>         +config RISCV_CLIC
>         +    bool
>         +
>          config GOLDFISH_PIC
>              bool
>
>         diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>         index 1c299039f6..2aa71b6738 100644
>         --- a/hw/intc/meson.build
>         +++ b/hw/intc/meson.build
>         @@ -50,6 +50,7 @@ specific_ss.add(when:
>         'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
>          specific_ss.add(when: 'CONFIG_SH_INTC', if_true:
>         files('sh_intc.c'))
>          specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true:
>         files('sifive_clint.c'))
>          specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
>         files('sifive_plic.c'))
>         +specific_ss.add(when: 'CONFIG_RISCV_CLIC', if_true:
>         files('riscv_clic.c'))
>          specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>          specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>                         if_true: files('xics_kvm.c'))
>         diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c
>         new file mode 100644
>         index 0000000000..8ad534c506
>         --- /dev/null
>         +++ b/hw/intc/riscv_clic.c
>         @@ -0,0 +1,835 @@
>         +/*
>         + * RISC-V CLIC(Core Local Interrupt Controller) for QEMU.
>         + *
>         + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All
>         rights reserved.
>         + *
>         + * This program is free software; you can redistribute it
>         and/or modify it
>         + * under the terms and conditions of the GNU General Public
>         License,
>         + * version 2 or later, as published by the Free Software
>         Foundation.
>         + *
>         + * This program is distributed in the hope it will be useful,
>         but WITHOUT
>         + * ANY WARRANTY; without even the implied warranty of
>         MERCHANTABILITY or
>         + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
>         Public License for
>         + * more details.
>         + *
>         + * You should have received a copy of the GNU General Public
>         License along with
>         + * this program.  If not, see <http://www.gnu.org/licenses/
>         <http://www.gnu.org/licenses/>>.
>         + */
>         +
>         +#include "qemu/osdep.h"
>         +#include "qapi/error.h"
>         +#include "qemu/log.h"
>         +#include "hw/sysbus.h"
>         +#include "sysemu/qtest.h"
>         +#include "target/riscv/cpu.h"
>         +#include "hw/qdev-properties.h"
>         +#include "hw/intc/riscv_clic.h"
>         +
>         +/*
>         + * The 2-bit trig WARL field specifies the trigger type and
>         polarity for each
>         + * interrupt input. Bit 1, trig[0], is defined as
>         "edge-triggered"
>         + * (0: level-triggered, 1: edge-triggered); while bit 2,
>         trig[1], is defined as
>         + * "negative-edge" (0: positive-edge, 1: negative-edge).
>         (Section 3.6)
>         + */
>         +
>         +static inline TRIG_TYPE
>         +riscv_clic_get_trigger_type(RISCVCLICState *clic, size_t
>         irq_offset)
>         +{
>         +    return (clic->clicintattr[irq_offset] >> 1) & 0x3;
>         +}
>         +
>         +static inline bool
>         +riscv_clic_is_edge_triggered(RISCVCLICState *clic, size_t
>         irq_offset)
>         +{
>         +    return (clic->clicintattr[irq_offset] >> 1) & 0x1;
>         +}
>         +
>         +static inline bool
>         +riscv_clic_is_shv_interrupt(RISCVCLICState *clic, size_t
>         irq_offset)
>         +{
>         +    return (clic->clicintattr[irq_offset] & 0x1) && clic->nvbits;
>         +}
>         +
>         +static uint8_t
>         +riscv_clic_get_interrupt_level(RISCVCLICState *clic, uint8_t
>         intctl)
>         +{
>         +    int nlbits = clic->nlbits;
>         +
>         +    uint8_t mask_il = ((1 << nlbits) - 1) << (8 - nlbits);
>         +    uint8_t mask_padding = (1 << (8 - nlbits)) - 1;
>         +    /* unused level bits are set to 1 */
>         +    return (intctl & mask_il) | mask_padding;
>         +}
>
>
>     According to spec:
>       if the nlbits > CLICINTCTLBITS, then the lower bits of the 8-bit
>       interrupt level are assumed to be all 1s.
>
>     That is, the valid nlbits should be: min(clic->nlbits,
>     CLICINTCTLBITS);
>     The cliccfg example in spec also shows that:
>
>     CLICINTCTLBITS  nlbits  clicintctl[i]  interrupt levels
>           0                       2         ........    255
>           1                       2         l.......    127,255
>           2                       2         ll......    63,127,191,255
>           3                       3         lll.....  
>      31,63,95,127,159,191,223,255
>           4                       1         lppp.... 127,255
>
>         +
>         +static uint8_t
>         +riscv_clic_get_interrupt_priority(RISCVCLICState *clic,
>         uint8_t intctl)
>         +{
>         +    int npbits = clic->clicintctlbits - clic->nlbits;
>         +    uint8_t mask_priority = ((1 << npbits) - 1) << (8 - npbits);
>         +    uint8_t mask_padding = (1 << (8 - npbits)) - 1;
>         +
>         +    if (npbits < 0) {
>         +        return UINT8_MAX;
>         +    }
>         +    /* unused priority bits are set to 1 */
>         +    return (intctl & mask_priority) | mask_padding;
>         +}
>         +
>         +static void
>         +riscv_clic_intcfg_decode(RISCVCLICState *clic, uint16_t intcfg,
>         +                         uint8_t *mode, uint8_t *level,
>         +                         uint8_t *priority)
>         +{
>         +    *mode = intcfg >> 8;
>         +    *level = riscv_clic_get_interrupt_level(clic, intcfg & 0xff);
>         +    *priority = riscv_clic_get_interrupt_priority(clic,
>         intcfg & 0xff);
>         +}
>         +
>         +/*
>         + * In a system with multiple harts, the M-mode CLIC regions
>         for all the harts
>         + * are placed contiguously in the memory space, followed by
>         the S-mode CLIC
>         + * regions for all harts. (Section 3.11)
>         + */
>
>
>     The above description is not true any more in the latest spec:
>       The CLIC specification does not dictate how CLIC memory-mapped
>     registers are
>       split between M/S/U regions as well as the layout of multiple
>     harts as this is generally
>       a platform issue and each platform needs to define a discovery
>     mechanism to determine
>       the memory map locations.
>
>
> Comparing to 20210217 spec, the original description you wrote is correct.
> But it's sad that the latest change is still in v0.9-draft, no version 
> is bumped.
>
> Minor:
> I think most of the description in comments may need to be updated
> if you want to update to the latest v0.9-draft spec.
> Do you have any plans to follow the latest changes?

Yes, maybe this week or next.

Thanks,
Zhiwei

>
> Regards,
> Frank Chang
>
>
>     But I think we can just keep the current design for now anyway, as
>     it's also one of legal memory layout.
>     Otherwise, the design would be more complicated I think.
>
>
>         +static size_t
>         +riscv_clic_get_irq_offset(RISCVCLICState *clic, int mode, int
>         hartid, int irq)
>         +{
>         +    size_t mode_offset = 0;
>         +    size_t unit = clic->num_harts * clic->num_sources;
>         +
>         +    switch (mode) {
>         +    case PRV_M:
>         +        mode_offset = 0;
>         +        break;
>         +    case PRV_S:
>         +        mode_offset = unit;
>         +        break;
>         +    case PRV_U:
>         +        mode_offset = clic->prv_s ? 2 * unit : unit;
>         +        break;
>         +    default:
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid mode %d\n", mode);
>         +        exit(1);
>         +    }
>         +    return mode_offset + hartid * clic->num_sources + irq;
>         +}
>         +
>         +static void riscv_clic_next_interrupt(void *opaque, int hartid)
>         +{
>         +    /*
>         +     * Scan active list for highest priority pending interrupts
>         +     * comparing against this harts mintstatus register and
>         interrupt
>         +     * the core if we have a higher priority interrupt to deliver
>         +     */
>         +    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(hartid));
>         +    CPURISCVState *env = &cpu->env;
>         +    RISCVCLICState *clic = (RISCVCLICState *)opaque;
>         +
>         +    int il[4] = {
>         +        MAX(get_field(env->mintstatus, MINTSTATUS_UIL),
>         +            clic->mintthresh), /* PRV_U */
>         +        MAX(get_field(env->mintstatus, MINTSTATUS_SIL),
>         +            clic->sintthresh), /* PRV_S */
>         +        0,                     /* reserverd */
>         +        MAX(get_field(env->mintstatus, MINTSTATUS_MIL),
>         +            clic->uintthresh)  /* PRV_M */
>         +    };
>         +
>         +    /* Get sorted list of enabled interrupts for this hart */
>         +    size_t hart_offset = hartid * clic->num_sources;
>         +    CLICActiveInterrupt *active =
>         &clic->active_list[hart_offset];
>         +    size_t active_count = clic->active_count[hartid];
>         +    uint8_t mode, level, priority;
>         +
>         +    /* Loop through the enabled interrupts sorted by
>         mode+priority+level */
>         +    while (active_count) {
>         +        size_t irq_offset;
>         +        riscv_clic_intcfg_decode(clic, active->intcfg, &mode,
>         &level,
>         +                                 &priority);
>         +        if (mode < env->priv || (mode == env->priv && level
>         <= il[mode])) {
>         +            /*
>         +             * No pending interrupts with high enough
>         mode+priority+level
>         +             * break and clear pending interrupt for this hart
>         +             */
>         +            break;
>         +        }
>         +        irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, active->irq);
>         +        /* Check pending interrupt with high enough
>         mode+priority+level */
>         +        if (clic->clicintip[irq_offset]) {
>         +            /* Clean vector edge-triggered pending */
>         +            if (riscv_clic_is_edge_triggered(clic, irq_offset) &&
>         +                riscv_clic_is_shv_interrupt(clic, irq_offset)) {
>         +                clic->clicintip[irq_offset] = 0;
>         +            }
>         +            /* Post pending interrupt for this hart */
>         +            clic->exccode[hartid] = active->irq | mode << 12
>         | level << 14;
>         +            qemu_set_irq(clic->cpu_irqs[hartid], 1);
>         +            return;
>         +        }
>         +        /* Check next enabled interrupt */
>         +        active_count--;
>         +        active++;
>         +    }
>         +}
>         +
>         +/*
>         + * Any interrupt i that is not accessible to S-mode or U-Mode
>         + * appears as hard-wired zeros in clicintip[i], clicintie[i],
>         + * clicintattr[i], and clicintctl[i].(Section 3.9)(Section 3.10)
>         + */
>         +static bool
>         +riscv_clic_check_visible(RISCVCLICState *clic, int mode, int
>         hartid, int irq)
>         +{
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    if (!clic->prv_s && !clic->prv_u) { /* M */
>         +        return mode == PRV_M;
>         +    } else if (!clic->prv_s) { /* M/U */
>         +        switch (clic->nmbits) {
>         +        case 0:
>         +            return mode == PRV_M;
>         +        case 1:
>         +            return clic->clicintattr[irq_offset] & 0x80 ?
>         (mode == PRV_M) :
>         +     (mode == PRV_U);
>         +        default:
>         +            qemu_log_mask(LOG_GUEST_ERROR,
>         +                "clic: nmbits can only be 0 or 1 for M/U hart");
>         +            exit(1);
>         +        }
>         +    } else { /* M/S/U */
>         +        switch (clic->nmbits) {
>         +        case 0:
>         +            return mode == PRV_M;
>         +        case 1:
>         +            return clic->clicintattr[irq_offset] & 0x80 ?
>         (mode == PRV_M) :
>         +     (mode == PRV_S);
>         +        case 2:
>         +            return mode == clic->clicintattr[irq_offset];
>         +        case 3:
>         +            qemu_log_mask(LOG_GUEST_ERROR,
>         +                "clic: nmbits can only be 0 or 1 or 2 for
>         M/S/U hart");
>         +            exit(1);
>         +        }
>         +    }
>         +    return false;
>         +}
>         +
>         +/*
>         + * For level-triggered interrupts, software writes to pending
>         bits are
>         + * ignored completely. (Section 3.4)
>         + */
>         +static bool
>         +riscv_clic_validate_intip(RISCVCLICState *clic, int mode, int
>         hartid, int irq)
>         +{
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    return riscv_clic_is_edge_triggered(clic, irq_offset);
>         +}
>         +
>         +static void
>         +riscv_clic_update_intip(RISCVCLICState *clic, int mode, int
>         hartid,
>         +                        int irq, uint64_t value)
>         +{
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    clic->clicintip[irq_offset] = !!value;
>         +    riscv_clic_next_interrupt(clic, hartid);
>         +}
>         +
>         +/*
>         + * For security purpose, the field can only be set to a privilege
>         + * level that is equal mode to or lower than the currently
>         running
>         + * privilege level.(Section 3.6)
>         + */
>         +
>         +static bool riscv_clic_validate_intattr(RISCVCLICState *clic,
>         uint64_t value)
>         +{
>         +    int mode = extract64(value, 6, 2);
>         +
>         +    if (!qtest_enabled()) {
>         +        CPURISCVState *env = current_cpu->env_ptr;
>         +        if (env->priv < mode) {
>         +            return false;
>         +        }
>         +    }
>         +    return true;
>         +}
>         +
>         +static inline int riscv_clic_encode_priority(const
>         CLICActiveInterrupt *i)
>         +{
>         +    return ((i->intcfg & 0x3ff) << 12) | /* Highest
>         mode+level+priority */
>         +           (i->irq & 0xfff);             /* Highest irq number */
>         +}
>         +
>         +static int riscv_clic_active_compare(const void *a, const
>         void *b)
>         +{
>         +    return riscv_clic_encode_priority(b) -
>         riscv_clic_encode_priority(a);
>         +}
>         +
>         +static void
>         +riscv_clic_update_intie(RISCVCLICState *clic, int mode, int
>         hartid,
>         +                        int irq, uint64_t new_intie)
>         +{
>         +    size_t hart_offset = hartid * clic->num_sources;
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    CLICActiveInterrupt *active_list =
>         &clic->active_list[hart_offset];
>         +    size_t *active_count = &clic->active_count[hartid];
>         +
>         +    uint8_t old_intie = clic->clicintie[irq_offset];
>         +    clic->clicintie[irq_offset] = !!new_intie;
>         +
>         +    /* Add to or remove from list of active interrupts */
>         +    if (new_intie && !old_intie) {
>         +        active_list[*active_count].intcfg = (mode << 8) |
>         + clic->clicintctl[irq_offset];
>         +        active_list[*active_count].irq = irq;
>         +        (*active_count)++;
>         +    } else if (!new_intie && old_intie) {
>         +        CLICActiveInterrupt key = {
>         +            (mode << 8) | clic->clicintctl[irq_offset], irq
>         +        };
>         +        CLICActiveInterrupt *result = bsearch(&key,
>         + active_list, *active_count,
>         + sizeof(CLICActiveInterrupt),
>         + riscv_clic_active_compare);
>         +        size_t elem = (result - active_list) /
>         sizeof(CLICActiveInterrupt);
>
>
>     I think what you are trying to do here is to get the number of
>     elements
>     right after the active interrupt to be deleted in order to
>     calculate the size of
>     active interrupts to be memmoved.
>
>     However, according to C spec:
>       When two pointers are subtracted, both shall point to elements
>     of the same array object,
>       or one past the last element of the array object; the result is
>     the difference of the
>       subscripts of the two array elements.
>
>     So I think: (result - active_list) is already the number of
>     elements you want.
>     You don't have to divide it with sizeof(CLICActiveInterrupt) again.
>
>         +        size_t sz = (--(*active_count) - elem) *
>         sizeof(CLICActiveInterrupt);
>         +        assert(result);
>
>
>     Nit: assert(result) can be moved above size_t elem statement.
>
>         +        memmove(&result[0], &result[1], sz);
>         +    }
>         +
>         +    /* Sort list of active interrupts */
>         +    qsort(active_list, *active_count,
>         +          sizeof(CLICActiveInterrupt),
>         +          riscv_clic_active_compare);
>         +
>         +    riscv_clic_next_interrupt(clic, hartid);
>         +}
>         +
>         +static void
>         +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr addr,
>         +                      uint64_t value, unsigned size,
>         +                      int mode, int hartid, int irq)
>         +{
>         +    int req = extract32(addr, 0, 2);
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +
>         +    if (hartid >= clic->num_harts) {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid hartid %u: 0x%"
>         HWADDR_PRIx "\n",
>         +                      hartid, addr);
>         +        return;
>         +    }
>         +
>         +    if (irq >= clic->num_sources) {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx
>         "\n", irq, addr);
>         +        return;
>         +    }
>         +
>         +    switch (req) {
>
>
>     Spec. says that it's legal to write 32-bit value to set
>     {clicintctl[i], clicintattr[i], clicintie[i] ,clicintip[i]} at the
>     same time:
>       A 32-bit write to {clicintctl,clicintattr,clicintie,clicintip}
>     is legal.
>       However, there is no specified order in which the effects of
>       the individual byte updates take effect.
>
>         +    case 0: /* clicintip[i] */
>         +        if (riscv_clic_validate_intip(clic, mode, hartid, irq)) {
>         +            /*
>         +             * The actual pending bit is located at bit 0
>         (i.e., the
>         +             * leastsignificant bit). In case future
>         extensions expand the bit
>
>
>     Typo: leastsignificant => least significant
>
>         +             * field, from FW perspective clicintip[i]=zero
>         means no interrupt
>         +             * pending, and clicintip[i]!=0 (not just 1)
>         indicates an
>         +             * interrupt is pending. (Section 3.4)
>         +             */
>         +            if (value != clic->clicintip[irq_offset]) {
>         +                riscv_clic_update_intip(clic, mode, hartid,
>         irq, value);
>         +            }
>         +        }
>         +        break;
>         +    case 1: /* clicintie[i] */
>         +        if (clic->clicintie[irq_offset] != value) {
>         +            riscv_clic_update_intie(clic, mode, hartid, irq,
>         value);
>         +        }
>         +        break;
>         +    case 2: /* clicintattr[i] */
>         +        if (riscv_clic_validate_intattr(clic, value)) {
>         +            if (clic->clicintattr[irq_offset] != value) {
>         +                /* When nmbits=2, check WARL */
>         +                bool invalid = (clic->nmbits == 2) &&
>         +                               (extract64(value, 6, 2) == 0b10);
>         +                if (invalid) {
>         +                    uint8_t old_mode =
>         extract32(clic->clicintattr[irq_offset],
>         +                                                 6, 2);
>         +                    value = deposit32(value, 6, 2, old_mode);
>         +                }
>         +                clic->clicintattr[irq_offset] = value;
>         +                riscv_clic_next_interrupt(clic, hartid);
>         +            }
>         +        }
>         +        break;
>         +    case 3: /* clicintctl[i] */
>         +        if (value != clic->clicintctl[irq_offset]) {
>         +            clic->clicintctl[irq_offset] = value;
>
>
>     If irq i is already in the active_list, when will its intcfg been
>     synced?
>
>         +            riscv_clic_next_interrupt(clic, hartid);
>         +        }
>         +        break;
>         +    }
>         +}
>         +
>         +static uint64_t
>         +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr addr, int mode,
>         +                     int hartid, int irq)
>         +{
>         +    int req = extract32(addr, 0, 2);
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +
>         +    if (hartid >= clic->num_harts) {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid hartid %u: 0x%"
>         HWADDR_PRIx "\n",
>         +                      hartid, addr);
>         +        return 0;
>         +    }
>         +
>         +    if (irq >= clic->num_sources) {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid irq %u: 0x%" HWADDR_PRIx
>         "\n", irq, addr);
>         +        return 0;
>         +    }
>         +
>         +    switch (req) {
>         +    case 0: /* clicintip[i] */
>         +        return clic->clicintip[irq_offset];
>         +    case 1: /* clicintie[i] */
>         +        return clic->clicintie[irq_offset];
>         +    case 2: /* clicintattr[i] */
>         +        /*
>         +         * clicintattr register layout
>         +         * Bits Field
>         +         * 7:6 mode
>         +         * 5:3 reserved (WPRI 0)
>         +         * 2:1 trig
>         +         * 0 shv
>         +         */
>         +        return clic->clicintattr[irq_offset] & ~0x38;
>         +    case 3: /* clicintctrl */
>
>
>     Typo: clicintctl
>
>         +        /*
>         +         * The implemented bits are kept left-justified in
>         the most-significant
>         +         * bits of each 8-bit clicintctl[i] register, with
>         the lower
>         +         * unimplemented bits treated as hardwired to
>         1.(Section 3.7)
>         +         */
>         +        return clic->clicintctl[irq_offset] |
>         +               ((1 << (8 - clic->clicintctlbits)) - 1);
>         +    }
>         +
>         +    return 0;
>         +}
>         +
>         +/* Return target interrupt mode */
>         +static int riscv_clic_get_mode(RISCVCLICState *clic, hwaddr addr)
>         +{
>         +    int mode = addr / (4 * clic->num_harts * clic->num_sources);
>         +    switch (mode) {
>         +    case 0:
>         +        return PRV_M;
>         +    case 1:
>         +        assert(clic->prv_s || clic->prv_u);
>         +        return clic->prv_s ? PRV_S : PRV_U;
>         +    case 2:
>         +        assert(clic->prv_s && clic->prv_u);
>         +        return PRV_U;
>         +    default:
>         +        g_assert_not_reached();
>         +        break;
>         +    }
>         +}
>         +
>         +/* Return target hart id */
>         +static int riscv_clic_get_hartid(RISCVCLICState *clic, hwaddr
>         addr)
>         +{
>         +    int mode_unit = 4 * clic->num_harts * clic->num_sources;
>         +    int hart_unit = 4 * clic->num_sources;
>         +
>         +    return (addr % mode_unit) / hart_unit;
>         +}
>         +
>         +/* Return target interrupt number */
>         +static int riscv_clic_get_irq(RISCVCLICState *clic, hwaddr addr)
>         +{
>         +    int hart_unit = 4 * clic->num_sources;
>         +    return (addr % hart_unit) / 4;
>         +}
>         +
>         +static void
>         +riscv_clic_write(void *opaque, hwaddr addr, uint64_t value,
>         unsigned size)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    hwaddr clic_size = clic->clic_size;
>         +    int hartid, mode, irq;
>         +
>         +    if (addr < clic_size) {
>
>
>     Is this necessary?
>     I think memory region size already limits the request address to
>     be within the range of clic_size.
>
>         +        if (addr < 0x1000) {
>         +            assert(addr % 4 == 0);
>         +            int index = addr / 4;
>         +            switch (index) {
>         +            case 0: /* cliccfg */
>         +                {
>         +                    uint8_t nlbits = extract32(value, 1, 4);
>         +                    uint8_t nmbits = extract32(value, 5, 2);
>         +
>         +                    /*
>         +                     * The 4-bit cliccfg.nlbits WARL field.
>         +                     * Valid values are 0—8.
>         +                     */
>         +                    if (nlbits <= 8) {
>         +                        clic->nlbits = nlbits;
>         +                    }
>         +                    /* Valid values are given by implemented
>         priviledges */
>         +                    if (clic->prv_s && clic->prv_u) {
>         +                        if (nmbits <= 2) {
>         +                            clic->nmbits = nmbits;
>         +                        }
>         +                    } else if (clic->prv_u) {
>         +                        if (nmbits <= 1) {
>         +                            clic->nmbits = nmbits;
>         +                        }
>         +                    } else {
>         +                        assert(!clic->prv_s);
>         +                        if (nmbits == 0) {
>         +                            clic->nmbits = 0;
>         +                        }
>         +                    }
>         +                    clic->nvbits = extract32(value, 0, 1);
>         +                    break;
>         +                }
>         +            case 1: /* clicinfo, read-only register */
>         +                qemu_log_mask(LOG_GUEST_ERROR,
>         +                              "clic: write read-only
>         clicinfo.\n");
>         +                break;
>         +            case 0x10 ... 0x2F: /* clicinttrig */
>         +                {
>         +                    uint32_t interrupt_number = value &
>         MAKE_64BIT_MASK(0, 13);
>         +                    if (interrupt_number <= clic->num_sources) {
>         +                        value &= ~MAKE_64BIT_MASK(13, 18);
>         +                        clic->clicinttrig[index - 0x10] = value;
>         +                    }
>         +                    break;
>         +                }
>         +            case 2: /* mintthresh */
>         +                if (!strcmp(clic->version, "v0.8")) {
>         +                    clic->mintthresh = value;
>         +                    break;
>         +                }
>         +                qemu_log_mask(LOG_GUEST_ERROR,
>         +                              "clic: invalid write addr: 0x%"
>         HWADDR_PRIx "\n",
>         +                              addr);
>         +                break;
>         +            default:
>         +                qemu_log_mask(LOG_GUEST_ERROR,
>         +                              "clic: invalid write addr: 0x%"
>         HWADDR_PRIx "\n",
>         +                              addr);
>         +                return;
>         +            }
>         +        } else {
>         +            addr -= 0x1000;
>         +            hartid = riscv_clic_get_hartid(clic, addr);
>         +            mode = riscv_clic_get_mode(clic, addr);
>         +            irq = riscv_clic_get_irq(clic, addr);
>         +
>         +            if (riscv_clic_check_visible(clic, mode, hartid,
>         irq)) {
>         +                riscv_clic_hart_write(clic, addr, value,
>         size, mode,
>         +                                      hartid, irq);
>         +            }
>         +        }
>         +    } else {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid write: 0x%" HWADDR_PRIx
>         "\n", addr);
>         +    }
>         +}
>         +
>         +static uint64_t riscv_clic_read(void *opaque, hwaddr addr,
>         unsigned size)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    hwaddr clic_size = clic->clic_size;
>         +    int hartid, mode, irq;
>         +
>         +    if (addr < clic_size) {
>
>
>     Same to riscv_clic_write().
>
>     Thanks,
>     Frank Chang
>
>         +        if (addr < 0x1000) {
>         +            assert(addr % 4 == 0);
>         +            int index = addr / 4;
>         +            switch (index) {
>         +            case 0: /* cliccfg */
>         +                return clic->nvbits |
>         +                       (clic->nlbits << 1) |
>         +                       (clic->nmbits << 5);
>         +            case 1: /* clicinfo */
>         +                /*
>         +                 * clicinfo register layout
>         +                 *
>         +                 * Bits Field
>         +                 * 31 reserved (WARL 0)
>         +                 * 30:25 num_trigger
>         +                 * 24:21 CLICINTCTLBITS
>         +                 * 20:13 version (for version control)
>         +                 * 12:0 num_interrupt
>         +                 */
>         +                return clic->clicinfo & ~INT32_MAX;
>
>
>     clic->clicinfo should represent the CLIC setting information.
>     I think it's better to add clic reset function or
>     in riscv_clic_realize() to initialize clic->clicinfo.
>
>         +            case 0x10 ... 0x2F: /* clicinttrig */
>         +                /*
>         +                 * clicinttrig register layout
>         +                 *
>         +                 * Bits Field
>         +                 * 31 enable
>         +                 * 30:13 reserved (WARL 0)
>         +                 * 12:0 interrupt_number
>         +                 */
>         +                return clic->clicinttrig[index - 0x10] &
>         +                       ~MAKE_64BIT_MASK(13, 18);
>         +            case 2: /* mintthresh */
>         +                if (!strcmp(clic->version, "v0.8")) {
>         +                    return clic->mintthresh;
>         +                    break;
>         +                }
>         +                qemu_log_mask(LOG_GUEST_ERROR,
>         +                              "clic: invalid read : 0x%"
>         HWADDR_PRIx "\n",
>         +                              addr);
>         +                break;
>         +            default:
>         +                qemu_log_mask(LOG_GUEST_ERROR,
>         +                              "clic: invalid read : 0x%"
>         HWADDR_PRIx "\n",
>         +                              addr);
>         +                break;
>         +            }
>         +        } else {
>         +            addr -= 0x1000;
>         +            hartid = riscv_clic_get_hartid(clic, addr);
>         +            mode = riscv_clic_get_mode(clic, addr);
>         +            irq = riscv_clic_get_irq(clic, addr);
>         +
>         +            if (riscv_clic_check_visible(clic, mode, hartid,
>         irq)) {
>         +                return riscv_clic_hart_read(clic, addr, mode,
>         hartid, irq);
>         +            }
>         +        }
>         +    } else {
>         +        qemu_log_mask(LOG_GUEST_ERROR,
>         +                      "clic: invalid read: 0x%" HWADDR_PRIx
>         "\n", addr);
>         +    }
>         +    return 0;
>         +}
>         +
>         +static void riscv_clic_set_irq(void *opaque, int id, int level)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    int irq, hartid, mode;
>         +    hwaddr addr = 4 * id;
>         +    TRIG_TYPE type;
>         +
>         +    hartid = riscv_clic_get_hartid(clic, addr);
>         +    mode = riscv_clic_get_mode(clic, addr);
>         +    irq = riscv_clic_get_irq(clic, addr);
>         +    type = riscv_clic_get_trigger_type(clic, id);
>         +
>         +    /*
>         +     * In general, the edge-triggered interrupt state should
>         be kept in pending
>         +     * bit, while the level-triggered interrupt should be
>         kept in the level
>         +     * state of the incoming wire.
>         +     *
>         +     * For CLIC, model the level-triggered interrupt by
>         read-only pending bit.
>         +     */
>         +    if (level) {
>         +        switch (type) {
>         +        case POSITIVE_LEVEL:
>         +        case POSITIVE_EDGE:
>         +            riscv_clic_update_intip(clic, mode, hartid, irq,
>         level);
>         +            break;
>         +        case NEG_LEVEL:
>         +            riscv_clic_update_intip(clic, mode, hartid, irq,
>         !level);
>         +            break;
>         +        case NEG_EDGE:
>         +            break;
>         +        }
>         +    } else {
>         +        switch (type) {
>         +        case POSITIVE_LEVEL:
>         +            riscv_clic_update_intip(clic, mode, hartid, irq,
>         level);
>         +            break;
>         +        case POSITIVE_EDGE:
>         +            break;
>         +        case NEG_LEVEL:
>         +        case NEG_EDGE:
>         +            riscv_clic_update_intip(clic, mode, hartid, irq,
>         !level);
>         +            break;
>         +        }
>         +    }
>         +}
>         +
>         +static void riscv_clic_cpu_irq_handler(void *opaque, int irq,
>         int level)
>         +{
>         +    CPURISCVState *env = (CPURISCVState *)opaque;
>         +    RISCVCLICState *clic = env->clic;
>         +    CPUState *cpu = env_cpu(env);
>         +
>         +    if (level) {
>         +        env->exccode = clic->exccode[cpu->cpu_index];
>         +        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_CLIC);
>         +    }
>         +}
>         +
>         +static const MemoryRegionOps riscv_clic_ops = {
>         +    .read = riscv_clic_read,
>         +    .write = riscv_clic_write,
>         +    .endianness = DEVICE_LITTLE_ENDIAN,
>         +    .valid = {
>         +        .min_access_size = 1,
>         +        .max_access_size = 8
>         +    }
>         +};
>         +
>         +static void riscv_clic_realize(DeviceState *dev, Error **errp)
>         +{
>         +    RISCVCLICState *clic = RISCV_CLIC(dev);
>         +    size_t harts_x_sources = clic->num_harts * clic->num_sources;
>         +    int irqs, i;
>         +
>         +    if (clic->prv_s && clic->prv_u) {
>         +        irqs = 3 * harts_x_sources;
>         +    } else if (clic->prv_s || clic->prv_u) {
>         +        irqs = 2 * harts_x_sources;
>         +    } else {
>         +        irqs = harts_x_sources;
>         +    }
>         +
>         +    clic->clic_size = irqs * 4 + 0x1000;
>         +    memory_region_init_io(&clic->mmio, OBJECT(dev),
>         &riscv_clic_ops, clic,
>         +                          TYPE_RISCV_CLIC, clic->clic_size);
>         +
>         +    clic->clicintip = g_new0(uint8_t, irqs);
>         +    clic->clicintie = g_new0(uint8_t, irqs);
>         +    clic->clicintattr = g_new0(uint8_t, irqs);
>         +    clic->clicintctl = g_new0(uint8_t, irqs);
>         +    clic->active_list = g_new0(CLICActiveInterrupt, irqs);
>
>
>     Should the size of clic->active_list be: harts_x_sources?
>
>         +    clic->active_count = g_new0(size_t, clic->num_harts);
>         +    clic->exccode = g_new0(uint32_t, clic->num_harts);
>         +    clic->cpu_irqs = g_new0(qemu_irq, clic->num_harts);
>         +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &clic->mmio);
>         +
>         +    /* Allocate irq through gpio, so that we can use qtest */
>         +    qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);
>         +    qdev_init_gpio_out(dev, clic->cpu_irqs, clic->num_harts);
>         +
>         +    for (i = 0; i < clic->num_harts; i++) {
>         +        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(i));
>         +        qemu_irq irq =
>         qemu_allocate_irq(riscv_clic_cpu_irq_handler,
>         +  &cpu->env, 1);
>         +        qdev_connect_gpio_out(dev, i, irq);
>         +        cpu->env.clic = clic;
>         +    }
>         +}
>         +
>         +static Property riscv_clic_properties[] = {
>         +    DEFINE_PROP_BOOL("prv-s", RISCVCLICState, prv_s, false),
>         +    DEFINE_PROP_BOOL("prv-u", RISCVCLICState, prv_u, false),
>         +    DEFINE_PROP_UINT32("num-harts", RISCVCLICState,
>         num_harts, 0),
>         +    DEFINE_PROP_UINT32("num-sources", RISCVCLICState,
>         num_sources, 0),
>         +    DEFINE_PROP_UINT32("clicintctlbits", RISCVCLICState,
>         clicintctlbits, 0),
>         +    DEFINE_PROP_UINT64("mclicbase", RISCVCLICState,
>         mclicbase, 0),
>         +    DEFINE_PROP_STRING("version", RISCVCLICState, version),
>         +    DEFINE_PROP_END_OF_LIST(),
>         +};
>         +
>         +static void riscv_clic_class_init(ObjectClass *klass, void *data)
>         +{
>         +    DeviceClass *dc = DEVICE_CLASS(klass);
>         +
>         +    dc->realize = riscv_clic_realize;
>         +    device_class_set_props(dc, riscv_clic_properties);
>         +}
>         +
>         +static const TypeInfo riscv_clic_info = {
>         +    .name          = TYPE_RISCV_CLIC,
>         +    .parent        = TYPE_SYS_BUS_DEVICE,
>         +    .instance_size = sizeof(RISCVCLICState),
>         +    .class_init    = riscv_clic_class_init,
>         +};
>         +
>         +static void riscv_clic_register_types(void)
>         +{
>         +    type_register_static(&riscv_clic_info);
>         +}
>         +
>         +type_init(riscv_clic_register_types)
>         +
>         +/*
>         + * riscv_clic_create:
>         + *
>         + * @addr: base address of M-Mode CLIC memory-mapped registers
>         + * @prv_s: have smode region
>         + * @prv_u: have umode region
>         + * @num_harts: number of CPU harts
>         + * @num_sources: number of interrupts supporting by each aperture
>         + * @clicintctlbits: bits are actually implemented in the
>         clicintctl registers
>         + * @version: clic version, such as "v0.9"
>         + *
>         + * Returns: the device object
>         + */
>         +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool
>         prv_u,
>         +                               uint32_t num_harts, uint32_t
>         num_sources,
>         +                               uint8_t clicintctlbits,
>         +                               const char *version)
>         +{
>         +    DeviceState *dev = qdev_new(TYPE_RISCV_CLIC);
>         +
>         +    assert(num_sources <= 4096);
>         +    assert(num_harts <= 1024);
>         +    assert(clicintctlbits <= 8);
>         +    assert(!strcmp(version, "v0.8") || !strcmp(version, "v0.9"));
>         +
>         +    qdev_prop_set_bit(dev, "prv-s", prv_s);
>         +    qdev_prop_set_bit(dev, "prv-u", prv_u);
>         +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
>         +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
>         +    qdev_prop_set_uint32(dev, "clicintctlbits", clicintctlbits);
>         +    qdev_prop_set_uint64(dev, "mclicbase", addr);
>         +    qdev_prop_set_string(dev, "version", version);
>         +
>         +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>         +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>         +    return dev;
>         +}
>         +
>         +void riscv_clic_get_next_interrupt(void *opaque, int hartid)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    riscv_clic_next_interrupt(clic, hartid);
>         +}
>         +
>         +bool riscv_clic_shv_interrupt(void *opaque, int mode, int
>         hartid, int irq)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    return riscv_clic_is_shv_interrupt(clic, irq_offset);
>         +}
>         +
>         +bool riscv_clic_edge_triggered(void *opaque, int mode, int
>         hartid, int irq)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    return riscv_clic_is_edge_triggered(clic, irq_offset);
>         +}
>         +
>         +void riscv_clic_clean_pending(void *opaque, int mode, int
>         hartid, int irq)
>         +{
>         +    RISCVCLICState *clic = opaque;
>         +    size_t irq_offset = riscv_clic_get_irq_offset(clic, mode,
>         hartid, irq);
>         +    clic->clicintip[irq_offset] = 0;
>         +}
>         +
>         +/*
>         + * The new CLIC interrupt-handling mode is encoded as a new
>         state in
>         + * the existing WARL xtvec register, where the low two bits
>         of  are 11.
>         + */
>         +bool riscv_clic_is_clic_mode(CPURISCVState *env)
>         +{
>         +    target_ulong xtvec = (env->priv == PRV_M) ? env->mtvec :
>         env->stvec;
>         +    return env->clic && ((xtvec & 0x3) == 3);
>         +}
>         +
>         +void riscv_clic_decode_exccode(uint32_t exccode, int *mode,
>         +                               int *il, int *irq)
>         +{
>         +    *irq = extract32(exccode, 0, 12);
>         +    *mode = extract32(exccode, 12, 2);
>         +    *il = extract32(exccode, 14, 8);
>         +}
>         diff --git a/include/hw/intc/riscv_clic.h
>         b/include/hw/intc/riscv_clic.h
>         new file mode 100644
>         index 0000000000..e5f89672a6
>         --- /dev/null
>         +++ b/include/hw/intc/riscv_clic.h
>         @@ -0,0 +1,103 @@
>         +/*
>         + * RISC-V CLIC(Core Local Interrupt Controller) interface.
>         + *
>         + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All
>         rights reserved.
>         + *
>         + * This program is free software; you can redistribute it
>         and/or modify it
>         + * under the terms and conditions of the GNU General Public
>         License,
>         + * version 2 or later, as published by the Free Software
>         Foundation.
>         + *
>         + * This program is distributed in the hope it will be useful,
>         but WITHOUT
>         + * ANY WARRANTY; without even the implied warranty of
>         MERCHANTABILITY or
>         + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
>         Public License for
>         + * more details.
>         + *
>         + * You should have received a copy of the GNU General Public
>         License along with
>         + * this program.  If not, see <http://www.gnu.org/licenses/
>         <http://www.gnu.org/licenses/>>.
>         + */
>         +
>         +#ifndef RISCV_CLIC_H
>         +#define RISCV_CLIC_H
>         +
>         +#include "hw/irq.h"
>         +#include "hw/sysbus.h"
>         +
>         +#define TYPE_RISCV_CLIC "riscv_clic"
>         +#define RISCV_CLIC(obj) \
>         +    OBJECT_CHECK(RISCVCLICState, (obj), TYPE_RISCV_CLIC)
>         +
>         +/*
>         + * CLIC per hart active interrupts
>         + *
>         + * We maintain per hart lists of enabled interrupts sorted by
>         + * mode+level+priority. The sorting is done on the
>         configuration path
>         + * so that the interrupt delivery fastpath can linear scan
>         enabled
>         + * interrupts in priority order.
>         + */
>         +typedef struct CLICActiveInterrupt {
>         +    uint16_t intcfg;
>         +    uint16_t irq;
>         +} CLICActiveInterrupt;
>         +
>         +typedef enum TRIG_TYPE {
>         +    POSITIVE_LEVEL,
>         +    POSITIVE_EDGE,
>         +    NEG_LEVEL,
>         +    NEG_EDGE,
>         +} TRIG_TYPE;
>         +
>         +typedef struct RISCVCLICState {
>         +    /*< private >*/
>         +    SysBusDevice parent_obj;
>         +
>         +    /*< public >*/
>         +
>         +    /* Implementaion parameters */
>         +    bool prv_s;
>         +    bool prv_u;
>         +    uint32_t num_harts;
>         +    uint32_t num_sources;
>         +    uint32_t clic_size;
>         +    uint32_t clic_mmode_base;
>         +    uint32_t clicintctlbits;
>         +    uint64_t mclicbase;
>         +    char *version;
>         +
>         +    /* Global configuration */
>         +    uint8_t nmbits;
>         +    uint8_t nlbits;
>         +    uint8_t nvbits;
>         +    uint32_t clicinfo;
>         +    uint32_t clicinttrig[32];
>         +
>         +    /* Aperture configuration */
>         +    uint8_t *clicintip;
>         +    uint8_t *clicintie;
>         +    uint8_t *clicintattr;
>         +    uint8_t *clicintctl;
>         +
>         +    /* Complatible with v0.8 */
>         +    uint32_t mintthresh;
>         +    uint32_t sintthresh;
>         +    uint32_t uintthresh;
>         +
>         +    /* QEMU implementaion related fields */
>         +    uint32_t *exccode;
>         +    CLICActiveInterrupt *active_list;
>         +    size_t *active_count;
>         +    MemoryRegion mmio;
>         +    qemu_irq *cpu_irqs;
>         +} RISCVCLICState;
>         +
>         +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool
>         prv_u,
>         +                               uint32_t num_harts, uint32_t
>         num_sources,
>         +                               uint8_t clicintctlbits,
>         +                               const char *version);
>         +
>         +void riscv_clic_decode_exccode(uint32_t exccode, int *mode,
>         int *il, int *irq);
>         +void riscv_clic_clean_pending(void *opaque, int mode, int
>         hartid, int irq);
>         +bool riscv_clic_edge_triggered(void *opaque, int mode, int
>         hartid, int irq);
>         +bool riscv_clic_shv_interrupt(void *opaque, int mode, int
>         hartid, int irq);
>         +void riscv_clic_get_next_interrupt(void *opaque, int hartid);
>         +bool riscv_clic_is_clic_mode(CPURISCVState *env);
>         +#endif
>         diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>         index a5eab26a69..9e389d7bbf 100644
>         --- a/target/riscv/cpu.h
>         +++ b/target/riscv/cpu.h
>         @@ -33,6 +33,7 @@
>          #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>          #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
>          #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>         +#define CPU_INTERRUPT_CLIC CPU_INTERRUPT_TGT_EXT_0
>
>          #define TYPE_RISCV_CPU_ANY RISCV_CPU_TYPE_NAME("any")
>          #define TYPE_RISCV_CPU_BASE32  RISCV_CPU_TYPE_NAME("rv32")
>         @@ -247,6 +248,7 @@ struct CPURISCVState {
>              /* Fields from here on are preserved across CPU reset. */
>              QEMUTimer *timer; /* Internal timer */
>              void *clic;       /* clic interrupt controller */
>         +    uint32_t exccode; /* clic irq encode */
>          };
>
>          OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
>         -- 
>         2.25.1
>
>

--------------6A70CDA918DBB859CEF8A6B5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/26 下午11:26, Frank Chang
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D2WdE56pgJe1z8iLzw2ao4huSs-K3F-1SJbfXzJWt+jdQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Frank Chang &lt;<a
            href="mailto:frank.chang@sifive.com" moz-do-not-send="true">frank.chang@sifive.com</a>&gt;
          於 2021年6月26日 週六 下午11:03寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">LIU Zhiwei &lt;<a
                  href="mailto:zhiwei_liu@c-sky.com" target="_blank"
                  moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt; 於
                2021年4月9日 週五 下午3:57寫道：<br>
              </div>
              <div class="gmail_quote">
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">The Core-Local
                  Interrupt Controller (CLIC) provides low-latency,<br>
                  vectored, pre-emptive interrupts for RISC-V systems.<br>
                  <br>
                  The CLIC also supports a new Selective Hardware
                  Vectoring feature<br>
                  that allow users to optimize each interrupt for either
                  faster<br>
                  response or smaller code size.<br>
                  <br>
                  Signed-off-by: LIU Zhiwei &lt;<a
                    href="mailto:zhiwei_liu@c-sky.com" target="_blank"
                    moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
                  ---<br>
                   default-configs/devices/riscv32-softmmu.mak |   1 +<br>
                   default-configs/devices/riscv64-softmmu.mak |   1 +<br>
                   hw/intc/Kconfig                             |   3 +<br>
                   hw/intc/meson.build                         |   1 +<br>
                   hw/intc/riscv_clic.c                        | 835
                  ++++++++++++++++++++<br>
                   include/hw/intc/riscv_clic.h                | 103 +++<br>
                   target/riscv/cpu.h                          |   2 +<br>
                   7 files changed, 946 insertions(+)<br>
                   create mode 100644 hw/intc/riscv_clic.c<br>
                   create mode 100644 include/hw/intc/riscv_clic.h<br>
                  <br>
                  diff --git
                  a/default-configs/devices/riscv32-softmmu.mak
                  b/default-configs/devices/riscv32-softmmu.mak<br>
                  index d847bd5692..1430c30588 100644<br>
                  --- a/default-configs/devices/riscv32-softmmu.mak<br>
                  +++ b/default-configs/devices/riscv32-softmmu.mak<br>
                  @@ -5,6 +5,7 @@<br>
                   #CONFIG_PCI_DEVICES=n<br>
                   CONFIG_SEMIHOSTING=y<br>
                   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y<br>
                  +CONFIG_RISCV_CLIC=y<br>
                  <br>
                   # Boards:<br>
                   #<br>
                  diff --git
                  a/default-configs/devices/riscv64-softmmu.mak
                  b/default-configs/devices/riscv64-softmmu.mak<br>
                  index d5eec75f05..396800bbbd 100644<br>
                  --- a/default-configs/devices/riscv64-softmmu.mak<br>
                  +++ b/default-configs/devices/riscv64-softmmu.mak<br>
                  @@ -5,6 +5,7 @@<br>
                   #CONFIG_PCI_DEVICES=n<br>
                   CONFIG_SEMIHOSTING=y<br>
                   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y<br>
                  +CONFIG_RISCV_CLIC=y<br>
                  <br>
                   # Boards:<br>
                   #<br>
                  diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
                  index f4694088a4..5bf492b48f 100644<br>
                  --- a/hw/intc/Kconfig<br>
                  +++ b/hw/intc/Kconfig<br>
                  @@ -68,6 +68,9 @@ config SIFIVE_CLINT<br>
                   config SIFIVE_PLIC<br>
                       bool<br>
                  <br>
                  +config RISCV_CLIC<br>
                  +    bool<br>
                  +<br>
                   config GOLDFISH_PIC<br>
                       bool<br>
                  <br>
                  diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
                  index 1c299039f6..2aa71b6738 100644<br>
                  --- a/hw/intc/meson.build<br>
                  +++ b/hw/intc/meson.build<br>
                  @@ -50,6 +50,7 @@ specific_ss.add(when:
                  'CONFIG_S390_FLIC_KVM', if_true:
                  files('s390_flic_kvm.c'))<br>
                   specific_ss.add(when: 'CONFIG_SH_INTC', if_true:
                  files('sh_intc.c'))<br>
                   specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true:
                  files('sifive_clint.c'))<br>
                   specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
                  files('sifive_plic.c'))<br>
                  +specific_ss.add(when: 'CONFIG_RISCV_CLIC', if_true:
                  files('riscv_clic.c'))<br>
                   specific_ss.add(when: 'CONFIG_XICS', if_true:
                  files('xics.c'))<br>
                   specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],<br>
                                  if_true: files('xics_kvm.c'))<br>
                  diff --git a/hw/intc/riscv_clic.c
                  b/hw/intc/riscv_clic.c<br>
                  new file mode 100644<br>
                  index 0000000000..8ad534c506<br>
                  --- /dev/null<br>
                  +++ b/hw/intc/riscv_clic.c<br>
                  @@ -0,0 +1,835 @@<br>
                  +/*<br>
                  + * RISC-V CLIC(Core Local Interrupt Controller) for
                  QEMU.<br>
                  + *<br>
                  + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd.
                  All rights reserved.<br>
                  + *<br>
                  + * This program is free software; you can
                  redistribute it and/or modify it<br>
                  + * under the terms and conditions of the GNU General
                  Public License,<br>
                  + * version 2 or later, as published by the Free
                  Software Foundation.<br>
                  + *<br>
                  + * This program is distributed in the hope it will be
                  useful, but WITHOUT<br>
                  + * ANY WARRANTY; without even the implied warranty of
                  MERCHANTABILITY or<br>
                  + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                  General Public License for<br>
                  + * more details.<br>
                  + *<br>
                  + * You should have received a copy of the GNU General
                  Public License along with<br>
                  + * this program.  If not, see &lt;<a
                    href="http://www.gnu.org/licenses/" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">http://www.gnu.org/licenses/</a>&gt;.<br>
                  + */<br>
                  +<br>
                  +#include "qemu/osdep.h"<br>
                  +#include "qapi/error.h"<br>
                  +#include "qemu/log.h"<br>
                  +#include "hw/sysbus.h"<br>
                  +#include "sysemu/qtest.h"<br>
                  +#include "target/riscv/cpu.h"<br>
                  +#include "hw/qdev-properties.h"<br>
                  +#include "hw/intc/riscv_clic.h"<br>
                  +<br>
                  +/*<br>
                  + * The 2-bit trig WARL field specifies the trigger
                  type and polarity for each<br>
                  + * interrupt input. Bit 1, trig[0], is defined as
                  "edge-triggered"<br>
                  + * (0: level-triggered, 1: edge-triggered); while bit
                  2, trig[1], is defined as<br>
                  + * "negative-edge" (0: positive-edge, 1:
                  negative-edge). (Section 3.6)<br>
                  + */<br>
                  +<br>
                  +static inline TRIG_TYPE<br>
                  +riscv_clic_get_trigger_type(RISCVCLICState *clic,
                  size_t irq_offset)<br>
                  +{<br>
                  +    return (clic-&gt;clicintattr[irq_offset] &gt;&gt;
                  1) &amp; 0x3;<br>
                  +}<br>
                  +<br>
                  +static inline bool<br>
                  +riscv_clic_is_edge_triggered(RISCVCLICState *clic,
                  size_t irq_offset)<br>
                  +{<br>
                  +    return (clic-&gt;clicintattr[irq_offset] &gt;&gt;
                  1) &amp; 0x1;<br>
                  +}<br>
                  +<br>
                  +static inline bool<br>
                  +riscv_clic_is_shv_interrupt(RISCVCLICState *clic,
                  size_t irq_offset)<br>
                  +{<br>
                  +    return (clic-&gt;clicintattr[irq_offset] &amp;
                  0x1) &amp;&amp; clic-&gt;nvbits;<br>
                  +}<br>
                  +<br>
                  +static uint8_t<br>
                  +riscv_clic_get_interrupt_level(RISCVCLICState *clic,
                  uint8_t intctl)<br>
                  +{<br>
                  +    int nlbits = clic-&gt;nlbits;<br>
                  +<br>
                  +    uint8_t mask_il = ((1 &lt;&lt; nlbits) - 1)
                  &lt;&lt; (8 - nlbits);<br>
                  +    uint8_t mask_padding = (1 &lt;&lt; (8 - nlbits))
                  - 1;<br>
                  +    /* unused level bits are set to 1 */<br>
                  +    return (intctl &amp; mask_il) | mask_padding;<br>
                  +}<br>
                </blockquote>
                <div><br>
                </div>
                <div>According to spec:</div>
                <div>  if the nlbits &gt; CLICINTCTLBITS, then the lower
                  bits of the 8-bit</div>
                <div>  interrupt level are assumed to be all 1s.<br>
                </div>
                <div><br>
                </div>
                <div>That is, the valid nlbits should be:
                  min(clic-&gt;nlbits, CLICINTCTLBITS);</div>
                <div>The cliccfg example in spec also shows that:</div>
                <div><br>
                </div>
                <div>CLICINTCTLBITS  nlbits  clicintctl[i]  interrupt
                  levels<br>
                        0                       2         ........     
                     255<br>
                        1                       2         l.......     
                     127,255<br>
                        2                       2         ll......     
                     63,127,191,255<br>
                        3                       3         lll.....     
                     31,63,95,127,159,191,223,255<br>
                        4                       1         lppp....     
                  127,255<br>
                </div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +<br>
                  +static uint8_t<br>
                  +riscv_clic_get_interrupt_priority(RISCVCLICState
                  *clic, uint8_t intctl)<br>
                  +{<br>
                  +    int npbits = clic-&gt;clicintctlbits -
                  clic-&gt;nlbits;<br>
                  +    uint8_t mask_priority = ((1 &lt;&lt; npbits) - 1)
                  &lt;&lt; (8 - npbits);<br>
                  +    uint8_t mask_padding = (1 &lt;&lt; (8 - npbits))
                  - 1;<br>
                  +<br>
                  +    if (npbits &lt; 0) {<br>
                  +        return UINT8_MAX;<br>
                  +    }<br>
                  +    /* unused priority bits are set to 1 */<br>
                  +    return (intctl &amp; mask_priority) |
                  mask_padding;<br>
                  +}<br>
                  +<br>
                  +static void<br>
                  +riscv_clic_intcfg_decode(RISCVCLICState *clic,
                  uint16_t intcfg,<br>
                  +                         uint8_t *mode, uint8_t
                  *level,<br>
                  +                         uint8_t *priority)<br>
                  +{<br>
                  +    *mode = intcfg &gt;&gt; 8;<br>
                  +    *level = riscv_clic_get_interrupt_level(clic,
                  intcfg &amp; 0xff);<br>
                  +    *priority =
                  riscv_clic_get_interrupt_priority(clic, intcfg &amp;
                  0xff);<br>
                  +}<br>
                  +<br>
                  +/*<br>
                  + * In a system with multiple harts, the M-mode CLIC
                  regions for all the harts<br>
                  + * are placed contiguously in the memory space,
                  followed by the S-mode CLIC<br>
                  + * regions for all harts. (Section 3.11)<br>
                  + */<br>
                </blockquote>
                <div><br>
                </div>
                <div>The above description is not true any more in the
                  latest spec:</div>
                <div>  The CLIC specification does not dictate how CLIC
                  memory-mapped registers are</div>
                <div>  split between M/S/U regions as well as the layout
                  of multiple harts as this is generally</div>
                <div>  a platform issue and each platform needs to
                  define a discovery mechanism to determine</div>
                <div>  the memory map locations.<br>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Comparing to 20210217 spec, the original description you
            wrote is correct.<br>
          </div>
          <div>But it's sad that the latest change is still in
            v0.9-draft, no version is bumped.</div>
          <div><br>
          </div>
          <div>Minor:</div>
          <div>I think most of the description in comments may need to
            be updated</div>
          <div>if you want to update to the latest v0.9-draft spec.</div>
          <div>Do you have any plans to follow the latest changes?</div>
        </div>
      </div>
    </blockquote>
    <p>Yes, maybe this week or next.</p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D2WdE56pgJe1z8iLzw2ao4huSs-K3F-1SJbfXzJWt+jdQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Regards,</div>
          <div>Frank Chang</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div class="gmail_quote">
                <div><br>
                </div>
                <div>But I think we can just keep the current design for
                  now anyway, as it's also one of legal memory layout.</div>
                <div>Otherwise, the design would be more complicated I
                  think.</div>
              </div>
            </div>
          </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div class="gmail_quote">
                <div><br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +static size_t<br>
                  +riscv_clic_get_irq_offset(RISCVCLICState *clic, int
                  mode, int hartid, int irq)<br>
                  +{<br>
                  +    size_t mode_offset = 0;<br>
                  +    size_t unit = clic-&gt;num_harts *
                  clic-&gt;num_sources;<br>
                  +<br>
                  +    switch (mode) {<br>
                  +    case PRV_M:<br>
                  +        mode_offset = 0;<br>
                  +        break;<br>
                  +    case PRV_S:<br>
                  +        mode_offset = unit;<br>
                  +        break;<br>
                  +    case PRV_U:<br>
                  +        mode_offset = clic-&gt;prv_s ? 2 * unit :
                  unit;<br>
                  +        break;<br>
                  +    default:<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid mode %d\n",
                  mode);<br>
                  +        exit(1);<br>
                  +    }<br>
                  +    return mode_offset + hartid *
                  clic-&gt;num_sources + irq;<br>
                  +}<br>
                  +<br>
                  +static void riscv_clic_next_interrupt(void *opaque,
                  int hartid)<br>
                  +{<br>
                  +    /*<br>
                  +     * Scan active list for highest priority pending
                  interrupts<br>
                  +     * comparing against this harts mintstatus
                  register and interrupt<br>
                  +     * the core if we have a higher priority
                  interrupt to deliver<br>
                  +     */<br>
                  +    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(hartid));<br>
                  +    CPURISCVState *env = &amp;cpu-&gt;env;<br>
                  +    RISCVCLICState *clic = (RISCVCLICState *)opaque;<br>
                  +<br>
                  +    int il[4] = {<br>
                  +        MAX(get_field(env-&gt;mintstatus,
                  MINTSTATUS_UIL),<br>
                  +            clic-&gt;mintthresh), /* PRV_U */<br>
                  +        MAX(get_field(env-&gt;mintstatus,
                  MINTSTATUS_SIL),<br>
                  +            clic-&gt;sintthresh), /* PRV_S */<br>
                  +        0,                     /* reserverd */<br>
                  +        MAX(get_field(env-&gt;mintstatus,
                  MINTSTATUS_MIL),<br>
                  +            clic-&gt;uintthresh)  /* PRV_M */<br>
                  +    };<br>
                  +<br>
                  +    /* Get sorted list of enabled interrupts for this
                  hart */<br>
                  +    size_t hart_offset = hartid *
                  clic-&gt;num_sources;<br>
                  +    CLICActiveInterrupt *active =
                  &amp;clic-&gt;active_list[hart_offset];<br>
                  +    size_t active_count =
                  clic-&gt;active_count[hartid];<br>
                  +    uint8_t mode, level, priority;<br>
                  +<br>
                  +    /* Loop through the enabled interrupts sorted by
                  mode+priority+level */<br>
                  +    while (active_count) {<br>
                  +        size_t irq_offset;<br>
                  +        riscv_clic_intcfg_decode(clic,
                  active-&gt;intcfg, &amp;mode, &amp;level,<br>
                  +                                 &amp;priority);<br>
                  +        if (mode &lt; env-&gt;priv || (mode ==
                  env-&gt;priv &amp;&amp; level &lt;= il[mode])) {<br>
                  +            /*<br>
                  +             * No pending interrupts with high enough
                  mode+priority+level<br>
                  +             * break and clear pending interrupt for
                  this hart<br>
                  +             */<br>
                  +            break;<br>
                  +        }<br>
                  +        irq_offset = riscv_clic_get_irq_offset(clic,
                  mode, hartid, active-&gt;irq);<br>
                  +        /* Check pending interrupt with high enough
                  mode+priority+level */<br>
                  +        if (clic-&gt;clicintip[irq_offset]) {<br>
                  +            /* Clean vector edge-triggered pending */<br>
                  +            if (riscv_clic_is_edge_triggered(clic,
                  irq_offset) &amp;&amp;<br>
                  +                riscv_clic_is_shv_interrupt(clic,
                  irq_offset)) {<br>
                  +                clic-&gt;clicintip[irq_offset] = 0;<br>
                  +            }<br>
                  +            /* Post pending interrupt for this hart
                  */<br>
                  +            clic-&gt;exccode[hartid] = active-&gt;irq
                  | mode &lt;&lt; 12 | level &lt;&lt; 14;<br>
                  +            qemu_set_irq(clic-&gt;cpu_irqs[hartid],
                  1);<br>
                  +            return;<br>
                  +        }<br>
                  +        /* Check next enabled interrupt */<br>
                  +        active_count--;<br>
                  +        active++;<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +/*<br>
                  + * Any interrupt i that is not accessible to S-mode
                  or U-Mode<br>
                  + * appears as hard-wired zeros in clicintip[i],
                  clicintie[i],<br>
                  + * clicintattr[i], and clicintctl[i].(Section
                  3.9)(Section 3.10)<br>
                  + */<br>
                  +static bool<br>
                  +riscv_clic_check_visible(RISCVCLICState *clic, int
                  mode, int hartid, int irq)<br>
                  +{<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    if (!clic-&gt;prv_s &amp;&amp; !clic-&gt;prv_u) {
                  /* M */<br>
                  +        return mode == PRV_M;<br>
                  +    } else if (!clic-&gt;prv_s) { /* M/U */<br>
                  +        switch (clic-&gt;nmbits) {<br>
                  +        case 0:<br>
                  +            return mode == PRV_M;<br>
                  +        case 1:<br>
                  +            return clic-&gt;clicintattr[irq_offset]
                  &amp; 0x80 ? (mode == PRV_M) :<br>
                  +                                                     
                      (mode == PRV_U);<br>
                  +        default:<br>
                  +            qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                "clic: nmbits can only be 0 or 1 for
                  M/U hart");<br>
                  +            exit(1);<br>
                  +        }<br>
                  +    } else { /* M/S/U */<br>
                  +        switch (clic-&gt;nmbits) {<br>
                  +        case 0:<br>
                  +            return mode == PRV_M;<br>
                  +        case 1:<br>
                  +            return clic-&gt;clicintattr[irq_offset]
                  &amp; 0x80 ? (mode == PRV_M) :<br>
                  +                                                     
                      (mode == PRV_S);<br>
                  +        case 2:<br>
                  +            return mode ==
                  clic-&gt;clicintattr[irq_offset];<br>
                  +        case 3:<br>
                  +            qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                "clic: nmbits can only be 0 or 1 or 2
                  for M/S/U hart");<br>
                  +            exit(1);<br>
                  +        }<br>
                  +    }<br>
                  +    return false;<br>
                  +}<br>
                  +<br>
                  +/*<br>
                  + * For level-triggered interrupts, software writes to
                  pending bits are<br>
                  + * ignored completely. (Section 3.4)<br>
                  + */<br>
                  +static bool<br>
                  +riscv_clic_validate_intip(RISCVCLICState *clic, int
                  mode, int hartid, int irq)<br>
                  +{<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    return riscv_clic_is_edge_triggered(clic,
                  irq_offset);<br>
                  +}<br>
                  +<br>
                  +static void<br>
                  +riscv_clic_update_intip(RISCVCLICState *clic, int
                  mode, int hartid,<br>
                  +                        int irq, uint64_t value)<br>
                  +{<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    clic-&gt;clicintip[irq_offset] = !!value;<br>
                  +    riscv_clic_next_interrupt(clic, hartid);<br>
                  +}<br>
                  +<br>
                  +/*<br>
                  + * For security purpose, the field can only be set to
                  a privilege<br>
                  + * level that is equal mode to or lower than the
                  currently running<br>
                  + * privilege level.(Section 3.6)<br>
                  + */<br>
                  +<br>
                  +static bool
                  riscv_clic_validate_intattr(RISCVCLICState *clic,
                  uint64_t value)<br>
                  +{<br>
                  +    int mode = extract64(value, 6, 2);<br>
                  +<br>
                  +    if (!qtest_enabled()) {<br>
                  +        CPURISCVState *env = current_cpu-&gt;env_ptr;<br>
                  +        if (env-&gt;priv &lt; mode) {<br>
                  +            return false;<br>
                  +        }<br>
                  +    }<br>
                  +    return true;<br>
                  +}<br>
                  +<br>
                  +static inline int riscv_clic_encode_priority(const
                  CLICActiveInterrupt *i)<br>
                  +{<br>
                  +    return ((i-&gt;intcfg &amp; 0x3ff) &lt;&lt; 12) |
                  /* Highest mode+level+priority */<br>
                  +           (i-&gt;irq &amp; 0xfff);             /*
                  Highest irq number */<br>
                  +}<br>
                  +<br>
                  +static int riscv_clic_active_compare(const void *a,
                  const void *b)<br>
                  +{<br>
                  +    return riscv_clic_encode_priority(b) -
                  riscv_clic_encode_priority(a);<br>
                  +}<br>
                  +<br>
                  +static void<br>
                  +riscv_clic_update_intie(RISCVCLICState *clic, int
                  mode, int hartid,<br>
                  +                        int irq, uint64_t new_intie)<br>
                  +{<br>
                  +    size_t hart_offset = hartid *
                  clic-&gt;num_sources;<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    CLICActiveInterrupt *active_list =
                  &amp;clic-&gt;active_list[hart_offset];<br>
                  +    size_t *active_count =
                  &amp;clic-&gt;active_count[hartid];<br>
                  +<br>
                  +    uint8_t old_intie =
                  clic-&gt;clicintie[irq_offset];<br>
                  +    clic-&gt;clicintie[irq_offset] = !!new_intie;<br>
                  +<br>
                  +    /* Add to or remove from list of active
                  interrupts */<br>
                  +    if (new_intie &amp;&amp; !old_intie) {<br>
                  +        active_list[*active_count].intcfg = (mode
                  &lt;&lt; 8) |<br>
                  +                                           
                  clic-&gt;clicintctl[irq_offset];<br>
                  +        active_list[*active_count].irq = irq;<br>
                  +        (*active_count)++;<br>
                  +    } else if (!new_intie &amp;&amp; old_intie) {<br>
                  +        CLICActiveInterrupt key = {<br>
                  +            (mode &lt;&lt; 8) |
                  clic-&gt;clicintctl[irq_offset], irq<br>
                  +        };<br>
                  +        CLICActiveInterrupt *result =
                  bsearch(&amp;key,<br>
                  +                                             
                  active_list, *active_count,<br>
                  +                                             
                  sizeof(CLICActiveInterrupt),<br>
                  +                                             
                  riscv_clic_active_compare);<br>
                  +        size_t elem = (result - active_list) /
                  sizeof(CLICActiveInterrupt);<br>
                </blockquote>
                <div><br>
                </div>
                <div>I think what you are trying to do here is to get
                  the number of elements</div>
                <div>right after the active interrupt to be deleted in
                  order to calculate the size of</div>
                <div>active interrupts to be memmoved.</div>
                <div><br>
                </div>
                <div>However, according to C spec:</div>
                <div>  When two pointers are subtracted, both shall
                  point to elements of the same array object,</div>
                  or one past the last element of the array object; the
                result is the difference of the<br>
                  subscripts of the two array elements.</div>
              <div class="gmail_quote"><br>
              </div>
              <div class="gmail_quote">So I think: (result -
                active_list) is already the number of elements you want.</div>
              <div class="gmail_quote">You don't have to divide it with
                sizeof(CLICActiveInterrupt) again.<br>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +        size_t sz = (--(*active_count) - elem) *
                  sizeof(CLICActiveInterrupt);<br>
                  +        assert(result);<br>
                </blockquote>
                <div><br>
                </div>
                <div>Nit: assert(result) can be moved above size_t elem
                  statement.</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +        memmove(&amp;result[0], &amp;result[1], sz);<br>
                  +    }<br>
                  +<br>
                  +    /* Sort list of active interrupts */<br>
                  +    qsort(active_list, *active_count,<br>
                  +          sizeof(CLICActiveInterrupt),<br>
                  +          riscv_clic_active_compare);<br>
                  +<br>
                  +    riscv_clic_next_interrupt(clic, hartid);<br>
                  +}<br>
                  +<br>
                  +static void<br>
                  +riscv_clic_hart_write(RISCVCLICState *clic, hwaddr
                  addr,<br>
                  +                      uint64_t value, unsigned size,<br>
                  +                      int mode, int hartid, int irq)<br>
                  +{<br>
                  +    int req = extract32(addr, 0, 2);<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +<br>
                  +    if (hartid &gt;= clic-&gt;num_harts) {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid hartid %u: 0x%"
                  HWADDR_PRIx "\n",<br>
                  +                      hartid, addr);<br>
                  +        return;<br>
                  +    }<br>
                  +<br>
                  +    if (irq &gt;= clic-&gt;num_sources) {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid irq %u: 0x%"
                  HWADDR_PRIx "\n", irq, addr);<br>
                  +        return;<br>
                  +    }<br>
                  +<br>
                  +    switch (req) {<br>
                </blockquote>
                <div><br>
                </div>
                <div>Spec. says that it's legal to write 32-bit value to
                  set<br>
                </div>
                <div>{clicintctl[i], clicintattr[i], clicintie[i]
                  ,clicintip[i]} at the same time:<br>
                </div>
                <div>  A 32-bit write to
                  {clicintctl,clicintattr,clicintie,clicintip} is legal.<br>
                </div>
                <div>  However, there is no specified order in which the
                  effects of</div>
                <div>  the individual byte updates take effect.</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +    case 0: /* clicintip[i] */<br>
                  +        if (riscv_clic_validate_intip(clic, mode,
                  hartid, irq)) {<br>
                  +            /*<br>
                  +             * The actual pending bit is located at
                  bit 0 (i.e., the<br>
                  +             * leastsignificant bit). In case future
                  extensions expand the bit<br>
                </blockquote>
                <div><br>
                </div>
                <div>Typo: leastsignificant =&gt; least significant</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +             * field, from FW perspective
                  clicintip[i]=zero means no interrupt<br>
                  +             * pending, and clicintip[i]!=0 (not just
                  1) indicates an<br>
                  +             * interrupt is pending. (Section 3.4)<br>
                  +             */<br>
                  +            if (value !=
                  clic-&gt;clicintip[irq_offset]) {<br>
                  +                riscv_clic_update_intip(clic, mode,
                  hartid, irq, value);<br>
                  +            }<br>
                  +        }<br>
                  +        break;<br>
                  +    case 1: /* clicintie[i] */<br>
                  +        if (clic-&gt;clicintie[irq_offset] != value)
                  {<br>
                  +            riscv_clic_update_intie(clic, mode,
                  hartid, irq, value);<br>
                  +        }<br>
                  +        break;<br>
                  +    case 2: /* clicintattr[i] */<br>
                  +        if (riscv_clic_validate_intattr(clic, value))
                  {<br>
                  +            if (clic-&gt;clicintattr[irq_offset] !=
                  value) {<br>
                  +                /* When nmbits=2, check WARL */<br>
                  +                bool invalid = (clic-&gt;nmbits == 2)
                  &amp;&amp;<br>
                  +                               (extract64(value, 6,
                  2) == 0b10);<br>
                  +                if (invalid) {<br>
                  +                    uint8_t old_mode =
                  extract32(clic-&gt;clicintattr[irq_offset],<br>
                  +                                                 6,
                  2);<br>
                  +                    value = deposit32(value, 6, 2,
                  old_mode);<br>
                  +                }<br>
                  +                clic-&gt;clicintattr[irq_offset] =
                  value;<br>
                  +                riscv_clic_next_interrupt(clic,
                  hartid);<br>
                  +            }<br>
                  +        }<br>
                  +        break;<br>
                  +    case 3: /* clicintctl[i] */<br>
                  +        if (value != clic-&gt;clicintctl[irq_offset])
                  {<br>
                  +            clic-&gt;clicintctl[irq_offset] = value;<br>
                </blockquote>
                <div><br>
                </div>
                <div>If irq i is already in the active_list, when will
                  its intcfg been synced?<br>
                </div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +            riscv_clic_next_interrupt(clic, hartid);<br>
                  +        }<br>
                  +        break;<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +static uint64_t<br>
                  +riscv_clic_hart_read(RISCVCLICState *clic, hwaddr
                  addr, int mode,<br>
                  +                     int hartid, int irq)<br>
                  +{<br>
                  +    int req = extract32(addr, 0, 2);<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +<br>
                  +    if (hartid &gt;= clic-&gt;num_harts) {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid hartid %u: 0x%"
                  HWADDR_PRIx "\n",<br>
                  +                      hartid, addr);<br>
                  +        return 0;<br>
                  +    }<br>
                  +<br>
                  +    if (irq &gt;= clic-&gt;num_sources) {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid irq %u: 0x%"
                  HWADDR_PRIx "\n", irq, addr);<br>
                  +        return 0;<br>
                  +    }<br>
                  +<br>
                  +    switch (req) {<br>
                  +    case 0: /* clicintip[i] */<br>
                  +        return clic-&gt;clicintip[irq_offset];<br>
                  +    case 1: /* clicintie[i] */<br>
                  +        return clic-&gt;clicintie[irq_offset];<br>
                  +    case 2: /* clicintattr[i] */<br>
                  +        /*<br>
                  +         * clicintattr register layout<br>
                  +         * Bits Field<br>
                  +         * 7:6 mode<br>
                  +         * 5:3 reserved (WPRI 0)<br>
                  +         * 2:1 trig<br>
                  +         * 0 shv<br>
                  +         */<br>
                  +        return clic-&gt;clicintattr[irq_offset] &amp;
                  ~0x38;<br>
                  +    case 3: /* clicintctrl */<br>
                </blockquote>
                <div><br>
                </div>
                <div>Typo: clicintctl</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +        /*<br>
                  +         * The implemented bits are kept
                  left-justified in the most-significant<br>
                  +         * bits of each 8-bit clicintctl[i] register,
                  with the lower<br>
                  +         * unimplemented bits treated as hardwired to
                  1.(Section 3.7)<br>
                  +         */<br>
                  +        return clic-&gt;clicintctl[irq_offset] |<br>
                  +               ((1 &lt;&lt; (8 -
                  clic-&gt;clicintctlbits)) - 1);<br>
                  +    }<br>
                  +<br>
                  +    return 0;<br>
                  +}<br>
                  +<br>
                  +/* Return target interrupt mode */<br>
                  +static int riscv_clic_get_mode(RISCVCLICState *clic,
                  hwaddr addr)<br>
                  +{<br>
                  +    int mode = addr / (4 * clic-&gt;num_harts *
                  clic-&gt;num_sources);<br>
                  +    switch (mode) {<br>
                  +    case 0:<br>
                  +        return PRV_M;<br>
                  +    case 1:<br>
                  +        assert(clic-&gt;prv_s || clic-&gt;prv_u);<br>
                  +        return clic-&gt;prv_s ? PRV_S : PRV_U;<br>
                  +    case 2:<br>
                  +        assert(clic-&gt;prv_s &amp;&amp;
                  clic-&gt;prv_u);<br>
                  +        return PRV_U;<br>
                  +    default:<br>
                  +        g_assert_not_reached();<br>
                  +        break;<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +/* Return target hart id */<br>
                  +static int riscv_clic_get_hartid(RISCVCLICState
                  *clic, hwaddr addr)<br>
                  +{<br>
                  +    int mode_unit = 4 * clic-&gt;num_harts *
                  clic-&gt;num_sources;<br>
                  +    int hart_unit = 4 * clic-&gt;num_sources;<br>
                  +<br>
                  +    return (addr % mode_unit) / hart_unit;<br>
                  +}<br>
                  +<br>
                  +/* Return target interrupt number */<br>
                  +static int riscv_clic_get_irq(RISCVCLICState *clic,
                  hwaddr addr)<br>
                  +{<br>
                  +    int hart_unit = 4 * clic-&gt;num_sources;<br>
                  +    return (addr % hart_unit) / 4;<br>
                  +}<br>
                  +<br>
                  +static void<br>
                  +riscv_clic_write(void *opaque, hwaddr addr, uint64_t
                  value, unsigned size)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    hwaddr clic_size = clic-&gt;clic_size;<br>
                  +    int hartid, mode, irq;<br>
                  +<br>
                  +    if (addr &lt; clic_size) {<br>
                </blockquote>
                <div><br>
                </div>
                <div>Is this necessary?<br>
                </div>
                <div>I think memory region size already limits the
                  request address to be within the range of clic_size.</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +        if (addr &lt; 0x1000) {<br>
                  +            assert(addr % 4 == 0);<br>
                  +            int index = addr / 4;<br>
                  +            switch (index) {<br>
                  +            case 0: /* cliccfg */<br>
                  +                {<br>
                  +                    uint8_t nlbits = extract32(value,
                  1, 4);<br>
                  +                    uint8_t nmbits = extract32(value,
                  5, 2);<br>
                  +<br>
                  +                    /*<br>
                  +                     * The 4-bit cliccfg.nlbits WARL
                  field.<br>
                  +                     * Valid values are 0—8.<br>
                  +                     */<br>
                  +                    if (nlbits &lt;= 8) {<br>
                  +                        clic-&gt;nlbits = nlbits;<br>
                  +                    }<br>
                  +                    /* Valid values are given by
                  implemented priviledges */<br>
                  +                    if (clic-&gt;prv_s &amp;&amp;
                  clic-&gt;prv_u) {<br>
                  +                        if (nmbits &lt;= 2) {<br>
                  +                            clic-&gt;nmbits = nmbits;<br>
                  +                        }<br>
                  +                    } else if (clic-&gt;prv_u) {<br>
                  +                        if (nmbits &lt;= 1) {<br>
                  +                            clic-&gt;nmbits = nmbits;<br>
                  +                        }<br>
                  +                    } else {<br>
                  +                        assert(!clic-&gt;prv_s);<br>
                  +                        if (nmbits == 0) {<br>
                  +                            clic-&gt;nmbits = 0;<br>
                  +                        }<br>
                  +                    }<br>
                  +                    clic-&gt;nvbits =
                  extract32(value, 0, 1);<br>
                  +                    break;<br>
                  +                }<br>
                  +            case 1: /* clicinfo, read-only register
                  */<br>
                  +                qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                              "clic: write read-only
                  clicinfo.\n");<br>
                  +                break;<br>
                  +            case 0x10 ... 0x2F: /* clicinttrig */<br>
                  +                {<br>
                  +                    uint32_t interrupt_number = value
                  &amp; MAKE_64BIT_MASK(0, 13);<br>
                  +                    if (interrupt_number &lt;=
                  clic-&gt;num_sources) {<br>
                  +                        value &amp;=
                  ~MAKE_64BIT_MASK(13, 18);<br>
                  +                        clic-&gt;clicinttrig[index -
                  0x10] = value;<br>
                  +                    }<br>
                  +                    break;<br>
                  +                }<br>
                  +            case 2: /* mintthresh */<br>
                  +                if (!strcmp(clic-&gt;version,
                  "v0.8")) {<br>
                  +                    clic-&gt;mintthresh = value;<br>
                  +                    break;<br>
                  +                }<br>
                  +                qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                              "clic: invalid write
                  addr: 0x%" HWADDR_PRIx "\n",<br>
                  +                              addr);<br>
                  +                break;<br>
                  +            default:<br>
                  +                qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                              "clic: invalid write
                  addr: 0x%" HWADDR_PRIx "\n",<br>
                  +                              addr);<br>
                  +                return;<br>
                  +            }<br>
                  +        } else {<br>
                  +            addr -= 0x1000;<br>
                  +            hartid = riscv_clic_get_hartid(clic,
                  addr);<br>
                  +            mode = riscv_clic_get_mode(clic, addr);<br>
                  +            irq = riscv_clic_get_irq(clic, addr);<br>
                  +<br>
                  +            if (riscv_clic_check_visible(clic, mode,
                  hartid, irq)) {<br>
                  +                riscv_clic_hart_write(clic, addr,
                  value, size, mode,<br>
                  +                                      hartid, irq);<br>
                  +            }<br>
                  +        }<br>
                  +    } else {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid write: 0x%"
                  HWADDR_PRIx "\n", addr);<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +static uint64_t riscv_clic_read(void *opaque, hwaddr
                  addr, unsigned size)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    hwaddr clic_size = clic-&gt;clic_size;<br>
                  +    int hartid, mode, irq;<br>
                  +<br>
                  +    if (addr &lt; clic_size) {<br>
                </blockquote>
                <div><br>
                </div>
                <div>Same to riscv_clic_write().<br>
                </div>
                <div><br>
                </div>
                <div>Thanks,</div>
                <div>Frank Chang</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +        if (addr &lt; 0x1000) {<br>
                  +            assert(addr % 4 == 0);<br>
                  +            int index = addr / 4;<br>
                  +            switch (index) {<br>
                  +            case 0: /* cliccfg */<br>
                  +                return clic-&gt;nvbits |<br>
                  +                       (clic-&gt;nlbits &lt;&lt; 1) |<br>
                  +                       (clic-&gt;nmbits &lt;&lt; 5);<br>
                  +            case 1: /* clicinfo */<br>
                  +                /*<br>
                  +                 * clicinfo register layout<br>
                  +                 *<br>
                  +                 * Bits Field<br>
                  +                 * 31 reserved (WARL 0)<br>
                  +                 * 30:25 num_trigger<br>
                  +                 * 24:21 CLICINTCTLBITS<br>
                  +                 * 20:13 version (for version
                  control)<br>
                  +                 * 12:0 num_interrupt<br>
                  +                 */<br>
                  +                return clic-&gt;clicinfo &amp;
                  ~INT32_MAX;<br>
                </blockquote>
                <div><br>
                </div>
                <div>clic-&gt;clicinfo should represent the CLIC setting
                  information.</div>
                <div>I think it's better to add clic reset function or
                  in riscv_clic_realize() to initialize
                  clic-&gt;clicinfo.</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +            case 0x10 ... 0x2F: /* clicinttrig */<br>
                  +                /*<br>
                  +                 * clicinttrig register layout<br>
                  +                 *<br>
                  +                 * Bits Field<br>
                  +                 * 31 enable<br>
                  +                 * 30:13 reserved (WARL 0)<br>
                  +                 * 12:0 interrupt_number<br>
                  +                 */<br>
                  +                return clic-&gt;clicinttrig[index -
                  0x10] &amp;<br>
                  +                       ~MAKE_64BIT_MASK(13, 18);<br>
                  +            case 2: /* mintthresh */<br>
                  +                if (!strcmp(clic-&gt;version,
                  "v0.8")) {<br>
                  +                    return clic-&gt;mintthresh;<br>
                  +                    break;<br>
                  +                }<br>
                  +                qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                              "clic: invalid read :
                  0x%" HWADDR_PRIx "\n",<br>
                  +                              addr);<br>
                  +                break;<br>
                  +            default:<br>
                  +                qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                              "clic: invalid read :
                  0x%" HWADDR_PRIx "\n",<br>
                  +                              addr);<br>
                  +                break;<br>
                  +            }<br>
                  +        } else {<br>
                  +            addr -= 0x1000;<br>
                  +            hartid = riscv_clic_get_hartid(clic,
                  addr);<br>
                  +            mode = riscv_clic_get_mode(clic, addr);<br>
                  +            irq = riscv_clic_get_irq(clic, addr);<br>
                  +<br>
                  +            if (riscv_clic_check_visible(clic, mode,
                  hartid, irq)) {<br>
                  +                return riscv_clic_hart_read(clic,
                  addr, mode, hartid, irq);<br>
                  +            }<br>
                  +        }<br>
                  +    } else {<br>
                  +        qemu_log_mask(LOG_GUEST_ERROR,<br>
                  +                      "clic: invalid read: 0x%"
                  HWADDR_PRIx "\n", addr);<br>
                  +    }<br>
                  +    return 0;<br>
                  +}<br>
                  +<br>
                  +static void riscv_clic_set_irq(void *opaque, int id,
                  int level)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    int irq, hartid, mode;<br>
                  +    hwaddr addr = 4 * id;<br>
                  +    TRIG_TYPE type;<br>
                  +<br>
                  +    hartid = riscv_clic_get_hartid(clic, addr);<br>
                  +    mode = riscv_clic_get_mode(clic, addr);<br>
                  +    irq = riscv_clic_get_irq(clic, addr);<br>
                  +    type = riscv_clic_get_trigger_type(clic, id);<br>
                  +<br>
                  +    /*<br>
                  +     * In general, the edge-triggered interrupt state
                  should be kept in pending<br>
                  +     * bit, while the level-triggered interrupt
                  should be kept in the level<br>
                  +     * state of the incoming wire.<br>
                  +     *<br>
                  +     * For CLIC, model the level-triggered interrupt
                  by read-only pending bit.<br>
                  +     */<br>
                  +    if (level) {<br>
                  +        switch (type) {<br>
                  +        case POSITIVE_LEVEL:<br>
                  +        case POSITIVE_EDGE:<br>
                  +            riscv_clic_update_intip(clic, mode,
                  hartid, irq, level);<br>
                  +            break;<br>
                  +        case NEG_LEVEL:<br>
                  +            riscv_clic_update_intip(clic, mode,
                  hartid, irq, !level);<br>
                  +            break;<br>
                  +        case NEG_EDGE:<br>
                  +            break;<br>
                  +        }<br>
                  +    } else {<br>
                  +        switch (type) {<br>
                  +        case POSITIVE_LEVEL:<br>
                  +            riscv_clic_update_intip(clic, mode,
                  hartid, irq, level);<br>
                  +            break;<br>
                  +        case POSITIVE_EDGE:<br>
                  +            break;<br>
                  +        case NEG_LEVEL:<br>
                  +        case NEG_EDGE:<br>
                  +            riscv_clic_update_intip(clic, mode,
                  hartid, irq, !level);<br>
                  +            break;<br>
                  +        }<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +static void riscv_clic_cpu_irq_handler(void *opaque,
                  int irq, int level)<br>
                  +{<br>
                  +    CPURISCVState *env = (CPURISCVState *)opaque;<br>
                  +    RISCVCLICState *clic = env-&gt;clic;<br>
                  +    CPUState *cpu = env_cpu(env);<br>
                  +<br>
                  +    if (level) {<br>
                  +        env-&gt;exccode =
                  clic-&gt;exccode[cpu-&gt;cpu_index];<br>
                  +        cpu_interrupt(env_cpu(env),
                  CPU_INTERRUPT_CLIC);<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +static const MemoryRegionOps riscv_clic_ops = {<br>
                  +    .read = riscv_clic_read,<br>
                  +    .write = riscv_clic_write,<br>
                  +    .endianness = DEVICE_LITTLE_ENDIAN,<br>
                  +    .valid = {<br>
                  +        .min_access_size = 1,<br>
                  +        .max_access_size = 8<br>
                  +    }<br>
                  +};<br>
                  +<br>
                  +static void riscv_clic_realize(DeviceState *dev,
                  Error **errp)<br>
                  +{<br>
                  +    RISCVCLICState *clic = RISCV_CLIC(dev);<br>
                  +    size_t harts_x_sources = clic-&gt;num_harts *
                  clic-&gt;num_sources;<br>
                  +    int irqs, i;<br>
                  +<br>
                  +    if (clic-&gt;prv_s &amp;&amp; clic-&gt;prv_u) {<br>
                  +        irqs = 3 * harts_x_sources;<br>
                  +    } else if (clic-&gt;prv_s || clic-&gt;prv_u) {<br>
                  +        irqs = 2 * harts_x_sources;<br>
                  +    } else {<br>
                  +        irqs = harts_x_sources;<br>
                  +    }<br>
                  +<br>
                  +    clic-&gt;clic_size = irqs * 4 + 0x1000;<br>
                  +    memory_region_init_io(&amp;clic-&gt;mmio,
                  OBJECT(dev), &amp;riscv_clic_ops, clic,<br>
                  +                          TYPE_RISCV_CLIC,
                  clic-&gt;clic_size);<br>
                  +<br>
                  +    clic-&gt;clicintip = g_new0(uint8_t, irqs);<br>
                  +    clic-&gt;clicintie = g_new0(uint8_t, irqs);<br>
                  +    clic-&gt;clicintattr = g_new0(uint8_t, irqs);<br>
                  +    clic-&gt;clicintctl = g_new0(uint8_t, irqs);<br>
                  +    clic-&gt;active_list =
                  g_new0(CLICActiveInterrupt, irqs);<br>
                </blockquote>
                <div><br>
                </div>
                <div>Should the size of clic-&gt;active_list be:
                  harts_x_sources?</div>
                <div> </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  +    clic-&gt;active_count = g_new0(size_t,
                  clic-&gt;num_harts);<br>
                  +    clic-&gt;exccode = g_new0(uint32_t,
                  clic-&gt;num_harts);<br>
                  +    clic-&gt;cpu_irqs = g_new0(qemu_irq,
                  clic-&gt;num_harts);<br>
                  +    sysbus_init_mmio(SYS_BUS_DEVICE(dev),
                  &amp;clic-&gt;mmio);<br>
                  +<br>
                  +    /* Allocate irq through gpio, so that we can use
                  qtest */<br>
                  +    qdev_init_gpio_in(dev, riscv_clic_set_irq, irqs);<br>
                  +    qdev_init_gpio_out(dev, clic-&gt;cpu_irqs,
                  clic-&gt;num_harts);<br>
                  +<br>
                  +    for (i = 0; i &lt; clic-&gt;num_harts; i++) {<br>
                  +        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(i));<br>
                  +        qemu_irq irq =
                  qemu_allocate_irq(riscv_clic_cpu_irq_handler,<br>
                  +                                       
                   &amp;cpu-&gt;env, 1);<br>
                  +        qdev_connect_gpio_out(dev, i, irq);<br>
                  +        cpu-&gt;env.clic = clic;<br>
                  +    }<br>
                  +}<br>
                  +<br>
                  +static Property riscv_clic_properties[] = {<br>
                  +    DEFINE_PROP_BOOL("prv-s", RISCVCLICState, prv_s,
                  false),<br>
                  +    DEFINE_PROP_BOOL("prv-u", RISCVCLICState, prv_u,
                  false),<br>
                  +    DEFINE_PROP_UINT32("num-harts", RISCVCLICState,
                  num_harts, 0),<br>
                  +    DEFINE_PROP_UINT32("num-sources", RISCVCLICState,
                  num_sources, 0),<br>
                  +    DEFINE_PROP_UINT32("clicintctlbits",
                  RISCVCLICState, clicintctlbits, 0),<br>
                  +    DEFINE_PROP_UINT64("mclicbase", RISCVCLICState,
                  mclicbase, 0),<br>
                  +    DEFINE_PROP_STRING("version", RISCVCLICState,
                  version),<br>
                  +    DEFINE_PROP_END_OF_LIST(),<br>
                  +};<br>
                  +<br>
                  +static void riscv_clic_class_init(ObjectClass *klass,
                  void *data)<br>
                  +{<br>
                  +    DeviceClass *dc = DEVICE_CLASS(klass);<br>
                  +<br>
                  +    dc-&gt;realize = riscv_clic_realize;<br>
                  +    device_class_set_props(dc,
                  riscv_clic_properties);<br>
                  +}<br>
                  +<br>
                  +static const TypeInfo riscv_clic_info = {<br>
                  +    .name          = TYPE_RISCV_CLIC,<br>
                  +    .parent        = TYPE_SYS_BUS_DEVICE,<br>
                  +    .instance_size = sizeof(RISCVCLICState),<br>
                  +    .class_init    = riscv_clic_class_init,<br>
                  +};<br>
                  +<br>
                  +static void riscv_clic_register_types(void)<br>
                  +{<br>
                  +    type_register_static(&amp;riscv_clic_info);<br>
                  +}<br>
                  +<br>
                  +type_init(riscv_clic_register_types)<br>
                  +<br>
                  +/*<br>
                  + * riscv_clic_create:<br>
                  + *<br>
                  + * @addr: base address of M-Mode CLIC memory-mapped
                  registers<br>
                  + * @prv_s: have smode region<br>
                  + * @prv_u: have umode region<br>
                  + * @num_harts: number of CPU harts<br>
                  + * @num_sources: number of interrupts supporting by
                  each aperture<br>
                  + * @clicintctlbits: bits are actually implemented in
                  the clicintctl registers<br>
                  + * @version: clic version, such as "v0.9"<br>
                  + *<br>
                  + * Returns: the device object<br>
                  + */<br>
                  +DeviceState *riscv_clic_create(hwaddr addr, bool
                  prv_s, bool prv_u,<br>
                  +                               uint32_t num_harts,
                  uint32_t num_sources,<br>
                  +                               uint8_t
                  clicintctlbits,<br>
                  +                               const char *version)<br>
                  +{<br>
                  +    DeviceState *dev = qdev_new(TYPE_RISCV_CLIC);<br>
                  +<br>
                  +    assert(num_sources &lt;= 4096);<br>
                  +    assert(num_harts &lt;= 1024);<br>
                  +    assert(clicintctlbits &lt;= 8);<br>
                  +    assert(!strcmp(version, "v0.8") ||
                  !strcmp(version, "v0.9"));<br>
                  +<br>
                  +    qdev_prop_set_bit(dev, "prv-s", prv_s);<br>
                  +    qdev_prop_set_bit(dev, "prv-u", prv_u);<br>
                  +    qdev_prop_set_uint32(dev, "num-harts",
                  num_harts);<br>
                  +    qdev_prop_set_uint32(dev, "num-sources",
                  num_sources);<br>
                  +    qdev_prop_set_uint32(dev, "clicintctlbits",
                  clicintctlbits);<br>
                  +    qdev_prop_set_uint64(dev, "mclicbase", addr);<br>
                  +    qdev_prop_set_string(dev, "version", version);<br>
                  +<br>
                  +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev),
                  &amp;error_fatal);<br>
                  +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
                  +    return dev;<br>
                  +}<br>
                  +<br>
                  +void riscv_clic_get_next_interrupt(void *opaque, int
                  hartid)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    riscv_clic_next_interrupt(clic, hartid);<br>
                  +}<br>
                  +<br>
                  +bool riscv_clic_shv_interrupt(void *opaque, int mode,
                  int hartid, int irq)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    return riscv_clic_is_shv_interrupt(clic,
                  irq_offset);<br>
                  +}<br>
                  +<br>
                  +bool riscv_clic_edge_triggered(void *opaque, int
                  mode, int hartid, int irq)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    return riscv_clic_is_edge_triggered(clic,
                  irq_offset);<br>
                  +}<br>
                  +<br>
                  +void riscv_clic_clean_pending(void *opaque, int mode,
                  int hartid, int irq)<br>
                  +{<br>
                  +    RISCVCLICState *clic = opaque;<br>
                  +    size_t irq_offset =
                  riscv_clic_get_irq_offset(clic, mode, hartid, irq);<br>
                  +    clic-&gt;clicintip[irq_offset] = 0;<br>
                  +}<br>
                  +<br>
                  +/*<br>
                  + * The new CLIC interrupt-handling mode is encoded as
                  a new state in<br>
                  + * the existing WARL xtvec register, where the low
                  two bits of  are 11.<br>
                  + */<br>
                  +bool riscv_clic_is_clic_mode(CPURISCVState *env)<br>
                  +{<br>
                  +    target_ulong xtvec = (env-&gt;priv == PRV_M) ?
                  env-&gt;mtvec : env-&gt;stvec;<br>
                  +    return env-&gt;clic &amp;&amp; ((xtvec &amp; 0x3)
                  == 3);<br>
                  +}<br>
                  +<br>
                  +void riscv_clic_decode_exccode(uint32_t exccode, int
                  *mode,<br>
                  +                               int *il, int *irq)<br>
                  +{<br>
                  +    *irq = extract32(exccode, 0, 12);<br>
                  +    *mode = extract32(exccode, 12, 2);<br>
                  +    *il = extract32(exccode, 14, 8);<br>
                  +}<br>
                  diff --git a/include/hw/intc/riscv_clic.h
                  b/include/hw/intc/riscv_clic.h<br>
                  new file mode 100644<br>
                  index 0000000000..e5f89672a6<br>
                  --- /dev/null<br>
                  +++ b/include/hw/intc/riscv_clic.h<br>
                  @@ -0,0 +1,103 @@<br>
                  +/*<br>
                  + * RISC-V CLIC(Core Local Interrupt Controller)
                  interface.<br>
                  + *<br>
                  + * Copyright (c) 2021 T-Head Semiconductor Co., Ltd.
                  All rights reserved.<br>
                  + *<br>
                  + * This program is free software; you can
                  redistribute it and/or modify it<br>
                  + * under the terms and conditions of the GNU General
                  Public License,<br>
                  + * version 2 or later, as published by the Free
                  Software Foundation.<br>
                  + *<br>
                  + * This program is distributed in the hope it will be
                  useful, but WITHOUT<br>
                  + * ANY WARRANTY; without even the implied warranty of
                  MERCHANTABILITY or<br>
                  + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
                  General Public License for<br>
                  + * more details.<br>
                  + *<br>
                  + * You should have received a copy of the GNU General
                  Public License along with<br>
                  + * this program.  If not, see &lt;<a
                    href="http://www.gnu.org/licenses/" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">http://www.gnu.org/licenses/</a>&gt;.<br>
                  + */<br>
                  +<br>
                  +#ifndef RISCV_CLIC_H<br>
                  +#define RISCV_CLIC_H<br>
                  +<br>
                  +#include "hw/irq.h"<br>
                  +#include "hw/sysbus.h"<br>
                  +<br>
                  +#define TYPE_RISCV_CLIC "riscv_clic"<br>
                  +#define RISCV_CLIC(obj) \<br>
                  +    OBJECT_CHECK(RISCVCLICState, (obj),
                  TYPE_RISCV_CLIC)<br>
                  +<br>
                  +/*<br>
                  + * CLIC per hart active interrupts<br>
                  + *<br>
                  + * We maintain per hart lists of enabled interrupts
                  sorted by<br>
                  + * mode+level+priority. The sorting is done on the
                  configuration path<br>
                  + * so that the interrupt delivery fastpath can linear
                  scan enabled<br>
                  + * interrupts in priority order.<br>
                  + */<br>
                  +typedef struct CLICActiveInterrupt {<br>
                  +    uint16_t intcfg;<br>
                  +    uint16_t irq;<br>
                  +} CLICActiveInterrupt;<br>
                  +<br>
                  +typedef enum TRIG_TYPE {<br>
                  +    POSITIVE_LEVEL,<br>
                  +    POSITIVE_EDGE,<br>
                  +    NEG_LEVEL,<br>
                  +    NEG_EDGE,<br>
                  +} TRIG_TYPE;<br>
                  +<br>
                  +typedef struct RISCVCLICState {<br>
                  +    /*&lt; private &gt;*/<br>
                  +    SysBusDevice parent_obj;<br>
                  +<br>
                  +    /*&lt; public &gt;*/<br>
                  +<br>
                  +    /* Implementaion parameters */<br>
                  +    bool prv_s;<br>
                  +    bool prv_u;<br>
                  +    uint32_t num_harts;<br>
                  +    uint32_t num_sources;<br>
                  +    uint32_t clic_size;<br>
                  +    uint32_t clic_mmode_base;<br>
                  +    uint32_t clicintctlbits;<br>
                  +    uint64_t mclicbase;<br>
                  +    char *version;<br>
                  +<br>
                  +    /* Global configuration */<br>
                  +    uint8_t nmbits;<br>
                  +    uint8_t nlbits;<br>
                  +    uint8_t nvbits;<br>
                  +    uint32_t clicinfo;<br>
                  +    uint32_t clicinttrig[32];<br>
                  +<br>
                  +    /* Aperture configuration */<br>
                  +    uint8_t *clicintip;<br>
                  +    uint8_t *clicintie;<br>
                  +    uint8_t *clicintattr;<br>
                  +    uint8_t *clicintctl;<br>
                  +<br>
                  +    /* Complatible with v0.8 */<br>
                  +    uint32_t mintthresh;<br>
                  +    uint32_t sintthresh;<br>
                  +    uint32_t uintthresh;<br>
                  +<br>
                  +    /* QEMU implementaion related fields */<br>
                  +    uint32_t *exccode;<br>
                  +    CLICActiveInterrupt *active_list;<br>
                  +    size_t *active_count;<br>
                  +    MemoryRegion mmio;<br>
                  +    qemu_irq *cpu_irqs;<br>
                  +} RISCVCLICState;<br>
                  +<br>
                  +DeviceState *riscv_clic_create(hwaddr addr, bool
                  prv_s, bool prv_u,<br>
                  +                               uint32_t num_harts,
                  uint32_t num_sources,<br>
                  +                               uint8_t
                  clicintctlbits,<br>
                  +                               const char *version);<br>
                  +<br>
                  +void riscv_clic_decode_exccode(uint32_t exccode, int
                  *mode, int *il, int *irq);<br>
                  +void riscv_clic_clean_pending(void *opaque, int mode,
                  int hartid, int irq);<br>
                  +bool riscv_clic_edge_triggered(void *opaque, int
                  mode, int hartid, int irq);<br>
                  +bool riscv_clic_shv_interrupt(void *opaque, int mode,
                  int hartid, int irq);<br>
                  +void riscv_clic_get_next_interrupt(void *opaque, int
                  hartid);<br>
                  +bool riscv_clic_is_clic_mode(CPURISCVState *env);<br>
                  +#endif<br>
                  diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
                  index a5eab26a69..9e389d7bbf 100644<br>
                  --- a/target/riscv/cpu.h<br>
                  +++ b/target/riscv/cpu.h<br>
                  @@ -33,6 +33,7 @@<br>
                   #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU<br>
                   #define RISCV_CPU_TYPE_NAME(name) (name
                  RISCV_CPU_TYPE_SUFFIX)<br>
                   #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU<br>
                  +#define CPU_INTERRUPT_CLIC CPU_INTERRUPT_TGT_EXT_0<br>
                  <br>
                   #define TYPE_RISCV_CPU_ANY             
                  RISCV_CPU_TYPE_NAME("any")<br>
                   #define TYPE_RISCV_CPU_BASE32         
                   RISCV_CPU_TYPE_NAME("rv32")<br>
                  @@ -247,6 +248,7 @@ struct CPURISCVState {<br>
                       /* Fields from here on are preserved across CPU
                  reset. */<br>
                       QEMUTimer *timer; /* Internal timer */<br>
                       void *clic;       /* clic interrupt controller */<br>
                  +    uint32_t exccode; /* clic irq encode */<br>
                   };<br>
                  <br>
                   OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,<br>
                  -- <br>
                  2.25.1<br>
                  <br>
                  <br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------6A70CDA918DBB859CEF8A6B5--

