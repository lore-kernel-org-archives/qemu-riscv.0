Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB3DCDB482
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFKJ-0005eV-4f; Mon, 16 Oct 2023 00:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFKC-0005cT-HA; Mon, 16 Oct 2023 00:35:28 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFKA-0004Op-C3; Mon, 16 Oct 2023 00:35:28 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49dd3bb5348so1538586e0c.0; 
 Sun, 15 Oct 2023 21:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430924; x=1698035724; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUVZmXgRkLvNNEM/+qQlpx3xxRY+7rsCdlFcJ5vo/LA=;
 b=IKokSxjM6LgkqHNWhYoGx9qA0G/qYDscB9foJIrIfLBXD0nQJdjSdFuXtQ5ZESHe++
 UgdpvdmA8hVs+UJwOWTSpmzYJHep0kd/lsxHw3TeaTVj2onDJCzkYhyyIcLsBMHGjFG8
 GE4lfzTJiVAfhW3IEB5KZDrB6dCT0OfgDemhvKZVOn6j1oUxQLJ1mDVODYIbOysK/7tO
 pNtH218aD491ynloCnUCcErPZj7mXmzKMqK11f/wrySbZm8/RtQ+e1aIvKp3Rw772raP
 4zNDqH/baQd7iTdnlJJyCKopmMaiuwlpzFKI0VzXUOarLuk2uIZcLQK7hZLFAscSsqvJ
 A6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430924; x=1698035724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUVZmXgRkLvNNEM/+qQlpx3xxRY+7rsCdlFcJ5vo/LA=;
 b=fqORPxxgY5C9n0X2kWjx5N+WN7WEkUN9a1rHYIMa5CA9s1UUfjpKPHOlvzZ507loqw
 rcQ7EckZMJd9U6CqcAb1zP5oaEStHDndpOtZs52L5tpm0XomrjJvJrZXY151g58BLkJl
 wkmmEOpwdRm1mSbH+Kr3TH744TEnQWaEj/cRhDdkAHdannXTanMkC4hxj2rdnrYuB+iP
 WWwdfpXjYX266cu3JUT57GtjePiLgwFsTMCj1AdLj0rB4CSl9m43zn8xwQS10iQQUgOD
 7/IDLINlHCLZPXYvFBQD2BTPi5QsyNa6kdwpB9uJbrYr6ENseVN7JYujNXoTHW9YsdUg
 JIqQ==
X-Gm-Message-State: AOJu0Ywdvl8CaDDxuKzluOolWGH5VYtvHuB9hxUuoJM/f2DyDoK5gutQ
 FGR81OXwZX+p9xe7QVnt8AkJQgArMZgc/Y9CvLQ=
X-Google-Smtp-Source: AGHT+IEtulP8udkY3zQr79RQyFODHS0NyA327u1rl5/OW4TncZCTmeKv3r1ggFfwwlPBfjDvJ2vFIuG6s+huYycSwB0=
X-Received: by 2002:a1f:c905:0:b0:49a:466c:199e with SMTP id
 z5-20020a1fc905000000b0049a466c199emr23884319vkf.2.1697430924375; Sun, 15 Oct
 2023 21:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
 <20231012164604.398496-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231012164604.398496-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:34:57 +1000
Message-ID: <CAKmqyKOyQLseELiCwwTDtOJKcFKWCmiZf4NHhX9BYg7fR+OYGA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: rename ext_ifencei to ext_zifencei
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Fri, Oct 13, 2023 at 2:47=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a leading 'z' to improve grepping. When one wants to search for uses
> of zifencei they're more likely to do 'grep -i zifencei' than 'grep -i
> ifencei'.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                      | 22 +++++++++++-----------
>  target/riscv/cpu_cfg.h                  |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 +-
>  target/riscv/tcg/tcg-cpu.c              |  8 ++++----
>  4 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5425bceac1..caf42ce68d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -80,7 +80,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
> -    ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
>      ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
> @@ -382,7 +382,7 @@ static void riscv_any_cpu_init(Object *obj)
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
> @@ -430,7 +430,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  #endif
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
> @@ -448,7 +448,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>  #endif
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -494,7 +494,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>
>      /* Enable ISA extensions */
>      cpu->cfg.mmu =3D true;
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.pmp =3D true;
>      cpu->cfg.ext_icbom =3D true;
> @@ -566,7 +566,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  #endif
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
> @@ -584,7 +584,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>  #endif
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -602,7 +602,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      cpu->cfg.epmp =3D true;
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -619,7 +619,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  #endif
>
>      /* inherited from parent obj via riscv_cpu_init() */
> -    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -1242,7 +1242,7 @@ const char *riscv_get_misa_ext_description(uint32_t=
 bit)
>  const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> -    MULTI_EXT_CFG_BOOL("zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>      MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
>      MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
>      MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> @@ -1347,7 +1347,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>
>  /* Deprecated entries marked for future removal */
>  const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] =3D {
> -    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
>      MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
>      MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
>      MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 0e6a0f245c..a3f96eb878 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -61,7 +61,7 @@ struct RISCVCPUConfig {
>      bool ext_zksed;
>      bool ext_zksh;
>      bool ext_zkt;
> -    bool ext_ifencei;
> +    bool ext_zifencei;
>      bool ext_icsr;
>      bool ext_icbom;
>      bool ext_icboz;
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 25cb60558a..faf6d65064 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -799,7 +799,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence =
*a)
>
>  static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>  {
> -    if (!ctx->cfg_ptr->ext_ifencei) {
> +    if (!ctx->cfg_ptr->ext_zifencei) {
>          return false;
>      }
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a28918ab30..9b8f3f54a7 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -278,7 +278,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>          !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
>            riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
>            riscv_has_ext(env, RVD) &&
> -          cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> +          cpu->cfg.ext_icsr && cpu->cfg.ext_zifencei)) {
>
>          if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
>              !cpu->cfg.ext_icsr) {
> @@ -286,15 +286,15 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>              return;
>          }
>
> -        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
> -            !cpu->cfg.ext_ifencei) {
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei)) &&
> +            !cpu->cfg.ext_zifencei) {
>              error_setg(errp, "RVG requires Zifencei but user set "
>                         "Zifencei to false");
>              return;
>          }
>
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zifencei), true)=
;
>
>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
>          env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
> --
> 2.41.0
>
>

