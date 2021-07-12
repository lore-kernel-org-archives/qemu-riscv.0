Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2o3S-0004an-Fn
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 01:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2o3P-0004WW-5r
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 01:00:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:56245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2o3K-0004Oh-9b
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 01:00:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j34so10479420wms.5
 for <qemu-riscv@nongnu.org>; Sun, 11 Jul 2021 22:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eN4nnJrNGlqfLA+Z9hvaLK33/h4lkVq/9Vfo7S67x+M=;
 b=uSNyxRlpBsOqCD/17R4bO3yUrtBJMgV4Lk4o0PIDrYPXX+0E0li1FFkmfp28g7mr6V
 2NTsBrFfcCba2OhpFxMODyGhmeTFR4JDBD4jYVO8Q9LGoi6oIw3KUqE/lqYyV0IuNqr8
 ORp65W7ieDSh0mI2GGITosh03fzsMtEXmtFyAfu/1ZIwbRZ9t1XxRvghBMbFeeYriEDk
 w/EsZnjPEqi0/qB2XBb8QtOV+lrMm9fiLO3Z61j1kYD+tr4g9SUcbId4wA9+B71aL4S+
 A9SHUdrXwSB33pqlf3YZEIBY/DYYOLXGvpUIp9rYBghhtZnzrQr9G4Os6qMXKyviC4eV
 VX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eN4nnJrNGlqfLA+Z9hvaLK33/h4lkVq/9Vfo7S67x+M=;
 b=jEXk9XBk1ELkjBlTkgWUS2tMdg5CTyrNk5ytW3hpanZwTRxraZIXoGb/LdD3b9ltrQ
 Ee1FSEPgBO1rL3J4DCyxWRIRwYop4hkRN+fWvImdl8wfdsczWDRaAFxNBw/D4NeWd0bA
 geSUicAv+auPTQ8QnWwBsuT4WtjkydAnrALH1Qg64Y+O6o3Sqrg2X5UOpm64T5xx7ve7
 gY5cSiNT5K3rFl5CTlznTG0tkmD8BsrIyTilom0SDH3Sbpoy8l4Pvm1FIJmQe9sha0uq
 XYcKOvgJRA+ZeXaQgLVFWFccRr9HnYclk8+7a88Nn2xUCt0zhcUyhCnimsvZfJQOu3H1
 Wstg==
X-Gm-Message-State: AOAM531Glec0+3rLoNzi0h2tOn4zNNdLJbJ0KEZoC/4I2K+uznPVVgFz
 lDuc+C3XR3337iiiGiwQQ68gq2J4BP3zbN8OVE50Yg==
X-Google-Smtp-Source: ABdhPJyY/cZ2c4n6AqdX+1cf8rUlAk0FjrHlRsvAsazmPy9/VGaEiynavUUWvXfQ5Xrjm2nC+6B8UK39br6CFtyPcHU=
X-Received: by 2002:a05:600c:4f41:: with SMTP id
 m1mr53491988wmq.134.1626066019106; 
 Sun, 11 Jul 2021 22:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-2-anup.patel@wdc.com>
 <CAEUhbmUU2-304taNqP_h6cBA83rAJc0Ck_EdnyYaQXSW3t-EOg@mail.gmail.com>
In-Reply-To: <CAEUhbmUU2-304taNqP_h6cBA83rAJc0Ck_EdnyYaQXSW3t-EOg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 10:30:07 +0530
Message-ID: <CAAhSdy0xFgUshnE4KHAtEKHnTV3WkmDa86KE9uD+dmUVQj_gzQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] hw/intc: Upgrade the SiFive CLINT implementation
 to RISC-V ACLINT
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 12 Jul 2021 05:00:27 -0000

