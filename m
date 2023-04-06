Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDSC-0007Ua-8R
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDSA-0007TZ-9D; Wed, 05 Apr 2023 20:26:14 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDS8-0005oD-8C; Wed, 05 Apr 2023 20:26:13 -0400
Received: by mail-ua1-x932.google.com with SMTP id n1so312126uae.9;
 Wed, 05 Apr 2023 17:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSkimFoCOI3XMOV8pq1KeeCiIo28vIwHwjIPtM9H8/g=;
 b=Ox7KUvv+uxAYpvKDAc6hQcBo4ZsO2R1q+evHbKfPjogwi/0sbsIvBULIXJGQS9EXOQ
 rJcEa9IKplHOypP/beW1mWYrkI//sgSpNQ9Tgz6gLCq7wuPb5RYZJl1+GIPCoSD9MxpJ
 yoOjx0JyY5mMTknx35+eTeBenWgNlcNLte+g/HM6i+dD1RwI2o1xoq+tXG1W+FIyem18
 DyHx3oTT12qPbNU4wzB71BnzM07pIGq78wroF4DK4wGp7JsxzgL9RKQnIuSpP74fwuIc
 uFYUtP/yoUzF+gx2f5bJCwuwNk9QZ4IpBgZgblE9B42MvzadSqhgGB3OaLPcUkAIwt8C
 be/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSkimFoCOI3XMOV8pq1KeeCiIo28vIwHwjIPtM9H8/g=;
 b=FRqaVF6kObV4MAZKTm5bKcLf2C05YsSpMOIbrYvgJfpYjXeBAe3Lij+ceVR0ZoiMkP
 PVwcx65sB6pIHrTTSCG/D40lWtsD9edBCoOQ/+Le7btR2rng2ac+1qXnwWtcsZXP4upX
 UkmpydsJVS8dfwmiGf7RC3Jdah9qtfvCBvGW3sp0OBpLBWVO3RvgtMbSAEHTZyQGrNQ9
 r88gEIz2a4z0L+auwiUOx3ok8hrechyctSc7s6azmHb82oO3yk4CvcC8J7ERkbGo1UQF
 HSIUtlKKyS+pbVsSdKWcUgfw23f/EKywwm+yHHlpXs8B6ONxAFsag94N9VRAzXcimb8K
 zcfg==
X-Gm-Message-State: AAQBX9edCuOqvtLE5lwzNuV7sZV3mBjZGtzkKzA9PWhmvmi6awNajvKV
 8ssQqcIM6EKhDP+2pOOSQEnBy9axkYV/hDVSdIA=
X-Google-Smtp-Source: AKy350ZrUY2YPDLmGqg1Wllrjv4H/8FNWTvIewo1lOjInSIE4gRnRQOK5YV4ni4wpvoYOaI3gNxx/p3GYcGAlpQUOlU=
X-Received: by 2002:a9f:305c:0:b0:68a:5c52:7f2b with SMTP id
 i28-20020a9f305c000000b0068a5c527f2bmr5404802uab.1.1680740770902; Wed, 05 Apr
 2023 17:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-21-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-21-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:25:44 +1000
Message-ID: <CAKmqyKNGBU4_yFHq5c1Cz-KiGsRGobngN4hvjSei_FTF5LCjQQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/20] target/riscv/cpu.c: redesign register_cpu_props()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:26:14 -0000

On Thu, Mar 30, 2023 at 3:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The function is now a no-op for all cpu_init() callers that are setting
> a non-zero misa value in set_misa(), since it's no longer used to sync
> cpu->cfg props with env->misa_ext bits. Remove it in those cases.
>
> While we're at it, rename the function to match what it's actually
> doing: create user properties to set/remove CPU extensions. Make a note
> that it will overwrite env->misa_ext with the defaults set by each user
> property.
>
> Update the MISA bits comment in cpu.h as well.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 41 ++++++++++-------------------------------
>  target/riscv/cpu.h |  5 +----
>  2 files changed, 11 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6988ff443a..d8568a024c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] =3D {
>      "reserved"
>  };
>
> -static void register_cpu_props(Object *obj);
> +static void riscv_cpu_add_user_properties(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -349,7 +349,6 @@ static void riscv_any_cpu_init(Object *obj)
>  #endif
>
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> -    register_cpu_props(obj);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -358,7 +357,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    register_cpu_props(obj);
> +    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  #ifndef CONFIG_USER_ONLY
> @@ -370,7 +369,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -383,7 +381,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
> @@ -429,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    register_cpu_props(obj);
> +    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  #ifndef CONFIG_USER_ONLY
> @@ -442,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    register_cpu_props(obj);
> +    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  #ifndef CONFIG_USER_ONLY
> @@ -454,7 +451,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -467,7 +463,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
> @@ -481,7 +476,6 @@ static void rv32_ibex_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
> @@ -496,7 +490,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> -    register_cpu_props(obj);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
> @@ -514,7 +507,7 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> -    register_cpu_props(obj);
> +    riscv_cpu_add_user_properties(obj);
>  }
>  #endif
>
> @@ -1508,30 +1501,16 @@ static Property riscv_cpu_extensions[] =3D {
>  };
>
>  /*
> - * Register CPU props based on env.misa_ext. If a non-zero
> - * value was set, register only the required cpu->cfg.ext_*
> - * properties and leave. env.misa_ext =3D 0 means that we want
> - * all the default properties to be registered.
> + * Add CPU properties with user-facing flags.
> + *
> + * This will overwrite existing env->misa_ext values with the
> + * defaults set via riscv_cpu_add_misa_properties().
>   */
> -static void register_cpu_props(Object *obj)
> +static void riscv_cpu_add_user_properties(Object *obj)
>  {
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
>      Property *prop;
>      DeviceState *dev =3D DEVICE(obj);
>
> -    /*
> -     * If misa_ext is not zero, set cfg properties now to
> -     * allow them to be read during riscv_cpu_realize()
> -     * later on.
> -     */
> -    if (cpu->env.misa_ext !=3D 0) {
> -        /*
> -         * We don't want to set the default riscv_cpu_extensions
> -         * in this case.
> -         */
> -        return;
> -    }
> -
>      riscv_cpu_add_misa_properties(obj);
>
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ce92e8393d..02f26130d5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -65,10 +65,7 @@
>
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>
> -/*
> - * Consider updating register_cpu_props() when adding
> - * new MISA bits here.
> - */
> +/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
>  #define RVI RV('I')
>  #define RVE RV('E') /* E and I are mutually exclusive */
>  #define RVM RV('M')
> --
> 2.39.2
>
>

