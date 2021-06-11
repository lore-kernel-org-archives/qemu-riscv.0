Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrZLs-0001V5-RL
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 01:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZLr-0001UZ-Ct
 for qemu-riscv@nongnu.org; Fri, 11 Jun 2021 01:05:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZLm-0006q2-K9
 for qemu-riscv@nongnu.org; Fri, 11 Jun 2021 01:05:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id l9so7368164wms.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 22:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hdgwf/7L1q9MVjQlxbokNoxgSqrjJMny7Bn/LafjOUw=;
 b=SFU4454FGmtWvIWIdlaYWmvxazuYIl6MTpasJ+22HIY9R9DWBTxTyFBWWBIwKHDbBd
 8FiZ+u7DDjn4OxtwK3thxwWkLeACvh9+FUXZvfnulZI3EzAtSFnReiLb+WyfkGIiMb5j
 Qc3LMVWwv2AK3u6+R/No/n7D+j0n4cNJX/z9z74o7FoNNEb4MZv/qmkUv50VpxF80L9b
 A8ZYzD3PluiWqcfAjoPo1grhcBj3eimZbKLy/6s5T/Bm32C3CTB1iASQ1aiGjvLTj0zx
 ja4IEjYaBdL01iBc3/GJEbjvMgH8KAHxSadZMJOS1Nz74vWkKH2QtdSNMUSzk9FYC21/
 llrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hdgwf/7L1q9MVjQlxbokNoxgSqrjJMny7Bn/LafjOUw=;
 b=S0sppINgc+Pn7xWJcuQIaKmLMSMOMN8+J5pIHtm8kArggaBE+K3zr5SVkk2ezw5nUW
 0h0RBmE6atjZn9Qkra98uCxwme8Mf6YhNO2U61oL9D+21ol20foUI2KXBoFMMF8FriQh
 d0+Bzmri3PezEUb/gZ/6+Fj8a65GEgystrdaLUESXuG/6r1eh64wdUowclpxRuN125VG
 tUjQibBY/MOMLbHAhjotDBW64OTwAWlJysx+p0supwU8OeeN/QRpHh6vxopFHgKcMbwB
 hZMsRgA0TIGMylsmAh5Kk2FwcJLAeQWDnZY4Aw3EogYO7Mjm7S1RVtZX36cZE9vfvAUF
 vcMQ==
X-Gm-Message-State: AOAM530aZoSyGbUaFDYRmPjJmnrtt7PQp8/DYF4kHvtVnC9SCDhYm/GU
 QwYM8yygFqy6mTK6wybYlhWNc97FGUFwzNd+KLUw0w==
X-Google-Smtp-Source: ABdhPJwnor1oYqv71kkdUFDtK/nas0xm0rRtc+3p+nDcu7aHgTBzUNvLTjFMu9YhAjNecPvaEpvFg1pTFTBlw3mDzKo=
X-Received: by 2002:a7b:c772:: with SMTP id x18mr1962188wmk.3.1623387896135;
 Thu, 10 Jun 2021 22:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-4-anup.patel@wdc.com>
 <CAKmqyKOcsF32oLtfyh511JCcrwgONK1qvjwK-dMYdPPZABYOOg@mail.gmail.com>
In-Reply-To: <CAKmqyKOcsF32oLtfyh511JCcrwgONK1qvjwK-dMYdPPZABYOOg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jun 2021 10:34:44 +0530
Message-ID: <CAAhSdy1eWW6bw55O1pLHvopRVvM6DVb-kzvhTAjAoyvB0qt5bQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Implement AIA local interrupt CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Jun 2021 05:05:03 -0000

On Fri, Jun 11, 2021 at 4:49 AM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Sat, May 15, 2021 at 12:34 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We implement various AIA local interrupt CSRs for M-mode, HS-mode,
> > and VS-mode.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.c        |   27 +-
> >  target/riscv/cpu.h        |   52 +-
> >  target/riscv/cpu_helper.c |  245 ++++++++-
> >  target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
> >  target/riscv/machine.c    |   26 +-
> >  5 files changed, 1309 insertions(+), 100 deletions(-)
>
> I feel this patch could be split up more :)

This is patch is large because I did not want to break functionality.

I try again to break this patch. At the moment, the best I can do is
to break in to two parts.
1) AIA local interrupt CSRs without IMSIC
2) Extend AIA local interrupt CSRs to support IMSIC register access

