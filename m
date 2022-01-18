Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fWO-0008Jg-75
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 22:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fWL-0008G0-CF
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:50:57 -0500
Received: from [2607:f8b0:4864:20::62d] (port=35631
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fWF-00087x-VT
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:50:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u15so23246076ple.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 19:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuF+Tfvqe3trrj8YXP6uluf7J5lCntcQbXhexVi1Yys=;
 b=TAurKlK0R0bg3chkH/DpL7gknG+0Rvh/l0xLOBXWXKHaqjE5X6BZ4DbYvmZmeYt/ej
 c6o2yvCUGRWScEEFj35qv1driuy1cR86AWoHw0TkXLKqreIIpkwknedqvOcY0HKqmY3c
 TGqQhE3izl5pb1azB7HDDpzeSC6poFmQaGNkPSdhO6QVRO2BCIz0IlbFiwaSNM3J/9ZZ
 9bi7VstguFpi0KaiOVEy8TovyGGFyBHbxwqlvJrtL7zo8vl3qdM/TQYNpyAYGfWdsRH6
 iwSaglcCflpdkV9aAcL2WA0S+7bsBU+2nHVX2bNKB7XeUkBc0AeMmpg8ALAyRf8frAiB
 AMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuF+Tfvqe3trrj8YXP6uluf7J5lCntcQbXhexVi1Yys=;
 b=5j8gdU974iNWUXZ7NiUKT+uJeDsub8h7srreamy5d/LNu/J6uu/ayhY9UbQvqKMdaP
 hTzBRyjkNmHFM6glC5pNxp+9t0LinPqMiGx0+JwajMg3Dn+z12G8qtcL6obe+EmZeEqG
 21Kp6ljjs1ceBrJDUr/1oiP7uu3hcuBHlfKLTUdejBMkSqAicqjs+i+UOG30q/59RC+O
 nCHGX0CWnqh9YaACGoh3hQ+w6uv4Ky9MJMli46mlmlpEMZMrVc2jwBfTr5i9tZCgGxq5
 jEfUyji+rmWM6JuMcJ1BjMGR3KLU+uDFpNYObfbd2F3HDgNzzax2VzaklroFHe/+VLcw
 SyLw==
X-Gm-Message-State: AOAM532ojgOEcloMYqqSyC3SCTx40VQX24Ej8rZPnUFD/8/Ci7K5w7WF
 mNMuiwixQzjtV35beLYPs6/+9RNnftvGCPwf
X-Google-Smtp-Source: ABdhPJyOxaOILL9Nwm0ZYpZMP+thUH7Ho8XJf9iKHAQwadGY30hxChe0uBXS3rqFPaLZ3kxA457M5Q==
X-Received: by 2002:a17:90a:eac7:: with SMTP id
 ev7mr552815pjb.235.1642477849496; 
 Mon, 17 Jan 2022 19:50:49 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181])
 by smtp.gmail.com with ESMTPSA id ip13sm744636pjb.13.2022.01.17.19.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 19:50:47 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id v2so8287281ply.11;
 Mon, 17 Jan 2022 19:50:47 -0800 (PST)
X-Received: by 2002:a17:902:b710:b0:14a:28ee:fe6b with SMTP id
 d16-20020a170902b71000b0014a28eefe6bmr25604643pls.119.1642477847020; Mon, 17
 Jan 2022 19:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20220117132826.426418-1-anup@brainfault.org>
 <20220117132826.426418-10-anup@brainfault.org>
 <CANzO1D2OXSvhYgNKJSNTJaF7g5oJoP6pVj-+K+wWz0uWkQvbLw@mail.gmail.com>
 <CAK9=C2XwwT-uu+RaNTyrODtwxinxK--z1xhPPF5nztJmyNgnkA@mail.gmail.com>
