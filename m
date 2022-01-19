Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1tQ-0005qx-Og
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1tO-0005oY-OY; Tue, 18 Jan 2022 22:44:14 -0500
Received: from [2607:f8b0:4864:20::d33] (port=34596
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1tA-0000qT-N9; Tue, 18 Jan 2022 22:44:06 -0500
Received: by mail-io1-xd33.google.com with SMTP id z19so1272046ioj.1;
 Tue, 18 Jan 2022 19:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tufq28I+FxWJIVjNzjtronGHNRwF4rDmoPgRc0ojP3c=;
 b=auRPJU5Vn1tPRI3J/Buoc+kEd8xj1MWMQOEUpC6v85Cr8hwLJP5wvF7kzCSkO5Damk
 +SNeeryj8Du4wJoXwzT7fiPXs0sYjf6q00tThmtqn9O01800QRVsrV5jK/5n6YF71+jQ
 IIykhv2zxxl1Q5k2rh06o2ev2k/NBI7OABWX+OHapLskfahS7JgymsmUrvtmvIrLiQ9X
 VEgOErL4mrJlf2p0ipn+Pg7mbg7mXMfYnXu1ks6u1bhhLPh5VM5HfVBTj1uCgW3bQPSy
 gEQf/SW5H4G04iopAbenIG9LhmOfvzClyaCOEDRwchlyLM0Sz6oxJ0KQWDBlCit9/xdb
 Dp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tufq28I+FxWJIVjNzjtronGHNRwF4rDmoPgRc0ojP3c=;
 b=lxrQfTKrUcCmi+fW98oNoJPq0HmDfwno43OAJvm2jJDgDUG8fCChqHGwLhUDomTWba
 gVT85dgIx3XrZ2fQUomOT76zHuj/nb9ZvWSdZEhhUT2cQmkMfcrSVof2hUB2rKxt2IRl
 peuVqft6loee9Wg42DfH2U0BeQN06qg+VWgyeO3saK8OvEHtlgZO7cwPly2LjiaB0go0
 TItCFTql50sYoEbbc0rrJr+0jwW1jhoFAo99EatQAkZObsKqUlA9RFIlMsjrbr9cDUI1
 cI3gmw0ws5K71bcW4kv/P0VhzVZB5qkQfsftcQnXyrRQ0ghhecwlz5QuqZ0skIcALGgy
 4N8w==
X-Gm-Message-State: AOAM530myxPKi35eMKM5OE0pf4q/wejp2I+dDQOdWg9BJ5N6LWZygjyd
 NteZa7iRvM5Pr5mvLiD/L6IovNqkZnsIqWog1ps=
X-Google-Smtp-Source: ABdhPJzIsLbblf+PQIEThiWgRnmqPDb7rWJ4SH+4nW7IHuSQkB0VXtjDddH+HCl64kEPZ2bv9N3ugfwaoOTk4PzWl5w=
X-Received: by 2002:a02:5d84:: with SMTP id
 w126mr12301253jaa.169.1642563838475; 
 Tue, 18 Jan 2022 19:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-6-zhiwei_liu@c-sky.com>
 <CAKmqyKPcst5Xg5T5_Py0KyCBf8zYmc7FdWWJDZz0dsjcWThE8A@mail.gmail.com>
 <75fd9a6e-bd9e-37ab-9040-43a43b34d901@c-sky.com>
In-Reply-To: <75fd9a6e-bd9e-37ab-9040-43a43b34d901@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:43:32 +1000
Message-ID: <CAKmqyKN0592hYmp1-zsdUZ_SsUve3EGGSJpMAYQpWFgJrhGD7g@mail.gmail.com>
Subject: Re: [PATCH v6 05/22] target/riscv: Create xl field in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 03:44:15 -0000

On Wed, Jan 19, 2022 at 1:36 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2022/1/19 =E4=B8=8A=E5=8D=8811:24, Alistair Francis wrote:
> > On Thu, Jan 13, 2022 at 9:50 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> > I'm not clear on why this is better?
>
> Current xlen has been used in helper functions and many other places.
> The computation of current xlen  is not so trivial, so that we should
> recompute it as little as possible.
> Fortunately, xlen only changes in very seldom cases, such as exception,
> misa write,  mstatus write, cpu reset, migration load.
> So that we can only recompute XLEN in this places and cache it into
> CPURISCVState.

Sounds good! Do you mind adding that to the commit message

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Thanks
> Zhiwei
>
> >
> > Alistair
> >
> >> ---
> >>   target/riscv/cpu.c        |  1 +
> >>   target/riscv/cpu.h        | 31 +++++++++++++++++++++++++++++++
> >>   target/riscv/cpu_helper.c | 34 ++--------------------------------
> >>   target/riscv/csr.c        |  2 ++
> >>   target/riscv/machine.c    | 10 ++++++++++
> >>   5 files changed, 46 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 9bc25d3055..54c1cf8ec5 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -399,6 +399,7 @@ static void riscv_cpu_reset(DeviceState *dev)
> >>       /* mmte is supposed to have pm.current hardwired to 1 */
> >>       env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> >>   #endif
> >> +    env->xl =3D riscv_cpu_mxl(env);
> >>       cs->exception_index =3D RISCV_EXCP_NONE;
> >>       env->load_res =3D -1;
> >>       set_default_nan_mode(1, &env->fp_status);
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 4d63086765..65fd849bef 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -145,6 +145,7 @@ struct CPURISCVState {
> >>       uint32_t misa_mxl_max;  /* max mxl for this cpu */
> >>       uint32_t misa_ext;      /* current extensions */
> >>       uint32_t misa_ext_mask; /* max ext for this cpu */
> >> +    uint32_t xl;            /* current xlen */
> >>
> >>       /* 128-bit helpers upper part return value */
> >>       target_ulong retxh;
> >> @@ -443,6 +444,36 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVStat=
e *env)
> >>   }
> >>   #endif
> >>
> >> +#if defined(TARGET_RISCV32)
> >> +#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
> >> +#else
> >> +static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
> >> +{
> >> +    RISCVMXL xl =3D env->misa_mxl;
> >> +#if !defined(CONFIG_USER_ONLY)
> >> +    /*
> >> +     * When emulating a 32-bit-only cpu, use RV32.
> >> +     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> >> +     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widene=
d
> >> +     * back to RV64 for lower privs.
> >> +     */
> >> +    if (xl !=3D MXL_RV32) {
> >> +        switch (env->priv) {
> >> +        case PRV_M:
> >> +            break;
> >> +        case PRV_U:
> >> +            xl =3D get_field(env->mstatus, MSTATUS64_UXL);
> >> +            break;
> >> +        default: /* PRV_S | PRV_H */
> >> +            xl =3D get_field(env->mstatus, MSTATUS64_SXL);
> >> +            break;
> >> +        }
> >> +    }
> >> +#endif
> >> +    return xl;
> >> +}
> >> +#endif
> >> +
> >>   /*
> >>    * Encode LMUL to lmul as follows:
> >>    *     LMUL    vlmul    lmul
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index 434a83e66a..32ea066ef0 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -35,37 +35,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool if=
etch)
> >>   #endif
> >>   }
> >>
> >> -static RISCVMXL cpu_get_xl(CPURISCVState *env)
> >> -{
> >> -#if defined(TARGET_RISCV32)
> >> -    return MXL_RV32;
> >> -#elif defined(CONFIG_USER_ONLY)
> >> -    return MXL_RV64;
> >> -#else
> >> -    RISCVMXL xl =3D riscv_cpu_mxl(env);
> >> -
> >> -    /*
> >> -     * When emulating a 32-bit-only cpu, use RV32.
> >> -     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> >> -     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widene=
d
> >> -     * back to RV64 for lower privs.
> >> -     */
> >> -    if (xl !=3D MXL_RV32) {
> >> -        switch (env->priv) {
> >> -        case PRV_M:
> >> -            break;
> >> -        case PRV_U:
> >> -            xl =3D get_field(env->mstatus, MSTATUS64_UXL);
> >> -            break;
> >> -        default: /* PRV_S | PRV_H */
> >> -            xl =3D get_field(env->mstatus, MSTATUS64_SXL);
> >> -            break;
> >> -        }
> >> -    }
> >> -    return xl;
> >> -#endif
> >> -}
> >> -
> >>   void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> >>                             target_ulong *cs_base, uint32_t *pflags)
> >>   {
> >> @@ -145,7 +114,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, targ=
et_ulong *pc,
> >>       }
> >>   #endif
> >>
> >> -    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
> >> +    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> >>
> >>       *pflags =3D flags;
> >>   }
> >> @@ -361,6 +330,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target=
_ulong newpriv)
> >>       }
> >>       /* tlb_flush is unnecessary as mode is contained in mmu_idx */
> >>       env->priv =3D newpriv;
> >> +    env->xl =3D cpu_recompute_xl(env);
> >>
> >>       /*
> >>        * Clear the load reservation - otherwise a reservation placed i=
n one
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index e7578f3e0f..b282a642f5 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -585,6 +585,7 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
> >>           mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
> >>       }
> >>       env->mstatus =3D mstatus;
> >> +    env->xl =3D cpu_recompute_xl(env);
> >>
> >>       return RISCV_EXCP_NONE;
> >>   }
> >> @@ -700,6 +701,7 @@ static RISCVException write_misa(CPURISCVState *en=
v, int csrno,
> >>       /* flush translation cache */
> >>       tb_flush(env_cpu(env));
> >>       env->misa_ext =3D val;
> >> +    env->xl =3D riscv_cpu_mxl(env);
> >>       return RISCV_EXCP_NONE;
> >>   }
> >>
> >> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> >> index 13b9ab375b..e1d1029e88 100644
> >> --- a/target/riscv/machine.c
> >> +++ b/target/riscv/machine.c
> >> @@ -185,10 +185,20 @@ static const VMStateDescription vmstate_rv128 =
=3D {
> >>       }
> >>   };
> >>
> >> +static int riscv_cpu_post_load(void *opaque, int version_id)
> >> +{
> >> +    RISCVCPU *cpu =3D opaque;
> >> +    CPURISCVState *env =3D &cpu->env;
> >> +
> >> +    env->xl =3D cpu_recompute_xl(env);
> >> +    return 0;
> >> +}
> >> +
> >>   const VMStateDescription vmstate_riscv_cpu =3D {
> >>       .name =3D "cpu",
> >>       .version_id =3D 3,
> >>       .minimum_version_id =3D 3,
> >> +    .post_load =3D riscv_cpu_post_load,
> >>       .fields =3D (VMStateField[]) {
> >>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> >>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> >> --
> >> 2.25.1
> >>
> >>

