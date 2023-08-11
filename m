Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31E2C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTVY-0007sk-1Y; Fri, 11 Aug 2023 10:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTVW-0007sU-EI; Fri, 11 Aug 2023 10:52:54 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTVU-0002KV-31; Fri, 11 Aug 2023 10:52:53 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-447d6748aacso858501137.1; 
 Fri, 11 Aug 2023 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691765570; x=1692370370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KR+K1ogNKTgiU1MOHnrT9PbEcEfeuQAEv2S47izRJQ0=;
 b=U9glT+jxbq8Ips1fW7ItXofK1fGxReX7nq3DVRsdzN8k53Whw2BBdLBXdxRALXx+VP
 fNPB1/tdkeNZD0j5GhrvYG5oGSDG+PfpPo2tJ/Reao6erBk7FPnEnG9Xsfty4LcevFs1
 PwlU3eWoB2aGJAjuOpmwsljhOmc969SqT24mh6L3x6iM9AFLLXhzidRVAkqQyAcsLoxL
 oajuL//pUHcT6ynwbFOyTEcs1NFffcOqIlcnTHB1f4vBdHdMVISzMaf6KkzO7t++///o
 qPHHQ0uBXhxItaBdqTiZ5eLzjpHND1vmLONMVkUpeIyXsWJxnE+g+HSmGxsYUVDubTWt
 PSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691765570; x=1692370370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KR+K1ogNKTgiU1MOHnrT9PbEcEfeuQAEv2S47izRJQ0=;
 b=RlEyOqAUSP2byb3l82/i069e+AhLMQf1LGhRIZA9C/zA100jiS8kIkhmzFK51ir1o0
 Bhv5IvZb9qW2X/WEtB+P3r6vBKw6iv8waR+o/Dg14a35uDi+ez3CnC299mz7CDbfCeEh
 CwbgZklI0oTQAzIoqkAgiHUZvDeKnRHONdE1sc8Zzrr/rs8/5MZCzEMSb7xPbyaW8pUD
 Lw/sXZr01L9Bl74sFu3/5tM22FGoex+VbxyexGIXOzSn1CPQqaJGEGhqFyXh2PQl+Dnq
 U5JJtNnlVQrLHLLi2CbPoavVxWY6Bfz4/f4yB9kaUnKqSuQXkRK0vKGCccSUH/4tVZeB
 lRGw==
X-Gm-Message-State: AOJu0YyTeodth54TFjgFL19AwK7QeJg9cGOIzmW8CkbTK/ajlXFL5NER
 dTAghLtd98JXh2NDmRg/FszLM0nEdkc8ZJ6mih0=
X-Google-Smtp-Source: AGHT+IEGZGaDxt6zkF56qrV1zzst788F2AUzhfm2bWd1vD5XlVP3jo0h8Mm/eleRlyQtyZcgj0qK3XjWUfSsbFCivlI=
X-Received: by 2002:a67:f5cb:0:b0:447:7dc0:e14 with SMTP id
 t11-20020a67f5cb000000b004477dc00e14mr1642480vso.21.1691765570535; Fri, 11
 Aug 2023 07:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:52:24 -0400
Message-ID: <CAKmqyKPSC1_oT6muzGtFs-sU2Vbrg0K9Vs_QT+661BSrBe09Kg@mail.gmail.com>
Subject: Re: [PATCH 4/8] target/riscv/cpu.c: use cpu_cfg_ext_auto_update()
 during realize()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Jul 28, 2023 at 10:08=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Let's change the other instances in realize() where we're enabling an
> extension based on a certain criteria (e.g. it's a dependency of another
> extension).
>
> We're leaving icsr and ifencei being enabled during RVG for later -
> we'll want to error out in that case. Every other extension enablement
> during realize is now done via cpu_cfg_ext_auto_update().
>
> The end goal is that only cpu init() functions will handle extension
> flags directly via "cpu->cfg.ext_N =3D true|false".
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 50 +++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 75dc83407e..88b263e830 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1174,7 +1174,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>      }
>
>      if (cpu->cfg.ext_zfh) {
> -        cpu->cfg.ext_zfhmin =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zfhmin), true);
>      }
>
>      if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
> @@ -1200,17 +1200,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *=
cpu, Error **errp)
>          }
>
>          /* The V vector extension depends on the Zve64d extension */
> -        cpu->cfg.ext_zve64d =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64d), true);
>      }
>
>      /* The Zve64d extension depends on the Zve64f extension */
>      if (cpu->cfg.ext_zve64d) {
> -        cpu->cfg.ext_zve64f =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64f), true);
>      }
>
>      /* The Zve64f extension depends on the Zve32f extension */
>      if (cpu->cfg.ext_zve64f) {
> -        cpu->cfg.ext_zve32f =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32f), true);
>      }
>
>      if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
> @@ -1224,7 +1224,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>      }
>
>      if (cpu->cfg.ext_zvfh) {
> -        cpu->cfg.ext_zvfhmin =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvfhmin), true);
>      }
>
>      if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
> @@ -1254,7 +1254,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>
>      /* Set the ISA extensions, checks should have happened above */
>      if (cpu->cfg.ext_zhinx) {
> -        cpu->cfg.ext_zhinxmin =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
>      }
>
>      if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_z=
finx) {
> @@ -1275,12 +1275,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *=
cpu, Error **errp)
>      }
>
>      if (cpu->cfg.ext_zce) {
> -        cpu->cfg.ext_zca =3D true;
> -        cpu->cfg.ext_zcb =3D true;
> -        cpu->cfg.ext_zcmp =3D true;
> -        cpu->cfg.ext_zcmt =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
>          if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_RV32=
) {
> -            cpu->cfg.ext_zcf =3D true;
> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
>          }
>      }
>
> @@ -1329,26 +1329,26 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *=
cpu, Error **errp)
>      }
>
>      if (cpu->cfg.ext_zk) {
> -        cpu->cfg.ext_zkn =3D true;
> -        cpu->cfg.ext_zkr =3D true;
> -        cpu->cfg.ext_zkt =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkn), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkr), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkt), true);
>      }
>
>      if (cpu->cfg.ext_zkn) {
> -        cpu->cfg.ext_zbkb =3D true;
> -        cpu->cfg.ext_zbkc =3D true;
> -        cpu->cfg.ext_zbkx =3D true;
> -        cpu->cfg.ext_zkne =3D true;
> -        cpu->cfg.ext_zknd =3D true;
> -        cpu->cfg.ext_zknh =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkne), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknd), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknh), true);
>      }
>
>      if (cpu->cfg.ext_zks) {
> -        cpu->cfg.ext_zbkb =3D true;
> -        cpu->cfg.ext_zbkc =3D true;
> -        cpu->cfg.ext_zbkx =3D true;
> -        cpu->cfg.ext_zksed =3D true;
> -        cpu->cfg.ext_zksh =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksed), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
>      }
>
>      /*
> --
> 2.41.0
>
>

