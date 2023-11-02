Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1097C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLoW-0008Oq-H3; Wed, 01 Nov 2023 20:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLoU-0008OU-MH; Wed, 01 Nov 2023 20:43:58 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLoR-0006R5-2R; Wed, 01 Nov 2023 20:43:58 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-457c19ebb3aso186188137.1; 
 Wed, 01 Nov 2023 17:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885833; x=1699490633; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWl7dCaligkUXwry9jbijs4+ul8ckkQJtWqYYfKTah0=;
 b=MkbqFf74a5k9pkypxEe2IhVtjSUql8T6Pa09nfW399DOcIvGwESUdwRLaBTHzPehQw
 RdSulHfsEzHY4Z1Ckx015Y6/gKjPnmnbMRVxnYYVn7S323h0p1mNhL3tjVBABvXJoD8H
 tmOMMWbuI/D1yx/bC22jJDmB4F3WYjjG9hLClsBCSqmsiT3TJx62sdiwc65qYNO/4bkY
 vhrljx2f8M4ckKSJU01qynfb3Bz+6+x9VAKuoVJMGZNhoQPJDTKdOLoEwOhTW+XyWVE9
 jTe1PKiZBYHib8vs2HD7i8gawUeZ4W1kT0ul9isF0WU+GXDa9JYqhr9Ek248UHZFcEM3
 J4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885833; x=1699490633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWl7dCaligkUXwry9jbijs4+ul8ckkQJtWqYYfKTah0=;
 b=vopByu9u8QcDr8yoUHzN8NADMF3ZCRuHEY2eOT046yCWop3qZN+na6F3Bc0EKUVMqe
 +T4Fo3wKwI0X7ktUbrabqpu33m74TZfbRIveVw7vpDcVIP2wjII0sy/zntlNeBCdW1jx
 LsfTgJcmEzEmF28BjYNgL7dPMa4+EqKhzhp499RDzT1GcRc1xNfZjMaMlNX9PKLTqbd3
 5BXcsxLHLsksb+VxaiCQMN7mIn0DT1eMU6gmn06H0tmTNxTBmhAJ50NsioFhnanQ0Fi3
 SdllgqZO6UDadzXwfOaSJEYCyvlQoBaoxLBsXHoIBlwd3mvTP4H13d2hP8hc1lCzu1iP
 MWPw==
X-Gm-Message-State: AOJu0Yxcpj/KE+vCgtt+78lDDEDUdVYJ26GROyRsUeW5kXaZB5GAES4l
 ALa36vUkqQlRwOaC6k3IitxU5j0A9bLC15zl/q6qbv/5JJo=
X-Google-Smtp-Source: AGHT+IEqtACegPV9p7xDT8z8BmglZZelknpH69Vr+AmTIXSD0tACacfnipRbm7TPacRy2TXceTGEqcNWjX0VzV1t0Qg=
X-Received: by 2002:a67:cc1b:0:b0:454:701c:7717 with SMTP id
 q27-20020a67cc1b000000b00454701c7717mr12499897vsl.5.1698885833465; Wed, 01
 Nov 2023 17:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231030102105.19501-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231030102105.19501-1-heinrich.schuchardt@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:43:27 +1000
Message-ID: <CAKmqyKNc19=qq6EXmEPYNatyy4ieZ7z-X9CQNk4Q6x5Skz3Yzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: correct csr_ops[CSR_MSECCFG]
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Mon, Oct 30, 2023 at 8:22=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CSR register mseccfg is used by multiple extensions: Smepm and Zkr.
>
> Consider this when checking the existence of the register.
>
> Fixes: 77442380ecbe ("target/riscv: rvk: add CSR support for Zkr")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2:
>         rebase on alistair23/riscv-to-apply-next
> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4ca96ddd1d..fc26b52c88 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -528,11 +528,14 @@ static RISCVException pmp(CPURISCVState *env, int c=
srno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> -static RISCVException smepmp(CPURISCVState *env, int csrno)
> +static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_cfg(env)->ext_smepmp) {
>          return RISCV_EXCP_NONE;
>      }
> +    if (riscv_cpu_cfg(env)->ext_zkr) {
> +        return RISCV_EXCP_NONE;
> +    }
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> @@ -4766,7 +4769,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
>
>      /* Physical Memory Protection */
> -    [CSR_MSECCFG]    =3D { "mseccfg", smepmp, read_mseccfg, write_mseccf=
g,
> +    [CSR_MSECCFG]    =3D { "mseccfg",   have_mseccfg, read_mseccfg, writ=
e_mseccfg,
>                           .min_priv_ver =3D PRIV_VERSION_1_11_0          =
 },
>      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
>      [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
> --
> 2.40.1
>
>

