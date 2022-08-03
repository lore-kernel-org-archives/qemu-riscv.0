Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJLYj-0006Ol-Jl
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 17:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLYh-0006Nz-W4
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:05:40 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJLYd-0002RJ-3E
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 17:05:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id f28so9315104pfk.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=N+c5QClZl0t4s9fgWrfUBet6YdvZeQKotltmzQFMnAA=;
 b=4URT1S91rCI59hAlKpmFfgATqVOT+cW0NSMosIB5+qgnb2kfmGprpXv3QvxtlRi3/i
 dato2MdnlQCU94WDzBsNY4F6bl99meWenJR4oBRB8Z8aGhRLwHUZ+qdHWn9quW6SuSbn
 rLDd9ijgvyVG6IFD3msOXCojkPTWUcsSveAMNukV5rOE1xJuCqZIZ5u7vn450deFFYEM
 44rTfm0eUxBXOKIza+5L73023Iuvdb7h1ATemhWB72HLxooQW0oMxAM+C4lC0dl6swj9
 pzubRioDUHckxHHhABQ01QOH3SkX+N7B1CSEvPc+f2n1ou0cxDHQvjAJBl5fRKqEMkb7
 HFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=N+c5QClZl0t4s9fgWrfUBet6YdvZeQKotltmzQFMnAA=;
 b=rxrSuUaH7IGdMKPBPQ9KNwVnGc1Kdcisv8Ydzv1gwEUJhKUsjpyp4LmSPimS52ItHN
 2WBgFoyNnHvo7ZuL4fz99XH31ffgho0OEkbHEnO79X4hS1FMkrU8pyoc8wDSrfcwRtnx
 3JR/YNyv73Ggjdp6p5gNk2g1uC+gnn2dt/GiTwQrDTpndexWOMLNmB9KhKLlAz1tHmgw
 bpI9NpAtzL0HBmbbAqSgi0tPvVg5fQSZUj/l4Xg/r4fq5CSzkWywge8vFpFqnOvjxHg9
 JpEWWQmc4HQHd/OTcCCKRl/nliboFNqkbKZy16USIwAcqPxxXV+oZ2Sy/B0BZ4tmwpA/
 aCoA==
X-Gm-Message-State: ACgBeo3w1ZdGdwmS/xQLcTmxT0touzn8T+DWnwnipyQM2kJruX5FAn9F
 5az4TOZG7DGatvfwW8DtY5KW2VJUNals2Hz6GuXATA==
X-Google-Smtp-Source: AA6agR5lShqas5mS8rDwIrp74xJE8/KNAd/w0tuyfeL2dioq2b76eBfqEphMXg55j8va6NOVhfd0cMcEaIchSU1qDJw=
X-Received: by 2002:a65:578f:0:b0:41c:62a0:6b61 with SMTP id
 b15-20020a65578f000000b0041c62a06b61mr8198664pgr.88.1659560732280; Wed, 03
 Aug 2022 14:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220803082516.2271344-1-atishp@rivosinc.com>
 <20220803082516.2271344-4-atishp@rivosinc.com>
 <60a8a67a-04d9-e6b7-e606-1001fda76f41@iscas.ac.cn>
In-Reply-To: <60a8a67a-04d9-e6b7-e606-1001fda76f41@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Aug 2022 14:05:21 -0700
Message-ID: <CAHBxVyGh5o+B_jWWh3F06zP_R8=MWhB1wsBL=AKfbXG-bhMdag@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] target/riscv: Add vstimecmp support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ee626105e55c9787"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 21:05:40 -0000