>
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index f3702111ae..795162834b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -256,11 +256,11 @@ static void riscv_cpu_dump_state(CPUState *cs, FI=
LE *f, int flags)
> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> >                       (target_ulong)env->vsstatus);
> >      }
> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->midele=
g);
> > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mip     ", env->mip);
> > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mie     ", env->mie);
> > +    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mideleg ", env->mideleg);
> >      if (riscv_has_ext(env, RVH)) {
> > -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hi=
deleg);
> > +        qemu_fprintf(f, " %s %016" PRIx64 "\n", "hideleg ", env->hidel=
eg);
> >      }
> >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medele=
g);
> >      if (riscv_has_ext(env, RVH)) {
> > @@ -345,6 +345,8 @@ void restore_state_to_opc(CPURISCVState *env, Trans=
lationBlock *tb,
> >
> >  static void riscv_cpu_reset(DeviceState *dev)
> >  {
> > +    uint8_t iprio;
> > +    int i, irq, rdzero;
> >      CPUState *cs =3D CPU(dev);
> >      RISCVCPU *cpu =3D RISCV_CPU(cs);
> >      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> > @@ -357,6 +359,23 @@ static void riscv_cpu_reset(DeviceState *dev)
> >      env->mcause =3D 0;
> >      env->pc =3D env->resetvec;
> >      env->two_stage_lookup =3D false;
> > +
> > +    /* Initialized default priorities of local interrupts. */
> > +    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> > +        iprio =3D riscv_cpu_default_priority(i);
> > +        env->miprio[i] =3D iprio;
> > +        env->siprio[i] =3D iprio;
> > +        env->hviprio[i] =3D IPRIO_DEFAULT_MMAXIPRIO;
> > +    }
> > +    i =3D 0;
> > +    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
> > +        if (rdzero) {
> > +            env->hviprio[irq] =3D 0;
> > +        } else {
> > +            env->hviprio[irq] =3D env->miprio[irq];
> > +        }
> > +        i++;
> > +    }
> >  #endif
> >      cs->exception_index =3D EXCP_NONE;
> >      env->load_res =3D -1;
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f00c60c840..780d3f9058 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -157,12 +157,12 @@ struct CPURISCVState {
> >       */
> >      uint64_t mstatus;
> >
> > -    target_ulong mip;
> > +    uint64_t mip;
>
> This isn't right. MIP is a MXLEN-1 CSR. I didn't check but I assume
> all the other existing target_ulong CSRs are the same.

When AIA is available the number of local interrupts are 64 for
both RV32 and RV64.

The width of CSRs remain same as target_ulong but we have
new CSRs for RV32 (such as mipH) for the high-half.

Also, this patch changes does not break the case when AIA
is not available (or disabled).

Regards,
Anup

>
> Alistair
>
> >
> > -    uint32_t miclaim;
> > +    uint64_t miclaim;
> >
> > -    target_ulong mie;
> > -    target_ulong mideleg;
> > +    uint64_t mie;
> > +    uint64_t mideleg;
> >
> >      target_ulong sptbr;  /* until: priv-1.9.1 */
> >      target_ulong satp;   /* since: priv-1.10.0 */
> > @@ -179,16 +179,27 @@ struct CPURISCVState {
> >      target_ulong mcause;
> >      target_ulong mtval;  /* since: priv-1.10.0 */
> >
> > +    /* AIA CSRs */
> > +    target_ulong miselect;
> > +    target_ulong siselect;
> > +
> > +    uint8_t miprio[64];
> > +    uint8_t siprio[64];
> > +
> >      /* Hypervisor CSRs */
> >      target_ulong hstatus;
> >      target_ulong hedeleg;
> > -    target_ulong hideleg;
> > +    uint64_t hideleg;
> >      target_ulong hcounteren;
> >      target_ulong htval;
> >      target_ulong htinst;
> >      target_ulong hgatp;
> >      uint64_t htimedelta;
> >
> > +    /* AIA HS-mode CSRs */
> > +    uint8_t hviprio[64];
> > +    target_ulong hvicontrol;
> > +
> >      /* Virtual CSRs */
> >      /*
> >       * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
> > @@ -202,6 +213,9 @@ struct CPURISCVState {
> >      target_ulong vstval;
> >      target_ulong vsatp;
> >
> > +    /* AIA VS-mode CSRs */
> > +    target_ulong vsiselect;
> > +
> >      target_ulong mtval2;
> >      target_ulong mtinst;
> >
> > @@ -236,6 +250,18 @@ struct CPURISCVState {
> >      uint64_t (*rdtime_fn)(uint32_t);
> >      uint32_t rdtime_fn_arg;
> >
> > +    /* machine specific AIA IMSIC read-modify-write callback */
> > +#define IMSIC_MAKE_REG(__isel, __priv, __virt, __vgein) \
> > +    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
> > +     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
> > +#define IMSIC_REG_ISEL(__reg)                  ((__reg) & 0xffff)
> > +#define IMSIC_REG_PRIV(__reg)                  (((__reg) >> 16) & 0x3)
> > +#define IMSIC_REG_VIRT(__reg)                  (((__reg) >> 20) & 0x1)
> > +#define IMSIC_REG_VGEIN(__reg)                 (((__reg) >> 24) & 0x3f=
)
> > +    int (*imsic_rmw_fn)(void *arg, target_ulong reg, target_ulong *val=
,
> > +                        target_ulong new_val, target_ulong write_mask)=
;
> > +    void *imsic_rmw_fn_arg;
> > +
> >      /* True if in debugger mode.  */
> >      bool debugger;
> >  #endif
> > @@ -335,6 +361,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFuncti=
on f, CPUState *cs,
> >                                 int cpuid, void *opaque);
> >  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);
> >  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)=
;
> > +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdze=
ro);
> > +uint8_t riscv_cpu_default_priority(int irq);
> > +int riscv_cpu_mirq_pending(CPURISCVState *env);
> > +int riscv_cpu_sirq_pending(CPURISCVState *env);
> > +int riscv_cpu_vsirq_pending(CPURISCVState *env);
> >  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> >  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> >  bool riscv_cpu_virt_enabled(CPURISCVState *env);
> > @@ -364,9 +395,16 @@ void riscv_cpu_list(void);
> >
> >  #ifndef CONFIG_USER_ONLY
> >  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
> > -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
> > -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t v=
alue);
> > +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> > +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t v=
alue);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip va=
lue */
> > +void riscv_cpu_set_imsic_rmw_fn(CPURISCVState *env,
> > +                                int (*rmw_fn)(void *arg,
> > +                                              target_ulong reg,
> > +                                              target_ulong *val,
> > +                                              target_ulong new_val,
> > +                                              target_ulong write_mask)=
,
> > +                                void *rmw_fn_arg);
> >  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32=
_t),
> >                               uint32_t arg);
> >  #endif
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 21c54ef561..5b06b4f995 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -36,44 +36,219 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool i=
fetch)
> >  }
> >
> >  #ifndef CONFIG_USER_ONLY
> > -static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> > +
> > +/*
> > + * The HS-mode is allowed to configure priority only for the
> > + * following VS-mode local interrupts:
> > + *
> > + * 0  (Reserved interrupt, reads as zero)
> > + * 1  Supervisor software interrupt
> > + * 4  (Reserved interrupt, reads as zero)
> > + * 5  Supervisor timer interrupt
> > + * 8  (Reserved interrupt, reads as zero)
> > + * 13 (Reserved interrupt)
> > + * 14 "
> > + * 15 "
> > + * 16 "
> > + * 18 Debug/trace interrupt
> > + * 20 (Reserved interrupt)
> > + * 22 =E2=80=9D
> > + * 24 =E2=80=9D
> > + * 26 =E2=80=9D
> > + * 28 "
> > + * 30 (Reserved for standard reporting of bus or system errors)
> > + */
> > +
> > +static int hviprio_index2irq[] =3D
> > +    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
> > +static int hviprio_index2rdzero[] =3D
> > +    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
> > +
> > +int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdze=
ro)
> >  {
> > -    target_ulong irqs;
> > +    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
> > +        return -EINVAL;
> > +    }
> >
> > -    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
> > -    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
> > -    target_ulong hs_mstatus_sie =3D get_field(env->mstatus_hs, MSTATUS=
_SIE);
> > +    if (out_irq) {
> > +        *out_irq =3D hviprio_index2irq[index];
> > +    }
> > +
> > +    if (out_rdzero) {
> > +        *out_rdzero =3D hviprio_index2rdzero[index];
> > +    }
> >
> > -    target_ulong pending =3D env->mip & env->mie &
> > -                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > -    target_ulong vspending =3D (env->mip & env->mie &
> > -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> > +    return 0;
> > +}
> >
> > -    target_ulong mie    =3D env->priv < PRV_M ||
> > -                          (env->priv =3D=3D PRV_M && mstatus_mie);
> > -    target_ulong sie    =3D env->priv < PRV_S ||
> > -                          (env->priv =3D=3D PRV_S && mstatus_sie);
> > -    target_ulong hs_sie =3D env->priv < PRV_S ||
> > -                          (env->priv =3D=3D PRV_S && hs_mstatus_sie);
> > +uint8_t riscv_cpu_default_priority(int irq)
> > +{
> > +    int u, l;
> > +    uint8_t iprio =3D IPRIO_MMAXIPRIO;
> >
> > -    if (riscv_cpu_virt_enabled(env)) {
> > -        target_ulong pending_hs_irq =3D pending & -hs_sie;
> > +    if (irq < 0 || irq > 63) {
> > +        return iprio;
> > +    }
> >
> > -        if (pending_hs_irq) {
> > -            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> > -            return ctz64(pending_hs_irq);
> > +    /*
> > +     * Default priorities of local interrupts are defined in the
> > +     * RISC-V Advanced Interrupt Architecture specification.
> > +     *
> > +     * ---------------------------------------------------------------=
-
> > +     *  Default  |
> > +     *  Priority | Major Interrupt Numbers
> > +     * ---------------------------------------------------------------=
-
> > +     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c=
),
> > +     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38=
),
> > +     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34=
),
> > +     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30=
)
> > +     *           |
> > +     *           | 11 (0b),  3 (03),  7 (07)
> > +     *           |  9 (09),  1 (01),  5 (05)
> > +     *           | 12 (0c)
> > +     *           | 10 (0a),  2 (02),  6 (06)
> > +     *           |
> > +     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c=
),
> > +     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28=
),
> > +     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24=
),
> > +     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20=
)
> > +     * ---------------------------------------------------------------=
-
> > +     */
> > +
> > +    u =3D IPRIO_DEFAULT_U(irq);
> > +    l =3D IPRIO_DEFAULT_L(irq);
> > +    if (u =3D=3D 0) {
> > +        if (irq =3D=3D IRQ_VS_EXT || irq =3D=3D IRQ_VS_TIMER ||
> > +            irq =3D=3D IRQ_VS_SOFT) {
> > +            iprio =3D IPRIO_DEFAULT_VS;
> > +        } else if (irq =3D=3D IRQ_S_GEXT) {
> > +            iprio =3D IPRIO_DEFAULT_SGEXT;
> > +        } else if (irq =3D=3D IRQ_S_EXT || irq =3D=3D IRQ_S_TIMER ||
> > +                   irq =3D=3D IRQ_S_SOFT) {
> > +            iprio =3D IPRIO_DEFAULT_S;
> > +        } else if (irq =3D=3D IRQ_M_EXT || irq =3D=3D IRQ_M_TIMER ||
> > +                   irq =3D=3D IRQ_M_SOFT) {
> > +            iprio =3D IPRIO_DEFAULT_M;
> > +        } else {
> > +            iprio =3D IPRIO_DEFAULT_VS;
> >          }
> > +    } else if (u =3D=3D 1) {
> > +        if (l < 8) {
> > +            iprio =3D IPRIO_DEFAULT_16_23(irq);
> > +        } else {
> > +            iprio =3D IPRIO_DEFAULT_24_31(irq);
> > +        }
> > +    } else if (u =3D=3D 2) {
> > +        iprio =3D IPRIO_DEFAULT_32_47(irq);
> > +    } else if (u =3D=3D 3) {
> > +        iprio =3D IPRIO_DEFAULT_48_63(irq);
> > +    }
> > +
> > +    return iprio;
> > +}
> > +
> > +static int riscv_cpu_pending_to_irq(CPURISCVState *env,
> > +                                    uint64_t pending, uint8_t *iprio)
> > +{
> > +    int irq, best_irq =3D EXCP_NONE;
> > +    unsigned int prio, best_prio =3D UINT_MAX;
> >
> > -        pending =3D vspending;
> > +    if (!pending) {
> > +        return EXCP_NONE;
> >      }
> >
> > -    irqs =3D (pending & ~env->mideleg & -mie) | (pending &  env->midel=
eg & -sie);
> > +    irq =3D ctz64(pending);
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return irq;
> > +    }
> >
> > -    if (irqs) {
> > -        return ctz64(irqs); /* since non-zero */
> > +    pending =3D pending >> irq;
> > +    while (pending) {
> > +        prio =3D iprio[irq];
> > +        if (!prio) {
> > +            prio =3D (riscv_cpu_default_priority(irq) < IPRIO_DEFAULT_=
M) ?
> > +                   1 : IPRIO_MMAXIPRIO;
> > +        }
> > +        if ((pending & 0x1) && (prio < best_prio)) {
> > +            best_irq =3D irq;
> > +            best_prio =3D prio;
> > +        }
> > +        irq++;
> > +        pending =3D pending >> 1;
> > +    }
> > +
> > +    return best_irq;
> > +}
> > +
> > +int riscv_cpu_mirq_pending(CPURISCVState *env)
> > +{
> > +    uint64_t irqs =3D env->mip & env->mie & ~env->mideleg &
> > +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +
> > +    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> > +}
> > +
> > +int riscv_cpu_sirq_pending(CPURISCVState *env)
> > +{
> > +    uint64_t irqs =3D env->mip & env->mie & env->mideleg &
> > +                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +
> > +    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> > +}
> > +
> > +int riscv_cpu_vsirq_pending(CPURISCVState *env)
> > +{
> > +    uint64_t irqs =3D env->mip & env->mie & env->mideleg &
> > +                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +
> > +    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
> > +}
> > +
> > +static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> > +{
> > +    int virq;
> > +    uint64_t irqs, mie, sie, vsie;
> > +    uint64_t pending, vspending;
> > +
> > +    /* Determine interrupt enable state of all privilege modes */
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        mie =3D 1;
> > +        sie =3D 1;
> > +        vsie =3D (env->priv < PRV_S) ||
> > +               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTA=
TUS_SIE));
> >      } else {
> > -        return EXCP_NONE; /* indicates no pending interrupt */
> > +        mie =3D (env->priv < PRV_M) ||
> > +              (env->priv =3D=3D PRV_M && get_field(env->mstatus, MSTAT=
US_MIE));
> > +        sie =3D (env->priv < PRV_S) ||
> > +              (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTAT=
US_SIE));
> > +        vsie =3D 0;
> > +    }
> > +
> > +    /* Check M-mode interrupts */
> > +    pending =3D env->mip & env->mie &
> > +              ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +    irqs =3D pending & ~env->mideleg & -mie;
> > +    if (irqs) {
> > +        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
> > +    }
> > +
> > +    /* Check HS-mode interrupts */
> > +    irqs =3D pending & env->mideleg & -sie;
> > +    if (irqs) {
> > +        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
> > +    }
> > +
> > +    /* Check VS-mode interrupts */
> > +    vspending =3D env->mip & env->mie &
> > +                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > +    irqs =3D vspending & env->hideleg & -vsie;
> > +    if (irqs) {
> > +        virq =3D riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio=
);
> > +        return (virq <=3D 0) ? virq : virq + 1;
> >      }
> > +
> > +    /* Indicates no pending interrupt */
> > +    return EXCP_NONE;
> >  }
> >  #endif
> >
> > @@ -213,7 +388,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
> >      return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> >  }
> >
> > -int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> > +int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> >  {
> >      CPURISCVState *env =3D &cpu->env;
> >      if (env->miclaim & interrupts) {
> > @@ -224,11 +399,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uin=
t32_t interrupts)
> >      }
> >  }
> >
> > -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t v=
alue)
> > +uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t v=
alue)
> >  {
> >      CPURISCVState *env =3D &cpu->env;
> >      CPUState *cs =3D CPU(cpu);
> > -    uint32_t old =3D env->mip;
> > +    uint64_t old =3D env->mip;
> >      bool locked =3D false;
> >
> >      if (!qemu_mutex_iothread_locked()) {
> > @@ -251,6 +426,18 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint3=
2_t mask, uint32_t value)
> >      return old;
> >  }
> >
> > +void riscv_cpu_set_imsic_rmw_fn(CPURISCVState *env,
> > +                                int (*rmw_fn)(void *arg,
> > +                                              target_ulong reg,
> > +                                              target_ulong *val,
> > +                                              target_ulong new_val,
> > +                                              target_ulong write_mask)=
,
> > +                                void *rmw_fn_arg)
> > +{
> > +    env->imsic_rmw_fn =3D rmw_fn;
> > +    env->imsic_rmw_fn_arg =3D rmw_fn_arg;
> > +}
> > +
> >  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32=
_t),
> >                               uint32_t arg)
> >  {
> > @@ -904,7 +1091,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       */
> >      bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
> >      target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
> > -    target_ulong deleg =3D async ? env->mideleg : env->medeleg;
> > +    uint64_t deleg =3D async ? env->mideleg : env->medeleg;
> >      bool write_tval =3D false;
> >      target_ulong tval =3D 0;
> >      target_ulong htval =3D 0;
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index d2585395bf..3c016d7452 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -153,11 +153,56 @@ static int any32(CPURISCVState *env, int csrno)
> >
> >  }
> >
> > +static int aia_any(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return any(env, csrno);
> > +}
> > +
> > +static int aia_any32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return any32(env, csrno);
> > +}
> > +
> >  static int smode(CPURISCVState *env, int csrno)
> >  {
> >      return -!riscv_has_ext(env, RVS);
> >  }
> >
> > +static int smode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_cpu_is_32bit(env)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> > +static int aia_smode(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> > +static int aia_smode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode32(env, csrno);
> > +}
> > +
> >  static int hmode(CPURISCVState *env, int csrno)
> >  {
> >      if (riscv_has_ext(env, RVS) &&
> > @@ -177,11 +222,28 @@ static int hmode(CPURISCVState *env, int csrno)
> >  static int hmode32(CPURISCVState *env, int csrno)
> >  {
> >      if (!riscv_cpu_is_32bit(env)) {
> > -        return 0;
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return hmode(env, csrno);
> > +}
> > +
> > +static int aia_hmode(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> >      return hmode(env, csrno);
> > +}
> >
> > +static int aia_hmode32(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return -RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return hmode32(env, csrno);
> >  }
> >
> >  static int pmp(CPURISCVState *env, int csrno)
> > @@ -388,14 +450,16 @@ static int read_timeh(CPURISCVState *env, int csr=
no, target_ulong *val)
> >
> >  /* Machine constants */
> >
> > -#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> > -#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
> > -#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> > +#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP)=
)
> > +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP)=
)
> > +#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSE=
IP))
> > +
> > +#define TLOWBITS64         ((uint64_t)((target_ulong)-1))
> >
> > -static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
> > -                                           VS_MODE_INTERRUPTS;
> > -static const target_ulong all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTE=
RRUPTS |
> > -                                     VS_MODE_INTERRUPTS;
> > +static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
> > +                                       VS_MODE_INTERRUPTS;
> > +static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUP=
TS |
> > +                                 VS_MODE_INTERRUPTS;
> >  static const target_ulong delegable_excps =3D
> >      (1ULL << (RISCV_EXCP_INST_ADDR_MIS)) |
> >      (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) |
> > @@ -419,10 +483,10 @@ static const target_ulong delegable_excps =3D
> >  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS=
_SPIE |
> >      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS=
 |
