Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKeYI-0005zc-8t
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 07:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKeXg-0005SM-Pd
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 07:06:34 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKeXa-0005uC-Un
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 07:06:13 -0500
Received: by mail-ed1-x530.google.com with SMTP id y19so21543508edc.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rL+WSxYP2vSkH8BUjNinhG2rOQ6HOrQi6MjxkFa6XIw=;
 b=dziSvb3joBvAqDAFylim/xf8GOIaa7c3OHocI+6fh5RIzaNAQ78LUhnaR8ve0GXyLE
 gD3zRZMxxjKpcCP1KCaXw5KBb+AJb7c+sOFWlygEJoYaTkq7nTTVybLu3Z0X7CkSLNEd
 fhEIJXlOSEwMJxspfSb5l0+5LO7Qq0AnRxEvEBIrLymnAEvhH4l0prMtveUGhRwHRpuQ
 uAupRAcz04x/JxZ9vg+6tN7ooc4qLJchCSiu4hTzGWEB0M9Fp/DMfXZBLGJSUun9zhxN
 Q1O6zukILTv6l3Sn+DPOI9AmYFOwQl4Z+L9xkOB43p376tBsO1HY2f0zsjrdL9eFfmRc
 vkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL+WSxYP2vSkH8BUjNinhG2rOQ6HOrQi6MjxkFa6XIw=;
 b=hTnQESMQd/h36zT5HB9H4U1dW0uSR/9rQ3bhu9b+5TuJB2C83M5XAD2fSbvsOhbTkw
 sM5o2FzUuaCCLgsvDmspqg2xFdaNzej097U1OF3CzzbHwNBBS1mvx0U9wL2HK2lM4vCh
 sjShZLLSxhN0jwclsJZR66PDWQZKEPyAzYDq97c3XEXvcWpfPjqojklWoBoHQZouqDxm
 ZCoPqvx1VI31IxR11DE0uk6QBXICd6/1cC4HdjroYBmWrwTKmN9tDOa/Xy8E1lv3JtjC
 63p9Hc6nO8yl0gYrY8WRQ3iHrCBd/3+IxexDkLqKYdHC8j6EspeDXk0ZIZfOLPDjs8To
 ByLQ==
X-Gm-Message-State: AFqh2kqLW7b1xiRm6FdXEtnwz3AeegBIXYZZc6K2Vh9xnm6iu+R2Fdeq
 Su2lXr+9dDzgktzSrpf6Mht6lg==
X-Google-Smtp-Source: AMrXdXtvVRu1/8bHq7372A82nuOXsNruIpyXmeEUDXzeOX9vJwpZp7tnzHeRyE3JWaXltaj3PkItJQ==
X-Received: by 2002:a05:6402:3786:b0:499:8849:5fac with SMTP id
 et6-20020a056402378600b0049988495facmr36171903edb.40.1674648368722; 
 Wed, 25 Jan 2023 04:06:08 -0800 (PST)
Received: from localhost ([93.99.189.36]) by smtp.gmail.com with ESMTPSA id
 v26-20020a056402175a00b0049ef70a2894sm2307102edx.38.2023.01.25.04.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 04:06:08 -0800 (PST)
Date: Wed, 25 Jan 2023 13:06:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v7 4/5] riscv: Introduce satp mode hw capabilities
Message-ID: <20230125120607.v3ooio7hh3uadinj@orel>
References: <20230125084107.1580972-1-alexghiti@rivosinc.com>
 <20230125084107.1580972-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125084107.1580972-5-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 12:06:42 -0000

