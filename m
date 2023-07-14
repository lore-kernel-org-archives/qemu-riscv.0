Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B37EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:14:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9G4-0005ye-VV; Thu, 13 Jul 2023 23:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9G2-0005xo-IA; Thu, 13 Jul 2023 23:14:14 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9G0-0005bH-W6; Thu, 13 Jul 2023 23:14:14 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-44363f4f128so955557137.1; 
 Thu, 13 Jul 2023 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304451; x=1691896451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLIEWhp4a9NvC9h4ACDghSdqa5i9EJYMdO2jnwhc7uI=;
 b=YOQHtb8sUD7Xcqwr+WgWODVZkdsmvxpE6kbnuUEEIbVGPL5UcplFNEYJJKb14uYRAl
 33odt9z9Wg0FMoSNYlw4C/iUvH0Om35n9TwsniVr1TGrSVHFePH3DIiVzvnMfhhPr78C
 zEyNlObtxpXi+dCr+Eyo+G22/d9vBpiBJG5dBzuIPWwu6QIL44ae8u9FVaU9Gj12i6Bn
 zLX7ikLWdslU/85+sfbIIsqXwOZsLkD/4gr/vLMx7BJgiKhfqohXjwhsScr4sP5uor6Y
 jASb0I5RnGwBCxDzu4geMhXjvv/a3Rkkx5tBMOoNx5d1Jn1id7pc7RjWf7wEeOHd+1sE
 O18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304451; x=1691896451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLIEWhp4a9NvC9h4ACDghSdqa5i9EJYMdO2jnwhc7uI=;
 b=F6ImzwYgA9U/i+KYesTIW+30j+yJbFTTQCqrq6jeTsQ1XECEs4mnB5FmsMZQ3q/iAL
 Fxo6D3g7rJxBMjf4HEtf4EnFpCVcdEoNiq6YFni1G/v6+7ZXS9t5zyD/QUtrFbNx0FAz
 PwbqQgZnu97fM29lR7JPVu1RGl5R0Mxsp2Q2PL2ZPGBsBJpbFyuvu3/LX30UL/D6/gH8
 iab7ra/HVw7NAkY4c+K6rJjbkM2TYNfiSOf6AqOO/m+1FYUl/avsHkCkjnENfrsodjQt
 p0xEXYK7Y6WwU4/8wEcjbM2B29ldGPPH2+1wYRxsumMHnWJGrSmrpgrTNW9Vp4nePsIo
 KRQA==
X-Gm-Message-State: ABy/qLYal4Qqs6VXHSdG6Asc4W7lSry3Bb/AImOYp0AZvMw+7wMm+cSz
 WGaKTNezlY2u2ZV2qvQICNIT1PJbdyh14e5gz9A=
X-Google-Smtp-Source: APBJJlHgmQ71a5TjnnjyiZW2zmtZrGWPhYFskOs1D3FHcmL128jm4Gh3HwdGjtdzatXxvzOZkpJfnc6YB99aRbahwsI=
X-Received: by 2002:a67:db0d:0:b0:443:61f7:3ce with SMTP id
 z13-20020a67db0d000000b0044361f703cemr432917vsj.15.1689304451599; Thu, 13 Jul
 2023 20:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230712205748.446931-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:13:45 +1000
Message-ID: <CAKmqyKNdcU=9_Jg1qhTiTM1yF4sn+WcSUAZmjsdoJRJQVHUOZg@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v2 1/7] target/riscv/cpu.c: split CPU options from
 riscv_cpu_extensions[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Thu, Jul 13, 2023 at 6:59=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll add a new CPU type that will enable a considerable amount of
> extensions. To make it easier for us we'll do a few cleanups in our
> existing riscv_cpu_extensions[] array.
>
> Start by splitting all CPU non-boolean options from it. Create a new
> riscv_cpu_options[] array for them. Add all these properties in
> riscv_cpu_add_user_properties() as it is already being done today.
>
> No functional changes made.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..cdf9eeeb6b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1751,7 +1751,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> @@ -1767,11 +1766,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> -
>      DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
>      DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> @@ -1802,9 +1796,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
>      DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
> @@ -1848,6 +1840,20 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static Property riscv_cpu_options[] =3D {
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +
> +    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +
> +    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
>
>  #ifndef CONFIG_USER_ONLY
>  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> @@ -1916,6 +1922,11 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>  #endif
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
> +    }
> +
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

