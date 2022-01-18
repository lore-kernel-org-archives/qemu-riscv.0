Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fGV-00019K-B8
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 22:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fGN-00012Q-13
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:34:28 -0500
Received: from [2607:f8b0:4864:20::1030] (port=36495
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fGJ-0005iI-Qq
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:34:26 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so1062904pja.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bfOsQge8mS/cIEWJOezAxdTK82pPiVlqE8kT8G1TnI=;
 b=QkvqDV6S1zm8WC9C9a2qyryvMEgFSGS30fM3AwbBj+gIdabnuCYJK647OfQGDm5Dvr
 aWea6+BSDZbM1RdbHReJqnpri97nYJfXApT0hsfGirR+IJNjlBmGTcRAxhvQI53n1U5b
 irWWQVhXUXliHenBptiGERgmRXISq9y3g2dAk1hudCKERTf6TQT6qkNpYdw92UFYtr8f
 eSjrZgfIwbfEfVY4LSHMx8eCkyDydVADMiO14B/me1otwUiXGwu8pzmKepHiD1JBsPlZ
 PPXx9tWb7Hzfy/sxZgQ9NVuO0p+HRY5/f0yFGHo57vKWfInK9CYQBp0YyaQo5Q8pF5Lk
 nFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bfOsQge8mS/cIEWJOezAxdTK82pPiVlqE8kT8G1TnI=;
 b=EtuYscmCW2g2m2jAookUU3tHYEQVtug+kn+MFi78I7iPsk9PwPq6xBlDZcjr504poH
 SvLN5si8a9DIQ6+ZelyPnxYaoaQVIqrIiXhJTQTDCOcuKvxL2SgzNcKuZf/nSBbLzGco
 lfBp/IN13UGKkpBKX2w+KRloQ+qTRNrliHADGbKkyP3mMvpZdYzBsvLLmgVOP0574pE9
 j7YoXkxRbCBt4MpkUb2qrh+dhQeCQ9ZJIsuQYhE8vUFjrlhqprXlOr69k0TeG8xzjpQm
 PARSYuu6G4nl5IF/DzqwM0X4lZoWDIK7FsyNARtTbGUSeVP5ebOsXEZ8sM8UbnPVjKog
 T5JQ==
X-Gm-Message-State: AOAM531lg5grx0L5ewbofiwzGZSUzwtDFXuE0sfXoQUuExDmSzOez5Iu
 awL2ntV1v+JK4i8ecTXOgLd144G/3/kcsoS2
X-Google-Smtp-Source: ABdhPJzMxEypA7Hj1qy96C1+I8NxkDTfbRHXOyJ8qdqD33F9L0rH53/PSbbaYA6BTfhqTb0zNYocEA==
X-Received: by 2002:a17:903:1207:b0:14a:83bd:394d with SMTP id
 l7-20020a170903120700b0014a83bd394dmr22195074plh.102.1642476861779; 
 Mon, 17 Jan 2022 19:34:21 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48])
 by smtp.gmail.com with ESMTPSA id v7sm706480pfu.218.2022.01.17.19.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 19:34:20 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so1593602pjp.0; 
 Mon, 17 Jan 2022 19:34:20 -0800 (PST)
X-Received: by 2002:a17:902:dad1:b0:14a:59cd:b0b8 with SMTP id
 q17-20020a170902dad100b0014a59cdb0b8mr25070711plx.13.1642476860046; Mon, 17
 Jan 2022 19:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20220117132826.426418-1-anup@brainfault.org>
 <20220117132826.426418-10-anup@brainfault.org>
