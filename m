Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n80yx-0002hz-RB
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 09:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n80yw-0002gK-27
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 09:21:38 -0500
Received: from [2a00:1450:4864:20::533] (port=38464
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n80yq-00058j-FK
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 09:21:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id u21so23619552edd.5
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPYpa4JzaDc7ZpwWce7EEJymlilSyFqlKayM0J4CxLY=;
 b=Iu4mm97HFiwciIpMoxtBOTXkl9M3IVF5vINweyHfgs/20sIy6468gEvbs5jMNhK8qu
 nLRwQ8v5HDUUP/3jVrTlKSWItX90Bj84Y1GWb1/ADOUUw17Geb4UTdhC3iM72PVSQ8+G
 hWU2eJSisMHQvwUsvpOmbSA8BQbhTYCOJCwnD2lu0MY83L6+AWJq2c3w9LBnlgxJolv0
 SWclD0kgvPTTm40n+/zIbXXwM2I7Sqw1hZ98QreM69j83I+yCfuGUG9laTk/PTjggBra
 CPaXeAmxVs+HwoxZlvalou008mez4g1lB9GauHeRlRgAB4KHLkGmDxkYcrWqIGEJPNlN
 wOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPYpa4JzaDc7ZpwWce7EEJymlilSyFqlKayM0J4CxLY=;
 b=ZLhVnDR32j3OiHI5SkZT+djVlFex2qgchNkSe1VuYV/tOlNInW0E7fMPZkX0KGZoWt
 iVyHSmr6+Ifk283yH9g61qnEpLOxgbSIG07Mjx2q8HmKD41hBbGzcS5nw16+JpNdYmMn
 UA7N3ElfTUuw76bV9fNAIfBuD/UKNqdqX6FtJMVmhvOr82TYqXnY49wQWpQO6iblnmla
 /saU0z+80+9s4syhk9F1F6E8g3ZVWSzATmhFeF6nZb+vJopfjzqCM4JePxt7Ng8ZmaQt
 un6zDq6VsOG8U3xjzkEAckR+/GpLdDOAftg5/GeY+Iw/KUOvdok9TFbRUsTNEDJTj0O3
 BL4Q==
X-Gm-Message-State: AOAM532W7mouyLXQV7PB1qg/fHPhIzKPfBe3qA5k/TofBiFHst8ufAvn
 KtHLe6pLMm9zsMIQjkyGWPcAhAW5MWcdS/ZmApPHJQ==
X-Google-Smtp-Source: ABdhPJwXETOQpEcjOI2fN9Wd6Ok3S/kmXkT8zxoc3JFr0gI0BDNvbNDlZbqrrSrus4itWX6G7zieHBep1NN2Oja59xU=
X-Received: by 2002:a17:907:7f0f:: with SMTP id
 qf15mr3626133ejc.76.1642083690558; 
 Thu, 13 Jan 2022 06:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-10-anup@brainfault.org>
 <CANzO1D0XZ1SfNKHp9sd+FKMt40N3RXO92XbqbjiFq=DUAp18NQ@mail.gmail.com>
 <CAAhSdy3h_dpCAuxcdsYf73+M_33Y3f2_-LFx3Zv4E_OdKag7xg@mail.gmail.com>
 <CAE_xrPjueSQpY2b_9Y4vyzzh12sao0hJ=TGqrAQM-yw0wT=1Nw@mail.gmail.com>
 <CAAhSdy2faOV1Z3rkJ1JDTi5RMEdFp27jPzLthVZgTaKv2MgmDg@mail.gmail.com>
In-Reply-To: <CAAhSdy2faOV1Z3rkJ1JDTi5RMEdFp27jPzLthVZgTaKv2MgmDg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 22:21:19 +0800
Message-ID: <CAE_xrPiatQhRZ+EOq+6BumPEA87jgzTZChT9Qn0Pp_wxN690LQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000011527905d5776755"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Thu, 13 Jan 2022 14:21:38 -0000

--00000000000011527905d5776755
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 6:45 PM Anup Patel <anup@brainfault.org> wrote:

> On Wed, Jan 12, 2022 at 8:30 AM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Wed, Jan 12, 2022 at 1:18 AM Anup Patel <anup@brainfault.org> wrote:
> >>
> >>
> >>
> >> On Mon, Jan 10, 2022 at 6:38 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >> >
> >> > Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >> >>
> >> >> From: Anup Patel <anup.patel@wdc.com>
> >> >>
> >> >> The AIA spec defines programmable 8-bit priority for each local
> interrupt
> >> >> at M-level, S-level and VS-level so we extend local interrupt
> processing
> >> >> to consider AIA interrupt priorities. The AIA CSRs which help
> software
> >> >> configure local interrupt priorities will be added by subsequent
> patches.
> >> >>
> >> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> >> ---
> >> >>  target/riscv/cpu.c        |  19 ++++
> >> >>  target/riscv/cpu.h        |  12 ++
> >> >>  target/riscv/cpu_helper.c | 231
> ++++++++++++++++++++++++++++++++++----
> >> >>  target/riscv/machine.c    |   3 +
> >> >>  4 files changed, 244 insertions(+), 21 deletions(-)
> >> >>
> >> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> >> index 9f1a4d1088..9ad26035e1 100644
> >> >> --- a/target/riscv/cpu.c
> >> >> +++ b/target/riscv/cpu.c
> >> >> @@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVState *env,
> TranslationBlock *tb,
> >> >>
> >> >>  static void riscv_cpu_reset(DeviceState *dev)
> >> >>  {
> >> >> +#ifndef CONFIG_USER_ONLY
> >> >> +    uint8_t iprio;
> >> >> +    int i, irq, rdzero;
> >> >> +#endif
> >> >>      CPUState *cs =3D CPU(dev);
> >> >>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> >> >>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> >> >> @@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceState *dev)
> >> >>      env->miclaim =3D MIP_SGEIP;
> >> >>      env->pc =3D env->resetvec;
> >> >>      env->two_stage_lookup =3D false;
> >> >> +
> >> >> +    /* Initialized default priorities of local interrupts. */
> >> >> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> >> >> +        iprio =3D riscv_cpu_default_priority(i);
> >> >> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
> >> >> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
> >> >> +        env->hviprio[i] =3D 0;
> >> >> +    }
> >> >> +    i =3D 0;
> >> >> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> >> >> +        if (!rdzero) {
> >> >> +            env->hviprio[irq] =3D env->miprio[irq];
> >> >> +        }
> >> >> +        i++;
> >> >> +    }
> >> >>      /* mmte is supposed to have pm.current hardwired to 1 */
> >> >>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> >> >>  #endif
> >> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> >> index 02f3ef2c3c..140fabfdf9 100644
> >> >> --- a/target/riscv/cpu.h
> >> >> +++ b/target/riscv/cpu.h
> >> >> @@ -182,6 +182,10 @@ struct CPURISCVState {
> >> >>      target_ulong mcause;
> >> >>      target_ulong mtval;  /* since: priv-1.10.0 */
> >> >>
> >> >> +    /* Machine and Supervisor interrupt priorities */
> >> >> +    uint8_t miprio[64];
> >> >> +    uint8_t siprio[64];
> >> >> +
> >> >>      /* Hypervisor CSRs */
> >> >>      target_ulong hstatus;
> >> >>      target_ulong hedeleg;
> >> >> @@ -194,6 +198,9 @@ struct CPURISCVState {
> >> >>      target_ulong hgeip;
> >> >>      uint64_t htimedelta;
> >> >>
> >> >> +    /* Hypervisor controlled virtual interrupt priorities */
> >> >> +    uint8_t hviprio[64];
> >> >> +
> >> >>      /* Virtual CSRs */
> >> >>      /*
> >> >>       * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
> >> >> @@ -379,6 +386,11 @@ int
> riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> >> >>                                 int cpuid, void *opaque);
> >> >>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, in=
t
> reg);
> >> >>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int
> reg);
> >> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int
> *out_rdzero);
> >> >> +uint8_t riscv_cpu_default_priority(int irq);
> >> >> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> >> >> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> >> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
> >> >>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> >> >>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
> >> >>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)=
;
> >> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> >> index f94a36fa89..e3532de4cf 100644
> >> >> --- a/target/riscv/cpu_helper.c
> >> >> +++ b/target/riscv/cpu_helper.c
> >> >> @@ -151,36 +151,225 @@ void cpu_get_tb_cpu_state(CPURISCVState *env=
,
> target_ulong *pc,
> >> >>  }
> >> >>
> >> >>  #ifndef CONFIG_USER_ONLY
> >> >> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >> >> +
> >> >> +/*
> >> >> + * The HS-mode is allowed to configure priority only for the
> >> >> + * following VS-mode local interrupts:
> >> >> + *
> >> >> + * 0  (Reserved interrupt, reads as zero)
> >> >> + * 1  Supervisor software interrupt
> >> >> + * 4  (Reserved interrupt, reads as zero)
> >> >> + * 5  Supervisor timer interrupt
> >> >> + * 8  (Reserved interrupt, reads as zero)
> >> >> + * 13 (Reserved interrupt)
> >> >> + * 14 "
> >> >> + * 15 "
> >> >> + * 16 "
> >> >> + * 18 Debug/trace interrupt
> >> >> + * 20 (Reserved interrupt)
> >> >> + * 22 "
> >> >> + * 24 "
> >> >> + * 26 "
> >> >> + * 28 "
> >> >> + * 30 (Reserved for standard reporting of bus or system errors)
> >> >> + */
> >> >> +
> >> >> +static int hviprio_index2irq[] =3D
> >> >> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> >> >> +static int hviprio_index2rdzero[] =3D
> >> >> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
> >> >> +
> >> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int
> *out_rdzero)
> >> >>  {
> >> >> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
> >> >> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
> >> >> +        return -EINVAL;
> >> >> +    }
> >> >> +
> >> >> +    if (out_irq) {
> >> >> +        *out_irq =3D hviprio_index2irq[index];
> >> >> +    }
> >> >>
> >> >> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_M=
IE);
> >> >> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_S=
IE);
> >> >> +    if (out_rdzero) {
> >> >> +        *out_rdzero =3D hviprio_index2rdzero[index];
> >> >> +    }
> >> >>
> >> >> -    target_ulong vsgemask =3D
> >> >> -                (target_ulong)1 << get_field(env->hstatus,
> HSTATUS_VGEIN);
> >> >> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : =
0;
> >> >> +    return 0;
> >> >> +}
> >> >>
> >> >> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
> >> >> +uint8_t riscv_cpu_default_priority(int irq)
> >> >> +{
> >> >> +    int u, l;
> >> >> +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
> >> >>
> >> >> -    target_ulong mie    =3D env->priv < PRV_M ||
> >> >> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
> >> >> -    target_ulong sie    =3D env->priv < PRV_S ||
> >> >> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
> >> >> -    target_ulong hsie   =3D virt_enabled || sie;
> >> >> -    target_ulong vsie   =3D virt_enabled && sie;
> >> >> +    if (irq < 0 || irq > 63) {
> >> >> +        return iprio;
> >> >> +    }
> >> >>
> >> >> -    target_ulong irqs =3D
> >> >> -            (pending & ~env->mideleg & -mie) |
> >> >> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> >> >> -            (pending &  env->mideleg &  env->hideleg & -vsie);
> >> >> +    /*
> >> >> +     * Default priorities of local interrupts are defined in the
> >> >> +     * RISC-V Advanced Interrupt Architecture specification.
> >> >> +     *
> >> >> +     *
> ----------------------------------------------------------------
> >> >> +     *  Default  |
> >> >> +     *  Priority | Major Interrupt Numbers
> >> >> +     *
> ----------------------------------------------------------------
> >> >> +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60
> (3c),
> >> >> +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56
> (38),
> >> >> +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52
> (34),
> >> >> +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48
> (30)
> >> >> +     *           |
> >> >> +     *           | 11 (0b),  3 (03),  7 (07)
> >> >> +     *           |  9 (09),  1 (01),  5 (05)
> >> >> +     *           | 12 (0c)
> >> >> +     *           | 10 (0a),  2 (02),  6 (06)
> >> >> +     *           |
> >> >> +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44
> (2c),
> >> >> +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40
> (28),
> >> >> +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36
> (24),
> >> >> +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32
> (20)
> >> >> +     *
> ----------------------------------------------------------------
> >> >> +     */
> >> >>
> >> >> -    if (irqs) {
> >> >> -        return ctz64(irqs); /* since non-zero */
> >> >> +    u =3D IPRIO_DEFAULT_U(irq);
> >> >> +    l =3D IPRIO_DEFAULT_L(irq);
> >> >> +    if (u =3D=3D 0) {
> >> >> +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
> >> >> +            irq =3D=3D IRQ_VS_SOFT) {
> >> >> +            iprio =3D IPRIO_DEFAULT_VS;
> >> >> +        } else if (irq =3D=3D IRQ_S_GEXT) {
> >> >> +            iprio =3D IPRIO_DEFAULT_SGEXT;
> >> >> +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER =
||
> >> >> +                   irq =3D=3D IRQ_S_SOFT) {
> >> >> +            iprio =3D IPRIO_DEFAULT_S;
> >> >> +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER =
||
> >> >> +                   irq =3D=3D IRQ_M_SOFT) {
> >> >> +            iprio =3D IPRIO_DEFAULT_M;
> >> >> +        } else {
> >> >> +            iprio =3D IPRIO_DEFAULT_VS;
> >> >> +        }
> >> >> +    } else if (u =3D=3D 1) {
> >> >> +        if (l < 8) {
> >> >> +            iprio =3D IPRIO_DEFAULT_16_23(irq);
> >> >> +        } else {
> >> >> +            iprio =3D IPRIO_DEFAULT_24_31(irq);
> >> >> +        }
> >> >> +    } else if (u =3D=3D 2) {
> >> >> +        iprio =3D IPRIO_DEFAULT_32_47(irq);
> >> >> +    } else if (u =3D=3D 3) {
> >> >> +        iprio =3D IPRIO_DEFAULT_48_63(irq);
> >> >> +    }
> >> >> +
> >> >> +    return iprio;
> >> >> +}
> >> >> +
> >> >> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> >> >> +                                    uint64_t pending, uint8_t
> *iprio)
> >> >> +{
> >> >> +    int irq, best_irq =3D RISCV_EXCP_NONE;
> >> >> +    unsigned int prio, best_prio =3D UINT_MAX;
> >> >> +
> >> >> +    if (!pending) {
> >> >> +        return RISCV_EXCP_NONE;
> >> >> +    }
> >> >> +
> >> >> +    irq =3D ctz64(pending);
> >> >> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >> >> +        return irq;
> >> >> +    }
> >> >> +
> >> >> +    pending =3D pending >> irq;
> >> >> +    while (pending) {
> >> >> +        prio =3D iprio[irq];
> >> >> +        if (!prio) {
> >> >> +            prio =3D (riscv_cpu_default_priority(irq) <
> IPRIO_DEFAULT_M) ?
> >> >> +                   1 : IPRIO_MMAXIPRIO;
> >> >
> >> >
> >> > Hi Anup,
> >> >
> >> > I have a question regarding configuring priorities of major
> interrupts.
> >> >
> >> > riscv_cpu_default_priority() for M-mode external interrupt would
> return IPRIO_DEFAULT_M (8).
> >> > but the comparison here is < IPRIO_DEFAULT_M,
> >> > so if M-mode external interrupt is pending, the prio would be
> assigned to IPRIO_MMAXIPRIO (255).
> >> > Is this the expected behavior?
> >>
> >> Actually, for irq =3D=3D IRQ_M_EXT the prio should be IPRIO_DEFAULT_M
> >> same for irq =3D=3D IRQ_S_EXT.
> >>
> >> Goot catch, I will fix this in next revision.
> >>
> >> >
> >> > Also, why is IPRIO_DEFAULT_M been compared?
> >> > Should IPRIO_DEFAULT_S and IPRIO_DEFAULT_VS be used for S-mode and
> VS-mode interrupts?
> >>
> >> For M-mode, we should compare IPRIO_DEFAULT_M.
> >> For S/VS-mode, we should compare IPRIO_DEFAULT_S
> >> but the priority registers used for S-mode and VS-mode
> >> are different.
> >>
> >> >
> >> >>
> >> >> +        }
> >> >> +        if ((pending & 0x1) && (prio < best_prio)) {
> >> >
> >> >
> >> > If both interrupt 63 and 62 are pending-and-enabled,
> >> > with their iprio values both assigned to zero.
> >> > Interrupt 62 would be picked, because best_prio will be 1 when
> interrupt 62 is been checked.
> >> > As the default priority order for interrupt 63 is also less than
> IPRIO_DEFAULT_M (8),
> >> > so prio would be assigned to 1 as well.
> >> > But as prio is not less than best_prio, so best_irq would still be
> interrupt 62.
> >> >
> >> > However, according to the default priority table in AIA spec,
> >> > interrupt 63 should have a higher priority than interrupt 62:
> >> >   Interrupt 63 has the highest default priority, and interrupt 32 ha=
s
> the lowest default priority.
> >>
> >> Argh, the comparision "prio < best_prio" should have been
> >> "prio <=3D best_prio".
> >>
> >> I am certainly aware of the fact that if two interrupts
> >> have same priority then higher interrupt number should be
> >> preferred. This is silly mistake on my part.
> >>
> >> I really appreciate your detailed review. Thanks.
> >>
> >> >
> >> >>
> >> >> +            best_irq =3D irq;
> >> >> +            best_prio =3D prio;
> >> >> +        }
> >> >> +        irq++;
> >> >> +        pending =3D pending >> 1;
> >> >> +    }
> >> >> +
> >> >> +    return best_irq;
> >> >> +}
> >> >
> >> >
> >> > Yet I have another question for major interrupts priorities.
> >> >
> >> > According to AIA spec (v0.2-draft.28):
> >> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > The priority number for a machine-level external interrupt (bits
> 31:24 of register iprio2)
> >> > must also be read-only zero.
> >> >
> >> > When an interrupt=E2=80=99s priority number in the array is zero (ei=
ther
> read-only zero or set to zero),
> >> > its priority is the default order from Section 6.1.
> >> > Setting an interrupt=E2=80=99s priority number instead to a nonzero =
value p
> gives that interrupt nominally
> >> > the same priority as a machine-level external interrupt with priorit=
y
> number p.
> >> > For a major interrupt that defaults to a higher priority than machin=
e
> external interrupts,
> >> > setting its priority number to a nonzero value lowers its priority.
> >> > For a major interrupt that defaults to a lower priority than machine
> external interrupts,
> >> > setting its priority number to a nonzero value raises its priority.
> >> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >
> >> > From the above sentences,
> >> > The M-mode external interrupt has iprio value of 0, so the default
> priority order is applied.
> >>
> >> Yes, that's correct and same logic applies to S/VS-mode external
> interrupts.
> >>
> >> >
> >> > What are the priorities for the major interrupt interrupts which are
> higher/lower than
> >> > M-mode external interrupt when their iprio values are not 0?
> >>
> >> For a major interrupt X (which is not an external interrupt) having
> iprio value 0,
> >> we take iprio of X as 1 or 255 based of comparison of default priority
> of X
> >> with default priority of external interrupt.
> >> (Refer, documentation of "mtopi" (Section 6.3.2) and "stopi" (Section
> 6.5.2))
> >>
> >> >
> >> > Which interrupt will be picked when:
> >> >   M-mode external interrupt is pending-and-enabled,
> >> >   Interrupt with higher default priority than M-mode external
> interrupt is pending-and-enabled, and
> >> >   Interrupt with lower default priority than M-mode external
> interrupt is pending-and-enabled/
> >> >
> >> > From the above riscv_cpu_pending_to_irq(),
> >> > If both interrupt 63 and interrupt 18's iprio values are assigned to
> the value of 10,
> >>
> >> You mean both these interrupt have iprio 0, right ?
> >
> >
> > I mean if both interrupt 63 and interrupt 18's iprio values are assigne=
d
> with value 10.
> > If interrupt 63, interrupt 18, and M-mode external interrupt are
> pending-and-enabled.
> > Will M-mode external interrupt be picked as it has the default priority=
:
> 8,
> > which is less than 10 of interrupt 63 and interrupt 18?
>
> Yes, in this case "mtopi" CSR read will return M-mode external interrupt.
>
> >
> > What if, interrupt 63 has iprio value of 10 and interrupt 18 has iprio
> value of 6.
> > If interrupt 63, interrupt 18, and M-mode external interrupt are
> pending-and-enabled.
> > Will interrupt 18 be picked because it has the smallest iprio value
> (i.e. higher interrupt priority)?
>
> Yes, in this case "mtopi" CSR read will return interrupt 18.
>
> >
> > Can I say that for M-mode major interrupts:
> >
> > If interrupt X's iprio value is zero, its interrupt priority will be 1
> or 255,
> > base on its default priority which is higher (1) or less (255) than
> M-mode external interrupt.
>
> Yes, this is correct form M-mode (and "mtopi" CSR) perspective.
>
> For S-mode (and "stopi" or "vstopi" CSR) perspective, it will be
> compared against S-mode external interrupt default priority.
> (Note: I will fix this in next revision)
>
> >
> > And if interrupt X's iprio value is not zero, its interrupt priority
> will be the assigned iprio value.
>
> Yes, this is correct.
>
> > So it's possible for a lower default priority interrupt (e.g. 18) to
> have higher priority than M-mode external interrupt
> > if its iprio value is less than 8?
>
> Yes, this is correct. The fact that iprio of major interrupts are
> programmable
> it allow software to override the default priority assignement.
>
> >
> > The overall interrupt priority order is compared between the values of:
> >   * If iprio value is zero: 1 or 255
> >   * If iprio value is not zero: the iprio value been assigned
>
> This two statements are correct.
>
> >   * M-mode external interrupt: the default priority value: 8?
> > and the interrupt with the smallest value will be picked.
>
> I would like to clarify that it is QEMU implementation that has
> chosen to assign default priorities in 1 to 15 range hence we
> have M-mode external interrupt default priority as 8. Some
> other implementation may chose a different default priority
> assignments but it should comply with the table in the
> "Section 6.1" of the AIA specification.
>
> Regards,
> Anup
>

