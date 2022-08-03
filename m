Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJLcX-0000Iz-KR
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 17:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLcV-0000Ip-GS
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:09:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLcS-0002x0-2I
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:09:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id ha11so17885681pjb.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EnvekbMMffrQdWpRsGlrVRjoL+KVGraVLCP/5qQFtQI=;
 b=VKwwK67n5+kNir0gKsElfB80051Y/77xmahCzkSbW6ErSzGvoZEMv8zmbFn/t7Zs3g
 yZYVvi13jnlniA+M7Eem5z9BNFbzpcpJWhoPtXE8qD2Q4VrunYArA0CU53uSo9L9Z9TW
 9jsJXnQdi3enT31XKUISrxVFJtvcUfJmYHpSWLWtUHpc+kvjZn03gMFHpymgZe8rxCkG
 BxJU9P6QN6pnmwIAPRDV4ppKCORrydO6QIE1+2KIGT+1HwX3MBb75T65VQBuN1TWHJTQ
 udjWyiHprBRa4fK7cLn9aj4d8gNvvy1V5x4R//uQTUJwvKMz/AaXmMTXlN22JYi8fmnD
 bF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EnvekbMMffrQdWpRsGlrVRjoL+KVGraVLCP/5qQFtQI=;
 b=lamdRArQI8owqZA8/oKU++J7r99gT/jznzlxwH9z9uFvD+fAP90z+L9f/UaHCKIQhS
 jn2M29tD+oojgw0vf8P2XG6KTmp2oM1qqfKzsxNXvpSx3AUdAbbhMyzP+bciFgzHiTqV
 M+LwLwBpqMdtPpUt8EiL0LCRGaLdKZD16hiC2q4GuiP1ThS1dbBTLSWYN4FU28RldY5T
 sKK46aPk02anM5z/ApT2zs7ZgwTQkt1jvaQ/zWZaxhuNV+fjoQUSlZ3Vc8+eWB76LX0y
 dWzzdZzAhKr4itj2Xd31gsOaMuc/Qibin1HW72VP33txmOe7SMtma9XKizipQou0THOH
 jpLA==
X-Gm-Message-State: ACgBeo2v5IAYNotwQwW+5zGRWIFAawLfLxO97/Y9tNgJ653oKq5A7uap
 oOQCgZZnkMzsbeEtlo+r85yKZPgPDHGw1/MTGBcXww==
X-Google-Smtp-Source: AA6agR7pu5QzlJ8sQwzFLh+qqVkbJse1N6AOUimnVS3tJ2SmZQhjK4eWHmEnPl2vKaYkDRaeLPE1Reh3KOG09//AVs8=
X-Received: by 2002:a17:90a:9409:b0:1f0:e171:f2bd with SMTP id
 r9-20020a17090a940900b001f0e171f2bdmr6541780pjo.245.1659560970410; Wed, 03
 Aug 2022 14:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220803082516.2271344-1-atishp@rivosinc.com>
 <20220803082516.2271344-3-atishp@rivosinc.com>
 <df4920d6-aee6-df87-2793-50c33a418244@iscas.ac.cn>
In-Reply-To: <df4920d6-aee6-df87-2793-50c33a418244@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Aug 2022 14:09:19 -0700
Message-ID: <CAHBxVyGdAfXKZbwisRfZuvn=dEBL2Ta4At13M0VDLMDsxMdLWA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] target/riscv: Add stimecmp support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001ff8b805e55ca6e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 03 Aug 2022 21:09:35 -0000