In-Reply-To: <20220117132826.426418-10-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 18 Jan 2022 11:34:09 +0800
X-Gmail-Original-Message-ID: <CANzO1D2OXSvhYgNKJSNTJaF7g5oJoP6pVj-+K+wWz0uWkQvbLw@mail.gmail.com>
Message-ID: <CANzO1D2OXSvhYgNKJSNTJaF7g5oJoP6pVj-+K+wWz0uWkQvbLw@mail.gmail.com>
Subject: Re: [PATCH v7 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cb83bf05d5d2f15c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 03:34:28 -0000

--000000000000cb83bf05d5d2f15c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2022=E5=B9=B41=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA spec defines programmable 8-bit priority for each local interrupt
> at M-level, S-level and VS-level so we extend local interrupt processing
> to consider AIA interrupt priorities. The AIA CSRs which help software
> configure local interrupt priorities will be added by subsequent patches.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  19 +++
>  target/riscv/cpu.h        |  12 ++
>  target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++++++++----
>  target/riscv/machine.c    |   3 +
>  4 files changed, 255 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 76f9786836..167d86eef7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env,
> TranslationBlock *tb,
>
>  static void riscv_cpu_reset(DeviceState *dev)
>  {
> +#ifndef CONFIG_USER_ONLY
> +    uint8_t iprio;
> +    int i, irq, rdzero;
> +#endif
>      CPUState *cs =3D CPU(dev);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> @@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->miclaim =3D MIP_SGEIP;
>      env->pc =3D env->resetvec;
>      env->two_stage_lookup =3D false;
> +
> +    /* Initialized default priorities of local interrupts. */
> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> +        iprio =3D riscv_cpu_default_priority(i);
> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
> +        env->hviprio[i] =3D 0;
> +    }
> +    i =3D 0;
> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> +        if (!rdzero) {
> +            env->hviprio[irq] =3D env->miprio[irq];
> +        }
> +        i++;
> +    }
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cee70f8608..65d2b606fc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -190,6 +190,10 @@ struct CPURISCVState {
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
>
> +    /* Machine and Supervisor interrupt priorities */
> +    uint8_t miprio[64];
> +    uint8_t siprio[64];
> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -202,6 +206,9 @@ struct CPURISCVState {
>      target_ulong hgeip;
>      uint64_t htimedelta;
>
> +    /* Hypervisor controlled virtual interrupt priorities */
> +    uint8_t hviprio[64];
> +
>      /* Upper 64-bits of 128-bit CSRs */
>      uint64_t mscratchh;
>      uint64_t sscratchh;
> @@ -392,6 +399,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction
> f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
);
> +uint8_t riscv_cpu_default_priority(int irq);
> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59c8f900df..3a36200780 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *env,
> target_ulong *pc,
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> +
> +/*
> + * The HS-mode is allowed to configure priority only for the
> + * following VS-mode local interrupts:
> + *
> + * 0  (Reserved interrupt, reads as zero)
> + * 1  Supervisor software interrupt
> + * 4  (Reserved interrupt, reads as zero)
> + * 5  Supervisor timer interrupt
> + * 8  (Reserved interrupt, reads as zero)
> + * 13 (Reserved interrupt)
> + * 14 "
> + * 15 "
> + * 16 "
> + * 18 Debug/trace interrupt
> + * 20 (Reserved interrupt)
> + * 22 "
> + * 24 "
> + * 26 "
> + * 28 "
> + * 30 (Reserved for standard reporting of bus or system errors)
> + */
> +
> +static int hviprio_index2irq[] =3D
> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> +static int hviprio_index2rdzero[] =3D
> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
> +
> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
)
>  {
> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
> +        return -EINVAL;
> +    }
> +
> +    if (out_irq) {
> +        *out_irq =3D hviprio_index2irq[index];
> +    }
>
> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
> +    if (out_rdzero) {
> +        *out_rdzero =3D hviprio_index2rdzero[index];
> +    }
>
> -    target_ulong vsgemask =3D
> -                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN=
);
> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
> +    return 0;
> +}
>
> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
> +uint8_t riscv_cpu_default_priority(int irq)
> +{
> +    int u, l;
> +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
>
> -    target_ulong mie    =3D env->priv < PRV_M ||
> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
> -    target_ulong sie    =3D env->priv < PRV_S ||
> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
> -    target_ulong hsie   =3D virt_enabled || sie;
> -    target_ulong vsie   =3D virt_enabled && sie;
> +    if (irq < 0 || irq > 63) {
> +        return iprio;
> +    }
>
> -    target_ulong irqs =3D
> -            (pending & ~env->mideleg & -mie) |
> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> -            (pending &  env->mideleg &  env->hideleg & -vsie);
> +    /*
> +     * Default priorities of local interrupts are defined in the
> +     * RISC-V Advanced Interrupt Architecture specification.
> +     *
> +     * ----------------------------------------------------------------
> +     *  Default  |
> +     *  Priority | Major Interrupt Numbers
> +     * ----------------------------------------------------------------
> +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
> +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
> +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
> +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
> +     *           |
> +     *           | 11 (0b),  3 (03),  7 (07)
> +     *           |  9 (09),  1 (01),  5 (05)
> +     *           | 12 (0c)
> +     *           | 10 (0a),  2 (02),  6 (06)
> +     *           |
> +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
> +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
> +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
> +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
> +     * ----------------------------------------------------------------
> +     */
>
> -    if (irqs) {
> -        return ctz64(irqs); /* since non-zero */
> +    u =3D IPRIO_DEFAULT_U(irq);
> +    l =3D IPRIO_DEFAULT_L(irq);
> +    if (u =3D=3D 0) {
> +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
> +            irq =3D=3D IRQ_VS_SOFT) {
> +            iprio =3D IPRIO_DEFAULT_VS;
> +        } else if (irq =3D=3D IRQ_S_GEXT) {
> +            iprio =3D IPRIO_DEFAULT_SGEXT;
> +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER ||
> +                   irq =3D=3D IRQ_S_SOFT) {
> +            iprio =3D IPRIO_DEFAULT_S;
> +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER ||
> +                   irq =3D=3D IRQ_M_SOFT) {
> +            iprio =3D IPRIO_DEFAULT_M;
> +        } else {
> +            iprio =3D IPRIO_DEFAULT_VS;
> +        }
> +    } else if (u =3D=3D 1) {
> +        if (l < 8) {
> +            iprio =3D IPRIO_DEFAULT_16_23(irq);
> +        } else {
> +            iprio =3D IPRIO_DEFAULT_24_31(irq);
> +        }
> +    } else if (u =3D=3D 2) {
> +        iprio =3D IPRIO_DEFAULT_32_47(irq);
> +    } else if (u =3D=3D 3) {
> +        iprio =3D IPRIO_DEFAULT_48_63(irq);
> +    }
> +
> +    return iprio;
> +}
> +
> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> +                                    int extirq, unsigned int
> extirq_def_prio,
> +                                    uint64_t pending, uint8_t *iprio)
> +{
> +    int irq, best_irq =3D RISCV_EXCP_NONE;
> +    unsigned int prio, best_prio =3D UINT_MAX;
> +
> +    if (!pending) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    irq =3D ctz64(pending);
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return irq;
> +    }
> +
> +    pending =3D pending >> irq;
> +    while (pending) {
> +        prio =3D iprio[irq];
> +        if (!prio) {
> +            if (irq =3D=3D extirq) {
> +                prio =3D extirq_def_prio;
> +            } else {
> +                prio =3D (riscv_cpu_default_priority(irq) <
> extirq_def_prio) ?
> +                       1 : IPRIO_MMAXIPRIO;
> +            }
> +        }
> +        if ((pending & 0x1) && (prio <=3D best_prio)) {
> +            best_irq =3D irq;
> +            best_prio =3D prio;
> +        }
> +        irq++;
> +        pending =3D pending >> 1;
> +    }
> +
> +    return best_irq;
> +}
>

