Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fN7-00058K-QM
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 22:41:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9fN6-000582-Bw
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:41:24 -0500
Received: from [2607:f8b0:4864:20::536] (port=35433
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9fN3-0006rA-VQ
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:41:24 -0500
Received: by mail-pg1-x536.google.com with SMTP id p125so1506987pga.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YO2zoV62cFtO6gWIJ06Ri8hCyIQ96Jq+w2eGL1VRESM=;
 b=nbbXvHvAOI+LqpkNmO4dRuYJCsR7uXTQrqQw9Sn7jkwaXjnXfeL3BLB117bXeMkKMc
 pIxtEH3jWq/B8QgCvpv/HvzFViDJvSX0I4GOKwsYOiyeuN8uKI4VGgFwv7+XzHA/Mf+f
 g5bDEANACr8DNo3ilTnXzLuIMV7foYeI/AqXCQ631OSBbyMrPWs3Y1dQxdBUAydbkAOs
 Wm67I2i1SCopRH70Dfux8Fg8zISSuCwztjeyQGR1SWefLWpAcYMhFvTvBYHp3rSTxyzK
 YVUHP4R5DTNrJvD8H8PktkPo2HARkJ2zYMTlqkWRgozwMEGoswEMp7CCohdBhKGPDPfP
 fQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YO2zoV62cFtO6gWIJ06Ri8hCyIQ96Jq+w2eGL1VRESM=;
 b=IV45k0KQqSll0RtwHUEYgH84n2li7agOcoOLM1knFXaA8nG53juYWKO/IpTQHxPH5L
 3VSeN6CAIB8ZT89m5aFMU859TfZVafT6fRBxabm54v6Xi5mtn3jMCZC9rgZQOVQJaJiI
 u6DR+IF5iztS/PaJuKANeymG72R3yzAJNheqMJxJ1B7TFIfEsp+kk2S6UkUMkVXOS7S8
 c+xRZJxlcC6NpKgSW708jmZynertwxeFvZcwPEvbDQdaldJ/ubspaApO7NpyT/tXa8Sc
 E24CBBTLcNGSNIQBE7uaNWIQ7c5HUUcBKZNsNc5Q5JFm0h5VlbYe6WdZ9DfOLJ2iNJYM
 tyog==
X-Gm-Message-State: AOAM533fHXIWXDE+h3AY3I9yFJkzibftoDOYvPh9GUTn+V6k8C3g68Pi
 TaaJnOVQd2LfdBQT234YTGbAQIP1EiHwkQvLJFry2Q==
X-Google-Smtp-Source: ABdhPJzIEn0u+UYfvlgBKb3ANinwmjus+s0Ir2h7fwPGAF98v3gRiatIopJchDIsuNxfZVMi50TznqH4yxzoQMcSyQQ=
X-Received: by 2002:a65:6859:: with SMTP id q25mr18204320pgt.452.1642477279599; 
 Mon, 17 Jan 2022 19:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20220117132826.426418-1-anup@brainfault.org>
 <20220117132826.426418-10-anup@brainfault.org>
 <CANzO1D2OXSvhYgNKJSNTJaF7g5oJoP6pVj-+K+wWz0uWkQvbLw@mail.gmail.com>
In-Reply-To: <CANzO1D2OXSvhYgNKJSNTJaF7g5oJoP6pVj-+K+wWz0uWkQvbLw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Jan 2022 09:11:08 +0530
Message-ID: <CAK9=C2XwwT-uu+RaNTyrODtwxinxK--z1xhPPF5nztJmyNgnkA@mail.gmail.com>
Subject: Re: [PATCH v7 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Frank Chang <frank.chang@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 18 Jan 2022 03:41:24 -0000

On Tue, Jan 18, 2022 at 9:04 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Anup Patel <anup@brainfault.org> =E6=96=BC 2022=E5=B9=B41=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>>
>> From: Anup Patel <anup.patel@wdc.com>
>>
>> The AIA spec defines programmable 8-bit priority for each local interrup=
t
>> at M-level, S-level and VS-level so we extend local interrupt processing
>> to consider AIA interrupt priorities. The AIA CSRs which help software
>> configure local interrupt priorities will be added by subsequent patches=
.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  target/riscv/cpu.c        |  19 +++
>>  target/riscv/cpu.h        |  12 ++
>>  target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++++++++----
>>  target/riscv/machine.c    |   3 +
>>  4 files changed, 255 insertions(+), 21 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 76f9786836..167d86eef7 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env, Trans=
lationBlock *tb,
>>
>>  static void riscv_cpu_reset(DeviceState *dev)
>>  {
>> +#ifndef CONFIG_USER_ONLY
>> +    uint8_t iprio;
>> +    int i, irq, rdzero;
>> +#endif
>>      CPUState *cs =3D CPU(dev);
>>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
>> @@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)
>>      env->miclaim =3D MIP_SGEIP;
>>      env->pc =3D env->resetvec;
>>      env->two_stage_lookup =3D false;
>> +
>> +    /* Initialized default priorities of local interrupts. */
>> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
>> +        iprio =3D riscv_cpu_default_priority(i);
>> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
>> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
>> +        env->hviprio[i] =3D 0;
>> +    }
>> +    i =3D 0;
>> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
>> +        if (!rdzero) {
>> +            env->hviprio[irq] =3D env->miprio[irq];
>> +        }
>> +        i++;
>> +    }
>>      /* mmte is supposed to have pm.current hardwired to 1 */
>>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>>  #endif
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index cee70f8608..65d2b606fc 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -190,6 +190,10 @@ struct CPURISCVState {
>>      target_ulong mcause;
>>      target_ulong mtval;  /* since: priv-1.10.0 */
>>
>> +    /* Machine and Supervisor interrupt priorities */
>> +    uint8_t miprio[64];
>> +    uint8_t siprio[64];
>> +
>>      /* Hypervisor CSRs */
>>      target_ulong hstatus;
>>      target_ulong hedeleg;
>> @@ -202,6 +206,9 @@ struct CPURISCVState {
>>      target_ulong hgeip;
>>      uint64_t htimedelta;
>>
>> +    /* Hypervisor controlled virtual interrupt priorities */
>> +    uint8_t hviprio[64];
>> +
>>      /* Upper 64-bits of 128-bit CSRs */
>>      uint64_t mscratchh;
>>      uint64_t sscratchh;
>> @@ -392,6 +399,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunctio=
n f, CPUState *cs,
>>                                 int cpuid, void *opaque);
>>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
>>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzer=
o);
>> +uint8_t riscv_cpu_default_priority(int irq);
>> +int riscv_cpu_mirq_pending(CPURISCVState *env);
>> +int riscv_cpu_sirq_pending(CPURISCVState *env);
>> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 59c8f900df..3a36200780 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, tar=
get_ulong *pc,
>>  }
>>
>>  #ifndef CONFIG_USER_ONLY
>> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> +
>> +/*
>> + * The HS-mode is allowed to configure priority only for the
>> + * following VS-mode local interrupts:
>> + *
>> + * 0  (Reserved interrupt, reads as zero)
>> + * 1  Supervisor software interrupt
>> + * 4  (Reserved interrupt, reads as zero)
>> + * 5  Supervisor timer interrupt
>> + * 8  (Reserved interrupt, reads as zero)
>> + * 13 (Reserved interrupt)
>> + * 14 "
>> + * 15 "
>> + * 16 "
>> + * 18 Debug/trace interrupt
>> + * 20 (Reserved interrupt)
>> + * 22 "
>> + * 24 "
>> + * 26 "
>> + * 28 "
>> + * 30 (Reserved for standard reporting of bus or system errors)
>> + */
>> +
>> +static int hviprio_index2irq[] =3D
>> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
>> +static int hviprio_index2rdzero[] =3D
>> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
>> +
>> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzer=
o)
>>  {
>> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
>> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (out_irq) {
>> +        *out_irq =3D hviprio_index2irq[index];
>> +    }
>>
>> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
>> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
>> +    if (out_rdzero) {
>> +        *out_rdzero =3D hviprio_index2rdzero[index];
>> +    }
>>
>> -    target_ulong vsgemask =3D
>> -                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEI=
N);
>> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
>> +    return 0;
>> +}
>>
>> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
>> +uint8_t riscv_cpu_default_priority(int irq)
>> +{
>> +    int u, l;
>> +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
>>
>> -    target_ulong mie    =3D env->priv < PRV_M ||
>> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
>> -    target_ulong sie    =3D env->priv < PRV_S ||
>> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
>> -    target_ulong hsie   =3D virt_enabled || sie;
>> -    target_ulong vsie   =3D virt_enabled && sie;
>> +    if (irq < 0 || irq > 63) {
>> +        return iprio;
>> +    }
>>
>> -    target_ulong irqs =3D
>> -            (pending & ~env->mideleg & -mie) |
>> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
>> -            (pending &  env->mideleg &  env->hideleg & -vsie);
>> +    /*
>> +     * Default priorities of local interrupts are defined in the
>> +     * RISC-V Advanced Interrupt Architecture specification.
>> +     *
>> +     * ----------------------------------------------------------------
>> +     *  Default  |
>> +     *  Priority | Major Interrupt Numbers
>> +     * ----------------------------------------------------------------
>> +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c)=
,
>> +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38)=
,
>> +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34)=
,
>> +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
>> +     *           |
>> +     *           | 11 (0b),  3 (03),  7 (07)
>> +     *           |  9 (09),  1 (01),  5 (05)
>> +     *           | 12 (0c)
>> +     *           | 10 (0a),  2 (02),  6 (06)
>> +     *           |
>> +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c)=
,
>> +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28)=
,
>> +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24)=
,
>> +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
>> +     * ----------------------------------------------------------------
>> +     */
>>
>> -    if (irqs) {
>> -        return ctz64(irqs); /* since non-zero */
>> +    u =3D IPRIO_DEFAULT_U(irq);
>> +    l =3D IPRIO_DEFAULT_L(irq);
>> +    if (u =3D=3D 0) {
>> +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
>> +            irq =3D=3D IRQ_VS_SOFT) {
>> +            iprio =3D IPRIO_DEFAULT_VS;
>> +        } else if (irq =3D=3D IRQ_S_GEXT) {
>> +            iprio =3D IPRIO_DEFAULT_SGEXT;
>> +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER ||
>> +                   irq =3D=3D IRQ_S_SOFT) {
>> +            iprio =3D IPRIO_DEFAULT_S;
>> +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER ||
>> +                   irq =3D=3D IRQ_M_SOFT) {
>> +            iprio =3D IPRIO_DEFAULT_M;
>> +        } else {
>> +            iprio =3D IPRIO_DEFAULT_VS;
>> +        }
>> +    } else if (u =3D=3D 1) {
>> +        if (l < 8) {
>> +            iprio =3D IPRIO_DEFAULT_16_23(irq);
>> +        } else {
>> +            iprio =3D IPRIO_DEFAULT_24_31(irq);
>> +        }
>> +    } else if (u =3D=3D 2) {
>> +        iprio =3D IPRIO_DEFAULT_32_47(irq);
>> +    } else if (u =3D=3D 3) {
>> +        iprio =3D IPRIO_DEFAULT_48_63(irq);
>> +    }
>> +
>> +    return iprio;
>> +}
>> +
>> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>> +                                    int extirq, unsigned int extirq_def=
_prio,
>> +                                    uint64_t pending, uint8_t *iprio)
>> +{
>> +    int irq, best_irq =3D RISCV_EXCP_NONE;
>> +    unsigned int prio, best_prio =3D UINT_MAX;
>> +
>> +    if (!pending) {
>> +        return RISCV_EXCP_NONE;
>> +    }
>> +
>> +    irq =3D ctz64(pending);
>> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> +        return irq;
>> +    }
>> +
>> +    pending =3D pending >> irq;
>> +    while (pending) {
>> +        prio =3D iprio[irq];
>> +        if (!prio) {
>> +            if (irq =3D=3D extirq) {
>> +                prio =3D extirq_def_prio;
>> +            } else {
>> +                prio =3D (riscv_cpu_default_priority(irq) < extirq_def_=
prio) ?
>> +                       1 : IPRIO_MMAXIPRIO;
>> +            }
>> +        }
>> +        if ((pending & 0x1) && (prio <=3D best_prio)) {
>> +            best_irq =3D irq;
>> +            best_prio =3D prio;
>> +        }
>> +        irq++;
>> +        pending =3D pending >> 1;
>> +    }
>> +
>> +    return best_irq;
>> +}
>
>
> Hi Anup,
>
> RISC-V Priv spec defines the priority order:
>   Multiple simultaneous interrupts destined for the same privilege mode
>   are handled in the following decreasing priority order: MEI, MSI, MTI, =
SEI, SSI, STI, UEI,
>   USI, UTI.
>
> So the priority order should be: MEI (11) > MSI (3) > MTI (7).
>
> But if MSI and MTI are pending-and-enabled,
> with all of their iprio assigned to their default priority orders (IPRIO_=
DEFAULT_M)
> (or iprio assigned to zero, which the default priority orders are applied=
 as well).
