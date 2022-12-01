Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kqa-0002lF-PA
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1p0kqW-0002kX-Sk
 for qemu-riscv@nongnu.org; Thu, 01 Dec 2022 09:47:30 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1p0kqU-0005Vd-E8
 for qemu-riscv@nongnu.org; Thu, 01 Dec 2022 09:47:28 -0500
Received: by mail-ej1-x631.google.com with SMTP id ha10so4775193ejb.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Dec 2022 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yxooa9xcpOrEbl1qS4V88aIq/s/qQxpHgqsbE4lqu9s=;
 b=jrUMBEfWH2wGuAMrzZ6T8EteySSIEOJ2B18bOebquTvGRMThXJJdufoKAZYdtEgw39
 5PXycFWJ1unEQ/8LEWM9tuEqmhzPGXg//eta1n3pEnqIuvrV+rR7HPihIAA4NV3izbzs
 ouep3ed5S4/KyGIEkQHtF+wCWQJ3wDMUT01rAgW+vJ0a0N7Gc8qhg8rmRvczYzTWob0c
 bHrFC8wl27MgOg8CWXnGHhzen1sfHmrziDKoqDktaYv8dLWQJq8LU4jF3q3MgmE1Ct39
 qXCd5uzWgc4NpCXk967FZmRFRAkHmDG5M//fA8N9Bd76OT/LplVNK0x+gpoO6uGjMj6s
 vlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxooa9xcpOrEbl1qS4V88aIq/s/qQxpHgqsbE4lqu9s=;
 b=kqzY0s7jYIR0zynvn/Nel8RVP/EaTOt90HHMD3j8B6PE7OrYsqq4uZYyiVgkMDmmgz
 KDODxiLh82auS49fnurHp8KON9mPIOOQHQoglRACpiigQEYeXsREiOdyLmgDsIQstXbM
 0v7yXvSBLPJ//6xXpzTA0XsjAASLkBuxyZXYPIZwbUtvCInVGcmikjkN5faxZ3HMr6iR
 I6chmkLODC3Dn1Hx2lvelhUcuyvbQFkCz1qf7se8PpJXVvoJbgeVtF2pIGzam4+UccCf
 +6OOqjjEsnwfy3y5pB1Q3zICcFUygan73AUAudKswBH7Mqt8d0I3wtp5ABgVboTsFOMN
 /pSg==
X-Gm-Message-State: ANoB5pkR9FhDPcWnfr5YbJaRQMarU0vtqlOszx3Ck2Qm+uucDIo2/Gjm
 C66anUpyiI2eiLLgB89AXvTCPg==
X-Google-Smtp-Source: AA0mqf6k6ptIsY2EcD15LqP125dn7yDzk57V1yE8HIXvJzseL2v26GYT/7wrE3Y1SpoRjWDeEpYqzg==
X-Received: by 2002:a17:907:c208:b0:7ad:79c0:547a with SMTP id
 ti8-20020a170907c20800b007ad79c0547amr2754297ejc.41.1669906044145; 
 Thu, 01 Dec 2022 06:47:24 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906200900b007c0688a68cbsm1825085ejo.176.2022.12.01.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 06:47:23 -0800 (PST)
Date: Thu, 1 Dec 2022 15:47:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v3] riscv: Allow user to set the satp mode
Message-ID: <20221201144722.aq4pfmdehrghaoy2@kamzik>
References: <20221201093623.1394747-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201093623.1394747-1-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Thu, 01 Dec 2022 14:47:30 -0000

