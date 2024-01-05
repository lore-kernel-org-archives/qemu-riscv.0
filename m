Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A31C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcYj-00021R-0i; Fri, 05 Jan 2024 00:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcYd-00020b-2F; Fri, 05 Jan 2024 00:15:47 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcYb-0006YW-4d; Fri, 05 Jan 2024 00:15:46 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4670a58b118so256693137.2; 
 Thu, 04 Jan 2024 21:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431743; x=1705036543; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpIwxGIoBzTF2CiL9kRStVXzjIkH2PzgGmQCJ3pRg8E=;
 b=aCzyh9JGMmrC0LFenMEiYzIeva5pA/uQO+r851oiWUDJilb9ZzSgIVILl0vn0lWF6U
 Ju3wxzRAioRNShVe5RRUOwvykUPZDNtNIqcy7Dbr8W48wJxDg5edBaUYz+gJzHR1z2HY
 JPvPKjJyWpjrb4CwfzdiTmk8ufrKfCfwbhoic5IB/anAwWg0wmCPVerzY3wmfWhxZXtC
 LYUnSIhRc03wsnr1FAuTyjdrQkgUUf/1fnu2NBN/5cG39k4QI2uuTux6FHmdPZIgDRr1
 pQNGmhzHgtGN47KhBNe0R9BRDVrPrXW2J03h8GSpDyv0d7fU/Suw8oIRpqJWXwPXQZRX
 6uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431743; x=1705036543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpIwxGIoBzTF2CiL9kRStVXzjIkH2PzgGmQCJ3pRg8E=;
 b=Ee10/wY3FPb961hIqSwaDuSpK7IscuuogJwNffwlZkdBP8nf5IOKc6Mp/WEtX38MST
 QXtEf/EEphCAvmW6OCV4s7Emd1bCMynFH5yOvZ/Mgp6vTioZ1NUm3l8YAnKocdBF1WKt
 278hPt6fdon8xo+WuqU7Ry3uKUhsN9ALp9CBIFf33B48PihcSqfp1GLAcMsOEWrDEwSS
 a+pRBXVk/7tkKhmn5tidpausV57xIwclbiQTIllMMcT1Q0fvFfLz6cEq5iNiOhN6fc9n
 Lmig8bDv/IwHVHPFxf0v1c9adRPKksHxMsjeXSevqL9BuumkvD177XhWbRSTEqBvZ5dz
 oE4w==
X-Gm-Message-State: AOJu0Yw3AmGCvCitlcMA1dP4Y8zn1z3uW3tqMcqnevi7i3fteIvWp/mx
 gi/6/G3eypiEzsLUHm9JeGD/SY1Jnxh3NCZlADg=
X-Google-Smtp-Source: AGHT+IEjAeGE+CiiCR1+pfYYZhCn5dePl4bb90sRSZ+SqObbZdrSfAZYqKGuMSEGY+9uivt2BQcp4LGO3LFDPJRXih4=
X-Received: by 2002:a05:6102:b12:b0:467:aff0:1627 with SMTP id
 b18-20020a0561020b1200b00467aff01627mr875352vst.1.1704431743612; Thu, 04 Jan
 2024 21:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-8-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:15:00 +1000
Message-ID: <CAKmqyKN0eev2Bc7NQ5ZEDtFWKD9OkcnzLu45C5gKqcVHA7+wVg@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] target/riscv: rework 'vext_spec'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Thu, Jan 4, 2024 at 3:47=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The same rework did in 'priv_spec' is done for 'vext_spec'. This time is
> simpler, since we only accept one value ("v1.0") and we'll always have
> env->vext_ver set to VEXT_VERSION_1_00_0, thus we don't need helpers to
> convert string to 'vext_ver' back and forth like we needed for
> 'priv_spec'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 35 +++++++++++++++++++++++++++++++++--
>  target/riscv/cpu.h         |  1 +
>  target/riscv/cpu_cfg.h     |  1 -
>  target/riscv/tcg/tcg-cpu.c | 15 ---------------
>  4 files changed, 34 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 657569d8a6..c39da44f51 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1267,6 +1267,7 @@ static void riscv_cpu_init(Object *obj)
>
>      /* Default values for non-bool cpu properties */
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
> +    cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
>
>  typedef struct misa_ext_info {
> @@ -1701,9 +1702,38 @@ static const PropertyInfo prop_priv_spec =3D {
>      .set =3D prop_priv_spec_set,
>  };
>
> -Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +static void prop_vext_spec_set(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    g_autofree char *value =3D NULL;
>
> +    visit_type_str(v, name, &value, errp);
> +
> +    if (g_strcmp0(value, VEXT_VER_1_00_0_STR) !=3D 0) {
> +        error_setg(errp, "Unsupported vector spec version '%s'", value);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, VEXT_VERSION_1_00_0);
> +    cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
> +}
> +
> +static void prop_vext_spec_get(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
> +{
> +    const char *value =3D VEXT_VER_1_00_0_STR;
> +
> +    visit_type_str(v, name, (char **)&value, errp);
> +}
> +
> +static const PropertyInfo prop_vext_spec =3D {
> +    .name =3D "vext_spec",
> +    .get =3D prop_vext_spec_get,
> +    .set =3D prop_vext_spec_set,
> +};
> +
> +Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> @@ -1723,6 +1753,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "pmp", .info =3D &prop_pmp},
>
>      {.name =3D "priv_spec", .info =3D &prop_priv_spec},
> +    {.name =3D "vext_spec", .info =3D &prop_vext_spec},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index aa3d3372e3..f1715d9d31 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,6 +89,7 @@ enum {
>  };
>
>  #define VEXT_VERSION_1_00_0 0x00010000
> +#define VEXT_VER_1_00_0_STR "v1.0"
>
>  enum {
>      TRANSLATE_SUCCESS,
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2dba1f0007..7112af6c4c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -135,7 +135,6 @@ struct RISCVCPUConfig {
>      bool ext_XVentanaCondOps;
>
>      uint32_t pmu_mask;
> -    char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
>      uint16_t cbom_blocksize;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 4d67b72d9e..6501c29d8e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -201,21 +201,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env,=
 RISCVCPUConfig *cfg,
>                     "in the range [8, 64]");
>          return;
>      }
> -
> -    if (cfg->vext_spec) {
> -        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> -            env->vext_ver =3D VEXT_VERSION_1_00_0;
> -        } else {
> -            error_setg(errp, "Unsupported vector spec version '%s'",
> -                       cfg->vext_spec);
> -            return;
> -        }
> -    } else if (env->vext_ver =3D=3D 0) {
> -        qemu_log("vector version is not specified, "
> -                 "use the default value v1.0\n");
> -
> -        env->vext_ver =3D VEXT_VERSION_1_00_0;
> -    }
>  }
>
>  static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> --
> 2.43.0
>
>

