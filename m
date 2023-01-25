Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKj0w-0000rw-P5
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 11:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKj0w-0000rW-1e
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:52:46 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKj0t-00083h-Qi
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:52:45 -0500
Received: by mail-ej1-x632.google.com with SMTP id bk15so49240343ejb.9
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MI9fyJVZC93wFVxaBakNIon6Pku11HQK4m7rdJJ9vyQ=;
 b=ARDCQ2I+fIA4x2I0IDiwsmkp99CZmQbwCKnEx+QIOzFPey/gbNivY13HcQoV0fLAfo
 7aEvR7IWaBC7nXhcW9WHrwNjOex1bVy5pUclPCNgkZIsGNAVPQrTJbydHVtZKvQowWXH
 F8kYY9Q3oQH900XjWbC4XyQZaKv/Bv9Y3bNNTI+yFcuKEqUTepteclRGE5VrdMQNU5y9
 ryslbe3RUaXqK6mwaVuc+/kiol2mtRm2PoADTVIF0xHkq7RRg8sW3PXfUJ9G1bYJBMK5
 xNITAy9J+yPN/L4rr8uH1PndtiB4o3KNy9ot24rO8n8lSbKi6xgr1Wqi25U/FyGnXfBN
 UBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MI9fyJVZC93wFVxaBakNIon6Pku11HQK4m7rdJJ9vyQ=;
 b=f1l/ihzCgZwT40VPObjNj+Dp0WwV3aZ7+gkSokRl6D8EiKOQbCeFkMZAqTLz59lvRU
 GKnLfx0MP0iAcV9PwshCsXY43b9jRICqBPaa3qxJye8vNPQYaM+GZXKrLF0DOBIsYuOR
 lQ/5ytfY2KoAKuUQh6DD47dIIy37taDDhGe+leZWcvy8VUZ8jnhGLysE2Z9G0O5mmhcl
 Ohls6rkthqnyfYCs0M0rcUqjvY05af+d6LNhcNzpuSIZBnVd0jGJewH2c1CJSlHpE69N
 3HtR5tcgz0aKOV4p9w1cP8jpgmdkRDPapCoGDTDX/VzvpWSrCuLBEUzVY13AsP124HCW
 sFbg==
X-Gm-Message-State: AFqh2koukdynfNM9zqPIaU9yiwbXcPK2N1sAYAAL3TijBYGqt3kpO6/8
 B+tFx1KXwqATw1TdnDb+wnv2Aw==
X-Google-Smtp-Source: AMrXdXuKP2DDTHESclTAs4oqPADulxTabS4yvLke8wW0QIlcg0xUZKQLLt6tMrXIawHCjIGMIxauDA==
X-Received: by 2002:a17:906:3795:b0:84d:1366:c74d with SMTP id
 n21-20020a170906379500b0084d1366c74dmr29174060ejc.63.1674665560950; 
 Wed, 25 Jan 2023 08:52:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 lv3-20020a170906bc8300b0087848a5daf5sm244008ejb.225.2023.01.25.08.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:52:40 -0800 (PST)
Date: Wed, 25 Jan 2023 17:52:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v8 3/5] riscv: Allow user to set the satp mode
Message-ID: <20230125165239.tmooowvwq7zez76y@orel>
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125162010.1615787-4-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 25 Jan 2023 16:52:46 -0000

