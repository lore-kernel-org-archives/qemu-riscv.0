Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpx3-0003Q2-6y
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 19:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpx1-0003OH-DH; Sun, 07 Aug 2022 19:44:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpwz-000109-03; Sun, 07 Aug 2022 19:44:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id t22so7347324pjy.1;
 Sun, 07 Aug 2022 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sTgzu4S6WcR+ztUnVFSPM9dg3q1Db/83pKYS27163VU=;
 b=entXRfq7ydCm0LcsBarZjaFmZfUhVdnEkVIOHY5RcJmOl+xh3vbzy9zvZvlNke4x5v
 PbM7h8W5ocw4XA6JumRYnjbcU3iiGf4UVkjK5RT70fWHCUL5PwmErsF0DpbTFueJ7ctt
 xI6vXDuXJ9Tuk4gifIR4WfsOGSB8akJLKBcOAE+ADyS8kL/MWuUiGKJmPkIhuouP1Nu4
 qXN9qWtirjEBVgSCsxnilNFwkEbASN/tRMdZ4V70X4LlsYjjcVHoJ4kkuagdMAkps1Y/
 xnwKThAEnTEtwvrzluk7sfBVXUByOShT/j0Cv/U4QC/v+buTVmL+Kqjgeca17lJRXqRC
 R8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sTgzu4S6WcR+ztUnVFSPM9dg3q1Db/83pKYS27163VU=;
 b=3YLX0LE5ZNl2mUtQ2lg0aG2IJlIYycAt8+oObp4YrWtmnDLuMGFBqbbfI21G1olf+V
 mte2DKaXJMQxO96hCuAqN9cN881nDzxM0TrXNBvYkR36CettJ9jKS9q+NmxaphJTjZvX
 2ffg0oMcUbGzgXfgTReHtL17uoZEZ018P7+D4ZLwMSl+H6oYPS8u3/71j/2jVtFTBROc
 CIx/dnZpS5U4ywCc9awfTej8E4F7bYYl12Lt0vRlYXuPX6+x6qEcwhG8ljADihD7sHei
 mcylSRzLCbYpxRjs+jOYO9rDTF9PVW0QLezyljpSzjqqCH19W9aIkkqYUyb/wQZGvmrJ
 ISNg==
X-Gm-Message-State: ACgBeo1l+eBsL78Bw9i/MXqiokqv5+D3fzqNd7p1ttcxu/FiI1cKqlTb
 e44OMX4K7WRp7fiVEQaeTfT3peFkZ01oj5VJ4S4=
X-Google-Smtp-Source: AA6agR4ODvJDn363VC1UlfDUC2AnUKNen+nEK/6P7aslro9U0s97RY5hHS2RBx6JnCdRc/PAkDBVgzW4QTC86hkJYBU=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr17865820pjb.120.1659915891027; Sun, 07
 Aug 2022 16:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220804014240.2514957-1-atishp@rivosinc.com>
 <20220804014240.2514957-3-atishp@rivosinc.com>
In-Reply-To: <20220804014240.2514957-3-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 09:44:24 +1000
Message-ID: <CAKmqyKO+AJif8vVFK2S0D=kNBYzvADJpWvz0HLxnvRFLyXcv2Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] target/riscv: Add stimecmp support
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 07 Aug 2022 23:44:55 -0000

