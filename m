Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6uPX-0006rO-Je
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 08:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n6uPV-0006nx-JD
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 08:08:29 -0500
Received: from [2607:f8b0:4864:20::102f] (port=42687
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n6uPR-0007vq-VM
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 08:08:29 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso15890054pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Jan 2022 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E2siM23rLYm/2G9JWr6JsdZnAbbds4fQLcscg9a0kAM=;
 b=e75K7H4NPEXymmHCgdmZt6EZ2Za5jXIxXuH8+JtJWBPpaQNGFqMVnKekHtzX9R/w+S
 uehhntiwPAYxqxo7AxURjN/hOH9aoyGYxAyFntI6Mn4DgCLFtf+8rPyn6WJ4WG/odeux
 qBAWkVK31uq1HJqxuGAPMem/ZPazKZmzKsvtRkDEqsMsRAZnLfd8CfSWcfva16N8M34H
 y8cdKYFZD8nC3TLBGolTUCCl/5Ik+jd2scz37FTbtSCUJfZPjUWS6yKyZeo4zoRNmPYv
 THf+jBU6ylFhmVs+cI/To6LleBHbhSftA/EaLCS1BS1KwOhpVW8hSQ5EMDtmBxjFBQEi
 1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E2siM23rLYm/2G9JWr6JsdZnAbbds4fQLcscg9a0kAM=;
 b=O8Dph9GzRseq1JnZdMPyeOF8z0xfriyguY17b1Any4c99sfc616npn0OqtlpJDbvYZ
 h20JtfJdE8df8mMFtJeLd/wMrQf0A+7s+P+2wdXU8yYC/8acHo25hYtzvyi5P44vDOKb
 MycYKxhxflfS68CEnTusxcrr+DwsiukGI89sEeSv8pLNFUz22snaf/Q7y+ndL78fOpPp
 Ei8xPoq4y8SgChz6DUywQeKSOO3G4D8KSh5W7La8ltS2yWkigc5K5zFlP6DpBUGQ0IE2
 PJQDc/5Z0yWFkm+gins6sD9dTwX1qAU+Y5psEOMABaHIhbPh26Kk8V0Unq4JoRxFLd6r
 49xg==
X-Gm-Message-State: AOAM532CdmOfr3Q4N1gpKXpQrQT2aGth9tIwB0B+0nmICQY1N347LxSn
 RhM7cNPMX6sGNWj+28qDm4MWYCUZXjvPXA==
X-Google-Smtp-Source: ABdhPJxmBjohLIm3Ij1B4O7NNYAPNUANwc+RXIzNOuvq70kNeOQf65X/Glmqf4de3JiwbUD9uOOrYg==
X-Received: by 2002:a63:7f17:: with SMTP id a23mr7684326pgd.203.1641820103705; 
 Mon, 10 Jan 2022 05:08:23 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178])
 by smtp.gmail.com with ESMTPSA id s30sm6935333pfw.195.2022.01.10.05.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:08:22 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id q14so11841493plx.4;
 Mon, 10 Jan 2022 05:08:22 -0800 (PST)
X-Received: by 2002:a17:902:ced2:b0:149:2f04:e00c with SMTP id
 d18-20020a170902ced200b001492f04e00cmr73743569plg.13.1641820101734; Mon, 10
 Jan 2022 05:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-10-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-10-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 10 Jan 2022 21:08:10 +0800
X-Gmail-Original-Message-ID: <CANzO1D0XZ1SfNKHp9sd+FKMt40N3RXO92XbqbjiFq=DUAp18NQ@mail.gmail.com>
Message-ID: <CANzO1D0XZ1SfNKHp9sd+FKMt40N3RXO92XbqbjiFq=DUAp18NQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f2f68205d53a07fc"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 13:08:30 -0000

