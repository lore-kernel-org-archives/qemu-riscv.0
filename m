Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ADBC47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:20:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLH5M-0001SW-Gu; Thu, 04 Jan 2024 01:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLH5K-0001Ry-GA; Thu, 04 Jan 2024 01:20:06 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLH5I-0008Pg-Ir; Thu, 04 Jan 2024 01:20:06 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7cd814fc6b3so70295241.1; 
 Wed, 03 Jan 2024 22:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704349203; x=1704954003; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLM5NwNrn9Qy6N/o7o98ilgXk4hse9oPJkWFD1Y/zsU=;
 b=dtQ/aecQaDfg/G3PRo8c9cAe+zvMojtxPWrBOr/gO8xjYVVluFEyJXOOHsAZktTFLP
 hJgddZRZ9l1E7g1NNFQP/ahp2xMDTeENjGz5ric0dbR0BL5py/uJUhXsHoNzAY+etCwO
 dN/m193gcbjH06xSaU0k3jaasch6QemOrlFkhnNCsdZDloyUHT7u00SoXBU6lqzY9Dn+
 382v/0yf75voolHvxBmSwbwH+r4cKVeBrNp7rzkyzgunvpsdjSsgbzudhb4ZeQ28sPob
 2m2wYq40b839GxtY4dL4I8vDmvONxAZMeqyyXk1tGzcbBuHgsCVIhzAneOeyoY5qclNQ
 YiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704349203; x=1704954003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLM5NwNrn9Qy6N/o7o98ilgXk4hse9oPJkWFD1Y/zsU=;
 b=MZHV3gptOpn5uSePhqCvr1xKONq0mjUKJ2o7FWRWtjkyZX0v96f2AEWxqnaoqsOa/T
 9MmoitdxNa0AfdBvuKNQVIp4rcK9Q2zXkysPotK4diTzcG7YPHriXlQ/h4Pq29871rgg
 6NHDAZDbCk0FelhRkG+cKdMyyJFEOKe3rFL2tAzltFnp5/xssZipOmjgBQY5W+g2wH41
 Wj7Cb5iHxZJWURaN3vPoPetQBmMLfj7mCIGy45UXo4yTNvBj9vxFmnfEvOESH3xjKhZk
 hNt93JQXIPAcFRAySw1fviBp1MgjsCCbzj563291PxEgI/M70Zr4dE7XDKZoYPrRoxMF
 ew2Q==
X-Gm-Message-State: AOJu0YxUf+Wsojtq3R+ddKsroNEF92EgagvjGOSQu92yRRBh9Bcayiy4
 hWRuWLTza4+goLHqSVKgjrcF4zlWidMls67Rx+M=
X-Google-Smtp-Source: AGHT+IFGJBc18j8df5XZv0tQEMgegYhsgt/LgO4wOnVRtxogXe/cWPyHN1dfvpgVRDbEQS9IdpSkpt5yWd4MPkmo7jc=
X-Received: by 2002:a05:6122:922:b0:4b6:de45:807e with SMTP id
 j34-20020a056122092200b004b6de45807emr119985vka.15.1704349202711; Wed, 03 Jan
 2024 22:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-11-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:19:36 +1000
Message-ID: <CAKmqyKP9qndLX=GgCknJvHUtsHsnFyoxfAhm37Xna+GLaKTySg@mail.gmail.com>
Subject: Re: [PATCH v13 10/26] target/riscv/tcg: add user flag for profile
 support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Tue, Dec 19, 2023 at 12:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The TCG emulation implements all the extensions described in the
