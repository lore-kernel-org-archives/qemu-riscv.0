Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHosG-00062M-HH
	for mharc-qemu-riscv@gnu.org; Tue, 17 Jan 2023 11:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pHosF-00061j-14
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 11:31:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pHos9-0006vS-SQ
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 11:31:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so3529306wms.4
 for <qemu-riscv@nongnu.org>; Tue, 17 Jan 2023 08:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rZlt9WVMcLeg+H81wpGYFJQ7WRooxp8oGyk3f4lXtKM=;
 b=N9bl67XKF8TzPtKY1EuTL/TYSgXD8XdzSdFsnMPYuoip24L7XPa8bp7pRtGxUWiZTl
 w8vrbpIxD4cYxJS4IlJrl8G/qY9ZntKxGJFGrqAVzrAkP47wfY/ZJi0QTpT9Tmg/Oq8x
 fhg4g0gQbjYZXKhRtg2FhxkXcXXAeqYR/WCd3WThbuUsaXBcpVTJkOWuBSKS6aECTahE
 5hCxEm4Ty29Hu5MJWwniBf4za6HdP5KxgrFmJ0mMMEtYf5T3DoThx8FkAy26m4eOPRXt
 UfJnCB4SiNtl7cLeLJ7Z4vrpmzlWFlKQL+lmq+V216KEfKOq36itqyVlPGvWqjAkSKsJ
 AtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZlt9WVMcLeg+H81wpGYFJQ7WRooxp8oGyk3f4lXtKM=;
 b=MCA2GMHUh3UvQlnzUB8oPs4EaSF3KmmOUCzkoDRctqj72CFqAGmG7skkcGqTvFmKeB
 h0yC5RkjbcLay+ZaxR96t64UC8npSHNe0otLoMZcXocLkZ7yTZJkCpXJcPLYr62F1T4c
 +d2+cbdLZcz37N9S1kFrP8xtG9ZWm+tZi1FsVsmx37F64C8g2INh3uYZchifzOVhc59F
 Fa20dpsxHHHaRXSscYEzUrbswonMMfl9FvjSc1kmvKj/rB20B9LNiMBxReGD26EgBYKy
 +YeXk3iUHJ8WHwTb+oGXY54o6+t1Y6YOLrDCYCMfzkhMut8Wu0wF5Wor+6wlWYQ1f1hz
 JN/Q==
X-Gm-Message-State: AFqh2kqfxpb0v3afDlQDBvn3LwLPLCdOnBYoKZYci1OVDYQrex+CnELM
 97kHms0ajTocZ79nndq3zhzVqw==
X-Google-Smtp-Source: AMrXdXvbdpn0/xQU/MWpltZ+o07Bq8Aqm1QzhQyxY89Mqsg10UigurvWVFldi7QiUz4RnOypcPiFWg==
X-Received: by 2002:a7b:cc14:0:b0:3da:50b0:e96a with SMTP id
 f20-20020a7bcc14000000b003da50b0e96amr3641031wmh.29.1673973100293; 
 Tue, 17 Jan 2023 08:31:40 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003db09eaddb5sm2853316wms.3.2023.01.17.08.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 08:31:39 -0800 (PST)
Date: Tue, 17 Jan 2023 17:31:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230117163138.jze47hjeeuwu2k4j@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113103453.42776-3-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Tue, 17 Jan 2023 16:31:47 -0000

On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
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
> -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>                            # enabled
> 
> We accept "redundant" configurations:
> -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> -cpu rv64,sv32=on,sv32=off # Linux will boot using sv57 scheme (the default)
> 
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> those new properties.
> 
> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  hw/riscv/virt.c    |  19 ++--
>  target/riscv/cpu.c | 221 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  19 ++++
>  target/riscv/csr.c |  17 +++-
>  4 files changed, 262 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 94ff2a1584..48d034a5f7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    uint8_t satp_mode_max;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>  
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");

I just noticed that for the virt machine type, when the user doesn't
provide a satp mode cpu property on the command line, and hence gets
the default mode, they'll be silently changed from sv48 to sv57. That
default change should be a separate patch which comes after this one.
BTW, why sv57 and not sv48 or sv64?

> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        satp_mode_max = satp_mode_max_from_map(
> +                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  satp_mode_str(satp_mode_max, is_32_bit));
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +        g_free(sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7181b34f86..1f0d040a80 100644
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
> @@ -229,6 +230,85 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
>      env->vext_ver = vext_ver;
>  }
>  
> +static uint8_t satp_mode_from_str(const char *satp_mode_str)
> +{
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
> +static void set_satp_mode(RISCVCPU *cpu, const char *satp_mode_str)
> +{
> +    cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str(satp_mode_str));
> +}
> +
> +static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> +{
> +    /*
> +     * If an mmu is present, the default satp mode is:
> +     * - sv32 for 32-bit
> +     * - sv57 for 64-bit
> +     * Otherwise, it is mbare.
> +     */

I'd drop the above comment since it only repeats what the code says.

> +
> +    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> +        set_satp_mode(cpu, is_32_bit ? "sv32" : "sv57");
> +    } else {
> +        set_satp_mode(cpu, "mbare");

nit: Could probably integrate set_satp_mode() into this function since
this function is the only place it's used.

> +    }
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -619,6 +699,53 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>      }
>  }
>  
> +static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> +{
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    const char *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;

Not a problem of this patch, but valid_vm_1_10_32/64 has a strange type.
It's used like a boolean, so should be bool. Since you're touching the
arrays and validate_vm() it'd be nice to change the array type and
the return value of validate_vm() with a separate patch first.

> +
> +    /* Get rid of 32-bit/64-bit incompatibility */
> +    for (int i = 0; i < 16; ++i) {
> +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {

If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
accepted as an alias. I think we should simply not define the sv32
property for rv64 nor the rv64-only modes for rv32. So, down in
riscv_add_satp_mode_properties() we can add some

  #if defined(TARGET_RISCV32)
  ...
  #elif defined(TARGET_RISCV64)
  ...
  #endif

and then drop the check here.

> +            error_setg(errp, "satp_mode %s is not valid",
> +                       satp_mode_str(i, !rv32));
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Make sure the user did not ask for an invalid configuration as per
> +     * the specification.
> +     */
> +    if (!rv32) {
> +        uint8_t satp_mode_max;
> +
> +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +
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
> @@ -919,6 +1046,55 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>  #endif
>  
> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +
> +    if (cpu->cfg.satp_mode.map == 0) {
> +        /*
> +         * If unset by both the user and the cpu, we fallback to the default
> +         * satp mode.
> +         */
> +        if (cpu->cfg.satp_mode.init == 0) {
> +            set_satp_mode_default(cpu, rv32);
> +        } else {
> +            /*
> +             * Find the lowest level that was disabled and then enable the
> +             * first valid level below which can be found in
> +             * valid_vm_1_10_32/64.
> +             */
> +            const char *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> +
> +            for (int i = 0; i < 16; ++i) {

'init' will never have bit0 (mbare) set, so we can start at i=1, which is
good, because the condition below assumes it can index an array at i-1.

> +                if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> +                    (cpu->cfg.satp_mode.init & (1 << i)) &&
> +                    valid_vm[i]) {
> +                    for (int j = i - 1; j >= 0; --j) {
> +                        if (valid_vm[j]) {
> +                            cpu->cfg.satp_mode.map |= (1 << j);
> +                            break;
> +                        }
> +                    }
> +                    break;
> +                }
> +            }
> +
> +            /*
> +             * The user actually init a satp mode but appears to be invalid
> +             * (ex: "-cpu rv64,sv32=on,sv32=off"). Fallback to the default

This example, where sv32 is used with rv64, won't be possible if we don't
give rv64 the sv32 property.

> +             * mode.
> +             */
> +            if (cpu->cfg.satp_mode.map == 0) {
> +                set_satp_mode_default(cpu, rv32);

If the user does rv64,sv39=on,sv39=off, then I think we should be creating
an mbare machine, rather than using the default.

> +            }
> +        }
> +    }

Why isn't all this 'if (cpu->cfg.satp_mode.map == 0)' block above at the
top of riscv_cpu_satp_mode_finalize() instead of here?

> +
> +    riscv_cpu_finalize_features(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +

extra blank line

>      riscv_cpu_register_gdb_regs_for_features(cs);
>  
>      qemu_init_vcpu(cs);
> @@ -927,6 +1103,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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

As mentioned above, I think we want to do

> +
  #if defined(TARGET_RISCV32)
> +    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
  #elif defined(TARGET_RISCV64)
> +    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> +    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
  #endif
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  {
> @@ -1091,6 +1310,8 @@ static void register_cpu_props(Object *obj)
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    riscv_add_satp_mode_properties(obj);
>  }
>  
>  static Property riscv_cpu_properties[] = {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5609b62a2..0ffa1bcfd5 100644
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
> +extern const char valid_vm_1_10_32[], valid_vm_1_10_64[];
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
> index 0db2c233e5..6e27299761 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>  
> -static const char valid_vm_1_10_32[16] = {
> +const char valid_vm_1_10_32[16] = {
>      [VM_1_10_MBARE] = 1,
>      [VM_1_10_SV32] = 1
>  };
>  
> -static const char valid_vm_1_10_64[16] = {
> +const char valid_vm_1_10_64[16] = {
>      [VM_1_10_MBARE] = 1,
>      [VM_1_10_SV39] = 1,
>      [VM_1_10_SV48] = 1,
> @@ -1211,10 +1211,17 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
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
> +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
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

Thanks,
drew

