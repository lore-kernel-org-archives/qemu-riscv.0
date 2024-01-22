Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A179C47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 04:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmOW-0006Sb-VP; Sun, 21 Jan 2024 23:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmOU-0006SM-88; Sun, 21 Jan 2024 23:58:47 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmOS-0003MH-J6; Sun, 21 Jan 2024 23:58:46 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7d2e15193bbso647321241.0; 
 Sun, 21 Jan 2024 20:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705899522; x=1706504322; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AL/38ayuYmFsOfmjvkcoGC7AR0LzTi3WOVe0WNEp8Bc=;
 b=Rt98+qx5CyNUORVPfuIuzHmi4LnCFFEL0vUQFwX2OSmAVStV81vnYoDjsVfdKU0+OE
 1bkRIcAC4BI2xPqDdoSc5IlU/E0vJRyXA2XQG3zloVFAAQOSSwQbRlK0/D/YSMGgQCrG
 Qh1J3iK2f0hAhpZSQRMZPudO0PMUUnzsaG7py2L+ufCHkj8nSqEzoL37e2X/2ULv83Oo
 rEKkP9I/dUcALPKgQSyHs0FDr0mSheNuqixsT0lOFZbUYSOAJSjEW3d666OM/0+UpqoM
 kDpAUo9haRdkwXyEq86WINwXY2uRLn1r6KRNdmbJv0+cX1Nbih2hHzv8bKqr6OAbqbK/
 l+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705899522; x=1706504322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AL/38ayuYmFsOfmjvkcoGC7AR0LzTi3WOVe0WNEp8Bc=;
 b=MQcndjgnH8UNp4iTZd4qhVg7I1gtubR9y7w8i/K4Reo18UZhbbqaYmUxQId7b4kJch
 zg3CBUKgMEL/uq0v5c9CQOrmrW1wsdhDi88S+EJanPdGWY/yxI0/ucGbH/DvQTMtvlxR
 2vozCYRJoUWd8Rfvg/mRMk6nKJN9Qplvmfkwjyz6Eh4bocoLN5c5LpJR6e45y9CO3a4/
 UHhkqCRPYEDdBYUFoyylNvzdhyFWfhElheKgTJf1E50NuEBequtDMywY/nFxhYWK1qbv
 qzFeu9VFZNTaa+E6pY1Yu07QEGSCrVCQjMT4tBFVXE5s2TJnYs3OFVXKmNNgFrDQXIBk
 LwIw==
X-Gm-Message-State: AOJu0Yw8lzo410Im3sLLgQV7yRgHbRLDorRvGzccwCrV9DKW4W1cf/Z+
 Dh1JGdHAENg/q+Q2d7M32xSRaku/di9i4wZ58GOErTbyfHMzxrT/pHUqTanswE+SHrmaGC0UBgH
 8D7pw3yVk1afK6nT6NrGvtHNqTHs=
X-Google-Smtp-Source: AGHT+IF5qCwEWnJ2g1impy2PmFhMZiGUKKMDhKNo7pZRNBsmswV8LpZXtQQxM54ibbeLymBd0nyycvQbH8YcRmSb5fc=
X-Received: by 2002:a05:6122:912:b0:4b7:e5c2:73db with SMTP id
 j18-20020a056122091200b004b7e5c273dbmr871926vka.4.1705899522025; Sun, 21 Jan
 2024 20:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20240109002554.646572-1-atishp@rivosinc.com>
 <20240109002554.646572-5-atishp@rivosinc.com>
In-Reply-To: <20240109002554.646572-5-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 14:58:16 +1000
Message-ID: <CAKmqyKNo2dcpEFyLJVR5wP+0_bmCEV1gELK6zqpsAi-47ffc4w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] target/riscv: Add cycle & instret privilege mode
 filtering support
To: Atish Patra <atishp@rivosinc.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jan 9, 2024 at 10:29=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>
> QEMU only calculates dummy cycles and instructions, so there is no
> actual means to stop the icount in QEMU. Hence this patch merely adds
> the functionality of accessing the cfg registers, and cause no actual
> effects on the counting of cycle and instret counters.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 283468bbc652..3bd4aa22374f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -233,6 +233,24 @@ static RISCVException sscofpmf_32(CPURISCVState *env=
, int csrno)
>      return sscofpmf(env, csrno);
>  }
>
> +static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_cfg(env)->ext_smcntrpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException smcntrpmf_32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smcntrpmf(env, csrno);
> +}
> +
>  static RISCVException any(CPURISCVState *env, int csrno)
>  {
>      return RISCV_EXCP_NONE;
> @@ -818,6 +836,54 @@ static int read_hpmcounterh(CPURISCVState *env, int =
csrno, target_ulong *val)
>
>  #else /* CONFIG_USER_ONLY */
>
> +static int read_mcyclecfg(CPURISCVState *env, int csrno, target_ulong *v=
al)
> +{
> +    *val =3D env->mcyclecfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfg(CPURISCVState *env, int csrno, target_ulong v=
al)
> +{
> +    env->mcyclecfg =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong *=
val)
> +{
> +    *val =3D env->mcyclecfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong =
val)
> +{
> +    env->mcyclecfgh =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfg(CPURISCVState *env, int csrno, target_ulong =
*val)
> +{
> +    *val =3D env->minstretcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfg(CPURISCVState *env, int csrno, target_ulong=
 val)
> +{
> +    env->minstretcfg =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfgh(CPURISCVState *env, int csrno, target_ulong=
 *val)
> +{
> +    *val =3D env->minstretcfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfgh(CPURISCVState *env, int csrno, target_ulon=
g val)
> +{
> +    env->minstretcfgh =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *v=
al)
>  {
>      int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
> @@ -4922,6 +4988,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                               write_mcountinhibit,
>                               .min_priv_ver =3D PRIV_VERSION_1_11_0      =
 },
>
> +    [CSR_MCYCLECFG]      =3D { "mcyclecfg",   smcntrpmf, read_mcyclecfg,
> +                             write_mcyclecfg,
> +                             .min_priv_ver =3D PRIV_VERSION_1_12_0      =
 },
> +    [CSR_MINSTRETCFG]    =3D { "minstretcfg", smcntrpmf, read_minstretcf=
g,
> +                             write_minstretcfg,
> +                             .min_priv_ver =3D PRIV_VERSION_1_12_0      =
 },
> +
>      [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmevent,
>                               write_mhpmevent                           }=
,
>      [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_mhpmevent,
> @@ -4981,6 +5054,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent,
>                               write_mhpmevent                           }=
,
>
> +    [CSR_MCYCLECFGH]     =3D { "mcyclecfgh",   smcntrpmf_32, read_mcycle=
cfgh,
> +                             write_mcyclecfgh,
> +                             .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> +    [CSR_MINSTRETCFGH]   =3D { "minstretcfgh", smcntrpmf_32, read_minstr=
etcfgh,
> +                             write_minstretcfgh,
> +                             .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> +
>      [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> --
> 2.34.1
>
>

