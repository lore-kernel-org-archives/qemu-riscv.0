Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmyMK-0004aE-M2
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 10:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmyMI-0004Zk-VF
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 10:55:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmyMA-0002Dg-56
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 10:55:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j15so736340wrb.11
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1681397723; x=1683989723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3/YSe5LAaaC8s545te7QK+tfp174mNK8CTfLTbUJlA=;
 b=BWT7eEQj99V5ibk8JiFnMXPkczN8ANlbzpBbSImWALfFsBg56UMtoo08fuLk3UMdas
 sKCfCkze2ymUtm+0EGrWdeXN45jAq6pZtds4J4t3VMio09b/D9KjMopF7qP+bNgxMuZO
 SlInvdiQMmCFtO/oArNYEpltNVhv0cFzuWG/oyaq/5DNIWS3c/TzhetWJNMzmmLfZyn9
 +bDXFwgipALQD6EM/Hp+PAOWf+4yVnnvWpBJXKpwSvqF6XJMoHsUD9k0sJMrObRbjbhF
 CynsjR5OXvX8kFsrp/k+qOra+UyIwTv1cdngD+jxdvS7wsbEeVnaZ55BiP69Uzx/OEkr
 KZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681397723; x=1683989723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3/YSe5LAaaC8s545te7QK+tfp174mNK8CTfLTbUJlA=;
 b=OB/bTYVOTKxFb5D10E/yTsuf5qszRF984dxgGETgxGFqWd8TyALsTkTTxaSVvvARqT
 gEDqZuaoVwr6MnwwLhrQkn6/yEHliLUPpru3q9ou7hDFsQQdlk+wCJ7cD0tvCtPHbYx/
 qKVnYZl9CaS5R5FS/W22vjH5o7MLcNpJEJHKh0F8xNvriPg+HlM+GI9lmb6TRhOn/xQZ
 oPvu9dn+N7QPv+8nu5Vc7M5LE1DOdJCiN7N4LzR796NBKzDNuyafcH8Y8A73G85evRpT
 HLNVZFx6LrUj/JMQuZECIGt5wZG6ErchvukP/CQ5LtUhg0t3HTPVgqYrs0olpSz+zQRJ
 1AcA==
X-Gm-Message-State: AAQBX9eStY1xsf4k6+IlHaVEyu5MJr40g7uFRAoYNRvnach7ldws5ptP
 RN6WrjExEstfTi+PA9RdR00+J850o5SMejBEaZtVOQ==
X-Google-Smtp-Source: AKy350bfAftid4ma7n80N5pdvbK/0COZaAQTC9B2FyaaPzlhe8rz3nh7KiRE+M6ZBEm31Eckv356C5cffb2I0adM/O0=
X-Received: by 2002:adf:d847:0:b0:2e8:4519:ee98 with SMTP id
 k7-20020adfd847000000b002e84519ee98mr467164wrl.13.1681397722894; Thu, 13 Apr
 2023 07:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230331182824.4104580-1-christoph.muellner@vrull.eu>
 <e9b22137-962b-b52b-fb66-e7d447466444@linux.alibaba.com>
In-Reply-To: <e9b22137-962b-b52b-fb66-e7d447466444@linux.alibaba.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 13 Apr 2023 16:55:10 +0200
Message-ID: <CAEg0e7j3aec8_-j5R44n5fn0QAADFYBq-=11-gEHvieySZ=X4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] riscv: Add support for the Zfa extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jeff Law <jeffreyalaw@gmail.com>, 
 Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei@iscas.ac.cn, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Apr 2023 14:55:35 -0000

".

