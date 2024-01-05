Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FD6C47074
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:44:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLaC7-0002Re-1T; Thu, 04 Jan 2024 21:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaC5-0002R4-48; Thu, 04 Jan 2024 21:44:21 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaBz-0007uk-8E; Thu, 04 Jan 2024 21:44:19 -0500
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4b77c844087so105215e0c.1; 
 Thu, 04 Jan 2024 18:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704422653; x=1705027453; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGYcEli+F0JI63m/VflcnX/9JBGcwCJpIQJrf8kM0ic=;
 b=WHJv0R8RA9TwKQt1kSogD02TUTLgp5x033yNPng5rJ9Ec/hDQYWf9lm+Rs1g18vyHN
 HcGWtgoBhgAOCaHvUgEp+HYghuEGbMWy2IKeymo/NZpolQ8LZJe10T+hCl+0QdBXjhzd
 CmyDw1VorD6p8hJ8ccjwghKfSMSydfVsoLOjweGo/Bj8XJIwBiZjjXFvU3lu9n/b+ykG
 HnEl8kua4BtV8kN2rz0dmygALR8U/59N/Gd0mwN1A4UeekSi/16IWLVGSKIUASmihT2d
 FRxK+7VlDJhfXBjmpXlUKEGAue39PmS4l+PyY1WjqlP4jUbwu1X5OkqfiMuz/+jXLeVk
 wDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704422653; x=1705027453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGYcEli+F0JI63m/VflcnX/9JBGcwCJpIQJrf8kM0ic=;
 b=Jkq0MLwmovF8RIDwGtt8WjqcS2j+ZNM7wRcEJ3T8SUhQlPTII4Zbrd+DS+CFseJphf
 5/DTg/91YcIWwhKH2uCtL7zqn4QlamFFkdWYnoMdO7mOE5M9LCbvyPFDBTqE9neGfKq1
 yKJqH3Dw6Pv+NPNoQ70Dm/OSSgyJ0UIMOuDPlzvl3SWbYNUABUFqg2jYIPSLn2qy38tL
 P46KaNXhq5y9+lI5VtD0fBj5Aqi1M0Y6GOKK15zKs8fKUvFep8aflor2IvqPGPYZoiH+
 V7qn+l+Fn9cajFNg3Q6Bx09uD1H+APfj5IaJSrB6Iz6zJxmkKzmYh6YOt2W1Ei+G7tcs
 nP9Q==
X-Gm-Message-State: AOJu0Ywf7Meyy0ZHVTo/qT2mgWncNXwKKYnJHfAodh+705LMSzEnvvFj
 NKXZe8yzj+InIz41XkBFwob+BfjympPc5NzO9PF+oSx0
X-Google-Smtp-Source: AGHT+IHrGHnUDI2oKnA5Kc7PiaJaF6Z5oJ+gQlhew/zhW9gj+YdQ/rgy+A884b2iA0ie75PHHj8HqU1FnYdd7byFTwI=
X-Received: by 2002:a05:6122:3bd1:b0:4b7:41f2:9ea7 with SMTP id
 ft17-20020a0561223bd100b004b741f29ea7mr1218086vkb.11.1704422653387; Thu, 04
 Jan 2024 18:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20231229004929.3842055-1-atishp@rivosinc.com>
 <20231229004929.3842055-2-atishp@rivosinc.com>
In-Reply-To: <20231229004929.3842055-2-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:43:47 +1000
Message-ID: <CAKmqyKOa7fE3zgAzb9m4yzYKcAaw0M8o+6jAuWpfj9pnVVwjgA@mail.gmail.com>
Subject: Re: [v2 1/5] target/riscv: Fix the predicate functions for
 mhpmeventhX CSRs
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Fri, Dec 29, 2023 at 10:51=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> mhpmeventhX CSRs are available for RV32. The predicate function
> should check that first before checking sscofpmf extension.
>
> Fixes: 14664483457b ("target/riscv: Add sscofpmf extension support")
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 67 ++++++++++++++++++++++++++--------------------
>  1 file changed, 38 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a5336..283468bbc652 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -224,6 +224,15 @@ static RISCVException sscofpmf(CPURISCVState *env, i=
nt csrno)
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException sscofpmf_32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return sscofpmf(env, csrno);
> +}
> +
>  static RISCVException any(CPURISCVState *env, int csrno)
>  {
>      return RISCV_EXCP_NONE;
> @@ -4972,91 +4981,91 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent,
>                               write_mhpmevent                           }=
,
>
> -    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscofpmf,  read_mhpmeve=
nth,
> +    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscofpmf_32,  read_mhpm=
eventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
> -    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscofpmf,  read_mhpmev=
enth,
> +    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscofpmf_32,  read_mhp=
meventh,
>                               write_mhpmeventh,
>                               .min_priv_ver =3D PRIV_VERSION_1_12_0      =
  },
>
> --
> 2.34.1
>
>

