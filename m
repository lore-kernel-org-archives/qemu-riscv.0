Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:16:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9HD-0006jV-71; Thu, 13 Jul 2023 23:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9H9-0006gu-9a; Thu, 13 Jul 2023 23:15:23 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9Gr-0005mg-8q; Thu, 13 Jul 2023 23:15:09 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-794779e1044so484820241.2; 
 Thu, 13 Jul 2023 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304503; x=1691896503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpuKHk+9wAMINJwF0l3nRDU3mZvr/z4kF4rivgsRFBg=;
 b=JTNnFAv+OA85MbOHOnvJ5iSaXYBG9SVibdS4VSNyxtpiZh/cZ+NH1BEI3m0I29UmSY
 8xg7CGGoy1hw+HXE11MawW/fSdQcvXHAo8EQ1W+jFeE6MFf387A2ylGFxWqi72LzxMN3
 V9lkYhi7Z7uSoFVl3u+15Q4ITXC882/ApdpirJeiHQMJNR4+l3BwCnJuU1B4vsD+2Rbz
 byaAHs3a3+xAGxsnitdsJeUq7WLnLIRqENh1es4L0268p52PNdxmK5tbY1vPcGTpjoBa
 6nlHpNtwV7WpyfRlinVTtferSGCj9D+om7PHW0n5PX72BHqg55H6gUh9bvNYiCbWxjC7
 Uu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304503; x=1691896503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpuKHk+9wAMINJwF0l3nRDU3mZvr/z4kF4rivgsRFBg=;
 b=UjblTmpLmAdnyul68zdf+FlfCsyVS6saDe87IJpcJds1skao3o2l4Y8pHyUMqj59tX
 B4ffBLDGdrJc0RMz/mSaKmlPYLr043fCwJodg6CJuDkxGWnpYbJ3pZ0HAk6g8hu/tmJs
 mrTSU/y8OfAceEsrfygGTj0vEHzy0iMiJtzAVilQZSIY7hKItqWe46sbIAxdMBaTGvEl
 64p2iwh0t3NcB8S970S8D21IuQiX/JO4OSkpIiJoo3vDtiyoJ4PNsIDumMxcegJGgFKy
 YjUL+gyuJyeiGEeBpi6U/ILmzAVYK8pr1PkTqueGF3D0rdtGlUU8Yw9xSE4cYIrB84l/
 wBog==
X-Gm-Message-State: ABy/qLbdZEZSEDXrncRLd0Dcq641t2TbY25rM6SmmLIw4guxU5NQtPVa
 3JilXOPkNxi5x5P3b6oPM7df5HDk9W+GR7HSMNU=
X-Google-Smtp-Source: APBJJlFs6fjHz5g+mSxBENI7y5MntDrdajkr/Y0eMNR6pq6LhqBktK44ySjIeO6toQN59dWJpLt1Le6XCsj8n7MW1SI=
X-Received: by 2002:a1f:60d3:0:b0:481:30aa:e9e6 with SMTP id
 u202-20020a1f60d3000000b0048130aae9e6mr2170823vkb.12.1689304503086; Thu, 13
 Jul 2023 20:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230712205748.446931-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:14:36 +1000
Message-ID: <CAKmqyKPX7Xa1adY=K2OjcjdzhZW6eE1cWUTeEUuzfbqS_4k2wQ@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v2 3/7] target/riscv/cpu.c: split vendor exts from
 riscv_cpu_extensions[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Thu, Jul 13, 2023 at 6:58=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Our goal is to make riscv_cpu_extensions[] hold only ratified,
> non-vendor extensions.
>
> Create a new riscv_cpu_vendor_exts[] array for them, changing
> riscv_cpu_add_user_properties() accordingly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 735e0ed793..9bbdc46126 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1808,20 +1808,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>      DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
>
> -    /* Vendor-specific custom extensions */
> -    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> -    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> -    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
> -    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
> -    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
> -    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
> -    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
> -    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
> -    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> -
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>
> @@ -1840,6 +1826,23 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static Property riscv_cpu_vendor_exts[] =3D {
> +    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> +    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> +    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
> +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
> +    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
> +    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
> +    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
> +    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
> +    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>
> @@ -1921,6 +1924,9 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>          qdev_property_add_static(dev, prop);
>      }
>
> +    for (prop =3D riscv_cpu_vendor_exts; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
> +    }
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

