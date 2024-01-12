Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58AC4707B
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 01:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO6Ue-0007EO-3U; Thu, 11 Jan 2024 20:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Uc-00077p-4l; Thu, 11 Jan 2024 20:37:54 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6UY-000835-R9; Thu, 11 Jan 2024 20:37:53 -0500
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-467a7a376d5so1168368137.1; 
 Thu, 11 Jan 2024 17:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705023469; x=1705628269; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZJ/46q3UbjGLWHn87Uj18+5Dbfum4gcJn1Q1fWmEZE=;
 b=MKICtb+pUrsqHGcjgurHH12dj9UWGQrQc6u6xqGsAyyTuCijoYSsG0xcKNvrvxftzD
 qD2MraCrl9hRszTZYR950FkkVCdnvI9w38Tu/F7d88jTxbijbVEcjXs5IK9W/gAiqy1Z
 OJwah4vrJjjOzkUJfGGyJm+Z2Khwpme2ZzSZJe2CZ92pG/m2IQI3DfqCihmk2MZoBHLo
 ZA8j0Rfzbi8VoGoGjeFOZvarongiBOM4HKyUAJXRt9UuMfZ24AXrulaopyb6afC3zcE8
 j34TCE+rY2AyHS7hbcPKbapmHVeYOYEnS2Bo+IBxa9ylcEQcYwjRgCF9Y/Usu+DYY9lr
 LhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705023469; x=1705628269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZJ/46q3UbjGLWHn87Uj18+5Dbfum4gcJn1Q1fWmEZE=;
 b=Xn86dyfuWHLJHKlA8eBZ/lYpgc5Tnb3Tufv+eE4xMq5PDch5ut4zwYdD94sFLp6BIA
 8rLHZjE04ETRVIJp8o+t0JyGBR6hiu591Gdh9Wb6+IYyCf+Utzu9QkyL/0fLwgwUKto+
 J+3JWdPjVPjfcV9S9qV611Tcn4iS1G0ljlsmKI+2GuPllIJzCRxIiFmQLbvg0drBZUyn
 NSZvdZNnkGX9OpHCTzZA8+V0rFBXqtMsd32XfQXRmV4b1rQ82tTRltz+Def/7lA91Ys8
 RhOxEUyM7iAhnXFq3l5V1AkwK4z2mkElv3a8A/L6w9DpAXe+epvNyx8OyvkCG1biRwqP
 wOdw==
X-Gm-Message-State: AOJu0YyIs/m7wsAzHi9DVsFjm8cgOw3vbZoMXGrYpIm5dBsjgMFq8cXp
 OpfmZOXIMlU6cHvZz4/qSikReqcdyEL6j+qeerU=
X-Google-Smtp-Source: AGHT+IG922doOzUVW2hfKyCaUUO+TVN/z8fzPQQor4kWnsngvAxyEImv+ythPaUZ5ynUIuDidUKV95IyYGE4xXII65M=
X-Received: by 2002:a05:6102:2408:b0:467:f722:55d1 with SMTP id
 j8-20020a056102240800b00467f72255d1mr655954vsi.11.1705023469410; Thu, 11 Jan
 2024 17:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
 <20240105230546.265053-18-dbarboza@ventanamicro.com>
In-Reply-To: <20240105230546.265053-18-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 11:37:23 +1000
Message-ID: <CAKmqyKPqZJza6CQCsAq1B8q8LR+n5xvm4cUcL6wnhkX81Apu+g@mail.gmail.com>
Subject: Re: [PATCH v4 17/17] target/riscv/cpu.c: move 'marchid' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Sat, Jan 6, 2024 at 9:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Keep all class properties in riscv_cpu_properties[].
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 110 +++++++++++++++++++++++----------------------
>  1 file changed, 57 insertions(+), 53 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6149f5960e..3870c3a433 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2044,6 +2044,62 @@ static const PropertyInfo prop_mimpid =3D {
>      .set =3D prop_mimpid_set,
>  };
>
> +static void prop_marchid_set(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint64_t prev_val =3D cpu->cfg.marchid;
> +    uint64_t value, invalid_val;
> +    uint32_t mxlen =3D 0;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s marchid (0x%" PRIu64 ")",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    switch (riscv_cpu_mxl(&cpu->env)) {
> +    case MXL_RV32:
> +        mxlen =3D 32;
> +        break;
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        mxlen =3D 64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    invalid_val =3D 1LL << (mxlen - 1);
> +
> +    if (value =3D=3D invalid_val) {
> +        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
> +                         "and the remaining bits zero", mxlen);
> +        return;
> +    }
> +
> +    cpu->cfg.marchid =3D value;
> +}
> +
> +static void prop_marchid_get(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.marchid;
> +
> +    visit_type_uint64(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_marchid =3D {
> +    .name =3D "marchid",
> +    .get =3D prop_marchid_get,
> +    .set =3D prop_marchid_set,
> +};
> +
>  /*
>   * RVA22U64 defines some 'named features' or 'synthetic extensions'
>   * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
> @@ -2132,6 +2188,7 @@ static Property riscv_cpu_properties[] =3D {
>
>       {.name =3D "mvendorid", .info =3D &prop_mvendorid},
>       {.name =3D "mimpid", .info =3D &prop_mimpid},
> +     {.name =3D "marchid", .info =3D &prop_marchid},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> @@ -2213,56 +2270,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  };
>  #endif
>
> -static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
> -                            void *opaque, Error **errp)
> -{
> -    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint64_t prev_val =3D cpu->cfg.marchid;
> -    uint64_t value, invalid_val;
> -    uint32_t mxlen =3D 0;
> -
> -    if (!visit_type_uint64(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (!dynamic_cpu && prev_val !=3D value) {
> -        error_setg(errp, "Unable to change %s marchid (0x%" PRIu64 ")",
> -                   object_get_typename(obj), prev_val);
> -        return;
> -    }
> -
> -    switch (riscv_cpu_mxl(&cpu->env)) {
> -    case MXL_RV32:
> -        mxlen =3D 32;
> -        break;
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        mxlen =3D 64;
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    invalid_val =3D 1LL << (mxlen - 1);
> -
> -    if (value =3D=3D invalid_val) {
> -        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
> -                         "and the remaining bits zero", mxlen);
> -        return;
> -    }
> -
> -    cpu->cfg.marchid =3D value;
> -}
> -
> -static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
> -                           void *opaque, Error **errp)
> -{
> -    uint64_t value =3D RISCV_CPU(obj)->cfg.marchid;
> -
> -    visit_type_uint64(v, name, &value, errp);
> -}
> -
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> @@ -2293,9 +2300,6 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->gdb_arch_name =3D riscv_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>
> -    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
> -                              cpu_set_marchid, NULL, NULL);
> -
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.43.0
>
>

