Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E994CE7A91
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkaWh-0007XO-5q; Sun, 24 Sep 2023 21:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaWf-0007X0-JV; Sun, 24 Sep 2023 21:36:41 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaWd-0004uo-Kk; Sun, 24 Sep 2023 21:36:41 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7a29ef55d5fso1961014241.3; 
 Sun, 24 Sep 2023 18:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695605798; x=1696210598; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xooacm5k8UkniLlEoBDxCevDyDGICxTGZGhTGDAqVq4=;
 b=IDUy39pp5v34wsbCRuxvEP+haKTBuD6PxLYnFhRc1nAkcXbGLkiqDD3f0pZGVbOadK
 1aRlXxpFPZwHA+EEomEBH7SWrGf2yo2R8q13at3KV28eM/qJE9uM3oNoiNjX1iiQcO2A
 e4j0rrcprljCm4/5YwAwHQ0cXJRg+bas0xuAwDF7MLYa4qQvh0V+lBQlldclR14M6+4h
 wGk2LBzcgHxK5RoHCecTbXqiBV6kxFi7OPkxsUAhUo2TZwCCuOU1R7mjBafjqQ70Ri6L
 426Er5pgiNrPD2Rk0ziUCvpMJhUUsxERq9EpBK6uTcKDhjDdoU07h5Gs4rxWDKn0s4EG
 uTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695605798; x=1696210598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xooacm5k8UkniLlEoBDxCevDyDGICxTGZGhTGDAqVq4=;
 b=qfYzO113j/lEWc+8IVLqpSR4hWdBrIAZHE0GidFrs4XqkAphnRThPLC0qMaVaJH+Uk
 oo8Oe50oBIkzpCFT1ypBOSTSnMmpEHoD7LqanghcQuQHRVjW31zLSBE2923WRLPwOasu
 yxn2LNcamQskudMyQxrp9fVEaZazG4ctxuiaWN7w4X8jd6PitUzon5cXb4UU6wLDeHp9
 GjZI1rnsNIK3cQloU5nO8WIKpp8fExzOcwJwbqh8oLgpdE1K/1RuWnv/O8f3pd6f1Y0w
 VWizO8n4gsgUrBVXCZOUQhg7xlF237HfzKLqniK7f4yTFN3sawdVFIJu8eztEepnVun+
 v7XQ==
X-Gm-Message-State: AOJu0YxVBluv49vxTb/wlg/6HxHm36Xtw196k2HBui5G+DOwZYkNjHIj
 O/2llecNEABZ/fro0BR/BpngfdqA4+YWUmbdbRo=
X-Google-Smtp-Source: AGHT+IGNKWthMY+8oxIj+dk3Ri7nLKAPFcwRCYLPfMXyqE4ckinwE0YRgMhRPP7BcU1YcIS33bsiE3R/twbDj0t4+f4=
X-Received: by 2002:a67:f818:0:b0:44e:d415:76a3 with SMTP id
 l24-20020a67f818000000b0044ed41576a3mr2406873vso.11.1695605798240; Sun, 24
 Sep 2023 18:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-15-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-15-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:36:11 +1000
Message-ID: <CAKmqyKP8BXZzPU-ArJ72dbMS_99j68Chna7OGD1e9PBwmcgbng@mail.gmail.com>
Subject: Re: [PATCH v3 14/19] target/riscv/cpu.c: export set_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Wed, Sep 20, 2023 at 9:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll move riscv_init_max_cpu_extensions() to tcg-cpu.c in the next
> patch and set_misa() needs to be usable from there.
>
> Rename it to riscv_cpu_set_misa() and make it public.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++----------------
>  target/riscv/cpu.h |  1 +
>  2 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 665c21af6a..cf191d576e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -294,7 +294,7 @@ const char *riscv_cpu_get_trap_name(target_ulong caus=
e, bool async)
>      }
>  }
>
> -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
> +void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>  {
>      env->misa_mxl_max =3D env->misa_mxl =3D mxl;
>      env->misa_ext_mask =3D env->misa_ext =3D ext;
> @@ -399,9 +399,9 @@ static void riscv_any_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
>  #if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC =
| RVU);
>  #elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC =
| RVU);
>  #endif
>
>  #ifndef CONFIG_USER_ONLY
> @@ -428,7 +428,7 @@ static void riscv_max_cpu_init(Object *obj)
>  #ifdef TARGET_RISCV32
>      mlx =3D MXL_RV32;
>  #endif
> -    set_misa(env, mlx, 0);
> +    riscv_cpu_set_misa(env, mlx, 0);
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), mlx =3D=3D MXL_RV32 ?
> @@ -441,7 +441,7 @@ static void rv64_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
> -    set_misa(env, MXL_RV64, 0);
> +    riscv_cpu_set_misa(env, MXL_RV64, 0);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -453,7 +453,8 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> +    riscv_cpu_set_misa(env, MXL_RV64,
> +                       RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -471,7 +472,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -488,7 +489,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_11_0;
>
>      cpu->cfg.ext_zfa =3D true;
> @@ -519,7 +520,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
> +    riscv_cpu_set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
>      env->priv_ver =3D PRIV_VERSION_1_12_0;
>
>      /* Enable ISA extensions */
> @@ -564,7 +565,7 @@ static void rv128_base_cpu_init(Object *obj)
>      }
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
> -    set_misa(env, MXL_RV128, 0);
> +    riscv_cpu_set_misa(env, MXL_RV128, 0);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -576,7 +577,7 @@ static void rv32_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
> -    set_misa(env, MXL_RV32, 0);
> +    riscv_cpu_set_misa(env, MXL_RV32, 0);
>      /* Set latest version of privileged specification */
>      env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -588,7 +589,8 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> +    riscv_cpu_set_misa(env, MXL_RV32,
> +                       RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -606,7 +608,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -623,7 +625,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_11_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -641,7 +643,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> +    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU)=
;
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -1618,7 +1620,7 @@ static void riscv_init_max_cpu_extensions(Object *o=
bj)
>      const RISCVCPUMultiExtConfig *prop;
>
>      /* Enable RVG, RVJ and RVV that are disabled by default */
> -    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> +    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | R=
VV);
>
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
>          isa_ext_update_enabled(cpu, prop->offset, true);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7235eafc1a..9ec0805596 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -713,6 +713,7 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t e=
xt_offset, bool en);
>  bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
> +void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
>  void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
>
>  typedef struct RISCVCPUMultiExtConfig {
> --
> 2.41.0
>
>

