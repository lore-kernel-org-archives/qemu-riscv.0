Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7xcF-0001B2-5X
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 05:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xc8-00017L-UU
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:45:53 -0500
Received: from [2a00:1450:4864:20::42c] (port=43674
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xc6-0002Y4-2w
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:45:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o3so9258879wrh.10
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 02:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h81R1KIOdvBEAyV3JHDeA5G54KTTzeeo63XT97DcqR0=;
 b=JNHhRXtsaehWbzFGHeFbl8H9vcDxic2W7v4gG6sxUP1AVsAXXx6Z/Iu7o+hdj7PWmM
 lJUiMkvi8ZWXwURnxeIW+fvm3aQQiqdMWXrSrw7Zula/fePHcbAVuR/Z1dFnp2GDVXdU
 8/8r0oIdixHRbGeu3ZlSkDYSjamXkcX8+KhJBRvJkw1X7rZ5BfuuaBNVJiW/xXcBxeLg
 J5bIOjI38w7NLMq2eOgZ+w3C9ONLEASUUYi/kXRDWuqrn3P61YkwoefGyugxfwni+Kmw
 2m3By0Shpe7KR6dsPYo8l/NT5HKA46+wtdwOGn2i8nf1xLbJaBkB0NdRYfpRrdpCDicQ
 T5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h81R1KIOdvBEAyV3JHDeA5G54KTTzeeo63XT97DcqR0=;
 b=ssJf6cwTsbh0dVx/TShy/SczzlGKwwrAJKSvsEAr2lPvskL2K6+nXm4nLZwPz8a9Lb
 Nx6LRG5Px5a5ZvefgMsynCOM/GosXheYi/UjTswx1SCPf8q3NzyPBYtp5/2EmcC7DuSA
 z9P3PjJ2bHT3AiALsHsQc3fdtDvz/ijdoe0mQCg/wWa8eg6Gi21FMEmSfx5+XvXWa34r
 7AFODAqhi8D57JVjPzWGDg5WG7rwfG3q4/73t/73k7Jrms1c0oygpw0EmeDt5QJl+Ul2
 xFRZcaSaqzU7eLgX3hnkF6gVCE3hshxnDSNvAzdRSp7KZimK08tb0GfI4cIX36d7aP9m
 pRnQ==
X-Gm-Message-State: AOAM532TAbnwk0jXoT/etNDMZH0xGIBQyA86D8hllHjfZDYVQciFCCoW
 ajSbKobySc+jG8Ge6BEgHkJY8sAhXn3qXVybsWWPDQ==
X-Google-Smtp-Source: ABdhPJy+7YaMhymqAg+J5l1MBXRnjERzA4DpETqsv8fonAvKITXqAqpxZecKBTGdVmFsS7LSAyfSx57WxX/hs5xVc4U=
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr3498794wri.690.1642070747913; 
 Thu, 13 Jan 2022 02:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-10-anup@brainfault.org>
 <CANzO1D0XZ1SfNKHp9sd+FKMt40N3RXO92XbqbjiFq=DUAp18NQ@mail.gmail.com>
 <CAAhSdy3h_dpCAuxcdsYf73+M_33Y3f2_-LFx3Zv4E_OdKag7xg@mail.gmail.com>
 <CAE_xrPjueSQpY2b_9Y4vyzzh12sao0hJ=TGqrAQM-yw0wT=1Nw@mail.gmail.com>
In-Reply-To: <CAE_xrPjueSQpY2b_9Y4vyzzh12sao0hJ=TGqrAQM-yw0wT=1Nw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 16:15:35 +0530
Message-ID: <CAAhSdy2faOV1Z3rkJ1JDTi5RMEdFp27jPzLthVZgTaKv2MgmDg@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] target/riscv: Implement AIA local interrupt
 priorities
To: Frank Chang <frank.chang@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 10:45:54 -0000

