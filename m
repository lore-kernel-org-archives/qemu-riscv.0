Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p674q-00084K-NJ
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 04:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p674p-00083v-Ek
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 04:32:23 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p674l-0008Tz-El
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 04:32:23 -0500
Received: by mail-lf1-x136.google.com with SMTP id bf43so2603701lfb.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yi4dvs5rADxhwT2aNfVqBnI628LFztDJCP8VQMpQH9c=;
 b=EuBaxG/L09ZzRFr6dpW7EvlSnkfQu6PfR9fw5iWX5/UdfI8EJlty5bnROVd0Zx3rEi
 AfDPGw3psZhi6cO9GM+Zg68fFMctFF/+RdnuvS79icAKC9FYXX0v0wgUnHs34uIx1MkY
 Jn3RvNBATtimdWmac90YZgHCPffqYdudZFCMObu5XQV5qDGOaJj8XFPUfEM6fTUriM2h
 jD6KyBFtiH5FWzYdxfXt9h3GlU3Ike7+hVdbkBQJ56jvmbp5AmMV3e4/JNG8xbTU3u7W
 bPVqd6I2nppPq9b2ETiUwtlfPSPytim6RuoCPrqrKvlb/iRD2fkPqPFgXdbBaY48SKd7
 SlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yi4dvs5rADxhwT2aNfVqBnI628LFztDJCP8VQMpQH9c=;
 b=SsbWNnEnJSpktpfZVb7bW2nvOqoDU6ARg3eu+BDMgw1cvexLlpnejlWBYhWKEUBOy3
 AnNv4dWbXXql+lwTyOgQF08h4TuYGg9v5ZLMznbtUxrGFR7h5O4rmuga7pX0n0ppm362
 pGWal3FxaxqKblCbaHgvAuG9J65Cvmw7oruNhGlL0nexFBXaAHO3tYaXNlBWtocKC85W
 lS3GZOK55Kv0Y256htgeh8h4BoYxtlhTE1UMSpQx5SCWqSe4NLn4f7K5ugBGPnFdGePf
 5kcxNKc31rce8Ardoi91Y/yIgRHG5WcOY5EuAAxXdquTiEnKH9Qk+eZ+Y2fu1WjrxTaw
 DAww==
X-Gm-Message-State: ANoB5pnPXqDkSrTa5HmA45lpXqjw8mLcGjFd8lkOpcXkeA62eDq6SRdn
 07A+Xu8JGttcJd0it7wC/a2GHRya+O4gI2gN7BPzZu/WNac6hLf4f7EL1KvvlbKAWuTsrVYfKVs
 n9/d0Im0cOUBwP+4LoWq4r1mmaXNOfGXq37I71Am6+paPnJwHNibw+G1SR33cqk/yTvURWpbpqJ
 BLuA==
X-Google-Smtp-Source: AA0mqf6OgzG/riuxY4u/goopwwrcF7tbo73v8HV92PqoY6Bi827F30s+7XjS69GC3enLFUCChbLsCQ==
X-Received: by 2002:ac2:5fe5:0:b0:4a4:68b7:f895 with SMTP id
 s5-20020ac25fe5000000b004a468b7f895mr13464367lfg.57.1671183137173; 
 Fri, 16 Dec 2022 01:32:17 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 a1-20020a056512200100b004b097f2c73dsm168910lfb.253.2022.12.16.01.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 01:32:16 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id z26so2583501lfu.8;
 Fri, 16 Dec 2022 01:32:16 -0800 (PST)
X-Received: by 2002:a05:6512:230b:b0:4b6:ef9b:c51a with SMTP id
 o11-20020a056512230b00b004b6ef9bc51amr1842626lfu.471.1671183136013; Fri, 16
 Dec 2022 01:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20221212102250.3365948-1-alexghiti@rivosinc.com>
In-Reply-To: <20221212102250.3365948-1-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 16 Dec 2022 17:32:04 +0800
X-Gmail-Original-Message-ID: <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
Message-ID: <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Allow user to set the satp mode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: multipart/alternative; boundary="0000000000002d41f805efeea572"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 16 Dec 2022 09:32:23 -0000

--0000000000002d41f805efeea572
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

Thanks for the contribution. This is really helpful.

