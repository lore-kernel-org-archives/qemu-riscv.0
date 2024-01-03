Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E081EC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 23:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLAeG-00054o-3A; Wed, 03 Jan 2024 18:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLAeE-00054O-Vf
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 18:27:42 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLAe9-0007Bd-Sd
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 18:27:42 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50ea226bda8so1993887e87.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 15:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704324456; x=1704929256;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBIT0AqBPbtnqVlqZa8omJbPsDRit6ZaF2wl5BN6R9I=;
 b=0NqKGRYaRiTOlxFu2umRibsiUHJ7wjHYkz0u9XPNKYaZeDeATxtbNVOUzb7orIW7Gw
 azGuNhkVAbWv3ulgUEUcUdT6GjpCnFslTAZ05nh8ew8JhEUORvOmoGAV03PNOpoYjSdx
 UsfNOQCnbbR0g2azCiezcWDljTplVbNQfoeBednzJ2bjJknaklLcTGuwzV7ZhNhEh12F
 PD5BarmwKj2cDTvcx9MTMo8AlMCK7WpMVjblVRMl0ym5QyyWCpBYu7Pe6X6fkQLPWVGE
 1dG4+eQ3omN4R5oXP48GkqUUbgz/8wASEGgE8Ljb8dSx4ZUYOL5h0NWRPs+24lrRP0eT
 EQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704324456; x=1704929256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBIT0AqBPbtnqVlqZa8omJbPsDRit6ZaF2wl5BN6R9I=;
 b=fUkoqcTIgL98Vvmjm0MvET81Fu7eYbJPbJc04IaQqj2aFemfKXc6af37zBW9PJ8WFv
 16P8CVltdHntNPLmPQFE0FdsUH7wuIQ4tkTZyAqKOTJ7XNjirDDjb17OwjzLSesaS9Uc
 FdgJTTz69XdL/fpnxf3xoMBISfPfHXAlJeUnC26jAC0kFn+C7FPWlmcWBKb2IjVb4Ll5
 yVZ7oj1QsdD22MBq3DJ/BkvNu3KF6xO7x3kzjX7fCmjSHzKghsqCchgC18dMOBDMbagl
 T+gcOCnlHeVkLB2bM5zf/dYOD8M10gvP/LaNp1mDmP6Q69MuXwwdPBI5m616g8pjH0r6
 WW1A==
X-Gm-Message-State: AOJu0YyE121mcjI1vnNG2XV6YXtZogchVLnwQug+jwd0jKT+xOcAOwoS
 ScEgS3J9GmeZoxWTSxbMWFe6j0n51KNFHVsJYvMxo0CTuHkeDg==
X-Google-Smtp-Source: AGHT+IGVS5/lXQEZwDniMtTDdZVjoMiUgUW5DO85BsL+uWxzhXQPCk9BfyUjn5gZWBMAnwjSxSrgwHW/zB9PTwAaIGA=
X-Received: by 2002:a19:f807:0:b0:50e:7703:3b0b with SMTP id
 a7-20020a19f807000000b0050e77033b0bmr5654504lff.75.1704324455681; Wed, 03 Jan
 2024 15:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20231229004929.3842055-1-atishp@rivosinc.com>
 <20231229004929.3842055-5-atishp@rivosinc.com>
 <21533886-8389-4701-b541-dca295cb2814@ventanamicro.com>
In-Reply-To: <21533886-8389-4701-b541-dca295cb2814@ventanamicro.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Jan 2024 15:27:24 -0800
Message-ID: <CAHBxVyGufrYRP5t5M0-0CwYnBRcu7_00ueHaUAQGOhu3JUs0OQ@mail.gmail.com>
Subject: Re: [v2 4/5] target/riscv: Add cycle & instret privilege mode
 filtering support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jan 3, 2024 at 12:18=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/28/23 21:49, Atish Patra wrote:
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > QEMU only calculates dummy cycles and instructions, so there is no
> > actual means to stop the icount in QEMU. Hence this patch merely adds
> > the functionality of accessing the cfg registers, and cause no actual
> > effects on the counting of cycle and instret counters.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >   target/riscv/cpu.c |  1 +
> >   target/riscv/csr.c | 83 +++++++++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 84 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 54395f95b299..d24f7ff8b55b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1297,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32=
_t bit)
> >   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
> >       /* Defaults for standard extensions */
> >       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> > +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
>
>
> As I said in patch 2 this declaration can happen there instead.
>

