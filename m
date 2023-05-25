Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435FEC7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20WX-00012n-Qt; Wed, 24 May 2023 22:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20WV-00012B-SS; Wed, 24 May 2023 22:16:15 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20WT-0008OH-Nx; Wed, 24 May 2023 22:16:15 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-437e4f09268so292348137.2; 
 Wed, 24 May 2023 19:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684980972; x=1687572972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mz0osurIXuTaYUz87+rUGorck+/7kiVCtn54fJ8V1Ok=;
 b=HQbz7FMkBNxpicpMiDDaS8jK3yiGp0Gtdqx6zRDBw3i4R0dUKI8gHQc13jr1PorhNy
 bDJhnJnVazew3A+RGkmgDiHeFmE/KNAaKdcDkNpt1Dfu3O6JJ3loyiKmsdmlP2eaTp7U
 K8d2pe1GInQtZLpDIh8AyYO5L/8s8LfOW1zYonyzTyZ6F7JE8T7tJ5RlmmVpWaQ6f6cv
 2jfcFbD7T7XUg1PvuC9T2khG1YrtpBziNf1i99qXUP3o95WWui/twqsCuMR+FLfeiTwO
 9WQmaacaaIw6wPdi+Fd1aeHZKqUz2dymve+lnSFOGTSe1aFDqkPPvQOhboywTZ+2uJ60
 fBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684980972; x=1687572972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz0osurIXuTaYUz87+rUGorck+/7kiVCtn54fJ8V1Ok=;
 b=bqo3E2m72IAU4BcNaATIJEFYhZTolwf9yhfa8XFNiyw+fNB7ZbSQ5PANap1ETLJZ4y
 4CvS6tVF28tbqTpknlswv5qJzYOu8YRNkh97hzlyUYTyN7UE0EO9pVfsdUSwCWj9G0UV
 e7R6JGziylwTdlknS8bYi4XNURE9GaeAszASEY+nxA2Kgof/QLgoy0d46JkAkE70G+uZ
 O9gCcNL8bO5R/0l8YdSdDsezubHEcRurlNNcK7VTFR2OQg2NWWKSChEZyaeo4uwPot3k
 3Y+Wr9oSqeo24GVBXxmzOYRnAEPI3GxXTfIJXiZMf/3S6tKYpoa9pi7a6puOdfXbJ578
 IuLw==
X-Gm-Message-State: AC+VfDzWRs8vMA01OCGzm2pcq+5P+wmhWdOLTR2gNDJ1z4qAddkt22kI
 owTbGhFfgqtBGpYelwgvrg0wjn0VxeZ7txlqWLI=
X-Google-Smtp-Source: ACHHUZ6MZu6lo3CetjrtXSaRw+W1DjWlGYnDohVkrJn040ntb0v7l3RuItAsXPMA6ZBRmw5e5ZnaLJpeH6NtyXCR1ig=
X-Received: by 2002:a05:6102:18b:b0:439:405a:410f with SMTP id
 r11-20020a056102018b00b00439405a410fmr4222944vsq.15.1684980972202; Wed, 24
 May 2023 19:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230520054510.68822-1-philmd@linaro.org>
 <20230520054510.68822-3-philmd@linaro.org>
In-Reply-To: <20230520054510.68822-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:15:46 +1000
Message-ID: <CAKmqyKNbG-Y70cQTk_K2AoZTKUfdVCEZeQdcQTYEza1X2TZJmQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/riscv/opentitan: Declare QOM types using
 DEFINE_TYPES() macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Sat, May 20, 2023 at 3:46=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. Replace
> the type_init() / type_register_static() combination. This
> is in preparation of adding the OpenTitan machine type to
> this array in a pair of commits.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 2d21ee39c5..294955eeea 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -320,17 +320,14 @@ static void lowrisc_ibex_soc_class_init(ObjectClass=
 *oc, void *data)
>      dc->user_creatable =3D false;
>  }
>
> -static const TypeInfo lowrisc_ibex_soc_type_info =3D {
> -    .name =3D TYPE_RISCV_IBEX_SOC,
> -    .parent =3D TYPE_DEVICE,
> -    .instance_size =3D sizeof(LowRISCIbexSoCState),
> -    .instance_init =3D lowrisc_ibex_soc_init,
> -    .class_init =3D lowrisc_ibex_soc_class_init,
> +static const TypeInfo open_titan_types[] =3D {
> +    {
> +        .name           =3D TYPE_RISCV_IBEX_SOC,
> +        .parent         =3D TYPE_DEVICE,
> +        .instance_size  =3D sizeof(LowRISCIbexSoCState),
> +        .instance_init  =3D lowrisc_ibex_soc_init,
> +        .class_init     =3D lowrisc_ibex_soc_class_init,
> +    }
>  };
>
> -static void lowrisc_ibex_soc_register_types(void)
> -{
> -    type_register_static(&lowrisc_ibex_soc_type_info);
> -}
> -
> -type_init(lowrisc_ibex_soc_register_types)
> +DEFINE_TYPES(open_titan_types)
> --
> 2.38.1
>
>