> >      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> > -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | =
MIP_UEIP;
> > -static const target_ulong hip_writable_mask =3D MIP_VSSIP;
> > -static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP=
 | MIP_VSEIP;
> > -static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
> > +static const uint64_t sip_writable_mask =3D SIP_SSIP | MIP_USIP | MIP_=
UEIP;
> > +static const uint64_t hip_writable_mask =3D MIP_VSSIP;
> > +static const uint64_t hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP | M=
IP_VSEIP;
> > +static const uint64_t vsip_writable_mask =3D MIP_VSSIP;
> >
> >  static const char valid_vm_1_10_32[16] =3D {
> >      [VM_1_10_MBARE] =3D 1,
> > @@ -596,7 +660,437 @@ static int read_mideleg(CPURISCVState *env, int c=
srno, target_ulong *val)
> >
> >  static int write_mideleg(CPURISCVState *env, int csrno, target_ulong v=
al)
> >  {
> > -    env->mideleg =3D (env->mideleg & ~delegable_ints) | (val & delegab=
le_ints);
> > +    uint64_t mask =3D delegable_ints & TLOWBITS64;
> > +
> > +    env->mideleg =3D (env->mideleg & ~mask) | (val & mask);
> > +    if (riscv_has_ext(env, RVH)) {
> > +        env->mideleg |=3D VS_MODE_INTERRUPTS;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_cpu_virt_enabled(env)) {
> > +        return csrno;
> > +    }
> > +
> > +    switch (csrno) {
> > +    case CSR_SISELECT:
> > +        return CSR_VSISELECT;
> > +    case CSR_SIREG:
> > +        return CSR_VSIREG;
> > +    case CSR_STOPI:
> > +        return CSR_VSTOPI;
> > +    case CSR_SSETEIPNUM:
> > +        return CSR_VSSETEIPNUM;
> > +    case CSR_SCLREIPNUM:
> > +        return CSR_VSCLREIPNUM;
> > +    case CSR_SSETEIENUM:
> > +        return CSR_VSSETEIENUM;
> > +    case CSR_SCLREIENUM:
> > +        return CSR_VSCLREIENUM;
> > +    default:
> > +        return csrno;
> > +    };
> > +}
> > +
> > +static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *v=
al,
> > +                        target_ulong new_val, target_ulong write_mask)
> > +{
> > +    target_ulong *iselect;
> > +
> > +    switch (csrno) {
> > +    case CSR_MISELECT:
> > +        iselect =3D &env->miselect;
> > +        break;
> > +    case CSR_SISELECT:
> > +        iselect =3D riscv_cpu_virt_enabled(env) ?
> > +                  &env->vsiselect : &env->siselect;
> > +        break;
> > +    case CSR_VSISELECT:
> > +        iselect =3D &env->vsiselect;
> > +        break;
> > +    default:
> > +         return -RISCV_EXCP_ILLEGAL_INST;
> > +    };
> > +
> > +    if (val) {
> > +        *val =3D *iselect;
> > +    }
> > +
> > +    if (write_mask) {
> > +        *iselect =3D (*iselect & ~write_mask) | (new_val & write_mask)=
;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
> > +                     target_ulong *val, target_ulong new_val,
> > +                     target_ulong write_mask)
> > +{
> > +    int i, firq, nirqs;
> > +    target_ulong old_val;
> > +
> > +    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
> > +        return -EINVAL;
> > +    }
> > +#if TARGET_LONG_BITS =3D=3D 64
> > +    if (iselect & 0x1) {
> > +        return -EINVAL;
> > +    }
> > +#endif
> > +
> > +    nirqs =3D 4 * (TARGET_LONG_BITS / 32);
> > +    firq =3D ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * =
(nirqs);
> > +
> > +    old_val =3D 0;
> > +    for (i =3D 0; i < nirqs; i++) {
> > +        old_val |=3D ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BIT=
S * i);
> > +    }
> > +
> > +    if (val) {
> > +        *val =3D old_val;
> > +    }
> > +
> > +    if (write_mask) {
> > +        new_val =3D (old_val & ~write_mask) | (new_val & write_mask);
> > +        for (i =3D 0; i < nirqs; i++) {
> > +            iprio[firq + i] =3D (new_val >> (IPRIO_IRQ_BITS * i)) & 0x=
ff;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
> > +                     target_ulong new_val, target_ulong write_mask)
> > +{
> > +    bool virt;
> > +    uint8_t *iprio;
> > +    int ret =3D -EINVAL;
> > +    target_ulong priv, isel, vgein;
> > +
> > +    /* Translate CSR number for VS-mode */
> > +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> > +
> > +    /* Decode register details from CSR number */
> > +    virt =3D false;
> > +    switch (csrno) {
> > +    case CSR_MIREG:
> > +        iprio =3D env->miprio;
> > +        isel =3D env->miselect;
> > +        priv =3D PRV_M;
> > +        break;
> > +    case CSR_SIREG:
> > +        iprio =3D env->siprio;
> > +        isel =3D env->siselect;
> > +        priv =3D PRV_S;
> > +        break;
> > +    case CSR_VSIREG:
> > +        iprio =3D env->hviprio;
> > +        isel =3D env->vsiselect;
> > +        priv =3D PRV_S;
> > +        virt =3D true;
> > +        break;
> > +    default:
> > +         goto done;
> > +    };
> > +
> > +    /* Find the selected guest interrupt file */
> > +    vgein =3D (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN=
_SHIFT : 0;
> > +
> > +    if (ISELECT_IPRIO0 <=3D isel && isel <=3D ISELECT_IPRIO15) {
> > +        /* Local interrupt priority registers not available for VS-mod=
e */
> > +        if (!virt) {
> > +            ret =3D rmw_iprio(isel, iprio, val, new_val, write_mask);
> > +        }
> > +    } else if (ISELECT_IMSIC_FIRST <=3D isel && isel <=3D ISELECT_IMSI=
C_LAST) {
> > +        /* IMSIC registers only available when machine implements it. =
*/
> > +        if (env->imsic_rmw_fn) {
> > +            /* Selected guest interrupt file should not be zero */
> > +            if (virt && !vgein) {
> > +                goto done;
> > +            }
> > +            /* Call machine specific IMSIC register emulation */
> > +            ret =3D env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
> > +                                    IMSIC_MAKE_REG(isel, priv, virt, v=
gein),
> > +                                    val, new_val, write_mask);
> > +        }
> > +    }
> > +
> > +done:
> > +    if (ret) {
> > +        return (riscv_cpu_virt_enabled(env) && virt) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val=
)
> > +{
> > +    int irq;
> > +
> > +    irq =3D riscv_cpu_mirq_pending(env);
> > +    if (irq <=3D 0 || irq > 63) {
> > +       *val =3D 0;
> > +    } else {
> > +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> > +       *val |=3D env->miprio[irq];
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int read_xsetclreinum(CPURISCVState *env, int csrno, target_ulo=
ng *val)
> > +{
> > +    bool virt;
> > +    int ret =3D -EINVAL;
> > +    target_ulong vgein;
> > +
> > +    /* Translate CSR number for VS-mode */
> > +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> > +
> > +    /* Decode register details from CSR number */
> > +    virt =3D false;
> > +    switch (csrno) {
> > +    case CSR_MSETEIPNUM:
> > +    case CSR_MCLREIPNUM:
> > +    case CSR_MSETEIENUM:
> > +    case CSR_MCLREIENUM:
> > +    case CSR_SSETEIPNUM:
> > +    case CSR_SCLREIPNUM:
> > +    case CSR_SSETEIENUM:
> > +    case CSR_SCLREIENUM:
> > +        break;
> > +    case CSR_VSSETEIPNUM:
> > +    case CSR_VSCLREIPNUM:
> > +    case CSR_VSSETEIENUM:
> > +    case CSR_VSCLREIENUM:
> > +        virt =3D true;
> > +        break;
> > +    default:
> > +         goto done;
> > +    };
> > +
> > +    /* IMSIC CSRs only available when machine implements IMSIC. */
> > +    if (!env->imsic_rmw_fn) {
> > +        goto done;
> > +    }
> > +
> > +    /* Find the selected guest interrupt file */
> > +    vgein =3D (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN=
_SHIFT : 0;
> > +
> > +    /* Selected guest interrupt file should not be zero */
> > +    if (virt && !vgein) {
> > +        goto done;
> > +    }
> > +
> > +    /* Set/Clear CSRs always read zero */
> > +    ret =3D 0;
> > +    if (val) {
> > +        *val =3D 0;
> > +    }
> > +
> > +done:
> > +    if (ret) {
> > +        return (riscv_cpu_virt_enabled(env) && virt) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int write_xsetclreinum(CPURISCVState *env, int csrno, target_ul=
ong val)
> > +{
> > +    int ret =3D -EINVAL;
> > +    bool set, pend, virt;
> > +    target_ulong priv, isel, vgein;
> > +    target_ulong new_val, write_mask;
> > +
> > +    /* Translate CSR number for VS-mode */
> > +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> > +
> > +    /* Decode register details from CSR number */
> > +    virt =3D set =3D pend =3D false;
> > +    switch (csrno) {
> > +    case CSR_MSETEIPNUM:
> > +        priv =3D PRV_M;
> > +        set =3D true;
> > +        break;
> > +    case CSR_MCLREIPNUM:
> > +        priv =3D PRV_M;
> > +        pend =3D true;
> > +        break;
> > +    case CSR_MSETEIENUM:
> > +        priv =3D PRV_M;
> > +        set =3D true;
> > +        break;
> > +    case CSR_MCLREIENUM:
> > +        priv =3D PRV_M;
> > +        break;
> > +    case CSR_SSETEIPNUM:
> > +        priv =3D PRV_S;
> > +        set =3D true;
> > +        pend =3D true;
> > +        break;
> > +    case CSR_SCLREIPNUM:
> > +        priv =3D PRV_S;
> > +        pend =3D true;
> > +        break;
> > +    case CSR_SSETEIENUM:
> > +        priv =3D PRV_S;
> > +        set =3D true;
> > +        break;
> > +    case CSR_SCLREIENUM:
> > +        priv =3D PRV_S;
> > +        break;
> > +    case CSR_VSSETEIPNUM:
> > +        priv =3D PRV_S;
> > +        virt =3D true;
> > +        set =3D true;
> > +        pend =3D true;
> > +        break;
> > +    case CSR_VSCLREIPNUM:
> > +        priv =3D PRV_S;
> > +        virt =3D true;
> > +        pend =3D true;
> > +        break;
> > +    case CSR_VSSETEIENUM:
> > +        priv =3D PRV_S;
> > +        virt =3D true;
> > +        set =3D true;
> > +        break;
> > +    case CSR_VSCLREIENUM:
> > +        priv =3D PRV_S;
> > +        virt =3D true;
> > +        break;
> > +    default:
> > +         goto done;
> > +    };
> > +
> > +    /* IMSIC CSRs only available when machine implements IMSIC. */
> > +    if (!env->imsic_rmw_fn) {
> > +        goto done;
> > +    }
> > +
> > +    /* Find target interrupt pending/enable register */
> > +    if (pend) {
> > +        isel =3D ISELECT_IMSIC_EIP0;
> > +    } else {
> > +        isel =3D ISELECT_IMSIC_EIE0;
> > +    }
> > +    isel +=3D val / IMSIC_EIPx_BITS;
> > +
> > +    /* Find the interrupt bit to be set/clear */
> > +    write_mask =3D 1 << (val % IMSIC_EIPx_BITS);
> > +    new_val =3D (set) ? write_mask : 0;
> > +
> > +    /* Find the selected guest interrupt file */
> > +    vgein =3D (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN=
_SHIFT : 0;
> > +
> > +    /* Selected guest interrupt file should not be zero */
> > +    if (virt && !vgein) {
> > +        goto done;
> > +    }
> > +
> > +    /* Call machine specific IMSIC register emulation */
> > +    ret =3D env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
> > +                            IMSIC_MAKE_REG(isel, priv, virt, vgein),
> > +                            NULL, new_val, write_mask);
> > +
> > +done:
> > +    if (ret) {
> > +        return (riscv_cpu_virt_enabled(env) && virt) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int read_xclaimei(CPURISCVState *env, int csrno, target_ulong *=
val)
> > +{
> > +    bool virt;
> > +    int ret =3D -EINVAL;
> > +    target_ulong priv, isel, vgein;
> > +    target_ulong topei, write_mask;
> > +
> > +    /* Decode register details from CSR number */
> > +    virt =3D false;
> > +    switch (csrno) {
> > +    case CSR_MCLAIMEI:
> > +        priv =3D PRV_M;
> > +        break;
> > +    case CSR_SCLAIMEI:
> > +        priv =3D PRV_S;
> > +        virt =3D riscv_cpu_virt_enabled(env);
> > +        break;
> > +    default:
> > +        goto done;
> > +    };
> > +
> > +    /* IMSIC CSRs only available when machine implements IMSIC. */
> > +    if (!env->imsic_rmw_fn) {
> > +        goto done;
> > +    }
> > +
> > +    /* Find the selected guest interrupt file */
> > +    vgein =3D (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN=
_SHIFT : 0;
> > +
> > +    /* Selected guest interrupt file should not be zero */
> > +    if (virt && !vgein) {
> > +        goto done;
> > +    }
> > +
> > +    /* Call machine specific IMSIC register emulation for reading TOPE=
I */
> > +    ret =3D env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
> > +                            IMSIC_MAKE_REG(ISELECT_IMSIC_TOPEI, priv, =
virt, vgein),
> > +                            &topei, -1, 0);
> > +    if (ret) {
> > +        goto done;
> > +    }
> > +
> > +    /* If no interrupt pending then we are done */
> > +    if (!topei) {
> > +        goto done;
> > +    }
> > +
> > +    /* Find target interrupt pending register */
> > +    isel =3D ISELECT_IMSIC_EIP0;
> > +    isel +=3D ((topei >> TOPI_IID_SHIFT) / IMSIC_EIPx_BITS);
> > +
> > +    /* Find the interrupt bit to be cleared */
> > +    write_mask =3D 1 << ((topei >> TOPI_IID_SHIFT) % IMSIC_EIPx_BITS);
> > +
> > +    /* Call machine specific IMSIC register emulation to clear pending=
 bit */
> > +    ret =3D env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
> > +                            IMSIC_MAKE_REG(isel, priv, virt, vgein),
> > +                            NULL, 0, write_mask);
> > +
> > +    /* Update return value */
> > +    if (val) {
> > +        *val =3D topei;
> > +    }
> > +
> > +done:
> > +    if (ret) {
> > +        return (riscv_cpu_virt_enabled(env) && virt) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int read_midelegh(CPURISCVState *env, int csrno, target_ulong *=
val)
> > +{
> > +    *val =3D (env->mideleg >> 32);
> > +    return 0;
> > +}
> > +
> > +static int write_midelegh(CPURISCVState *env, int csrno, target_ulong =
val)
> > +{
> > +    uint64_t mask =3D delegable_ints & ~TLOWBITS64;
> > +    uint64_t newval =3D ((uint64_t)val) << 32;
> > +
> > +    env->mideleg =3D (env->mideleg & ~mask) | (newval & mask);
> >      if (riscv_has_ext(env, RVH)) {
> >          env->mideleg |=3D VS_MODE_INTERRUPTS;
> >      }
> > @@ -611,7 +1105,24 @@ static int read_mie(CPURISCVState *env, int csrno=
, target_ulong *val)
> >
> >  static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> > -    env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
> > +    uint64_t mask =3D all_ints & TLOWBITS64;
> > +
> > +    env->mie =3D (env->mie & ~mask) | (val & mask);
> > +    return 0;
> > +}
> > +
> > +static int read_mieh(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    *val =3D (env->mie >> 32);
> > +    return 0;
> > +}
> > +
> > +static int write_mieh(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    uint64_t mask =3D all_ints & ~TLOWBITS64;
> > +    uint64_t newval =3D ((uint64_t)val) << 32;
> > +
> > +    env->mie =3D (env->mie & ~mask) | (newval & mask);
> >      return 0;
> >  }
> >
> > @@ -718,8 +1229,9 @@ static int rmw_mip(CPURISCVState *env, int csrno, =
target_ulong *ret_value,
> >  {
> >      RISCVCPU *cpu =3D env_archcpu(env);
> >      /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > -    target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
> > -    uint32_t old_mip;
> > +    uint64_t mask =3D ((uint64_t)write_mask) & delegable_ints &
> > +                    ~env->miclaim & TLOWBITS64;
> > +    uint64_t old_mip;
> >
> >      if (mask) {
> >          old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask)=
);
> > @@ -734,6 +1246,29 @@ static int rmw_mip(CPURISCVState *env, int csrno,=
 target_ulong *ret_value,
> >      return 0;
> >  }
> >
> > +static int rmw_miph(CPURISCVState *env, int csrno, target_ulong *ret_v=
alue,
> > +                    target_ulong new_value, target_ulong write_mask)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask << 32) & delegable_ints &
> > +                    ~env->miclaim & ~TLOWBITS64;
> > +    uint64_t new_value64 =3D (uint64_t)new_value << 32;
> > +    uint64_t old_mip;
> > +
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value64 & mas=
k));
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> > +
> > +    if (ret_value) {
> > +        *ret_value =3D old_mip >> 32;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /* Supervisor Trap Setup */
> >  static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *v=
al)
> >  {
> > @@ -751,39 +1286,103 @@ static int write_sstatus(CPURISCVState *env, in=
t csrno, target_ulong val)
> >
> >  static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> > +    uint64_t mask =3D VS_MODE_INTERRUPTS & env->hideleg & TLOWBITS64;
> > +
> >      /* Shift the VS bits to their S bit location in vsie */
> > -    *val =3D (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
> > +    *val =3D (env->mie & mask) >> 1;
> > +    return 0;
> > +}
> > +
> > +static int read_vsieh(CPURISCVState *env, int csrno, target_ulong *val=
)
> > +{
> > +    uint64_t mask =3D VS_MODE_INTERRUPTS & env->hideleg & ~TLOWBITS64;
> > +
> > +    /* Shift the VS bits to their S bit location in vsieh */
> > +    *val =3D (env->mie & mask) >> (32 + 1);
> >      return 0;
> >  }
> >
> >  static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
> >  {
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        read_vsie(env, CSR_VSIE, val);
> > -    } else {
> > -        *val =3D env->mie & env->mideleg;
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return read_vsie(env, CSR_VSIE, val);
> >      }
> > +
> > +    *val =3D env->mie & env->mideleg;
> >      return 0;
> >  }
> >
> >  static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> > +    uint64_t mask =3D VS_MODE_INTERRUPTS & env->hideleg &
> > +                    all_ints & TLOWBITS64;
> > +
> >      /* Shift the S bits to their VS bit location in mie */
> > -    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) |
> > -                          ((val << 1) & env->hideleg & VS_MODE_INTERRU=
PTS);
> > -    return write_mie(env, CSR_MIE, newval);
> > +    env->mie =3D (env->mie & ~mask) | ((val << 1) & mask);
> > +
> > +    return 0;
> > +}
> > +
> > +static int write_vsieh(CPURISCVState *env, int csrno, target_ulong val=
)
> > +{
> > +    uint64_t mask =3D VS_MODE_INTERRUPTS & env->hideleg &
> > +                    all_ints & ~TLOWBITS64;
> > +    uint64_t newval =3D (uint64_t)val << 32;
> > +
> > +    /* Shift the S bits to their VS bit location in mie */
> > +    env->mie =3D (env->mie & ~mask) | ((newval << 1) & mask);
> > +
> > +    return 0;
> >  }
> >
> >  static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> > +    uint64_t mask;
> > +
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        write_vsie(env, CSR_VSIE, val);
> > -    } else {
> > -        target_ulong newval =3D (env->mie & ~S_MODE_INTERRUPTS) |
> > -                              (val & S_MODE_INTERRUPTS);
> > -        write_mie(env, CSR_MIE, newval);
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return write_vsie(env, CSR_VSIE, val);
> > +    }
> > +
> > +    mask =3D S_MODE_INTERRUPTS & env->mideleg & all_ints & TLOWBITS64;
> > +    env->mie =3D (env->mie & ~mask) | ((uint64_t)val & mask);
> > +
> > +    return 0;
> > +}
> > +
> > +static int read_sieh(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return read_vsieh(env, CSR_VSIEH, val);
> > +    }
> > +
> > +    *val =3D ((env->mie & env->mideleg) >> 32);
> > +    return 0;
> > +}
> > +
> > +static int write_sieh(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    uint64_t mask, newval;
> > +
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return write_vsieh(env, CSR_VSIEH, val);
> >      }
> >
> > +    mask =3D S_MODE_INTERRUPTS & env->mideleg & all_ints & ~TLOWBITS64=
;
> > +    newval =3D (uint64_t)val << 32;
> > +
> > +    env->mie =3D (env->mie & ~mask) | (newval & mask);
> >      return 0;
> >  }
> >
> > @@ -868,29 +1467,110 @@ static int write_sbadaddr(CPURISCVState *env, i=
nt csrno, target_ulong val)
> >  static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_v=
alue,
> >                      target_ulong new_value, target_ulong write_mask)
> >  {
> > -    /* Shift the S bits to their VS bit location in mip */
> > -    int ret =3D rmw_mip(env, 0, ret_value, new_value << 1,
> > -                      (write_mask << 1) & vsip_writable_mask & env->hi=
deleg);
> > -    *ret_value &=3D VS_MODE_INTERRUPTS;
> > -    /* Shift the VS bits to their S bit location in vsip */
> > -    *ret_value >>=3D 1;
> > -    return ret;
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask << 1) & delegable_ints &
> > +                    vsip_writable_mask & env->hideleg &
> > +                    ~env->miclaim & TLOWBITS64;
> > +    uint64_t old_mip;
> > +
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask)=
);
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> > +
> > +    if (ret_value) {
> > +        *ret_value =3D old_mip & VS_MODE_INTERRUPTS;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int rmw_vsiph(CPURISCVState *env, int csrno, target_ulong *ret_=
value,
> > +                     target_ulong new_value, target_ulong write_mask)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask << (32 + 1)) & delegable_i=
nts &
> > +                    vsip_writable_mask & env->hideleg &
> > +                    ~env->miclaim & ~TLOWBITS64;
> > +    uint64_t new_value64 =3D (uint64_t)new_value << 32;
> > +    uint64_t old_mip;
> > +
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value64 & mas=
k));
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> > +
> > +    if (ret_value) {
> > +        *ret_value =3D (old_mip & VS_MODE_INTERRUPTS) >> 32;
> > +    }
> > +
> > +    return 0;
> >  }
> >
> >  static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_va=
lue,
> >                     target_ulong new_value, target_ulong write_mask)
> >  {
> > -    int ret;
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    uint64_t mask, old_mip;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > -        ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_ma=
sk);
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mas=
k);
> > +    }
> > +
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    mask =3D ((uint64_t)write_mask) & delegable_ints &
> > +           env->mideleg & sip_writable_mask &
> > +           ~env->miclaim & TLOWBITS64;
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask)=
);
> >      } else {
> > -        ret =3D rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> > -                      write_mask & env->mideleg & sip_writable_mask);
> > +        old_mip =3D env->mip;
> >      }
> >
> > -    *ret_value &=3D env->mideleg;
> > -    return ret;
> > +    if (ret_value) {
> > +        *ret_value =3D old_mip;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int rmw_siph(CPURISCVState *env, int csrno, target_ulong *ret_v=
alue,
> > +                    target_ulong new_value, target_ulong write_mask)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    uint64_t mask, new_value64;
> > +    uint64_t old_mip;
> > +
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        if (env->hvicontrol & HVICONTROL_VTI) {
> > +            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +        }
> > +        return rmw_vsiph(env, CSR_VSIPH, ret_value, new_value, write_m=
ask);
> > +    }
> > +
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    mask =3D ((uint64_t)write_mask << 32) & delegable_ints &
> > +           env->mideleg & sip_writable_mask &
> > +           ~env->miclaim & ~TLOWBITS64;
> > +    new_value64 =3D (uint64_t)new_value << 32;
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value64 & mas=
k));
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> > +
> > +    if (ret_value) {
> > +        *ret_value =3D (old_mip & env->mideleg) >> 32;
> > +    }
> > +
> > +    return 0;
> >  }
> >
> >  /* Supervisor Protection and Translation */
> > @@ -930,6 +1610,51 @@ static int write_satp(CPURISCVState *env, int csr=
no, target_ulong val)
> >      return 0;
> >  }
> >
> > +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *va=
l)
> > +{
> > +    int irq, hiid;
> > +    uint8_t hiprio, iprio;
> > +
> > +    irq =3D riscv_cpu_vsirq_pending(env);
> > +    if (irq <=3D 0 || irq > 63) {
> > +       *val =3D 0;
> > +    } else {
> > +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> > +       iprio =3D env->hviprio[irq];
> > +       /* TODO: This needs to improve in specification */
> > +       if (!(env->hstatus & HSTATUS_VGEIN)) {
> > +           hiid =3D (env->hvicontrol & HVICONTROL_IID_MASK) >>
> > +                 HVICONTROL_IID_SHIFT;
> > +           hiprio =3D env->hvicontrol & HVICONTROL_IPRIO_MASK;
> > +           if (irq =3D=3D hiid && hiprio) {
> > +               iprio =3D hiprio;
> > +           }
> > +       }
> > +       *val |=3D iprio;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val=
)
> > +{
> > +    int irq;
> > +
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        return read_vstopi(env, CSR_VSTOPI, val);
> > +    }
> > +
> > +    irq =3D riscv_cpu_sirq_pending(env);
> > +    if (irq <=3D 0 || irq > 63) {
> > +       *val =3D 0;
> > +    } else {
> > +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> > +       *val |=3D env->siprio[irq];
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /* Hypervisor Extensions */
> >  static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *v=
al)
> >  {
> > @@ -979,26 +1704,90 @@ static int write_hideleg(CPURISCVState *env, int=
 csrno, target_ulong val)
> >      return 0;
> >  }
> >
> > +static int read_hidelegh(CPURISCVState *env, int csrno, target_ulong *=
val)
> > +{
> > +    *val =3D env->hideleg >> 32;
> > +    return 0;
> > +}
> > +
> > +static int write_hidelegh(CPURISCVState *env, int csrno, target_ulong =
val)
> > +{
> > +    uint64_t mask =3D ~TLOWBITS64;
> > +    uint64_t newval =3D ((uint64_t)val) << 32;
> > +
> > +    env->hideleg =3D (env->hideleg & ~mask) | (newval & mask);
> > +
> > +    return 0;
> > +}
> > +
> >  static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_v=
alue,
> >                     target_ulong new_value, target_ulong write_mask)
> >  {
> > -    int ret =3D rmw_mip(env, 0, ret_value, new_value,
> > -                      write_mask & hvip_writable_mask);
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask) & delegable_ints &
> > +                    hvip_writable_mask &
> > +                    ~env->miclaim & TLOWBITS64;
> > +    uint64_t old_mip;
> > +
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask)=
);
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> >
> > -    *ret_value &=3D hvip_writable_mask;
> > +    if (ret_value) {
> > +        *ret_value =3D old_mip & hvip_writable_mask;
> > +    }
> >
> > -    return ret;
> > +    return 0;
> > +}
> > +
> > +static int rmw_hviph(CPURISCVState *env, int csrno, target_ulong *ret_=
value,
> > +                    target_ulong new_value, target_ulong write_mask)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask << 32) & delegable_ints &
> > +                    hvip_writable_mask &
> > +                    ~env->miclaim & ~TLOWBITS64;
> > +    uint64_t new_value64 =3D (uint64_t)new_value << 32;
> > +    uint64_t old_mip;
> > +
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value64 & mas=
k));
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> > +
> > +    if (ret_value) {
> > +        *ret_value =3D (old_mip & hvip_writable_mask) >> 32;
> > +    }
> > +
> > +    return 0;
> >  }
> >
> >  static int rmw_hip(CPURISCVState *env, int csrno, target_ulong *ret_va=
lue,
> >                     target_ulong new_value, target_ulong write_mask)
> >  {
> > -    int ret =3D rmw_mip(env, 0, ret_value, new_value,
> > -                      write_mask & hip_writable_mask);
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    /* Allow software control of delegable interrupts not claimed by h=
ardware */
> > +    uint64_t mask =3D ((uint64_t)write_mask) & delegable_ints &
> > +                    hip_writable_mask &
> > +                    ~env->miclaim & TLOWBITS64;
> > +    uint64_t old_mip;
> >
> > -    *ret_value &=3D hip_writable_mask;
> > +    if (mask) {
> > +        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask)=
);
> > +    } else {
> > +        old_mip =3D env->mip;
> > +    }
> >
> > -    return ret;
> > +    if (ret_value) {
> > +        *ret_value =3D old_mip & hip_writable_mask;
> > +    }
> > +
> > +    return 0;
> >  }
> >
> >  static int read_hie(CPURISCVState *env, int csrno, target_ulong *val)
> > @@ -1009,8 +1798,9 @@ static int read_hie(CPURISCVState *env, int csrno=
, target_ulong *val)
> >
> >  static int write_hie(CPURISCVState *env, int csrno, target_ulong val)
> >  {
> > -    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) | (val & =
VS_MODE_INTERRUPTS);
> > -    return write_mie(env, CSR_MIE, newval);
> > +    uint64_t mask =3D VS_MODE_INTERRUPTS & all_ints & TLOWBITS64;
> > +    env->mie =3D (env->mie & ~mask) | ((uint64_t)val & mask);
> > +    return 0;
> >  }
> >
> >  static int read_hcounteren(CPURISCVState *env, int csrno, target_ulong=
 *val)
