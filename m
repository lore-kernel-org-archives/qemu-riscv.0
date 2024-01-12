Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2D6C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 03:34:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO8Ir-0001BM-I5; Thu, 11 Jan 2024 22:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8Ip-0001Az-Qo; Thu, 11 Jan 2024 22:33:51 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8In-0001Gb-FS; Thu, 11 Jan 2024 22:33:51 -0500
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7ce415b5492so1640196241.0; 
 Thu, 11 Jan 2024 19:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705030428; x=1705635228; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXrKMlt51eKwUw7dVqXq1m0s0RJOghJzim/XNTuJrDg=;
 b=XQssbDyQxCFpp/f84pmrub2w54vDwwS86rPGtICaA+1PWhFn/cY42TaSy2Op0SAtbS
 UFP0lhtwAKSbxSQfjMsArDSbsbMFiPebTNVeBYN9uHqBmryTiVKInddmQL1RRStt9KFj
 Pjyb+b8ZBfEIJ5Q9PzmXykS5ndBpa8vLMBMq5CxumyMbibQJzahl2AlMtJoJv4622H6A
 ZR+znif63eK3gQ8Vv6AspL4YHS4DeF2F4EXmfngVen/mx46MwMM9qCTvh5wBmnjle/H8
 j6JSSK83dGZrZc72UIdXALs+DSIfNRGbqyz909O6CNmF12/sJuYaEQdtX7KspXkjcMWj
 tC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705030428; x=1705635228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FXrKMlt51eKwUw7dVqXq1m0s0RJOghJzim/XNTuJrDg=;
 b=lfeV2wUPKE6whAuDMci57SerNinZ0Dp8nEYbdlRJIh4tvdufpGOIi8v2eR/5WAQ+qC
 fmzbCcH6zzxU1Xh2Q3nGX7bh+gVOA1HIqiK43fQZE0IAlTVrYvK9VencJVa34wm1F+XO
 AQXKw4/UFDXJLAY2h75RcdEj6KQxSPZuFyjjIbwyuy2EeeVliX53KXATwz5W2ysncFFr
 7+jgyeN37WPTr3IEkIUf+wkkF8bkexcANEG8CfddPNjvB4deO83zo0re2ZDFEsHvXGnN
 XzinFMbWVvyG7zCEKngDO3L6NtVpAaXgeJRz4riHs5OLGtF7rSCk99VWx5Bkye0srUAe
 8e8A==
X-Gm-Message-State: AOJu0Yzn69/a7Xa1Z5ALFtSb3w/VmaS810p8GhdKvZom3Rg6PWAFpj/k
 uo7I14X4X8BQBLGtv873iFHcNsp2zT7eXB6iKdCfkr3ptCHxSQ==
X-Google-Smtp-Source: AGHT+IGQk2/vMS5eZjCynOhZIyj5yl4Y9OUKlpnRdygFX30WB2N3cfAVJDSMikQBAVbY3JUqgRJHjvEJMKnjpgXX/+c=
X-Received: by 2002:a05:6102:12d0:b0:467:efe9:d69b with SMTP id
 jd16-20020a05610212d000b00467efe9d69bmr935590vsb.18.1705030428045; Thu, 11
 Jan 2024 19:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <20240110040203.1920924-3-hchauhan@ventanamicro.com>
In-Reply-To: <20240110040203.1920924-3-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 13:33:21 +1000
Message-ID: <CAKmqyKNgWS2wdkMGJTdV7nPpjT5XZWEnynf0ir5WSiRBf8xC8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Raise an exception when sdtrig is
 turned off
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Wed, Jan 10, 2024 at 2:03=E2=80=AFPM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> When sdtrig is turned off by "sdtrig=3Dfalse" option, raise
> and illegal instruction exception on any read/write to
> sdtrig CSRs.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/csr.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c50a33397c..b9ca016ef2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3854,6 +3854,10 @@ static RISCVException write_pmpaddr(CPURISCVState =
*env, int csrno,
>  static RISCVException read_tselect(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> +    if (!riscv_cpu_cfg(env)->ext_sdtrig) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

Thanks for the patch!

You should be able to add this check to the

static RISCVException debug(CPURISCVState *env, int csrno)

function instead

Alistair

> +
>      *val =3D tselect_csr_read(env);
>      return RISCV_EXCP_NONE;
>  }
> @@ -3861,6 +3865,10 @@ static RISCVException read_tselect(CPURISCVState *=
env, int csrno,
>  static RISCVException write_tselect(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
> +    if (!riscv_cpu_cfg(env)->ext_sdtrig) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      tselect_csr_write(env, val);
>      return RISCV_EXCP_NONE;
>  }
> @@ -3868,6 +3876,10 @@ static RISCVException write_tselect(CPURISCVState =
*env, int csrno,
>  static RISCVException read_tdata(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> +    if (!riscv_cpu_cfg(env)->ext_sdtrig) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      /* return 0 in tdata1 to end the trigger enumeration */
>      if (env->trigger_cur >=3D RV_MAX_TRIGGERS && csrno =3D=3D CSR_TDATA1=
) {
>          *val =3D 0;
> @@ -3885,6 +3897,10 @@ static RISCVException read_tdata(CPURISCVState *en=
v, int csrno,
>  static RISCVException write_tdata(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
> +    if (!riscv_cpu_cfg(env)->ext_sdtrig) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      if (!tdata_available(env, csrno - CSR_TDATA1)) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> @@ -3896,6 +3912,10 @@ static RISCVException write_tdata(CPURISCVState *e=
nv, int csrno,
>  static RISCVException read_tinfo(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> +    if (!riscv_cpu_cfg(env)->ext_sdtrig) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      *val =3D tinfo_csr_read(env);
>      return RISCV_EXCP_NONE;
>  }
> --
> 2.34.1
>
>