Hi Anup,

RISC-V Priv spec defines the priority order:
  Multiple simultaneous interrupts destined for the same privilege mode
  are handled in the following decreasing priority order: MEI, MSI, MTI,
SEI, SSI, STI, UEI,
  USI, UTI.

So the priority order should be: MEI (11) > MSI (3) > MTI (7).

But if MSI and MTI are pending-and-enabled,
with all of their iprio assigned to their default priority orders
(IPRIO_DEFAULT_M)
(or iprio assigned to zero, which the default priority orders are applied
as well).
riscv_cpu_pending_to_irq() would incorrectly pick MTI (7), instead of MSI
(3),
because they all have the same default priority order: IPRIO_DEFAULT_M.

Regards,
Frank Chang


> +
> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> +{
> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +
> +    return (env->mip | vsgein) & env->mie;
> +}
> +
> +int riscv_cpu_mirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +                                    irqs, env->miprio);
> +}
> +
> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    irqs, env->siprio);
> +}
> +
> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                    irqs >> 1, env->hviprio);
> +}
> +
> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> +{
> +    int virq;
> +    uint64_t irqs, pending, mie, hsie, vsie;
> +
> +    /* Determine interrupt enable state of all privilege modes */
> +    if (riscv_cpu_virt_enabled(env)) {
> +        mie =3D 1;
> +        hsie =3D 1;
> +        vsie =3D (env->priv < PRV_S) ||
> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
>      } else {
> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
> +        mie =3D (env->priv < PRV_M) ||
> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus,
> MSTATUS_MIE));
> +        hsie =3D (env->priv < PRV_S) ||
> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> +        vsie =3D 0;
>      }
> +
> +    /* Determine all pending interrupts */
> +    pending =3D riscv_cpu_all_pending(env);
> +
> +    /* Check M-mode interrupts */
> +    irqs =3D pending & ~env->mideleg & -mie;
> +    if (irqs) {
> +        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> +                                        irqs, env->miprio);
> +    }
> +
> +    /* Check HS-mode interrupts */
> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> +    if (irqs) {
> +        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> +                                        irqs, env->siprio);
> +    }
> +
> +    /* Check VS-mode interrupts */
> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> +    if (irqs) {
> +        virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_=
S,
> +                                        irqs >> 1, env->hviprio);
> +        return (virq <=3D 0) ? virq : virq + 1;
> +    }
> +
> +    /* Indicate no pending interrupt */
> +    return RISCV_EXCP_NONE;
>  }
>
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c11eb4639c..bae4f69725 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>
>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> @@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
>          VMSTATE_UINTTL(env.pc, RISCVCPU),
>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
> --
> 2.25.1
>
>
>