--0000000000001ff8b805e55ca6e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 3, 2022 at 1:42 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/8/3 =E4=B8=8B=E5=8D=884:25, Atish Patra =E5=86=99=E9=81=93=
:
> > stimecmp allows the supervisor mode to update stimecmp CSR directly
> > to program the next timer interrupt. This CSR is part of the Sstc
> > extension which was ratified recently.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.c         | 12 +++++
> >   target/riscv/cpu.h         |  5 ++
> >   target/riscv/cpu_bits.h    |  4 ++
> >   target/riscv/csr.c         | 81 +++++++++++++++++++++++++++++++
> >   target/riscv/machine.c     |  1 +
> >   target/riscv/meson.build   |  3 +-
> >   target/riscv/time_helper.c | 98 +++++++++++++++++++++++++++++++++++++=
+
> >   target/riscv/time_helper.h | 30 ++++++++++++
> >   8 files changed, 233 insertions(+), 1 deletion(-)
> >   create mode 100644 target/riscv/time_helper.c
> >   create mode 100644 target/riscv/time_helper.h
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d4635c7df46b..e0c3e786849f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -23,6 +23,7 @@
> >   #include "qemu/log.h"
> >   #include "cpu.h"
> >   #include "internals.h"
> > +#include "time_helper.h"
> >   #include "exec/exec-all.h"
> >   #include "qapi/error.h"
> >   #include "qemu/error-report.h"
> > @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D=
 {
> >       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f)=
,
> >       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
> >       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0,
> ext_zhinxmin),
> > +    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
> >       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0,
> ext_svinval),
> >       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0,
> ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt)=
,
> > @@ -675,6 +677,13 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >
> >       set_resetvec(env, cpu->cfg.resetvec);
> >
> > +#ifndef CONFIG_USER_ONLY
> > +    if (cpu->cfg.ext_sstc) {
> > +        riscv_timer_init(cpu);
> > +    }
> > +#endif /* CONFIG_USER_ONLY */
> > +
> > +
>
> multi blink line here.
>
>
Fixed it.