In-Reply-To: <CAK9=C2XwwT-uu+RaNTyrODtwxinxK--z1xhPPF5nztJmyNgnkA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 18 Jan 2022 11:50:36 +0800
X-Gmail-Original-Message-ID: <CANzO1D3uZaPbZ9tJc8Krg6h4N6TA=h2osoAwKX24MNPJBap=vw@mail.gmail.com>
Message-ID: <CANzO1D3uZaPbZ9tJc8Krg6h4N6TA=h2osoAwKX24MNPJBap=vw@mail.gmail.com>
Subject: Re: [PATCH v7 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Anup Patel <apatel@ventanamicro.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009f882105d5d32c2c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 03:50:57 -0000

--0000000000009f882105d5d32c2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <apatel@ventanamicro.com> =E6=96=BC 2022=E5=B9=B41=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:41=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Tue, Jan 18, 2022 at 9:04 AM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > Anup Patel <anup@brainfault.org> =E6=96=BC 2022=E5=B9=B41=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> From: Anup Patel <anup.patel@wdc.com>
> >>
> >> The AIA spec defines programmable 8-bit priority for each local
> interrupt
> >> at M-level, S-level and VS-level so we extend local interrupt processi=
ng
> >> to consider AIA interrupt priorities. The AIA CSRs which help software
> >> configure local interrupt priorities will be added by subsequent
> patches.
> >>
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  target/riscv/cpu.c        |  19 +++
> >>  target/riscv/cpu.h        |  12 ++
> >>  target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++++++++---=
-
> >>  target/riscv/machine.c    |   3 +
> >>  4 files changed, 255 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 76f9786836..167d86eef7 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env,
> TranslationBlock *tb,
> >>
> >>  static void riscv_cpu_reset(DeviceState *dev)
> >>  {
> >> +#ifndef CONFIG_USER_ONLY
> >> +    uint8_t iprio;
> >> +    int i, irq, rdzero;
> >> +#endif
> >>      CPUState *cs =3D CPU(dev);
> >>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> >>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> >> @@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)
> >>      env->miclaim =3D MIP_SGEIP;
> >>      env->pc =3D env->resetvec;
> >>      env->two_stage_lookup =3D false;
> >> +
> >> +    /* Initialized default priorities of local interrupts. */
> >> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> >> +        iprio =3D riscv_cpu_default_priority(i);
> >> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
> >> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
> >> +        env->hviprio[i] =3D 0;
> >> +    }
> >> +    i =3D 0;
> >> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> >> +        if (!rdzero) {
> >> +            env->hviprio[irq] =3D env->miprio[irq];
> >> +        }
> >> +        i++;
> >> +    }
> >>      /* mmte is supposed to have pm.current hardwired to 1 */
> >>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> >>  #endif
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index cee70f8608..65d2b606fc 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -190,6 +190,10 @@ struct CPURISCVState {
> >>      target_ulong mcause;
> >>      target_ulong mtval;  /* since: priv-1.10.0 */
> >>
> >> +    /* Machine and Supervisor interrupt priorities */
> >> +    uint8_t miprio[64];
> >> +    uint8_t siprio[64];
> >> +
> >>      /* Hypervisor CSRs */
> >>      target_ulong hstatus;
> >>      target_ulong hedeleg;
> >> @@ -202,6 +206,9 @@ struct CPURISCVState {
> >>      target_ulong hgeip;
> >>      uint64_t htimedelta;
> >>
> >> +    /* Hypervisor controlled virtual interrupt priorities */
> >> +    uint8_t hviprio[64];
> >> +
> >>      /* Upper 64-bits of 128-bit CSRs */
> >>      uint64_t mscratchh;
> >>      uint64_t sscratchh;
> >> @@ -392,6 +399,11 @@ int
> riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> >>                                 int cpuid, void *opaque);
> >>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int
> reg);
> >>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);
> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int
> *out_rdzero);
> >> +uint8_t riscv_cpu_default_priority(int irq);
> >> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> >> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
> >>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> >>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
> >>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index 59c8f900df..3a36200780 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *env,
> target_ulong *pc,
> >>  }
> >>
> >>  #ifndef CONFIG_USER_ONLY
> >> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >> +
> >> +/*
> >> + * The HS-mode is allowed to configure priority only for the
> >> + * following VS-mode local interrupts:
> >> + *
> >> + * 0  (Reserved interrupt, reads as zero)
> >> + * 1  Supervisor software interrupt
> >> + * 4  (Reserved interrupt, reads as zero)
> >> + * 5  Supervisor timer interrupt
> >> + * 8  (Reserved interrupt, reads as zero)
> >> + * 13 (Reserved interrupt)
> >> + * 14 "
> >> + * 15 "
> >> + * 16 "
> >> + * 18 Debug/trace interrupt
> >> + * 20 (Reserved interrupt)
> >> + * 22 "
> >> + * 24 "
> >> + * 26 "
> >> + * 28 "
> >> + * 30 (Reserved for standard reporting of bus or system errors)
> >> + */
> >> +
> >> +static int hviprio_index2irq[] =3D
> >> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> >> +static int hviprio_index2rdzero[] =3D
> >> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
> >> +
> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int
> *out_rdzero)
> >>  {
> >> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
> >> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    if (out_irq) {
> >> +        *out_irq =3D hviprio_index2irq[index];
> >> +    }
> >>
> >> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE)=
;
> >> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE)=
;
> >> +    if (out_rdzero) {
> >> +        *out_rdzero =3D hviprio_index2rdzero[index];
> >> +    }
> >>
> >> -    target_ulong vsgemask =3D
> >> -                (target_ulong)1 << get_field(env->hstatus,
> HSTATUS_VGEIN);
> >> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
> >> +    return 0;
> >> +}
> >>
> >> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
> >> +uint8_t riscv_cpu_default_priority(int irq)
> >> +{
> >> +    int u, l;
> >> +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
> >>
> >> -    target_ulong mie    =3D env->priv < PRV_M ||
> >> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
> >> -    target_ulong sie    =3D env->priv < PRV_S ||
> >> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
> >> -    target_ulong hsie   =3D virt_enabled || sie;
> >> -    target_ulong vsie   =3D virt_enabled && sie;
> >> +    if (irq < 0 || irq > 63) {
> >> +        return iprio;
> >> +    }
> >>
> >> -    target_ulong irqs =3D
> >> -            (pending & ~env->mideleg & -mie) |
> >> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> >> -            (pending &  env->mideleg &  env->hideleg & -vsie);
> >> +    /*
> >> +     * Default priorities of local interrupts are defined in the
> >> +     * RISC-V Advanced Interrupt Architecture specification.
> >> +     *
> >> +     * --------------------------------------------------------------=
--
> >> +     *  Default  |
> >> +     *  Priority | Major Interrupt Numbers
> >> +     * --------------------------------------------------------------=
--
> >> +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60
> (3c),
> >> +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56
> (38),
> >> +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52
> (34),
> >> +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (3=
0)
> >> +     *           |
> >> +     *           | 11 (0b),  3 (03),  7 (07)
> >> +     *           |  9 (09),  1 (01),  5 (05)
> >> +     *           | 12 (0c)
> >> +     *           | 10 (0a),  2 (02),  6 (06)
> >> +     *           |
> >> +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44
> (2c),
> >> +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40
> (28),
> >> +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36
> (24),
> >> +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (2=
0)
> >> +     * --------------------------------------------------------------=
--
> >> +     */
> >>
> >> -    if (irqs) {
> >> -        return ctz64(irqs); /* since non-zero */
> >> +    u =3D IPRIO_DEFAULT_U(irq);
> >> +    l =3D IPRIO_DEFAULT_L(irq);
> >> +    if (u =3D=3D 0) {
> >> +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
> >> +            irq =3D=3D IRQ_VS_SOFT) {
> >> +            iprio =3D IPRIO_DEFAULT_VS;
> >> +        } else if (irq =3D=3D IRQ_S_GEXT) {
> >> +            iprio =3D IPRIO_DEFAULT_SGEXT;
> >> +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER ||
> >> +                   irq =3D=3D IRQ_S_SOFT) {
> >> +            iprio =3D IPRIO_DEFAULT_S;
> >> +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER ||
> >> +                   irq =3D=3D IRQ_M_SOFT) {
> >> +            iprio =3D IPRIO_DEFAULT_M;
> >> +        } else {
> >> +            iprio =3D IPRIO_DEFAULT_VS;
> >> +        }
> >> +    } else if (u =3D=3D 1) {
> >> +        if (l < 8) {
> >> +            iprio =3D IPRIO_DEFAULT_16_23(irq);
> >> +        } else {
> >> +            iprio =3D IPRIO_DEFAULT_24_31(irq);
> >> +        }
> >> +    } else if (u =3D=3D 2) {
> >> +        iprio =3D IPRIO_DEFAULT_32_47(irq);
> >> +    } else if (u =3D=3D 3) {
> >> +        iprio =3D IPRIO_DEFAULT_48_63(irq);
> >> +    }
> >> +
> >> +    return iprio;
> >> +}
> >> +
> >> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> >> +                                    int extirq, unsigned int
> extirq_def_prio,
> >> +                                    uint64_t pending, uint8_t *iprio)
> >> +{
> >> +    int irq, best_irq =3D RISCV_EXCP_NONE;
> >> +    unsigned int prio, best_prio =3D UINT_MAX;
> >> +
> >> +    if (!pending) {
> >> +        return RISCV_EXCP_NONE;
> >> +    }
> >> +
> >> +    irq =3D ctz64(pending);
> >> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >> +        return irq;
> >> +    }
> >> +
> >> +    pending =3D pending >> irq;
> >> +    while (pending) {
> >> +        prio =3D iprio[irq];
> >> +        if (!prio) {
> >> +            if (irq =3D=3D extirq) {
> >> +                prio =3D extirq_def_prio;
> >> +            } else {
> >> +                prio =3D (riscv_cpu_default_priority(irq) <
> extirq_def_prio) ?
> >> +                       1 : IPRIO_MMAXIPRIO;
> >> +            }
> >> +        }
> >> +        if ((pending & 0x1) && (prio <=3D best_prio)) {
> >> +            best_irq =3D irq;
> >> +            best_prio =3D prio;
> >> +        }
> >> +        irq++;
> >> +        pending =3D pending >> 1;
> >> +    }
> >> +
> >> +    return best_irq;
> >> +}
> >
> >
> > Hi Anup,
> >
> > RISC-V Priv spec defines the priority order:
> >   Multiple simultaneous interrupts destined for the same privilege mode
> >   are handled in the following decreasing priority order: MEI, MSI, MTI=
,
> SEI, SSI, STI, UEI,
> >   USI, UTI.
> >
> > So the priority order should be: MEI (11) > MSI (3) > MTI (7).
> >
> > But if MSI and MTI are pending-and-enabled,
> > with all of their iprio assigned to their default priority orders
> (IPRIO_DEFAULT_M)
> > (or iprio assigned to zero, which the default priority orders are
> applied as well).
> > riscv_cpu_pending_to_irq() would incorrectly pick MTI (7), instead of
> MSI (3),
> > because they all have the same default priority order: IPRIO_DEFAULT_M.
>
> Ahh yes, I missed addressing this one.
>
> If you can review other patches as well then I can send v8 this week
> itself.
>
> Thanks,
> Anup
>

