Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB1BEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9Hj-0007QT-QE; Thu, 13 Jul 2023 23:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9Hh-0007K1-Ls; Thu, 13 Jul 2023 23:15:57 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9Hg-00066U-4O; Thu, 13 Jul 2023 23:15:57 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-44357f34e2dso570097137.3; 
 Thu, 13 Jul 2023 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304555; x=1691896555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4w7muP1aSLmrQ3IKHWExjcoefXU4XwSFU3AbtHrsow=;
 b=QQr7Fuf6VCigY89EShOJ0ENtKv+0W+Xz9koXcU01mPaRt74itntz5DIDpmt9B6axW8
 R8YwWAZe46kZPi4JUOUrk5ith+GXh2/fsBf8W3jxbPN1gvlxNP2mFxY9oL/N0Fsfx+ie
 e0zuuyHbB1Hk+NLZmcyuxoNo2sGvrGSHd7Hwf4VQw730Yd3zgTv9LOiHIM5togp4Vjeu
 mumb2+9N9k/vLHO17b5UBc4ZhHUPgiFBeAE/ycWdxHFQvuXqS9Ady502uVqHPzDBSePo
 N4KNYFOZdUV6q4yQZzp1ZjK/X2pB805ANgp8aLbQEN4zjpYpPaf62E4xxI8hdIzHk+9h
 Gp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304555; x=1691896555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4w7muP1aSLmrQ3IKHWExjcoefXU4XwSFU3AbtHrsow=;
 b=aeSX7e/XxWTI1V+MkHvtnPGJNM/dhN+ybk1+U8hlGSu3Rrt/9I6rcpTFOvTxwBqsuY
 ReRtMIMmUs4bHLApN/XlA6rbH/xAYuHJMDwKg4dE5xYsERsHUySAkKBVgc4cOiSkCJOc
 Hl5QnHC6ef8lCZTxchfMzJ0dcbMv7PhNYTXU93GOtdu6GKFxwOHvixOIwCqn/iaqDGkP
 HazOUyebaGXtzPizS/jd2xvBBCCkmwmsg9BcMtr2R3SjvZRBN7K4VG6TCH1v6Fx37l/t
 +LXRuvBlqeuV3m1QvDtCCmB9Vz6gkM3ZNMK19Og78pE5zcaXqxNvDmQNxby4bVT8OZPH
 UP8A==
X-Gm-Message-State: ABy/qLao4FZufbY0Ymd4Sj16xbab0X60l3VEeU/vv7L5q+IvgY6l6LOS
 mO7Ncc04B6ZV0hnw4bVkRCL7V4sik7+cuzDFZYk=
X-Google-Smtp-Source: APBJJlEP+qvIhuOniBYU5SemnqB1gTp6OB40EtQgzVrwYmA/pFIw5X106EXn7Ke1ldU0dtAKl5d61RsRKZ3qfrO5AN8=
X-Received: by 2002:a67:f5ce:0:b0:443:7bbc:e397 with SMTP id
 t14-20020a67f5ce000000b004437bbce397mr2612726vso.26.1689304554937; Thu, 13
 Jul 2023 20:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230712205748.446931-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:15:28 +1000
Message-ID: <CAKmqyKMnnLwEQmCyH2fy0mjhtPKs29H9gyHP3-cu8NsnpRDZDg@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v2 4/7] target/riscv/cpu.c: split non-ratified
 exts from riscv_cpu_extensions[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
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

On Thu, Jul 13, 2023 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new riscv_cpu_experimental_exts[] to store the non-ratified
> extensions properties. Once they are ratified we'll move them back to
> riscv_cpu_extensions[].
>
> Change riscv_cpu_add_user_properties to keep adding them to users.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bbdc46126..c0826b449d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1808,21 +1808,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>      DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
>
> -    /* These are experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> -
> -    /* ePMP 0.9.3 */
> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> -    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> -    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> -
> -    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
> -    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> -
> -    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
> -    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
> -    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
> -
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -1843,6 +1828,25 @@ static Property riscv_cpu_vendor_exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/* These are experimental so mark with 'x-' */
> +static Property riscv_cpu_experimental_exts[] =3D {
> +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> +
> +    /* ePMP 0.9.3 */
> +    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> +    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> +
> +    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
> +    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> +
> +    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
> +    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
> +    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>
> @@ -1927,6 +1931,10 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>      for (prop =3D riscv_cpu_vendor_exts; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    for (prop =3D riscv_cpu_experimental_exts; prop && prop->name; prop+=
+) {
> +        qdev_property_add_static(dev, prop);
> +    }
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

