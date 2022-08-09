Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLUzp-0007gK-RU
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 15:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLUzj-0007bb-K7
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 15:34:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLUzf-0000V2-O5
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 15:34:27 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w14so12241569plp.9
 for <qemu-riscv@nongnu.org>; Tue, 09 Aug 2022 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8btNphtI0FaI4AGB6Q5aLUHbpQBIjBHhY/bu0V0ggYA=;
 b=hY032PNrqxtwEm/oyU5S85jSdcboQ+f5y6wIhnxH0phMrfT86qNLyJab7lpl5JdBgu
 JsLgK4gBpAfp2Y0US0UQIwXplRPa0h148x84rcYviG8Zic9zUKcM6SketgmoiJbEm1w4
 CnicDZ/quX76Xw7XQ8j0irPuwCaWGVHjh4L6YUl4ajxiyUr63IjTiRHLEsexf730e8Ea
 2BwCwkPvn/gOKja0vu7p6WyQX2aKN1L05pHNLfpL2xpH7aLbPgIg5s/J9ePfaaAeWTw0
 wIHPaBuK8w9eyoqLHGIxiVCRGocKxZHEfCLFPEIxEGhel8T2k9NnCYEdlzfHabHGYYxg
 VZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8btNphtI0FaI4AGB6Q5aLUHbpQBIjBHhY/bu0V0ggYA=;
 b=tU0E8X0PAW+iYEVITam9x9F6mOF9dckUSt6nvHOnHvEvHwfkgPWsxKjhUJDKV5B5Gu
 afWlKpcshhBkGzWg4v8WFAAAUvVf4PxefWrcLZWXhCGFk1cXc23BduJmdhTjTKpARR22
 aGOx3tdFiQLabDjkR8ali1bEDP98oD9Yb5F+xGwhazUHhsKAYni7zd7Ftx0TH4PxfdNn
 T1ScNapONT1CEKh72qYDob6kDdbGh3bZKi/s4dkcCvJaf8e1Hiqca/arGFf6Y/8KZoFW
 ik7siBnHKFUxU6Td402g2jj6mZduYlDYHJm0JmZXmhfoTK804tqZjcG2sMJghuHOPin6
 XVLA==
X-Gm-Message-State: ACgBeo3gGOTSuT+oaBoanGN2fgLry4aEtHBFHI+LgsOXtDqLCO74gAtA
 Sl55+Sm8B+2TonduAvULfTQ6Ri+WOh6Z+hcpJVKMbA==
X-Google-Smtp-Source: AA6agR6GhA4MHwiXfhVlmpN4gGCln1HIl5DqbxTaGBbhHAJk8PqEGOS/pzD9pM30J55RBykeY7/0DQ0RaNi/F7JOphg=
X-Received: by 2002:a17:902:da8f:b0:16f:6b6:eed7 with SMTP id
 j15-20020a170902da8f00b0016f06b6eed7mr24628841plx.85.1660073660419; Tue, 09
 Aug 2022 12:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220804014240.2514957-1-atishp@rivosinc.com>
 <20220804014240.2514957-4-atishp@rivosinc.com>
 <c8406f96-4bf7-aee0-71f0-3758c6ed4c97@iscas.ac.cn>
 <CAHBxVyE+mHSaDHEOS+4RwL+qCY4WLNuxUguSmL5p9m-OkbMQCA@mail.gmail.com>
 <63ae4839-9bf4-2c9d-8bd4-e9ea4bbab939@iscas.ac.cn>
In-Reply-To: <63ae4839-9bf4-2c9d-8bd4-e9ea4bbab939@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 9 Aug 2022 12:34:09 -0700
Message-ID: <CAHBxVyFRa+jO99SnvNPwbjGxcDtpxFvroJM=agerijTwz8Mx-Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] target/riscv: Add vstimecmp support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d4a57105e5d404b2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Tue, 09 Aug 2022 19:34:31 -0000