Sure, I'll review the remaining patches 15, 18, 20.

Sorry that I'm not familiar with PCIe IRQ mapping and DTS creation,
so I will leave patches 19 and 21 for other experts.
But I think the APLIC and IMSIC creation parts in virt machine look good to
me.

Regards,
Frank Chang


>
> >
> > Regards,
> > Frank Chang
> >
> >>
> >> +
> >> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> >> +{
> >> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> >> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0=
;
> >> +
> >> +    return (env->mip | vsgein) & env->mie;
> >> +}
> >> +
> >> +int riscv_cpu_mirq_pending(CPURISCVState *env)
> >> +{
> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> >> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >> +
> >> +    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
> >> +                                    irqs, env->miprio);
> >> +}
> >> +
> >> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> >> +{
> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> >> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >> +
> >> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> >> +                                    irqs, env->siprio);
> >> +}
> >> +
> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> >> +{
> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> >> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >> +
> >> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
> >> +                                    irqs >> 1, env->hviprio);
> >> +}
> >> +
> >> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >> +{
> >> +    int virq;
> >> +    uint64_t irqs, pending, mie, hsie, vsie;
> >> +
> >> +    /* Determine interrupt enable state of all privilege modes */
> >> +    if (riscv_cpu_virt_enabled(env)) {
> >> +        mie =3D 1;
> >> +        hsie =3D 1;
> >> +        vsie =3D (env->priv < PRV_S) ||
> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> >>      } else {
> >> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
> >> +        mie =3D (env->priv < PRV_M) ||
> >> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus,
> MSTATUS_MIE));
> >> +        hsie =3D (env->priv < PRV_S) ||
> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> >> +        vsie =3D 0;
> >>      }
> >> +
> >> +    /* Determine all pending interrupts */
> >> +    pending =3D riscv_cpu_all_pending(env);
> >> +
> >> +    /* Check M-mode interrupts */
> >> +    irqs =3D pending & ~env->mideleg & -mie;
> >> +    if (irqs) {
> >> +        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT,
> IPRIO_DEFAULT_M,
> >> +                                        irqs, env->miprio);
> >> +    }
> >> +
> >> +    /* Check HS-mode interrupts */
> >> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> >> +    if (irqs) {
> >> +        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT,
> IPRIO_DEFAULT_S,
> >> +                                        irqs, env->siprio);
> >> +    }
> >> +
> >> +    /* Check VS-mode interrupts */
> >> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> >> +    if (irqs) {
> >> +        virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT,
> IPRIO_DEFAULT_S,
> >> +                                        irqs >> 1, env->hviprio);
> >> +        return (virq <=3D 0) ? virq : virq + 1;
> >> +    }
> >> +
> >> +    /* Indicate no pending interrupt */
> >> +    return RISCV_EXCP_NONE;
> >>  }
> >>
> >>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> >> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> >> index c11eb4639c..bae4f69725 100644
> >> --- a/target/riscv/machine.c
> >> +++ b/target/riscv/machine.c
> >> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
> >>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> >>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> >> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> >>
> >>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> >>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> >> @@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >>      .fields =3D (VMStateField[]) {
> >>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> >> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
> >> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
> >>          VMSTATE_UINTTL(env.pc, RISCVCPU),
> >>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
> >>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
> >> --
> >> 2.25.1
> >>
> >>
>
>

--0000000000009f882105d5d32c2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:apatel@v=
entanamicro.com" target=3D"_blank">apatel@ventanamicro.com</a>&gt; =E6=96=
=BC 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=
=8811:41=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jan 18, 2022 at 9:04=
 AM Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_bl=
ank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=3D"_blank=
">anup@brainfault.org</a>&gt; =E6=96=BC 2022=E5=B9=B41=E6=9C=8817=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The AIA spec defines programmable 8-bit priority for each local in=
terrupt<br>
&gt;&gt; at M-level, S-level and VS-level so we extend local interrupt proc=
essing<br>
&gt;&gt; to consider AIA interrupt priorities. The AIA CSRs which help soft=
ware<br>
&gt;&gt; configure local interrupt priorities will be added by subsequent p=
atches.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.or=
g" target=3D"_blank">anup@brainfault.org</a>&gt;<br>
&gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++=
<br>
&gt;&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<=
br>
&gt;&gt;=C2=A0 target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++=
++++++----<br>
&gt;&gt;=C2=A0 target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;&gt;=C2=A0 4 files changed, 255 insertions(+), 21 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index 76f9786836..167d86eef7 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env,=
 TranslationBlock *tb,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void riscv_cpu_reset(DeviceState *dev)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t iprio;<br>
&gt;&gt; +=C2=A0 =C2=A0 int i, irq, rdzero;<br>
&gt;&gt; +#endif<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(dev);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu=
);<br>
&gt;&gt; @@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;miclaim =3D MIP_SGEIP;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D env-&gt;resetvec;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;two_stage_lookup =3D false;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Initialized default priorities of local interrup=
ts. */<br>
&gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(env-&gt;miprio); i+=
+) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D riscv_cpu_default_priority(=
i);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;miprio[i] =3D (i =3D=3D IRQ_M=
_EXT) ? 0 : iprio;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;siprio[i] =3D (i =3D=3D IRQ_S=
_EXT) ? 0 : iprio;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[i] =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 i =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 while (!riscv_cpu_hviprio_index2irq(i, &amp;irq, &a=
mp;rdzero)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdzero) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[irq] =
=3D env-&gt;miprio[irq];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* mmte is supposed to have pm.current hardwir=
ed to 1 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_=
CURRENT);<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; index cee70f8608..65d2b606fc 100644<br>
&gt;&gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; @@ -190,6 +190,10 @@ struct CPURISCVState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: priv-1.10.=
0 */<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Machine and Supervisor interrupt priorities */<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t miprio[64];<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t siprio[64];<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hstatus;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hedeleg;<br>
&gt;&gt; @@ -202,6 +206,9 @@ struct CPURISCVState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hgeip;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t htimedelta;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Hypervisor controlled virtual interrupt prioriti=
es */<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t hviprio[64];<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Upper 64-bits of 128-bit CSRs */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mscratchh;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t sscratchh;<br>
&gt;&gt; @@ -392,6 +399,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpF=
unction f, CPUState *cs,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cpuid, void *opaque=
);<br>
&gt;&gt;=C2=A0 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *b=
uf, int reg);<br>
&gt;&gt;=C2=A0 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf=
, int reg);<br>
&gt;&gt; +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out=
_rdzero);<br>
&gt;&gt; +uint8_t riscv_cpu_default_priority(int irq);<br>
&gt;&gt; +int riscv_cpu_mirq_pending(CPURISCVState *env);<br>
&gt;&gt; +int riscv_cpu_sirq_pending(CPURISCVState *env);<br>
&gt;&gt; +int riscv_cpu_vsirq_pending(CPURISCVState *env);<br>
&gt;&gt;=C2=A0 bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
&gt;&gt;=C2=A0 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);<br>
&gt;&gt;=C2=A0 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong g=
eilen);<br>
&gt;&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c=
<br>
&gt;&gt; index 59c8f900df..3a36200780 100644<br>
&gt;&gt; --- a/target/riscv/cpu_helper.c<br>
&gt;&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt;&gt; @@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *en=
v, target_ulong *pc,<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;&gt; -static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
&gt;&gt; +<br>
&gt;&gt; +/*<br>
&gt;&gt; + * The HS-mode is allowed to configure priority only for the<br>
&gt;&gt; + * following VS-mode local interrupts:<br>
&gt;&gt; + *<br>
&gt;&gt; + * 0=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; + * 1=C2=A0 Supervisor software interrupt<br>
&gt;&gt; + * 4=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; + * 5=C2=A0 Supervisor timer interrupt<br>
&gt;&gt; + * 8=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; + * 13 (Reserved interrupt)<br>
&gt;&gt; + * 14 &quot;<br>
&gt;&gt; + * 15 &quot;<br>
&gt;&gt; + * 16 &quot;<br>
&gt;&gt; + * 18 Debug/trace interrupt<br>
&gt;&gt; + * 20 (Reserved interrupt)<br>
&gt;&gt; + * 22 &quot;<br>
&gt;&gt; + * 24 &quot;<br>
&gt;&gt; + * 26 &quot;<br>
&gt;&gt; + * 28 &quot;<br>
&gt;&gt; + * 30 (Reserved for standard reporting of bus or system errors)<b=
r>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +static int hviprio_index2irq[] =3D<br>
&gt;&gt; +=C2=A0 =C2=A0 { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26=
, 28, 30 };<br>
&gt;&gt; +static int hviprio_index2rdzero[] =3D<br>
&gt;&gt; +=C2=A0 =C2=A0 { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };=
<br>
&gt;&gt; +<br>
&gt;&gt; +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out=
_rdzero)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong virt_enabled =3D riscv_cpu_virt_enable=
d(env);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (index &lt; 0 || ARRAY_SIZE(hviprio_index2irq) &=
lt;=3D index) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (out_irq) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_irq =3D hviprio_index2irq[index]=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt;msta=
tus, MSTATUS_MIE);<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env-&gt;msta=
tus, MSTATUS_SIE);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (out_rdzero) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_rdzero =3D hviprio_index2rdzero[=
index];<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong vsgemask =3D<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_u=
long)1 &lt;&lt; get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong vsgein =3D (env-&gt;hgeip &amp; vsgema=
sk) ? MIP_VSEIP : 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; +}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong pending =3D (env-&gt;mip | vsgein) &am=
p; env-&gt;mie;<br>
&gt;&gt; +uint8_t riscv_cpu_default_priority(int irq)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 int u, l;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t iprio =3D IPRIO_MMAXIPRIO;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;priv &lt;=
 PRV_M ||<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_m=
ie);<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong sie=C2=A0 =C2=A0 =3D env-&gt;priv &lt;=
 PRV_S ||<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; mstatus_s=
ie);<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong hsie=C2=A0 =C2=A0=3D virt_enabled || s=
ie;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong vsie=C2=A0 =C2=A0=3D virt_enabled &amp=
;&amp; sie;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (irq &lt; 0 || irq &gt; 63) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return iprio;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong irqs =3D<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp; ~env-&gt=
;mideleg &amp; -mie) |<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 en=
v-&gt;mideleg &amp; ~env-&gt;hideleg &amp; -hsie) |<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=C2=A0 en=
v-&gt;mideleg &amp;=C2=A0 env-&gt;hideleg &amp; -vsie);<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Default priorities of local interrupts are =
defined in the<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* RISC-V Advanced Interrupt Architecture spec=
ification.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* -------------------------------------------=
---------------------<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Default=C2=A0 |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Priority | Major Interrupt Numbers<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* -------------------------------------------=
---------------------<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Highest=C2=A0 | 63 (3f), 62 (3e), 31 =
(1f), 30 (1e), 61 (3d), 60 (3c),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
9 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
5 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
1 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
1 (0b),=C2=A0 3 (03),=C2=A0 7 (07)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 (09),=C2=A0 1 (01),=C2=A0 5 (05)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
2 (0c)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
0 (0a),=C2=A0 2 (02),=C2=A0 6 (06)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
7 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
3 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
9 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Lowest=C2=A0 =C2=A0| 35 (23), 34 (22)=
, 17 (11), 16 (10), 33 (21), 32 (20)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* -------------------------------------------=
---------------------<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctz64(irqs); /* since non-zero=
 */<br>