On Wed, Jan 12, 2022 at 8:30 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Wed, Jan 12, 2022 at 1:18 AM Anup Patel <anup@brainfault.org> wrote:
>>
>>
>>
>> On Mon, Jan 10, 2022 at 6:38 PM Frank Chang <frank.chang@sifive.com> wro=
te:
>> >
>> > Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>> >>
>> >> From: Anup Patel <anup.patel@wdc.com>
>> >>
>> >> The AIA spec defines programmable 8-bit priority for each local inter=
rupt
>> >> at M-level, S-level and VS-level so we extend local interrupt process=
ing
>> >> to consider AIA interrupt priorities. The AIA CSRs which help softwar=
e
>> >> configure local interrupt priorities will be added by subsequent patc=
hes.
>> >>
>> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> >> Signed-off-by: Anup Patel <anup@brainfault.org>
>> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >> ---
>> >>  target/riscv/cpu.c        |  19 ++++
>> >>  target/riscv/cpu.h        |  12 ++
>> >>  target/riscv/cpu_helper.c | 231 ++++++++++++++++++++++++++++++++++--=
--
>> >>  target/riscv/machine.c    |   3 +
>> >>  4 files changed, 244 insertions(+), 21 deletions(-)
>> >>
>> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> >> index 9f1a4d1088..9ad26035e1 100644
>> >> --- a/target/riscv/cpu.c
>> >> +++ b/target/riscv/cpu.c
>> >> @@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVState *env, Tr=
anslationBlock *tb,
>> >>
>> >>  static void riscv_cpu_reset(DeviceState *dev)
>> >>  {
>> >> +#ifndef CONFIG_USER_ONLY
>> >> +    uint8_t iprio;
>> >> +    int i, irq, rdzero;
>> >> +#endif
>> >>      CPUState *cs =3D CPU(dev);
>> >>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>> >>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
>> >> @@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceState *dev)
>> >>      env->miclaim =3D MIP_SGEIP;
>> >>      env->pc =3D env->resetvec;
>> >>      env->two_stage_lookup =3D false;
>> >> +
>> >> +    /* Initialized default priorities of local interrupts. */
>> >> +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
>> >> +        iprio =3D riscv_cpu_default_priority(i);
>> >> +        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
>> >> +        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
>> >> +        env->hviprio[i] =3D 0;
>> >> +    }
>> >> +    i =3D 0;
>> >> +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
>> >> +        if (!rdzero) {
>> >> +            env->hviprio[irq] =3D env->miprio[irq];
>> >> +        }
>> >> +        i++;
>> >> +    }
>> >>      /* mmte is supposed to have pm.current hardwired to 1 */
>> >>      env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
>> >>  #endif
>> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> >> index 02f3ef2c3c..140fabfdf9 100644
>> >> --- a/target/riscv/cpu.h
>> >> +++ b/target/riscv/cpu.h
>> >> @@ -182,6 +182,10 @@ struct CPURISCVState {
>> >>      target_ulong mcause;
>> >>      target_ulong mtval;  /* since: priv-1.10.0 */
>> >>
>> >> +    /* Machine and Supervisor interrupt priorities */
>> >> +    uint8_t miprio[64];
>> >> +    uint8_t siprio[64];
>> >> +
>> >>      /* Hypervisor CSRs */
>> >>      target_ulong hstatus;
>> >>      target_ulong hedeleg;
>> >> @@ -194,6 +198,9 @@ struct CPURISCVState {
>> >>      target_ulong hgeip;
>> >>      uint64_t htimedelta;
>> >>
>> >> +    /* Hypervisor controlled virtual interrupt priorities */
>> >> +    uint8_t hviprio[64];
>> >> +
>> >>      /* Virtual CSRs */
>> >>      /*
>> >>       * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
>> >> @@ -379,6 +386,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunc=
tion f, CPUState *cs,
>> >>                                 int cpuid, void *opaque);
>> >>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int =
reg);
>> >>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int re=
g);
>> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rd=
zero);
>> >> +uint8_t riscv_cpu_default_priority(int irq);
>> >> +int riscv_cpu_mirq_pending(CPURISCVState *env);
>> >> +int riscv_cpu_sirq_pending(CPURISCVState *env);
>> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>> >>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>> >>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>> >>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> >> index f94a36fa89..e3532de4cf 100644
>> >> --- a/target/riscv/cpu_helper.c
>> >> +++ b/target/riscv/cpu_helper.c
>> >> @@ -151,36 +151,225 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, =
target_ulong *pc,
>> >>  }
>> >>
>> >>  #ifndef CONFIG_USER_ONLY
>> >> -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> >> +
>> >> +/*
>> >> + * The HS-mode is allowed to configure priority only for the
>> >> + * following VS-mode local interrupts:
>> >> + *
>> >> + * 0  (Reserved interrupt, reads as zero)
>> >> + * 1  Supervisor software interrupt
>> >> + * 4  (Reserved interrupt, reads as zero)
>> >> + * 5  Supervisor timer interrupt
>> >> + * 8  (Reserved interrupt, reads as zero)
>> >> + * 13 (Reserved interrupt)
>> >> + * 14 "
>> >> + * 15 "
>> >> + * 16 "
>> >> + * 18 Debug/trace interrupt
>> >> + * 20 (Reserved interrupt)
>> >> + * 22 "
>> >> + * 24 "
>> >> + * 26 "
>> >> + * 28 "
>> >> + * 30 (Reserved for standard reporting of bus or system errors)
>> >> + */
>> >> +
>> >> +static int hviprio_index2irq[] =3D
>> >> +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
>> >> +static int hviprio_index2rdzero[] =3D
>> >> +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
>> >> +
>> >> +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rd=
zero)
>> >>  {
>> >> -    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
>> >> +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
>> >> +        return -EINVAL;
>> >> +    }
>> >> +
>> >> +    if (out_irq) {
>> >> +        *out_irq =3D hviprio_index2irq[index];
>> >> +    }
>> >>
>> >> -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE=
);
>> >> -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE=
);
>> >> +    if (out_rdzero) {
>> >> +        *out_rdzero =3D hviprio_index2rdzero[index];
>> >> +    }
>> >>
>> >> -    target_ulong vsgemask =3D
>> >> -                (target_ulong)1 << get_field(env->hstatus, HSTATUS_V=
GEIN);
>> >> -    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
>> >> +    return 0;
>> >> +}
>> >>
>> >> -    target_ulong pending =3D (env->mip | vsgein) & env->mie;
>> >> +uint8_t riscv_cpu_default_priority(int irq)
>> >> +{
>> >> +    int u, l;
>> >> +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
>> >>
>> >> -    target_ulong mie    =3D env->priv < PRV_M ||
>> >> -                          (env->priv =3D=3D PRV_M && mstatus_mie);
>> >> -    target_ulong sie    =3D env->priv < PRV_S ||
>> >> -                          (env->priv =3D=3D PRV_S && mstatus_sie);
>> >> -    target_ulong hsie   =3D virt_enabled || sie;
>> >> -    target_ulong vsie   =3D virt_enabled && sie;
>> >> +    if (irq < 0 || irq > 63) {
>> >> +        return iprio;
>> >> +    }
>> >>
>> >> -    target_ulong irqs =3D
>> >> -            (pending & ~env->mideleg & -mie) |
>> >> -            (pending &  env->mideleg & ~env->hideleg & -hsie) |
>> >> -            (pending &  env->mideleg &  env->hideleg & -vsie);
>> >> +    /*
>> >> +     * Default priorities of local interrupts are defined in the
>> >> +     * RISC-V Advanced Interrupt Architecture specification.
>> >> +     *
>> >> +     * -------------------------------------------------------------=
---
>> >> +     *  Default  |
>> >> +     *  Priority | Major Interrupt Numbers
>> >> +     * -------------------------------------------------------------=
---
>> >> +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (=
3c),
>> >> +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (=
38),
>> >> +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (=
34),
>> >> +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (=
30)
>> >> +     *           |
>> >> +     *           | 11 (0b),  3 (03),  7 (07)
>> >> +     *           |  9 (09),  1 (01),  5 (05)
>> >> +     *           | 12 (0c)
>> >> +     *           | 10 (0a),  2 (02),  6 (06)
>> >> +     *           |
>> >> +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (=
2c),
>> >> +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (=
28),
>> >> +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (=
24),
>> >> +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (=
20)
>> >> +     * -------------------------------------------------------------=
---
>> >> +     */
>> >>
>> >> -    if (irqs) {
>> >> -        return ctz64(irqs); /* since non-zero */
>> >> +    u =3D IPRIO_DEFAULT_U(irq);
>> >> +    l =3D IPRIO_DEFAULT_L(irq);
>> >> +    if (u =3D=3D 0) {
>> >> +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
>> >> +            irq =3D=3D IRQ_VS_SOFT) {
>> >> +            iprio =3D IPRIO_DEFAULT_VS;
>> >> +        } else if (irq =3D=3D IRQ_S_GEXT) {
>> >> +            iprio =3D IPRIO_DEFAULT_SGEXT;
>> >> +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER ||
>> >> +                   irq =3D=3D IRQ_S_SOFT) {
>> >> +            iprio =3D IPRIO_DEFAULT_S;
>> >> +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER ||
>> >> +                   irq =3D=3D IRQ_M_SOFT) {
>> >> +            iprio =3D IPRIO_DEFAULT_M;
>> >> +        } else {
>> >> +            iprio =3D IPRIO_DEFAULT_VS;
>> >> +        }
>> >> +    } else if (u =3D=3D 1) {
>> >> +        if (l < 8) {
>> >> +            iprio =3D IPRIO_DEFAULT_16_23(irq);
>> >> +        } else {
>> >> +            iprio =3D IPRIO_DEFAULT_24_31(irq);
>> >> +        }
>> >> +    } else if (u =3D=3D 2) {
>> >> +        iprio =3D IPRIO_DEFAULT_32_47(irq);
>> >> +    } else if (u =3D=3D 3) {
>> >> +        iprio =3D IPRIO_DEFAULT_48_63(irq);
>> >> +    }
>> >> +
>> >> +    return iprio;
>> >> +}
>> >> +
>> >> +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>> >> +                                    uint64_t pending, uint8_t *iprio=
)
>> >> +{
>> >> +    int irq, best_irq =3D RISCV_EXCP_NONE;
>> >> +    unsigned int prio, best_prio =3D UINT_MAX;
>> >> +
>> >> +    if (!pending) {
>> >> +        return RISCV_EXCP_NONE;
>> >> +    }
>> >> +
>> >> +    irq =3D ctz64(pending);
>> >> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> >> +        return irq;
>> >> +    }
>> >> +
>> >> +    pending =3D pending >> irq;
>> >> +    while (pending) {
>> >> +        prio =3D iprio[irq];
>> >> +        if (!prio) {
>> >> +            prio =3D (riscv_cpu_default_priority(irq) < IPRIO_DEFAUL=
T_M) ?
>> >> +                   1 : IPRIO_MMAXIPRIO;
>> >
>> >
>> > Hi Anup,
>> >
>> > I have a question regarding configuring priorities of major interrupts=
.
>> >
>> > riscv_cpu_default_priority() for M-mode external interrupt would retur=
n IPRIO_DEFAULT_M (8).
>> > but the comparison here is < IPRIO_DEFAULT_M,
>> > so if M-mode external interrupt is pending, the prio would be assigned=
 to IPRIO_MMAXIPRIO (255).
>> > Is this the expected behavior?
>>
>> Actually, for irq =3D=3D IRQ_M_EXT the prio should be IPRIO_DEFAULT_M
>> same for irq =3D=3D IRQ_S_EXT.
>>
>> Goot catch, I will fix this in next revision.
>>
>> >
>> > Also, why is IPRIO_DEFAULT_M been compared?
>> > Should IPRIO_DEFAULT_S and IPRIO_DEFAULT_VS be used for S-mode and VS-=
mode interrupts?
>>
>> For M-mode, we should compare IPRIO_DEFAULT_M.
>> For S/VS-mode, we should compare IPRIO_DEFAULT_S
>> but the priority registers used for S-mode and VS-mode
>> are different.
>>
>> >
>> >>
>> >> +        }
>> >> +        if ((pending & 0x1) && (prio < best_prio)) {
>> >
>> >
>> > If both interrupt 63 and 62 are pending-and-enabled,
>> > with their iprio values both assigned to zero.
>> > Interrupt 62 would be picked, because best_prio will be 1 when interru=
pt 62 is been checked.
>> > As the default priority order for interrupt 63 is also less than IPRIO=
_DEFAULT_M (8),
>> > so prio would be assigned to 1 as well.
>> > But as prio is not less than best_prio, so best_irq would still be int=
errupt 62.
>> >
>> > However, according to the default priority table in AIA spec,
>> > interrupt 63 should have a higher priority than interrupt 62:
>> >   Interrupt 63 has the highest default priority, and interrupt 32 has =
the lowest default priority.
>>
>> Argh, the comparision "prio < best_prio" should have been
>> "prio <=3D best_prio".
>>
>> I am certainly aware of the fact that if two interrupts
>> have same priority then higher interrupt number should be
>> preferred. This is silly mistake on my part.
>>
>> I really appreciate your detailed review. Thanks.
>>
>> >
>> >>
>> >> +            best_irq =3D irq;
>> >> +            best_prio =3D prio;
>> >> +        }
>> >> +        irq++;
>> >> +        pending =3D pending >> 1;
>> >> +    }
>> >> +
>> >> +    return best_irq;
>> >> +}
>> >
>> >
>> > Yet I have another question for major interrupts priorities.
>> >
>> > According to AIA spec (v0.2-draft.28):
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > The priority number for a machine-level external interrupt (bits 31:24=
 of register iprio2)