It seems like if we want to specify the SATP mode for the "named" CPUs,
we have to do, e.g.:
cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv39"));
in each CPU's init function.

Can we add another helper function to wrap this for the "named" CPUs?

Regards,
Frank Chang


On Mon, Dec 12, 2022 at 6:23 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
>
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting
> the
> "highest" supported mode and the bare mode is always supported.
>
> You can set the satp mode using the new properties "mbare", "sv32",
> "sv39", "sv48", "sv57" and "sv64" as follows:
> -cpu rv64,sv57=on # Linux will boot using sv57 scheme
> -cpu rv64,sv39=on # Linux will boot using sv39 scheme
>
> We take the highest level set by the user:
> -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
>
> We make sure that invalid configurations are rejected:
> -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>                            # enabled
>
> We accept "redundant" configurations:
> -cpu rv64,sv48=on,sv57=off # sv39 must be supported if higher modes are
>
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> those new properties.
>
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> v4:
> - Use custom boolean properties instead of OnOffAuto properties, based
>   on ARMVQMap, as suggested by Andrew
>
> v3:
> - Free sv_name as pointed by Bin
> - Replace satp-mode with boolean properties as suggested by Andrew
> - Removed RB from Atish as the patch considerably changed
>
> v2:
> - Use error_setg + return as suggested by Alistair
> - Add RB from Atish
> - Fixed checkpatch issues missed in v1
> - Replaced Ludovic email address with the rivos one
>
>  hw/riscv/virt.c    |  20 +++--
>  target/riscv/cpu.c | 217 +++++++++++++++++++++++++++++++++++++++++++--
>  target/riscv/cpu.h |  25 ++++++
>  target/riscv/csr.c |  13 ++-
>  4 files changed, 256 insertions(+), 19 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..9bb5ba7366 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,
> int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    uint8_t satp_mode_max;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +237,15 @@ static void create_fdt_socket_cpus(RISCVVirtState
> *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" :
> "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        satp_mode_max = satp_mode_max_from_map(
> +                            s->soc[socket].harts[cpu].cfg.satp_mode.map,
> +                            is_32_bit);
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  satp_mode_str(satp_mode_max,
> is_32_bit));
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +        g_free(sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..639231ce2e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -27,6 +27,7 @@
>  #include "time_helper.h"
>  #include "exec/exec-all.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> @@ -199,7 +200,7 @@ static const char * const riscv_intr_names[] = {
>      "reserved"
>  };
>
> -static void register_cpu_props(DeviceState *dev);
> +static void register_cpu_props(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -237,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -246,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -279,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -289,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -342,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>  #endif
>
> @@ -612,6 +613,71 @@ static void riscv_cpu_disas_set_info(CPUState *s,
> disassemble_info *info)
>      }
>  }
>
> +#define OFFSET_SATP_MODE_64     16
> +
> +static uint8_t idx_satp_mode_from_str(const char *satp_mode_str)
> +{
> +    if (!strncmp(satp_mode_str, "mbare", 5)) {
> +        return VM_1_10_MBARE;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv32", 4)) {
> +        return VM_1_10_SV32;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv39", 4)) {
> +        return VM_1_10_SV39 + OFFSET_SATP_MODE_64;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv48", 4)) {
> +        return VM_1_10_SV48 + OFFSET_SATP_MODE_64;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv57", 4)) {
> +        return VM_1_10_SV57 + OFFSET_SATP_MODE_64;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv64", 4)) {
> +        return VM_1_10_SV64 + OFFSET_SATP_MODE_64;
> +    }
> +
> +    /* Will never get there */
> +    return -1;
> +}
> +
> +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit)
> +{
> +    return is_32_bit ?
> +        (31 - __builtin_clz(map & 0xFFFF)) : (31 - __builtin_clz(map >>
> 16));
> +}
> +
> +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> +{
> +    if (is_32_bit) {
> +        switch (satp_mode) {
> +        case VM_1_10_SV32:
> +            return "sv32";
> +        case VM_1_10_MBARE:
> +            return "none";
> +        }
> +    } else {
> +        switch (satp_mode) {
> +        case VM_1_10_SV64:
> +            return "sv64";
> +        case VM_1_10_SV57:
> +            return "sv57";
> +        case VM_1_10_SV48:
> +            return "sv48";
> +        case VM_1_10_SV39:
> +            return "sv39";
> +        case VM_1_10_MBARE:
> +            return "none";
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -907,6 +973,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>       }
>  #endif
>
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    /*
> +     * If unset by both the user and the cpu, we fallback to sv32 for
> 32-bit
> +     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> +     */
> +    if (cpu->cfg.satp_mode.map == 0) {
> +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +            if (rv32) {
> +                cpu->cfg.satp_mode.map |= (1 <<
> idx_satp_mode_from_str("sv32"));
> +            } else {
> +                cpu->cfg.satp_mode.map |= (1 <<
> idx_satp_mode_from_str("sv57"));
> +            }
> +        } else {
> +            cpu->cfg.satp_mode.map |= (1 <<
> idx_satp_mode_from_str("mbare"));
> +        }
> +    }
> +
> +    riscv_cpu_finalize_features(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -915,6 +1005,115 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
>      mcc->parent_realize(dev, errp);
>  }
>
> +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RISCVSATPMap *satp_map = opaque;
> +    uint8_t idx_satp = idx_satp_mode_from_str(name);
> +    bool value;
> +
> +    value = (satp_map->map & (1 << idx_satp));
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RISCVSATPMap *satp_map = opaque;
> +    uint8_t idx_satp = idx_satp_mode_from_str(name);
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        satp_map->map |= 1 << idx_satp;
> +    }
> +
> +    satp_map->init |= 1 << idx_satp;
> +}
> +
> +static void riscv_add_satp_mode_properties(Object *obj)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    object_property_add(obj, "mbare", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +}
> +
> +#define error_append_or_setg(errp, str, ...) ({             \
> +        if (*errp)                                          \
> +            error_append_hint(errp, str"\n", ##__VA_ARGS__);\
> +        else                                                \
> +            error_setg(errp, str, ##__VA_ARGS__);           \
> +    })
> +
> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    /* Get rid of 32-bit/64-bit incompatibility */
> +    if (rv32) {
> +        if (cpu->cfg.satp_mode.map >= (1 << OFFSET_SATP_MODE_64))
> +            error_append_or_setg(errp, "cannot enable 64-bit satp modes "
> +                                 "(sv39/sv48/sv57/sv64) if cpu is in
> 32-bit "
> +                                 "mode");
> +    } else {
> +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32))
> +            error_append_or_setg(errp, "cannot enable 32-bit satp mode
> (sv32) "
> +                                 "if cpu is in 64-bit mode");
> +    }
> +
> +    /*
> +     * Then make sure the user did not ask for an invalid configuration
> as per
> +     * the specification.
> +     */
> +    if (rv32) {
> +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32)) {
> +            if (!(cpu->cfg.satp_mode.map & (1 << VM_1_10_MBARE)) &&
> +                 (cpu->cfg.satp_mode.init & (1 << VM_1_10_MBARE)))
> +                error_append_or_setg(errp, "cannot disable mbare satp
> mode if "
> +                                     "sv32 is enabled");
> +        }
> +    } else {
> +        uint8_t satp_mode_max;
> +
> +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map,
> false);
> +
> +        for (int i = satp_mode_max - 1; i >= 0; --i) {
> +            if (!(cpu->cfg.satp_mode.map & (1 << (i +
> OFFSET_SATP_MODE_64))) &&
> +                 (cpu->cfg.satp_mode.init & (1 << (i +
> OFFSET_SATP_MODE_64))))
> +                error_append_or_setg(errp, "cannot disable %s satp mode
> if %s "
> +                                     "is enabled",
> +                                     satp_mode_str(i, false),
> +                                     satp_mode_str(satp_mode_max, false));
> +        }
> +    }
> +}
> +
> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +    riscv_cpu_satp_mode_finalize(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
> @@ -1070,13 +1269,16 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static void register_cpu_props(DeviceState *dev)
> +static void register_cpu_props(Object *obj)
>  {
>      Property *prop;
> +    DeviceState *dev = DEVICE(obj);
>
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    riscv_add_satp_mode_properties(obj);
>  }
>
>  static Property riscv_cpu_properties[] = {
> @@ -1094,6 +1296,7 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f..1717b33321 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>  #include "qom/object.h"
>  #include "qemu/int128.h"
>  #include "cpu_bits.h"
> +#include "qapi/qapi-types-common.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> @@ -407,6 +408,22 @@ struct RISCVCPUClass {
>      DeviceReset parent_reset;
>  };
>
> +/*
> + * map and init are divided into two 16bit bitmaps: the upper one is for
> rv64
> + * and the lower one is for rv32, this is because the value for sv32 (ie.
> 1)
> + * may be reused later for another purpose for rv64 (see the
> specification which
> + * states that it is "reserved for standard use").
> + *
> + * In a 16bit bitmap in map, the most significant set bit is the maximum
> + * satp mode that is supported.
> + *
> + * Both 16bit bitmaps in init are used to make sure the user selected a
> correct
> + * combination as per the specification.
> + */
> +typedef struct {
> +    uint32_t map, init;
> +} RISCVSATPMap;
> +
>  struct RISCVCPUConfig {
>      bool ext_i;
>      bool ext_e;
> @@ -480,6 +497,8 @@ struct RISCVCPUConfig {
>      bool debug;
>
>      bool short_isa_string;
> +
> +    RISCVSATPMap satp_mode;
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> @@ -789,4 +808,10 @@ void riscv_set_csr_ops(int csrno,
> riscv_csr_operations *ops);
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>
> +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit);
> +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> +
> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> +
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..5c732653b2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,17 @@ static RISCVException read_mstatus(CPURISCVState
> *env, int csrno,
>
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +    uint8_t satp_mode_max;
> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +    bool is_32_bit = riscv_cpu_mxl(env) == MXL_RV32;
> +
> +    vm &= 0xf;
> +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map,
> is_32_bit);
> +
> +    if (is_32_bit) {
> +        return valid_vm_1_10_32[vm] && (vm <= satp_mode_max);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] && (vm <= satp_mode_max);
>      }
>  }
>
> --
> 2.37.2
>
>
>

