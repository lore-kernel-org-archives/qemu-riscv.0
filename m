Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pN4ci-0001sb-Bh
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 23:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4ch-0001sM-0Z; Tue, 31 Jan 2023 23:21:27 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4ce-0002e1-Tc; Tue, 31 Jan 2023 23:21:26 -0500
Received: by mail-ej1-x62d.google.com with SMTP id gr7so23160918ejb.5;
 Tue, 31 Jan 2023 20:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D2bJpswGWFGivZbzenz2EjWLjQyLi9lBUp76P5kXRKQ=;
 b=R9qV7tNJ6dat9w4MwkGnv59CGDvOnJbwShbrPRIlIGaO6i0N3KsytOI6TVhhYS633k
 CC5+/gPh9B0NNGQZhcxlDmzpyCunF3ekmEyRAjXBgIR4FpvH9O8GQi6WVgMg/ydDGKm/
 PWrujccNxLRCRbDxlZpvEUVk+cYDKIqaA7JsTBxkFuuqcAhsyLokLYwIxBvyVQ7q5R/g
 u7eIntb0c5mmBB8HUO+4aJe+3ATI7IWFa443f9NobEQZZnkF8jXwYOIyY5oChtTq9hu1
 2wfseORu9rclNKHfBF9mkVFBSdxI2K9jQXF+kpXq6tojbvqaPTebc33nQakYnZKXhA8A
 Te0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2bJpswGWFGivZbzenz2EjWLjQyLi9lBUp76P5kXRKQ=;
 b=eEOGSehttx0PoAfN4HoLwlcN2WGkAKoz0GxLsMlXl5y329X9FzpYpR7IwYn7tai6X3
 Zwpbg+AOkSRIL0zxhnFN0m/N29Cw5mgc9gnGZqUMqVzjCT+QYNsMPBTn3nVd3fR26CFR
 9Yr6MpORGTuYnr7QGvET5RJtjmDsjGz5m6hbHW/EGl++23PkzAQaHVt/NSHnZIBlPX0d
 +DPos1npJsEgK3C+JNhEGymFcxr11aXDfiwo4BXhUOTn5B80Z3e0AosaE2TJGMlsd2+x
 ysMLmFDWlcAdIXZdg1fM9dwJiFToE/nuSactBbYvn7Vw66JGIVAFVk2XR5xU+uryipxn
 bdlQ==
X-Gm-Message-State: AO0yUKU7pjSoAozii679iQsOojY0J1A9nI+zxF11E9yd1EE42H0aDECP
 VlHpn8WIqAid8yMUJ0KwPHyvPhtMiNltuI/z/0o=
X-Google-Smtp-Source: AK7set+NzYphreaaPb2/8/L2ZPrCjDuAOYGpGdE7vUn2WIBS/b2+J1JFFcAMobD4J3oikqDTLKB+Blkz7WfdncsE1XQ=
X-Received: by 2002:a17:906:7e44:b0:7c0:beef:79e2 with SMTP id
 z4-20020a1709067e4400b007c0beef79e2mr248535ejr.148.1675225282965; Tue, 31 Jan
 2023 20:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-5-alexghiti@rivosinc.com>
In-Reply-To: <20230131133906.1956228-5-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Feb 2023 12:21:11 +0800
Message-ID: <CAEUhbmXnVSv9Lwuf2EuHfA7qOP1Tax+EcyOTzXg12jjURxNB6A@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] riscv: Introduce satp mode hw capabilities
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 01 Feb 2023 04:21:27 -0000

On Tue, Jan 31, 2023 at 10:41 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Currently, the max satp mode is set with the only constraint that it must be
> implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++---------------
>  target/riscv/cpu.h |  8 +++--
>  2 files changed, 60 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3a7a1746aa..6dd76355ec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>      g_assert_not_reached();
>  }
>
> -/* Sets the satp mode to the max supported */
> -static void set_satp_mode_default_map(RISCVCPU *cpu)
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
> +/* Set the satp mode to the max supported */
> +static void set_satp_mode_default_map(RISCVCPU *cpu)
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
> @@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)
>          exit(EXIT_FAILURE);
>      }
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);

nits: for consistency with other cpu_init, needs a blank line after this

>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
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
> @@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>      cpu->cfg.epmp = true;
>  }
>
> @@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>  #endif
>
> @@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
> @@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>               * valid_vm_1_10_32/64.
>               */
>              for (int i = 1; i < 16; ++i) {
> -                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
> +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
>                      for (int j = i - 1; j >= 0; --j) {
> -                        if (valid_vm[j]) {
> +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
>                              cpu->cfg.satp_mode.map |= (1 << j);
>                              break;
>                          }
> @@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
> -        if (valid_vm[i]) {
> +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> +        if (cpu->cfg.satp_mode.supported & (1 << i)) {
>              cpu->cfg.satp_mode.map |= (1 << i);
>          }
>      }
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

Otherwise,
Reviewed-by: Bin Meng <bmeng@tinylab.org>

