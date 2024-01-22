Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F4DC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:33:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRl3i-0005Lj-D0; Sun, 21 Jan 2024 22:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl3h-0005LG-Ca; Sun, 21 Jan 2024 22:33:13 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl3f-00026u-Gy; Sun, 21 Jan 2024 22:33:13 -0500
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4bb6ee9fdb0so141505e0c.0; 
 Sun, 21 Jan 2024 19:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705894390; x=1706499190; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBN0vMu26jrnq2TYSx9+PHoNfwXEGW4p/KWyA9LyyVw=;
 b=g5X/83oh+LpYcUkpQ/0bQRYCCKmS+RHFe5pOf+QVTpEse3sk2QFbkBIYW0lM1nQucm
 2jzIm8KOimFG1H1/ro+3UiNiPzt2Gm7mP+mJXOvOtkNvwu4ileH4a8GgOWXEGxAc4NUm
 ldn+gIb0Q14lwAiq6QxojnNwlfNkmHvp2ktvTwgLMWXFR0QzZYLOxs5m/p5iaK5aVI9H
 QqgcJ6omXAftHRPg9ni4QXEF+l4suCz6YxIHo3eDP2QKwVt8gjl5ffcvxAYiaCk+Jtcd
 beiQKJDsCJ1JJOumLLW1Ed2enqWh/Xx3IHJ0paXe3tz0SdRfT0/JdHb/f2NrdZYb83la
 1arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705894390; x=1706499190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBN0vMu26jrnq2TYSx9+PHoNfwXEGW4p/KWyA9LyyVw=;
 b=TOKTsggg9rgPhDkNH647L1WbsITPY3KDP5A2nNKcA3qv/22avyn4Z9v6zbO/xEMvy0
 d+T7ilYaLjzepci2hWTTg+DWPSClhvLJBVSQwBWPrRu7ugwHFptsP/R27VsKhO6LAakt
 Q0KkyW2ti2HDoaf6gluTxTykrvUB43cvhoemHpsu+PQF2hWb4aS37vrka4Q0LhdhwrHQ
 +U2GgXRcZ+y79Zq94YceBKeBoH7m4/DjDGWmJLPUzxWT9s/lUTn0ZIrNebeC6v+29c8C
 xZWMRLAbcD9ilv8I/IyBqHZA0mrSYjHnj8RePIqQbzjlp3QXNUNzbr3/UhPmoySxXXY/
 cr2Q==
X-Gm-Message-State: AOJu0Yy+BWYNj0sezbJXUOBYoaSrUj2n8aQVuMTHtGxQmIv1XeZLBOgz
 8EN7bfa4mAReK0AqlWi8VZ96h4CdClgzLIGVaEtwi2NPI/lZ4BLOaOWcYSU8UIcSM1CAGWSbcCW
 7ZarEiVdgKTV+gSK96mPUCvBW8cQ=
X-Google-Smtp-Source: AGHT+IHvmO/ALuCrSxfeiqZyMx0mhHG2iA/BhJoifoUKser6UEwTokRgZkGv3rIdQ7myt+hHxEAX0Tm0viRIzp8E6Bo=
X-Received: by 2002:a05:6122:d25:b0:4bb:2d59:79bb with SMTP id
 az37-20020a0561220d2500b004bb2d5979bbmr1108662vkb.27.1705894389899; Sun, 21
 Jan 2024 19:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20240108161903.353648-1-dbarboza@ventanamicro.com>
 <20240108161903.353648-3-dbarboza@ventanamicro.com>
In-Reply-To: <20240108161903.353648-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:32:43 +1000
Message-ID: <CAKmqyKNZY9fZuH2yiobUCUCc=Np4UesN5-+oQ02WBFMeEuihEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: add rv32i, rv32e and rv64e CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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

On Tue, Jan 9, 2024 at 2:19=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> A bare bones 32 bit RVI CPU, rv32i, will make users lives easier when a
> full customized 32 bit CPU is desired, and users won't need to disable
> defaults by hand as they would with the rv32 CPU. [1] has an example of
> a situation that would be avoided with rv32i.
>
> In fact, add bare bones CPUs for RVE as well. Trying to use RVE in QEMU
> requires one to disable every single default extension, including RVI,
> and then add the desirable extension set. Adding rv32e/rv64e makes it
> more pleasant to use embedded CPUs in QEMU.
>
> [1] https://lore.kernel.org/qemu-riscv/258be47f-97be-4308-bed5-dc34ef7ff9=
54@Spark/
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h |  3 +++
>  target/riscv/cpu.c     | 21 +++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 9219c2fcc3..3670cfe6d9 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -34,7 +34,10 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> +#define TYPE_RISCV_CPU_RV32I            RISCV_CPU_TYPE_NAME("rv32i")
> +#define TYPE_RISCV_CPU_RV32E            RISCV_CPU_TYPE_NAME("rv32e")
>  #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
> +#define TYPE_RISCV_CPU_RV64E            RISCV_CPU_TYPE_NAME("rv64e")
>  #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
>  #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1202ec3e57..b9f10b773b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -576,6 +576,12 @@ static void rv64i_bare_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      riscv_cpu_set_misa(env, MXL_RV64, RVI);
>  }
> +
> +static void rv64e_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV64, RVE);
> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -657,6 +663,18 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> +
> +static void rv32i_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV32, RVI);
> +}
> +
> +static void rv32e_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV32, RVE);
> +}
>  #endif
>
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
> @@ -1948,6 +1966,8 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E31,  rv32_sifive_e_cpu_init=
),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_=
init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init=
),
> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32I, rv32i_bare_cpu_init),
> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32E, rv32e_bare_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init=
),
> @@ -1957,6 +1977,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_ini=
t),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>      DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64E, rv64e_bare_cpu_init),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_ini=
t),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_ini=
t),
>  #endif
> --
> 2.43.0
>
>

