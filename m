Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1087EC47073
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:46:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLaE0-0003JC-K0; Thu, 04 Jan 2024 21:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaDy-0003IV-0a; Thu, 04 Jan 2024 21:46:18 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaDs-0008IL-EB; Thu, 04 Jan 2024 21:46:17 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7cbdd011627so367495241.3; 
 Thu, 04 Jan 2024 18:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704422770; x=1705027570; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yW85sg0dA766UAWwr0J+Y2nQ5BSWXcHrlIelXrTGhaw=;
 b=As76g4kLIJtocfbKQGMbC1wN0DQ8cIQRIvfps04GavmOgvVSrsDOlLZITjFPJeTQ4j
 +itUfeyTbJJSpAGIfbxE96XT4hRZLXjqgApZ3m8Ucpc18qXdFAj6RdV/co27lLjD11wD
 cQ1bF98Q5gb7Gt/Y77MOsnM00156+iyHkGpwoq+9O6blAuxkD94PQpOyoW//IJ1SCpxa
 tzKraqOgz2SUiyGH9PzjFawR+Dfang+so0vacgh38dGzzvRzgd3F8d24BNj1+63I7IZ3
 USTSKjZBB6WAupwaRhZTNMv5zSm1q6v5nYs8R96uwn0S1lPyrNhDp1yPuOupT0khPIne
 wCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704422770; x=1705027570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yW85sg0dA766UAWwr0J+Y2nQ5BSWXcHrlIelXrTGhaw=;
 b=w/3TlPIBGowfpn6lZxYdRZnF2+jxUaUk/tPc1j2N7CfGao0x/EqsUPvLBZ10nZddFZ
 ucaeZquOCe1zA+ozyWCeF5+c1kGia9zJ0XyvMNKe5le5VrS3a5iE2jsUaR1XkRpNT7r7
 gaz/MQUJ1K22Eghqloc4Ub8jkYghtXoG2mAiYzJ4Rf8ONJYxglp63mwe+kvudZuTy4kM
 eswM38Br1oR4T7SllziL5UbLF04P82eE2h5UmrjNGzq5I9JhLVUnXlUlaDrI7fYRYf3V
 VNV/NPPVN4OVDFWVeCc177dmLtsFB6r5ExdN/CiA+udvo8jlTmTlRuv8f8+BGHVSdx1C
 CMhg==
X-Gm-Message-State: AOJu0Yw0GvS34wA5plF6GasCtBN/uPIO1UrST8uXA25wfB4Yttwk5yn3
 tVBhd1sz1u/VvuAdAy8JvrQ7IUee1KDLNqCRpMU=
X-Google-Smtp-Source: AGHT+IHC00LZ4oAf6E2ks0HYvl/eDjbtMjUF0Sep/jSJn4Szorf3yVvmNVBmpWazZQJR+NOIZRg9/Up3lZHCTpDmKQY=
X-Received: by 2002:a05:6102:6688:b0:467:17ca:bef3 with SMTP id
 gw8-20020a056102668800b0046717cabef3mr1630281vsb.8.1704422770750; Thu, 04 Jan
 2024 18:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20231229004929.3842055-1-atishp@rivosinc.com>
 <20231229004929.3842055-4-atishp@rivosinc.com>
In-Reply-To: <20231229004929.3842055-4-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:45:44 +1000
Message-ID: <CAKmqyKP9cYeiw83qY2GbrRquDi5_rSvCKbAmoxi91MfgHCfL6Q@mail.gmail.com>
Subject: Re: [v2 3/5] target/riscv: Add cycle & instret privilege mode
 filtering definitions
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Fri, Dec 29, 2023 at 12:08=E2=80=AFPM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>
> This adds the definitions for ISA extension smcntrpmf.
>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c      |  1 -
>  target/riscv/cpu.h      |  6 ++++++
>  target/riscv/cpu_bits.h | 29 +++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index da3f05cd5373..54395f95b299 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1297,7 +1297,6 @@ const char *riscv_get_misa_ext_description(uint32_t=
 bit)
>  const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> -    DEFINE_PROP_BOOL("smcntrpmf", RISCVCPU, cfg.ext_smcntrpmf, false),

Can you explain why you are removing this in the commit message?

Alistair

>      MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>      MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>      MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361be641..34617c4c4bab 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -319,6 +319,12 @@ struct CPUArchState {
>
>      target_ulong mcountinhibit;
>
> +    /* PMU cycle & instret privilege mode filtering */
> +    target_ulong mcyclecfg;
> +    target_ulong mcyclecfgh;
> +    target_ulong minstretcfg;
> +    target_ulong minstretcfgh;
> +
>      /* PMU counter state */
>      PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917d490a..0ee91e502e8f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -401,6 +401,10 @@
>  /* Machine counter-inhibit register */
>  #define CSR_MCOUNTINHIBIT   0x320
>
> +/* Machine counter configuration registers */
> +#define CSR_MCYCLECFG       0x321
> +#define CSR_MINSTRETCFG     0x322
> +
>  #define CSR_MHPMEVENT3      0x323
>  #define CSR_MHPMEVENT4      0x324
>  #define CSR_MHPMEVENT5      0x325
> @@ -431,6 +435,9 @@
>  #define CSR_MHPMEVENT30     0x33e
>  #define CSR_MHPMEVENT31     0x33f
>
> +#define CSR_MCYCLECFGH      0x721
> +#define CSR_MINSTRETCFGH    0x722
> +
>  #define CSR_MHPMEVENT3H     0x723
>  #define CSR_MHPMEVENT4H     0x724
>  #define CSR_MHPMEVENT5H     0x725
> @@ -885,6 +892,28 @@ typedef enum RISCVException {
>  /* PMU related bits */
>  #define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
>
> +#define MCYCLECFG_BIT_MINH                 BIT_ULL(62)
> +#define MCYCLECFGH_BIT_MINH                BIT(30)
> +#define MCYCLECFG_BIT_SINH                 BIT_ULL(61)
> +#define MCYCLECFGH_BIT_SINH                BIT(29)
> +#define MCYCLECFG_BIT_UINH                 BIT_ULL(60)
> +#define MCYCLECFGH_BIT_UINH                BIT(28)
> +#define MCYCLECFG_BIT_VSINH                BIT_ULL(59)
> +#define MCYCLECFGH_BIT_VSINH               BIT(27)
> +#define MCYCLECFG_BIT_VUINH                BIT_ULL(58)
> +#define MCYCLECFGH_BIT_VUINH               BIT(26)
> +
> +#define MINSTRETCFG_BIT_MINH               BIT_ULL(62)
> +#define MINSTRETCFGH_BIT_MINH              BIT(30)
> +#define MINSTRETCFG_BIT_SINH               BIT_ULL(61)
> +#define MINSTRETCFGH_BIT_SINH              BIT(29)
> +#define MINSTRETCFG_BIT_UINH               BIT_ULL(60)
> +#define MINSTRETCFGH_BIT_UINH              BIT(28)
> +#define MINSTRETCFG_BIT_VSINH              BIT_ULL(59)
> +#define MINSTRETCFGH_BIT_VSINH             BIT(27)
> +#define MINSTRETCFG_BIT_VUINH              BIT_ULL(58)
> +#define MINSTRETCFGH_BIT_VUINH             BIT(26)
> +
>  #define MHPMEVENT_BIT_OF                   BIT_ULL(63)
>  #define MHPMEVENTH_BIT_OF                  BIT(31)
>  #define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
> --
> 2.34.1
>
>