--000000000000d4a57105e5d404b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2022 at 12:01 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/8/9 =E4=B8=8A=E5=8D=881:20, Atish Kumar Patra =E5=86=99=E9=
=81=93:
>
>
>
> On Sun, Aug 7, 2022 at 6:50 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>>
>> =E5=9C=A8 2022/8/4 =E4=B8=8A=E5=8D=889:42, Atish Patra =E5=86=99=E9=81=
=93:
>> > vstimecmp CSR allows the guest OS or to program the next guest timer
>> > interrupt directly. Thus, hypervisor no longer need to inject the
>> > timer interrupt to the guest if vstimecmp is used. This was ratified
>> > as a part of the Sstc extension.
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > ---
>> >   target/riscv/cpu.h         |   4 ++
>> >   target/riscv/cpu_bits.h    |   4 ++
>> >   target/riscv/cpu_helper.c  |  11 ++--
>> >   target/riscv/csr.c         | 102 +++++++++++++++++++++++++++++++++++=
+-
>> >   target/riscv/machine.c     |   1 +
>> >   target/riscv/time_helper.c |  16 ++++++
>> >   6 files changed, 133 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 4cda2905661e..1fd382b2717f 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -312,6 +312,8 @@ struct CPUArchState {
>> >       /* Sstc CSRs */
>> >       uint64_t stimecmp;
>> >
>> > +    uint64_t vstimecmp;
>> > +
>> >       /* physical memory protection */
>> >       pmp_table_t pmp_state;
>> >       target_ulong mseccfg;
>> > @@ -366,6 +368,8 @@ struct CPUArchState {
>> >
>> >       /* Fields from here on are preserved across CPU reset. */
>> >       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
>> > +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
>> > +    bool vstime_irq;
>> >
>> >       hwaddr kernel_addr;
>> >       hwaddr fdt_addr;
>> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> > index ac17cf1515c0..095dab19f512 100644
>> > --- a/target/riscv/cpu_bits.h
>> > +++ b/target/riscv/cpu_bits.h
>> > @@ -257,6 +257,10 @@
>> >   #define CSR_VSIP            0x244
>> >   #define CSR_VSATP           0x280
>> >
>> > +/* Sstc virtual CSRs */
>> > +#define CSR_VSTIMECMP       0x24D
>> > +#define CSR_VSTIMECMPH      0x25D
>> > +
>> >   #define CSR_MTINST          0x34a
>> >   #define CSR_MTVAL2          0x34b
>> >
>> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> > index 650574accf0a..1e4faa84e839 100644
>> > --- a/target/riscv/cpu_helper.c
>> > +++ b/target/riscv/cpu_helper.c
>> > @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>> >   {
>> >       uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>> >       uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : =
0;
>> > +    uint64_t vstip =3D (env->vstime_irq) ? MIP_VSTIP : 0;
>> >
>> > -    return (env->mip | vsgein) & env->mie;
>> > +    return (env->mip | vsgein | vstip) & env->mie;
>> >   }
>> >
>> >   int riscv_cpu_mirq_pending(CPURISCVState *env)
>> > @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
>> uint64_t mask, uint64_t value)
>> >   {
>> >       CPURISCVState *env =3D &cpu->env;
>> >       CPUState *cs =3D CPU(cpu);
>> > -    uint64_t gein, vsgein =3D 0, old =3D env->mip;
>> > +    uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env->mip;
>> >       bool locked =3D false;
>> >
>> >       if (riscv_cpu_virt_enabled(env)) {
>> > @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
>> uint64_t mask, uint64_t value)
>> >           vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>> >       }
>> >
>> > +    /* No need to update mip for VSTIP */
>> > +    mask =3D ((mask =3D=3D MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
>> > +    vstip =3D env->vstime_irq ? MIP_VSTIP : 0;
>> > +
>> >       if (!qemu_mutex_iothread_locked()) {
>> >           locked =3D true;
>> >           qemu_mutex_lock_iothread();
>> > @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu,
>> uint64_t mask, uint64_t value)
>> >
>> >       env->mip =3D (env->mip & ~mask) | (value & mask);
>> >
>> > -    if (env->mip | vsgein) {
>> > +    if (env->mip | vsgein | vstip) {
>> >           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>> >       } else {
>> >           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> > index e18b000700e4..9da4d6515e7b 100644
>> > --- a/target/riscv/csr.c
>> > +++ b/target/riscv/csr.c
>> > @@ -829,17 +829,100 @@ static RISCVException sstc(CPURISCVState *env,
>> int csrno)
>> >       return smode(env, csrno);
>> >   }
>> >
>> > +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
>> > +{
>> > +    CPUState *cs =3D env_cpu(env);
>> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
>> > +
>> > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
>> > +        return RISCV_EXCP_ILLEGAL_INST;
>> > +    }
>> > +
>> > +    if (env->priv =3D=3D PRV_M) {
>> > +        return RISCV_EXCP_NONE;
>> > +    }
>> > +
>> > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
>> > +          get_field(env->menvcfg, MENVCFG_STCE))) {
>> > +        return RISCV_EXCP_ILLEGAL_INST;
>> > +    }
>> > +
>> > +    if (riscv_cpu_virt_enabled(env)) {
>> > +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
>> > +              get_field(env->henvcfg, HENVCFG_STCE))) {
>> > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > +        }
>> > +    }
>> > +
>>
>> I think this check on hcounteren and henvcfg should be added to sstc
>> predicate, not here.
>>
>> Even though hcounteren and henvcfg finally controls the access of
>> vstimecmp, however
>>
>>
> We don't need to check hcounteren while accessing scountern. Thus it will
> be an unnecessary
> check there. Predicate function check should do the required sanity check
> required only for that specific CSR.
> That's why, I think it is the correct place.
>
> Sorry. It seems have no relationship with "check hcounteren while
> accessing scountern".
>
>