--000000000000ee626105e55c9787
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 3, 2022 at 1:49 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/8/3 =E4=B8=8B=E5=8D=884:25, Atish Patra =E5=86=99=E9=81=93=
:
> > vstimecmp CSR allows the guest OS or to program the next guest timer
> > interrupt directly. Thus, hypervisor no longer need to inject the
> > timer interrupt to the guest if vstimecmp is used. This was ratified
> > as a part of the Sstc extension.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.h         |   4 ++
> >   target/riscv/cpu_bits.h    |   4 ++
> >   target/riscv/cpu_helper.c  |  11 ++--
> >   target/riscv/csr.c         | 100 ++++++++++++++++++++++++++++++++++++=
-
> >   target/riscv/machine.c     |   1 +
> >   target/riscv/time_helper.c |  16 ++++++
> >   6 files changed, 131 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 4cda2905661e..1fd382b2717f 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -312,6 +312,8 @@ struct CPUArchState {
> >       /* Sstc CSRs */
> >       uint64_t stimecmp;
> >
> > +    uint64_t vstimecmp;
> > +
> >       /* physical memory protection */
> >       pmp_table_t pmp_state;
> >       target_ulong mseccfg;
> > @@ -366,6 +368,8 @@ struct CPUArchState {
> >
> >       /* Fields from here on are preserved across CPU reset. */
> >       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> > +    bool vstime_irq;
> >
> >       hwaddr kernel_addr;
> >       hwaddr fdt_addr;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index ac17cf1515c0..095dab19f512 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -257,6 +257,10 @@
> >   #define CSR_VSIP            0x244
> >   #define CSR_VSATP           0x280
> >
> > +/* Sstc virtual CSRs */
> > +#define CSR_VSTIMECMP       0x24D
> > +#define CSR_VSTIMECMPH      0x25D
> > +
> >   #define CSR_MTINST          0x34a
> >   #define CSR_MTVAL2          0x34b
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 650574accf0a..1e4faa84e839 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> >   {
> >       uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> >       uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0=
;
> > +    uint64_t vstip =3D (env->vstime_irq) ? MIP_VSTIP : 0;
> >
> > -    return (env->mip | vsgein) & env->mie;
> > +    return (env->mip | vsgein | vstip) & env->mie;
> >   }
> >
> >   int riscv_cpu_mirq_pending(CPURISCVState *env)
> > @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
> uint64_t mask, uint64_t value)
> >   {
> >       CPURISCVState *env =3D &cpu->env;
> >       CPUState *cs =3D CPU(cpu);
> > -    uint64_t gein, vsgein =3D 0, old =3D env->mip;
> > +    uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env->mip;
> >       bool locked =3D false;
> >
> >       if (riscv_cpu_virt_enabled(env)) {
> > @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
> uint64_t mask, uint64_t value)
> >           vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> >       }
> >
> > +    /* No need to update mip for VSTIP */
> > +    mask =3D ((mask =3D=3D MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> > +    vstip =3D env->vstime_irq ? MIP_VSTIP : 0;
> > +
> >       if (!qemu_mutex_iothread_locked()) {
> >           locked =3D true;
> >           qemu_mutex_lock_iothread();
> > @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
> uint64_t mask, uint64_t value)
> >
> >       env->mip =3D (env->mip & ~mask) | (value & mask);
> >
> > -    if (env->mip | vsgein) {
> > +    if (env->mip | vsgein | vstip) {
> >           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> >       } else {
> >           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index b71e2509b64f..d4265dd3cca2 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -833,17 +833,98 @@ static RISCVException sstc(CPURISCVState *env, in=
t
> csrno)
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
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
> > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
> > +          get_field(env->menvcfg, MENVCFG_STCE))) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> > +          get_field(env->henvcfg, HENVCFG_STCE))) {
> > +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +    }
> > +
> I think hcounteren only works for VS mode here. So we should add check
> for virt  mode is enabled here.
>

vstimecmp can be accessed from HS mode as well. In fact if STCE bit is
disabled in henvcfg,
hypervisor can emulate sstc behavior as well.


> > +    return RISCV_EXCP_NONE;
> > +}
>
> It's better to return hmode(env, csrno) instead of RISCV_EXCP_NONE here.
>
>
Sure. Will change it.