Thanks for the detailed explanation :)

Regards,
Frank Chang


>
> >
> >>
> >> > and interrupt 63, interrupt 18 and M-mode external interrupts are
> pending-and-enabled.
> >> > Interrupt 18 would be picked.
> >> > Is this the correct expectation?
> >>
> >> If both 63 and 18 have iprio 0 then interrupt 63 would be picked
> >> because 63 has higher default priority compared to default
> >> priorities of both M-mode external interrupt and interrupt 18.
> >>
> >> > I'm a bit confused with the correct priority order of the interrupts
> with/without non-zero value iprio and the default priority.
> >>
> >> Whenever iprio of an interrupt X is 0, the default priority of
> >> interrupt X compared against default external interrupt
> >> priority and based on this comparison 1 (highest) or 255 (lowest)
> >> priority is used for interrupt X.
> >>
> >> In other, a saturated priority is used on interrupt X when
> >> it's iprio is set to zero.
> >
> >
> > Thanks for the detailed explanation.
> >
> > Regards,
> > Frank Chang
> >
> >>
> >>
> >> Regards,
> >> Anup
> >>
> >> >
> >> > Thanks,
> >> > Frank Chang
> >> >
> >> >>
> >> >> +
> >> >> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> >> >> +{
> >> >> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> >> >> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP =
: 0;
> >> >> +
> >> >> +    return (env->mip | vsgein) & env->mie;
> >> >> +}
> >> >> +
> >> >> +int riscv_cpu_mirq_pending(CPURISCVState *env)
> >> >> +{
> >> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
> >> >> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP);
> >> >> +
> >> >> +    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> >> >> +}
> >> >> +
> >> >> +int riscv_cpu_sirq_pending(CPURISCVState *env)
> >> >> +{
> >> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> >> >> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >> >> +
> >> >> +    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> >> >> +}
> >> >> +
> >> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> >> >> +{
> >> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
> >> >> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >> >> +
> >> >> +    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
> >> >> +}
> >> >> +
> >> >> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >> >> +{
> >> >> +    int virq;
> >> >> +    uint64_t irqs, pending, mie, hsie, vsie;
> >> >> +
> >> >> +    /* Determine interrupt enable state of all privilege modes */
> >> >> +    if (riscv_cpu_virt_enabled(env)) {
> >> >> +        mie =3D 1;
> >> >> +        hsie =3D 1;
> >> >> +        vsie =3D (env->priv < PRV_S) ||
> >> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> >> >>      } else {
> >> >> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt =
*/
> >> >> +        mie =3D (env->priv < PRV_M) ||
> >> >> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus,
> MSTATUS_MIE));
> >> >> +        hsie =3D (env->priv < PRV_S) ||
> >> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> >> >> +        vsie =3D 0;
> >> >>      }
> >> >> +
> >> >> +    /* Determine all pending interrupts */
> >> >> +    pending =3D riscv_cpu_all_pending(env);
> >> >> +
> >> >> +    /* Check M-mode interrupts */
> >> >> +    irqs =3D pending & ~env->mideleg & -mie;
> >> >> +    if (irqs) {
> >> >> +        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> >> >> +    }
> >> >> +
> >> >> +    /* Check HS-mode interrupts */
> >> >> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
> >> >> +    if (irqs) {
> >> >> +        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> >> >> +    }
> >> >> +
> >> >> +    /* Check VS-mode interrupts */
> >> >> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
> >> >> +    if (irqs) {
> >> >> +        virq =3D riscv_cpu_pending_to_irq(env, irqs >> 1,
> env->hviprio);
> >> >> +        return (virq <=3D 0) ? virq : virq + 1;
> >> >> +    }
> >> >> +
> >> >> +    /* Indicate no pending interrupt */
> >> >> +    return RISCV_EXCP_NONE;
> >> >>  }
> >> >>
> >> >>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> >> >> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> >> >> index 76dd0d415c..cffc444969 100644
> >> >> --- a/target/riscv/machine.c
> >> >> +++ b/target/riscv/machine.c
> >> >> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D=
 {
> >> >>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >> >>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> >> >>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> >> >> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> >> >>
> >> >>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> >> >>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> >> >> @@ -173,6 +174,8 @@ const VMStateDescription vmstate_riscv_cpu =3D =
{
> >> >>      .fields =3D (VMStateField[]) {
> >> >>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >> >>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> >> >> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
> >> >> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
> >> >>          VMSTATE_UINTTL(env.pc, RISCVCPU),
> >> >>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
> >> >>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
> >> >> --
> >> >> 2.25.1
> >> >>
> >> >>
>

--00000000000011527905d5776755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 13, 2022 at 6:45 PM Anup Pate=
l &lt;<a href=3D"mailto:anup@brainfault.org">anup@brainfault.org</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, Jan 12, 2022 at 8:30 AM Frank Chang &lt;<a href=3D"=
mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jan 12, 2022 at 1:18 AM Anup Patel &lt;<a href=3D"mailto:anup@=
brainfault.org" target=3D"_blank">anup@brainfault.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Jan 10, 2022 at 6:38 PM Frank Chang &lt;<a href=3D"mailto:=
frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wr=
ote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=
=BC=9A<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The AIA spec defines programmable 8-bit priority for each=
 local interrupt<br>
&gt;&gt; &gt;&gt; at M-level, S-level and VS-level so we extend local inter=
rupt processing<br>
&gt;&gt; &gt;&gt; to consider AIA interrupt priorities. The AIA CSRs which =
help software<br>
&gt;&gt; &gt;&gt; configure local interrupt priorities will be added by sub=
sequent patches.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.pate=
l@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brai=
nfault.org" target=3D"_blank">anup@brainfault.org</a>&gt;<br>
&gt;&gt; &gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alist=
air.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 19 ++++<br>
&gt;&gt; &gt;&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 12 ++<br>
&gt;&gt; &gt;&gt;=C2=A0 target/riscv/cpu_helper.c | 231 +++++++++++++++++++=
+++++++++++++++----<br>
&gt;&gt; &gt;&gt;=C2=A0 target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A03=
 +<br>
&gt;&gt; &gt;&gt;=C2=A0 4 files changed, 244 insertions(+), 21 deletions(-)=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; &gt;&gt; index 9f1a4d1088..9ad26035e1 100644<br>
&gt;&gt; &gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; &gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; &gt;&gt; @@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVSt=
ate *env, TranslationBlock *tb,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 static void riscv_cpu_reset(DeviceState *dev)<br>
&gt;&gt; &gt;&gt;=C2=A0 {<br>
&gt;&gt; &gt;&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint8_t iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 int i, irq, rdzero;<br>
&gt;&gt; &gt;&gt; +#endif<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(dev);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPUClass *mcc =3D RISCV_CPU_GET_=
CLASS(cpu);<br>
&gt;&gt; &gt;&gt; @@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceSt=
ate *dev)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;miclaim =3D MIP_SGEIP;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D env-&gt;resetvec;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;two_stage_lookup =3D false;<b=
r>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Initialized default priorities of local=
 interrupts. */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(env-&gt;mi=
prio); i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D riscv_cpu_default_=
priority(i);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;miprio[i] =3D (i =3D=
=3D IRQ_M_EXT) ? 0 : iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;siprio[i] =3D (i =3D=
=3D IRQ_S_EXT) ? 0 : iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hviprio[i] =3D 0;<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 i =3D 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 while (!riscv_cpu_hviprio_index2irq(i, &am=
p;irq, &amp;rdzero)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdzero) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hvipri=
o[irq] =3D env-&gt;miprio[irq];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* mmte is supposed to have pm.curren=
t hardwired to 1 */<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mmte |=3D (PM_EXT_INITIAL | M=
MTE_M_PM_CURRENT);<br>
&gt;&gt; &gt;&gt;=C2=A0 #endif<br>
&gt;&gt; &gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; &gt;&gt; index 02f3ef2c3c..140fabfdf9 100644<br>
&gt;&gt; &gt;&gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; &gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; &gt;&gt; @@ -182,6 +182,10 @@ struct CPURISCVState {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: p=
riv-1.10.0 */<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Machine and Supervisor interrupt priori=
ties */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint8_t miprio[64];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint8_t siprio[64];<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hstatus;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hedeleg;<br>
&gt;&gt; &gt;&gt; @@ -194,6 +198,9 @@ struct CPURISCVState {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hgeip;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t htimedelta;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Hypervisor controlled virtual interrupt=
 priorities */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint8_t hviprio[64];<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Virtual CSRs */<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* For RV32 this is 32-bit vssta=
tus and 32-bit vsstatush.<br>
&gt;&gt; &gt;&gt; @@ -379,6 +386,11 @@ int riscv_cpu_write_elf32_note(Write=
CoreDumpFunction f, CPUState *cs,<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cpuid, vo=
id *opaque);<br>
&gt;&gt; &gt;&gt;=C2=A0 int riscv_cpu_gdb_read_register(CPUState *cpu, GByt=
eArray *buf, int reg);<br>
&gt;&gt; &gt;&gt;=C2=A0 int riscv_cpu_gdb_write_register(CPUState *cpu, uin=
t8_t *buf, int reg);<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_hviprio_index2irq(int index, int *out_irq,=
 int *out_rdzero);<br>
&gt;&gt; &gt;&gt; +uint8_t riscv_cpu_default_priority(int irq);<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_mirq_pending(CPURISCVState *env);<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_sirq_pending(CPURISCVState *env);<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_vsirq_pending(CPURISCVState *env);<br>
&gt;&gt; &gt;&gt;=C2=A0 bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
&gt;&gt; &gt;&gt;=C2=A0 target_ulong riscv_cpu_get_geilen(CPURISCVState *en=
v);<br>
&gt;&gt; &gt;&gt;=C2=A0 void riscv_cpu_set_geilen(CPURISCVState *env, targe=
t_ulong geilen);<br>
&gt;&gt; &gt;&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu=
_helper.c<br>
&gt;&gt; &gt;&gt; index f94a36fa89..e3532de4cf 100644<br>
&gt;&gt; &gt;&gt; --- a/target/riscv/cpu_helper.c<br>
&gt;&gt; &gt;&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt;&gt; &gt;&gt; @@ -151,36 +151,225 @@ void cpu_get_tb_cpu_state(CPURISCV=
State *env, target_ulong *pc,<br>
&gt;&gt; &gt;&gt;=C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;&gt; &gt;&gt; -static int riscv_cpu_local_irq_pending(CPURISCVState *en=
v)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +/*<br>
&gt;&gt; &gt;&gt; + * The HS-mode is allowed to configure priority only for=
 the<br>
&gt;&gt; &gt;&gt; + * following VS-mode local interrupts:<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * 0=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; &gt;&gt; + * 1=C2=A0 Supervisor software interrupt<br>
&gt;&gt; &gt;&gt; + * 4=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; &gt;&gt; + * 5=C2=A0 Supervisor timer interrupt<br>
&gt;&gt; &gt;&gt; + * 8=C2=A0 (Reserved interrupt, reads as zero)<br>
&gt;&gt; &gt;&gt; + * 13 (Reserved interrupt)<br>
&gt;&gt; &gt;&gt; + * 14 &quot;<br>
&gt;&gt; &gt;&gt; + * 15 &quot;<br>
&gt;&gt; &gt;&gt; + * 16 &quot;<br>
&gt;&gt; &gt;&gt; + * 18 Debug/trace interrupt<br>
&gt;&gt; &gt;&gt; + * 20 (Reserved interrupt)<br>
&gt;&gt; &gt;&gt; + * 22 &quot;<br>
&gt;&gt; &gt;&gt; + * 24 &quot;<br>
&gt;&gt; &gt;&gt; + * 26 &quot;<br>
&gt;&gt; &gt;&gt; + * 28 &quot;<br>
&gt;&gt; &gt;&gt; + * 30 (Reserved for standard reporting of bus or system =
errors)<br>
&gt;&gt; &gt;&gt; + */<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static int hviprio_index2irq[] =3D<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 2=
2, 24, 26, 28, 30 };<br>
&gt;&gt; &gt;&gt; +static int hviprio_index2rdzero[] =3D<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0 };<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_hviprio_index2irq(int index, int *out_irq,=
 int *out_rdzero)<br>
&gt;&gt; &gt;&gt;=C2=A0 {<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong virt_enabled =3D riscv_cpu_vi=
rt_enabled(env);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (index &lt; 0 || ARRAY_SIZE(hviprio_ind=
ex2irq) &lt;=3D index) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (out_irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_irq =3D hviprio_index2i=
rq[index];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env=
-&gt;mstatus, MSTATUS_MIE);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env=
-&gt;mstatus, MSTATUS_SIE);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (out_rdzero) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *out_rdzero =3D hviprio_inde=
x2rdzero[index];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong vsgemask =3D<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(target_ulong)1 &lt;&lt; get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong vsgein =3D (env-&gt;hgeip &am=
p; vsgemask) ? MIP_VSEIP : 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong pending =3D (env-&gt;mip | vs=
gein) &amp; env-&gt;mie;<br>
&gt;&gt; &gt;&gt; +uint8_t riscv_cpu_default_priority(int irq)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 int u, l;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint8_t iprio =3D IPRIO_MMAXIPRIO;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;=
priv &lt; PRV_M ||<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_M &amp;&amp; ms=
tatus_mie);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong sie=C2=A0 =C2=A0 =3D env-&gt;=
priv &lt; PRV_S ||<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; ms=
tatus_sie);<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong hsie=C2=A0 =C2=A0=3D virt_ena=
bled || sie;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong vsie=C2=A0 =C2=A0=3D virt_ena=
bled &amp;&amp; sie;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (irq &lt; 0 || irq &gt; 63) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 target_ulong irqs =3D<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=
 ~env-&gt;mideleg &amp; -mie) |<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=
=C2=A0 env-&gt;mideleg &amp; ~env-&gt;hideleg &amp; -hsie) |<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pending &amp;=
=C2=A0 env-&gt;mideleg &amp;=C2=A0 env-&gt;hideleg &amp; -vsie);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Default priorities of local interr=
upts are defined in the<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* RISC-V Advanced Interrupt Architec=
ture specification.<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* ----------------------------------=
------------------------------<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Default=C2=A0 |<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Priority | Major Interrupt N=
umbers<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* ----------------------------------=
------------------------------<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Highest=C2=A0 | 63 (3f), 62 =
(3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 (0b),=C2=A0 3 (03),=C2=A0 7 (07)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 (09),=C2=A0 1 (01),=C2=A0 5 (05)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 12 (0c)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 10 (0a),=C2=A0 2 (02),=C2=A0 6 (06)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Lowest=C2=A0 =C2=A0| 35 (23)=
, 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* ----------------------------------=
------------------------------<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctz64(irqs); /* since=
 non-zero */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 u =3D IPRIO_DEFAULT_U(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 l =3D IPRIO_DEFAULT_L(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (u =3D=3D 0) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq =3D=3D IRQ_VS_EXT ||=
 irq =3D=3D IRQ_VS_TIMER ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D=3D IRQ=
_VS_SOFT) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_VS;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_=
GEXT) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_SGEXT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_S_=
EXT || irq =3D=3D IRQ_S_TIMER ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0irq =3D=3D IRQ_S_SOFT) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_S;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (irq =3D=3D IRQ_M_=
EXT || irq =3D=3D IRQ_M_TIMER ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0irq =3D=3D IRQ_M_SOFT) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_M;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_VS;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 1) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &lt; 8) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_16_23(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRI=
O_DEFAULT_24_31(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 2) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_32_4=
7(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (u =3D=3D 3) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_DEFAULT_48_6=
3(irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return iprio;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static int riscv_cpu_pending_to_irq(CPURISCVState *env,<=
br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint6=
4_t pending, uint8_t *iprio)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 int irq, best_irq =3D RISCV_EXCP_NONE;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 unsigned int prio, best_prio =3D UINT_MAX;=
<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!pending) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 irq =3D ctz64(pending);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)=
) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 pending =3D pending &gt;&gt; irq;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 while (pending) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D iprio[irq];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!prio) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prio =3D (risc=
v_cpu_default_priority(irq) &lt; IPRIO_DEFAULT_M) ?<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01 : IPRIO_MMAXIPRIO;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Anup,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have a question regarding configuring priorities of major i=
nterrupts.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; riscv_cpu_default_priority() for M-mode external interrupt wo=
uld return IPRIO_DEFAULT_M (8).<br>
&gt;&gt; &gt; but the comparison here is &lt; IPRIO_DEFAULT_M,<br>
&gt;&gt; &gt; so if M-mode external interrupt is pending, the prio would be=
 assigned to IPRIO_MMAXIPRIO (255).<br>