> As the sstc spec (Section 2.2 and Chapter 3) states:
>
> *"In addition, when the TM bit in the hcounteren register is clear,
> attempts to access the vstimecmp register (**via*
> *stimecmp**) while executing in VS-mode will cause a virtual instruction
> exception if the same bit in mcounteren is*
> *1. When this bit is set, access to the vstimecmp register (if
> implemented) is permitted in VS-mode."*
>
> *"When STCE in menvcfg is one but STCE in henvcfg is zero, an attempt to =
**access
> stimecmp **(really vstimecmp)*
> *when V =3D 1 raises a virtual instruction exception, and VSTIP in hip
> reverts to its defined behavior as if this*
> *extension is not implemented."*
>
> Both of them have stated the control is for stimecmp even though the fina=
l
> access is for vstimecmp just like
>
> your following modification for read/write_stimecmp.
>

We can further simplify to remove sstc_hmode completely. After moving this
bit to sstc predicate function, it is enough for vstimecmp as well.


>
> From the  other hand,  direct access for VS CSRs (including vstimecmp)
> from VS/VU mode is never allowed,
>
> which is checked in riscv_csrrw_check.
>
Regards,
>
> Weiwei Li
>
>
>
>> it controls it via stimecmp.
>>
>> > +    return hmode(env, csrno);
>> > +}
>> > +
>> > +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
>> > +                                    target_ulong *val)
>> > +{
>> > +    *val =3D env->vstimecmp;
>> > +
>> > +    return RISCV_EXCP_NONE;
>> > +}
>> > +
>> > +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
>> > +                                    target_ulong *val)
>> > +{
>> > +    *val =3D env->vstimecmp >> 32;
>> > +
>> > +    return RISCV_EXCP_NONE;
>> > +}
>> > +
>> > +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
>> > +                                    target_ulong val)
>> > +{
>> > +    RISCVCPU *cpu =3D env_archcpu(env);
>> > +
>> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
>> > +        env->vstimecmp =3D deposit64(env->vstimecmp, 0, 32,
>> (uint64_t)val);
>> > +    } else {
>> > +        env->vstimecmp =3D val;
>> > +    }
>> > +
>> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
>> > +                              env->htimedelta, MIP_VSTIP);
>> > +
>> > +    return RISCV_EXCP_NONE;
>> > +}
>> > +
>> > +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
>> > +                                    target_ulong val)
>> > +{
>> > +    RISCVCPU *cpu =3D env_archcpu(env);
>> > +
>> > +    env->vstimecmp =3D deposit64(env->vstimecmp, 32, 32, (uint64_t)va=
l);
>> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
>> > +                              env->htimedelta, MIP_VSTIP);
>> > +
>> > +    return RISCV_EXCP_NONE;
>> > +}
>> > +
>> >   static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>> >                                       target_ulong *val)
>> >   {
>> > -    *val =3D env->stimecmp;
>> > +    if (riscv_cpu_virt_enabled(env)) {
>> > +        *val =3D env->vstimecmp;
>> > +    } else {
>> > +        *val =3D env->stimecmp;
>> > +    }
>> > +
>> >       return RISCV_EXCP_NONE;
>> >   }
>> >
>> >   static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>> >                                       target_ulong *val)
>> >   {
>> > -    *val =3D env->stimecmp >> 32;
>> > +    if (riscv_cpu_virt_enabled(env)) {
>> > +        *val =3D env->vstimecmp >> 32;
>> > +    } else {
>> > +        *val =3D env->stimecmp >> 32;
>> > +    }
>> > +
>> >       return RISCV_EXCP_NONE;
>> >   }
>> >
>> > @@ -848,6 +931,10 @@ static RISCVException write_stimecmp(CPURISCVStat=
e
>> *env, int csrno,
>> >   {
>> >       RISCVCPU *cpu =3D env_archcpu(env);
>> >
>> > +    if (riscv_cpu_virt_enabled(env)) {
>> > +        return write_vstimecmp(env, csrno, val);
>> > +    }
>> > +
>> >       if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
>> >           env->stimecmp =3D deposit64(env->stimecmp, 0, 32,
>> (uint64_t)val);
>> >       } else {
>> > @@ -864,6 +951,10 @@ static RISCVException
>> write_stimecmph(CPURISCVState *env, int csrno,
>> >   {
>> >       RISCVCPU *cpu =3D env_archcpu(env);
>> >
>> > +    if (riscv_cpu_virt_enabled(env)) {
>> > +        return write_vstimecmph(env, csrno, val);
>> > +    }
>> > +
>> >       env->stimecmp =3D deposit64(env->stimecmp, 32, 32, (uint64_t)val=
);
>> >       riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0,
>> MIP_STIP);
>> >
>> > @@ -1801,6 +1892,7 @@ static RISCVException rmw_mip64(CPURISCVState
>> *env, int csrno,
>> >       if (csrno !=3D CSR_HVIP) {
>> >           gin =3D get_field(env->hstatus, HSTATUS_VGEIN);
>> >           old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ?
>> MIP_VSEIP : 0;
>> > +        old_mip |=3D env->vstime_irq ? MIP_VSTIP : 0;
>> >       }
>> >
>> >       if (ret_val) {
>> > @@ -3661,6 +3753,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
>> >                                             .min_priv_ver =3D
>> PRIV_VERSION_1_12_0 },
>> >       [CSR_STIMECMPH] =3D { "stimecmph", sstc, read_stimecmph,
>> write_stimecmph,
>> >                                             .min_priv_ver =3D
>> PRIV_VERSION_1_12_0 },
>> > +    [CSR_VSTIMECMP] =3D { "vstimecmp", sstc_hmode, read_vstimecmp,
>> > +                                          write_vstimecmp,
>>
>> Please align with last line. The same to other similar lines.
>>
>>
> Sure. I will fix that.
>
>
>> Regards,
>>
>> Weiwei Li
>>
>> > +                                          .min_priv_ver =3D
>> PRIV_VERSION_1_12_0 },
>> > +    [CSR_VSTIMECMPH] =3D { "vstimecmph", sstc_hmode, read_vstimecmph,
>> > +                                          write_vstimecmph,
>> > +                                          .min_priv_ver =3D
>> PRIV_VERSION_1_12_0 },
>> >
>> >       /* Supervisor Protection and Translation */
>> >       [CSR_SATP]     =3D { "satp",     smode, read_satp,     write_sat=
p
>>    },
>> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> > index 622fface484e..4ba55705d147 100644
>> > --- a/target/riscv/machine.c
>> > +++ b/target/riscv/machine.c
>> > @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
>> >           VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>> >           VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>> >           VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>> > +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>> >
>> >           VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>> >           VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
>> > index f3fb5eac7b7b..8cce667dfd47 100644
>> > --- a/target/riscv/time_helper.c
>> > +++ b/target/riscv/time_helper.c
>> > @@ -22,6 +22,14 @@
>> >   #include "time_helper.h"
>> >   #include "hw/intc/riscv_aclint.h"
>> >
>> > +static void riscv_vstimer_cb(void *opaque)
>> > +{
>> > +    RISCVCPU *cpu =3D opaque;
>> > +    CPURISCVState *env =3D &cpu->env;
>> > +    env->vstime_irq =3D 1;
>> > +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
>> > +}
>> > +
>> >   static void riscv_stimer_cb(void *opaque)
>> >   {
>> >       RISCVCPU *cpu =3D opaque;
>> > @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu,
>> QEMUTimer *timer,
>> >            * If we're setting an stimecmp value in the "past",
>> >            * immediately raise the timer interrupt
>> >            */
>> > +        if (timer_irq =3D=3D MIP_VSTIP) {
>> > +            env->vstime_irq =3D 1;
>> > +        }
>> >           riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>> >           return;
>> >       }
>> >
>> > +    if (timer_irq =3D=3D MIP_VSTIP) {
>> > +        env->vstime_irq =3D 0;
>> > +    }
>> >       /* Clear the [V]STIP bit in mip */
>> >       riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>> >
>> > @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>> >       env->stimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_c=
b,
>> cpu);
>> >       env->stimecmp =3D 0;
>> >
>> > +    env->vstimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_=
cb,
>> cpu);
>> > +    env->vstimecmp =3D 0;
>> >   }
>>
>>

--000000000000d4a57105e5d404b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 9, 2022 at 12:01 AM Weiwei Li &lt;<a href=3D"mailto:liwe=
iwei@iscas.ac.cn" target=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>=E5=9C=A8 2022/8/9 =E4=B8=8A=E5=8D=881:20, Atish Kumar Patra
      =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 6:50
            PM Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" target=
=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote"><br>
            =E5=9C=A8 2022/8/4 =E4=B8=8A=E5=8D=889:42, Atish Patra =E5=86=
=99=E9=81=93:<br>
            &gt; vstimecmp CSR allows the guest OS or to program the
            next guest timer<br>
            &gt; interrupt directly. Thus, hypervisor no longer need to
            inject the<br>
            &gt; timer interrupt to the guest if vstimecmp is used. This
            was ratified<br>
            &gt; as a part of the Sstc extension.<br>
            &gt;<br>
            &gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@ri=
vosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 ++<br>
            &gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 ++<br>
            &gt;=C2=A0 =C2=A0target/riscv/cpu_helper.c=C2=A0 |=C2=A0 11 ++-=
-<br>
            &gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 102
            ++++++++++++++++++++++++++++++++++++-<br>
            &gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
            &gt;=C2=A0 =C2=A0target/riscv/time_helper.c |=C2=A0 16 ++++++<b=
r>
            &gt;=C2=A0 =C2=A06 files changed, 133 insertions(+), 5 deletion=
s(-)<br>
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
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* physical memory protection */=
<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmp_table_t pmp_state;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mseccfg;<br>
            &gt; @@ -366,6 +368,8 @@ struct CPUArchState {<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are prese=
rved across CPU
            reset. */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUTimer *stimer; /* Internal t=
imer for S-mode
            interrupt */<br>
            &gt; +=C2=A0 =C2=A0 QEMUTimer *vstimer; /* Internal timer for V=
S-mode
            interrupt */<br>
            &gt; +=C2=A0 =C2=A0 bool vstime_irq;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr kernel_addr;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr fdt_addr;<br>
            &gt; diff --git a/target/riscv/cpu_bits.h
            b/target/riscv/cpu_bits.h<br>
            &gt; index ac17cf1515c0..095dab19f512 100644<br>
            &gt; --- a/target/riscv/cpu_bits.h<br>
            &gt; +++ b/target/riscv/cpu_bits.h<br>
            &gt; @@ -257,6 +257,10 @@<br>
            &gt;=C2=A0 =C2=A0#define CSR_VSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x244<br>
            &gt;=C2=A0 =C2=A0#define CSR_VSATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x280<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +/* Sstc virtual CSRs */<br>
            &gt; +#define CSR_VSTIMECMP=C2=A0 =C2=A0 =C2=A0 =C2=A00x24D<br>
            &gt; +#define CSR_VSTIMECMPH=C2=A0 =C2=A0 =C2=A0 0x25D<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0#define CSR_MTINST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x34a<br>
            &gt;=C2=A0 =C2=A0#define CSR_MTVAL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x34b<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; diff --git a/target/riscv/cpu_helper.c
            b/target/riscv/cpu_helper.c<br>
            &gt; index 650574accf0a..1e4faa84e839 100644<br>
            &gt; --- a/target/riscv/cpu_helper.c<br>
            &gt; +++ b/target/riscv/cpu_helper.c<br>
            &gt; @@ -345,8 +345,9 @@ uint64_t
            riscv_cpu_all_pending(CPURISCVState *env)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t gein =3D get_field(env-=
&gt;hstatus,
            HSTATUS_VGEIN);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t vsgein =3D (env-&gt;hge=
ip &amp; (1ULL
            &lt;&lt; gein)) ? MIP_VSEIP : 0;<br>
            &gt; +=C2=A0 =C2=A0 uint64_t vstip =3D (env-&gt;vstime_irq) ? M=
IP_VSTIP
            : 0;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 return (env-&gt;mip | vsgein) &amp; env-&gt=
;mie;<br>
            &gt; +=C2=A0 =C2=A0 return (env-&gt;mip | vsgein | vstip) &amp;
            env-&gt;mie;<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0int riscv_cpu_mirq_pending(CPURISCVState *env)=
<br>
            &gt; @@ -605,7 +606,7 @@ uint64_t
            riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
            value)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-=
&gt;env;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
            &gt; -=C2=A0 =C2=A0 uint64_t gein, vsgein =3D 0, old =3D env-&g=
t;mip;<br>
            &gt; +=C2=A0 =C2=A0 uint64_t gein, vsgein =3D 0, vstip =3D 0, o=
ld =3D
            env-&gt;mip;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool locked =3D false;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env))=
 {<br>
            &gt; @@ -613,6 +614,10 @@ uint64_t
            riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
            value)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vsgein =3D (env-&g=
t;hgeip &amp; (1ULL &lt;&lt;
            gein)) ? MIP_VSEIP : 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 /* No need to update mip for VSTIP */<br>
            &gt; +=C2=A0 =C2=A0 mask =3D ((mask =3D=3D MIP_VSTIP) &amp;&amp=
;
            env-&gt;vstime_irq) ? 0 : mask;<br>
            &gt; +=C2=A0 =C2=A0 vstip =3D env-&gt;vstime_irq ? MIP_VSTIP : =