> Regards,
>
> Weiwei Li
>
> > +
> > +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val =3D env->vstimecmp;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val =3D env->vstimecmp >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        env->vstimecmp =3D deposit64(env->vstimecmp, 0, 32,
> (uint64_t)val);
> > +    } else {
> > +        env->vstimecmp =3D val;
> > +    }
> > +
> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> > +                              env->htimedelta, MIP_VSTIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    env->vstimecmp =3D deposit64(env->vstimecmp, 32, 32, (uint64_t)val=
);
> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> > +                              env->htimedelta, MIP_VSTIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
> >                                       target_ulong *val)
> >   {
> > -    *val =3D env->stimecmp;
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        *val =3D env->vstimecmp;
> > +    } else {
> > +        *val =3D env->stimecmp;
> > +    }
> > +
> >       return RISCV_EXCP_NONE;
> >   }
> >
> >   static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> >                                       target_ulong *val)
> >   {
> > -    *val =3D env->stimecmp >> 32;
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        *val =3D env->vstimecmp >> 32;
> > +    } else {
> > +        *val =3D env->stimecmp >> 32;
> > +    }
> > +
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > @@ -852,6 +933,10 @@ static RISCVException write_stimecmp(CPURISCVState
> *env, int csrno,
> >   {
> >       RISCVCPU *cpu =3D env_archcpu(env);
> >
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        return write_vstimecmp(env, csrno, val);
> > +    }
> > +
> >       if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> >           env->stimecmp =3D deposit64(env->stimecmp, 0, 32, (uint64_t)v=
al);
> >       } else {
> > @@ -868,6 +953,10 @@ static RISCVException write_stimecmph(CPURISCVStat=
e
> *env, int csrno,
> >   {
> >       RISCVCPU *cpu =3D env_archcpu(env);
> >
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        return write_vstimecmph(env, csrno, val);
> > +    }
> > +
> >       env->stimecmp =3D deposit64(env->stimecmp, 32, 32, (uint64_t)val)=
;
> >       riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0,
> MIP_STIP);
> >
> > @@ -1805,6 +1894,7 @@ static RISCVException rmw_mip64(CPURISCVState
> *env, int csrno,
> >       if (csrno !=3D CSR_HVIP) {
> >           gin =3D get_field(env->hstatus, HSTATUS_VGEIN);
> >           old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VS=
EIP
> : 0;
> > +        old_mip |=3D env->vstime_irq ? MIP_VSTIP : 0;
> >       }
> >
> >       if (ret_val) {
> > @@ -3665,6 +3755,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >                                             .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_STIMECMPH] =3D { "stimecmph", sstc, read_stimecmph,
> write_stimecmph,
> >                                             .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTIMECMP] =3D { "vstimecmp", sstc_hmode, read_vstimecmp,
> > +                                          write_vstimecmp,
> > +                                          .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTIMECMPH] =3D { "vstimecmph", sstc_hmode, read_vstimecmph,
> > +                                          write_vstimecmph,
> > +                                          .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >
> >       /* Supervisor Protection and Translation */
> >       [CSR_SATP]     =3D { "satp",     smode, read_satp,     write_satp
>  },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 622fface484e..4ba55705d147 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
> >           VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >           VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> >           VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> > +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
> >
> >           VMSTATE_UINTTL(env.hvictl, RISCVCPU),
> >           VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > index f3fb5eac7b7b..8cce667dfd47 100644
> > --- a/target/riscv/time_helper.c
> > +++ b/target/riscv/time_helper.c
> > @@ -22,6 +22,14 @@
> >   #include "time_helper.h"
> >   #include "hw/intc/riscv_aclint.h"
> >
> > +static void riscv_vstimer_cb(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +    CPURISCVState *env =3D &cpu->env;
> > +    env->vstime_irq =3D 1;
> > +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> > +}
> > +
> >   static void riscv_stimer_cb(void *opaque)
> >   {
> >       RISCVCPU *cpu =3D opaque;
> > @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu,
> QEMUTimer *timer,
> >            * If we're setting an stimecmp value in the "past",
> >            * immediately raise the timer interrupt
> >            */
> > +        if (timer_irq =3D=3D MIP_VSTIP) {
> > +            env->vstime_irq =3D 1;
> > +        }
> >           riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
> >           return;
> >       }
> >
> > +    if (timer_irq =3D=3D MIP_VSTIP) {
> > +        env->vstime_irq =3D 0;
> > +    }
> >       /* Clear the [V]STIP bit in mip */
> >       riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> >
> > @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
> >       env->stimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb=
,
> cpu);
> >       env->stimecmp =3D 0;
> >
> > +    env->vstimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_c=
b,
> cpu);
> > +    env->vstimecmp =3D 0;
> >   }
>
>

--000000000000ee626105e55c9787
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 3, 2022 at 1:49 AM Weiwei=
 Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/8/3 =E4=B8=8B=E5=8D=884:25, Atish Patra =E5=86=99=E9=81=93:<=
