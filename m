Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEE9C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 04:57:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcGE-0002il-Sh; Thu, 04 Jan 2024 23:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcGD-0002iO-Ba; Thu, 04 Jan 2024 23:56:45 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcGB-0007Wf-QE; Thu, 04 Jan 2024 23:56:45 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4b71e8790efso384400e0c.3; 
 Thu, 04 Jan 2024 20:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704430602; x=1705035402; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQMMGJskIlYNvyuqXR6xIvejnxRHIRXEiiYZcvmSakg=;
 b=QPtmO/Yl10i6pAdHP5TdpV6UCfq6xu1c/cQdNntFFGeVtdTZieA/BDZVSgBuUvEKsD
 fy6Ow3P5/z84gbCOKVzaJJv1/wfUqLimrVN6B0eybHwiyk9qTeRn6OrA0GotQxMhtai2
 SFYvt+M2E8+7nXcYo/d604RHNiC1gtGW5iqMkeEQeqh1thqgs1DrG8WIHv8qp+nPlQLq
 AW9INw3iIRIvmeMLTkoGUpfyTpv8W9iMA4CJMyf2D0O+emg1438nu1W29rymiF+2DYlr
 Yo8SQT7fsmT0dUpagn+bGGT+Ii7fZGFKGzNozcezQ5nbOjBCgdQ8tRxk0Ngd7Gg/yhrC
 Cn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704430602; x=1705035402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQMMGJskIlYNvyuqXR6xIvejnxRHIRXEiiYZcvmSakg=;
 b=glCj+YMvTU/y/KHCXVi8zg4IWwpxSGdOqH+FFAjUyJYWbi8tf2sLPa4/H80bQ0EGj9
 1KcJhrAU6pkOSqJEBOIVJz7U2pGD9OLML3mXUyl8P+qcIjSDt6Giq6ER0K/K7S5hqRRi
 abIZgD+M8VAaJyc0gLt1yaUZrQDZTfcNCCf5P0+5BW/q1dU8B1Y3sxjr/j0Tc9E1OArq
 tV7ruYoUA/eB9Nod/7OejYitwX8ZCJP5rwYipCTgWhmSJBF/JkDySf5wC8ya4ktwU0Jl
 VCu3+l6aRGYlQLmuLy0bwrg2nr2konVmrx5ZsXswDi7vHfzFR3sqFJHWrFbAB+Nccoy4
 cd8w==
X-Gm-Message-State: AOJu0Yzy2mMlNMg9yYLawjwLyVVZveZNXoGLfqhqSIF9ectYdL0H//k7
 AD3LwgxxdyOXHPSeMCMlnv5JUZS0AFv/GVnWjF0=
X-Google-Smtp-Source: AGHT+IGYA2c6TaQNwOBfw5E2njdpdXabBk6BeeccOuc7o8ak+q3BARidfgwsenaxq4b08JHjt/7qfqIPiGb4p9cZpKU=
X-Received: by 2002:a05:6122:179f:b0:4b6:bfae:3285 with SMTP id
 o31-20020a056122179f00b004b6bfae3285mr1543789vkf.4.1704430602552; Thu, 04 Jan
 2024 20:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-12-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 14:56:16 +1000
Message-ID: <CAKmqyKNkT3s0T17gEMTF9PmyLvoU1BPTjAUS=o1gWVwqqHGFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] target/riscv: move 'cbom_blocksize' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Thu, Jan 4, 2024 at 3:44=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> After adding a KVM finalize() implementation, turn cbom_blocksize into a
> class property. Follow the same design we used with 'vlen' and 'elen'.
>
> The duplicated 'cbom_blocksize' KVM property can be removed from
> kvm_riscv_add_cpu_user_properties().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/kvm/kvm-cpu.c |  4 ----
>  2 files changed, 38 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 92b4881e9c..b510cb94fc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1276,6 +1276,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
>      cpu->cfg.vlen =3D 128;
>      cpu->cfg.elen =3D 64;
> +    cpu->cfg.cbom_blocksize =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
> @@ -1822,8 +1823,42 @@ static const PropertyInfo prop_elen =3D {
>      .set =3D prop_elen_set,
>  };
>
> +static void prop_cbom_blksize_set(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value !=3D cpu->cfg.cbom_blocksize && riscv_cpu_is_vendor(obj)) =
{
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.cbom_blocksize);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.cbom_blocksize =3D value;
> +}
> +
> +static void prop_cbom_blksize_get(Object *obj, Visitor *v, const char *n=
ame,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.cbom_blocksize;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_cbom_blksize =3D {
> +    .name =3D "cbom_blocksize",
> +    .get =3D prop_cbom_blksize_get,
> +    .set =3D prop_cbom_blksize_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_END_OF_LIST(),
> @@ -1844,6 +1879,8 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "vlen", .info =3D &prop_vlen},
>      {.name =3D "elen", .info =3D &prop_elen},
>
> +    {.name =3D "cbom_blocksize", .info =3D &prop_cbom_blksize},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 70fb075846..1866b56913 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -484,10 +484,6 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>                              NULL, multi_cfg);
>      }
>
> -    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
> -                        NULL, kvm_cpu_set_cbomz_blksize,
> -                        NULL, &kvm_cbom_blocksize);
> -
>      object_property_add(cpu_obj, "cboz_blocksize", "uint16",
>                          NULL, kvm_cpu_set_cbomz_blksize,
>                          NULL, &kvm_cboz_blocksize);
> --
> 2.43.0
>
>