0;<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qemu_mutex_iothread_locked(=
)) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locked =3D true;<b=
r>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_io=
thread();<br>
            &gt; @@ -620,7 +625,7 @@ uint64_t
            riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t
            value)<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mip =3D (env-&gt;mip &am=
p; ~mask) | (value
            &amp; mask);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 if (env-&gt;mip | vsgein) {<br>
            &gt; +=C2=A0 =C2=A0 if (env-&gt;mip | vsgein | vstip) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_interrupt(cs, =
CPU_INTERRUPT_HARD);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_reset_interrup=
t(cs, CPU_INTERRUPT_HARD);<br>
            &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
            &gt; index e18b000700e4..9da4d6515e7b 100644<br>
            &gt; --- a/target/riscv/csr.c<br>
            &gt; +++ b/target/riscv/csr.c<br>
            &gt; @@ -829,17 +829,100 @@ static RISCVException
            sstc(CPURISCVState *env, int csrno)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return smode(env, csrno);<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +static RISCVException sstc_hmode(CPURISCVState *env,
            int csrno)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
            &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sstc || !env-&gt;rdtim=
e_fn) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INS=
T;<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 if (!(get_field(env-&gt;mcounteren, COUNTER=
EN_TM)
            &amp;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;menv=
cfg, MENVCFG_STCE))) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INS=
T;<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(get_field(env-&gt;hcoun=
teren,
            COUNTEREN_TM) &amp;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_fiel=
d(env-&gt;henvcfg,
            HENVCFG_STCE))) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EX=