>> > must also be read-only zero.
>> >
>> > When an interrupt=E2=80=99s priority number in the array is zero (eith=
er read-only zero or set to zero),
>> > its priority is the default order from Section 6.1.
>> > Setting an interrupt=E2=80=99s priority number instead to a nonzero va=
lue p gives that interrupt nominally
>> > the same priority as a machine-level external interrupt with priority =
number p.
>> > For a major interrupt that defaults to a higher priority than machine =
external interrupts,
>> > setting its priority number to a nonzero value lowers its priority.
>> > For a major interrupt that defaults to a lower priority than machine e=
xternal interrupts,
>> > setting its priority number to a nonzero value raises its priority.
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >
>> > From the above sentences,
>> > The M-mode external interrupt has iprio value of 0, so the default pri=
ority order is applied.
>>
>> Yes, that's correct and same logic applies to S/VS-mode external interru=
pts.
>>
>> >
>> > What are the priorities for the major interrupt interrupts which are h=
igher/lower than
>> > M-mode external interrupt when their iprio values are not 0?
>>
>> For a major interrupt X (which is not an external interrupt) having ipri=
o value 0,
>> we take iprio of X as 1 or 255 based of comparison of default priority o=
f X
>> with default priority of external interrupt.
>> (Refer, documentation of "mtopi" (Section 6.3.2) and "stopi" (Section 6.=
5.2))
>>
>> >
>> > Which interrupt will be picked when:
>> >   M-mode external interrupt is pending-and-enabled,
>> >   Interrupt with higher default priority than M-mode external interrup=
t is pending-and-enabled, and
>> >   Interrupt with lower default priority than M-mode external interrupt=
 is pending-and-enabled/
