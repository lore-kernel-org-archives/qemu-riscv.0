Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNr1L-0007TE-HR
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 03:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNr1G-0007RS-6i
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 03:02:02 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNr1C-0001nS-NS
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 03:02:01 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1442977d77dso5741222fac.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AiBU/WsPy/OcCEV0R0X1JZtOdP4cLorLMzcmBf0l50Q=;
 b=gJDR6Sb1M96R2GoPPbMh6IsjeQWQxr4iltqvz0iSYoVKNaPAPuloFDzaYWrT49+DvA
 YXCXR97DqA9hAxHXUadhMpOKuL1KZ88r6xjEdjm77WjZgfGvT5JmOCkAB2T7RjsKOF89
 6k60qbie32x5Xj9zn6qIkwlpviGAJdZtgrGZSupUjxEBuOTpOXNT3vLc5LW9bDkZugHs
 rx0ywGtPHcGnNCVgKA+0uqKWyC6nu0w6z2pIq5mA6ORMzUhfliR1c+i/PdaVfZor4izJ
 LWVWLod/HwVVkiwvN2DPbwT7TFJDLOLQ2UYlWs/qC9B0zMxnRy0BrlgTstbNC9GQoGN6
 cAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AiBU/WsPy/OcCEV0R0X1JZtOdP4cLorLMzcmBf0l50Q=;
 b=YA661GL+XXAxtWbUnWtbGelYRuIEh2G9qvz8scptfoN2cJvsUxIPUiKeOQPisEBhmn
 abeWB8O2GldGLLLYVEYAoiqaOKbewlploEFVHiXWzv6Ca8rmV+85dkXWem09dHopQlV4
 SiTW5aRJ4zr9w3uo/KiwsvLkGPdtHyrACesj2uRUinUk4lc/fWOlnAsGgaiQ1mwTo6Gk
 j5qp9Kng8tvrqwMz107gnBID3rfyrdRNnc8x+o6Ht1iDKRmKW1fPc3Y/F7XMttBwl+yB
 22YdUSbVOojvEV40XIGnsqTHkb7vQr18qaW/igz/S7TjUyzNKouY5IjpJpgRp5IfKra0
 u9Uw==
X-Gm-Message-State: AO0yUKWwTuwCG8/LE+fDXF2WCkF3XaRERUADf0jFpES+oHOHKL3GSuHp
 zGq611IweSdHZPMknlqDiM6QiDG6usXmUUdWlGRBrA==
X-Google-Smtp-Source: AK7set9AAkXjQtNMES8eXvn1hAbjS2zuxfkS+wl/mEFsA77cVKFaoFtLphCoeykPA75RBcuPi7kTV3JOMDfLo1j50b0=
X-Received: by 2002:a05:6871:80c:b0:15f:24bb:cd74 with SMTP id
 q12-20020a056871080c00b0015f24bbcd74mr502305oap.165.1675411317255; Fri, 03
 Feb 2023 00:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
 <20230203055812.257458-4-alexghiti@rivosinc.com>
In-Reply-To: <20230203055812.257458-4-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 3 Feb 2023 16:01:46 +0800
Message-ID: <CAE_xrPiaEZGSQ3pL1MaR8+zJB9F8k3YutDub6vHKbCSDLmyvtw@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] riscv: Allow user to set the satp mode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>,
 Bin Meng <bmeng@tinylab.org>
Content-Type: multipart/alternative; boundary="0000000000006b102305f3c718c8"
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=frank.chang@sifive.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 08:02:03 -0000

--0000000000006b102305f3c718c8
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 3, 2023 at 2:01 PM Alexandre Ghiti <alexghiti@rivosinc.com>
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 215 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  21 +++++
>  target/riscv/csr.c |  12 ++-
>  3 files changed, 241 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7181b34f86..56057cf87c 100644
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
> @@ -229,6 +230,83 @@ static void set_vext_version(CPURISCVState *env, int
> vext_ver)
>      env->vext_ver = vext_ver;
>  }
>
> +#ifndef CONFIG_USER_ONLY
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
> +static void set_satp_mode_default_map(RISCVCPU *cpu)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +        cpu->cfg.satp_mode.map |=
> +                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
>

Nit:
        cpu->cfg.satp_mode.map |=
                        (1 << (rv32 ? VM_1_10_SV32 : VM_1_10_SV57));