&gt;&gt; &gt; Is this the expected behavior?<br>
&gt;&gt;<br>
&gt;&gt; Actually, for irq =3D=3D IRQ_M_EXT the prio should be IPRIO_DEFAUL=
T_M<br>
&gt;&gt; same for irq =3D=3D IRQ_S_EXT.<br>
&gt;&gt;<br>
&gt;&gt; Goot catch, I will fix this in next revision.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also, why is IPRIO_DEFAULT_M been compared?<br>
&gt;&gt; &gt; Should IPRIO_DEFAULT_S and IPRIO_DEFAULT_VS be used for S-mod=
e and VS-mode interrupts?<br>
&gt;&gt;<br>
&gt;&gt; For M-mode, we should compare IPRIO_DEFAULT_M.<br>
&gt;&gt; For S/VS-mode, we should compare IPRIO_DEFAULT_S<br>
&gt;&gt; but the priority registers used for S-mode and VS-mode<br>
&gt;&gt; are different.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pending &amp; 0x1) &amp=
;&amp; (prio &lt; best_prio)) {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If both interrupt 63 and 62 are pending-and-enabled,<br>
&gt;&gt; &gt; with their iprio values both assigned to zero.<br>
&gt;&gt; &gt; Interrupt 62 would be picked, because best_prio will be 1 whe=
n interrupt 62 is been checked.<br>
&gt;&gt; &gt; As the default priority order for interrupt 63 is also less t=
han IPRIO_DEFAULT_M (8),<br>
&gt;&gt; &gt; so prio would be assigned to 1 as well.<br>
&gt;&gt; &gt; But as prio is not less than best_prio, so best_irq would sti=
ll be interrupt 62.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; However, according to the default priority table in AIA spec,=
<br>
&gt;&gt; &gt; interrupt 63 should have a higher priority than interrupt 62:=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Interrupt 63 has the highest default priority, an=
d interrupt 32 has the lowest default priority.<br>
&gt;&gt;<br>
&gt;&gt; Argh, the comparision &quot;prio &lt; best_prio&quot; should have =
been<br>
&gt;&gt; &quot;prio &lt;=3D best_prio&quot;.<br>
&gt;&gt;<br>
&gt;&gt; I am certainly aware of the fact that if two interrupts<br>
&gt;&gt; have same priority then higher interrupt number should be<br>
&gt;&gt; preferred. This is silly mistake on my part.<br>
&gt;&gt;<br>
&gt;&gt; I really appreciate your detailed review. Thanks.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D i=
rq;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_prio =3D =
prio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq++;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pending =3D pending &gt;&gt;=
 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return best_irq;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yet I have another question for major interrupts priorities.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; According to AIA spec (v0.2-draft.28):<br>
&gt;&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; The priority number for a machine-level external interrupt (b=
its 31:24 of register iprio2)<br>
&gt;&gt; &gt; must also be read-only zero.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; When an interrupt=E2=80=99s priority number in the array is z=
ero (either read-only zero or set to zero),<br>
&gt;&gt; &gt; its priority is the default order from Section 6.1.<br>
&gt;&gt; &gt; Setting an interrupt=E2=80=99s priority number instead to a n=
onzero value p gives that interrupt nominally<br>
&gt;&gt; &gt; the same priority as a machine-level external interrupt with =
priority number p.<br>
&gt;&gt; &gt; For a major interrupt that defaults to a higher priority than=
 machine external interrupts,<br>
&gt;&gt; &gt; setting its priority number to a nonzero value lowers its pri=
ority.<br>
&gt;&gt; &gt; For a major interrupt that defaults to a lower priority than =
machine external interrupts,<br>
&gt;&gt; &gt; setting its priority number to a nonzero value raises its pri=
ority.<br>
&gt;&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From the above sentences,<br>
&gt;&gt; &gt; The M-mode external interrupt has iprio value of 0, so the de=
fault priority order is applied.<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s correct and same logic applies to S/VS-mode extern=
al interrupts.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What are the priorities for the major interrupt interrupts wh=
ich are higher/lower than<br>
&gt;&gt; &gt; M-mode external interrupt when their iprio values are not 0?<=
br>
&gt;&gt;<br>
&gt;&gt; For a major interrupt X (which is not an external interrupt) havin=
g iprio value 0,<br>
&gt;&gt; we take iprio of X as 1 or 255 based of comparison of default prio=
rity of X<br>
&gt;&gt; with default priority of external interrupt.<br>
&gt;&gt; (Refer, documentation of &quot;mtopi&quot; (Section 6.3.2) and &qu=
ot;stopi&quot; (Section 6.5.2))<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Which interrupt will be picked when:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0M-mode external interrupt is pending-and-enabled,=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Interrupt with higher default priority than M-mod=
e external interrupt is pending-and-enabled, and<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Interrupt with lower default priority than M-mode=
 external interrupt is pending-and-enabled/<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From the above riscv_cpu_pending_to_irq(),<br>
&gt;&gt; &gt; If both interrupt 63 and interrupt 18&#39;s iprio values are =
assigned to the value of 10,<br>
&gt;&gt;<br>
&gt;&gt; You mean both these interrupt have iprio 0, right ?<br>
&gt;<br>
&gt;<br>
&gt; I mean if both interrupt 63 and interrupt 18&#39;s iprio values are as=
signed with value 10.<br>
&gt; If interrupt 63, interrupt 18, and M-mode external interrupt are pendi=
ng-and-enabled.<br>
&gt; Will M-mode external interrupt be picked as it has the default priorit=
y: 8,<br>
&gt; which is less than 10 of interrupt 63 and interrupt 18?<br>
<br>
Yes, in this case &quot;mtopi&quot; CSR read will return M-mode external in=
terrupt.<br>
<br>
&gt;<br>
&gt; What if, interrupt 63 has iprio value of 10 and interrupt 18 has iprio=
 value of 6.<br>
&gt; If interrupt 63, interrupt 18, and M-mode external interrupt are pendi=
ng-and-enabled.<br>
&gt; Will interrupt 18 be picked because it has the smallest iprio value (i=
.e. higher interrupt priority)?<br>
<br>
Yes, in this case &quot;mtopi&quot; CSR read will return interrupt 18.<br>
<br>
&gt;<br>
&gt; Can I say that for M-mode major interrupts:<br>
&gt;<br>
&gt; If interrupt X&#39;s iprio value is zero, its interrupt priority will =
be 1 or 255,<br>
&gt; base on its default priority which is higher (1) or less (255) than M-=
mode external interrupt.<br>
<br>
Yes, this is correct form M-mode (and &quot;mtopi&quot; CSR) perspective.<b=
r>
<br>
For S-mode (and &quot;stopi&quot; or &quot;vstopi&quot; CSR) perspective, i=
t will be<br>
compared against S-mode external interrupt default priority.<br>
(Note: I will fix this in next revision)<br>
<br>
&gt;<br>
&gt; And if interrupt X&#39;s iprio value is not zero, its interrupt priori=
ty will be the assigned iprio value.<br>
<br>
Yes, this is correct.<br>
<br>
&gt; So it&#39;s possible for a lower default priority interrupt (e.g. 18) =
to have higher priority than M-mode external interrupt<br>
&gt; if its iprio value is less than 8?<br>
<br>
Yes, this is correct. The fact that iprio of major interrupts are programma=
ble<br>
it allow software to override the default priority assignement.<br>
<br>
&gt;<br>
&gt; The overall interrupt priority order is compared between the values of=
:<br>
&gt;=C2=A0 =C2=A0* If iprio value is zero: 1 or 255<br>
&gt;=C2=A0 =C2=A0* If iprio value is not zero: the iprio value been assigne=
d<br>
<br>
This two statements are correct.<br>
<br>
&gt;=C2=A0 =C2=A0* M-mode external interrupt: the default priority value: 8=
?<br>
&gt; and the interrupt with the smallest value will be picked.<br>
<br>
I would like to clarify that it is QEMU implementation that has<br>
chosen to assign default priorities in 1 to 15 range hence we<br>
have M-mode external interrupt default priority as 8. Some<br>
other implementation may chose a different default priority<br>
assignments but it should comply with the table in the<br>
&quot;Section 6.1&quot; of the AIA specification.<br>
<br>
Regards,<br>
Anup<br></blockquote><div><br></div><div>Thanks for the detailed explanatio=
n :)</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; and interrupt 63, interrupt 18 and M-mode external interrupts=
 are pending-and-enabled.<br>