> RVA22U64 profile, both mandatory and optional. The mandatory extensions
> will be enabled via the profile flag. We'll leave the optional
> extensions to be enabled by hand.
>
> Given that this is the first profile we're implementing in TCG we'll
> need some ground work first:
>
> - all profiles declared in riscv_profiles[] will be exposed to users.
> TCG is the main accelerator we're considering when adding profile
> support in QEMU, so for now it's safe to assume that all profiles in
> riscv_profiles[] will be relevant to TCG;
>
> - we'll not support user profile settings for vendor CPUs. The flags
> will still be exposed but users won't be able to change them;
>
> - profile support, albeit available for all non-vendor CPUs, will be
> based on top of the new 'rv64i' CPU. Setting a profile to 'true' means
> enable all mandatory extensions of this profile, setting it to 'false'
> will disable all mandatory profile extensions of the CPU, which will
> obliterate preset defaults. This is not a problem for a bare CPU like
> rv64i but it can allow for silly scenarios when using other CPUs. E.g.
> an user can do "-cpu rv64,rva22u64=3Dfalse" and have a bunch of default
> rv64 extensions disabled. The recommended way of using profiles is the
> rv64i CPU, but users are free to experiment.
>
> For now we'll handle multi-letter extensions only. MISA extensions need
> additional steps that we'll take care later. At this point we can boot a
> Linux buildroot using rva22u64 using the following options:
>
> -cpu rv64i,rva22u64=3Dtrue,sv39=3Dtrue,g=3Dtrue,c=3Dtrue,s=3Dtrue
>
> Note that being an usermode/application profile we still need to
> explicitly set 's=3Dtrue' to enable Supervisor mode to boot Linux.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 80 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 3319ba8e4e..83d4dd00cf 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -127,6 +127,19 @@ static bool cpu_cfg_offset_is_named_feat(uint32_t ex=
t_offset)
>      return false;
>  }
>
> +static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_off=
set)
> +{
> +    switch (feat_offset) {
> +    case CPU_CFG_OFFSET(zic64b):
> +        cpu->cfg.cbom_blocksize =3D 64;
> +        cpu->cfg.cbop_blocksize =3D 64;
> +        cpu->cfg.cboz_blocksize =3D 64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
>                                          uint32_t ext_offset)
>  {
> @@ -885,6 +898,71 @@ static void riscv_cpu_add_misa_properties(Object *cp=
u_obj)
>      }
>  }
>
> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile =3D opaque;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    bool value;
> +    int i, ext_offset;
> +
> +    if (riscv_cpu_is_vendor(obj)) {
> +        error_setg(errp, "Profile %s is not available for vendor CPUs",
> +                   profile->name);
> +        return;
> +    }
> +
> +    if (cpu->env.misa_mxl !=3D MXL_RV64) {
> +        error_setg(errp, "Profile %s only available for 64 bit CPUs",
> +                   profile->name);
> +        return;
> +    }
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    profile->user_set =3D true;
> +    profile->enabled =3D value;
> +
> +    for (i =3D 0; profile->ext_offsets[i] !=3D RISCV_PROFILE_EXT_LIST_EN=
D; i++) {
> +        ext_offset =3D profile->ext_offsets[i];
> +
> +        if (profile->enabled) {
> +            if (cpu_cfg_offset_is_named_feat(ext_offset)) {
> +                riscv_cpu_enable_named_feat(cpu, ext_offset);
> +            }
> +
> +            cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
> +        }
> +
> +        g_hash_table_insert(multi_ext_user_opts,
> +                            GUINT_TO_POINTER(ext_offset),
> +                            (gpointer)profile->enabled);
> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
> +    }
> +}
> +
> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile =3D opaque;
> +    bool value =3D profile->enabled;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void riscv_cpu_add_profiles(Object *cpu_obj)
> +{
> +    for (int i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> +        const RISCVCPUProfile *profile =3D riscv_profiles[i];
> +
> +        object_property_add(cpu_obj, profile->name, "bool",
> +                            cpu_get_profile, cpu_set_profile,
> +                            NULL, (void *)profile);
> +    }
> +}
> +
>  static bool cpu_ext_is_deprecated(const char *ext_name)
>  {
>      return isupper(ext_name[0]);
> @@ -1012,6 +1090,8 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>
> +    riscv_cpu_add_profiles(obj);
> +
>      for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
>          qdev_property_add_static(DEVICE(obj), prop);
>      }
> --
> 2.43.0
>
>

