Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E8C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:31:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRl29-00049a-IP; Sun, 21 Jan 2024 22:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl27-00048y-QF; Sun, 21 Jan 2024 22:31:35 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl26-0001w8-3h; Sun, 21 Jan 2024 22:31:35 -0500
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4b71e8790efso576067e0c.3; 
 Sun, 21 Jan 2024 19:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705894292; x=1706499092; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAOCGSDTsLLK4ekXFuUPVUP7PGb4360SsCeHGQE435A=;
 b=eUIS9gkQzH2S1G6yG/gR5ny3uxmovDdKhZS9IWfGBTIHWTOWP5k6I5uZh+GjQOn7Du
 jGbjx8uZl2zVy3qlbHPqyW5EucOuis9m30Acp3ab5vd8bxn20Z9/f7h/6diH7b86CM91
 ltkum7uUVKyzLNTN5bfDxYeC2cFtCY7bW7Sb5maX/kXu+4r7bNytYM3UwOq6Bgf4Erak
 KqU5ID8xsSsV3B1D0oJ/nuSrYIFiS4UVf3g7JPcdttWnOm4TXbrcwnIhmkXWNovyuPKs
 cUgyIJNIjeGsBqVMuu4AkFJZGzno4WN3AYHN76BjALTq4h0Pz6vwxxCRa01IjYaJSDxp
 bVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705894292; x=1706499092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAOCGSDTsLLK4ekXFuUPVUP7PGb4360SsCeHGQE435A=;
 b=LwjNm72uunMTH+Y5vLotnzZHcQbZ1kK7wkt1BcOcl3cgo+Wt/gvabNvuBcOtpmXe8i
 UcVzDNE0yHA76F9bKlKEJpu0UtmwuHfUNZ/s1bCwwqsElId5RFTlDG/qjhH/uE7hTb7a
 u5i4jYQAmBbxhBj7Gk+nb/kMgQ3LIqNkleQsSzyd75PNYBjYQgY7RWirBenCbeRW28Pd
 FI6rvAsTPTLV5AVgBRylGAIRPj83rHgJ7mRWLg0nzop2Ed9SMCJhLkPdaAGfNPKfoKAR
 OBsJtouvp5jUFh/6m/Jq7xQz3tsNGGtP/gx0CvhPlzrZZC8cm/tV7Jy/P7F3HIJ/sNJI
 o6Ng==
X-Gm-Message-State: AOJu0YyL+8w3RNx2xvwynmHJ3AaZD6ltP+ousQmKBSlUNMV2OZq6mWOj
 YPX86yZy+vWv2tUH5fx0xkgPF2QKlx5O0/g97YoBBK4wViTLRyy8g4OT3zvwADeG7th++Mu+Tbw
 ZLrkcgCzpY2Wu6WCEBzsiUKIe4sk=
X-Google-Smtp-Source: AGHT+IGxyjgnASaJSPY1KDGy53XwrTWSNQFjIgz4TLmeu0d4Of4DJxVd43k5GCQAcOizRQGh8PmTKNJfewz50Y5BxhU=
X-Received: by 2002:a05:6122:ca3:b0:4b6:dc09:3d04 with SMTP id
 ba35-20020a0561220ca300b004b6dc093d04mr811269vkb.8.1705894292647; Sun, 21 Jan
 2024 19:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20240108161903.353648-1-dbarboza@ventanamicro.com>
 <20240108161903.353648-2-dbarboza@ventanamicro.com>
In-Reply-To: <20240108161903.353648-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:31:06 +1000
Message-ID: <CAKmqyKOWzne35oBcXt7oOdHHE4haO1zSGQqk9TANgb=DkMtpFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv/cpu.c: add riscv_bare_cpu_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Tue, Jan 9, 2024 at 3:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Next patch will add more bare CPUs. Their cpu_init() functions would be
> glorified copy/pastes of rv64i_bare_cpu_init(), differing only by a
> riscv_cpu_set_misa() call.
>
> Add a new .instance_init for the TYPE_RISCV_BARE_CPU typ to avoid this
> code repetition. While we're at it, add a better explanation on why
> we're disabling the timing extensions for bare CPUs.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b32681f7f3..1202ec3e57 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -575,22 +575,6 @@ static void rv64i_bare_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      riscv_cpu_set_misa(env, MXL_RV64, RVI);
> -
> -    /* Remove the defaults from the parent class */
> -    RISCV_CPU(obj)->cfg.ext_zicntr =3D false;
> -    RISCV_CPU(obj)->cfg.ext_zihpm =3D false;
> -
> -    /* Set to QEMU's first supported priv version */
> -    env->priv_ver =3D PRIV_VERSION_1_10_0;
> -
> -    /*
> -     * Support all available satp_mode settings. The default
> -     * value will be set to MBARE if the user doesn't set
> -     * satp_mode manually (see set_satp_mode_default()).
> -     */
> -#ifndef CONFIG_USER_ONLY
> -    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV64);
> -#endif
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
> @@ -1266,6 +1250,34 @@ static void riscv_cpu_init(Object *obj)
>      RISCV_CPU(obj)->cfg.ext_zihpm =3D true;
>  }
>
> +static void riscv_bare_cpu_init(Object *obj)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    /*
> +     * Bare CPUs do not inherit the timer and performance
> +     * counters from the parent class (see riscv_cpu_init()
> +     * for info on why the parent enables them).
> +     *
> +     * Users have to explicitly enable these counters for
> +     * bare CPUs.
> +     */
> +    cpu->cfg.ext_zicntr =3D false;
> +    cpu->cfg.ext_zihpm =3D false;
> +
> +    /* Set to QEMU's first supported priv version */
> +    cpu->env.priv_ver =3D PRIV_VERSION_1_10_0;
> +
> +    /*
> +     * Support all available satp_mode settings. The default
> +     * value will be set to MBARE if the user doesn't set
> +     * satp_mode manually (see set_satp_mode_default()).
> +     */
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV64);
> +#endif
> +}
> +
>  typedef struct misa_ext_info {
>      const char *name;
>      const char *description;
> @@ -1925,6 +1937,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      {
>          .name =3D TYPE_RISCV_BARE_CPU,
>          .parent =3D TYPE_RISCV_CPU,
> +        .instance_init =3D riscv_bare_cpu_init,
>          .abstract =3D true,
>      },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
> --
> 2.43.0
>
>