CP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            <br>
            I think this check on hcounteren and henvcfg should be added
            to sstc <br>
            predicate, not here.<br>
            <br>
            Even though hcounteren and henvcfg finally controls the
            access of=C2=A0 <br>
            vstimecmp, however<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>We don&#39;t need to check hcounteren while accessing
            scountern. Thus it will be an unnecessary</div>
          <div>check there. Predicate function check should do the
            required sanity check required only for that specific CSR.</div=
>
          <div>That&#39;s why, I think it is the correct place.</div>
        </div>
      </div>
    </blockquote>
    <p>Sorry. It seems have no relationship with &quot;check hcounteren whi=
le
      accessing scountern&quot;. <br>
    </p>
    <p> </p></div></blockquote><div><br></div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div><p>As the sstc spec (Section=
 2.2 and Chapter 3) states:</p>
    <p><i>&quot;In addition, when the TM bit in the hcounteren register is
        clear, attempts to access the vstimecmp register (</i><i><b>via</b>=
</i><i><b><br>
        </b></i><i><b>stimecmp</b></i><i>) while executing in VS-mode
        will cause a virtual instruction exception if the same bit in
        mcounteren is</i><i><br>
      </i><i>1. When this bit is set, access to the vstimecmp register
        (if implemented) is permitted in VS-mode.&quot;</i></p>
    <p><i>&quot;When STCE in menvcfg is one but STCE in henvcfg is zero, an
        attempt to </i><i><b>access stimecmp </b></i><i>(really
        vstimecmp)</i><i><br>
      </i><i>when V =3D 1 raises a virtual instruction exception, and
        VSTIP in hip reverts to its defined behavior as if this</i><i><br>
      </i><i>extension is not implemented.&quot;</i></p>
    <p>Both of them have stated the control is for stimecmp even though
      the final access is for vstimecmp just like</p>
    <p>your following modification for read/write_stimecmp.=C2=A0</p></div>=
