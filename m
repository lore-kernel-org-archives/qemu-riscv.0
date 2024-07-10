Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ADCC38150
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 07:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRRui-00005S-46; Wed, 10 Jul 2024 03:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sRRuf-0008ON-R5
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2024 03:38:53 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sRRud-00057S-RY
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2024 03:38:53 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52e9944764fso6725820e87.3
 for <qemu-riscv@nongnu.org>; Wed, 10 Jul 2024 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720597130; x=1721201930;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CO9RPx9Z3ZLJM4KUGqDqf8R+/59JI9tn8zPrUEO5tbU=;
 b=KUzesInyGJeEWHb5ywt5DpKZbW4gN0cAN1z3U8yzOtGriEw63ytIh2xJo4zwdJQ6Qi
 5m81J49CfZ79XqnV2Pz1nZ6+fVQixEVluXZt6JT2EZEB4zjTJ16j8ZvTa11Zgb+2snKY
 XOpBNm58s0zKxJ+cjjAYrp9O0ZJ98cbLcGz2P/DwMYqhVf1q7JzwxgAeXluLGjjfaK4U
 BUcrSbQS2WVfHKyDrd1aUdxfkFhSXWzx+RUDTvfILGa/dDscCyAfudQQvTSAirztMpi7
 U+DyL+pV9MVDQSq+oEHp2cefJ6Zzj8mY4EkCVQFIfrKw/gU6wpAavQrWtGf2DBmNHVeX
 sYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720597130; x=1721201930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CO9RPx9Z3ZLJM4KUGqDqf8R+/59JI9tn8zPrUEO5tbU=;
 b=ONiJy9hA/mRg0AyDJD/G/Na3g7wqYfvXEDaWmyq3+e83+GbKjK7JCrPmV5B7fAjbR8
 DLwKlmdfTj58SIqx6NGeoT0Nsqnq5LoDxzmv8lL9IvJZb8NPaPH70nkpRnFH1M5koqE1
 9qyX59NTOjFUsFyZSA1Ag14ufLyLL0LtOj7VBDnKOp6GoFwZg/kAniIo+bCEEOUEgYdZ
 N2Z/IqnEcnN6wge6gpRM/Mgqpm4/h5JkSEyBF4gfT2y96l+qj/2jAaJjV8DTY6YXwN3f
 teV5Pu4/5LOkc8TFzyVKM/3k/coqfzIun11D4loCPDNoEOVR44PJC9Tsp2dsF7FMHOt5
 EwIg==
X-Gm-Message-State: AOJu0Yzoko+GpKyr+UrrRGxOFfon6dMy6uov8BxaAnMBBygO2WWc37WJ
 3nu+q5lMB7RZ2n4dmYZOUdd9de8evT9FMw7H994OlbFtmoA5IsG6AITn+qTc3cHQas8qnTkVAsP
 A81p/0ROI/0IzOCVAcLS/pZlpPv+8MTYaiotwRA==
X-Google-Smtp-Source: AGHT+IE745JjD2KJte2l+NhBxscaZvxl2osmMoFHX6XThXEzRLxLre16p9SHTxUzapdavhT1ZDYD2sBlw0V9Cq7dxLw=
X-Received: by 2002:a05:6512:e93:b0:52e:95fc:3937 with SMTP id
 2adb3069b0e04-52eb9991451mr3277641e87.15.1720597129716; Wed, 10 Jul 2024
 00:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-smcntrpmf_v7-v7-0-bb0f10af7fa9@rivosinc.com>
 <20240626-smcntrpmf_v7-v7-5-bb0f10af7fa9@rivosinc.com>
 <CAKmqyKN3V9-q+CE93y_+1r=yjr7U1YKa=mCpjZ7nOr-6JtN=ig@mail.gmail.com>
In-Reply-To: <CAKmqyKN3V9-q+CE93y_+1r=yjr7U1YKa=mCpjZ7nOr-6JtN=ig@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 10 Jul 2024 00:38:38 -0700
Message-ID: <CAHBxVyGSh5iNEv3m3E2um3Yu7S_WJnaKE15DHoDQmQYOqGC-nA@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] target/riscv: Add cycle & instret privilege mode
 filtering support
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Rajnesh Kanwal <rkanwal@rivosinc.com>, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 2, 2024 at 6:19=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Thu, Jun 27, 2024 at 10:00=E2=80=AFAM Atish Patra <atishp@rivosinc.com=
> wrote:
> >
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > QEMU only calculates dummy cycles and instructions, so there is no
> > actual means to stop the icount in QEMU. Hence this patch merely adds
> > the functionality of accessing the cfg registers, and cause no actual
> > effects on the counting of cycle and instret counters.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >  target/riscv/csr.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 88 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 3ad851707e5c..665c534db1a0 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -236,6 +236,24 @@ static RISCVException sscofpmf_32(CPURISCVState *e=
nv, int csrno)
> >      return sscofpmf(env, csrno);
> >  }
> >
> > +static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_cpu_cfg(env)->ext_smcntrpmf) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
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
> >  static RISCVException any(CPURISCVState *env, int csrno)
> >  {
> >      return RISCV_EXCP_NONE;
> > @@ -830,6 +848,62 @@ static RISCVException read_hpmcounterh(CPURISCVSta=
te *env, int csrno,
> >
> >  #else /* CONFIG_USER_ONLY */
> >
> > +static RISCVException read_mcyclecfg(CPURISCVState *env, int csrno,
> > +                                     target_ulong *val)
> > +{
> > +    *val =3D env->mcyclecfg;
>
> We don't do a good job of this in other places, but we should check
> for RVU and RVS to determine if the bits can actually be set.
>
> This is especially important for Hypervisor support (VS/VU-modes), as
> that is often not supported so we should report that here
>

Agreed. I have fixed that here and added a patch for checking that
while updating
the INH bits for mhpmevent as well.

> Alistair
>
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mcyclecfg(CPURISCVState *env, int csrno,
> > +                                      target_ulong val)
> > +{
> > +    env->mcyclecfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_mcyclecfgh(CPURISCVState *env, int csrno,
> > +                                      target_ulong *val)
> > +{
> > +    *val =3D env->mcyclecfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mcyclecfgh(CPURISCVState *env, int csrno,
> > +                                       target_ulong val)
> > +{
> > +    env->mcyclecfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_minstretcfg(CPURISCVState *env, int csrno,
> > +                                       target_ulong *val)
> > +{
> > +    *val =3D env->minstretcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_minstretcfg(CPURISCVState *env, int csrno,
> > +                                        target_ulong val)
> > +{
> > +    env->minstretcfg =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_minstretcfgh(CPURISCVState *env, int csrno,
> > +                                        target_ulong *val)
> > +{
> > +    *val =3D env->minstretcfgh;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_minstretcfgh(CPURISCVState *env, int csrno=
,
> > +                                         target_ulong val)
> > +{
> > +    env->minstretcfgh =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mhpmevent(CPURISCVState *env, int csrno,
> >                                       target_ulong *val)
> >  {
> > @@ -5051,6 +5125,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >                               write_mcountinhibit,
> >                               .min_priv_ver =3D PRIV_VERSION_1_11_0    =
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
> >      [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmeven=
t,
> >                               write_mhpmevent                          =
 },
> >      [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_mhpmeven=
t,
> > @@ -5110,6 +5191,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmeven=
t,
> >                               write_mhpmevent                          =
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
> >      [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf_32,  read_mh=
pmeventh,
> >                               write_mhpmeventh,
> >                               .min_priv_ver =3D PRIV_VERSION_1_12_0    =
    },
> >
> > --
> > 2.34.1
> >
> >