--0000000000002d41f805efeea572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexandre,<div><br></div><div>Thanks for the contributi=
on. This is really helpful.</div><div><br></div><div>It seems like if we wa=
nt to specify the SATP mode for the &quot;named&quot; CPUs,</div><div>we ha=
ve to do, e.g.:</div><div>cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; idx_sa=
tp_mode_from_str(&quot;sv39&quot;));<br></div><div>in each CPU&#39;s init f=
unction.</div><div><br></div><div>Can we add another helper function to wra=
p this for the &quot;named&quot; CPUs?</div><div><br></div><div>Regards,</d=
iv><div>Frank Chang</div><div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 6:23 PM Ale=
xandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@rivosi=
nc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">RISC-V specifies multiple sizes for addressable memory and Linux prob=
es for<br>
the machine&#39;s support at startup via the satp CSR register (done in<br>
csr.c:validate_vm).<br>
<br>
As per the specification, sv64 must support sv57, which in turn must<br>
support sv48...etc. So we can restrict machine support by simply setting th=
e<br>
&quot;highest&quot; supported mode and the bare mode is always supported.<b=
r>
<br>
You can set the satp mode using the new properties &quot;mbare&quot;, &quot=
;sv32&quot;,<br>
&quot;sv39&quot;, &quot;sv48&quot;, &quot;sv57&quot; and &quot;sv64&quot; a=
s follows:<br>
-cpu rv64,sv57=3Don # Linux will boot using sv57 scheme<br>
-cpu rv64,sv39=3Don # Linux will boot using sv39 scheme<br>
<br>
We take the highest level set by the user:<br>
-cpu rv64,sv48=3Don,sv57=3Don # Linux will boot using sv57 scheme<br>
<br>
We make sure that invalid configurations are rejected:<br>
-cpu rv64,sv32=3Don # Can&#39;t enable 32-bit satp mode in 64-bit<br>
-cpu rv64,sv39=3Doff,sv48=3Don # sv39 must be supported if higher modes are=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# enabled<br>
<br>
We accept &quot;redundant&quot; configurations:<br>
-cpu rv64,sv48=3Don,sv57=3Doff # sv39 must be supported if higher modes are=
<br>
<br>
In addition, we now correctly set the device-tree entry &#39;mmu-type&#39; =
using<br>
those new properties.<br>
<br>
Co-Developed-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.com" =
target=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
Signed-off-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.com" ta=
rget=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
---<br>
v4:<br>
- Use custom boolean properties instead of OnOffAuto properties, based<br>
=C2=A0 on ARMVQMap, as suggested by Andrew<br>
<br>
v3:<br>
- Free sv_name as pointed by Bin<br>
- Replace satp-mode with boolean properties as suggested by Andrew<br>
- Removed RB from Atish as the patch considerably changed<br>
<br>
v2:<br>
- Use error_setg + return as suggested by Alistair<br>
- Add RB from Atish<br>
- Fixed checkpatch issues missed in v1<br>
- Replaced Ludovic email address with the rivos one<br>
<br>
=C2=A0hw/riscv/virt.c=C2=A0 =C2=A0 |=C2=A0 20 +++--<br>
=C2=A0target/riscv/cpu.c | 217 +++++++++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A0target/riscv/cpu.h |=C2=A0 25 ++++++<br>
=C2=A0target/riscv/csr.c |=C2=A0 13 ++-<br>
=C2=A04 files changed, 256 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index a5bc7353b4..9bb5ba7366 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, i=
nt socket,<br>
=C2=A0 =C2=A0 =C2=A0int cpu;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t cpu_phandle;<br>
=C2=A0 =C2=A0 =C2=A0MachineState *mc =3D MACHINE(s);<br>
-=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name;<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name, *sv_name;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (cpu =3D s-&gt;soc[socket].num_harts - 1; cpu &gt;=
=3D 0; cpu--) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_phandle =3D (*phandle)++;<br>
@@ -236,14 +237,15 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_name =3D g_strdup_printf(&quot;/cpus/=
cpu@%d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;soc[socket].hartid_ba=
se + cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_add_subnode(mc-&gt;fdt, cpu_name=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;s-&gt;soc[socket].harts=
[cpu].env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RISCV_FEATURE_MMU)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (is_32_bit) ? &quot;ri=
scv,sv32&quot; : &quot;riscv,sv48&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,none&quot;=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;soc[socket].harts[cpu].cfg.satp_mode.map,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 is_32_bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sv_name =3D g_strdup_printf(&quot;riscv,%s&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode_str(satp_mode_max, =
is_32_bit));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, cpu_name, =
&quot;mmu-type&quot;, sv_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(sv_name);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D riscv_isa_string(&amp;s-&gt;soc[=
socket].harts[cpu]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_string(mc-&gt;fdt, cpu_n=
ame, &quot;riscv,isa&quot;, name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(name);<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index d14e95c9dc..639231ce2e 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;time_helper.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
@@ -199,7 +200,7 @@ static const char * const riscv_intr_names[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;reserved&quot;<br>
=C2=A0};<br>
<br>
-static void register_cpu_props(DeviceState *dev);<br>
+static void register_cpu_props(Object *obj);<br>
<br>
=C2=A0const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)<b=
r>
=C2=A0{<br>
@@ -237,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(TARGET_RISCV64)<br>
@@ -246,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -279,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV128, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -289,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, 0);<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
@@ -342,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)<br>
=C2=A0#elif defined(TARGET_RISCV64)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 register_cpu_props(DEVICE(obj));<br>
+=C2=A0 =C2=A0 register_cpu_props(obj);<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -612,6 +613,71 @@ static void riscv_cpu_disas_set_info(CPUState *s, disa=
ssemble_info *info)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+#define OFFSET_SATP_MODE_64=C2=A0 =C2=A0 =C2=A016<br>
+<br>
+static uint8_t idx_satp_mode_from_str(const char *satp_mode_str)<br>
+{<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;mbare&quot;, 5)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_MBARE;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv32&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv39&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV39 + OFFSET_SATP_MODE_64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv48&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV48 + OFFSET_SATP_MODE_64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv57&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV57 + OFFSET_SATP_MODE_64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv64&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV64 + OFFSET_SATP_MODE_64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Will never get there */<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit)<br>
+{<br>
+=C2=A0 =C2=A0 return is_32_bit ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (31 - __builtin_clz(map &amp; 0xFFFF)) : (31 -=
 __builtin_clz(map &gt;&gt; 16));<br>
+}<br>
+<br>
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)<br>
+{<br>
+=C2=A0 =C2=A0 if (is_32_bit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (satp_mode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sv32&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_MBARE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;none&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (satp_mode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV64:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sv64&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV57:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sv57&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV48:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sv48&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV39:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sv39&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_MBARE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;none&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
=C2=A0static void riscv_cpu_realize(DeviceState *dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(dev);<br>
@@ -907,6 +973,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
<br>
+=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MXL_RV3=
2;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* If unset by both the user and the cpu, we fallback t=
o sv32 for 32-bit<br>
+=C2=A0 =C2=A0 =C2=A0* or sv57 for 64-bit when a MMU is present, and bare o=
therwise.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;cpu-&gt;env, RISCV_FEAT=
URE_MMU)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_m=
ode.map |=3D (1 &lt;&lt; idx_satp_mode_from_str(&quot;sv32&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_m=
ode.map |=3D (1 &lt;&lt; idx_satp_mode_from_str(&quot;sv57&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (=
1 &lt;&lt; idx_satp_mode_from_str(&quot;mbare&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_cpu_finalize_features(cpu, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_vcpu(cs);<br>
@@ -915,6 +1005,115 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0mcc-&gt;parent_realize(dev, errp);<br>
=C2=A0}<br>
<br>
+static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVSATPMap *satp_map =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t idx_satp =3D idx_satp_mode_from_str(name);<br>
+=C2=A0 =C2=A0 bool value;<br>
+<br>
+=C2=A0 =C2=A0 value =3D (satp_map-&gt;map &amp; (1 &lt;&lt; idx_satp));<br=
>
+<br>
+=C2=A0 =C2=A0 visit_type_bool(v, name, &amp;value, errp);<br>
+}<br>
+<br>
+static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVSATPMap *satp_map =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t idx_satp =3D idx_satp_mode_from_str(name);<br>
+=C2=A0 =C2=A0 bool value;<br>
+<br>
+=C2=A0 =C2=A0 if (!visit_type_bool(v, name, &amp;value, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_map-&gt;map |=3D 1 &lt;&lt; idx_satp;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 satp_map-&gt;init |=3D 1 &lt;&lt; idx_satp;<br>
+}<br>
+<br>
+static void riscv_add_satp_mode_properties(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;mbare&quot;, &quot;bool&quot;=
, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;sv32&quot;, &quot;bool&quot;,=
 cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;sv39&quot;, &quot;bool&quot;,=
 cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;sv48&quot;, &quot;bool&quot;,=
 cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;sv57&quot;, &quot;bool&quot;,=
 cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;sv64&quot;, &quot;bool&quot;,=
 cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mode);<br>
+}<br>
+<br>
+#define error_append_or_setg(errp, str, ...) ({=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, str&quot=
;\n&quot;, ##__VA_ARGS__);\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, str, ##__VA_ARG=
S__);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 })<br>
+<br>
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MXL_RV3=
2;<br>
+<br>
+=C2=A0 =C2=A0 /* Get rid of 32-bit/64-bit incompatibility */<br>
+=C2=A0 =C2=A0 if (rv32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map &gt;=3D (1 &lt;&=
lt; OFFSET_SATP_MODE_64))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_or_setg(errp, &quot=
;cannot enable 64-bit satp modes &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(sv39/sv48/sv57/sv64) if=
 cpu is in 32-bit &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mode&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map &amp; (1 &lt;&lt=
; VM_1_10_SV32))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_or_setg(errp, &quot=
;cannot enable 32-bit satp mode (sv32) &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;if cpu is in 64-bit mode=
&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Then make sure the user did not ask for an invalid c=
onfiguration as per<br>
+=C2=A0 =C2=A0 =C2=A0* the specification.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (rv32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map &amp; (1 &lt;&lt=
; VM_1_10_SV32)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(cpu-&gt;cfg.satp_mode.map =
&amp; (1 &lt;&lt; VM_1_10_MBARE)) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cpu-&gt;cfg=
.satp_mode.init &amp; (1 &lt;&lt; VM_1_10_MBARE)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_or_se=
tg(errp, &quot;cannot disable mbare satp mode if &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sv32 is en=
abled&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(cpu-&=
gt;cfg.satp_mode.map, false);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0;=
 --i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(cpu-&gt;cfg.satp_mode.map =
&amp; (1 &lt;&lt; (i + OFFSET_SATP_MODE_64))) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cpu-&gt;cfg=
.satp_mode.init &amp; (1 &lt;&lt; (i + OFFSET_SATP_MODE_64))))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_or_se=
tg(errp, &quot;cannot disable %s satp mode if %s &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;is enabled=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(i,=
 false),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(sa=
tp_mode_max, false));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 riscv_cpu_satp_mode_finalize(cpu, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0static void riscv_cpu_set_irq(void *opaque, int irq, int level)<br>
=C2=A0{<br>
@@ -1070,13 +1269,16 @@ static Property riscv_cpu_extensions[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
-static void register_cpu_props(DeviceState *dev)<br>
+static void register_cpu_props(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Property *prop;<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (prop =3D riscv_cpu_extensions; prop &amp;&amp; pro=
p-&gt;name; prop++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_property_add_static(dev, prop);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 riscv_add_satp_mode_properties(obj);<br>
=C2=A0}<br>
<br>
=C2=A0static Property riscv_cpu_properties[] =3D {<br>
@@ -1094,6 +1296,7 @@ static Property riscv_cpu_properties[] =3D {<br>
<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;rvv_ta_all_1s&quot;, RISCVCPU, c=
fg.rvv_ta_all_1s, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;rvv_ma_all_1s&quot;, RISCVCPU, c=
fg.rvv_ma_all_1s, false),<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 3a9e25053f..1717b33321 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
=C2=A0#include &quot;qemu/int128.h&quot;<br>
=C2=A0#include &quot;cpu_bits.h&quot;<br>
+#include &quot;qapi/qapi-types-common.h&quot;<br>
<br>
=C2=A0#define TCG_GUEST_DEFAULT_MO 0<br>
<br>
@@ -407,6 +408,22 @@ struct RISCVCPUClass {<br>
=C2=A0 =C2=A0 =C2=A0DeviceReset parent_reset;<br>
=C2=A0};<br>
<br>
+/*<br>
+ * map and init are divided into two 16bit bitmaps: the upper one is for r=
v64<br>
+ * and the lower one is for rv32, this is because the value for sv32 (ie. =
1)<br>
+ * may be reused later for another purpose for rv64 (see the specification=
 which<br>
+ * states that it is &quot;reserved for standard use&quot;).<br>
+ *<br>
+ * In a 16bit bitmap in map, the most significant set bit is the maximum<b=
r>
+ * satp mode that is supported.<br>
+ *<br>
+ * Both 16bit bitmaps in init are used to make sure the user selected a co=
rrect<br>
+ * combination as per the specification.<br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint32_t map, init;<br>
+} RISCVSATPMap;<br>
+<br>
=C2=A0struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_i;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_e;<br>
@@ -480,6 +497,8 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool debug;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool short_isa_string;<br>
+<br>
+=C2=A0 =C2=A0 RISCVSATPMap satp_mode;<br>
=C2=A0};<br>
<br>
=C2=A0typedef struct RISCVCPUConfig RISCVCPUConfig;<br>
@@ -789,4 +808,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations=
 *ops);<br>
<br>
=C2=A0void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);<br>
<br>
+uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit);<br>
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);<br>
+<br>
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);<br>
+void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);<br>
+<br>
=C2=A0#endif /* RISCV_CPU_H */<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 5c9a7ee287..5c732653b2 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -1109,10 +1109,17 @@ static RISCVException read_mstatus(CPURISCVState *e=
nv, int csrno,<br>
<br>
=C2=A0static int validate_vm(CPURISCVState *env, target_ulong vm)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_32[vm &amp; 0xf];<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
+=C2=A0 =C2=A0 bool is_32_bit =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32;<br>
+<br>
+=C2=A0 =C2=A0 vm &amp;=3D 0xf;<br>
+=C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(cpu-&gt;cfg.satp_mo=
de.map, is_32_bit);<br>
+<br>
+=C2=A0 =C2=A0 if (is_32_bit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_32[vm] &amp;&amp; (vm &lt=
;=3D satp_mode_max);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_64[vm &amp; 0xf];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_64[vm] &amp;&amp; (vm &lt=
;=3D satp_mode_max);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div>

--0000000000002d41f805efeea572--