--000000000000f2f68205d53a07fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=BC=9A

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
>  target/riscv/cpu.c        |  19 ++++
>  target/riscv/cpu.h        |  12 ++
>  target/riscv/cpu_helper.c | 231 ++++++++++++++++++++++++++++++++++----
>  target/riscv/machine.c    |   3 +
>  4 files changed, 244 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9f1a4d1088..9ad26035e1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVState *env,
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
> @@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceState *dev)
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
> index 02f3ef2c3c..140fabfdf9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -182,6 +182,10 @@ struct CPURISCVState {
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
> @@ -194,6 +198,9 @@ struct CPURISCVState {
>      target_ulong hgeip;
>      uint64_t htimedelta;
>
> +    /* Hypervisor controlled virtual interrupt priorities */
> +    uint8_t hviprio[64];
> +
>      /* Virtual CSRs */
>      /*
>       * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
> @@ -379,6 +386,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction
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
> index f94a36fa89..e3532de4cf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -151,36 +151,225 @@ void cpu_get_tb_cpu_state(CPURISCVState *env,
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
> +            prio =3D (riscv_cpu_default_priority(irq) < IPRIO_DEFAULT_M)=
 ?
> +                   1 : IPRIO_MMAXIPRIO;
>

Hi Anup,

I have a question regarding configuring priorities of major interrupts.

riscv_cpu_default_priority() for M-mode external interrupt would return
IPRIO_DEFAULT_M (8).
but the comparison here is < IPRIO_DEFAULT_M,
so if M-mode external interrupt is pending, the prio would be assigned to
IPRIO_MMAXIPRIO (255).
Is this the expected behavior?

Also, why is IPRIO_DEFAULT_M been compared?
Should IPRIO_DEFAULT_S and IPRIO_DEFAULT_VS be used for S-mode and VS-mode
interrupts?


> +        }
> +        if ((pending & 0x1) && (prio < best_prio)) {
>

If both interrupt 63 and 62 are pending-and-enabled,
with their iprio values both assigned to zero.
Interrupt 62 would be picked, because best_prio will be 1 when interrupt 62
is been checked.
As the default priority order for interrupt 63 is also less than
IPRIO_DEFAULT_M (8),
so prio would be assigned to 1 as well.
But as prio is not less than best_prio, so best_irq would still be
interrupt 62.

However, according to the default priority table in AIA spec,
interrupt 63 should have a higher priority than interrupt 62:
  Interrupt 63 has the highest default priority, and interrupt 32 has the
lowest default priority.


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

Yet I have another question for major interrupts priorities.

According to AIA spec (v0.2-draft.28):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The priority number for a machine-level external interrupt (bits 31:24 of
register iprio2)
must also be read-only zero.

When an interrupt=E2=80=99s priority number in the array is zero (either re=
ad-only
zero or set to zero),
its priority is the default order from Section 6.1.
Setting an interrupt=E2=80=99s priority number instead to a nonzero value p=
 gives
that interrupt nominally
the same priority as a machine-level external interrupt with priority
number p.
For a major interrupt that defaults to a higher priority than machine
external interrupts,
setting its priority number to a nonzero value lowers its priority.
For a major interrupt that defaults to a lower priority than machine
external interrupts,
setting its priority number to a nonzero value raises its priority.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

From the above sentences,
The M-mode external interrupt has iprio value of 0, so the default priority
order is applied.

What are the priorities for the major interrupt interrupts which are
higher/lower than
M-mode external interrupt when their iprio values are not 0?

Which interrupt will be picked when:
  M-mode external interrupt is pending-and-enabled,
  Interrupt with higher default priority than M-mode external interrupt is
pending-and-enabled, and
  Interrupt with lower default priority than M-mode external interrupt is
pending-and-enabled/

From the above riscv_cpu_pending_to_irq(),
If both interrupt 63 and interrupt 18's iprio values are assigned to the
value of 10,
and interrupt 63, interrupt 18 and M-mode external interrupts are
pending-and-enabled.
Interrupt 18 would be picked.
Is this the correct expectation?
I'm a bit confused with the correct priority order of the interrupts
with/without non-zero value iprio and the default priority.

Thanks,
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
> +    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> +}
> +
> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> +}
> +
> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> +{
> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> +
> +    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
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
> +        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> +    }
> +
> +    /* Check HS-mode interrupts */
> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> +    if (irqs) {
> +        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> +    }
> +
> +    /* Check VS-mode interrupts */
> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> +    if (irqs) {
> +        virq =3D riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
> +        return (virq <=3D 0) ? virq : virq + 1;
> +    }
> +
> +    /* Indicate no pending interrupt */
> +    return RISCV_EXCP_NONE;
>  }
>
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 76dd0d415c..cffc444969 100644
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
> @@ -173,6 +174,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
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

--000000000000f2f68205d53a07fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=
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
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 ++++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0target/riscv/cpu_helper.c | 231 ++++++++++++++++++++++++++++++++++---=
-<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A04 files changed, 244 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 9f1a4d1088..9ad26035e1 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVState *env, Translat=
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
@@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceState *dev)<br>
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
index 02f3ef2c3c..140fabfdf9 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -182,6 +182,10 @@ struct CPURISCVState {<br>
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
@@ -194,6 +198,9 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hgeip;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t htimedelta;<br>
<br>
+=C2=A0 =C2=A0 /* Hypervisor controlled virtual interrupt priorities */<br>
+=C2=A0 =C2=A0 uint8_t hviprio[64];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Virtual CSRs */<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * For RV32 this is 32-bit vsstatus and 32-bit vsstatus=
h.<br>
@@ -379,6 +386,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f=
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
index f94a36fa89..e3532de4cf 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -151,36 +151,225 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D (riscv_cpu_default_prio=
rity(irq) &lt; IPRIO_DEFAULT_M) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 : I=
PRIO_MMAXIPRIO;<br></blockquote><div><br></div><div>Hi Anup,</div><div><br>=
</div><div>I have a question regarding configuring priorities of major inte=
rrupts.</div><div><br></div><div>riscv_cpu_default_priority() for M-mode ex=
ternal interrupt would return IPRIO_DEFAULT_M (8).</div><div>but the compar=
ison here is &lt; IPRIO_DEFAULT_M,</div><div>so if M-mode external interrup=
t is pending, the prio would be assigned to IPRIO_MMAXIPRIO (255).</div><di=
v>Is this the expected behavior?</div><div><br></div><div>Also, why is IPRI=
O_DEFAULT_M been compared?</div><div>Should IPRIO_DEFAULT_S and IPRIO_DEFAU=
LT_VS be used for S-mode and VS-mode interrupts?</div><div>=C2=A0<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pending &amp; 0x1) &amp;&amp; (prio &lt; =
best_prio)) {<br></blockquote><div><br></div><div>If both interrupt 63 and =
62 are pending-and-enabled,</div><div>with their iprio values both assigned=
 to zero.</div><div>Interrupt 62 would be picked, because best_prio will be=
 1 when interrupt 62 is been checked.</div><div>As the default priority ord=
er for interrupt 63 is also less than IPRIO_DEFAULT_M (8),</div><div>so pri=
o would be assigned to 1 as well.</div><div>But as prio is not less than be=
st_prio, so best_irq would still be interrupt 62.</div><div><br></div><div>=
However, according to the default priority table in AIA spec,</div><div>int=
errupt 63 should have a higher priority than interrupt 62:</div><div>=C2=A0=
=C2=A0Interrupt 63 has the highest default
priority, and interrupt 32 has the lowest default priority.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_prio =3D prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pending =3D pending &gt;&gt; 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return best_irq;<br>
+}<br></blockquote><div><br></div><div>Yet I have another question for majo=
r interrupts priorities.</div><div><br></div><div>According to AIA spec (v0=
.2-draft.28):</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div>The pr=
iority number for a machine-level external interrupt (bits 31:24 of registe=
r
iprio2)</div><div>must also be read-only zero.<br></div><div><br></div><div=
>When an interrupt=E2=80=99s priority number in the array is zero (either r=
ead-only
zero or set to zero),</div><div>its priority is the default order from Sect=
ion 6.1.<br></div><div>Setting an interrupt=E2=80=99s priority
number instead to a nonzero value p gives that interrupt nominally</div><di=
v>the same priority as a machine-level external interrupt with priority num=
ber p.<br></div><div><div>For a major interrupt that defaults to a higher p=
riority than machine external interrupts,</div><div>setting its priority nu=
mber to a nonzero value lowers its priority.<br></div><div>For a major inte=
rrupt that defaults to a lower priority than machine external interrupts,</=
div><div>setting its priority number to a nonzero value raises its priority=
.</div></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div><br></div><d=
iv>From the above sentences,<br></div><div>The M-mode external interrupt ha=
s iprio value of 0, so the default priority order is applied.</div><div><br=
></div><div>What are the priorities for the major interrupt interrupts whic=
h are higher/lower than<br></div><div>M-mode external interrupt when their =
iprio values are not 0?</div><div><br></div><div>Which interrupt will be pi=
cked=C2=A0when:</div><div>=C2=A0 M-mode external interrupt is pending-and-e=
nabled,</div><div>=C2=A0 Interrupt with higher default priority than M-mode=
 external interrupt is pending-and-enabled, and</div><div>=C2=A0 Interrupt =