&gt;&gt; +=C2=A0 =C2=A0 u =3D IPRIO_DEFAULT_U(irq);<br>
&gt;&gt; +=C2=A0 =C2=A0 l =3D IPRIO_DEFAULT_L(irq);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (u =3D=3D 0) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D IRQ_VS_EXT || irq =3D=
=3D IRQ_VS_TIMER ||<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D=3D IRQ_VS_SOFT)=
 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_VS;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_GEXT) {<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_SGEXT;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_EXT || ir=
q =3D=3D IRQ_S_TIMER ||<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0irq =3D=3D IRQ_S_SOFT) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_S;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_M_EXT || ir=
q =3D=3D IRQ_M_TIMER ||<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0irq =3D=3D IRQ_M_SOFT) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_M;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_VS;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 1) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &lt; 8) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_16_23(irq);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT=
_24_31(irq);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 2) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_32_47(irq);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 3) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_48_63(irq);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return iprio;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static int riscv_cpu_pending_to_irq(CPURISCVState *env,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int extirq, =
unsigned int extirq_def_prio,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t pen=
ding, uint8_t *iprio)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 int irq, best_irq =3D RISCV_EXCP_NONE;<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned int prio, best_prio =3D UINT_MAX;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!pending) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 irq =3D ctz64(pending);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 pending =3D pending &gt;&gt; irq;<br>
&gt;&gt; +=C2=A0 =C2=A0 while (pending) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D iprio[irq];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!prio) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D extirq) =
{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D =
extirq_def_prio;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D =
(riscv_cpu_default_priority(irq) &lt; extirq_def_prio) ?<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A01 : IPRIO_MMAXIPRIO;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pending &amp; 0x1) &amp;&amp; (p=
rio &lt;=3D best_prio)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D irq;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_prio =3D prio;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq++;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pending =3D pending &gt;&gt; 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return best_irq;<br>
&gt;&gt; +}<br>
&gt;<br>
&gt;<br>
&gt; Hi Anup,<br>
&gt;<br>
&gt; RISC-V Priv spec defines the priority order:<br>
&gt;=C2=A0 =C2=A0Multiple simultaneous interrupts destined for the same pri=
vilege mode<br>
&gt;=C2=A0 =C2=A0are handled in the following decreasing priority order: ME=
I, MSI, MTI, SEI, SSI, STI, UEI,<br>
&gt;=C2=A0 =C2=A0USI, UTI.<br>
&gt;<br>
&gt; So the priority order should be: MEI (11) &gt; MSI (3) &gt; MTI (7).<b=
r>
&gt;<br>
&gt; But if MSI and MTI are pending-and-enabled,<br>
&gt; with all of their iprio assigned to their default priority orders (IPR=
IO_DEFAULT_M)<br>
&gt; (or iprio assigned to zero, which the default priority orders are appl=
ied as well).<br>
&gt; riscv_cpu_pending_to_irq() would incorrectly pick MTI (7), instead of =
MSI (3),<br>
&gt; because they all have the same default priority order: IPRIO_DEFAULT_M=
.<br>
<br>
Ahh yes, I missed addressing this one.<br>
<br>
If you can review other patches as well then I can send v8 this week itself=
.<br>
<br>
Thanks,<br>
Anup<br></blockquote><div><br></div><div>Sure, I&#39;ll review the remainin=
g patches 15, 18, 20.<br></div><div><br></div><div>Sorry that I&#39;m not f=
amiliar with PCIe IRQ mapping and DTS creation,</div><div>so I will leave p=
atches 19 and 21 for other experts.</div><div>But I think the APLIC and IMS=
IC creation parts in virt machine look good to me.</div><div><br></div><div=
>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t gein =3D get_field(env-&gt;hstatus, HSTATU=
S_VGEIN);<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t vsgein =3D (env-&gt;hgeip &amp; (1ULL &lt;=
&lt; gein)) ? MIP_VSEIP : 0;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&gt;mie;<br=
>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +int riscv_cpu_mirq_pending(CPURISCVState *env)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; =
~env-&gt;mideleg &amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPR=
IO_DEFAULT_M,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&g=
t;miprio);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +int riscv_cpu_sirq_pending(CPURISCVState *env)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; =
env-&gt;mideleg &amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPR=
IO_DEFAULT_S,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs, env-&g=
t;siprio);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +int riscv_cpu_vsirq_pending(CPURISCVState *env)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(env) &amp; =
env-&gt;mideleg &amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPR=
IO_DEFAULT_S,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irqs &gt;&gt=
; 1, env-&gt;hviprio);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 int virq;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs, pending, mie, hsie, vsie;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Determine interrupt enable state of all privileg=
e modes */<br>
&gt;&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D (env-&gt;priv &lt; PRV_S) ||=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;p=
riv =3D=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE; /* indicates =
no pending interrupt */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D (env-&gt;priv &lt; PRV_M) ||<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =
=3D=3D PRV_M &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_MIE));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D (env-&gt;priv &lt; PRV_S) ||=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;p=
riv =3D=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Determine all pending interrupts */<br>
&gt;&gt; +=C2=A0 =C2=A0 pending =3D riscv_cpu_all_pending(env);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Check M-mode interrupts */<br>
&gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; ~env-&gt;mideleg &amp; -mie;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, =
IRQ_M_EXT, IPRIO_DEFAULT_M,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 irqs, env-&gt;miprio);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Check HS-mode interrupts */<br>
&gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; ~env-&=
gt;hideleg &amp; -hsie;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, =
IRQ_S_EXT, IPRIO_DEFAULT_S,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 irqs, env-&gt;siprio);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Check VS-mode interrupts */<br>
&gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &amp; env-&g=
t;hideleg &amp; -vsie;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virq =3D riscv_cpu_pending_to_irq(env=
, IRQ_S_EXT, IPRIO_DEFAULT_S,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 irqs &gt;&gt; 1, env-&gt;hviprio);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (virq &lt;=3D 0) ? virq : virq=
 + 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Indicate no pending interrupt */<br>
&gt;&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_re=
quest)<br>
&gt;&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt;&gt; index c11eb4639c..bae4f69725 100644<br>
&gt;&gt; --- a/target/riscv/machine.c<br>
&gt;&gt; +++ b/target/riscv/machine.c<br>
&gt;&gt; @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =
=3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgeie, RISCVC=
PU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgeip, RISCVC=
PU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.htimedelta, R=
ISCVCPU),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.hviprio, RISC=
VCPU, 64),<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.vsstatus, RIS=
CVCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.vstvec, RISCV=
CPU),<br>
&gt;&gt; @@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu =3D=
 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.gpr, RI=
SCVCPU, 32),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64_ARRAY(env.fpr, RI=
SCVCPU, 32),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.miprio, RISCV=
CPU, 64),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.siprio, RISCV=
CPU, 64),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.pc, RISCVCPU)=
,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.load_res, RIS=
CVCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.load_val, RIS=
CVCPU),<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--0000000000009f882105d5d32c2c--