Yup. Will do it.

>
> >       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
> >       MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
> >       MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 283468bbc652..618e801a7612 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -233,6 +233,27 @@ static RISCVException sscofpmf_32(CPURISCVState *e=
nv, int csrno)
> >       return sscofpmf(env, csrno);
> >   }
> >
> > +static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    if (!cpu->cfg.ext_smcntrpmf) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
>
> env_archcpu() should be avoided when possible due to its overhead. You ca=
n use
> riscv_cpu_cfg() to retrieve cpu->cfg using 'env':
>

Sure. Will fix it.

> > +    if (!riscv_cpu_cfg(env)->ext_smcntrpmf) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
>
>
> Thanks,
>
> Daniel
>
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException smcntrpmf_32(CPURISCVState *env, int csrno)
> > +{
> > +    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smcntrpmf(env, csrno);
> > +}
> > +
> > +
> >   static RISCVException any(CPURISCVState *env, int csrno)
> >   {
> >       return RISCV_EXCP_NONE;
> > @@ -818,6 +839,54 @@ static int read_hpmcounterh(CPURISCVState *env, in=
t csrno, target_ulong *val)
> >
> >   #else /* CONFIG_USER_ONLY */
> >
> > +static int read_mcyclecfg(CPURISCVState *env, int csrno, target_ulong =
*val)
> > +{
> > +    *val =3D env->mcyclecfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_mcyclecfg(CPURISCVState *env, int csrno, target_ulong=
 val)
> > +{
> > +    env->mcyclecfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong=
 *val)
> > +{
> > +    *val =3D env->mcyclecfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_mcyclecfgh(CPURISCVState *env, int csrno, target_ulon=
g val)
> > +{
> > +    env->mcyclecfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_minstretcfg(CPURISCVState *env, int csrno, target_ulon=
g *val)
> > +{
> > +    *val =3D env->minstretcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_minstretcfg(CPURISCVState *env, int csrno, target_ulo=
ng val)
> > +{
> > +    env->minstretcfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_minstretcfgh(CPURISCVState *env, int csrno, target_ulo=
ng *val)
> > +{
> > +    *val =3D env->minstretcfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_minstretcfgh(CPURISCVState *env, int csrno, target_ul=
ong val)
> > +{
> > +    env->minstretcfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong=
 *val)
> >   {
> >       int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
> > @@ -4922,6 +4991,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >                                write_mcountinhibit,
> >                                .min_priv_ver =3D PRIV_VERSION_1_11_0   =
    },
> >
> > +    [CSR_MCYCLECFG]      =3D { "mcyclecfg",   smcntrpmf, read_mcyclecf=
g,
> > +                             write_mcyclecfg,
> > +                             .min_priv_ver =3D PRIV_VERSION_1_12_0    =
   },
> > +    [CSR_MINSTRETCFG]    =3D { "minstretcfg", smcntrpmf, read_minstret=
cfg,
> > +                             write_minstretcfg,
> > +                             .min_priv_ver =3D PRIV_VERSION_1_12_0    =
   },
> > +
> >       [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmeve=
nt,
> >                                write_mhpmevent                         =
  },
> >       [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_mhpmeve=
nt,
> > @@ -4981,6 +5057,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >       [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmeve=
nt,
> >                                write_mhpmevent                         =
  },
> >
> > +    [CSR_MCYCLECFGH]     =3D { "mcyclecfgh",   smcntrpmf_32, read_mcyc=
lecfgh,
> > +                             write_mcyclecfgh,
> > +                             .min_priv_ver =3D PRIV_VERSION_1_12_0    =
    },
> > +    [CSR_MINSTRETCFGH]   =3D { "minstretcfgh", smcntrpmf_32, read_mins=
tretcfgh,
> > +                             write_minstretcfgh,
> > +                             .min_priv_ver =3D PRIV_VERSION_1_12_0    =
    },
> > +
> >       [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf_32,  read_m=
hpmeventh,
> >                                write_mhpmeventh,
> >                                .min_priv_ver =3D PRIV_VERSION_1_12_0   =
     },