with lower default priority than M-mode external interrupt is pending-and-e=
nabled/<br></div><div><br></div><div>From the above riscv_cpu_pending_to_ir=
q(),</div><div>If both interrupt 63 and interrupt 18&#39;s iprio values are=
 assigned to the value of 10,</div><div>and interrupt 63, interrupt 18 and =
M-mode external interrupts are pending-and-enabled.</div><div>Interrupt 18 =
would be picked.</div><div>Is this the correct expectation?</div><div>I&#39=
;m a bit confused with the correct priority order of the interrupts with/wi=
thout non-zero value iprio and the default priority.<br></div><div><br></di=
v><div>Thanks,</div><div>Frank Chang</div><div>=C2=A0<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs, env-&gt;miprio);<=
br>
+}<br>
+<br>
+int riscv_cpu_sirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~(MI=
P_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs, env-&gt;siprio);<=
br>
+}<br>
+<br>
+int riscv_cpu_vsirq_pending(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; env-&gt;m=
ideleg &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MIP=
_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
+<br>
+=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs &gt;&gt; 1, env-&g=
t;hviprio);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs, env=
-&gt;miprio);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check HS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; ~env-&gt;hidele=
g &amp; -hsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs, env=
-&gt;siprio);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Check VS-mode interrupts */<br>
+=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; env-&gt;hideleg=
 &amp; -vsie;<br>
+=C2=A0 =C2=A0 if (irqs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virq =3D riscv_cpu_pending_to_irq(env, irqs &g=
t;&gt; 1, env-&gt;hviprio);<br>
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
index 76dd0d415c..cffc444969 100644<br>
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
@@ -173,6 +174,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
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

--000000000000f2f68205d53a07fc--