> Regards,
>
> Weiwei Li
>
> >       /* Validate that MISA_MXL is set properly. */
> >       switch (env->misa_mxl_max) {
> >   #ifdef TARGET_RISCV64
> > @@ -968,7 +977,9 @@ static void riscv_cpu_init(Object *obj)
> >   #ifndef CONFIG_USER_ONLY
> >       qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
> >                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> > +
> >   #endif /* CONFIG_USER_ONLY */
> > +
> >   }
> >
> >   static Property riscv_cpu_extensions[] =3D {
> > @@ -995,6 +1006,7 @@ static Property riscv_cpu_extensions[] =3D {
> >       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> >       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > +    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> >
> >       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >       DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0fae1569945c..4cda2905661e 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -309,6 +309,9 @@ struct CPUArchState {
> >       uint64_t mfromhost;
> >       uint64_t mtohost;
> >
> > +    /* Sstc CSRs */
> > +    uint64_t stimecmp;
> > +
> >       /* physical memory protection */
> >       pmp_table_t pmp_state;
> >       target_ulong mseccfg;
> > @@ -362,6 +365,7 @@ struct CPUArchState {
> >       float_status fp_status;
> >
> >       /* Fields from here on are preserved across CPU reset. */
> > +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> >
> >       hwaddr kernel_addr;
> >       hwaddr fdt_addr;
> > @@ -425,6 +429,7 @@ struct RISCVCPUConfig {
> >       bool ext_ifencei;
> >       bool ext_icsr;
> >       bool ext_zihintpause;
> > +    bool ext_sstc;
> >       bool ext_svinval;
> >       bool ext_svnapot;
> >       bool ext_svpbmt;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 6be5a9e9f046..ac17cf1515c0 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -206,6 +206,10 @@
> >   #define CSR_STVAL           0x143
> >   #define CSR_SIP             0x144
> >
> > +/* Sstc supervisor CSRs */
> > +#define CSR_STIMECMP        0x14D
> > +#define CSR_STIMECMPH       0x15D
> > +
> >   /* Supervisor Protection and Translation */
> >   #define CSR_SPTBR           0x180
> >   #define CSR_SATP            0x180
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 0fb042b2fd0f..b71e2509b64f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -22,6 +22,7 @@
> >   #include "qemu/timer.h"
> >   #include "cpu.h"
> >   #include "pmu.h"
> > +#include "time_helper.h"
> >   #include "qemu/main-loop.h"
> >   #include "exec/exec-all.h"
> >   #include "sysemu/cpu-timers.h"
> > @@ -803,6 +804,76 @@ static RISCVException read_timeh(CPURISCVState
> *env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException sstc(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (env->priv =3D=3D PRV_M) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (env->priv !=3D PRV_S) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
>
> This check seems unnecessary here. Stimecmp is a S mode  csr. So any
> priv less than S
>
> mode will trigger exception in csrrw related check and cannot reach here.
>
>
Yeah. We can remove it.


> And maybe we need call smode predicate for it in this function.
>
>
You mean at the end instead of returning RISCV_EXCP_NONE ? We can do that.


> > +    /*
> > +     * No need of separate function for rv32 as menvcfg stores both
> menvcfg
> > +     * menvcfgh for RV32.
> > +     */
> > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> > +          get_field(env->menvcfg, MENVCFG_STCE))) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val =3D env->stimecmp;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val =3D env->stimecmp >> 32;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        env->stimecmp =3D deposit64(env->stimecmp, 0, 32, (uint64_t)va=
l);
> > +    } else {
> > +        env->stimecmp =3D val;
> > +    }
> > +
> > +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0,
> MIP_STIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    env->stimecmp =3D deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> > +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0,
> MIP_STIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   /* Machine constants */
> >
> >   #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP=
))
> > @@ -1719,6 +1790,12 @@ static RISCVException rmw_mip64(CPURISCVState
> *env, int csrno,
> >           new_val |=3D env->external_seip * MIP_SEIP;
> >       }
> >
> > +    if (cpu->cfg.ext_sstc && (env->priv =3D=3D PRV_M) &&
> > +        get_field(env->menvcfg, MENVCFG_STCE)) {
> > +        /* sstc extension forbids STIP & VSTIP to be writeable in mip =
*/
> > +        mask =3D mask & ~(MIP_STIP | MIP_VSTIP);
> > +    }
> > +
> >       if (mask) {
> >           old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask))=
;
> >       } else {
> > @@ -3584,6 +3661,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >       [CSR_SCAUSE]   =3D { "scause",   smode, read_scause,   write_scau=
se
>  },
> >       [CSR_STVAL]    =3D { "stval",    smode, read_stval,    write_stva=
l
>   },
> >       [CSR_SIP]      =3D { "sip",      smode, NULL,    NULL, rmw_sip
>   },
> > +    [CSR_STIMECMP] =3D { "stimecmp", sstc, read_stimecmp, write_stimec=
mp,
> > +                                          .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> > +    [CSR_STIMECMPH] =3D { "stimecmph", sstc, read_stimecmph,
> write_stimecmph,
> > +                                          .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >
> >       /* Supervisor Protection and Translation */
> >       [CSR_SATP]     =3D { "satp",     smode, read_satp,     write_satp
>  },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index b508b042cb73..622fface484e 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -359,6 +359,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> >           VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > +        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
> >
> >           VMSTATE_END_OF_LIST()
> >       },
> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> > index 2c1975e72c4e..24893c614ee4 100644
> > --- a/target/riscv/meson.build
> > +++ b/target/riscv/meson.build
> > @@ -31,7 +31,8 @@ riscv_softmmu_ss.add(files(
> >     'debug.c',
> >     'monitor.c',
> >     'machine.c',
> > -  'pmu.c'
> > +  'pmu.c',
> > +  'time_helper.c'
> >   ))
> >
> >   target_arch +=3D {'riscv': riscv_ss}
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > new file mode 100644
> > index 000000000000..f3fb5eac7b7b
> > --- /dev/null
> > +++ b/target/riscv/time_helper.c
> > @@ -0,0 +1,98 @@
> > +/*
> > + * RISC-V timer helper implementation.
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "cpu_bits.h"
> > +#include "time_helper.h"
> > +#include "hw/intc/riscv_aclint.h"
> > +
> > +static void riscv_stimer_cb(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> > +}
> > +
> > +/*
> > + * Called when timecmp is written to update the QEMU timer or
> immediately
> > + * trigger timer interrupt if mtimecmp <=3D current timer value.
> > + */
> > +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > +                               uint64_t timecmp, uint64_t delta,
> > +                               uint32_t timer_irq)
> > +{
> > +    uint64_t diff, ns_diff, next;
> > +    CPURISCVState *env =3D &cpu->env;
> > +    RISCVAclintMTimerState *mtimer =3D env->rdtime_fn_arg;
> > +    uint32_t timebase_freq =3D mtimer->timebase_freq;
> > +    uint64_t rtc_r =3D env->rdtime_fn(env->rdtime_fn_arg) + delta;
> > +
> > +    if (timecmp <=3D rtc_r) {
> > +        /*
> > +         * If we're setting an stimecmp value in the "past",
> > +         * immediately raise the timer interrupt
> > +         */
> > +        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
> > +        return;
> > +    }
> > +
> > +    /* Clear the [V]STIP bit in mip */
> > +    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> > +
> > +    /* otherwise, set up the future timer interrupt */
> > +    diff =3D timecmp - rtc_r;
> > +    /* back to ns (note args switched in muldiv64) */
> > +    ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > +
> > +    /*
> > +     * check if ns_diff overflowed and check if the addition would
> potentially
> > +     * overflow
> > +     */
> > +    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
> > +        ns_diff > INT64_MAX) {
> > +        next =3D INT64_MAX;
> > +    } else {
> > +        /*
> > +         * as it is very unlikely qemu_clock_get_ns will return a valu=
e
> > +         * greater than INT64_MAX, no additional check is needed for a=
n
> > +         * unsigned integer overflow.
> > +         */
> > +        next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
> > +        /*
> > +         * if ns_diff is INT64_MAX next may still be outside the range
> > +         * of a signed integer.
> > +         */
> > +        next =3D MIN(next, INT64_MAX);
> > +    }
> > +
> > +    timer_mod(timer, next);
> > +}
> > +
> > +void riscv_timer_init(RISCVCPU *cpu)
> > +{
> > +    CPURISCVState *env;
> > +
> > +    if (!cpu) {
> > +        return;
> > +    }
> > +
> > +    env =3D &cpu->env;
> > +    env->stimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb,
> cpu);
> > +    env->stimecmp =3D 0;
> > +
> > +}
> > diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> > new file mode 100644
> > index 000000000000..7b3cdcc35020
> > --- /dev/null
> > +++ b/target/riscv/time_helper.h
> > @@ -0,0 +1,30 @@
> > +/*
> > + * RISC-V timer header file.
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef RISCV_TIME_HELPER_H
> > +#define RISCV_TIME_HELPER_H
> > +
> > +#include "cpu.h"
> > +#include "qemu/timer.h"
> > +
> > +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > +                               uint64_t timecmp, uint64_t delta,
> > +                               uint32_t timer_irq);
> > +void riscv_timer_init(RISCVCPU *cpu);
> > +
> > +#endif
>
>

--0000000000001ff8b805e55ca6e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 3, 2022 at 1:42 AM Weiwei=
 Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/8/3 =E4=B8=8B=E5=8D=884:25, Atish Patra =E5=86=99=E9=81=93:<=
br>
&gt; stimecmp allows the supervisor mode to update stimecmp CSR directly<br=
>
&gt; to program the next timer interrupt. This CSR is part of the Sstc<br>
&gt; extension which was ratified recently.<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +=
++++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 81 +=
++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0target/riscv/meson.build=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/time_helper.h | 30 ++++++++++++<br>
&gt;=C2=A0 =C2=A08 files changed, 233 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 target/riscv/time_helper.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 target/riscv/time_helper.h<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index d4635c7df46b..e0c3e786849f 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -23,6 +23,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;internals.h&quot;<br>
&gt; +#include &quot;time_helper.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/error-report.h&quot;<br>
&gt; @@ -99,6 +100,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSIO=
N_1_12_0, ext_zve64f),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION=
_1_12_0, ext_zhinx),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERS=
ION_1_12_0, ext_zhinxmin),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext=
_sstc),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSI=
ON_1_12_0, ext_svinval),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSI=
ON_1_12_0, ext_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSIO=
N_1_12_0, ext_svpbmt),<br>
&gt; @@ -675,6 +677,13 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0set_resetvec(env, cpu-&gt;cfg.resetvec);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_sstc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_timer_init(cpu);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif /* CONFIG_USER_ONLY */<br>
&gt; +<br>
&gt; +<br>
<br>
multi blink line here.<br>
<br></blockquote><div><br></div><div>Fixed it.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Validate that MISA_MXL is set properly. *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (env-&gt;misa_mxl_max) {<br>
&gt;=C2=A0 =C2=A0#ifdef TARGET_RISCV64<br>
&gt; @@ -968,7 +977,9 @@ static void riscv_cpu_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0#ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set=
_irq,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif /* CONFIG_USER_ONLY */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static Property riscv_cpu_extensions[] =3D {<br>
&gt; @@ -995,6 +1006,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zve64f&quot;, RISCVCP=
U, cfg.ext_zve64f, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;mmu&quot;, RISCVCPU, =
cfg.mmu, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;pmp&quot;, RISCVCPU, =
cfg.pmp, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;sstc&quot;, RISCVCPU, cfg.ext_ss=
tc, true),<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;priv_spec&quot;, RI=
SCVCPU, cfg.priv_spec),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;vext_spec&quot;, RI=
SCVCPU, cfg.vext_spec),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 0fae1569945c..4cda2905661e 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -309,6 +309,9 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mfromhost;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mtohost;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Sstc CSRs */<br>
&gt; +=C2=A0 =C2=A0 uint64_t stimecmp;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* physical memory protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmp_table_t pmp_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mseccfg;<br>
&gt; @@ -362,6 +365,7 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float_status fp_status;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved across =
CPU reset. */<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *stimer; /* Internal timer for S-mode interru=
pt */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr kernel_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr fdt_addr;<br>
&gt; @@ -425,6 +429,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zihintpause;<br>
&gt; +=C2=A0 =C2=A0 bool ext_sstc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svinval;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svnapot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_svpbmt;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index 6be5a9e9f046..ac17cf1515c0 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -206,6 +206,10 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x143<br>
&gt;=C2=A0 =C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x144<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Sstc supervisor CSRs */<br>
&gt; +#define CSR_STIMECMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x14D<br>
&gt; +#define CSR_STIMECMPH=C2=A0 =C2=A0 =C2=A0 =C2=A00x15D<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
&gt;=C2=A0 =C2=A0#define CSR_SPTBR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x180<br>
&gt;=C2=A0 =C2=A0#define CSR_SATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x180<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 0fb042b2fd0f..b71e2509b64f 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -22,6 +22,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;pmu.h&quot;<br>
&gt; +#include &quot;time_helper.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
&gt; @@ -803,6 +804,76 @@ static RISCVException read_timeh(CPURISCVState *e=
nv, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static RISCVException sstc(CPURISCVState *env, int csrno)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sstc || !env-&gt;rdtime_fn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;priv !=3D PRV_S) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
This check seems unnecessary here. Stimecmp is a S mode=C2=A0 csr. So any <=
br>
priv less than S<br>
<br>
mode will trigger exception in csrrw related check and cannot reach here.<b=
r>
<br></blockquote><div><br></div><div>Yeah. We can remove it.=C2=A0</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
And maybe we need call smode predicate for it in this function.<br>
<br></blockquote><div><br></div><div>You mean at the end instead of returni=
ng=C2=A0RISCV_EXCP_NONE ? We can do that.</div><div>=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* No need of separate function for rv32 as menvcf=
g stores both menvcfg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* menvcfgh for RV32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!(get_field(env-&gt;mcounteren, COUNTEREN_TM) &amp;=
&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;menvcfg, MENVCFG=
_STCE))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_stimecmp(CPURISCVState *env, int csrno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_stimecmph(CPURISCVState *env, int csrno,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp &gt;&gt; 32;<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_stimecmp(CPURISCVState *env, int csrno,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;stimecmp =3D deposit64(env-&gt;st=
imecmp, 0, 32, (uint64_t)val);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;stimecmp =3D val;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;stimer, env-&gt;=
stimecmp, 0, MIP_STIP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_stimecmph(CPURISCVState *env, int csrno,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 env-&gt;stimecmp =3D deposit64(env-&gt;stimecmp, 32, 32=
, (uint64_t)val);<br>
&gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;stimer, env-&gt;=
stimecmp, 0, MIP_STIP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Machine constants */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define M_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_MSIP | MIP=
_MTIP | MIP_MEIP))<br>
&gt; @@ -1719,6 +1790,12 @@ static RISCVException rmw_mip64(CPURISCVState *=
env, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_val |=3D env-&gt;external_=
seip * MIP_SEIP;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_sstc &amp;&amp; (env-&gt;priv =3D=
=3D PRV_M) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;menvcfg, MENVCFG_STCE))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sstc extension forbids STIP &amp; VSTI=
P to be writeable in mip */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D mask &amp; ~(MIP_STIP | MIP_VSTI=
P);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mask) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip =3D riscv_cpu_update_m=
ip(cpu, mask, (new_val &amp; mask));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -3584,6 +3661,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_SCAUSE]=C2=A0 =C2=A0=3D { &quot;scause&=
quot;,=C2=A0 =C2=A0smode, read_scause,=C2=A0 =C2=A0write_scause=C2=A0 =C2=
=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_STVAL]=C2=A0 =C2=A0 =3D { &quot;stval&q=
uot;,=C2=A0 =C2=A0 smode, read_stval,=C2=A0 =C2=A0 write_stval=C2=A0 =C2=A0=
 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_SIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;si=
p&quot;,=C2=A0 =C2=A0 =C2=A0 smode, NULL,=C2=A0 =C2=A0 NULL, rmw_sip=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_STIMECMP] =3D { &quot;stimecmp&quot;, sstc, read_s=
timecmp, write_stimecmp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_STIMECMPH] =3D { &quot;stimecmph&quot;, sstc, read=
_stimecmph, write_stimecmph,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Supervisor Protection and Translation */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_SATP]=C2=A0 =C2=A0 =C2=A0=3D { &quot;sa=
tp&quot;,=C2=A0 =C2=A0 =C2=A0smode, read_satp,=C2=A0 =C2=A0 =C2=A0write_sat=
p=C2=A0 =C2=A0 =C2=A0},<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index b508b042cb73..622fface484e 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -359,6 +359,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mscratch, R=
ISCVCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mfromhost, =
RISCVCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mtohost, RI=
SCVCPU),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.stimecmp, RISCVCPU),<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; diff --git a/target/riscv/meson.build b/target/riscv/meson.build<br>
&gt; index 2c1975e72c4e..24893c614ee4 100644<br>
&gt; --- a/target/riscv/meson.build<br>
&gt; +++ b/target/riscv/meson.build<br>
&gt; @@ -31,7 +31,8 @@ riscv_softmmu_ss.add(files(<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;debug.c&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;monitor.c&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;machine.c&#39;,<br>
&gt; -=C2=A0 &#39;pmu.c&#39;<br>
&gt; +=C2=A0 &#39;pmu.c&#39;,<br>
&gt; +=C2=A0 &#39;time_helper.c&#39;<br>
&gt;=C2=A0 =C2=A0))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0target_arch +=3D {&#39;riscv&#39;: riscv_ss}<br>
&gt; diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000000..f3fb5eac7b7b<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/time_helper.c<br>
&gt; @@ -0,0 +1,98 @@<br>
&gt; +/*<br>
&gt; + * RISC-V timer helper implementation.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;cpu_bits.h&quot;<br>
&gt; +#include &quot;time_helper.h&quot;<br>
&gt; +#include &quot;hw/intc/riscv_aclint.h&quot;<br>
&gt; +<br>
&gt; +static void riscv_stimer_cb(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Called when timecmp is written to update the QEMU timer or immedia=
tely<br>
&gt; + * trigger timer interrupt if mtimecmp &lt;=3D current timer value.<b=
r>
&gt; + */<br>
&gt; +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t timecmp, uint64_t delta,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t timer_irq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t diff, ns_diff, next;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 RISCVAclintMTimerState *mtimer =3D env-&gt;rdtime_fn_ar=
g;<br>
&gt; +=C2=A0 =C2=A0 uint32_t timebase_freq =3D mtimer-&gt;timebase_freq;<br=
>
&gt; +=C2=A0 =C2=A0 uint64_t rtc_r =3D env-&gt;rdtime_fn(env-&gt;rdtime_fn_=
arg) + delta;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (timecmp &lt;=3D rtc_r) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we&#39;re setting an stimecmp =
value in the &quot;past&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* immediately raise the timer inter=
rupt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, timer_irq, BOOL=
_TO_MASK(1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Clear the [V]STIP bit in mip */<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* otherwise, set up the future timer interrupt */<br>
&gt; +=C2=A0 =C2=A0 diff =3D timecmp - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 /* back to ns (note args switched in muldiv64) */<br>
&gt; +=C2=A0 =C2=A0 ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, time=
base_freq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* check if ns_diff overflowed and check if the ad=
dition would potentially<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* overflow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((NANOSECONDS_PER_SECOND &gt; timebase_freq &amp;&am=
p; ns_diff &lt; diff) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_diff &gt; INT64_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D INT64_MAX;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as it is very unlikely qemu_clock=
_get_ns will return a value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* greater than INT64_MAX, no additi=
onal check is needed for an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unsigned integer overflow.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL) + ns_diff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if ns_diff is INT64_MAX next may =
still be outside the range<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of a signed integer.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D MIN(next, INT64_MAX);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 timer_mod(timer, next);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void riscv_timer_init(RISCVCPU *cpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!cpu) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 env-&gt;stimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &am=
p;riscv_stimer_cb, cpu);<br>
&gt; +=C2=A0 =C2=A0 env-&gt;stimecmp =3D 0;<br>
&gt; +<br>
&gt; +}<br>
&gt; diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000000..7b3cdcc35020<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/time_helper.h<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +/*<br>
&gt; + * RISC-V timer header file.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef RISCV_TIME_HELPER_H<br>
&gt; +#define RISCV_TIME_HELPER_H<br>
&gt; +<br>
&gt; +#include &quot;cpu.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +<br>
&gt; +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t timecmp, uint64_t delta,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t timer_irq);<br>
&gt; +void riscv_timer_init(RISCVCPU *cpu);<br>
&gt; +<br>
&gt; +#endif<br>
<br>
</blockquote></div></div>

--0000000000001ff8b805e55ca6e7--