br>
&gt; vstimecmp CSR allows the guest OS or to program the next guest timer<b=
r>
&gt; interrupt directly. Thus, hypervisor no longer need to inject the<br>
&gt; timer interrupt to the guest if vstimecmp is used. This was ratified<b=
r>
&gt; as a part of the Sstc extension.<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 |=C2=A0 =C2=A04 ++<br=
>
&gt;=C2=A0 =C2=A0target/riscv/cpu_helper.c=C2=A0 |=C2=A0 11 ++--<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 100 =
++++++++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 =C2=A0target/riscv/time_helper.c |=C2=A0 16 ++++++<br>
&gt;=C2=A0 =C2=A06 files changed, 131 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 4cda2905661e..1fd382b2717f 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -312,6 +312,8 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sstc CSRs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t stimecmp;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 uint64_t vstimecmp;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* physical memory protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmp_table_t pmp_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mseccfg;<br>
&gt; @@ -366,6 +368,8 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved across =
CPU reset. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUTimer *stimer; /* Internal timer for S-m=
ode interrupt */<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *vstimer; /* Internal timer for VS-mode inter=
rupt */<br>
&gt; +=C2=A0 =C2=A0 bool vstime_irq;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr kernel_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr fdt_addr;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index ac17cf1515c0..095dab19f512 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -257,6 +257,10 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_VSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x244<br>
&gt;=C2=A0 =C2=A0#define CSR_VSATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x280<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Sstc virtual CSRs */<br>
&gt; +#define CSR_VSTIMECMP=C2=A0 =C2=A0 =C2=A0 =C2=A00x24D<br>
&gt; +#define CSR_VSTIMECMPH=C2=A0 =C2=A0 =C2=A0 0x25D<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#define CSR_MTINST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34a=
<br>
&gt;=C2=A0 =C2=A0#define CSR_MTVAL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34b=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 650574accf0a..1e4faa84e839 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)=
<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t gein =3D get_field(env-&gt;hstatus,=
 HSTATUS_VGEIN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t vsgein =3D (env-&gt;hgeip &amp; (1U=
LL &lt;&lt; gein)) ? MIP_VSEIP : 0;<br>
&gt; +=C2=A0 =C2=A0 uint64_t vstip =3D (env-&gt;vstime_irq) ? MIP_VSTIP : 0=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&gt;mie;<br>
&gt; +=C2=A0 =C2=A0 return (env-&gt;mip | vsgein | vstip) &amp; env-&gt;mie=
;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0int riscv_cpu_mirq_pending(CPURISCVState *env)<br>
&gt; @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint6=
4_t mask, uint64_t value)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
&gt; -=C2=A0 =C2=A0 uint64_t gein, vsgein =3D 0, old =3D env-&gt;mip;<br>
&gt; +=C2=A0 =C2=A0 uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env-&=
gt;mip;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool locked =3D false;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
&gt; @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint=
64_t mask, uint64_t value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vsgein =3D (env-&gt;hgeip &amp=
; (1ULL &lt;&lt; gein)) ? MIP_VSEIP : 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* No need to update mip for VSTIP */<br>
&gt; +=C2=A0 =C2=A0 mask =3D ((mask =3D=3D MIP_VSTIP) &amp;&amp; env-&gt;vs=
time_irq) ? 0 : mask;<br>
&gt; +=C2=A0 =C2=A0 vstip =3D env-&gt;vstime_irq ? MIP_VSTIP : 0;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qemu_mutex_iothread_locked()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locked =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_iothread();<br=
>
&gt; @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint6=
4_t mask, uint64_t value)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mip =3D (env-&gt;mip &amp; ~mask) | =
(value &amp; mask);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;mip | vsgein) {<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;mip | vsgein | vstip) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_interrupt(cs, CPU_INTERRUP=
T_HARD);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset_interrupt(cs, CPU_IN=
TERRUPT_HARD);<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index b71e2509b64f..d4265dd3cca2 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -833,17 +833,98 @@ static RISCVException sstc(CPURISCVState *env, i=
nt csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)<br>
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
&gt; +=C2=A0 =C2=A0 if (!(get_field(env-&gt;mcounteren, COUNTEREN_TM) &amp;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;menvcfg, MENVCFG=
_STCE))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(get_field(env-&gt;hcounteren, COUNTEREN_TM) &amp;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;henvcfg, HENVCFG=
_STCE))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
I think hcounteren only works for VS mode here. So we should add check <br>
for virt=C2=A0 mode is enabled here.<br></blockquote><div><br></div><div>vs=
timecmp can be accessed from HS mode as well. In fact if STCE bit is disabl=
ed in henvcfg,</div><div>hypervisor can emulate sstc behavior as well.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
<br>
It&#39;s better to return hmode(env, csrno) instead of RISCV_EXCP_NONE here=
.<br>
<br></blockquote><div><br></div><div>Sure. Will change it.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt; +<br>
&gt; +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp &gt;&gt; 32;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstimecmp =3D deposit64(env-&gt;v=
stimecmp, 0, 32, (uint64_t)val);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstimecmp =3D val;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;vstimer, env-&gt=
;vstimecmp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;htimedelta, MIP_VSTIP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 env-&gt;vstimecmp =3D deposit64(env-&gt;vstimecmp, 32, =
32, (uint64_t)val);<br>
&gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;vstimer, env-&gt=
;vstimecmp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;htimedelta, MIP_VSTIP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static RISCVException read_stimecmp(CPURISCVState *env, in=
t csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=
_ulong *val)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp;<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;stimecmp;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static RISCVException read_stimecmph(CPURISCVState *env, i=
nt csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=
_ulong *val)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp &gt;&gt; 32;<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp &gt;&gt; 32;<b=
r>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;stimecmp &gt;&gt; 32;<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -852,6 +933,10 @@ static RISCVException write_stimecmp(CPURISCVStat=
e *env, int csrno,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_vstimecmp(env, csrno, val);<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =3D deposit64=
(env-&gt;stimecmp, 0, 32, (uint64_t)val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -868,6 +953,10 @@ static RISCVException write_stimecmph(CPURISCVSta=
te *env, int csrno,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_vstimecmph(env, csrno, val);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =3D deposit64(env-&gt;stime=
cmp, 32, 32, (uint64_t)val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_timer_write_timecmp(cpu, env-&gt;stime=
r, env-&gt;stimecmp, 0, MIP_STIP);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1805,6 +1894,7 @@ static RISCVException rmw_mip64(CPURISCVState *e=
nv, int csrno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (csrno !=3D CSR_HVIP) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gin =3D get_field(env-&gt;hsta=
tus, HSTATUS_VGEIN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip |=3D (env-&gt;hgeip &a=
mp; ((target_ulong)1 &lt;&lt; gin)) ? MIP_VSEIP : 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_mip |=3D env-&gt;vstime_irq ? MIP_VST=
IP : 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret_val) {<br>
&gt; @@ -3665,6 +3755,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_STIMECMPH] =3D { &quot;stimecmph&quot;,=
 sstc, read_stimecmph, write_stimecmph,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_VSTIMECMP] =3D { &quot;vstimecmp&quot;, sstc_hmode=
, read_vstimecmp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 write_vstimecmp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_VSTIMECMPH] =3D { &quot;vstimecmph&quot;, sstc_hmo=
de, read_vstimecmph,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 write_vstimecmph,<br>
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
&gt; index 622fface484e..4ba55705d147 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeie, RISC=
VCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeip, RISC=
VCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.htimedelta,=
 RISCVCPU),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.vstimecmp, RISCVCPU),<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hvictl, RIS=
CVCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT8_ARRAY(env.hvipri=
o, RISCVCPU, 64),<br>
&gt; diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c<b=
r>
&gt; index f3fb5eac7b7b..8cce667dfd47 100644<br>
&gt; --- a/target/riscv/time_helper.c<br>
&gt; +++ b/target/riscv/time_helper.c<br>
&gt; @@ -22,6 +22,14 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;time_helper.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/intc/riscv_aclint.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void riscv_vstimer_cb(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 env-&gt;vstime_irq =3D 1;<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));<=
br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void riscv_stimer_cb(void *opaque)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D opaque;<br>
&gt; @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMU=
Timer *timer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If we&#39;re setting an sti=
mecmp value in the &quot;past&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediately raise the timer=
 interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (timer_irq =3D=3D MIP_VSTIP) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstime_irq =3D 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_update_mip(cpu, time=
r_irq, BOOL_TO_MASK(1));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (timer_irq =3D=3D MIP_VSTIP) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstime_irq =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear the [V]STIP bit in mip */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO=
_MASK(0));<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimer =3D timer_new_ns(QEMU_CLOCK_V=
IRTUAL, &amp;riscv_stimer_cb, cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 env-&gt;vstimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &a=
mp;riscv_vstimer_cb, cpu);<br>
&gt; +=C2=A0 =C2=A0 env-&gt;vstimecmp =3D 0;<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
</blockquote></div></div>

--000000000000ee626105e55c9787--

