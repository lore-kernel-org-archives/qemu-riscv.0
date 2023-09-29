Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF7E743EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 05:14:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qm5ph-0002zx-79; Fri, 29 Sep 2023 01:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm5pb-0002zM-2j; Fri, 29 Sep 2023 01:14:27 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm5pZ-0005cz-9U; Fri, 29 Sep 2023 01:14:26 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-495cf1bf9f9so5225510e0c.2; 
 Thu, 28 Sep 2023 22:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695964464; x=1696569264; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDayRmO7BHgdf4RlBOS67EEwsDoq07MwIubS/dZP7J4=;
 b=Ru/k3Ji5awAHUixHuaYpUUJ87K+Qi8UQJtyfJrV7vunNwlHntwi6fXNpapPyfb7IHo
 zRWDTwAYkNKvi1t+HHQMilOvh1GFBO3lUuiw4mE3IBQZeh8LtmGfBqYxIepe4CCz3DMU
 lhtgGmFCqIwbPJKLdaFFIx5I5ObOYI6yvvH+TmJiR/jhas8GAvDfhi/firu1isbfOHRY
 GqGp9x/sPzrk4m9qaF4ZhgziqjcSHah+qrbih6ksqkHN3n8CLjj34UWwHPJzCiTqvNTu
 X5qxmt3A/4HDJxzGpKJp0FRNZlhzX3MrjN/Nu1gvgCkahd2b/o309y45Nf64OhWUmfnk
 glMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695964464; x=1696569264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDayRmO7BHgdf4RlBOS67EEwsDoq07MwIubS/dZP7J4=;
 b=Pe7o2KheHB/9nzkZDDHlY03TMFiK1AAqikUKbBBqj3QseMDDPbiGWBrH4vQ7BS8bfj
 6k/fCqwYAwwkm3CgzsiAG4m+NrN1cDutwFKQp/U1hKgTvLgDojVTVwRsL00ugArV2XYh
 ppXB63e1+OEj+vCxw4WbwZjVzdKnIoYlv/x2yMqqRVJK2F6ktGgdpKs3eJsO7A1LrkIe
 9bRTBKQjLpbJbid8CK3RlsZTZ0gvJUhwxJwd4PNFUb4Nw2O63Pal+Df9I1x+MCC90KJT
 2BRWKwPRBOV+5VDxzhE+niuInoZ1gz3cJZFrYS6qztH4aeodypNNKsKnhROtryruRPoV
 iNyg==
X-Gm-Message-State: AOJu0YxIN4Ex67IFW+LK8CRaSZfJZXnfOH4gXjeTYjt1wQtit4p/vP40
 B81px5DuyuvPIqVuuyXHzQUBWLsDA7tqWf1YLHI=
X-Google-Smtp-Source: AGHT+IEemAI90Ob1jRhLNvIofhcjqXnQxCuAoy4OySZOAEtG5GnfbXJ+mbqUxZmU3AKMv7l8Wc57QbBs1yUVynAtusY=
X-Received: by 2002:a05:6122:2194:b0:49d:e70:6258 with SMTP id
 j20-20020a056122219400b0049d0e706258mr1774119vkd.3.1695964463851; Thu, 28 Sep
 2023 22:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
 <20230926183109.165878-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230926183109.165878-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Sep 2023 15:13:57 +1000
