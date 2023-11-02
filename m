Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873DAC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyNWP-0006HI-K8; Wed, 01 Nov 2023 22:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNWO-0006GJ-10; Wed, 01 Nov 2023 22:33:24 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNWL-0001x1-Qi; Wed, 01 Nov 2023 22:33:23 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-457c057bdb5so235992137.0; 
 Wed, 01 Nov 2023 19:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698892398; x=1699497198; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CekvVYo980rWa1iEgw9YjGggCgw0SxyomD0Xh2zyoO8=;
 b=C+/nkWwbOuSH8oJYFJAFFABmzVdvuL0O8TCmBmGbM9W1joTggouZHBXQBsbNe+gqdW
 TikISXCB46TdnvEm3OGHMU5uBkYzYya8Qg/InvfUcE+/D7bZxJioa1ArOWaNlxuL4gpI
 AChVULkaEEBPuLG6ea5P1+CphpEpp4Ivwk5fDV7SaSRWDsZvwKeL34LgvOrKlaIEiGyY
 oB+MjpY2QIrCqYSgEki1Z2q1bVO3Y0NfXM8xybuD68m7ZcFqdRH1nLFY3QC6ibVlaKBE
 LqwqVhqvEbZ0N2cQixjmWG6Ascqnf3MhNvjnpsyEMbS923hQBzJOAlHw4L4XmRf6KMfL
 u0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698892398; x=1699497198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CekvVYo980rWa1iEgw9YjGggCgw0SxyomD0Xh2zyoO8=;
 b=l6CY7NqbQptezlyw27MbSCp+pbXnLLY1xwC0C5h3itbVN7yHDb93uHNZX5F0VEMmMX
 vEF1i5PrHlCT1OpPoeinODC8mVCnTId5m5BWfoYk3w3VuzRmppchcC8gnhBiVkVnByY7
 u7L8X0THgixuwQ4ZwwzNM50QeDK64pusMuFykuXzkZljNFJPZaZEbXSwWCOhOVMcNsra
 iHnF6VycFiC3+AvvC3yBP5GqPjPUOPXeFsGQnd9YTAyfjGA6LyUzWGTJu6yLwC6O8Xz3
 J1rW7VA27MjvlKBweK4IJJsB49lx6ZCc3duew8K7JJ0ykPoPCMmaAD+t4x2prZ1M6piM
 YGfw==
X-Gm-Message-State: AOJu0YznfxDKcVimy+lwU6zYENrNijmAoBRyjntzjJvRkyrPOt7LBL1D
 y8AymTiqvcNnPr3CcbgwI7GgnJJRAlFUezxFqbA=
X-Google-Smtp-Source: AGHT+IGKBU8BL5HaS+Gsb2oYzsy1GC+wvTZ2U3UL9y+8RUyGdQE7uy4nl6RKWGmMPJTmanDLgQRiEu7okiaTEftORpQ=
X-Received: by 2002:a67:c087:0:b0:457:5eb4:6966 with SMTP id
 x7-20020a67c087000000b004575eb46966mr17175787vsi.17.1698892398371; Wed, 01
 Nov 2023 19:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231101204204.345470-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 12:32:51 +1000
Message-ID: <CAKmqyKNnKx1hcgpo0supywmkLFFznTeT0zgyTWMMDEsWcK9i+g@mail.gmail.com>
Subject: Re: [PATCH v8 01/19] target/riscv: create TYPE_RISCV_VENDOR_CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Thu, Nov 2, 2023 at 7:53=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We want to add a new CPU type for bare CPUs that will inherit specific
> traits of the 2 existing types:
>
> - it will allow for extensions to be enabled/disabled, like generic
>   CPUs;
>
> - it will NOT inherit defaults, like vendor CPUs.
>
> We can make this conditions met by adding an explicit type for the
> existing vendor CPUs and change the existing logic to not imply that
> "not generic" means vendor CPUs.
>
> Let's add the "vendor" CPU type first.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 30 +++++++++++++++++++++---------
>  2 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index f3fbe37a2c..7831e86d37 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -24,6 +24,7 @@
>
>  #define TYPE_RISCV_CPU "riscv-cpu"
>  #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
> +#define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
>
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f40da4c661..822970345c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1725,6 +1725,13 @@ void riscv_cpu_list(void)
>          .instance_init =3D initfn               \
>      }
>
> +#define DEFINE_VENDOR_CPU(type_name, initfn) \
> +    {                                        \
> +        .name =3D type_name,                   \
> +        .parent =3D TYPE_RISCV_VENDOR_CPU,     \
> +        .instance_init =3D initfn              \
> +    }
> +
>  static const TypeInfo riscv_cpu_type_infos[] =3D {
>      {
>          .name =3D TYPE_RISCV_CPU,
> @@ -1742,21 +1749,26 @@ static const TypeInfo riscv_cpu_type_infos[] =3D =
{
>          .parent =3D TYPE_RISCV_CPU,
>          .abstract =3D true,
>      },
> +    {
> +        .name =3D TYPE_RISCV_VENDOR_CPU,
> +        .parent =3D TYPE_RISCV_CPU,
> +        .abstract =3D true,
> +    },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>  #if defined(TARGET_RISCV32)
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_in=
it),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_IBEX,        rv32_ibex_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E31,  rv32_sifive_e_cpu_init=
),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_=
init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init=
),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init=
),
> -    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init)=
,
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init=
),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U54,  rv64_sifive_u_cpu_init=
),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SHAKTI_C,    rv64_sifive_u_cpu_init=
),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_in=
it),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_ini=
t),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>  #endif
>  };
> --
> 2.41.0
>
>

