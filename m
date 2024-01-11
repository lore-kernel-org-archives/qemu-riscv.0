Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32611C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:04:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO46Z-0005QV-TS; Thu, 11 Jan 2024 18:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO46X-0005No-2M; Thu, 11 Jan 2024 18:04:54 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO46V-0002UF-B4; Thu, 11 Jan 2024 18:04:52 -0500
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7ce415b5492so1593926241.0; 
 Thu, 11 Jan 2024 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705014289; x=1705619089; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdnXCRxBG9Q+R+MMeTIm4iMKCv4PIp+PzlTODNwhW4s=;
 b=CofRkk6r/TWdFriFmvKpe/D89jODzRwwOXC+9RPIqCUCjigbt3AScmN7MhW0uz4XCm
 VsS247iMuFT4jfSaGv1869IcWmtOdfB+OA0QQJaxX1b/UbrhaWO/sbJdQw+rFMAW3qSJ
 UXbeoaa/E/2WMx9cwqmrjlTJnfz8xvAZQ6Dh8Wvz4pmCGLwcWacVd2XbcEzRcYe/jH8W
 XRW3qZ2GG82P2IxbQmPiNT5SHD2K9TVFg5mFNpstk91+Lyj3D5quaUKc6EDxxkxSlAza
 mQrrYIoxYawFT+3sO8vqfP1IjJQQ14zRtbRdDFhBk0fVeYVQATlW3JaFWXNvfdx9Zbk6
 iWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705014289; x=1705619089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdnXCRxBG9Q+R+MMeTIm4iMKCv4PIp+PzlTODNwhW4s=;
 b=VUOA4Aw+LHj+4oWVv73s325jb4V7gch/yncueybH/g6V29j5d+D62zoHjfiCXHvKex
 kCBLCeWGWFFqwqgZxgxp5vMEtgR29ndCBtn3suKTnD50pURRxSmOYG420vbte6Y/Q7uC
 4qBN/eh4lFgigok9T9UiEdR5BMGSw3fQhPAqTJ9zp52vZPHI2Gsr/s7uaIEmFK1JOpBW
 pzIVtz/ivmDU0+4y7hkCGVw8t1qkFR5Dptz/As5dWNeMztJANeKrgf0Cy/hstDAR8fOn
 MuOZPYIboDdV56eNkMe0HC6nzAGhm6uz7+39RJ0DVUylUQY/GI48yA1fOCsOnbjxKArk
 vR4g==
X-Gm-Message-State: AOJu0YyiTWTU1sCfyRgT1xFR5/n/sZEXEOznp23iiljbnOMcEfbs3Eem
 fd0CzNLvf5Dt1qiIulEf/2Kr+f0vHptW73rAgok=
X-Google-Smtp-Source: AGHT+IE/NN7zlEJUp46rhZmD6Q8Si22wD4tHXcxlxSE9gvP7PYl8kbRumZxSwDDiI+3tm2dymdJgQjjUHhSsCYzjXJQ=
X-Received: by 2002:a05:6122:1194:b0:4b8:8ae:20e9 with SMTP id
 x20-20020a056122119400b004b808ae20e9mr512482vkn.5.1705014289393; Thu, 11 Jan
 2024 15:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20240111161644.33630-1-rbradford@rivosinc.com>
 <20240111161644.33630-3-rbradford@rivosinc.com>
In-Reply-To: <20240111161644.33630-3-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:04:23 +1000
Message-ID: <CAKmqyKNwkGh+ZRip10i4PiwA_Q33ic8afO=LGLT6ESKJGwLOMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add step to validate 'B' extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Fri, Jan 12, 2024 at 2:17=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> If the B extension is enabled warn if the user has disabled any of the
> required extensions that are part of the 'B' extension. Conversely
> enable the extensions that make up the 'B' extension if it is enabled.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5396c6c3eb..b5ba78240e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -442,6 +442,35 @@ static void riscv_cpu_validate_g(RISCVCPU *cpu)
>      }
>  }
>
> +static void riscv_cpu_validate_b(RISCVCPU *cpu)
> +{
> +    const char *warn_msg =3D "RVB mandates disabled extension %s";
> +
> +    if (!cpu->cfg.ext_zba) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
> +            cpu->cfg.ext_zba =3D true;
> +        } else {
> +            warn_report(warn_msg, "zba");
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zbb) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
> +            cpu->cfg.ext_zbb =3D true;
> +        } else {
> +            warn_report(warn_msg, "zbb");
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zbs) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
> +            cpu->cfg.ext_zbs =3D true;
> +        } else {
> +            warn_report(warn_msg, "zbs");
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -455,6 +484,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          riscv_cpu_validate_g(cpu);
>      }
>
> +    if (riscv_has_ext(env, RVB)) {
> +        riscv_cpu_validate_b(cpu);
> +    }
> +
>      if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
>          error_setg(errp,
>                     "I and E extensions are incompatible");
> --
> 2.43.0
>
>