On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jun 13, 2021 at 12:08 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The RISC-V ACLINT is more modular and backward compatible with
> > original SiFive CLINT so instead of duplicating the orignal
> > SiFive CLINT implementation we upgrade the current SiFive CLINT
> > implementation to RISC-V ACLINT implementation.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/intc/Kconfig                |   2 +-
> >  hw/intc/meson.build            |   2 +-
> >  hw/intc/riscv_aclint.c         | 374 +++++++++++++++++++++++++++++++++
> >  hw/intc/sifive_clint.c         | 266 -----------------------
> >  hw/riscv/Kconfig               |  10 +-
> >  hw/riscv/microchip_pfsoc.c     |  12 +-
> >  hw/riscv/sifive_e.c            |  12 +-
> >  hw/riscv/sifive_u.c            |  14 +-
> >  hw/riscv/spike.c               |  15 +-
> >  hw/riscv/virt.c                |  15 +-
> >  include/hw/intc/riscv_aclint.h |  73 +++++++
> >  include/hw/intc/sifive_clint.h |  60 ------
> >  12 files changed, 494 insertions(+), 361 deletions(-)
> >  create mode 100644 hw/intc/riscv_aclint.c
> >  delete mode 100644 hw/intc/sifive_clint.c
> >  create mode 100644 include/hw/intc/riscv_aclint.h
> >  delete mode 100644 include/hw/intc/sifive_clint.h
> >
> > diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> > index f4694088a4..78aed93c45 100644
> > --- a/hw/intc/Kconfig
> > +++ b/hw/intc/Kconfig
> > @@ -62,7 +62,7 @@ config RX_ICU
> >  config LOONGSON_LIOINTC
> >      bool
> >
> > -config SIFIVE_CLINT
> > +config RISCV_ACLINT
> >      bool
> >
> >  config SIFIVE_PLIC
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index 1c299039f6..2482fcfaf8 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
> >  specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
> >  specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
> >  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
> > -specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
> > +specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
> >  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
> >  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> >  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > new file mode 100644
> > index 0000000000..682f95cca7
> > --- /dev/null
> > +++ b/hw/intc/riscv_aclint.c
> > @@ -0,0 +1,374 @@
> > +/*
> > + * RISC-V ACLINT (Advanced Core Local Interruptor)
> > + *
> > + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> > + * Copyright (c) 2017 SiFive, Inc.
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + *
> > + * This provides real-time clock, timer and interprocessor interrupts.
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
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/module.h"
> > +#include "hw/sysbus.h"
> > +#include "target/riscv/cpu.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/intc/riscv_aclint.h"
> > +#include "qemu/timer.h"
> > +
> > +static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > +{
> > +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +        timebase_freq, NANOSECONDS_PER_SECOND);
> > +}
> > +
> > +/*
> > + * Called when timecmp is written to update the QEMU timer or immediately
> > + * trigger timer interrupt if mtimecmp <= current timer value.
> > + */
> > +static void riscv_aclint_mtimer_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > +    uint32_t timebase_freq)
> > +{
> > +    uint64_t next;
> > +    uint64_t diff;
> > +
> > +    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> > +
> > +    cpu->env.timecmp = value;
> > +    if (cpu->env.timecmp <= rtc_r) {
> > +        /* if we're setting an MTIMECMP value in the "past",
> > +           immediately raise the timer interrupt */
>
> nits: please use correct multi-line comment format

Okay, will update.

>
> > +        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +        return;
> > +    }
> > +
> > +    /* otherwise, set up the future timer interrupt */
> > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > +    diff = cpu->env.timecmp - rtc_r;
> > +    /* back to ns (note args switched in muldiv64) */
> > +    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > +        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > +    timer_mod(cpu->env.timer, next);
> > +}
> > +
> > +/*
> > + * Callback used when the timer set using timer_mod expires.
> > + * Should raise the timer interrupt line
> > + */
> > +static void riscv_aclint_mtimer_cb(void *opaque)
> > +{
> > +    RISCVCPU *cpu = opaque;
> > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +}
> > +
> > +/* CPU wants to read MTIMER register */
>
> nits: CPU read MTIMER register (for consistency with other RW routines)

Okay, will update.

>
> > +static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
> > +    unsigned size)
> > +{
> > +    RISCVAclintMTimerState *mtimer = opaque;
> > +
> > +    if (addr < (mtimer->num_harts << 3)) {
> > +        size_t hartid = mtimer->hartid_base + (addr >> 3);
> > +        CPUState *cpu = qemu_get_cpu(hartid);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("aclint-mtimer: invalid hartid: %zu", hartid);
> > +        } else if ((addr & 0x7) == 0) {
> > +            /* timecmp_lo */
> > +            uint64_t timecmp = env->timecmp;
> > +            return timecmp & 0xFFFFFFFF;
> > +        } else if ((addr & 0x7) == 4) {
> > +            /* timecmp_hi */
> > +            uint64_t timecmp = env->timecmp;
> > +            return (timecmp >> 32) & 0xFFFFFFFF;
> > +        } else {
> > +            error_report("aclint-mtimer: invalid read: %08x", (uint32_t)addr);
> > +            return 0;
> > +        }
> > +    } else if (addr == (mtimer->aperture_size - 8)) {
> > +        /* time_lo */
> > +        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
> > +    } else if (addr == (mtimer->aperture_size - 4)) {
> > +        /* time_hi */
> > +        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
> > +    }
> > +
> > +    error_report("aclint-mtimer: invalid read: %08x", (uint32_t)addr);
> > +    return 0;
> > +}
> > +
> > +/* CPU wrote MTIMER register */
>
> nits: write

Okay, will update.

