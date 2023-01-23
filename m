Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJxEU-00073x-PB
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 08:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJxES-000734-N1
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 08:51:33 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJxEP-0006cV-FC
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 08:51:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so8603098wmc.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pB5HH4yHacuaSXFeR4M3fVfhrIi2ZrUbS9tHIQedDyY=;
 b=hqEyUlwrz6/ZSup9Kg3UazdylCajo70cGs6Zdo9AJApoeQRH94vuYLmNYbHmmFzxDu
 rSHCnwra7K6WfuzaG8F1lt5fgRPLE9+ucCctKwZ5XsVUWGRP2ecWzugxQryklf/ZMKr9
 d3MPVGhebjfRSJCJ2S3a3AXcvhOYLMbAvB+dpgzQStBS50SJ78pIuhIwwPRuXJ7PH29l
 z+Lvb55v0wu9pQtJCwDNZxcLlBDSlJ3PGuBMW7mBCeeJOj3lgq1pHgsT4+PLcJ2hUrOn
 aAjsEm2LtiBNh76Ngc3KnT1jm0J/0fRa8HqFHHOXooZTzDg4mJLl8GIkcRreXi83Rv+m
 ZMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB5HH4yHacuaSXFeR4M3fVfhrIi2ZrUbS9tHIQedDyY=;
 b=s/zD18js6o0eZAh3t5RaaT7PMoaUlTYaEHQ0Ao/CEcM+VNDMsm0I3xgfn5FDGU75Ug
 2P8ZNTJxFkeH2UCV/yMbLPnkBjiqWyJ1xSFlOJJB+eslKSJljjeWbs7umgZftvyjmCla
 PkvftoqYCcXbu+fFlqJTYuwhXKlWP1egNrw6Zhzsm3y64iLK22a3coFmitjy+RSdadVu
 80Ri4mN1x26UpITmAhegBtI3Pc6whIdk5aIdkXjzSiGNGUUpCs2JVX1+aLMgyE8R4pYe
 2fJm9CeXpA60NgKdfDFypnWbuucHhg0rwtY1CpnxJv2qwAh+H+nRtM8IUPWPJhp/NSMB
 PRWQ==
X-Gm-Message-State: AFqh2kriXUvko1mESJlDS5Zk79G1aSp3/5dVwms4XfIxAZ3Dffn2Ca99
 gwyQDd4s6Pj4JtB/lDbbpiXQJA==
X-Google-Smtp-Source: AMrXdXtY/up1ISH8T/bWSHKAXhpqxyBBgFi7ie3BPW3YsxYaW+39tGXqkrnqRVEDhuDtk3WyZQXFsg==
X-Received: by 2002:a05:600c:3ba5:b0:3cf:7925:7a3 with SMTP id
 n37-20020a05600c3ba500b003cf792507a3mr24301013wms.24.1674481887474; 
 Mon, 23 Jan 2023 05:51:27 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05600c46c700b003db11dfc687sm11290922wmo.36.2023.01.23.05.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:51:27 -0800 (PST)
Date: Mon, 23 Jan 2023 14:51:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
Message-ID: <20230123135126.koxdvloakhwk2gcy@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-6-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 13:51:33 -0000

On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
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
> Finally, we have the following chain of constraints:
> 
> Qemu capability > HW capability > User choice > Software capability
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
>  target/riscv/cpu.h |  8 +++--
>  2 files changed, 59 insertions(+), 27 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e409e6ab64..19a37fee2b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>      g_assert_not_reached();
>  }
>  
> -/* Sets the satp mode to the max supported */
> -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> +                                        const char *satp_mode_str,
> +                                        bool is_32_bit)

I'd drop 'is_32_bit' and get it from 'cpu', which would "clean up" all the
callsites by getting rid of all the true/false stuff. Also, why take the
string instead of the VM_1_10_SV* define?

>  {
> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> -        cpu->cfg.satp_mode.map |=
> -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> -    } else {
> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +
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
> +    uint8_t satp_mode = satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> +
> +    cpu->cfg.satp_mode.map |= (1 << satp_mode);

Let's do 'cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported' to make
sure 'map' has all supported bits set for property probing.

> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>  #if defined(TARGET_RISCV32)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, "sv32", true);
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, "sv57", false);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>      register_cpu_props(obj);
> @@ -319,18 +334,24 @@ static void riscv_any_cpu_init(Object *obj)
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
> +    set_satp_mode_max_supported(cpu, "sv57", false);
>  }
>  
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, "sv39", false);
>  }
>  
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -341,6 +362,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, "mbare", false);
>  }
>  
>  static void rv128_base_cpu_init(Object *obj)
> @@ -352,11 +374,13 @@ static void rv128_base_cpu_init(Object *obj)
>          exit(EXIT_FAILURE);
>      }
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, "sv57", false);
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
> @@ -367,13 +391,17 @@ static void rv32_base_cpu_init(Object *obj)
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, "sv32", true);
>  }
>  
>  static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, "sv32", true);
>  }
>  
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -384,6 +412,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, "mbare", true);
>  }
>  
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -394,6 +423,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, "mbare", true);
>      cpu->cfg.epmp = true;
>  }
>  
> @@ -405,6 +435,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, "mbare", true);
>  }
>  #endif
>  
> @@ -696,7 +727,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +    uint8_t satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +    uint8_t satp_mode_supported_max =
> +                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
>  
>      if (cpu->cfg.satp_mode.map == 0) {
>          /*
> @@ -704,7 +737,7 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>           * satp mode.
>           */
>          if (cpu->cfg.satp_mode.init == 0) {
> -            set_satp_mode_default(cpu, rv32);
> +            set_satp_mode_default(cpu);
>          } else {
>              /*
>               * Find the lowest level that was disabled and then enable the
> @@ -714,9 +747,9 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
> @@ -727,13 +760,12 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
> +    /* Make sure the user asked for a supported configuration (HW and qemu) */
> +    if (satp_mode_map_max > satp_mode_supported_max) {
> +        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
> +                   satp_mode_str(satp_mode_map_max, rv32),
> +                   satp_mode_str(satp_mode_supported_max, rv32));
> +        return;
>      }
>  
>      /*
> @@ -741,17 +773,13 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>       * the specification.
>       */
>      if (!rv32) {
> -        uint8_t satp_mode_max;
> -
> -        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> -
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

Thanks,
drew