> > @@ -1128,6 +1918,110 @@ static int write_htimedeltah(CPURISCVState *env=
, int csrno, target_ulong val)
> >      return 0;
> >  }
> >
> > +static int read_hvicontrol(CPURISCVState *env, int csrno, target_ulong=
 *val)
> > +{
> > +    *val =3D env->hvicontrol;
> > +    return 0;
> > +}
> > +
> > +static int write_hvicontrol(CPURISCVState *env, int csrno, target_ulon=
g val)
> > +{
> > +    env->hvicontrol =3D val & HVICONTROL_VALID_MASK;
> > +    return 0;
> > +}
> > +
> > +static int read_hvipriox(CPURISCVState *env, int first_index,
> > +                         uint8_t *iprio, target_ulong *val)
> > +{
> > +    int i, irq, rdzero, num_irqs =3D 4 * (TARGET_LONG_BITS / 32);
> > +
> > +    /* First index has to be multiple of numbe of irqs per register */
> > +    if (first_index % num_irqs) {
> > +        return (riscv_cpu_virt_enabled(env)) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +
> > +    /* Fill-up return value */
> > +    *val =3D 0;
> > +    for (i =3D 0; i < num_irqs; i++) {
> > +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero=
)) {
> > +            continue;
> > +        }
> > +        if (rdzero) {
> > +            continue;
> > +        }
> > +        *val |=3D ((target_ulong)iprio[irq]) << (i * 8);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int write_hvipriox(CPURISCVState *env, int first_index,
> > +                          uint8_t *iprio, target_ulong val)
> > +{
> > +    int i, irq, rdzero, num_irqs =3D 4 * (TARGET_LONG_BITS / 32);
> > +
> > +    /* First index has to be multiple of numbe of irqs per register */
> > +    if (first_index % num_irqs) {
> > +        return (riscv_cpu_virt_enabled(env)) ?
> > +               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGA=
L_INST;
> > +    }
> > +
> > +    /* Fill-up priority arrary */
> > +    for (i =3D 0; i < num_irqs; i++) {
> > +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero=
)) {
> > +            continue;
> > +        }
> > +        if (rdzero) {
> > +            iprio[irq] =3D 0;
> > +        } else {
> > +            iprio[irq] =3D (val >> (i * 8)) & 0xff;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *=
val)
> > +{
> > +    return read_hvipriox(env, 0, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong =
val)
> > +{
> > +    return write_hvipriox(env, 0, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong =
*val)
> > +{
> > +    return read_hvipriox(env, 4, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong=
 val)
> > +{
> > +    return write_hvipriox(env, 4, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *=
val)
> > +{
> > +    return read_hvipriox(env, 8, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong =
val)
> > +{
> > +    return write_hvipriox(env, 8, env->hviprio, val);
> > +}
> > +
> > +static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong =
*val)
> > +{
> > +    return read_hvipriox(env, 12, env->hviprio, val);
> > +}
> > +
> > +static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong=
 val)
> > +{
> > +    return write_hvipriox(env, 12, env->hviprio, val);
> > +}
> > +
> >  /* Virtual CSR Registers */
> >  static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *=
val)
> >  {
> > @@ -1428,6 +2322,25 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >      [CSR_MBADADDR] =3D { "mbadaddr", any,  read_mbadaddr, write_mbadad=
dr },
> >      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip     =
   },
> >
> > +    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> > +    [CSR_MISELECT] =3D { "miselect", aia_any,   NULL, NULL,    rmw_xis=
elect },
> > +    [CSR_MIREG]    =3D { "mireg",    aia_any,   NULL, NULL,    rmw_xir=
eg },
> > +
> > +    /* Machine-Level Interrupts (AIA) */
> > +    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
> > +
> > +    /* Machine-Level IMSIC Interface (AIA) */
> > +    [CSR_MSETEIPNUM] =3D { "mseteipnum", aia_any, read_xsetclreinum, w=
rite_xsetclreinum },
> > +    [CSR_MCLREIPNUM] =3D { "mclreipnum", aia_any, read_xsetclreinum, w=
rite_xsetclreinum },
> > +    [CSR_MSETEIENUM] =3D { "mseteienum", aia_any, read_xsetclreinum, w=
rite_xsetclreinum },
> > +    [CSR_MCLREIENUM] =3D { "mclreienum", aia_any, read_xsetclreinum, w=
rite_xsetclreinum },
> > +    [CSR_MCLAIMEI]   =3D { "mclaimei",   aia_any, read_xclaimei },
> > +
> > +    /* Machine-Level High-Half CSRs (AIA) */
> > +    [CSR_MIDELEGH] =3D { "midelegh", aia_any32, read_midelegh, write_m=
idelegh },
> > +    [CSR_MIEH]     =3D { "mieh",     aia_any32, read_mieh,     write_m=
ieh     },
> > +    [CSR_MIPH]     =3D { "miph",     aia_any32, NULL,    NULL, rmw_mip=
h       },
> > +
> >      /* Supervisor Trap Setup */
> >      [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write=
_sstatus    },
> >      [CSR_SIE]        =3D { "sie",        smode, read_sie,        write=
_sie        },
> > @@ -1444,6 +2357,24 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >      /* Supervisor Protection and Translation */
> >      [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp  =
    },
> >
> > +    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) =
*/
> > +    [CSR_SISELECT]   =3D { "siselect",   aia_smode, NULL, NULL, rmw_xi=
select },
> > +    [CSR_SIREG]      =3D { "sireg",      aia_smode, NULL, NULL, rmw_xi=
reg },
> > +
> > +    /* Supervisor-Level Interrupts (AIA) */
> > +    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
> > +
> > +    /* Supervisor-Level IMSIC Interface (AIA) */
> > +    [CSR_SSETEIPNUM] =3D { "sseteipnum", aia_smode, read_xsetclreinum,=
 write_xsetclreinum },
> > +    [CSR_SCLREIPNUM] =3D { "sclreipnum", aia_smode, read_xsetclreinum,=
 write_xsetclreinum },
> > +    [CSR_SSETEIENUM] =3D { "sseteienum", aia_smode, read_xsetclreinum,=
 write_xsetclreinum },
> > +    [CSR_SCLREIENUM] =3D { "sclreienum", aia_smode, read_xsetclreinum,=
 write_xsetclreinum },
> > +    [CSR_SCLAIMEI]   =3D { "sclaimei",   aia_smode, read_xclaimei },
> > +
> > +    /* Supervisor-Level High-Half CSRs (AIA) */
> > +    [CSR_SIEH]       =3D { "sieh",       aia_smode32, read_sieh,  writ=
e_sieh },
> > +    [CSR_SIPH]       =3D { "siph",       aia_smode32, NULL, NULL, rmw_=
siph   },
> > +
> >      [CSR_HSTATUS]     =3D { "hstatus",     hmode,   read_hstatus,     =
write_hstatus     },
> >      [CSR_HEDELEG]     =3D { "hedeleg",     hmode,   read_hedeleg,     =
write_hedeleg     },
> >      [CSR_HIDELEG]     =3D { "hideleg",     hmode,   read_hideleg,     =
write_hideleg     },
> > @@ -1472,6 +2403,32 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >      [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,      =
write_mtval2      },
> >      [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      =
write_mtinst      },
> >
> > +    /* Virtual Interrupts and Interrupt Priorities (H-extension with A=
IA) */
> > +    [CSR_HVICONTROL]  =3D { "hvicontrol",  aia_hmode, read_hvicontrol,=
 write_hvicontrol },
> > +    [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,  =
 write_hviprio1 },
> > +    [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,  =
 write_hviprio2 },
> > +
> > +    /* VS-Level Window to Indirectly Accessed Registers (H-extension w=
ith AIA) */
> > +    [CSR_VSISELECT]   =3D { "vsiselect",   aia_hmode, NULL, NULL,     =
 rmw_xiselect },
> > +    [CSR_VSIREG]      =3D { "vsireg",      aia_hmode, NULL, NULL,     =
 rmw_xireg },
> > +
> > +    /* VS-Level Interrupts (H-extension with AIA) */
> > +    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
> > +
> > +    /* VS-Level IMSIC Interface (H-extension with AIA) */
> > +    [CSR_VSSETEIPNUM] =3D { "vsseteipnum", aia_hmode, read_xsetclreinu=
m, write_xsetclreinum },
> > +    [CSR_VSCLREIPNUM] =3D { "vsclreipnum", aia_hmode, read_xsetclreinu=
m, write_xsetclreinum },
> > +    [CSR_VSSETEIENUM] =3D { "vsseteienum", aia_hmode, read_xsetclreinu=
m, write_xsetclreinum },
> > +    [CSR_VSCLREIENUM] =3D { "vsclreienum", aia_hmode, read_xsetclreinu=
m, write_xsetclreinum },
> > +
> > +    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) *=
/
> > +    [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, read_hidelegh,=
  write_hidelegh },
> > +    [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL,   =
  rmw_hviph },
> > +    [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1h=
, write_hviprio1h },
> > +    [CSR_HVIPRIO2H]   =3D { "hviprio2h",   aia_hmode32, read_hviprio2h=
, write_hviprio2h },
> > +    [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, read_vsieh,   =
  write_vsieh },
> > +    [CSR_VSIPH]       =3D { "vsiep",       aia_hmode32, NULL, NULL,   =
  rmw_vsiph },
> > +
> >      /* Physical Memory Protection */
> >      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcf=
g  },
> >      [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcf=
g  },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 44d4015bd6..f7fa48c240 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -102,19 +102,22 @@ static const VMStateDescription vmstate_vector =
=3D {
> >
> >  static const VMStateDescription vmstate_hyper =3D {
> >      .name =3D "cpu/hyper",
> > -    .version_id =3D 1,
> > -    .minimum_version_id =3D 1,
> > +    .version_id =3D 2,
> > +    .minimum_version_id =3D 2,
> >      .needed =3D hyper_needed,
> >      .fields =3D (VMStateField[]) {
> >          VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> >          VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> > -        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> > +        VMSTATE_UINT64(env.hideleg, RISCVCPU),
> >          VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.htval, RISCVCPU),
> >          VMSTATE_UINTTL(env.htinst, RISCVCPU),
> >          VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> >          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> >
> > +        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> > +        VMSTATE_UINTTL(env.hvicontrol, RISCVCPU),
> > +
> >          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> >          VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> >          VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> > @@ -122,6 +125,7 @@ static const VMStateDescription vmstate_hyper =3D {
> >          VMSTATE_UINTTL(env.vscause, RISCVCPU),
> >          VMSTATE_UINTTL(env.vstval, RISCVCPU),
> >          VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> > +        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
> >
> >          VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> >          VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> > @@ -140,11 +144,13 @@ static const VMStateDescription vmstate_hyper =3D=
 {
> >
> >  const VMStateDescription vmstate_riscv_cpu =3D {
> >      .name =3D "cpu",
> > -    .version_id =3D 1,
> > -    .minimum_version_id =3D 1,
> > +    .version_id =3D 2,
> > +    .minimum_version_id =3D 2,
> >      .fields =3D (VMStateField[]) {
> >          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> > +        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
> > +        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
> >          VMSTATE_UINTTL(env.pc, RISCVCPU),
> >          VMSTATE_UINTTL(env.load_res, RISCVCPU),
> >          VMSTATE_UINTTL(env.load_val, RISCVCPU),
> > @@ -161,10 +167,10 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >          VMSTATE_UINTTL(env.resetvec, RISCVCPU),
> >          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
> >          VMSTATE_UINT64(env.mstatus, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mip, RISCVCPU),
> > -        VMSTATE_UINT32(env.miclaim, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mie, RISCVCPU),
> > -        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
> > +        VMSTATE_UINT64(env.mip, RISCVCPU),
> > +        VMSTATE_UINT64(env.miclaim, RISCVCPU),
> > +        VMSTATE_UINT64(env.mie, RISCVCPU),
> > +        VMSTATE_UINT64(env.mideleg, RISCVCPU),
> >          VMSTATE_UINTTL(env.sptbr, RISCVCPU),
> >          VMSTATE_UINTTL(env.satp, RISCVCPU),
> >          VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
> > @@ -177,6 +183,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >          VMSTATE_UINTTL(env.mepc, RISCVCPU),
> >          VMSTATE_UINTTL(env.mcause, RISCVCPU),
> >          VMSTATE_UINTTL(env.mtval, RISCVCPU),
> > +        VMSTATE_UINTTL(env.miselect, RISCVCPU),
> > +        VMSTATE_UINTTL(env.siselect, RISCVCPU),
> >          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> >          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> > --
> > 2.25.1
> >
> >