>
> > +static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> > +    uint64_t value, unsigned size)
> > +{
> > +    RISCVAclintMTimerState *mtimer = opaque;
> > +
> > +    if (addr < (mtimer->num_harts << 3)) {
> > +        size_t hartid = mtimer->hartid_base + (addr >> 3);
> > +        CPUState *cpu = qemu_get_cpu(hartid);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("aclint-mtimer: invalid hartid: %zu", hartid);
> > +        } else if ((addr & 0x7) == 0) {
> > +            /* timecmp_lo */
> > +            uint64_t timecmp_hi = env->timecmp >> 32;
> > +            riscv_aclint_mtimer_write_timecmp(RISCV_CPU(cpu),
> > +                timecmp_hi << 32 | (value & 0xFFFFFFFF),
> > +                mtimer->timebase_freq);
> > +            return;
> > +        } else if ((addr & 0x7) == 4) {
> > +            /* timecmp_hi */
> > +            uint64_t timecmp_lo = env->timecmp;
> > +            riscv_aclint_mtimer_write_timecmp(RISCV_CPU(cpu),
> > +                value << 32 | (timecmp_lo & 0xFFFFFFFF),
> > +                mtimer->timebase_freq);
> > +        } else {
> > +            error_report("aclint-mtimer: invalid timecmp write: %08x",
> > +                         (uint32_t)addr);
> > +        }
> > +        return;
> > +    } else if (addr == (mtimer->aperture_size - 8)) {
> > +        /* time_lo */
> > +        error_report("aclint-mtimer: time_lo write not implemented");
> > +        return;
> > +    } else if (addr == (mtimer->aperture_size - 4)) {
> > +        /* time_hi */
> > +        error_report("aclint-mtimer: time_hi write not implemented");
> > +        return;
> > +    }
> > +
> > +    error_report("aclint-mtimer: invalid write: %08x", (uint32_t)addr);
> > +}
> > +
> > +static const MemoryRegionOps riscv_aclint_mtimer_ops = {
> > +    .read = riscv_aclint_mtimer_read,
> > +    .write = riscv_aclint_mtimer_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8
> > +    }
> > +};
> > +
> > +static Property riscv_aclint_mtimer_properties[] = {
> > +    DEFINE_PROP_UINT32("hartid-base", RISCVAclintMTimerState,
> > +        hartid_base, 0),
> > +    DEFINE_PROP_UINT32("num-harts", RISCVAclintMTimerState, num_harts, 0),
>
> I guess we can set the default value to 4095 according to the spec?

Better to have default as 1 because a RISC-V platform will have at least
1 hart.

>
> > +    DEFINE_PROP_UINT32("aperture-size", RISCVAclintMTimerState,
> > +        aperture_size, 0),
>
> I don't think this parameter is needed given the spec clearly defines its size.

Based on recent discussion on AIA mailing list, people want more flexibility
to place MTIME register anywhere they want without sacrificing backward
compatibility with SiFive CLINT so we will end-up with separate base address
for MTIMECMPx registers and MTIME register which means the ACLINT
MTIMER device will not have fixed size hence we will require aperture_size
for the ACLINT MTIMER.

The ACLINT MSWI and SSWI will remain fixed size supporting upto 4095
HARTs so for these devices we don't need aperture_size.

>
> > +    DEFINE_PROP_UINT32("timebase-freq", RISCVAclintMTimerState,
> > +        timebase_freq, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
> > +{
> > +    int i;
> > +    RISCVCPU *cpu;
> > +    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(dev), &riscv_aclint_mtimer_ops, s,
> > +                          TYPE_RISCV_ACLINT_MTIMER, s->aperture_size);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > +
> > +    /* Claim MTIP so that only MTIMER controls it. */
>
> nits: please remove the ending .

Okay, will update.

>
> > +    for (i = 0; i < s->num_harts; i++) {
> > +        cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
> > +        if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
> > +            error_report("MTIP already claimed");
> > +            exit(1);
> > +        }
> > +    }
> > +}
> > +
> > +static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    dc->realize = riscv_aclint_mtimer_realize;
> > +    device_class_set_props(dc, riscv_aclint_mtimer_properties);
> > +}
> > +
> > +static const TypeInfo riscv_aclint_mtimer_info = {
> > +    .name          = TYPE_RISCV_ACLINT_MTIMER,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(RISCVAclintMTimerState),
> > +    .class_init    = riscv_aclint_mtimer_class_init,
> > +};
> > +
> > +/*
> > + * Create ACLINT MTIMER device.
> > + */
> > +DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
> > +    uint32_t hartid_base, uint32_t num_harts, uint32_t timebase_freq,
> > +    bool provide_rdtime)
> > +{
> > +    int i;
> > +    for (i = 0; i < num_harts; i++) {
> > +        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            continue;
> > +        }
> > +        if (provide_rdtime) {
> > +            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> > +        }
> > +        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                                  &riscv_aclint_mtimer_cb, cpu);
> > +        env->timecmp = 0;
> > +    }
> > +
> > +    DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
> > +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > +    qdev_prop_set_uint32(dev, "aperture-size", size);
> > +    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > +    return dev;
> > +}
> > +
> > +/* CPU read [M|S]SWI register */
> > +static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
> > +    unsigned size)
> > +{
> > +    RISCVAclintSwiState *swi = opaque;
> > +
> > +    if (addr < (swi->num_harts << 2)) {
> > +        size_t hartid = swi->hartid_base + (addr >> 2);
> > +        CPUState *cpu = qemu_get_cpu(hartid);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("aclint-swi: invalid hartid: %zu", hartid);
> > +        } else if ((addr & 0x3) == 0) {
> > +            return (env->mip & swi->sirq_mask) > 0;
> > +        } else {
> > +            error_report("aclint-swi: invalid read: %08x", (uint32_t)addr);
> > +            return 0;
> > +        }
> > +    }
> > +
> > +    error_report("aclint-swi: invalid read: %08x", (uint32_t)addr);
> > +    return 0;
> > +}
> > +
> > +/* CPU wrote [M|S]SWI register */
>
> write

Okay, will update.

