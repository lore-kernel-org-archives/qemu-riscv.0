Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61313E7D0CC
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZ8F-0003oH-4t; Fri, 22 Sep 2023 01:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ8C-0003nh-9X; Fri, 22 Sep 2023 01:55:12 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ8A-0000yL-Ai; Fri, 22 Sep 2023 01:55:11 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7ab4c86eeb0so605182241.2; 
 Thu, 21 Sep 2023 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362109; x=1695966909; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+32+uRsd2MWWnpooGmvTcSZhuCTgW5Ll3YP/pKfDroI=;
 b=EUALCzrTeGiAKFIR4aI+Jo6iqpiRkIzRqK5Iqyobc2DWblZgwbeyik0k4f00V7oK0Y
 1pMzPv+lpQaGGnzPxJNQls6v2Fg6nKG37QcJT60KkriBlq4NtDnLOtd2qKvEtvjL2Eqj
 9h30AyhlEFjWzHjdthvVgvgYAy06NcW2wl+GtRpeQndGXLaF8A2M84cNUW+sYmC8VDVf
 j8ZSdm2OeGkAWMo/euT0ZY8Gh1qXdPjupGttOtLYX3VPs9n1xU05e6bIxh3+c8Eg/Dhj
 JqkGB3xd90HySgQ7Y+DHoS7jkX2d0S2SirE3tZUtcH57xe52tpBxMPTxXQHPGrPi7qz8
 vaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362109; x=1695966909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+32+uRsd2MWWnpooGmvTcSZhuCTgW5Ll3YP/pKfDroI=;
 b=k/JMAu2t461bqiDUb3RVYhIE3Dy8mCtgJ0IJeUZTqc1uB5HstUvR9uqw8TUFfSCvGL
 +JdqLH8XiCCnaQqY63jyKW/CD/wf3TXewsy2QOQ0bRfKbIbA6iKEBK+5ye4aX2BkAkxP
 zA0JoL5NlNlpebeIkhhHcQ3JjBAo8p0HLlyy9x7vFJwHbEs7XqxQlurrjRdkctxOtue3
 qJuZ8IDwheT8h6AE4VhbqrUNvtBuOFTN8MjOOGusCZSwa+6j5fsKJ+dgwQYEsc8GgBf7
 5a6/izyA+7dLx+TKm9ZLTf4LtfpEBOCozu2waeeQXT1HkBrIrqvD37voygTUcFuwGBm9
 zZZA==
X-Gm-Message-State: AOJu0YwacohgwJRkYX61nhKMs/qYa+aFw+zjtOhY7PRAyaea/mobLihK
 1f09EL325R+t6LSEU2UMXS1Evey0P9d/CMdsmR8=
X-Google-Smtp-Source: AGHT+IGAmz0Ntx63Zr23icDJcqVqyvVAmtsqijxojoLUg6gIJOX0u3pT1cshreUJfrkulRGeDv4L5pbZ0x//1iRVXEk=
X-Received: by 2002:a05:6102:3a79:b0:452:871e:bd04 with SMTP id
 bf25-20020a0561023a7900b00452871ebd04mr6269632vsb.17.1695362108805; Thu, 21
 Sep 2023 22:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:54:42 +1000
Message-ID: <CAKmqyKPML-YO0j=yVBsB9gMg=-kT4FQXo3OyJWGR8+JLALuVRw@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] target/riscv/cpu.c: mark extensions arrays as
 'const'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Wed, Sep 20, 2023 at 9:21=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll need to export these arrays to the accelerator classes in the next
> patches. Mark them as 'const' now because they should not be modified at
> runtime.
>
> Note that 'riscv_cpu_options' will also be exported, but can't be marked
> as 'const', because the properties are changed via
> qdev_property_add_static().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8368ce274..048a2dbc77 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1407,7 +1407,7 @@ typedef struct RISCVCPUMultiExtConfig {
>      {.name =3D _name, .offset =3D CPU_CFG_OFFSET(_prop), \
>       .enabled =3D _defval}
>
> -static RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
> +static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> @@ -1469,7 +1469,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_extensions[=
] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] =3D {
> +static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
>      MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
>      MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> @@ -1487,7 +1487,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts=
[] =3D {
>  };
>
>  /* These are experimental so mark with 'x-' */
> -static RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> +static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
>      /* ePMP 0.9.3 */
>      MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
> @@ -1558,7 +1558,7 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visi=
tor *v, const char *name,
>  }
>
>  static void cpu_add_multi_ext_prop(Object *cpu_obj,
> -                                   RISCVCPUMultiExtConfig *multi_cfg)
> +                                   const RISCVCPUMultiExtConfig *multi_c=
fg)
>  {
>      object_property_add(cpu_obj, multi_cfg->name, "bool",
>                          cpu_get_multi_ext_cfg,
> @@ -1575,11 +1575,13 @@ static void cpu_add_multi_ext_prop(Object *cpu_ob=
j,
>  }
>
>  static void riscv_cpu_add_multiext_prop_array(Object *obj,
> -                                              RISCVCPUMultiExtConfig *ar=
ray)
> +                                        const RISCVCPUMultiExtConfig *ar=
ray)
>  {
> +    const RISCVCPUMultiExtConfig *prop;
> +
>      g_assert(array);
>
> -    for (RISCVCPUMultiExtConfig *prop =3D array; prop && prop->name; pro=
p++) {
> +    for (prop =3D array; prop && prop->name; prop++) {
>          cpu_add_multi_ext_prop(obj, prop);
>      }
>  }
> @@ -1620,11 +1622,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object=
 *obj, const char *prop_name)
>  }
>
>  static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
> -                                                 RISCVCPUMultiExtConfig =
*array)
> +                                        const RISCVCPUMultiExtConfig *ar=
ray)
>  {
> +    const RISCVCPUMultiExtConfig *prop;
> +
>      g_assert(array);
>
> -    for (RISCVCPUMultiExtConfig *prop =3D array; prop && prop->name; pro=
p++) {
> +    for (prop =3D array; prop && prop->name; prop++) {
>          riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
>      }
>  }
> @@ -1687,7 +1691,7 @@ static void riscv_init_max_cpu_extensions(Object *o=
bj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
> -    RISCVCPUMultiExtConfig *prop;
> +    const RISCVCPUMultiExtConfig *prop;
>
>      /* Enable RVG, RVJ and RVV that are disabled by default */
>      set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> --
> 2.41.0
>
>