Message-ID: <CAKmqyKP=zOoJ_OyY6MzFfWmL4Fiq7QfNK+anVL4sD9e8qoG2Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/tcg-cpu.c: add extension properties for
 all cpus
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Wed, Sep 27, 2023 at 4:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment we do not expose extension properties for vendor CPUs
> because that would allow users to change them via command line. The
> drawback is that if we were to add an API that shows all CPU properties,
> e.g. qmp-query-cpu-model-expansion, we won't be able to show extensions
> state of vendor CPUs.
>
> We have the required machinery to create extension properties for vendor
> CPUs while not allowing users to enable extensions. Disabling existing
> extensions is allowed since it can be useful for debugging.
>
> Change the set() callback cpu_set_multi_ext_cfg() to allow enabling
> extensions only for generic CPUs. In cpu_add_multi_ext_prop() let's not
> set the default values for the properties if we're not dealing with
> generic CPUs, otherwise the values set in cpu_init() of vendor CPUs will
> be overwritten. And finally, in tcg_cpu_instance_init(), add cpu user
> properties for all CPUs.
>
> For the veyron-v1 CPU, we're now able to disable existing extensions
> like smstateen:
>
> $ ./build/qemu-system-riscv64 --nographic -M virt \
>     -cpu veyron-v1,smstateen=3Dfalse
>
> But setting extensions that the CPU didn't set during cpu_init(), like
> V, is not allowed:
>
> $ ./build/qemu-system-riscv64 --nographic -M virt \
>     -cpu veyron-v1,v=3Dtrue
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.v=3Dtrue:
>   'veyron-v1' CPU does not allow enabling extensions
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 64 +++++++++++++++++++++++++++++---------
>  1 file changed, 50 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index f31aa9bcc4..a90ee63b06 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -549,6 +549,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
> +static bool riscv_cpu_is_generic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
>  /*
>   * We'll get here via the following path:
>   *
> @@ -632,13 +637,27 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visit=
or *v, const char *name,
>      target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
> -    bool value;
> +    bool generic_cpu =3D riscv_cpu_is_generic(obj);
> +    bool prev_val, value;
>
>      if (!visit_type_bool(v, name, &value, errp)) {
>          return;
>      }
>
> +    prev_val =3D env->misa_ext & misa_bit;
> +
> +    if (value =3D=3D prev_val) {
> +        return;
> +    }
> +
>      if (value) {
> +        if (!generic_cpu) {
> +            g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
> +            error_setg(errp, "'%s' CPU does not allow enabling extension=
s",
> +                       cpuname);
> +            return;
> +        }
> +
>          env->misa_ext |=3D misa_bit;
>          env->misa_ext_mask |=3D misa_bit;
>      } else {
> @@ -688,6 +707,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>   */
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
> +    bool use_def_vals =3D riscv_cpu_is_generic(cpu_obj);
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> @@ -706,7 +726,9 @@ static void riscv_cpu_add_misa_properties(Object *cpu=
_obj)
>                              cpu_set_misa_ext_cfg,
>                              NULL, (void *)misa_cfg);
>          object_property_set_description(cpu_obj, name, desc);
> -        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL)=
;
> +        if (use_def_vals) {
> +            object_property_set_bool(cpu_obj, name, misa_cfg->enabled, N=
ULL);
> +        }
>      }
>  }
>
> @@ -714,17 +736,32 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visi=
tor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
>      const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> -    bool value;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool generic_cpu =3D riscv_cpu_is_generic(obj);
> +    bool prev_val, value;
>
>      if (!visit_type_bool(v, name, &value, errp)) {
>          return;
>      }
>
> -    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value)=
;
> -
>      g_hash_table_insert(multi_ext_user_opts,
>                          GUINT_TO_POINTER(multi_ext_cfg->offset),
>                          (gpointer)value);
> +
> +    prev_val =3D isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
> +
> +    if (value =3D=3D prev_val) {
> +        return;
> +    }
> +
> +    if (value && !generic_cpu) {
> +        g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
> +        error_setg(errp, "'%s' CPU does not allow enabling extensions",
> +                   cpuname);
> +        return;
> +    }
> +
> +    isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
>  }
>
>  static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> @@ -739,11 +776,17 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visi=
tor *v, const char *name,
>  static void cpu_add_multi_ext_prop(Object *cpu_obj,
>                                     const RISCVCPUMultiExtConfig *multi_c=
fg)
>  {
> +    bool generic_cpu =3D riscv_cpu_is_generic(cpu_obj);
> +
>      object_property_add(cpu_obj, multi_cfg->name, "bool",
>                          cpu_get_multi_ext_cfg,
>                          cpu_set_multi_ext_cfg,
>                          NULL, (void *)multi_cfg);
>
> +    if (!generic_cpu) {
> +        return;
> +    }
> +
>      /*
>       * Set def val directly instead of using
>       * object_property_set_bool() to save the set()
> @@ -828,20 +871,13 @@ static bool riscv_cpu_has_max_extensions(Object *cp=
u_obj)
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) !=3D NULL;
>  }
>
> -static bool riscv_cpu_has_user_properties(Object *cpu_obj)
> -{
> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> -}
> -
>  static void tcg_cpu_instance_init(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      Object *obj =3D OBJECT(cpu);
>
> -    if (riscv_cpu_has_user_properties(obj)) {
> -        multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
> -        riscv_cpu_add_user_properties(obj);
> -    }
> +    multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
> +    riscv_cpu_add_user_properties(obj);
>
>      if (riscv_cpu_has_max_extensions(obj)) {
>          riscv_init_max_cpu_extensions(obj);
> --
> 2.41.0
>
>