On Wed, Jan 25, 2023 at 09:41:06AM +0100, Alexandre Ghiti wrote:
> Currently, the max satp mode is set with the only constraint that it must be
> implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> 
> But we actually need to add another level of constraint: what the hw is
> actually capable of, because currently, a linux booting on a sifive-u54
> boots in sv57 mode which is incompatible with the cpu's sv39 max
> capability.
> 
> So add a new bitmap to RISCVSATPMap which contains this capability and
> initialize it in every XXX_cpu_init.
> 
> Finally:
> - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
> - the CPU hw capabilities constrains what the user may select
> - the user's selection then constrains what's available to the guest
>   OS.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 74 +++++++++++++++++++++++++++++++---------------
>  target/riscv/cpu.h |  8 +++--
>  2 files changed, 56 insertions(+), 26 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 87153a0219..bba9c39bb8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>      g_assert_not_reached();
>  }
>  
> -/* Sets the satp mode to the max supported */
> -static void set_satp_mode_default(RISCVCPU *cpu)
> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> +                                        uint8_t satp_mode)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
>  
> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> -        cpu->cfg.satp_mode.map |=
> -                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
> -    } else {
> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> +    for (int i = 0; i <= satp_mode; ++i) {
> +        if (valid_vm[i]) {
> +            cpu->cfg.satp_mode.supported |= (1 << i);
> +        }
>      }
>  }
>  
> +/* Sets the satp mode to the max supported */
> +static void set_satp_mode_default(RISCVCPU *cpu)
> +{
> +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>  #if defined(TARGET_RISCV32)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>      register_cpu_props(obj);
> @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
>  static void rv64_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  }
>  
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>  }
>  
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>  
>  static void rv128_base_cpu_init(Object *obj)
> @@ -354,11 +371,13 @@ static void rv128_base_cpu_init(Object *obj)
>          exit(EXIT_FAILURE);
>      }
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
> @@ -369,13 +388,17 @@ static void rv32_base_cpu_init(Object *obj)
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  }
>  
>  static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  }
>  
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -386,6 +409,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>  
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -396,6 +420,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>      cpu->cfg.epmp = true;
>  }
>  
> @@ -407,6 +432,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>  #endif
>  
> @@ -698,8 +724,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> -    uint8_t satp_mode_max;
> +    uint8_t satp_mode_map_max;
> +    uint8_t satp_mode_supported_max =
> +                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
>  
>      if (cpu->cfg.satp_mode.map == 0) {
>          if (cpu->cfg.satp_mode.init == 0) {
> @@ -714,9 +741,9 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>              for (int i = 1; i < 16; ++i) {
>                  if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
>                      (cpu->cfg.satp_mode.init & (1 << i)) &&
> -                    valid_vm[i]) {
> +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
>                      for (int j = i - 1; j >= 0; --j) {
> -                        if (valid_vm[j]) {
> +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
>                              cpu->cfg.satp_mode.map |= (1 << j);
>                              break;
>                          }
> @@ -727,36 +754,35 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>          }
>      }
>  
> -    /* Make sure the configuration asked is supported by qemu */
> -    for (int i = 0; i < 16; ++i) {
> -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> -            error_setg(errp, "satp_mode %s is not valid",
> -                       satp_mode_str(i, rv32));
> -            return;
> -        }
> +    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +
> +    /* Make sure the user asked for a supported configuration (HW and qemu) */
> +    if (satp_mode_map_max > satp_mode_supported_max) {
> +        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
> +                   satp_mode_str(satp_mode_map_max, rv32),
> +                   satp_mode_str(satp_mode_supported_max, rv32));
> +        return;
>      }
>  
>      /*
>       * Make sure the user did not ask for an invalid configuration as per
>       * the specification.
>       */
> -    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> -
>      if (!rv32) {
> -        for (int i = satp_mode_max - 1; i >= 0; --i) {
> +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
>              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
>                  (cpu->cfg.satp_mode.init & (1 << i)) &&
> -                valid_vm[i]) {
> +                (cpu->cfg.satp_mode.supported & (1 << i))) {
>                  error_setg(errp, "cannot disable %s satp mode if %s "
>                             "is enabled", satp_mode_str(i, false),
> -                           satp_mode_str(satp_mode_max, false));
> +                           satp_mode_str(satp_mode_map_max, false));
>                  return;
>              }
>          }
>      }
>  
>      /* Finally expand the map so that all valid modes are set */
> -    for (int i = satp_mode_max - 1; i >= 0; --i) {
> +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
>          cpu->cfg.satp_mode.map |= (1 << i);
>      }
>  }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e37177db5c..b591122099 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -416,13 +416,17 @@ struct RISCVCPUClass {
>  
>  /*
>   * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> - * satp mode that is supported.
> + * satp mode that is supported. It may be chosen by the user and must respect
> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> + * (supported bitmap below).
>   *
>   * init is a 16-bit bitmap used to make sure the user selected a correct
>   * configuration as per the specification.
> + *
> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
>   */
>  typedef struct {
> -    uint16_t map, init;
> +    uint16_t map, init, supported;
>  } RISCVSATPMap;
>  
>  struct RISCVCPUConfig {
> -- 
> 2.37.2
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