On Mon, Apr 10, 2023 at 3:23=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
>
> On 2023/4/1 2:28, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > This patch introduces the RISC-V Zfa extension, which introduces
> > additional floating-point extensions:
> > * fli (load-immediate) with pre-defined immediates
> > * fminm/fmaxm (like fmin/fmax but with different NaN behaviour)
> > * fround/froundmx (round to integer)
> > * fcvtmod.w.d (Modular Convert-to-Integer)
> > * fmv* to access high bits of float register bigger than XLEN
> > * Quiet comparison instructions (fleq/fltq)
> >
> > Zfa defines its instructions in combination with the following extensio=
ns:
> > * single-precision floating-point (F)
> > * double-precision floating-point (D)
> > * quad-precision floating-point (Q)
> > * half-precision floating-point (Zfh)
> >
> > Since QEMU does not support the RISC-V quad-precision floating-point
> > ISA extension (Q), this patch does not include the instructions that
> > depend on this extension. All other instructions are included in this
> > patch.
> >
> > The Zfa specification is not frozen at the moment (which is why this
> > patch is RFC) and can be found here:
> >    https://github.com/riscv/riscv-isa-manual/blob/master/src/zfa.tex
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> > Changes in v2:
> > * Remove calls to mark_fs_dirty() in comparison trans functions
> > * Rewrite fround(nx) using float*_round_to_int()
> > * Move fli* to translation unit and fix NaN-boxing of NaN values
> > * Reimplement FCVTMOD.W.D
> > * Add use of second register in trans_fmvp_d_x()
> >
> >   target/riscv/cpu.c                        |   8 +
> >   target/riscv/cpu.h                        |   1 +
> >   target/riscv/fpu_helper.c                 | 258 +++++++++++
> >   target/riscv/helper.h                     |  19 +
> >   target/riscv/insn32.decode                |  67 +++
> >   target/riscv/insn_trans/trans_rvzfa.c.inc | 529 +++++++++++++++++++++=
+
> >   target/riscv/translate.c                  |   1 +
> >   7 files changed, 883 insertions(+)
> >   create mode 100644 target/riscv/insn_trans/trans_rvzfa.c.inc
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1e97473af2..bac9ced4a2 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -83,6 +83,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
> >       ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifenc=
ei),
> >       ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zi=
hintpause),
> >       ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
> > +    ISA_EXT_DATA_ENTRY(zfa, true, PRIV_VERSION_1_12_0, ext_zfa),
> >       ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
> >       ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin)=
,
> >       ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
> > @@ -404,6 +405,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
> >       cpu->cfg.ext_u =3D true;
> >       cpu->cfg.ext_s =3D true;
> >       cpu->cfg.ext_icsr =3D true;
> > +    cpu->cfg.ext_zfa =3D true;
> >       cpu->cfg.ext_zfh =3D true;
> >       cpu->cfg.mmu =3D true;
> >       cpu->cfg.ext_xtheadba =3D true;
> > @@ -865,6 +867,11 @@ static void riscv_cpu_validate_set_extensions(RISC=
VCPU *cpu, Error **errp)
> >           return;
> >       }
> >
> > +    if (cpu->cfg.ext_zfa && !cpu->cfg.ext_f) {
> > +        error_setg(errp, "Zfa extension requires F extension");
> > +        return;
> > +    }
> > +
> >       if (cpu->cfg.ext_zfh) {
> >           cpu->cfg.ext_zfhmin =3D true;
> >       }
> > @@ -1381,6 +1388,7 @@ static Property riscv_cpu_extensions[] =3D {
> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >       DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, tr=
ue),
> >       DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
> > +    DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, false),
> >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 638e47c75a..deae410fc2 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -462,6 +462,7 @@ struct RISCVCPUConfig {
> >       bool ext_svpbmt;
> >       bool ext_zdinx;
> >       bool ext_zawrs;
> > +    bool ext_zfa;
> >       bool ext_zfh;
> >       bool ext_zfhmin;
> >       bool ext_zfinx;
> > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> > index 449d236df6..c0ebaa040f 100644
> > --- a/target/riscv/fpu_helper.c
> > +++ b/target/riscv/fpu_helper.c
> > @@ -252,6 +252,21 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_=
t rs1, uint64_t rs2)
> >                       float32_minimum_number(frs1, frs2, &env->fp_statu=
s));
> >   }
> >
> > +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    float32 frs2 =3D check_nanbox_s(env, rs2);
> > +    float32 ret;
> > +
> > +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> > +        ret =3D float32_default_nan(&env->fp_status);
> > +    } else {
> > +        ret =3D float32_minimum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +
> > +    return nanbox_s(env, ret);
> > +}
> > +
> >   uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> >   {
> >       float32 frs1 =3D check_nanbox_s(env, rs1);
> > @@ -261,6 +276,21 @@ uint64_t helper_fmax_s(CPURISCVState *env, uint64_=
t rs1, uint64_t rs2)
> >                       float32_maximum_number(frs1, frs2, &env->fp_statu=
s));
> >   }
> >
> > +uint64_t helper_fmaxm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    float32 frs2 =3D check_nanbox_s(env, rs2);
> > +    float32 ret;
> > +
> > +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> > +        ret =3D float32_default_nan(&env->fp_status);
> > +    } else {
> > +        ret =3D float32_maximum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +
> > +    return nanbox_s(env, ret);
> > +}
> > +
> >   uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> >   {
> >       float32 frs1 =3D check_nanbox_s(env, rs1);
> > @@ -274,6 +304,13 @@ target_ulong helper_fle_s(CPURISCVState *env, uint=
64_t rs1, uint64_t rs2)
> >       return float32_le(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fleq_s(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    float32 frs2 =3D check_nanbox_s(env, rs2);
> > +    return float32_le_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> >   {
> >       float32 frs1 =3D check_nanbox_s(env, rs1);
> > @@ -281,6 +318,13 @@ target_ulong helper_flt_s(CPURISCVState *env, uint=
64_t rs1, uint64_t rs2)
> >       return float32_lt(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fltq_s(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    float32 frs2 =3D check_nanbox_s(env, rs2);
> > +    return float32_lt_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> >   {
> >       float32 frs1 =3D check_nanbox_s(env, rs1);
> > @@ -338,6 +382,30 @@ target_ulong helper_fclass_s(CPURISCVState *env, u=
int64_t rs1)
> >       return fclass_s(frs1);
> >   }
> >
> > +uint64_t helper_fround_s(CPURISCVState *env, uint64_t rs1)
> > +{
> > +    float_status *fs =3D &env->fp_status;
> > +    uint16_t nx_old =3D get_float_exception_flags(fs) & float_flag_ine=
xact;
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +
> > +    frs1 =3D float32_round_to_int(frs1, fs);
> > +
> > +    /* Restore the original NX flag. */
> > +    uint16_t flags =3D get_float_exception_flags(fs);
> > +    flags &=3D ~float_flag_inexact;
> > +    flags |=3D nx_old;
> > +    set_float_exception_flags(flags, fs);
> > +
> > +    return nanbox_s(env, frs1);
> > +}
> > +
> > +uint64_t helper_froundnx_s(CPURISCVState *env, uint64_t rs1)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    frs1 =3D float32_round_to_int(frs1, &env->fp_status);
> > +    return nanbox_s(env, frs1);
> > +}
> > +
> >   uint64_t helper_fadd_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)
> >   {
> >       return float64_add(frs1, frs2, &env->fp_status);
> > @@ -365,6 +433,15 @@ uint64_t helper_fmin_d(CPURISCVState *env, uint64_=
t frs1, uint64_t frs2)
> >               float64_minimum_number(frs1, frs2, &env->fp_status);
> >   }
> >
> > +uint64_t helper_fminm_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)
> > +{
> > +    if (float64_is_any_nan(frs1) || float64_is_any_nan(frs2)) {
> > +        return float64_default_nan(&env->fp_status);
> > +    } else {
> > +        return float64_minimum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +}
> > +
> >   uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)
> >   {
> >       return env->priv_ver < PRIV_VERSION_1_11_0 ?
> > @@ -372,6 +449,15 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_=
t frs1, uint64_t frs2)
> >               float64_maximum_number(frs1, frs2, &env->fp_status);
> >   }
> >
> > +uint64_t helper_fmaxm_d(CPURISCVState *env, uint64_t frs1, uint64_t fr=
s2)
> > +{
> > +    if (float64_is_any_nan(frs1) || float64_is_any_nan(frs2)) {
> > +        return float64_default_nan(&env->fp_status);
> > +    } else {
> > +        return float64_maximum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +}
> > +
> >   uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> >   {
> >       return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
> > @@ -393,11 +479,21 @@ target_ulong helper_fle_d(CPURISCVState *env, uin=
t64_t frs1, uint64_t frs2)
> >       return float64_le(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fleq_d(CPURISCVState *env, uint64_t frs1, uint64_t=
 frs2)
> > +{
> > +    return float64_le_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_flt_d(CPURISCVState *env, uint64_t frs1, uint64_t=
 frs2)
> >   {
> >       return float64_lt(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fltq_d(CPURISCVState *env, uint64_t frs1, uint64_t=
 frs2)
> > +{
> > +    return float64_lt_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_feq_d(CPURISCVState *env, uint64_t frs1, uint64_t=
 frs2)
> >   {
> >       return float64_eq_quiet(frs1, frs2, &env->fp_status);
> > @@ -408,6 +504,79 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, u=
int64_t frs1)
> >       return float64_to_int32(frs1, &env->fp_status);
> >   }
> >
> > +/*
> > + * Implement float64 to int32_t conversion without saturation;
> > + * the result is supplied modulo 2^32.
> > + * Rounding mode is RTZ.
> > + * Flag behaviour identical to fcvt.w.d (see F specification).
> > + *
> > + * Similar conversion of this function can be found in
> > + * target/arm/vfp_helper.c (fjcvtzs): f64->i32 with other fflag behavi=
our, and
> > + * target/alpha/fpu_helper.c (do_cvttq): f64->i64 with support for sev=
eral
> > + * rounding modes and different fflag behaviour.
> > + */
> > +uint64_t helper_fcvtmod_w_d(CPURISCVState *env, uint64_t value)
> > +{
> > +    float_status *status =3D &env->fp_status;
> > +    uint32_t sign =3D extract64(value, 63, 1);
> > +    uint32_t exp =3D extract64(value, 52, 11);
> > +    uint64_t frac =3D extract64(value, 0, 52);
> > +
> > +    /* Handle the special cases first. */
> > +    if (exp =3D=3D 0) {
> > +        if (unlikely(frac !=3D 0)) {
> > +            /* Subnormal numbers. */
> > +            float_raise(float_flag_inexact, status);
> > +            return 0;
> > +        } else {
> > +            /* +0 or -0 */
> > +            return 0;
> > +     }
> > +    } else if (exp =3D=3D 0x7ff) {
> > +        /* NaN (frac !=3D 0) or INF (frac =3D=3D 0). */
> > +        float_raise(float_flag_invalid, status);
> > +     return 0;
> > +    }
> > +
> > +    /* Normal value. */
> > +    int true_exp =3D exp - 1023;
> > +    int shift =3D true_exp - 52;
> > +    uint64_t true_frac =3D frac | 1ull << 52;
> > +    uint64_t ret;
> > +
> > +    /* Shift the fraction into place and set NX flag. */
> > +    if (shift >=3D 64 || shift <=3D -64) {
>
> shift <=3D -53.

Shifting by more than sizeof(type)*8 is undefined in C.
Therefore we have this special-case handling that tests for exactly that.

> IMO, if  true_exp > 31, we should set invalid status. And if we have set
> the invalid status, we should not set the inexact status.

The spec says:
Floating-point exception flags are raised the same as they would be for
FCVT.W.D with the same input operand.

There are two mechanisms in place:
* we shift bits parts of true_frac -> NX (includes the special case
where we shift out all bits)
* we don't shift any bits out:
  - we truncate bits in the conversion -> NV
  - we don't truncate bits in the conversion -> all fine

The NV part is done in the part below the "Truncate to 32-bits" comment.

Also note, that I wrote a test bench to validate that the set flags match
exactly those from fcvt.w.d (tested with QEMU).
So I am confident that the implementation matches the RISC-V specification.

The test cases of this part are:

        { .name =3D "+max int32 (2147483647)",
          .inp_lu =3D 0x41dfffffffc00000,
          .exp_fcvt =3D 0x000000007fffffff,
          .exp_fcvt_fflags =3D 0,
          .exp_fcvtmod =3D 0x000000007fffffff,
          .exp_fcvtmod_fflags =3D 0 },
        { .name =3D "+max int32 +1 (2147483648)",
          .inp_lf =3D 0x1p31,
          .exp_fcvt =3D 0x000000007fffffff,
          .exp_fcvt_fflags =3D FFLAG_NV,
          .exp_fcvtmod =3D (uint64_t)-2147483648l, /* int32 min */
          .exp_fcvtmod_fflags =3D FFLAG_NV },
        { .name =3D "+max int32 +2 (2147483649)",
          .inp_lu =3D 0x41e0000000200000,
          .exp_fcvt =3D 0x000000007fffffff,
          .exp_fcvt_fflags =3D FFLAG_NV,
          .exp_fcvtmod =3D (uint64_t)-2147483647l, /* int32 min +1 */
          .exp_fcvtmod_fflags =3D FFLAG_NV },



>
> > +            /* The fraction is shifted out entirely. */
> > +            ret =3D 0;
> > +            float_raise(float_flag_inexact, status);
> So this setting is not right.
> > +    } else if (shift >=3D 0) {
> > +        ret =3D true_frac << shift;
> > +        /* Raise NX if bit 52 got shifted out. */
> > +        if (shift >=3D 12)
> > +            float_raise(float_flag_inexact, status);
> And here.
> > +    } else { /* shift < 0 */
> > +        ret =3D true_frac >> -shift;
> > +        /* Raise NX if bits got shifted out. */
> > +        if ((ret << -shift) !=3D true_frac)
> > +            float_raise(float_flag_inexact, status);
>
> And here.
>
> Zhiwei
>
> > +    }
> > +
> > +    /* Honor the sign bit. */
> > +    if (sign) {
> > +        ret =3D -ret;
> > +    }
> > +
> > +    /* Truncate to 32-bits. */
> > +    int32_t ret32 =3D (int32_t)ret;
> > +
> > +    /* If the truncation drops bits then raise NV. */
> > +    if ((uint64_t)ret32 !=3D ret)
> > +        float_raise(float_flag_invalid, status);
> > +
> > +    /* Sign-extend to int64 and return. */
> > +    return ret32;
> > +}
> > +
> >   target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
> >   {
> >       return (int32_t)float64_to_uint32(frs1, &env->fp_status);
> > @@ -448,6 +617,27 @@ target_ulong helper_fclass_d(uint64_t frs1)
> >       return fclass_d(frs1);
> >   }
> >
> > +uint64_t helper_fround_d(CPURISCVState *env, uint64_t frs1)
> > +{
> > +    float_status *fs =3D &env->fp_status;
> > +    uint16_t nx_old =3D get_float_exception_flags(fs) & float_flag_ine=
xact;
> > +
> > +    frs1 =3D float64_round_to_int(frs1, fs);
> > +
> > +    /* Restore the original NX flag. */
> > +    uint16_t flags =3D get_float_exception_flags(fs);
> > +    flags &=3D ~float_flag_inexact;
> > +    flags |=3D nx_old;
> > +    set_float_exception_flags(flags, fs);
> > +
> > +    return frs1;
> > +}
> > +
> > +uint64_t helper_froundnx_d(CPURISCVState *env, uint64_t frs1)
> > +{
> > +    return float64_round_to_int(frs1, &env->fp_status);
> > +}
> > +
> >   uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > @@ -485,6 +675,21 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_=
t rs1, uint64_t rs2)
> >                       float16_minimum_number(frs1, frs2, &env->fp_statu=
s));
> >   }
> >
> > +uint64_t helper_fminm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> > +{
> > +    float16 frs1 =3D check_nanbox_h(env, rs1);
> > +    float16 frs2 =3D check_nanbox_h(env, rs2);
> > +    float16 ret;
> > +
> > +    if (float16_is_any_nan(frs1) || float16_is_any_nan(frs2)) {
> > +        ret =3D float16_default_nan(&env->fp_status);
> > +    } else {
> > +        ret =3D float16_minimum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +
> > +    return nanbox_h(env, ret);
> > +}
> > +
> >   uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > @@ -494,6 +699,21 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_=
t rs1, uint64_t rs2)
> >                       float16_maximum_number(frs1, frs2, &env->fp_statu=
s));
> >   }
> >
> > +uint64_t helper_fmaxm_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> > +{
> > +    float16 frs1 =3D check_nanbox_h(env, rs1);
> > +    float16 frs2 =3D check_nanbox_h(env, rs2);
> > +    float16 ret;
> > +
> > +    if (float16_is_any_nan(frs1) || float16_is_any_nan(frs2)) {
> > +        ret =3D float16_default_nan(&env->fp_status);
> > +    } else {
> > +        ret =3D float16_maximum_number(frs1, frs2, &env->fp_status);
> > +    }
> > +
> > +    return nanbox_h(env, ret);
> > +}
> > +
> >   uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > @@ -507,6 +727,13 @@ target_ulong helper_fle_h(CPURISCVState *env, uint=
64_t rs1, uint64_t rs2)
> >       return float16_le(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fleq_h(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> > +{
> > +    float16 frs1 =3D check_nanbox_h(env, rs1);
> > +    float16 frs2 =3D check_nanbox_h(env, rs2);
> > +    return float16_le_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > @@ -514,6 +741,13 @@ target_ulong helper_flt_h(CPURISCVState *env, uint=
64_t rs1, uint64_t rs2)
> >       return float16_lt(frs1, frs2, &env->fp_status);
> >   }
> >
> > +target_ulong helper_fltq_h(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> > +{
> > +    float16 frs1 =3D check_nanbox_h(env, rs1);
> > +    float16 frs2 =3D check_nanbox_h(env, rs2);
> > +    return float16_lt_quiet(frs1, frs2, &env->fp_status);
> > +}
> > +
> >   target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t =
rs2)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > @@ -527,6 +761,30 @@ target_ulong helper_fclass_h(CPURISCVState *env, u=
int64_t rs1)
> >       return fclass_h(frs1);
> >   }
> >
> > +uint64_t helper_fround_h(CPURISCVState *env, uint64_t rs1)
> > +{
> > +    float_status *fs =3D &env->fp_status;
> > +    uint16_t nx_old =3D get_float_exception_flags(fs) & float_flag_ine=
xact;
> > +    float16 frs1 =3D check_nanbox_h(env, rs1);
> > +
> > +    frs1 =3D float16_round_to_int(frs1, fs);
> > +
> > +    /* Restore the original NX flag. */
> > +    uint16_t flags =3D get_float_exception_flags(fs);
> > +    flags &=3D ~float_flag_inexact;
> > +    flags |=3D nx_old;
> > +    set_float_exception_flags(flags, fs);
> > +
> > +    return nanbox_h(env, frs1);
> > +}
> > +
> > +uint64_t helper_froundnx_h(CPURISCVState *env, uint64_t rs1)
> > +{
> > +    float16 frs1 =3D check_nanbox_s(env, rs1);
> > +    frs1 =3D float16_round_to_int(frs1, &env->fp_status);
> > +    return nanbox_h(env, frs1);
> > +}
> > +
> >   target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
> >   {
> >       float16 frs1 =3D check_nanbox_h(env, rs1);
> > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > index 37b54e0991..4acb7cf124 100644
> > --- a/target/riscv/helper.h
> > +++ b/target/riscv/helper.h
> > @@ -25,10 +25,14 @@ DEF_HELPER_FLAGS_3(fsub_s, TCG_CALL_NO_RWG, i64, en=
v, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmul_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fdiv_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmin_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fminm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmax_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fmaxm_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fsqrt_s, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_3(fle_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fleq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fltq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
> > @@ -39,6 +43,8 @@ DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, e=
nv, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
> > +DEF_HELPER_FLAGS_2(fround_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
> > +DEF_HELPER_FLAGS_2(froundnx_s, TCG_CALL_NO_RWG_SE, i64, env, i64)
> >
> >   /* Floating Point - Double Precision */
> >   DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > @@ -46,14 +52,19 @@ DEF_HELPER_FLAGS_3(fsub_d, TCG_CALL_NO_RWG, i64, en=
v, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmul_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fdiv_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmin_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fminm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmax_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fmaxm_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_s_d, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_d_s, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_2(fsqrt_d, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_3(fle_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fleq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fltq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
> > +DEF_HELPER_FLAGS_2(fcvtmod_w_d, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
> > @@ -62,6 +73,8 @@ DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, e=
nv, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
> > +DEF_HELPER_FLAGS_2(fround_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
> > +DEF_HELPER_FLAGS_2(froundnx_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
> >
> >   /* Bitmanip */
> >   DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> > @@ -78,10 +91,14 @@ DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, en=
v, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fminm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fmaxm_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fleq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> > +DEF_HELPER_FLAGS_3(fltq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
> >   DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
> > @@ -96,6 +113,8 @@ DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, =
env, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
> > +DEF_HELPER_FLAGS_2(fround_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
> > +DEF_HELPER_FLAGS_2(froundnx_h, TCG_CALL_NO_RWG_SE, i64, env, i64)
> >
> >   /* Cache-block operations */
> >   DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 73d5d1b045..0c216db3c2 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -821,6 +821,73 @@ binvi      01101. ........... 001 ..... 0010011 @s=
h
> >   bset       0010100 .......... 001 ..... 0110011 @r
> >   bseti      00101. ........... 001 ..... 0010011 @sh
> >
> > +# *** Zfa Standard Extension ***
> > +# fli.s ft1,0 =3D f01000d3
> > +fli_s       1111000 00001 ..... 000 ..... 1010011 @r2
> > +# fli.d ft1,0 =3D f21000d3
> > +fli_d       1111001 00001 ..... 000 ..... 1010011 @r2
> > +# fli.h ft1,0 =3D f41000d3
> > +fli_h       1111010 00001 ..... 000 ..... 1010011 @r2
> > +
> > +# Inspiration fmin_s, fmin_d, fmax_s, fmax_d
> > +# fminm.s ft1, ft2, ft3 =3D 283120d3
> > +fminm_s     0010100 ..... ..... 010 ..... 1010011 @r
> > +# fmaxm.s ft1, ft2, ft3 =3D 283130d3
> > +fmaxm_s     0010100 ..... ..... 011 ..... 1010011 @r
> > +# fminm.d ft1, ft2, ft3 =3D 2a3120d3
> > +fminm_d     0010101 ..... ..... 010 ..... 1010011 @r
> > +# fmaxm.d ft1, ft2, ft3 =3D 2a3130d3
> > +fmaxm_d     0010101 ..... ..... 011 ..... 1010011 @r
> > +# fminm.h ft1, ft2, ft3 =3D 2c3120d3
> > +fminm_h     0010110 ..... ..... 010 ..... 1010011 @r
> > +# fmaxm.h ft1, ft2, ft3 =3D 2c3130d3
> > +fmaxm_h     0010110 ..... ..... 011 ..... 1010011 @r
> > +
> > +# fround.s fa0,fa1 =3D 4045f553
> > +# fround.s fa0,fa1,rtz =3D 40459553
> > +fround_s    0100000 00100 ..... ... ..... 1010011 @r2_rm
> > +# froundnx.s fa0,fa1 =3D 4055f553
> > +# froundnx.s fa0,fa1,rtz =3D 40559553
> > +froundnx_s  0100000 00101 ..... ... ..... 1010011 @r2_rm
> > +# fround.d fa0,fa1 =3D 4245f553
> > +# fround.d fa0,fa1,rtz =3D 42459553
> > +fround_d    0100001 00100 ..... ... ..... 1010011 @r2_rm
> > +# froundnx.d fa0,fa1 =3D 4255f553
> > +# froundnx.d fa0,fa1,rtz =3D 42559553
> > +froundnx_d  0100001 00101 ..... ... ..... 1010011 @r2_rm
> > +# fround.h fa0,fa1 =3D 4245f553
> > +# fround.h fa0,fa1,rtz =3D 42459553
> > +#[       ]+[0-9a-f]+:[   ]+4445f553[     ]+fround\.h[            ]+fa0=
,fa1
> > +#[       ]+[0-9a-f]+:[   ]+44459553[     ]+fround\.h[            ]+fa0=
,fa1,rtz
> > +fround_h    0100010 00100 ..... ... ..... 1010011 @r2_rm
> > +# froundnx.h fa0,fa1 =3D 4255f553
> > +# froundnx.h fa0,fa1,rtz =3D 42559553
> > +#[       ]+[0-9a-f]+:[   ]+4455f553[     ]+froundnx\.h[          ]+fa0=
,fa1
> > +#[       ]+[0-9a-f]+:[   ]+44559553[     ]+froundnx\.h[          ]+fa0=
,fa1,rtz
> > +froundnx_h  0100010 00101 ..... ... ..... 1010011 @r2_rm
> > +
> > +# fcvtmod.w.d a0,ft1,rtz =3D c2809553
> > +fcvtmod_w_d 1100001 01000 ..... 001 ..... 1010011 @r2
> > +
> > +# Inspiration: th.fmv, fmv.x.w, fmvp.d.x
> > +# fmvh.x.d a0,ft1 =3D e2108553
> > +fmvh_x_d    1110001 00001 ..... 000 ..... 1010011 @r2
> > +# fmvp.d.x ft1,a0,a1 =3D b2b500d3
> > +fmvp_d_x    1011001 ..... ..... 000 ..... 1010011 @r
> > +
> > +#[       ]+[0-9a-f]+:[   ]+a020c553[     ]+fleq\.s[              ]+a0,=
ft1,ft2
> > +fleq_s      1010000 ..... ..... 100 ..... 1010011 @r
> > +#[       ]+[0-9a-f]+:[   ]+a020d553[     ]+fltq\.s[              ]+a0,=
ft1,ft2
> > +fltq_s      1010000 ..... ..... 101 ..... 1010011 @r
> > +#[       ]+[0-9a-f]+:[   ]+a220c553[     ]+fleq\.d[              ]+a0,=
ft1,ft2
> > +fleq_d      1010001 ..... ..... 100 ..... 1010011 @r
> > +#[       ]+[0-9a-f]+:[   ]+a220d553[     ]+fltq\.d[              ]+a0,=
ft1,ft2
> > +fltq_d      1010001 ..... ..... 101 ..... 1010011 @r
> > +#[       ]+[0-9a-f]+:[   ]+a420c553[     ]+fleq\.h[              ]+a0,=
ft1,ft2
> > +fleq_h      1010010 ..... ..... 100 ..... 1010011 @r
> > +#[       ]+[0-9a-f]+:[   ]+a420d553[     ]+fltq\.h[              ]+a0,=
ft1,ft2
> > +fltq_h      1010010 ..... ..... 101 ..... 1010011 @r
> > +
> >   # *** RV32 Zfh Extension ***
> >   flh        ............   ..... 001 ..... 0000111 @i
> >   fsh        .......  ..... ..... 001 ..... 0100111 @s
> > diff --git a/target/riscv/insn_trans/trans_rvzfa.c.inc b/target/riscv/i=
nsn_trans/trans_rvzfa.c.inc
> > new file mode 100644
> > index 0000000000..5320d7011e
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
> > @@ -0,0 +1,529 @@
> > +/*
> > + * RISC-V translation routines for the Zfa Standard Extension.
> > + *
> > + * Copyright (c) 2023 Christoph M=C3=BCllner, christoph.muellner@vrull=
.eu
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITH=
OUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZFA(ctx) do {     \
> > +    if (!ctx->cfg_ptr->ext_zfa) { \
> > +        return false;             \
> > +    }                             \
> > +} while (0)
> > +
> > +#define REQUIRE_ZFH(ctx) do {     \
> > +    if (!ctx->cfg_ptr->ext_zfh) { \
> > +        return false;             \
> > +    }                             \
> > +} while (0)
> > +
> > +static bool trans_fli_s(DisasContext *ctx, arg_fli_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    /* Values below are NaN-boxed to avoid a gen_nanbox_s(). */
> > +    static const uint64_t fli_s_table[] =3D {
> > +        0xffffffffbf800000,  /* -1.0 */
> > +        0xffffffff00800000,  /* minimum positive normal */
> > +        0xffffffff37800000,  /* 1.0 * 2^-16 */
> > +        0xffffffff38000000,  /* 1.0 * 2^-15 */
> > +        0xffffffff3b800000,  /* 1.0 * 2^-8  */
> > +        0xffffffff3c000000,  /* 1.0 * 2^-7  */
> > +        0xffffffff3d800000,  /* 1.0 * 2^-4  */
> > +        0xffffffff3e000000,  /* 1.0 * 2^-3  */
> > +        0xffffffff3e800000,  /* 0.25 */
> > +        0xffffffff3ea00000,  /* 0.3125 */
> > +        0xffffffff3ec00000,  /* 0.375 */
> > +        0xffffffff3ee00000,  /* 0.4375 */
> > +        0xffffffff3f000000,  /* 0.5 */
> > +        0xffffffff3f200000,  /* 0.625 */
> > +        0xffffffff3f400000,  /* 0.75 */
> > +        0xffffffff3f600000,  /* 0.875 */
> > +        0xffffffff3f800000,  /* 1.0 */
> > +        0xffffffff3fa00000,  /* 1.25 */
> > +        0xffffffff3fc00000,  /* 1.5 */
> > +        0xffffffff3fe00000,  /* 1.75 */
> > +        0xffffffff40000000,  /* 2.0 */
> > +        0xffffffff40200000,  /* 2.5 */
> > +        0xffffffff40400000,  /* 3 */
> > +        0xffffffff40800000,  /* 4 */
> > +        0xffffffff41000000,  /* 8 */
> > +        0xffffffff41800000,  /* 16 */
> > +        0xffffffff43000000,  /* 2^7 */
> > +        0xffffffff43800000,  /* 2^8 */
> > +        0xffffffff47000000,  /* 2^15 */
> > +        0xffffffff47800000,  /* 2^16 */
> > +        0xffffffff7f800000,  /* +inf */
> > +        0xffffffff7fc00000,  /* Canonical NaN */
> > +    };
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    tcg_gen_ld_i64(dest, cpu_env, fli_s_table[a->rs1]);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fli_d(DisasContext *ctx, arg_fli_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    static const uint64_t fli_d_table[] =3D {
> > +        0xbff0000000000000,  /* -1.0 */
> > +        0x0010000000000000,  /* minimum positive normal */
> > +        0x3ef0000000000000,  /* 1.0 * 2^-16 */
> > +        0x3f00000000000000,  /* 1.0 * 2^-15 */
> > +        0x3f70000000000000,  /* 1.0 * 2^-8  */
> > +        0x3f80000000000000,  /* 1.0 * 2^-7  */
> > +        0x3fb0000000000000,  /* 1.0 * 2^-4  */
> > +        0x3fc0000000000000,  /* 1.0 * 2^-3  */
> > +        0x3fd0000000000000,  /* 0.25 */
> > +        0x3fd4000000000000,  /* 0.3125 */
> > +        0x3fd8000000000000,  /* 0.375 */
> > +        0x3fdc000000000000,  /* 0.4375 */
> > +        0x3fe0000000000000,  /* 0.5 */
> > +        0x3fe4000000000000,  /* 0.625 */
> > +        0x3fe8000000000000,  /* 0.75 */
> > +        0x3fec000000000000,  /* 0.875 */
> > +        0x3ff0000000000000,  /* 1.0 */
> > +        0x3ff4000000000000,  /* 1.25 */
> > +        0x3ff8000000000000,  /* 1.5 */
> > +        0x3ffc000000000000,  /* 1.75 */
> > +        0x4000000000000000,  /* 2.0 */
> > +        0x4004000000000000,  /* 2.5 */
> > +        0x4008000000000000,  /* 3 */
> > +        0x4010000000000000,  /* 4 */
> > +        0x4020000000000000,  /* 8 */
> > +        0x4030000000000000,  /* 16 */
> > +        0x4060000000000000,  /* 2^7 */
> > +        0x4070000000000000,  /* 2^8 */
> > +        0x40e0000000000000,  /* 2^15 */
> > +        0x40f0000000000000,  /* 2^16 */
> > +        0x7ff0000000000000,  /* +inf */
> > +        0x7ff8000000000000,  /* Canonical NaN */
> > +    };
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    tcg_gen_ld_i64(dest, cpu_env, fli_d_table[a->rs1]);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fli_h(DisasContext *ctx, arg_fli_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    /* Values below are NaN-boxed to avoid a gen_nanbox_h(). */
> > +    const uint64_t fli_h_table[] =3D {
> > +        0xffffffffffffbc00,  /* -1.0 */
> > +        0xffffffffffff0400,  /* minimum positive normal */
> > +        0xffffffffffff0100,  /* 1.0 * 2^-16 */
> > +        0xffffffffffff0200,  /* 1.0 * 2^-15 */
> > +        0xffffffffffff1c00,  /* 1.0 * 2^-8  */
> > +        0xffffffffffff2000,  /* 1.0 * 2^-7  */
> > +        0xffffffffffff2c00,  /* 1.0 * 2^-4  */
> > +        0xffffffffffff3000,  /* 1.0 * 2^-3  */
> > +        0xffffffffffff3400,  /* 0.25 */
> > +        0xffffffffffff3500,  /* 0.3125 */
> > +        0xffffffffffff3600,  /* 0.375 */
> > +        0xffffffffffff3700,  /* 0.4375 */
> > +        0xffffffffffff3800,  /* 0.5 */
> > +        0xffffffffffff3900,  /* 0.625 */
> > +        0xffffffffffff3a00,  /* 0.75 */
> > +        0xffffffffffff3b00,  /* 0.875 */
> > +        0xffffffffffff3c00,  /* 1.0 */
> > +        0xffffffffffff3d00,  /* 1.25 */
> > +        0xffffffffffff3e00,  /* 1.5 */
> > +        0xffffffffffff3f00,  /* 1.75 */
> > +        0xffffffffffff4000,  /* 2.0 */
> > +        0xffffffffffff4100,  /* 2.5 */
> > +        0xffffffffffff4200,  /* 3 */
> > +        0xffffffffffff4400,  /* 4 */
> > +        0xffffffffffff4800,  /* 8 */
> > +        0xffffffffffff4c00,  /* 16 */
> > +        0xffffffffffff5800,  /* 2^7 */
> > +        0xffffffffffff5c00,  /* 2^8 */
> > +        0xffffffffffff7800,  /* 2^15 */
> > +        0xffffffffffff7c00,  /* 2^16 */
> > +        0xffffffffffff7c00,  /* +inf */
> > +        0xffffffffffff7e00,  /* Canonical NaN */
> > +    };
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    tcg_gen_ld_i64(dest, cpu_env, fli_h_table[a->rs1]);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fminm_s(DisasContext *ctx, arg_fminm_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fminm_s(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fmaxm_s(DisasContext *ctx, arg_fmaxm_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fmaxm_s(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fminm_d(DisasContext *ctx, arg_fminm_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
> > +
> > +    gen_helper_fminm_d(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_d(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fmaxm_d(DisasContext *ctx, arg_fmaxm_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_d(ctx, a->rs2);
> > +
> > +    gen_helper_fmaxm_d(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_d(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fminm_h(DisasContext *ctx, arg_fminm_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fminm_h(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fmaxm_h(DisasContext *ctx, arg_fmaxm_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fmaxm_h(dest, cpu_env, src1, src2);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fround_s(DisasContext *ctx, arg_fround_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_fround_s(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_froundnx_s(DisasContext *ctx, arg_froundnx_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_froundnx_s(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fround_d(DisasContext *ctx, arg_fround_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_fround_d(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_froundnx_d(DisasContext *ctx, arg_froundnx_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_froundnx_d(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fround_h(DisasContext *ctx, arg_fround_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_fround_h(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_froundnx_h(DisasContext *ctx, arg_froundnx_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +
> > +    gen_set_rm(ctx, a->rm);
> > +    gen_helper_froundnx_h(dest, cpu_env, src1);
> > +    gen_set_fpr_hs(ctx, a->rd, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +bool trans_fcvtmod_w_d(DisasContext *ctx, arg_fcvtmod_w_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv dst =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
> > +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +
> > +    /* Rounding mode is RTZ. */
> > +    gen_set_rm(ctx, RISCV_FRM_RTZ);
> > +    gen_helper_fcvtmod_w_d(t1, cpu_env, src1);
> > +    tcg_gen_trunc_i64_tl(dst, t1);
> > +    gen_set_gpr(ctx, a->rd, dst);
> > +
> > +    return true;
> > +}
> > +
> > +bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_32BIT(ctx);
> > +
> > +    TCGv dst =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +
> > +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
> > +    tcg_gen_trunc_i64_tl(dst, t1);
> > +    gen_set_gpr(ctx, a->rd, dst);
> > +    return true;
> > +}
> > +
> > +bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_32BIT(ctx);
> > +
> > +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> > +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_ZERO);
> > +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +    TCGv_i64 t2 =3D tcg_temp_new_i64();
> > +
> > +    tcg_gen_ext_tl_i64(t1, src1);
> > +    tcg_gen_ext_tl_i64(t2, src2);
> > +    tcg_gen_shli_i64(t2, t2, 32);
> > +    tcg_gen_or_i64(t2, t2, t1);
> > +    tcg_gen_mov_i64(cpu_fpr[a->rd], t2);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +bool trans_fleq_s(DisasContext *ctx, arg_fleq_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fleq_s(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +bool trans_fltq_s(DisasContext *ctx, arg_fltq_s *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVF);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +bool trans_fleq_d(DisasContext *ctx, arg_fleq_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +bool trans_fltq_d(DisasContext *ctx, arg_fltq_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +bool trans_fleq_h(DisasContext *ctx, arg_fleq_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fleq_h(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +bool trans_fltq_h(DisasContext *ctx, arg_fltq_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
> > +    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
> > +
> > +    gen_helper_fltq_h(dest, cpu_env, src1, src2);
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 0ee8ee147d..0e61e31d9f 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1081,6 +1081,7 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)
> >   #include "insn_trans/trans_rvzicond.c.inc"
> >   #include "insn_trans/trans_rvzawrs.c.inc"
> >   #include "insn_trans/trans_rvzicbo.c.inc"
> > +#include "insn_trans/trans_rvzfa.c.inc"
> >   #include "insn_trans/trans_rvzfh.c.inc"
> >   #include "insn_trans/trans_rvk.c.inc"
> >   #include "insn_trans/trans_privileged.c.inc"

