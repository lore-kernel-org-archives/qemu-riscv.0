Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE19C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 02:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxHn6-0004R0-K3; Sun, 29 Oct 2023 22:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHn4-0004Qj-UK; Sun, 29 Oct 2023 22:14:06 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxHmp-0004sE-Qp; Sun, 29 Oct 2023 22:14:06 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b9dc244151so2424135241.1; 
 Sun, 29 Oct 2023 19:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698632030; x=1699236830; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kW6ScuIYETr3OT+6rmh8Lpmia2M3sJu49e14Zl1ecn8=;
 b=nGih1IatKlHeVPy0UY+/SHmGvygODgwW84e5RZGFGW7Di8nCPYlgWwiHX1S6rmi/K/
 4gzTTNCxADXLV9vO+ZMlZio5VRcAvG4S2wnHxeOWbWj8Elw3zpdUUPb3oVXeiE+1ckoQ
 fVQmDheZx++Zhlfay+S/8q96wSQD8GOQUPvFKcYzqM+l2ARvdmAgssq6oWX9V0odyI/+
 ViRPY8bI2lHj20lUKEqUeD7HyHYh3ert50HpH1PIOmGJAwsVt7t99utIw0yjow9Drc78
 YZQhOPoetx7vQLZO3qP2K0NhhGQFuqBSctNCKkb30VOAU1MqDPdENNNukBtvK0EY+bxx
 xODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698632030; x=1699236830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kW6ScuIYETr3OT+6rmh8Lpmia2M3sJu49e14Zl1ecn8=;
 b=O8oE6K/jFchQKP1AHhCoWYf8q2To6OWDlk8ZuvnKNCMRLxkNewu/0V1PDXWBOoN34G
 sMyqPRxZ8Yu4t8ve3OdpTKZ00tbg/ZM2AqJSWtmUlEe1g1G7mhYUp2Dc2cnoDQFTT3Cs
 9Otnn6JzKCdI+7YR0C2XT5jMrylOup5gKMG0brmkWrxhkFuhtl8j4FYtOLREIiVOX2zr
 ZPvxrLGmPu0ylEFy1yfBel/MN8W6kxH/JkePUIepodBQOst2Da1b0jK7aG8L/ycp/jUq
 Oh1edMSsN+hgV6ytxuHpChCorD9VK7g+wenxG1emd7jBg9Tl1k5dHviGIA9wWtwWhX1R
 S/Lw==
X-Gm-Message-State: AOJu0YxRdJrq8iBS1H2gVXP21xaH3p/mut9DjAR+y3IFA0g7lbjFLZyo
 IcLlwEg4Kd6tMc+Km5sk2wTeSHN4uds8qZdVJ8S2NVXZtGuNXQ==
X-Google-Smtp-Source: AGHT+IH/3DEYV9czP9TwflI7M3BNY2gyFgRmz7xoaT5Y3bTDpieAM9FiCmbXmkCvYwpGtdd5OKlyUFdcyBi1jtjT18U=
X-Received: by 2002:a05:6102:5f0:b0:450:6ef1:e415 with SMTP id
 w16-20020a05610205f000b004506ef1e415mr4603230vsf.13.1698632029827; Sun, 29
 Oct 2023 19:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231029004247.21217-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231029004247.21217-1-heinrich.schuchardt@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 12:13:23 +1000
Message-ID: <CAKmqyKP0JNyJGZ4y24mJ72U3F5f8_Xxbmz7eBMx_nVQekDc_XA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: correct csr_ops[CSR_MSECCFG]
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sun, Oct 29, 2023 at 10:47=E2=80=AFAM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CSR register mseccfg is used by multiple extensions: Smepm and Zkr.
>
> Consider this when checking the existence of the register.
>
> Fixes: 77442380ecbe ("target/riscv: rvk: add CSR support for Zkr")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
sending a v2?

Alistair

> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4b4ab56c40..07c0cfb7d8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -523,11 +523,14 @@ static RISCVException pmp(CPURISCVState *env, int c=
srno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> -static RISCVException epmp(CPURISCVState *env, int csrno)
> +static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_cfg(env)->epmp) {
>          return RISCV_EXCP_NONE;
>      }
> +    if (riscv_cpu_cfg(env)->ext_zkr) {
> +        return RISCV_EXCP_NONE;
> +    }
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> @@ -4379,7 +4382,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
>
>      /* Physical Memory Protection */
> -    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
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

