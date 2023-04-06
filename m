Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF7C-0001rP-F5
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF7B-0001qy-K2; Wed, 05 Apr 2023 22:12:41 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF79-0003ol-7I; Wed, 05 Apr 2023 22:12:41 -0400
Received: by mail-ua1-x936.google.com with SMTP id n1so430282uae.9;
 Wed, 05 Apr 2023 19:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680747157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmray7Hv2Tlxn8SmHE1KcmuXq0ZgYaQgusg4VCNXoQQ=;
 b=HRu6pdK+zSco7dohvwUQEWOFSAh7Fy3hLjT4H2pa8pP2w8hNlkSIRO5mGDvO3xO6nx
 hjnUrwW0i5+7mYYPFPqmFw+8+CvUD0icn3+++6HimqU+9n2i0cqhzp11WQTgVLquA9A2
 50TGLHYn9Nov+61Xcp8RiXlpEnjdatZIvGAG1zsR6vkP0UjLffrIDM9xsIJbfJRymPQ9
 YwGoAT6Sc382OjvFmtaPDdKHOW2qEQPhxoiq1cx0458gEa1cRqlD2H0ieVFcTAwEVc8A
 j/VQFGlP5PIZ+zioTP4xoqJ0ma24gwq3b4vckeaT7+oABxkY4OCM3NC/cFyJsr/rE6yc
 BsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680747157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmray7Hv2Tlxn8SmHE1KcmuXq0ZgYaQgusg4VCNXoQQ=;
 b=qMjtiHvuMNUVVZyx/8WhKa9hrp/TGS6ZK7kPBkXnUwR34hAHaSXQUlDsDvdQIrPIjg
 9rh4ox14sC5D5g3VP6toaNZindETBsnhMEJP3blsiZLeLOg405Xf3ZfYbGlwVfURrNrc
 RiZKN6E/sh22cu+y4ss5rrdk4wvqJtTSUeSDE/vyEJLwyR+UeV7/ne3cFmZ6eBVwHzgY
 NmJ2mnHOH7yIYtTK/0JVoF3IqNgQ7bIf+bfTbxsc1umMzXAac5+c58G3vo2dI5ZrGIQT
 JQm1C/+L2kZgOD490XayztCtyrTr4bqrjXs8L6M8GeOOZSD/dzblRI64+ms1bxgTe3UU
 jvkg==
X-Gm-Message-State: AAQBX9cTJB9WSRKntCdoyOa/Vh5BsaA2F77dx7STDtJ89rnf491zQVWA
 onTvNQXxC2fIfaSkrjL8PwbjzUTrZWXeHHOTrol511aURRA=
X-Google-Smtp-Source: AKy350biehHcJ7Tp7i3TOUwZRMofwjKPoHEg7ucO4c19WvvG2e4bVdUalkOaQWoMqfj+84wgQyXZH3NdMv9a1blmmos=
X-Received: by 2002:a1f:1206:0:b0:43b:ff63:e79a with SMTP id
 6-20020a1f1206000000b0043bff63e79amr6124060vks.0.1680747157522; Wed, 05 Apr
 2023 19:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:12:11 +1000
Message-ID: <CAKmqyKMGoeqHhpf0ScT=Enq+c7rm=Suw3qVKdvu6cro_kkS9rw@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:12:42 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We have 4 config settings being done in riscv_cpu_init(): ext_ifencei,
> ext_icsr, mmu and pmp. This is also the constructor of the "riscv-cpu"
> device, which happens to be the parent device of every RISC-V cpu.
>
> The result is that these 4 configs are being set every time, and every
> other CPU should always account for them. CPUs such as sifive_e need to
> disable settings that aren't enabled simply because the parent class
> happens to be enabling it.
>
> Moving all configurations from the parent class to each CPU will
> centralize the config of each CPU into its own init(), which is clearer
> than having to account to whatever happens to be set in the parent
> device. These settings are also being set in register_cpu_props() when
> no 'misa_ext' is set, so for these CPUs we don't need changes. Named
> CPUs will receive all cfgs that the parent were setting into their
> init().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 59 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 331272c8a0..4aa119b9bc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -325,7 +325,8 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>
>  static void riscv_any_cpu_init(Object *obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
>  #if defined(TARGET_RISCV32)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #elif defined(TARGET_RISCV64)
> @@ -339,6 +340,12 @@ static void riscv_any_cpu_init(Object *obj)
>  #endif
>
>      env->priv_ver =3D PRIV_VERSION_LATEST;
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -357,12 +364,19 @@ static void rv64_base_cpu_init(Object *obj)
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -372,10 +386,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv64_thead_c906_cpu_init(Object *obj)
> @@ -403,6 +421,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv128_base_cpu_init(Object *obj)
> @@ -439,12 +460,19 @@ static void rv32_base_cpu_init(Object *obj)
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
>  {
> -    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.mmu =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -454,10 +482,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -467,11 +499,15 @@ static void rv32_ibex_cpu_init(Object *obj)
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_11_0;
> -    cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
>      cpu->cfg.epmp =3D true;
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>
>  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> @@ -481,10 +517,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      env->priv_ver =3D PRIV_VERSION_1_10_0;
> -    cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> +
> +    /* inherited from parent obj via riscv_cpu_init() */
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>  }
>  #endif
>
> @@ -1343,11 +1383,6 @@ static void riscv_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> -    cpu->cfg.ext_ifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> -    cpu->cfg.mmu =3D true;
> -    cpu->cfg.pmp =3D true;
> -
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> --
> 2.39.2
>
>