</blockquote><div><br></div><div><div>We can further simplify to remove sst=
c_hmode completely. After moving this bit to sstc predicate function, it=C2=
=A0is enough for vstimecmp as well.=C2=A0</div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div><p> <br>
    </p>
    <p>From the=C2=A0 other hand,=C2=A0 direct access for VS CSRs (includin=
g
      vstimecmp) from VS/VU mode is never allowed,<br>
    </p>
    <p>which is checked in riscv_csrrw_check.=C2=A0</p></div></blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li=C2=A0 <br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote">
            it controls it via stimecmp.<br>
            <br>
            &gt; +=C2=A0 =C2=A0 return hmode(env, csrno);<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_vstimecmp(CPURISCVState
            *env, int csrno,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targe=
t_ulong *val)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp;<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_vstimecmph(CPURISCVState
            *env, int csrno,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targe=
t_ulong *val)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp &gt;&gt; 32;<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_vstimecmp(CPURISCVState
            *env, int csrno,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targe=
t_ulong val)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<b=
r>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstimecmp =3D
            deposit64(env-&gt;vstimecmp, 0, 32, (uint64_t)val);<br>
            &gt; +=C2=A0 =C2=A0 } else {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstimecmp =3D val;<br=
>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;vsti=
mer,
            env-&gt;vstimecmp,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;htimedelta,
            MIP_VSTIP);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_vstimecmph(CPURISCVState
            *env, int csrno,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targe=
t_ulong val)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 env-&gt;vstimecmp =3D deposit64(env-&gt;vst=
imecmp,
            32, 32, (uint64_t)val);<br>
            &gt; +=C2=A0 =C2=A0 riscv_timer_write_timecmp(cpu, env-&gt;vsti=
mer,
            env-&gt;vstimecmp,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;htimedelta,
            MIP_VSTIP);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0static RISCVException read_stimecmp(CPURISCVSt=
ate
            *env, int csrno,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0target_ulong
            *val)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp;<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp;<b=