On Wed, Jan 25, 2023 at 05:20:08PM +0100, Alexandre Ghiti wrote:
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
> 
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
> "highest" supported mode and the bare mode is always supported.
> 
> You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> "sv57" and "sv64" as follows:
> -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> -cpu rv64          # Linux will boot using sv57 scheme by default
> 
> We take the highest level set by the user:
> -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> 
> We make sure that invalid configurations are rejected:
> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>                            # enabled
> 
> We accept "redundant" configurations:
> -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> 
> And contradictory configurations:
> -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
> 
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu.c | 206 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  19 +++++
>  target/riscv/csr.c |  12 ++-
>  3 files changed, 230 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7181b34f86..54494a72be 100644
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
> @@ -229,6 +230,81 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
>      env->vext_ver = vext_ver;
>  }
>  
> +static uint8_t satp_mode_from_str(const char *satp_mode_str)
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
> +        return VM_1_10_SV39;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv48", 4)) {
> +        return VM_1_10_SV48;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv57", 4)) {
> +        return VM_1_10_SV57;
> +    }
> +
> +    if (!strncmp(satp_mode_str, "sv64", 4)) {
> +        return VM_1_10_SV64;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +uint8_t satp_mode_max_from_map(uint32_t map)
> +{
> +    /* map here has at least one bit set, so no problem with clz */
> +    return 31 - __builtin_clz(map);
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
> +    g_assert_not_reached();
> +}
> +
> +/* Sets the satp mode to the max supported */
> +static void set_satp_mode_default(RISCVCPU *cpu)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +        cpu->cfg.satp_mode.map |=
> +                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
> +    } else {
> +        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> +    }
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -619,6 +695,82 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>      }
>  }
>  
> +static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +    uint8_t satp_mode_max;
> +
> +    if (cpu->cfg.satp_mode.map == 0) {
> +        if (cpu->cfg.satp_mode.init == 0) {
> +            /* If unset by the user, we fallback to the default satp mode. */
> +            set_satp_mode_default(cpu);
> +        } else {
> +            /*
> +             * Find the lowest level that was disabled and then enable the
> +             * first valid level below which can be found in
> +             * valid_vm_1_10_32/64.
> +             */
> +            for (int i = 1; i < 16; ++i) {
> +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> +                    valid_vm[i]) {

nit: Could have brought this valid_vm[i] up now that everything fits on
one line.

> +                    for (int j = i - 1; j >= 0; --j) {
> +                        if (valid_vm[j]) {
> +                            cpu->cfg.satp_mode.map |= (1 << j);
> +                            break;
> +                        }
> +                    }
> +                    break;
> +                }
> +            }
> +        }
> +    }
> +
> +    /* Make sure the configuration asked is supported by qemu */
> +    for (int i = 0; i < 16; ++i) {
> +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> +            error_setg(errp, "satp_mode %s is not valid",
> +                       satp_mode_str(i, rv32));
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Make sure the user did not ask for an invalid configuration as per
> +     * the specification.
> +     */
> +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +
> +    if (!rv32) {
> +        for (int i = satp_mode_max - 1; i >= 0; --i) {
> +            if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> +                (cpu->cfg.satp_mode.init & (1 << i)) &&
> +                valid_vm[i]) {
> +                error_setg(errp, "cannot disable %s satp mode if %s "
> +                           "is enabled", satp_mode_str(i, false),
> +                           satp_mode_str(satp_mode_max, false));
> +                return;
> +            }
> +        }
> +    }
> +
> +    /* Finally expand the map so that all valid modes are set */
> +    for (int i = satp_mode_max - 1; i >= 0; --i) {
> +        cpu->cfg.satp_mode.map |= (1 << i);
> +    }
> +}
> +
> +static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -919,6 +1071,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>  #endif
>  
> +    riscv_cpu_finalize_features(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>  
>      qemu_init_vcpu(cs);
> @@ -927,6 +1085,52 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      mcc->parent_realize(dev, errp);
>  }
>  
> +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RISCVSATPMap *satp_map = opaque;
> +    uint8_t satp = satp_mode_from_str(name);
> +    bool value;
> +
> +    value = (satp_map->map & (1 << satp));
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    RISCVSATPMap *satp_map = opaque;
> +    uint8_t satp = satp_mode_from_str(name);
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    satp_map->map = deposit32(satp_map->map, satp, 1, value);
> +    satp_map->init |= 1 << satp;
> +}
> +
> +static void riscv_add_satp_mode_properties(Object *obj)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    if (cpu->env.misa_mxl == MXL_RV32) {
> +        object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    } else {
> +        object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    }
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
> @@ -1091,6 +1295,8 @@ static void register_cpu_props(Object *obj)
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    riscv_add_satp_mode_properties(obj);
>  }
>  
>  static Property riscv_cpu_properties[] = {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5609b62a2..e37177db5c 100644
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
> @@ -413,6 +414,17 @@ struct RISCVCPUClass {
>      ResettablePhases parent_phases;
>  };
>  
> +/*
> + * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> + * satp mode that is supported.
> + *
> + * init is a 16-bit bitmap used to make sure the user selected a correct
> + * configuration as per the specification.
> + */
> +typedef struct {
> +    uint16_t map, init;
> +} RISCVSATPMap;
> +
>  struct RISCVCPUConfig {
>      bool ext_i;
>      bool ext_e;
> @@ -488,6 +500,8 @@ struct RISCVCPUConfig {
>      bool debug;
>  
>      bool short_isa_string;
> +
> +    RISCVSATPMap satp_mode;
>  };
>  
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> @@ -794,9 +808,14 @@ enum riscv_pmu_event_idx {
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>  
> +extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
> +
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>  
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>  
> +uint8_t satp_mode_max_from_map(uint32_t map);
> +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> +
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6b157806a5..3c02055825 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>  
> -static const bool valid_vm_1_10_32[16] = {
> +const bool valid_vm_1_10_32[16] = {
>      [VM_1_10_MBARE] = true,
>      [VM_1_10_SV32] = true
>  };
>  
> -static const bool valid_vm_1_10_64[16] = {
> +const bool valid_vm_1_10_64[16] = {
>      [VM_1_10_MBARE] = true,
>      [VM_1_10_SV39] = true,
>      [VM_1_10_SV48] = true,
> @@ -1211,11 +1211,9 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>  
>  static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> -    } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> -    }
> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +
> +    return ((vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map));
>  }
>  
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
> -- 
> 2.37.2
>

Other than the minor nit

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