> +    } else {
> +        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
>

        cpu->cfg.satp_mode.map |= (1 << VM_1_10_MBARE);

Otherwise,
Reviewed-by: Frank Chang <frank.chang@sifive.com>


> +    }
> +}
> +#endif
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -619,6 +697,87 @@ static void riscv_cpu_disas_set_info(CPUState *s,
> disassemble_info *info)
>      }
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +    uint8_t satp_mode_max;
> +
> +    if (cpu->cfg.satp_mode.map == 0) {
> +        if (cpu->cfg.satp_mode.init == 0) {
> +            /* If unset by the user, we fallback to the default satp
> mode. */
> +            set_satp_mode_default_map(cpu);
> +        } else {
> +            /*
> +             * Find the lowest level that was disabled and then enable the
> +             * first valid level below which can be found in
> +             * valid_vm_1_10_32/64.
> +             */
> +            for (int i = 1; i < 16; ++i) {
> +                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
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
> +        if (valid_vm[i]) {
> +            cpu->cfg.satp_mode.map |= (1 << i);
> +        }
> +    }
> +}
> +#endif
> +
> +static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Error *local_err = NULL;
> +
> +    riscv_cpu_satp_mode_finalize(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +#endif
> +}
> +
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -919,6 +1078,12 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
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
> @@ -928,6 +1093,52 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    RISCVSATPMap *satp_map = opaque;
> +    uint8_t satp = satp_mode_from_str(name);
> +    bool value;
> +
> +    value = satp_map->map & (1 << satp);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
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
> +                            cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
> +    } else {
> +        object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
> +        object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> +                            cpu_riscv_set_satp, NULL,
> &cpu->cfg.satp_mode);
> +    }
> +}
> +
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
>      RISCVCPU *cpu = RISCV_CPU(opaque);
> @@ -1091,6 +1302,10 @@ static void register_cpu_props(Object *obj)
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> +
> +#ifndef CONFIG_USER_ONLY
> +    riscv_add_satp_mode_properties(obj);
> +#endif
>  }
>
>  static Property riscv_cpu_properties[] = {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5609b62a2..df6d9e06e4 100644
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
> + * map is a 16-bit bitmap: the most significant set bit in map is the
> maximum
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
> @@ -488,6 +500,10 @@ struct RISCVCPUConfig {
>      bool debug;
>
>      bool short_isa_string;
> +
> +#ifndef CONFIG_USER_ONLY
> +    RISCVSATPMap satp_mode;
> +#endif
>  };
>
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> @@ -794,9 +810,14 @@ enum riscv_pmu_event_idx {
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
> index 6b157806a5..f9eff3f1e3 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask =
> MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP;
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
> @@ -1211,11 +1211,9 @@ static RISCVException read_mstatus(CPURISCVState
> *env, int csrno,
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
> +    return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
>  }
>
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
> --
> 2.37.2
>
>

--0000000000006b102305f3c718c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Feb 3, 2023 at 2:01 PM Alexandre =
Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@rivosinc.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">RISC-V specifies multiple sizes for addressable m=
emory and Linux probes for<br>
the machine&#39;s support at startup via the satp CSR register (done in<br>
csr.c:validate_vm).<br>
<br>
As per the specification, sv64 must support sv57, which in turn must<br>
support sv48...etc. So we can restrict machine support by simply setting th=
e<br>
&quot;highest&quot; supported mode and the bare mode is always supported.<b=
r>
<br>
You can set the satp mode using the new properties &quot;sv32&quot;, &quot;=
sv39&quot;, &quot;sv48&quot;,<br>
&quot;sv57&quot; and &quot;sv64&quot; as follows:<br>
-cpu rv64,sv57=3Don=C2=A0 # Linux will boot using sv57 scheme<br>
-cpu rv64,sv39=3Don=C2=A0 # Linux will boot using sv39 scheme<br>
-cpu rv64,sv57=3Doff # Linux will boot using sv48 scheme<br>
-cpu rv64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux will boot using sv57 sc=
heme by default<br>
<br>
We take the highest level set by the user:<br>
-cpu rv64,sv48=3Don,sv57=3Don # Linux will boot using sv57 scheme<br>
<br>
We make sure that invalid configurations are rejected:<br>
-cpu rv64,sv39=3Doff,sv48=3Don # sv39 must be supported if higher modes are=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# enabled<br>
<br>
We accept &quot;redundant&quot; configurations:<br>
-cpu rv64,sv48=3Don,sv57=3Doff # Linux will boot using sv48 scheme<br>
<br>
And contradictory configurations:<br>
-cpu rv64,sv48=3Don,sv48=3Doff # Linux will boot using sv39 scheme<br>
<br>
Co-Developed-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.com" =
target=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
Signed-off-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.com" ta=
rget=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" ta=
rget=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng@tinylab.org" target=3D"_b=
lank">bmeng@tinylab.org</a>&gt;<br>
Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" =
target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 215 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0target/riscv/cpu.h |=C2=A0 21 +++++<br>
=C2=A0target/riscv/csr.c |=C2=A0 12 ++-<br>
=C2=A03 files changed, 241 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 7181b34f86..56057cf87c 100644<br>
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
@@ -229,6 +230,83 @@ static void set_vext_version(CPURISCVState *env, int v=
ext_ver)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;vext_ver =3D vext_ver;<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
+static uint8_t satp_mode_from_str(const char *satp_mode_str)<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV39;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv48&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV48;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv57&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV57;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strncmp(satp_mode_str, &quot;sv64&quot;, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VM_1_10_SV64;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_assert_not_reached();<br>
+}<br>
+<br>
+uint8_t satp_mode_max_from_map(uint32_t map)<br>
+{<br>
+=C2=A0 =C2=A0 /* map here has at least one bit set, so no problem with clz=
 */<br>
+=C2=A0 =C2=A0 return 31 - __builtin_clz(map);<br>
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
+=C2=A0 =C2=A0 g_assert_not_reached();<br>
+}<br>
+<br>
+/* Sets the satp mode to the max supported */<br>
+static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
+{<br>
+=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MXL_RV3=
2;<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_feature(&amp;cpu-&gt;env, RISCV_FEATURE_MMU)) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; satp_mode_from_str(rv32 ? &quot;sv32&quot; : &quot;s=
v57&quot;));<br></blockquote><div><br></div><div>Nit:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
(rv32 ? VM_1_10_SV32 : VM_1_10_SV57));</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; sat=
p_mode_from_str(&quot;mbare&quot;));<br></blockquote><div><br></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; VM_1=
_10_MBARE);<br></div><div><br></div><div>Otherwise,</div><div>Reviewed-by: =
Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifiv=
e.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 }<br>
+}<br>
+#endif<br>
+<br>
=C2=A0static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
@@ -619,6 +697,87 @@ static void riscv_cpu_disas_set_info(CPUState *s, disa=
ssemble_info *info)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
+static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MXL_RV3=
2;<br>
+=C2=A0 =C2=A0 const bool *valid_vm =3D rv32 ? valid_vm_1_10_32 : valid_vm_=
1_10_64;<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.init =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If unset by the user, we fall=
back to the default satp mode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_satp_mode_default_map(cpu);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Find the lowest level th=
at was disabled and then enable the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* first valid level below =
which can be found in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* valid_vm_1_10_32/64.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 1; i &lt; 16; ++i=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.s=
atp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp; valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
(int j =3D i - 1; j &gt;=3D 0; --j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (valid_vm[j]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; j);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Make sure the configuration asked is supported by qemu */=
<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 16; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.satp_mode.map &amp; (1 &lt;&l=
t; i)) &amp;&amp; !valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;satp_mode=
 %s is not valid&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0satp_mode_str(i, rv32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Make sure the user did not ask for an invalid config=
uration as per<br>
+=C2=A0 =C2=A0 =C2=A0* the specification.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(cpu-&gt;cfg.satp_mo=
de.map);<br>
+<br>
+=C2=A0 =C2=A0 if (!rv32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0;=
 --i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(cpu-&gt;cfg.satp_mode.map =
&amp; (1 &lt;&lt; i)) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu-&gt;cfg.satp_=
mode.init &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &=
quot;cannot disable %s satp mode if %s &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;is enabled&quot;, satp_mode_str(i, false),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(satp_mode_max, false));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Finally expand the map so that all valid modes are set */=
<br>
+=C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0; --i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (=
1 &lt;&lt; i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+#endif<br>
+<br>
+static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)<br>
+{<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 riscv_cpu_satp_mode_finalize(cpu, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+}<br>
+<br>
=C2=A0static void riscv_cpu_realize(DeviceState *dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(dev);<br>
@@ -919,6 +1078,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
<br>
+=C2=A0 =C2=A0 riscv_cpu_finalize_features(cpu, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_vcpu(cs);<br>
@@ -928,6 +1093,52 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVSATPMap *satp_map =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t satp =3D satp_mode_from_str(name);<br>
+=C2=A0 =C2=A0 bool value;<br>
+<br>
+=C2=A0 =C2=A0 value =3D satp_map-&gt;map &amp; (1 &lt;&lt; satp);<br>
+<br>
+=C2=A0 =C2=A0 visit_type_bool(v, name, &amp;value, errp);<br>
+}<br>
+<br>
+static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVSATPMap *satp_map =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t satp =3D satp_mode_from_str(name);<br>
+=C2=A0 =C2=A0 bool value;<br>
+<br>
+=C2=A0 =C2=A0 if (!visit_type_bool(v, name, &amp;value, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 satp_map-&gt;map =3D deposit32(satp_map-&gt;map, satp, 1, va=
lue);<br>
+=C2=A0 =C2=A0 satp_map-&gt;init |=3D 1 &lt;&lt; satp;<br>
+}<br>
+<br>
+static void riscv_add_satp_mode_properties(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
+=C2=A0 =C2=A0 if (cpu-&gt;env.misa_mxl =3D=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, &quot;sv32&quot;, &qu=
ot;bool&quot;, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mo=
de);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, &quot;sv39&quot;, &qu=
ot;bool&quot;, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mo=
de);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, &quot;sv48&quot;, &qu=
ot;bool&quot;, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mo=
de);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, &quot;sv57&quot;, &qu=
ot;bool&quot;, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mo=
de);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add(obj, &quot;sv64&quot;, &qu=
ot;bool&quot;, cpu_riscv_get_satp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_riscv_set_satp, NULL, &amp;cpu-&gt;cfg.satp_mo=
de);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void riscv_cpu_set_irq(void *opaque, int irq, int level)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(opaque);<br>
@@ -1091,6 +1302,10 @@ static void register_cpu_props(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0for (prop =3D riscv_cpu_extensions; prop &amp;&amp; pro=
p-&gt;name; prop++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_property_add_static(dev, prop);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 riscv_add_satp_mode_properties(obj);<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static Property riscv_cpu_properties[] =3D {<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index f5609b62a2..df6d9e06e4 100644<br>
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
@@ -413,6 +414,17 @@ struct RISCVCPUClass {<br>
=C2=A0 =C2=A0 =C2=A0ResettablePhases parent_phases;<br>
=C2=A0};<br>
<br>
+/*<br>
+ * map is a 16-bit bitmap: the most significant set bit in map is the maxi=
mum<br>
+ * satp mode that is supported.<br>
+ *<br>
+ * init is a 16-bit bitmap used to make sure the user selected a correct<b=
r>
+ * configuration as per the specification.<br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint16_t map, init;<br>
+} RISCVSATPMap;<br>
+<br>
=C2=A0struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_i;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_e;<br>
@@ -488,6 +500,10 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool debug;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool short_isa_string;<br>
+<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 RISCVSATPMap satp_mode;<br>
+#endif<br>
=C2=A0};<br>
<br>
=C2=A0typedef struct RISCVCPUConfig RISCVCPUConfig;<br>
@@ -794,9 +810,14 @@ enum riscv_pmu_event_idx {<br>
=C2=A0/* CSR function table */<br>
=C2=A0extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];<br>
<br>
+extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];<br>
+<br>
=C2=A0void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);<br>
=C2=A0void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);<br>
<br>
=C2=A0void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);<br>
<br>
+uint8_t satp_mode_max_from_map(uint32_t map);<br>
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);<br>
+<br>
=C2=A0#endif /* RISCV_CPU_H */<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 6b157806a5..f9eff3f1e3 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask =3D MIP=
_VSSIP;<br>
=C2=A0static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTI=
P | MIP_VSEIP;<br>
=C2=A0static const target_ulong vsip_writable_mask =3D MIP_VSSIP;<br>
<br>
-static const bool valid_vm_1_10_32[16] =3D {<br>
+const bool valid_vm_1_10_32[16] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[VM_1_10_MBARE] =3D true,<br>
=C2=A0 =C2=A0 =C2=A0[VM_1_10_SV32] =3D true<br>
=C2=A0};<br>
<br>
-static const bool valid_vm_1_10_64[16] =3D {<br>
+const bool valid_vm_1_10_64[16] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[VM_1_10_MBARE] =3D true,<br>
=C2=A0 =C2=A0 =C2=A0[VM_1_10_SV39] =3D true,<br>
=C2=A0 =C2=A0 =C2=A0[VM_1_10_SV48] =3D true,<br>
@@ -1211,11 +1211,9 @@ static RISCVException read_mstatus(CPURISCVState *en=
v, int csrno,<br>
<br>
=C2=A0static bool validate_vm(CPURISCVState *env, target_ulong vm)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_32[vm &amp; 0xf];<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_64[vm &amp; 0xf];<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
+<br>
+=C2=A0 =C2=A0 return (vm &amp; 0xf) &lt;=3D satp_mode_max_from_map(cpu-&gt=
;cfg.satp_mode.map);<br>
=C2=A0}<br>
<br>
=C2=A0static RISCVException write_mstatus(CPURISCVState *env, int csrno,<br=
>
-- <br>
2.37.2<br>
<br>
</blockquote></div></div>

--0000000000006b102305f3c718c8--