>
> > +static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t value,
> > +        unsigned size)
> > +{
> > +    RISCVAclintSwiState *swi = opaque;
> > +
> > +    if (addr < (swi->num_harts << 2)) {
> > +        size_t hartid = swi->hartid_base + (addr >> 2);
> > +        CPUState *cpu = qemu_get_cpu(hartid);
> > +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +        if (!env) {
> > +            error_report("aclint-swi: invalid hartid: %zu", hartid);
> > +        } else if ((addr & 0x3) == 0) {
> > +            riscv_cpu_update_mip(RISCV_CPU(cpu), swi->sirq_mask,
> > +                                 BOOL_TO_MASK(value));
> > +        } else {
> > +            error_report("aclint-swi: invalid [M|S]SIP write: %08x",
> > +                         (uint32_t)addr);
> > +        }
> > +        return;
> > +    }
> > +
> > +    error_report("aclint-swi: invalid write: %08x", (uint32_t)addr);
> > +}
> > +
> > +static const MemoryRegionOps riscv_aclint_swi_ops = {
> > +    .read = riscv_aclint_swi_read,
> > +    .write = riscv_aclint_swi_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 4
> > +    }
> > +};
> > +
> > +static Property riscv_aclint_swi_properties[] = {
> > +    DEFINE_PROP_UINT32("hartid-base", RISCVAclintSwiState, hartid_base, 0),
> > +    DEFINE_PROP_UINT32("num-harts", RISCVAclintSwiState, num_harts, 0),
>
> ditto

We should use default value as 1 hart.

>
> > +    DEFINE_PROP_UINT32("aperture-size", RISCVAclintSwiState,
> > +        aperture_size, 0),
>
> ditto

Yes, this one can be removed.

>
> > +    DEFINE_PROP_UINT32("sirq-mask", RISCVAclintSwiState, sirq_mask, 0),
>
> Could be more intuitive if we describe it as:
>
> DEFINE_PROP_BOOL("sswi", RISCVAclintSwiState, sswi, false)
>
> so we don't bother user to pass the mask of the MIP register

Okay, I will simplify this.

>
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
> > +{
> > +    int i;
> > +    RISCVCPU *cpu;
> > +    RISCVAclintSwiState *s = RISCV_ACLINT_SWI(dev);
> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(dev), &riscv_aclint_swi_ops, s,
> > +                          TYPE_RISCV_ACLINT_SWI, s->aperture_size);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > +
> > +    /* Claim [M|S]SIP so that can SWI controls it. */
> > +    for (i = 0; i < s->num_harts; i++) {
> > +        cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
> > +
> > +        /* We don't claim SSIP bit of mip CSR because this bit is
> > +         * writable by software as-per RISC-V privilege specification.
> > +         */
>
> nits: please use correct multi-line comment format

okay, will update.

>
> > +        if ((s->sirq_mask != MIP_SSIP) &&
> > +            riscv_cpu_claim_interrupts(cpu, s->sirq_mask) < 0) {
> > +            error_report("%s already claimed",
> > +                (s->sirq_mask == MIP_SSIP) ? "SSIP" : "MSIP");
> > +            exit(1);
> > +        }
> > +    }
> > +}
> > +
> > +static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    dc->realize = riscv_aclint_swi_realize;
> > +    device_class_set_props(dc, riscv_aclint_swi_properties);
> > +}
> > +
> > +static const TypeInfo riscv_aclint_swi_info = {
> > +    .name          = TYPE_RISCV_ACLINT_SWI,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(RISCVAclintSwiState),
> > +    .class_init    = riscv_aclint_swi_class_init,
> > +};
> > +
> > +/*
> > + * Create ACLINT [M|S]SWI device.
> > + */
> > +DeviceState *riscv_aclint_swi_create(hwaddr addr, hwaddr size,
> > +    uint32_t hartid_base, uint32_t num_harts, bool smode_swi)
> > +{
> > +    DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_SWI);
> > +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > +    qdev_prop_set_uint32(dev, "aperture-size", size);
> > +    qdev_prop_set_uint32(dev, "sirq-mask", smode_swi ? MIP_SSIP : MIP_MSIP);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > +    return dev;
> > +}
> > +
> > +static void riscv_aclint_register_types(void)
> > +{
> > +    type_register_static(&riscv_aclint_mtimer_info);
> > +    type_register_static(&riscv_aclint_swi_info);
> > +}
> > +
> > +type_init(riscv_aclint_register_types)
> > diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> > deleted file mode 100644
> > index 0f41e5ea1c..0000000000
> > --- a/hw/intc/sifive_clint.c
> > +++ /dev/null
> > @@ -1,266 +0,0 @@
> > -/*
> > - * SiFive CLINT (Core Local Interruptor)
> > - *
> > - * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> > - * Copyright (c) 2017 SiFive, Inc.
> > - *
> > - * This provides real-time clock, timer and interprocessor interrupts.
> > - *
> > - * This program is free software; you can redistribute it and/or modify it
> > - * under the terms and conditions of the GNU General Public License,
> > - * version 2 or later, as published by the Free Software Foundation.
> > - *
> > - * This program is distributed in the hope it will be useful, but WITHOUT
> > - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > - * more details.
> > - *
> > - * You should have received a copy of the GNU General Public License along with
> > - * this program.  If not, see <http://www.gnu.org/licenses/>.
> > - */
> > -
> > -#include "qemu/osdep.h"
> > -#include "qapi/error.h"
> > -#include "qemu/error-report.h"
> > -#include "qemu/module.h"
> > -#include "hw/sysbus.h"
> > -#include "target/riscv/cpu.h"
> > -#include "hw/qdev-properties.h"
> > -#include "hw/intc/sifive_clint.h"
> > -#include "qemu/timer.h"
> > -
> > -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > -{
> > -    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -        timebase_freq, NANOSECONDS_PER_SECOND);
> > -}
> > -
> > -/*
> > - * Called when timecmp is written to update the QEMU timer or immediately
> > - * trigger timer interrupt if mtimecmp <= current timer value.
> > - */
> > -static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> > -                                       uint32_t timebase_freq)
> > -{
> > -    uint64_t next;
> > -    uint64_t diff;
> > -
> > -    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> > -
> > -    cpu->env.timecmp = value;
> > -    if (cpu->env.timecmp <= rtc_r) {
> > -        /* if we're setting an MTIMECMP value in the "past",
> > -           immediately raise the timer interrupt */
> > -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > -        return;
> > -    }
> > -
> > -    /* otherwise, set up the future timer interrupt */
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > -    diff = cpu->env.timecmp - rtc_r;
> > -    /* back to ns (note args switched in muldiv64) */
> > -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > -        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > -    timer_mod(cpu->env.timer, next);
> > -}
> > -
> > -/*
> > - * Callback used when the timer set using timer_mod expires.
> > - * Should raise the timer interrupt line
> > - */
> > -static void sifive_clint_timer_cb(void *opaque)
> > -{
> > -    RISCVCPU *cpu = opaque;
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > -}
> > -
> > -/* CPU wants to read rtc or timecmp register */
> > -static uint64_t sifive_clint_read(void *opaque, hwaddr addr, unsigned size)
> > -{
> > -    SiFiveCLINTState *clint = opaque;
> > -    if (addr >= clint->sip_base &&
> > -        addr < clint->sip_base + (clint->num_harts << 2)) {
> > -        size_t hartid = clint->hartid_base + ((addr - clint->sip_base) >> 2);
> > -        CPUState *cpu = qemu_get_cpu(hartid);
> > -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > -        if (!env) {
> > -            error_report("clint: invalid timecmp hartid: %zu", hartid);
> > -        } else if ((addr & 0x3) == 0) {
> > -            return (env->mip & MIP_MSIP) > 0;
> > -        } else {
> > -            error_report("clint: invalid read: %08x", (uint32_t)addr);
> > -            return 0;
> > -        }
> > -    } else if (addr >= clint->timecmp_base &&
> > -        addr < clint->timecmp_base + (clint->num_harts << 3)) {
> > -        size_t hartid = clint->hartid_base +
> > -            ((addr - clint->timecmp_base) >> 3);
> > -        CPUState *cpu = qemu_get_cpu(hartid);
> > -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > -        if (!env) {
> > -            error_report("clint: invalid timecmp hartid: %zu", hartid);
> > -        } else if ((addr & 0x7) == 0) {
> > -            /* timecmp_lo */
> > -            uint64_t timecmp = env->timecmp;
> > -            return timecmp & 0xFFFFFFFF;
> > -        } else if ((addr & 0x7) == 4) {
> > -            /* timecmp_hi */
> > -            uint64_t timecmp = env->timecmp;
> > -            return (timecmp >> 32) & 0xFFFFFFFF;
> > -        } else {
> > -            error_report("clint: invalid read: %08x", (uint32_t)addr);
> > -            return 0;
> > -        }
> > -    } else if (addr == clint->time_base) {
> > -        /* time_lo */
> > -        return cpu_riscv_read_rtc(clint->timebase_freq) & 0xFFFFFFFF;
> > -    } else if (addr == clint->time_base + 4) {
> > -        /* time_hi */
> > -        return (cpu_riscv_read_rtc(clint->timebase_freq) >> 32) & 0xFFFFFFFF;
> > -    }
> > -
> > -    error_report("clint: invalid read: %08x", (uint32_t)addr);
> > -    return 0;
> > -}
> > -
> > -/* CPU wrote to rtc or timecmp register */
> > -static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
> > -        unsigned size)
> > -{
> > -    SiFiveCLINTState *clint = opaque;
> > -
> > -    if (addr >= clint->sip_base &&
> > -        addr < clint->sip_base + (clint->num_harts << 2)) {
> > -        size_t hartid = clint->hartid_base + ((addr - clint->sip_base) >> 2);
> > -        CPUState *cpu = qemu_get_cpu(hartid);
> > -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > -        if (!env) {
> > -            error_report("clint: invalid timecmp hartid: %zu", hartid);
> > -        } else if ((addr & 0x3) == 0) {
> > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> > -        } else {
> > -            error_report("clint: invalid sip write: %08x", (uint32_t)addr);
> > -        }
> > -        return;
> > -    } else if (addr >= clint->timecmp_base &&
> > -        addr < clint->timecmp_base + (clint->num_harts << 3)) {
> > -        size_t hartid = clint->hartid_base +
> > -            ((addr - clint->timecmp_base) >> 3);
> > -        CPUState *cpu = qemu_get_cpu(hartid);
> > -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > -        if (!env) {
> > -            error_report("clint: invalid timecmp hartid: %zu", hartid);
> > -        } else if ((addr & 0x7) == 0) {
> > -            /* timecmp_lo */
> > -            uint64_t timecmp_hi = env->timecmp >> 32;
> > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > -                timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
> > -            return;
> > -        } else if ((addr & 0x7) == 4) {
> > -            /* timecmp_hi */
> > -            uint64_t timecmp_lo = env->timecmp;
> > -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> > -                value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
> > -        } else {
> > -            error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
> > -        }
> > -        return;
> > -    } else if (addr == clint->time_base) {
> > -        /* time_lo */
> > -        error_report("clint: time_lo write not implemented");
> > -        return;
> > -    } else if (addr == clint->time_base + 4) {
> > -        /* time_hi */
> > -        error_report("clint: time_hi write not implemented");
> > -        return;
> > -    }
> > -
> > -    error_report("clint: invalid write: %08x", (uint32_t)addr);
> > -}
> > -
> > -static const MemoryRegionOps sifive_clint_ops = {
> > -    .read = sifive_clint_read,
> > -    .write = sifive_clint_write,
> > -    .endianness = DEVICE_LITTLE_ENDIAN,
> > -    .valid = {
> > -        .min_access_size = 4,
> > -        .max_access_size = 8
> > -    }
> > -};
> > -
> > -static Property sifive_clint_properties[] = {
> > -    DEFINE_PROP_UINT32("hartid-base", SiFiveCLINTState, hartid_base, 0),
> > -    DEFINE_PROP_UINT32("num-harts", SiFiveCLINTState, num_harts, 0),
> > -    DEFINE_PROP_UINT32("sip-base", SiFiveCLINTState, sip_base, 0),
> > -    DEFINE_PROP_UINT32("timecmp-base", SiFiveCLINTState, timecmp_base, 0),
> > -    DEFINE_PROP_UINT32("time-base", SiFiveCLINTState, time_base, 0),
> > -    DEFINE_PROP_UINT32("aperture-size", SiFiveCLINTState, aperture_size, 0),
> > -    DEFINE_PROP_UINT32("timebase-freq", SiFiveCLINTState, timebase_freq, 0),
> > -    DEFINE_PROP_END_OF_LIST(),
> > -};
> > -
> > -static void sifive_clint_realize(DeviceState *dev, Error **errp)
> > -{
> > -    SiFiveCLINTState *s = SIFIVE_CLINT(dev);
> > -    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
> > -                          TYPE_SIFIVE_CLINT, s->aperture_size);
> > -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > -}
> > -
> > -static void sifive_clint_class_init(ObjectClass *klass, void *data)
> > -{
> > -    DeviceClass *dc = DEVICE_CLASS(klass);
> > -    dc->realize = sifive_clint_realize;
> > -    device_class_set_props(dc, sifive_clint_properties);
> > -}
> > -
> > -static const TypeInfo sifive_clint_info = {
> > -    .name          = TYPE_SIFIVE_CLINT,
> > -    .parent        = TYPE_SYS_BUS_DEVICE,
> > -    .instance_size = sizeof(SiFiveCLINTState),
> > -    .class_init    = sifive_clint_class_init,
> > -};
> > -
> > -static void sifive_clint_register_types(void)
> > -{
> > -    type_register_static(&sifive_clint_info);
> > -}
> > -
> > -type_init(sifive_clint_register_types)
> > -
> > -
> > -/*
> > - * Create CLINT device.
> > - */
> > -DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> > -    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
> > -    uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
> > -    bool provide_rdtime)
> > -{
> > -    int i;
> > -    for (i = 0; i < num_harts; i++) {
> > -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> > -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > -        if (!env) {
> > -            continue;
> > -        }
> > -        if (provide_rdtime) {
> > -            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> > -        }
> > -        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > -                                  &sifive_clint_timer_cb, cpu);
> > -        env->timecmp = 0;
> > -    }
> > -
> > -    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> > -    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> > -    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> > -    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> > -    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> > -    qdev_prop_set_uint32(dev, "time-base", time_base);
> > -    qdev_prop_set_uint32(dev, "aperture-size", size);
> > -    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> > -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > -    return dev;
> > -}
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 1de18cdcf1..939cd0ef40 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -9,7 +9,7 @@ config MICROCHIP_PFSOC
> >      select MCHP_PFSOC_MMUART
> >      select MCHP_PFSOC_SYSREG
> >      select MSI_NONBROKEN
> > -    select SIFIVE_CLINT
> > +    select RISCV_ACLINT
> >      select SIFIVE_PDMA
> >      select SIFIVE_PLIC
> >      select UNIMP
> > @@ -29,7 +29,7 @@ config RISCV_VIRT
> >      select PCI_EXPRESS_GENERIC_BRIDGE
> >      select PFLASH_CFI01
> >      select SERIAL
> > -    select SIFIVE_CLINT
> > +    select RISCV_ACLINT
>
> nits: please insert this by following the alphabetical order
>
> >      select SIFIVE_PLIC
> >      select SIFIVE_TEST
> >      select VIRTIO_MMIO
> > @@ -38,7 +38,7 @@ config RISCV_VIRT
> >  config SIFIVE_E
> >      bool
> >      select MSI_NONBROKEN
> > -    select SIFIVE_CLINT
> > +    select RISCV_ACLINT
> >      select SIFIVE_GPIO
> >      select SIFIVE_PLIC
> >      select SIFIVE_UART
> > @@ -49,7 +49,7 @@ config SIFIVE_U
> >      bool
> >      select CADENCE
> >      select MSI_NONBROKEN
> > -    select SIFIVE_CLINT
> > +    select RISCV_ACLINT
> >      select SIFIVE_GPIO
> >      select SIFIVE_PDMA
> >      select SIFIVE_PLIC
> > @@ -65,5 +65,5 @@ config SPIKE
> >      bool
> >      select HTIF
> >      select MSI_NONBROKEN
> > -    select SIFIVE_CLINT
> > +    select RISCV_ACLINT
> >      select SIFIVE_PLIC
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index c4146b7a6b..e637e5c885 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -51,7 +51,7 @@
> >  #include "hw/riscv/boot.h"
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/riscv/microchip_pfsoc.h"
> > -#include "hw/intc/sifive_clint.h"
> > +#include "hw/intc/riscv_aclint.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "sysemu/sysemu.h"
> >
> > @@ -235,10 +235,12 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
> >          memmap[MICROCHIP_PFSOC_BUSERR_UNIT4].size);
> >
> >      /* CLINT */
> > -    sifive_clint_create(memmap[MICROCHIP_PFSOC_CLINT].base,
> > -        memmap[MICROCHIP_PFSOC_CLINT].size, 0, ms->smp.cpus,
> > -        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> > -        CLINT_TIMEBASE_FREQ, false);
> > +    riscv_aclint_swi_create(memmap[MICROCHIP_PFSOC_CLINT].base,
> > +        RISCV_ACLINT_SWI_SIZE, 0, ms->smp.cpus, false);
> > +    riscv_aclint_mtimer_create(
> > +        memmap[MICROCHIP_PFSOC_CLINT].base + RISCV_ACLINT_SWI_SIZE,
> > +        RISCV_ACLINT_MTIMER_SIZE, 0, ms->smp.cpus,
> > +        RISCV_ACLINT_TIMEBASE_FREQ, false);
> >
> >      /* L2 cache controller */
> >      create_unimplemented_device("microchip.pfsoc.l2cc",
> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> > index f939bcf9ea..ea960a5f2e 100644
> > --- a/hw/riscv/sifive_e.c
> > +++ b/hw/riscv/sifive_e.c
> > @@ -42,7 +42,7 @@
> >  #include "hw/riscv/sifive_e.h"
> >  #include "hw/riscv/boot.h"
> >  #include "hw/char/sifive_uart.h"
> > -#include "hw/intc/sifive_clint.h"
> > +#include "hw/intc/riscv_aclint.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "hw/misc/sifive_e_prci.h"
> >  #include "chardev/char.h"
> > @@ -210,10 +210,12 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
> >          SIFIVE_E_PLIC_CONTEXT_BASE,
> >          SIFIVE_E_PLIC_CONTEXT_STRIDE,
> >          memmap[SIFIVE_E_DEV_PLIC].size);
> > -    sifive_clint_create(memmap[SIFIVE_E_DEV_CLINT].base,
> > -        memmap[SIFIVE_E_DEV_CLINT].size, 0, ms->smp.cpus,
> > -        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> > -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> > +    riscv_aclint_swi_create(memmap[SIFIVE_E_DEV_CLINT].base,
> > +        RISCV_ACLINT_SWI_SIZE, 0, ms->smp.cpus, false);
> > +    riscv_aclint_mtimer_create(memmap[SIFIVE_E_DEV_CLINT].base +
> > +            RISCV_ACLINT_SWI_SIZE,
> > +        RISCV_ACLINT_MTIMER_SIZE, 0, ms->smp.cpus,
> > +        RISCV_ACLINT_TIMEBASE_FREQ, false);
> >      create_unimplemented_device("riscv.sifive.e.aon",
> >          memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> >      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 7b59942369..e5fe681984 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -52,7 +52,7 @@
> >  #include "hw/riscv/sifive_u.h"
> >  #include "hw/riscv/boot.h"
> >  #include "hw/char/sifive_uart.h"
> > -#include "hw/intc/sifive_clint.h"
> > +#include "hw/intc/riscv_aclint.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "chardev/char.h"
> >  #include "net/eth.h"
> > @@ -160,7 +160,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> > +        RISCV_ACLINT_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >
> > @@ -839,10 +839,12 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
> >          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
> >      sifive_uart_create(system_memory, memmap[SIFIVE_U_DEV_UART1].base,
> >          serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
> > -    sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
> > -        memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
> > -        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> > -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> > +    riscv_aclint_swi_create(memmap[SIFIVE_U_DEV_CLINT].base,
> > +        RISCV_ACLINT_SWI_SIZE, 0, ms->smp.cpus, false);
> > +    riscv_aclint_mtimer_create(memmap[SIFIVE_U_DEV_CLINT].base +
> > +            RISCV_ACLINT_SWI_SIZE,
> > +        RISCV_ACLINT_MTIMER_SIZE, 0, ms->smp.cpus,
> > +        RISCV_ACLINT_TIMEBASE_FREQ, false);
> >
> >      if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
> >          return;
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index ec7cb2f707..10681fbf99 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -36,7 +36,7 @@
> >  #include "hw/riscv/boot.h"
> >  #include "hw/riscv/numa.h"
> >  #include "hw/char/riscv_htif.h"
> > -#include "hw/intc/sifive_clint.h"
> > +#include "hw/intc/riscv_aclint.h"
> >  #include "chardev/char.h"
> >  #include "sysemu/arch_init.h"
> >  #include "sysemu/device_tree.h"
> > @@ -83,7 +83,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -        SIFIVE_CLINT_TIMEBASE_FREQ);
> > +        RISCV_ACLINT_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> > @@ -225,11 +225,14 @@ static void spike_board_init(MachineState *machine)
> >          sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
> >
> >          /* Core Local Interruptor (timer and IPI) for each socket */
> > -        sifive_clint_create(
> > +        riscv_aclint_swi_create(
> >              memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size,
> > -            memmap[SPIKE_CLINT].size, base_hartid, hart_count,
> > -            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> > -            SIFIVE_CLINT_TIMEBASE_FREQ, false);
> > +            RISCV_ACLINT_SWI_SIZE, base_hartid, hart_count, false);
> > +        riscv_aclint_mtimer_create(
> > +            memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size +
> > +                RISCV_ACLINT_SWI_SIZE,
> > +            RISCV_ACLINT_MTIMER_SIZE, base_hartid, hart_count,
> > +            RISCV_ACLINT_TIMEBASE_FREQ, false);
> >      }
> >
> >      /* register system main memory (actual RAM) */
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index c0dc69ff33..5eb63f6efd 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -33,7 +33,7 @@
> >  #include "hw/riscv/virt.h"
> >  #include "hw/riscv/boot.h"
> >  #include "hw/riscv/numa.h"
> > -#include "hw/intc/sifive_clint.h"
> > +#include "hw/intc/riscv_aclint.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "hw/misc/sifive_test.h"
> >  #include "chardev/char.h"
> > @@ -224,7 +224,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> >
> >      qemu_fdt_add_subnode(fdt, "/cpus");
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> > +                          RISCV_ACLINT_TIMEBASE_FREQ);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> >      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> >      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> > @@ -587,11 +587,14 @@ static void virt_machine_init(MachineState *machine)
> >          sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
> >
> >          /* Per-socket CLINT */
> > -        sifive_clint_create(
> > +        riscv_aclint_swi_create(
> >              memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
> > -            memmap[VIRT_CLINT].size, base_hartid, hart_count,
> > -            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> > -            SIFIVE_CLINT_TIMEBASE_FREQ, true);
> > +            RISCV_ACLINT_SWI_SIZE, base_hartid, hart_count, false);
> > +        riscv_aclint_mtimer_create(
> > +            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
> > +                RISCV_ACLINT_SWI_SIZE,
> > +            RISCV_ACLINT_MTIMER_SIZE, base_hartid, hart_count,
> > +            RISCV_ACLINT_TIMEBASE_FREQ, true);
> >
> >          /* Per-socket PLIC hart topology configuration string */
> >          plic_hart_config_len =
> > diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
> > new file mode 100644
> > index 0000000000..471a5ffd0b
> > --- /dev/null
> > +++ b/include/hw/intc/riscv_aclint.h
> > @@ -0,0 +1,73 @@
> > +/*
> > + * RISC-V ACLINT (Advanced Core Local Interruptor) interface
> > + *
> > + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> > + * Copyright (c) 2017 SiFive, Inc.
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
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
> > +#ifndef HW_RISCV_ACLINT_H
> > +#define HW_RISCV_ACLINT_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_RISCV_ACLINT_MTIMER "riscv.aclint.mtimer"
> > +
> > +#define RISCV_ACLINT_MTIMER(obj) \
> > +    OBJECT_CHECK(RISCVAclintMTimerState, (obj), TYPE_RISCV_ACLINT_MTIMER)
> > +
> > +typedef struct RISCVAclintMTimerState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    MemoryRegion mmio;
> > +    uint32_t hartid_base;
> > +    uint32_t num_harts;
> > +    uint32_t aperture_size;
> > +    uint32_t timebase_freq;
> > +} RISCVAclintMTimerState;
> > +
> > +DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
> > +    uint32_t hartid_base, uint32_t num_harts, uint32_t timebase_freq,
> > +    bool provide_rdtime);
> > +
> > +#define TYPE_RISCV_ACLINT_SWI "riscv.aclint.swi"
> > +
> > +#define RISCV_ACLINT_SWI(obj) \
> > +    OBJECT_CHECK(RISCVAclintSwiState, (obj), TYPE_RISCV_ACLINT_SWI)
> > +
> > +typedef struct RISCVAclintSwiState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    MemoryRegion mmio;
> > +    uint32_t hartid_base;
> > +    uint32_t num_harts;
> > +    uint32_t aperture_size;
> > +    uint32_t sirq_mask;
> > +} RISCVAclintSwiState;
> > +
> > +DeviceState *riscv_aclint_swi_create(hwaddr addr, hwaddr size,
> > +    uint32_t hartid_base, uint32_t num_harts, bool smode_swi);
> > +
> > +enum {
> > +    RISCV_ACLINT_MTIMER_SIZE = 0x8000,
> > +    RISCV_ACLINT_TIMEBASE_FREQ = 10000000,
> > +    RISCV_ACLINT_SWI_SIZE = 0x4000
> > +};
> > +
> > +#endif
> > diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
> > deleted file mode 100644
> > index a30be0f3d6..0000000000
> > --- a/include/hw/intc/sifive_clint.h
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -/*
> > - * SiFive CLINT (Core Local Interruptor) interface
> > - *
> > - * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> > - * Copyright (c) 2017 SiFive, Inc.
> > - *
> > - * This program is free software; you can redistribute it and/or modify it
> > - * under the terms and conditions of the GNU General Public License,
> > - * version 2 or later, as published by the Free Software Foundation.
> > - *
> > - * This program is distributed in the hope it will be useful, but WITHOUT
> > - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > - * more details.
> > - *
> > - * You should have received a copy of the GNU General Public License along with
> > - * this program.  If not, see <http://www.gnu.org/licenses/>.
> > - */
> > -
> > -#ifndef HW_SIFIVE_CLINT_H
> > -#define HW_SIFIVE_CLINT_H
> > -
> > -#include "hw/sysbus.h"
> > -
> > -#define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
> > -
> > -#define SIFIVE_CLINT(obj) \
> > -    OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
> > -
> > -typedef struct SiFiveCLINTState {
> > -    /*< private >*/
> > -    SysBusDevice parent_obj;
> > -
> > -    /*< public >*/
> > -    MemoryRegion mmio;
> > -    uint32_t hartid_base;
> > -    uint32_t num_harts;
> > -    uint32_t sip_base;
> > -    uint32_t timecmp_base;
> > -    uint32_t time_base;
> > -    uint32_t aperture_size;
> > -    uint32_t timebase_freq;
> > -} SiFiveCLINTState;
> > -
> > -DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> > -    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
> > -    uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
> > -    bool provide_rdtime);
> > -
> > -enum {
> > -    SIFIVE_SIP_BASE     = 0x0,
> > -    SIFIVE_TIMECMP_BASE = 0x4000,
> > -    SIFIVE_TIME_BASE    = 0xBFF8
> > -};
> > -
> > -enum {
> > -    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
> > -};
> > -
> > -#endif
>
> Regards,
> Bin

Regards,
Anup