On Thu, Aug 4, 2022 at 11:47 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> stimecmp allows the supervisor mode to update stimecmp CSR directly
> to program the next timer interrupt. This CSR is part of the Sstc
> extension which was ratified recently.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  9 ++++
>  target/riscv/cpu.h         |  5 ++
>  target/riscv/cpu_bits.h    |  4 ++
>  target/riscv/csr.c         | 77 ++++++++++++++++++++++++++++++
>  target/riscv/machine.c     |  1 +
>  target/riscv/meson.build   |  3 +-
>  target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
>  target/riscv/time_helper.h | 30 ++++++++++++
>  8 files changed, 226 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/time_helper.c
>  create mode 100644 target/riscv/time_helper.h
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d4635c7df46b..2498b93105fd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,6 +23,7 @@
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "internals.h"
> +#include "time_helper.h"
>  #include "exec/exec-all.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>      ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> @@ -675,6 +677,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>      set_resetvec(env, cpu->cfg.resetvec);
>
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +#endif /* CONFIG_USER_ONLY */
> +
>      /* Validate that MISA_MXL is set properly. */
>      switch (env->misa_mxl_max) {
>  #ifdef TARGET_RISCV64
> @@ -995,6 +1003,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0fae1569945c..4cda2905661e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -309,6 +309,9 @@ struct CPUArchState {
>      uint64_t mfromhost;
>      uint64_t mtohost;
>
> +    /* Sstc CSRs */
> +    uint64_t stimecmp;
> +
>      /* physical memory protection */
>      pmp_table_t pmp_state;
>      target_ulong mseccfg;
> @@ -362,6 +365,7 @@ struct CPUArchState {
>      float_status fp_status;
>
>      /* Fields from here on are preserved across CPU reset. */
> +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> @@ -425,6 +429,7 @@ struct RISCVCPUConfig {
>      bool ext_ifencei;
>      bool ext_icsr;
>      bool ext_zihintpause;
> +    bool ext_sstc;
>      bool ext_svinval;
>      bool ext_svnapot;
>      bool ext_svpbmt;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6be5a9e9f046..ac17cf1515c0 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -206,6 +206,10 @@
>  #define CSR_STVAL           0x143
>  #define CSR_SIP             0x144
>
> +/* Sstc supervisor CSRs */
> +#define CSR_STIMECMP        0x14D
> +#define CSR_STIMECMPH       0x15D
> +
>  /* Supervisor Protection and Translation */
>  #define CSR_SPTBR           0x180
>  #define CSR_SATP            0x180
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0fb042b2fd0f..e18b000700e4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -22,6 +22,7 @@
>  #include "qemu/timer.h"
>  #include "cpu.h"
>  #include "pmu.h"
> +#include "time_helper.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/cpu-timers.h"
> @@ -803,6 +804,72 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException sstc(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    /*
> +     * No need of separate function for rv32 as menvcfg stores both menvcfg
> +     * menvcfgh for RV32.
> +     */
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
> +static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->stimecmp;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->stimecmp >> 32;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
> +    } else {
> +        env->stimecmp = val;
> +    }
> +
> +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /* Machine constants */
>
>  #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> @@ -1719,6 +1786,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>          new_val |= env->external_seip * MIP_SEIP;
>      }
>
> +    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
> +        get_field(env->menvcfg, MENVCFG_STCE)) {
> +        /* sstc extension forbids STIP & VSTIP to be writeable in mip */
> +        mask = mask & ~(MIP_STIP | MIP_VSTIP);
> +    }
> +
>      if (mask) {
>          old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
>      } else {
> @@ -3584,6 +3657,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
>      [CSR_STVAL]    = { "stval",    smode, read_stval,    write_stval    },
>      [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
> +    [CSR_STIMECMP] = { "stimecmp", sstc, read_stimecmp, write_stimecmp,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index b508b042cb73..622fface484e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -359,6 +359,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
>          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> +        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
>
>          VMSTATE_END_OF_LIST()
>      },
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 2c1975e72c4e..24893c614ee4 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -31,7 +31,8 @@ riscv_softmmu_ss.add(files(
>    'debug.c',
>    'monitor.c',
>    'machine.c',
> -  'pmu.c'
> +  'pmu.c',
> +  'time_helper.c'
>  ))
>
>  target_arch += {'riscv': riscv_ss}
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> new file mode 100644
> index 000000000000..f3fb5eac7b7b
> --- /dev/null
> +++ b/target/riscv/time_helper.c
> @@ -0,0 +1,98 @@
> +/*
> + * RISC-V timer helper implementation.
> + *
> + * Copyright (c) 2022 Rivos Inc.
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
> +#include "qemu/log.h"
> +#include "cpu_bits.h"
> +#include "time_helper.h"
> +#include "hw/intc/riscv_aclint.h"
> +
> +static void riscv_stimer_cb(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> +}
> +
> +/*
> + * Called when timecmp is written to update the QEMU timer or immediately
> + * trigger timer interrupt if mtimecmp <= current timer value.
> + */
> +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +                               uint64_t timecmp, uint64_t delta,
> +                               uint32_t timer_irq)
> +{
> +    uint64_t diff, ns_diff, next;
> +    CPURISCVState *env = &cpu->env;
> +    RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
> +    uint32_t timebase_freq = mtimer->timebase_freq;
> +    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
> +
> +    if (timecmp <= rtc_r) {
> +        /*
> +         * If we're setting an stimecmp value in the "past",
> +         * immediately raise the timer interrupt
> +         */
> +        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
> +        return;
> +    }
> +
> +    /* Clear the [V]STIP bit in mip */
> +    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> +
> +    /* otherwise, set up the future timer interrupt */
> +    diff = timecmp - rtc_r;
> +    /* back to ns (note args switched in muldiv64) */
> +    ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> +
> +    /*
> +     * check if ns_diff overflowed and check if the addition would potentially
> +     * overflow
> +     */
> +    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
> +        ns_diff > INT64_MAX) {
> +        next = INT64_MAX;
> +    } else {
> +        /*
> +         * as it is very unlikely qemu_clock_get_ns will return a value
> +         * greater than INT64_MAX, no additional check is needed for an
> +         * unsigned integer overflow.
> +         */
> +        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
> +        /*
> +         * if ns_diff is INT64_MAX next may still be outside the range
> +         * of a signed integer.
> +         */
> +        next = MIN(next, INT64_MAX);
> +    }
> +
> +    timer_mod(timer, next);
> +}
> +
> +void riscv_timer_init(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env;
> +
> +    if (!cpu) {
> +        return;
> +    }
> +
> +    env = &cpu->env;
> +    env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
> +    env->stimecmp = 0;
> +
> +}
> diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> new file mode 100644
> index 000000000000..7b3cdcc35020
> --- /dev/null
> +++ b/target/riscv/time_helper.h
> @@ -0,0 +1,30 @@
> +/*
> + * RISC-V timer header file.
> + *
> + * Copyright (c) 2022 Rivos Inc.
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
> +#ifndef RISCV_TIME_HELPER_H
> +#define RISCV_TIME_HELPER_H
> +
> +#include "cpu.h"
> +#include "qemu/timer.h"
> +
> +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +                               uint64_t timecmp, uint64_t delta,
> +                               uint32_t timer_irq);
> +void riscv_timer_init(RISCVCPU *cpu);
> +
> +#endif
> --
> 2.25.1
>
>