> riscv_cpu_pending_to_irq() would incorrectly pick MTI (7), instead of MSI=
 (3),
> because they all have the same default priority order: IPRIO_DEFAULT_M.

Ahh yes, I missed addressing this one.

If you can review other patches as well then I can send v8 this week itself=
.

Thanks,
Anup

>
> Regards,
> Frank Chang
>
>>
>> +
>> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>> +{
>> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>> +
>> +    return (env->mip | vsgein) & env->mie;
>> +}
>> +
>> +int riscv_cpu_mirq_pending(CPURISCVState *env)
>> +{
>> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
>> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>> +
>> +    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
>> +                                    irqs, env->miprio);
>> +}
>> +
>> +int riscv_cpu_sirq_pending(CPURISCVState *env)
>> +{
>> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
>> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>> +
>> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
>> +                                    irqs, env->siprio);
>> +}
>> +
>> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
>> +{
>> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
>> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>> +
>> +    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
>> +                                    irqs >> 1, env->hviprio);
>> +}
>> +
>> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> +{
>> +    int virq;
>> +    uint64_t irqs, pending, mie, hsie, vsie;
>> +
>> +    /* Determine interrupt enable state of all privilege modes */
>> +    if (riscv_cpu_virt_enabled(env)) {
>> +        mie =3D 1;
>> +        hsie =3D 1;
>> +        vsie =3D (env->priv < PRV_S) ||
>> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTAT=
US_SIE));
>>      } else {
>> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
>> +        mie =3D (env->priv < PRV_M) ||
>> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus, MSTATU=
S_MIE));
>> +        hsie =3D (env->priv < PRV_S) ||
>> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTAT=
US_SIE));
>> +        vsie =3D 0;
>>      }
>> +
>> +    /* Determine all pending interrupts */
>> +    pending =3D riscv_cpu_all_pending(env);
>> +
>> +    /* Check M-mode interrupts */
>> +    irqs =3D pending & ~env->mideleg & -mie;
>> +    if (irqs) {
>> +        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M=
,
>> +                                        irqs, env->miprio);
>> +    }
>> +
>> +    /* Check HS-mode interrupts */
>> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
>> +    if (irqs) {
>> +        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S=
,
>> +                                        irqs, env->siprio);
>> +    }
>> +
>> +    /* Check VS-mode interrupts */
>> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
>> +    if (irqs) {
>> +        virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT=
_S,
>> +                                        irqs >> 1, env->hviprio);
>> +        return (virq <=3D 0) ? virq : virq + 1;
>> +    }
>> +
>> +    /* Indicate no pending interrupt */
>> +    return RISCV_EXCP_NONE;
>>  }
>>
>>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index c11eb4639c..bae4f69725 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
>>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>>
>>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
>>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
>> @@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>>      .fields =3D (VMStateField[]) {
>>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
>> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
>> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
>>          VMSTATE_UINTTL(env.pc, RISCVCPU),
>>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
>>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
>> --
>> 2.25.1
>>
>>