--000000000000cb83bf05d5d2f15c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2022=E5=B9=B41=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA spec defines programmable 8-bit priority for each local interrupt<b=
r>
at M-level, S-level and VS-level so we extend local interrupt processing<br=
>
to consider AIA interrupt priorities. The AIA CSRs which help software<br>
configure local interrupt priorities will be added by subsequent patches.<b=
r>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++++++++---=
-<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 255 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 76f9786836..167d86eef7 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env, Translat=
ionBlock *tb,<br>
<br>
=C2=A0static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0{<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 uint8_t iprio;<br>
+=C2=A0 =C2=A0 int i, irq, rdzero;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(dev);<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);<br>
@@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;miclaim =3D MIP_SGEIP;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;pc =3D env-&gt;resetvec;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;two_stage_lookup =3D false;<br>
+<br>
+=C2=A0 =C2=A0 /* Initialized default priorities of local interrupts. */<br=
>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(env-&gt;miprio); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D riscv_cpu_default_priority(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0=
 : iprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0=
 : iprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[i] =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 i =3D 0;<br>
+=C2=A0 =C2=A0 while (!riscv_cpu_hviprio_index2irq(i, &amp;irq, &amp;rdzero=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[irq] =3D env-&gt=
;miprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0/* mmte is supposed to have pm.current hardwired to 1 *=
/<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);=
<br>
=C2=A0#endif<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index cee70f8608..65d2b606fc 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -190,6 +190,10 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcause;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */<br>
<br>
+=C2=A0 =C2=A0 /* Machine and Supervisor interrupt priorities */<br>
+=C2=A0 =C2=A0 uint8_t miprio[64];<br>
+=C2=A0 =C2=A0 uint8_t siprio[64];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor CSRs */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hstatus;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hedeleg;<br>
@@ -202,6 +206,9 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hgeip;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t htimedelta;<br>
<br>
+=C2=A0 =C2=A0 /* Hypervisor controlled virtual interrupt priorities */<br>
+=C2=A0 =C2=A0 uint8_t hviprio[64];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Upper 64-bits of 128-bit CSRs */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mscratchh;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t sscratchh;<br>
@@ -392,6 +399,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f=
, CPUState *cs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cpuid, void *opaque);<br>
=C2=A0int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);=
<br>
+uint8_t riscv_cpu_default_priority(int irq);<br>
+int riscv_cpu_mirq_pending(CPURISCVState *env);<br>
+int riscv_cpu_sirq_pending(CPURISCVState *env);<br>
+int riscv_cpu_vsirq_pending(CPURISCVState *env);<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
=C2=A0target_ulong riscv_cpu_get_geilen(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);<b=
r>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 59c8f900df..3a36200780 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
+<br>
+/*<br>
+ * The HS-mode is allowed to configure priority only for the<br>
+ * following VS-mode local interrupts:<br>
+ *<br>
+ * 0=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 1=C2=A0 Supervisor software interrupt<br>
+ * 4=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 5=C2=A0 Supervisor timer interrupt<br>
+ * 8=C2=A0 (Reserved interrupt, reads as zero)<br>
+ * 13 (Reserved interrupt)<br>
+ * 14 &quot;<br>
+ * 15 &quot;<br>
+ * 16 &quot;<br>
+ * 18 Debug/trace interrupt<br>
+ * 20 (Reserved interrupt)<br>
+ * 22 &quot;<br>
+ * 24 &quot;<br>
+ * 26 &quot;<br>
+ * 28 &quot;<br>
+ * 30 (Reserved for standard reporting of bus or system errors)<br>
+ */<br>
+<br>
+static int hviprio_index2irq[] =3D<br>
+=C2=A0 =C2=A0 { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 =
};<br>
+static int hviprio_index2rdzero[] =3D<br>
+=C2=A0 =C2=A0 { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };<br>
+<br>
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)<=
br>
=C2=A0{<br>
-=C2=A0 =C2=A0 target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);<b=
r>
+=C2=A0 =C2=A0 if (index &lt; 0 || ARRAY_SIZE(hviprio_index2irq) &lt;=3D in=
dex) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (out_irq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_irq =3D hviprio_index2irq[index];<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt;mstatus, MSTA=
TUS_MIE);<br>
-=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env-&gt;mstatus, MSTA=
TUS_SIE);<br>
+=C2=A0 =C2=A0 if (out_rdzero) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_rdzero =3D hviprio_index2rdzero[index];<b=
r>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong vsgemask =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_ulong)1 &l=
t;&lt; get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
-=C2=A0 =C2=A0 target_ulong vsgein =3D (env-&gt;hgeip &amp; vsgemask) ? MIP=
_VSEIP : 0;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
<br>
-=C2=A0 =C2=A0 target_ulong pending =3D (env-&gt;mip | vsgein) &amp; env-&g=
t;mie;<br>
+uint8_t riscv_cpu_default_priority(int irq)<br>
+{<br>
+=C2=A0 =C2=A0 int u, l;<br>
+=C2=A0 =C2=A0 uint8_t iprio =3D IPRIO_MMAXIPRIO;<br>
<br>
-=C2=A0 =C2=A0 target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;priv &lt; PRV_M ||=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_mie);<br>
-=C2=A0 =C2=A0 target_ulong sie=C2=A0 =C2=A0 =3D env-&gt;priv &lt; PRV_S ||=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; mstatus_sie);<br>
-=C2=A0 =C2=A0 target_ulong hsie=C2=A0 =C2=A0=3D virt_enabled || sie;<br>
-=C2=A0 =C2=A0 target_ulong vsie=C2=A0 =C2=A0=3D virt_enabled &amp;&amp; si=
e;<br>
+=C2=A0 =C2=A0 if (irq &lt; 0 || irq &gt; 63) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return iprio;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 target_ulong irqs =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp; ~env-&gt;mideleg =
&amp; -mie) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 env-&gt;mid=
eleg &amp; ~env-&gt;hideleg &amp; -hsie) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 env-&gt;mid=
eleg &amp;=C2=A0 env-&gt;hideleg &amp; -vsie);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Default priorities of local interrupts are defined i=
n the<br>
+=C2=A0 =C2=A0 =C2=A0* RISC-V Advanced Interrupt Architecture specification=
.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* ----------------------------------------------------=
------------<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 Default=C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 Priority | Major Interrupt Numbers<br>
+=C2=A0 =C2=A0 =C2=A0* ----------------------------------------------------=
------------<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 Highest=C2=A0 | 63 (3f), 62 (3e), 31 (1f), 30 =
(1e), 61 (3d), 60 (3c),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 (3b), 5=
8 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 55 (37), 5=
4 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 (33), 5=
0 (32), 25 (19), 24 (18), 49 (31), 48 (30)<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 (0b),=
=C2=A0 3 (03),=C2=A0 7 (07)<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 (0=
9),=C2=A0 1 (01),=C2=A0 5 (05)<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 (0c)<br=
>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 (0a),=
=C2=A0 2 (02),=C2=A0 6 (06)<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 47 (2f), 4=
6 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 (2b), 4=
2 (2a), 21 (15), 20 (14), 41 (29), 40 (28),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 (27), 3=
8 (26), 19 (13), 18 (12), 37 (25), 36 (24),<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 Lowest=C2=A0 =C2=A0| 35 (23), 34 (22), 17 (11)=
, 16 (10), 33 (21), 32 (20)<br>
+=C2=A0 =C2=A0 =C2=A0* ----------------------------------------------------=
------------<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
-=C2=A0 =C2=A0 if (irqs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctz64(irqs); /* since non-zero */<br>
+=C2=A0 =C2=A0 u =3D IPRIO_DEFAULT_U(irq);<br>
+=C2=A0 =C2=A0 l =3D IPRIO_DEFAULT_L(irq);<br>
+=C2=A0 =C2=A0 if (u =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS=
_TIMER ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D=3D IRQ_VS_SOFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_VS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_GEXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_SGEXT;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D =
IRQ_S_TIMER ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =
=3D=3D IRQ_S_SOFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D =
IRQ_M_TIMER ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =
=3D=3D IRQ_M_SOFT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_VS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (u =3D=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &lt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_16_23(ir=
q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_24_31(ir=
q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (u =3D=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_32_47(irq);<br>
+=C2=A0 =C2=A0 } else if (u =3D=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_48_63(irq);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return iprio;<br>
+}<br>
+<br>
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int extirq, unsigned i=
nt extirq_def_prio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t pending, uint=
8_t *iprio)<br>
+{<br>
+=C2=A0 =C2=A0 int irq, best_irq =3D RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 unsigned int prio, best_prio =3D UINT_MAX;<br>
+<br>
+=C2=A0 =C2=A0 if (!pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 irq =3D ctz64(pending);<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 pending =3D pending &gt;&gt; irq;<br>
+=C2=A0 =C2=A0 while (pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D iprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!prio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D extirq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D extirq_de=
f_prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D (riscv_cp=
u_default_priority(irq) &lt; extirq_def_prio) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01 : IPRIO_MMAXIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pending &amp; 0x1) &amp;&amp; (prio &lt;=
=3D best_prio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_prio =3D prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pending =3D pending &gt;&gt; 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return best_irq;<br>
+}<br></blockquote><div><br></div><div>Hi Anup,</div><div><br></div><div><d=
iv>RISC-V Priv spec defines the priority order:</div><div>=C2=A0 Multiple s=
imultaneous interrupts destined for the same privilege mode</div><div>=C2=
=A0 are handled in the following decreasing priority order: MEI, MSI, MTI, =
SEI, SSI, STI, UEI,<br>=C2=A0 USI, UTI.<br></div><div><br></div><div>So the=
 priority order should be: MEI (11) &gt; MSI (3) &gt; MTI (7).</div><div><b=
r></div><div>But if MSI and MTI are pending-and-enabled,</div><div>with all=
 of their iprio assigned to their default priority orders (IPRIO_DEFAULT_M)=
</div><div>(or iprio assigned to zero, which the default priority orders ar=
e applied as well).</div><div>riscv_cpu_pending_to_irq() would incorrectly =
pick MTI (7), instead of MSI (3),</div><div>because they all have the same =
default priority order: IPRIO_DEFAULT_M.<br></div><div><br></div><div>Regar=
ds,<br></div><div>Frank Chang</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+<br>
+static uint64_t riscv_cpu_all_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t gein =3D get_field(env-&gt;hstatus, HSTATUS_VGEIN);=
<br>
+=C2=A0 =C2=A0 uint64_t vsgein =3D (env-&gt;hgeip &amp; (1ULL &lt;&lt; gein=
)) ? MIP_VSEIP : 0;<br>
+<br>
+=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&gt;mie;<br>
+}<br>
+<br>
+int riscv_cpu_mirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; ~env-&gt;=
mideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(MI=
P_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAUL=
T_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&gt;miprio);=
<br>
+}<br>
+<br>
+int riscv_cpu_sirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(MI=
P_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAUL=
T_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&gt;siprio);=
<br>
+}<br>
+<br>
+int riscv_cpu_vsirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MIP=
_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAUL=
T_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs &gt;&gt; 1, env-&=
gt;hviprio);<br>
+}<br>
+<br>
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 int virq;<br>
+=C2=A0 =C2=A0 uint64_t irqs, pending, mie, hsie, vsie;<br>
+<br>
+=C2=A0 =C2=A0 /* Determine interrupt enable state of all privilege modes *=
/<br>
+=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D (env-&gt;priv &lt; PRV_S) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE; /* indicates no pendin=
g interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D (env-&gt;priv &lt; PRV_M) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_=
M &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_MIE));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D (env-&gt;priv &lt; PRV_S) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 /* Determine all pending interrupts */<br>
+=C2=A0 =C2=A0 pending =3D riscv_cpu_all_pending(env);<br>
+<br>
+=C2=A0 =C2=A0 /* Check M-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; ~env-&gt;mideleg &amp; -mie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_M_EXT=
, IPRIO_DEFAULT_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, en=
v-&gt;miprio);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check HS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; ~env-&gt;hidele=
g &amp; -hsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT=
, IPRIO_DEFAULT_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, en=
v-&gt;siprio);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check VS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; env-&gt;hideleg=
 &amp; -vsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_E=
XT, IPRIO_DEFAULT_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs &gt=
;&gt; 1, env-&gt;hviprio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (virq &lt;=3D 0) ? virq : virq + 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Indicate no pending interrupt */<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br=
>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index c11eb4639c..bae4f69725 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeie, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.hgeip, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.htimedelta, RISCVCPU),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64)=
,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.vsstatus, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.vstvec, RISCVCPU),<br>
@@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 3=
2),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 3=
2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.pc, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.load_res, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.load_val, RISCVCPU),<b=
r>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000cb83bf05d5d2f15c--