>> >
>> > From the above riscv_cpu_pending_to_irq(),
>> > If both interrupt 63 and interrupt 18's iprio values are assigned to t=
he value of 10,
>>
>> You mean both these interrupt have iprio 0, right ?
>
>
> I mean if both interrupt 63 and interrupt 18's iprio values are assigned =
with value 10.
> If interrupt 63, interrupt 18, and M-mode external interrupt are pending-=
and-enabled.
> Will M-mode external interrupt be picked as it has the default priority: =
8,
> which is less than 10 of interrupt 63 and interrupt 18?

Yes, in this case "mtopi" CSR read will return M-mode external interrupt.

>
> What if, interrupt 63 has iprio value of 10 and interrupt 18 has iprio va=
lue of 6.
> If interrupt 63, interrupt 18, and M-mode external interrupt are pending-=
and-enabled.
> Will interrupt 18 be picked because it has the smallest iprio value (i.e.=
 higher interrupt priority)?

Yes, in this case "mtopi" CSR read will return interrupt 18.

>
> Can I say that for M-mode major interrupts:
>
> If interrupt X's iprio value is zero, its interrupt priority will be 1 or=
 255,
> base on its default priority which is higher (1) or less (255) than M-mod=
e external interrupt.

Yes, this is correct form M-mode (and "mtopi" CSR) perspective.

