Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF0t-0006Gk-G6
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF0q-0006GP-LG; Wed, 05 Apr 2023 22:06:08 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF0o-0006jw-Fj; Wed, 05 Apr 2023 22:06:08 -0400
Received: by mail-vs1-xe36.google.com with SMTP id z17so26573378vsf.4;
 Wed, 05 Apr 2023 19:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bd8uj2ngsCbtv/XQ5lBBHrSZ/rggt7Z7IF7OvLTuXt0=;
 b=L/9Ta+x4W7aDhq+XW0I3PK0ddWPbEypu4E+9RlJQZObBFXcMVU3VHbK2rV2mk3fEBL
 CwcTUhbMjej/pinXWIv8ARawzLgHP1Y10U+IAg4hvmaQI5cYhM5TjJ6m6V/5gbrjoaPs
 pwkvkVqyxC//M8bDpu29r7euD4iIoe2r1S5GwrAFhN307+C8xPpC4fIRbtKTsg3bu1/0
 EyM7PSs1Sjg8Ly4QQaWuVT+72FGSj4LnkpKIxDwEqzslbGYoLL8BnM+8Yj6WQKjb1e4v
 eTQ0mSXYJBZ9hCp/HEblRy90zOSGHyTVk5pskQbkNy7dz3SYl4Sn2HcnQteOtwgSs6Je
 BXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd8uj2ngsCbtv/XQ5lBBHrSZ/rggt7Z7IF7OvLTuXt0=;
 b=4RnoAVNljty/MqQ3tSgfpPCGW/1yMD4vPoLz+RcAc4W6/qVte8ABO4TJylv6hQnNDE
 GAQ0KfKtfQtdkLRiS3nCRycHVdj7YnyGS90y1PFqv26D7Kf0u6TGXOgomsAxvJR/3Ct5
 ilqxdmPoYR9+z4rHRZoqFRkyqWml0Dm8qdKt0DZd9jFa8I7MJEtdI23XTBp9ZHWX1X5+
 /DacsOaBiww6XB5286YhNOiSoMXfFrz3Xi4iL7qQ9QAcPOUC1t0/3ncZaMgTcVm/r3xl
 XYprQpKFWHyI5aVLmUWP6Ef62rKyF1WLE9LxLKgfuJwhNcBnLICvEKP5ZHMC4modbsKr
 Wkzw==
X-Gm-Message-State: AAQBX9fg19izABSLXoucj3WflwQRiKhVeSe2RxtxiwHjIpYDPGWq9RnC
 n6gUq0VoOeyjOGgNoMYGFL0t+NqFEQb/2I3JtsA=
X-Google-Smtp-Source: AKy350apaFQOLP8iqz3cGcrYx8duMNPKU5aMOD9PSHsT/lGX7ZDyXbW0FII2vqHO9CGhNr2B65okDbhOc2QkRdYhA7w=
X-Received: by 2002:a67:ca90:0:b0:422:1654:7737 with SMTP id
 a16-20020a67ca90000000b0042216547737mr6503380vsl.3.1680746764993; Wed, 05 Apr
 2023 19:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:05:39 +1000
Message-ID: <CAKmqyKOBAEmirm3nCQjQ7tG8JyQjeVQM_PnvQ6qiD8teMZ4+OA@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] target/riscv/cpu.c: remove set_priv_version()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:06:09 -0000

On Thu, Mar 30, 2023 at 6:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The setter is doing nothing special. Just set env->priv_ver directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 19e0a6a902..75c3d4ed22 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mx=
l, uint32_t ext)
>      env->misa_ext_mask =3D env->misa_ext =3D ext;
>  }
>
> -static void set_priv_version(CPURISCVState *env, int priv_ver)
> -{
> -    env->priv_ver =3D priv_ver;
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  {
> @@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
>                                      VM_1_10_SV32 : VM_1_10_SV57);
>  #endif
>
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -354,7 +349,7 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
> @@ -364,7 +359,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>  #endif
> @@ -376,7 +371,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -389,7 +384,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    env->priv_ver =3D PRIV_VERSION_1_11_0;
>
>      cpu->cfg.ext_zfh =3D true;
>      cpu->cfg.mmu =3D true;
> @@ -423,7 +418,7 @@ static void rv128_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV128, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
> @@ -436,7 +431,7 @@ static void rv32_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>  #endif
> @@ -446,7 +441,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>  #endif
> @@ -458,7 +453,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -471,7 +466,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    env->priv_ver =3D PRIV_VERSION_1_11_0;
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -485,7 +480,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
>      cpu->cfg.mmu =3D false;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -1113,7 +1108,7 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      }
>
>      if (priv_version >=3D PRIV_VERSION_1_10_0) {
> -        set_priv_version(env, priv_version);
> +        env->priv_ver =3D priv_version;
>      }
>
>      riscv_cpu_validate_misa_priv(env, &local_err);
> --
> 2.39.2
>
>