&gt;&gt; &gt; Interrupt 18 would be picked.<br>
&gt;&gt; &gt; Is this the correct expectation?<br>
&gt;&gt;<br>
&gt;&gt; If both 63 and 18 have iprio 0 then interrupt 63 would be picked<b=
r>
&gt;&gt; because 63 has higher default priority compared to default<br>
&gt;&gt; priorities of both M-mode external interrupt and interrupt 18.<br>
&gt;&gt;<br>
&gt;&gt; &gt; I&#39;m a bit confused with the correct priority order of the=
 interrupts with/without non-zero value iprio and the default priority.<br>
&gt;&gt;<br>
&gt;&gt; Whenever iprio of an interrupt X is 0, the default priority of<br>
&gt;&gt; interrupt X compared against default external interrupt<br>
&gt;&gt; priority and based on this comparison 1 (highest) or 255 (lowest)<=
br>
&gt;&gt; priority is used for interrupt X.<br>
&gt;&gt;<br>
&gt;&gt; In other, a saturated priority is used on interrupt X when<br>
&gt;&gt; it&#39;s iprio is set to zero.<br>
&gt;<br>
&gt;<br>
&gt; Thanks for the detailed explanation.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Anup<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks,<br>
&gt;&gt; &gt; Frank Chang<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint64_t riscv_cpu_all_pending(CPURISCVState *env=
)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t gein =3D get_field(env-&gt;hstatu=
s, HSTATUS_VGEIN);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t vsgein =3D (env-&gt;hgeip &amp; (=
1ULL &lt;&lt; gein)) ? MIP_VSEIP : 0;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&g=
t;mie;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_mirq_pending(CPURISCVState *env)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(en=
v) &amp; ~env-&gt;mideleg &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs,=
 env-&gt;miprio);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_sirq_pending(CPURISCVState *env)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(en=
v) &amp; env-&gt;mideleg &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs,=
 env-&gt;siprio);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +int riscv_cpu_vsirq_pending(CPURISCVState *env)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs =3D riscv_cpu_all_pending(en=
v) &amp; env-&gt;mideleg &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return riscv_cpu_pending_to_irq(env, irqs =
&gt;&gt; 1, env-&gt;hviprio);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static int riscv_cpu_local_irq_pending(CPURISCVState *en=
v)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 int virq;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t irqs, pending, mie, hsie, vsie;<b=
r>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Determine interrupt enable state of all=
 privilege modes */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D (env-&gt;priv &lt; =
PRV_S) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
env-&gt;priv =3D=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE=
));<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE; /* i=
ndicates no pending interrupt */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mie =3D (env-&gt;priv &lt; P=
RV_M) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&g=
t;priv =3D=3D PRV_M &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_MIE));<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hsie =3D (env-&gt;priv &lt; =
PRV_S) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
env-&gt;priv =3D=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE=
));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsie =3D 0;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Determine all pending interrupts */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 pending =3D riscv_cpu_all_pending(env);<br=
>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Check M-mode interrupts */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; ~env-&gt;mideleg &a=
mp; -mie;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_=
irq(env, irqs, env-&gt;miprio);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Check HS-mode interrupts */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &am=
p; ~env-&gt;hideleg &amp; -hsie;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_cpu_pending_to_=
irq(env, irqs, env-&gt;siprio);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Check VS-mode interrupts */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 irqs =3D pending &amp; env-&gt;mideleg &am=
p; env-&gt;hideleg &amp; -vsie;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (irqs) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virq =3D riscv_cpu_pending_t=
o_irq(env, irqs &gt;&gt; 1, env-&gt;hviprio);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (virq &lt;=3D 0) ? vi=
rq : virq + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Indicate no pending interrupt */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; &gt;&gt;=C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 bool riscv_cpu_exec_interrupt(CPUState *cs, int int=
errupt_request)<br>
&gt;&gt; &gt;&gt; diff --git a/target/riscv/machine.c b/target/riscv/machin=
e.c<br>
&gt;&gt; &gt;&gt; index 76dd0d415c..cffc444969 100644<br>
&gt;&gt; &gt;&gt; --- a/target/riscv/machine.c<br>
&gt;&gt; &gt;&gt; +++ b/target/riscv/machine.c<br>
&gt;&gt; &gt;&gt; @@ -92,6 +92,7 @@ static const VMStateDescription vmstate=
_hyper =3D {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgei=
e, RISCVCPU),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.hgei=
p, RISCVCPU),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.htim=
edelta, RISCVCPU),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.hvip=
rio, RISCVCPU, 64),<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.vsst=
atus, RISCVCPU),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.vstv=
ec, RISCVCPU),<br>
&gt;&gt; &gt;&gt; @@ -173,6 +174,8 @@ const VMStateDescription vmstate_risc=
v_cpu =3D {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(en=
v.gpr, RISCVCPU, 32),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64_ARRAY(en=
v.fpr, RISCVCPU, 32),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.mipr=
io, RISCVCPU, 64),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(env.sipr=
io, RISCVCPU, 64),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.pc, =
RISCVCPU),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.load=
_res, RISCVCPU),<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.load=
_val, RISCVCPU),<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.25.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--00000000000011527905d5776755--