r>
            &gt; +=C2=A0 =C2=A0 } else {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;stimecmp;<br=
>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0static RISCVException read_stimecmph(CPURISCVS=
tate
            *env, int csrno,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0target_ulong
            *val)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;stimecmp &gt;&gt; 32;<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;vstimecmp &g=
t;&gt; 32;<br>
            &gt; +=C2=A0 =C2=A0 } else {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;stimecmp &gt=
;&gt; 32;<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -848,6 +931,10 @@ static RISCVException
            write_stimecmp(CPURISCVState *env, int csrno,<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(en=
v);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_vstimecmp(env, c=
srno, val);<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_mxl(env) =3D=3D MX=
L_RV32) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =
=3D
            deposit64(env-&gt;stimecmp, 0, 32, (uint64_t)val);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
            &gt; @@ -864,6 +951,10 @@ static RISCVException
            write_stimecmph(CPURISCVState *env, int csrno,<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D env_archcpu(en=
v);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return write_vstimecmph(env, =
csrno, val);<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =3D deposit64(e=
nv-&gt;stimecmp,
            32, 32, (uint64_t)val);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_timer_write_timecmp(cpu, e=
nv-&gt;stimer,
            env-&gt;stimecmp, 0, MIP_STIP);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -1801,6 +1892,7 @@ static RISCVException
            rmw_mip64(CPURISCVState *env, int csrno,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (csrno !=3D CSR_HVIP) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gin =3D get_field(=
env-&gt;hstatus,
            HSTATUS_VGEIN);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_mip |=3D (env-=
&gt;hgeip &amp;
            ((target_ulong)1 &lt;&lt; gin)) ? MIP_VSEIP : 0;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_mip |=3D env-&gt;vstime_i=
rq ? MIP_VSTIP : 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret_val) {<br>
            &gt; @@ -3661,6 +3753,12 @@ riscv_csr_operations
            csr_ops[CSR_TABLE_SIZE] =3D {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
            =C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_STIMECMPH] =3D { &quot;stim=
ecmph&quot;, sstc,
            read_stimecmph, write_stimecmph,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
            =C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
            &gt; +=C2=A0 =C2=A0 [CSR_VSTIMECMP] =3D { &quot;vstimecmp&quot;=
, sstc_hmode,
            read_vstimecmp,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
            write_vstimecmp,<br>
            <br>
            Please align with last line. The same to other similar
            lines.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Sure. I will fix that.</div>
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote">
            Regards,<br>
            <br>
            Weiwei Li<br>
            <br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
            .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
            &gt; +=C2=A0 =C2=A0 [CSR_VSTIMECMPH] =3D { &quot;vstimecmph&quo=
t;, sstc_hmode,
            read_vstimecmph,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
            write_vstimecmph,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
            .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Supervisor Protection and Tra=
nslation */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_SATP]=C2=A0 =C2=A0 =C2=A0=
=3D { &quot;satp&quot;,=C2=A0 =C2=A0 =C2=A0smode, read_satp,=C2=A0
            =C2=A0 =C2=A0write_satp=C2=A0 =C2=A0 =C2=A0},<br>
            &gt; diff --git a/target/riscv/machine.c
            b/target/riscv/machine.c<br>
            &gt; index 622fface484e..4ba55705d147 100644<br>
            &gt; --- a/target/riscv/machine.c<br>
            &gt; +++ b/target/riscv/machine.c<br>
            &gt; @@ -92,6 +92,7 @@ static const VMStateDescription
            vmstate_hyper =3D {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env=
.hgeie, RISCVCPU),<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env=
.hgeip, RISCVCPU),<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env=
.htimedelta, RISCVCPU),<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.vstimecmp,=
 RISCVCPU),<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env=
.hvictl, RISCVCPU),<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT8_ARRA=
Y(env.hviprio, RISCVCPU,
            64),<br>
            &gt; diff --git a/target/riscv/time_helper.c
            b/target/riscv/time_helper.c<br>
            &gt; index f3fb5eac7b7b..8cce667dfd47 100644<br>
            &gt; --- a/target/riscv/time_helper.c<br>
            &gt; +++ b/target/riscv/time_helper.c<br>
            &gt; @@ -22,6 +22,14 @@<br>
            &gt;=C2=A0 =C2=A0#include &quot;time_helper.h&quot;<br>
            &gt;=C2=A0 =C2=A0#include &quot;hw/intc/riscv_aclint.h&quot;<br=
>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +static void riscv_vstimer_cb(void *opaque)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
            &gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br=
>
            &gt; +=C2=A0 =C2=A0 env-&gt;vstime_irq =3D 1;<br>
            &gt; +=C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_VSTIP,
            BOOL_TO_MASK(1));<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0static void riscv_stimer_cb(void *opaque)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D opaque;<br>
            &gt; @@ -47,10 +55,16 @@ void
            riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If we&#39;re se=
tting an stimecmp value in the
            &quot;past&quot;,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediately rai=
se the timer interrupt<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (timer_irq =3D=3D MIP_VSTI=
P) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstime_=
irq =3D 1;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_update_m=
ip(cpu, timer_irq,
            BOOL_TO_MASK(1));<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 if (timer_irq =3D=3D MIP_VSTIP) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;vstime_irq =3D 0;<br>
            &gt; +=C2=A0 =C2=A0 }<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear the [V]STIP bit in mip =
*/<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_update_mip(cpu, timer_=
irq,
            BOOL_TO_MASK(0));<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)<br=
>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimer =3D timer_new_ns(=
QEMU_CLOCK_VIRTUAL,
            &amp;riscv_stimer_cb, cpu);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;stimecmp =3D 0;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 env-&gt;vstimer =3D timer_new_ns(QEMU_CLOCK=
_VIRTUAL,
            &amp;riscv_vstimer_cb, cpu);<br>
            &gt; +=C2=A0 =C2=A0 env-&gt;vstimecmp =3D 0;<br>
            &gt;=C2=A0 =C2=A0}<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>
</div>

--000000000000d4a57105e5d404b2--

