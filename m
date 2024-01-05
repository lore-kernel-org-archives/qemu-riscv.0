Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB4C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:19:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcbi-0003Vd-MB; Fri, 05 Jan 2024 00:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcbg-0003TM-Oz; Fri, 05 Jan 2024 00:18:56 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcbf-00008V-5I; Fri, 05 Jan 2024 00:18:56 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7cd0e4e3da6so452932241.0; 
 Thu, 04 Jan 2024 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431933; x=1705036733; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEX8EfbggQwg5SMmX1UZF4Ha2g9ZGknZpcZUn/MVmhs=;
 b=Rhlcq1AUacAlAUQ1NCv0SWH/HN2BYwQv10116f52yQyQtMZ0RVpG2grqatn6+T+0qE
 DnA1vXLYbk16+Jy0RWgIidc+uT/1J4efrsrXR0gEbXkIhmsLX3SlxpQUyXqljwdtSS70
 mBbFYWx8JRC0lvMiusryVXab125LGibEFCcG2sXctFupnJGPjnRxlYS5H/3onIOEo0N4
 t69xgaN0e1d+E/EVs2VbDsqKfTfbPMpRgo+aNJBXGw1qY1lOmyQ0xPVTdV9SKz1evME/
 b1z27L1932owgAjVsMq18PEHukeuJhOZ2bMJbxbTKNquSA5xmcQliSP43zffnw9m4kkV
 doig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431933; x=1705036733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEX8EfbggQwg5SMmX1UZF4Ha2g9ZGknZpcZUn/MVmhs=;
 b=Ys9xFaP958RWxvJZ1rT9+m2rOV8Hqd6xXA/pIMq/8oOk0AUy0YUyUJOgWDVIRIcEcu
 athQW3BuLHNXYWpMm6hJbQ6ChrOfe7WPDnIGe1yW2qDy5KM6IZDy4wvowpuxpyEodP9j
 kcQz/lM+3H5VsvGV6bcDKkctPxlWkAYOLE+Js8wrfxLu9elZwOZjC1g06cPO9Xl9qD1S
 R7xEvyC80AwawkmbdY5UUE28Tw6FawoXqLOLfit2QyA6o2fQbEg2VBxJiNg50KlLrag3
 S0GGFhI46YI8qhlEMj8pxa8Ytp2JQAIN4YpZmMOUXLOz2XmBp//Wov5UoWSWdGxSrlyf
 NYEw==
X-Gm-Message-State: AOJu0Ywcn1j9kXXFW+WVc0GPYxG5wDJTeOen9+9xv2tgUA2z6zIXrkY/
 pLrAB1rl6a+FAlJ4rwh2jEI9g60qA0VL8nJcevg=
X-Google-Smtp-Source: AGHT+IHDUGkCowPN7A9aAhAGZIqFvjxwL4Fou1wGaiG7P8sldu32JvSzTdODK/wCzeIZ7CAdmqM8tNKmIFfkaQLjDiI=
X-Received: by 2002:a05:6102:2c83:b0:467:b8fa:3a46 with SMTP id
 if3-20020a0561022c8300b00467b8fa3a46mr28545vsb.20.1704431933636; Thu, 04 Jan
 2024 21:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-10-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:17:00 +1000
Message-ID: <CAKmqyKPQEVUXm_t7qkRRMCpgyNojibqM+=sf-f1zUrNHY5drPw@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] target/riscv: move 'elen' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Thu, Jan 4, 2024 at 3:49=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Do the same thing we did with 'vlen' in the previous patch with 'elen'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 44 ++++++++++++++++++++++++++++++++++++--
>  target/riscv/tcg/tcg-cpu.c |  5 -----
>  2 files changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 557874a017..da432e4c1e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1269,6 +1269,7 @@ static void riscv_cpu_init(Object *obj)
>      /* Default values for non-bool cpu properties */
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
>      cpu->cfg.vlen =3D 128;
> +    cpu->cfg.elen =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
> @@ -1775,9 +1776,47 @@ static const PropertyInfo prop_vlen =3D {
>      .set =3D prop_vlen_set,
>  };
>
> -Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +static void prop_elen_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!is_power_of_2(value)) {
> +        error_setg(errp, "Vector extension ELEN must be power of 2");
> +        return;
> +    }
> +
> +    if (value !=3D cpu->cfg.elen && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.elen);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.elen =3D value;
> +}
>
> +static void prop_elen_get(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.elen;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_elen =3D {
> +    .name =3D "elen",
> +    .get =3D prop_elen_get,
> +    .set =3D prop_elen_set,
> +};
> +
> +Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
> @@ -1797,6 +1836,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "vext_spec", .info =3D &prop_vext_spec},
>
>      {.name =3D "vlen", .info =3D &prop_vlen},
> +    {.name =3D "elen", .info =3D &prop_elen},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8ec858e096..84064ef7e0 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -185,11 +185,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env,=
 RISCVCPUConfig *cfg,
>          return;
>      }
>
> -    if (!is_power_of_2(cfg->elen)) {
> -        error_setg(errp, "Vector extension ELEN must be power of 2");
> -        return;
> -    }
> -
>      if (cfg->elen > 64 || cfg->elen < 8) {
>          error_setg(errp,
>                     "Vector extension implementation only supports ELEN "
> --
> 2.43.0
>
>