For S-mode (and "stopi" or "vstopi" CSR) perspective, it will be
compared against S-mode external interrupt default priority.
(Note: I will fix this in next revision)

>
> And if interrupt X's iprio value is not zero, its interrupt priority will=
 be the assigned iprio value.

Yes, this is correct.

> So it's possible for a lower default priority interrupt (e.g. 18) to have=
 higher priority than M-mode external interrupt
> if its iprio value is less than 8?

Yes, this is correct. The fact that iprio of major interrupts are programma=
ble
it allow software to override the default priority assignement.

>
> The overall interrupt priority order is compared between the values of:
>   * If iprio value is zero: 1 or 255
>   * If iprio value is not zero: the iprio value been assigned

This two statements are correct.

>   * M-mode external interrupt: the default priority value: 8?
> and the interrupt with the smallest value will be picked.

I would like to clarify that it is QEMU implementation that has
chosen to assign default priorities in 1 to 15 range hence we
have M-mode external interrupt default priority as 8. Some
other implementation may chose a different default priority
assignments but it should comply with the table in the
"Section 6.1" of the AIA specification.

Regards,
Anup

>
>>
>> > and interrupt 63, interrupt 18 and M-mode external interrupts are pend=
ing-and-enabled.
>> > Interrupt 18 would be picked.
>> > Is this the correct expectation?
>>
>> If both 63 and 18 have iprio 0 then interrupt 63 would be picked
>> because 63 has higher default priority compared to default
>> priorities of both M-mode external interrupt and interrupt 18.
>>
>> > I'm a bit confused with the correct priority order of the interrupts w=
ith/without non-zero value iprio and the default priority.
>>
>> Whenever iprio of an interrupt X is 0, the default priority of
>> interrupt X compared against default external interrupt
>> priority and based on this comparison 1 (highest) or 255 (lowest)
>> priority is used for interrupt X.
>>
>> In other, a saturated priority is used on interrupt X when
>> it's iprio is set to zero.
>
>
> Thanks for the detailed explanation.
>
> Regards,
> Frank Chang
>
>>
>>
>> Regards,
>> Anup
>>
>> >
>> > Thanks,
>> > Frank Chang
>> >
>> >>
>> >> +
>> >> +static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>> >> +{
>> >> +    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>> >> +    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : =
0;
>> >> +
>> >> +    return (env->mip | vsgein) & env->mie;
>> >> +}
>> >> +
>> >> +int riscv_cpu_mirq_pending(CPURISCVState *env)
>> >> +{
>> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
>> >> +                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)=
;
>> >> +
>> >> +    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
>> >> +}
>> >> +
>> >> +int riscv_cpu_sirq_pending(CPURISCVState *env)
>> >> +{
>> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
>> >> +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>> >> +
>> >> +    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
>> >> +}
>> >> +
>> >> +int riscv_cpu_vsirq_pending(CPURISCVState *env)
>> >> +{
>> >> +    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
>> >> +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
>> >> +
>> >> +    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
>> >> +}
>> >> +
>> >> +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> >> +{
>> >> +    int virq;
>> >> +    uint64_t irqs, pending, mie, hsie, vsie;
>> >> +
>> >> +    /* Determine interrupt enable state of all privilege modes */
>> >> +    if (riscv_cpu_virt_enabled(env)) {
>> >> +        mie =3D 1;
>> >> +        hsie =3D 1;
>> >> +        vsie =3D (env->priv < PRV_S) ||
>> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MS=
TATUS_SIE));
>> >>      } else {
>> >> -        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
>> >> +        mie =3D (env->priv < PRV_M) ||
>> >> +              (env->priv =3D=3D PRV_M && get_field(env->mstatus, MST=
ATUS_MIE));
>> >> +        hsie =3D (env->priv < PRV_S) ||
>> >> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MS=
TATUS_SIE));
>> >> +        vsie =3D 0;
>> >>      }
>> >> +
>> >> +    /* Determine all pending interrupts */
>> >> +    pending =3D riscv_cpu_all_pending(env);
>> >> +
>> >> +    /* Check M-mode interrupts */
>> >> +    irqs =3D pending & ~env->mideleg & -mie;
>> >> +    if (irqs) {
>> >> +        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
>> >> +    }
>> >> +
>> >> +    /* Check HS-mode interrupts */
>> >> +    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
>> >> +    if (irqs) {
>> >> +        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
>> >> +    }
>> >> +
>> >> +    /* Check VS-mode interrupts */
>> >> +    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
>> >> +    if (irqs) {
>> >> +        virq =3D riscv_cpu_pending_to_irq(env, irqs >> 1, env->hvipr=
io);
>> >> +        return (virq <=3D 0) ? virq : virq + 1;
>> >> +    }
>> >> +
>> >> +    /* Indicate no pending interrupt */
>> >> +    return RISCV_EXCP_NONE;
>> >>  }
>> >>
>> >>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> >> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> >> index 76dd0d415c..cffc444969 100644
>> >> --- a/target/riscv/machine.c
>> >> +++ b/target/riscv/machine.c
>> >> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
>> >>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>> >>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>> >>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>> >> +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>> >>
>> >>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
>> >>          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
>> >> @@ -173,6 +174,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>> >>      .fields =3D (VMStateField[]) {
>> >>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>> >>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
>> >> +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
>> >> +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
>> >>          VMSTATE_UINTTL(env.pc, RISCVCPU),
>> >>          VMSTATE_UINTTL(env.load_res, RISCVCPU),
>> >>          VMSTATE_UINTTL(env.load_val, RISCVCPU),
>> >> --
>> >> 2.25.1
>> >>
>> >>