On Thu, Dec 01, 2022 at 10:36:23AM +0100, Alexandre Ghiti wrote:
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
> 
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
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
> 			   # enabled
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
>  hw/riscv/virt.c         |  16 ++--
>  target/riscv/cpu.c      | 164 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h      |   8 ++
>  target/riscv/cpu_bits.h |   1 +
>  target/riscv/csr.c      |   8 +-
>  5 files changed, 186 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..bb7c739a74 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>  
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +236,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  s->soc[socket].harts[cpu].cfg.satp_mode_str);
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +        g_free(sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..51c06ed057 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -907,6 +907,66 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>  #endif
>  
> +    /*
> +     * Either a cpu sets its supported satp_mode in XXX_cpu_init
> +     * or the user sets this value using satp_mode property.

using the sv* and mbare properties.

> +     */
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    cpu->cfg.satp_mode = VM_1_10_UNDEF;

Could probably just use -1 here instead of introducing VM_1_10_UNDEF.

> +
> +    if (rv32) {
> +        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("sv32");

No need to allocate memory, satp_mode_str = "sv32".

Also I'm not sure we need to keep mode_str in CPUConfig. Providing a
function with a switch on VM_1_10_SV* cases to get it should be enough
for its one usecase.

> +            cpu->cfg.satp_mode = VM_1_10_SV32;
> +        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("none");
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        }
> +    } else {
> +        if (cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("sv64");
> +            cpu->cfg.satp_mode = VM_1_10_SV64;
> +        } else if (cpu->cfg.sv57 == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("sv57");
> +            cpu->cfg.satp_mode = VM_1_10_SV57;
> +        } else if (cpu->cfg.sv48 == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("sv48");
> +            cpu->cfg.satp_mode = VM_1_10_SV48;
> +        } else if (cpu->cfg.sv39 == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("sv39");
> +            cpu->cfg.satp_mode = VM_1_10_SV39;
> +        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
> +            cpu->cfg.satp_mode_str = g_strdup("none");
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> +        }
> +    }
> +
> +    /*
> +     * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
> +     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> +     */
> +    if (cpu->cfg.satp_mode == VM_1_10_UNDEF) {
> +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +            if (rv32) {
> +                cpu->cfg.satp_mode_str = g_strdup("sv32");
> +                cpu->cfg.satp_mode = VM_1_10_SV32;
> +            } else {
> +                cpu->cfg.satp_mode_str = g_strdup("sv57");
> +                cpu->cfg.satp_mode = VM_1_10_SV57;
> +            }
> +        } else {
> +            cpu->cfg.satp_mode_str = g_strdup("none");
> +            cpu->cfg.satp_mode = VM_1_10_MBARE;
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
> @@ -915,6 +975,102 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      mcc->parent_realize(dev, errp);
>  }
>  
> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    /* First, get rid of 32-bit/64-bit incompatibilities */
> +    if (rv32) {
> +        if (cpu->cfg.sv39 == ON_OFF_AUTO_ON
> +                || cpu->cfg.sv48 == ON_OFF_AUTO_ON
> +                || cpu->cfg.sv57 == ON_OFF_AUTO_ON
> +                || cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
> +            error_setg(errp, "cannot enable 64-bit satp modes "
> +                       "(sv39/sv48/sv57/sv64)");
> +            error_append_hint(errp, "cpu is in 32-bit mode, 64-bit satp modes "
> +                              "can't be enabled\n");
> +            return;
> +        }
> +    } else {
> +        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
> +            error_setg(errp, "cannot enable 32-bit satp mode (sv32)");
> +            error_append_hint(errp, "cpu is in 64-bit mode, 32-bit satp mode "
> +                              "can't be enabled\n");
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Then make sure the user did not ask for an invalid configuration as per
> +     * the specification.
> +     */
> +    switch (cpu->cfg.satp_mode) {
> +    case VM_1_10_SV32:
> +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
> +            error_setg(errp, "cannot disable mbare satp mode");
> +            error_append_hint(errp, "mbare satp mode must be enabled if sv32 "
> +                              "is enabled\n");
> +            return;
> +        }
> +
> +        break;
> +    case VM_1_10_SV39:
> +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
> +            error_setg(errp, "cannot disable mbare satp mode");
> +            error_append_hint(errp, "mbare satp mode must be enabled if sv39 "
> +                              "is enabled\n");
> +            return;
> +        }
> +
> +        break;
> +    case VM_1_10_SV48:
> +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF) {
> +            error_setg(errp, "cannot disable mbare/sv39 satp modes");
> +            error_append_hint(errp, "mbare/sv39 satp modes must be enabled if "
> +                              "sv48 is enabled\n");

Combined errors like this make the user look to see which one it is. I
think we can we reorganize this switch to fall through from largest to
smallest allowing the checks for smaller widths and mbare to be shared.
If a user has more than one problem then they'll only see an error for the
larger first, but then they'll try again and see the next one. In each
case they'll see exactly what needs to be fixed, though.

> +            return;
> +        }
> +
> +        break;
> +    case VM_1_10_SV57:
> +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF) {
> +            error_setg(errp, "cannot disable mbare/sv39/sv48 satp modes");
> +            error_append_hint(errp, "mbare/sv39/sv48 satp modes must be "
> +                              "enabled if sv57 is enabled\n");
> +            return;
> +        }
> +
> +        break;
> +    case VM_1_10_SV64:
> +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF
> +                || cpu->cfg.sv57 == ON_OFF_AUTO_OFF) {
> +            error_setg(errp, "cannot disable mbare/sv39/sv48/sv57 satp "
> +                       "modes");
> +            error_append_hint(errp, "mbare/sv39/sv48/sv57 satp modes must be "
> +                              "enabled if sv57 is enabled\n");
> +            return;
> +        }
> +
> +        break;
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
> @@ -1094,6 +1250,14 @@ static Property riscv_cpu_properties[] = {
>  
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
> +    DEFINE_PROP_ON_OFF_AUTO("mbare", RISCVCPU, cfg.mbare, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("sv32", RISCVCPU, cfg.sv32, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("sv39", RISCVCPU, cfg.sv39, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("sv48", RISCVCPU, cfg.sv48, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("sv57", RISCVCPU, cfg.sv57, ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("sv64", RISCVCPU, cfg.sv64, ON_OFF_AUTO_AUTO),

I'm not sure what types of issues may arise mixing booleans and OnOffAutos
in a future cpu-model-expansion. I also think we can simplify things by
using arm's sve* boolean properties as a pattern. For that, each property
is a boolean which shares the same get and set accessors. The set accessor
not only sets the property to true/false, but also tracks that the user
did the setting, allowing for sanity checks at finalize time.

Using a pair of bitmaps for the sv properties, where VM_1_10_SV* are used
for the bit numbers, should work well. Validating input will likely reduce
to some bitmap comparing operations. It would also drop all the extra cfg
state. In fact, one of the temporary bitmaps could use the satp_mode
member, before the final result gets written to it. So, only a single
extra uint8_t for the other bitmap is needed.

> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f..dcdde1e0b7 100644
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
> @@ -480,6 +481,10 @@ struct RISCVCPUConfig {
>      bool debug;
>  
>      bool short_isa_string;
> +
> +    OnOffAuto mbare, sv32, sv39, sv48, sv57, sv64;
> +    uint8_t satp_mode;
> +    char *satp_mode_str;
>  };
>  
>  typedef struct RISCVCPUConfig RISCVCPUConfig;
> @@ -789,4 +794,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>  
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>  
> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> +
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index d8f5f0abed..3e67a815d5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -590,6 +590,7 @@ typedef enum {
>  #define VM_1_10_SV48        9
>  #define VM_1_10_SV57        10
>  #define VM_1_10_SV64        11
> +#define VM_1_10_UNDEF       16
>  
>  /* Page table entry (PTE) fields */
>  #define PTE_V               0x001 /* Valid */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..d2aab1627e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>  
>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> +    vm &= 0xf;
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        return valid_vm_1_10_32[vm & 0xf];
> +        return valid_vm_1_10_32[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      } else {
> -        return valid_vm_1_10_64[vm & 0xf];
> +        return valid_vm_1_10_64[vm] &&
> +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
>      }
>  }
>  
> -- 
> 2.37.2
>

Thanks,
drew

