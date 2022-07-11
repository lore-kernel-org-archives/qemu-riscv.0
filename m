Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAn8V-0007vs-2E
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 02:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAn8T-0007uF-NE; Mon, 11 Jul 2022 02:43:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAn8R-00054I-6r; Mon, 11 Jul 2022 02:43:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 70so4013589pfx.1;
 Sun, 10 Jul 2022 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sawetzeTVPRW5jZTEOmFYqcy9iWYCJPT9d2QKfSNeoM=;
 b=EXWoYm9+eANBs4gSxHB0xiTzDIAumJ+dE/pGE1tSdAsNkUcfb0iEfzJbt5pEQ4O2le
 qCHRXTlY1x/mHb9OK6hDh8gJWixcAdz7L/tjGd8hQ48glAoAofYX9inJXTQ4PUWLKxXk
 CBFYOAYKcb7zkRnmhlt9KqF1RtCtZx482Tbx5ZBFhmnlTzBGgkZ9puzK+XObOBtH77Sw
 tjIfiLiAGMGBmypswX6v9D0UD7U+dp3YjZVxzO2Ftoor95lm05BYzTYSV57LqDOq8DMO
 2JoZ8CJGz1BTi95yzJ2Hf/XVqvVlout+BAMklR2K9OyTM8rFEXPK+vtcwzx4toUT+YmI
 RPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sawetzeTVPRW5jZTEOmFYqcy9iWYCJPT9d2QKfSNeoM=;
 b=0EkIa3fLmHRG7N5VJHwKB6xjedXP+xy3/xWIOyrNftVMZZaHCPAy4vxLHiEU7j4IfU
 V1SfmPiM2piSi2yrfNf09yANeQzCPEeX0zh7krJfddIFAguWrhSTuqVH7AdBQu9p+anm
 i76XgERc+HHDLY3JHig51HjdL8eH5354fIidl1/IRaX6O3TI8xKT4fUN1ewD8fnJm9s4
 0/S/MffqPE028XCEzgfjSBGufWKaQ9rmYx3UefvHCY3Ysh9w620R0Jep4D+zP4E3ZBS9
 7HsPlphC7S4HMFUDZmWNNDGinttWdz5hvJpaCoevXmkDQKwkVCvLcquPXS97C4Fsmbjx
 CSjg==
X-Gm-Message-State: AJIora+AMl1L94IfDN2tCKu/boqtDgNgR5EfHiwHmX0UYi8Pd6Ys12+c
 7ohePm02iPMScjR7Lum5tPe8j7+C0+5toHlIq90=
X-Google-Smtp-Source: AGRyM1tE3dORyaPTM9jG07uu3XiDyhAnG89WlqYFClHEXtYCM4C4WLXSqRNXqkOSiEzqnuE/C66jpqOtuFX4UtDmpn4=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr14443249pgw.223.1657521789461; Sun, 10
 Jul 2022 23:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 16:42:43 +1000
Message-ID: <CAKmqyKPbuNw1LSkj1CbfRRHHGJDhSHi1nD+RcfkX+DiE7fBSWg@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/riscv: add check for csrs existed with U
 extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 06:43:13 -0000

On Sun, Jul 10, 2022 at 6:28 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add umode/umode32 predicate for mcounteren,menvcfg/menvcfgh
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9bda1ff993..0d8e98b7a9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -339,6 +339,25 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
>
>  }
>
> +static RISCVException umode(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_has_ext(env, RVU)) {
> +        /* User extension is supported */
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
> +static RISCVException umode32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return umode(env, csrno);
> +}
> +
>  /* Checks if PointerMasking registers could be accessed */
>  static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>  {
> @@ -3521,7 +3540,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,  write_medeleg },
>      [CSR_MIE]         = { "mie",        any,   NULL,  NULL,   rmw_mie       },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,    write_mtvec   },
> -    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
> +    [CSR_MCOUNTEREN]  = { "mcounteren", umode, read_mcounteren,
>                                                 write_mcounteren             },
>
>      [CSR_MSTATUSH]    = { "mstatush", any32, read_mstatush, write_mstatush  },
> @@ -3554,9 +3573,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
>
>      /* Execution environment configuration */
> -    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> +    [CSR_MENVCFG]  = { "menvcfg",  umode, read_menvcfg,  write_menvcfg,
>                                      .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> +    [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
>                                      .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
>                                      .min_priv_ver = PRIV_VERSION_1_12_0 },
> --
> 2.17.1
>
>

