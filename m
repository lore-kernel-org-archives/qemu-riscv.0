Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFy4a-0006om-7l
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 08:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pFy4D-0006jO-Os
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:56:29 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pFy3p-0004Y5-Kj
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:56:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso15097669wms.5
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bR4Af2RZyxEDuvk4gSG5bIeoG+aXm1oIHB0AEur0ySg=;
 b=6qqUOMLt3y65svjlY+lEMDxkWhvRRKLwmHco3610SSn+fatnKAPYnOSPoquyiehYoq
 w/ZXjkI54UciLbkYGCLzaDj+nV1v+CoOUFi3XsQw+gmN08wsZedaxm0yCrCm85NtqYOa
 i+AIHd1yymSG7HVbM5SF3OcQAuY75ml8JolU3whQFfiK2N8mgxWP0Ks6w7FGJws1oel1
 H2GRTQh5BlTYQujBB9Uv+VpLDNFv0hhjwPyuRr0nWyALJXTeBcX8wBs1s0ctFStejLeG
 85pGQ5ps2Oki6EpjNpximojgYanoDkmQ31wZ9CVv0UMO/XWY0h4KruGk8oNCCriz2zaW
 oQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bR4Af2RZyxEDuvk4gSG5bIeoG+aXm1oIHB0AEur0ySg=;
 b=Px6YknJjFHAH+bBw8OMdndVzqfrVb/1vD/Nl8WaR7ZEYZlIn7PNdCyqg8g9DAGeakS
 3q9Whq5aLoa5J82KMPOk8+QrU3Mh1t0r018EFExQr49Y0Jc2jgLBJefdb+1KYCnQxc8H
 apcjqACSJdCMxX5/TBGNytRMGkz4609QwgA6xgEicng+cc0wdU39mNcEpeFaNiYv0tBR
 7/cXhNgdGySIQWnKvPLqT8zQDSrGYDBmdhkhIfcpB8CZHBvSM7pCXkML5Tn8QZOzX3pc
 iKjNLKPzKX7Qt2kXrrk7WbwfhJEm4+iECRKDDWEhZvfhSXoHBVppKCRf7r2mHN6QeDIv
 DtQA==
X-Gm-Message-State: AFqh2kro5UQTdHKJ/gpeiT7SVS/XXPpAaF4izaztaHgpXTl/GcFlLNkC
 EUiAnI0Tqi8oxPNAUmOSTa3CUwkPTnR3S3XGZ/TyHw==
X-Google-Smtp-Source: AMrXdXvqv1JKgKk3zPLh3mqYCFsu24d6979hj9Ejh8pmRONNakUwuSFH8J7+6Po6nm1JyLpu+VqIvKun1DijbTTsjRs=
X-Received: by 2002:a1c:4c02:0:b0:3d9:fbc2:578 with SMTP id
 z2-20020a1c4c02000000b003d9fbc20578mr397312wmf.155.1673531763350; Thu, 12 Jan
 2023 05:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221212102250.3365948-1-alexghiti@rivosinc.com>
 <20230106163045.jerqbds3mgi3ri4e@orel>
In-Reply-To: <20230106163045.jerqbds3mgi3ri4e@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 12 Jan 2023 13:55:52 +0000
Message-ID: <CAHVXubhvq8d-+uhHBmZYetVXqF9GhtZKEpti8SgwPaOmH7H4mg@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 13:56:38 -0000

Hey Andrew,

Sorry about the response delay, I was traveling.

On Fri, Jan 6, 2023 at 4:30 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Dec 12, 2022 at 11:22:50AM +0100, Alexandre Ghiti wrote:
> > RISC-V specifies multiple sizes for addressable memory and Linux probes for
> > the machine's support at startup via the satp CSR register (done in
> > csr.c:validate_vm).
> >
> > As per the specification, sv64 must support sv57, which in turn must
> > support sv48...etc. So we can restrict machine support by simply setting the
> > "highest" supported mode and the bare mode is always supported.
> >
> > You can set the satp mode using the new properties "mbare", "sv32",
> > "sv39", "sv48", "sv57" and "sv64" as follows:
> > -cpu rv64,sv57=on # Linux will boot using sv57 scheme
> > -cpu rv64,sv39=on # Linux will boot using sv39 scheme
> >
> > We take the highest level set by the user:
> > -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> >
> > We make sure that invalid configurations are rejected:
> > -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> > -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
> >                          # enabled
> >
> > We accept "redundant" configurations:
> > -cpu rv64,sv48=on,sv57=off # sv39 must be supported if higher modes are
>                              ^ from this #, it looks like a copy+paste
>                              mistake

Yes, something is not right here, thanks.

> >
> > In addition, we now correctly set the device-tree entry 'mmu-type' using
> > those new properties.
> >
> > Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> > v4:
> > - Use custom boolean properties instead of OnOffAuto properties, based
> >   on ARMVQMap, as suggested by Andrew
> >
> > v3:
> > - Free sv_name as pointed by Bin
> > - Replace satp-mode with boolean properties as suggested by Andrew
> > - Removed RB from Atish as the patch considerably changed
> >
> > v2:
> > - Use error_setg + return as suggested by Alistair
> > - Add RB from Atish
> > - Fixed checkpatch issues missed in v1
> > - Replaced Ludovic email address with the rivos one
> >
> >  hw/riscv/virt.c    |  20 +++--
> >  target/riscv/cpu.c | 217 +++++++++++++++++++++++++++++++++++++++++++--
> >  target/riscv/cpu.h |  25 ++++++
> >  target/riscv/csr.c |  13 ++-
> >  4 files changed, 256 insertions(+), 19 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b4..9bb5ba7366 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >      int cpu;
> >      uint32_t cpu_phandle;
> >      MachineState *mc = MACHINE(s);
> > -    char *name, *cpu_name, *core_name, *intc_name;
> > +    uint8_t satp_mode_max;
> > +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> >
> >      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> >          cpu_phandle = (*phandle)++;
> > @@ -236,14 +237,15 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >          cpu_name = g_strdup_printf("/cpus/cpu@%d",
> >              s->soc[socket].hartid_base + cpu);
> >          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> > -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> > -                          RISCV_FEATURE_MMU)) {
> > -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> > -        } else {
> > -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > -                                    "riscv,none");
> > -        }
> > +
> > +        satp_mode_max = satp_mode_max_from_map(
> > +                            s->soc[socket].harts[cpu].cfg.satp_mode.map,
> > +                            is_32_bit);
> > +        sv_name = g_strdup_printf("riscv,%s",
> > +                                  satp_mode_str(satp_mode_max, is_32_bit));
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> > +        g_free(sv_name);
> > +
> >          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> >          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
> >          g_free(name);
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d14e95c9dc..639231ce2e 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -27,6 +27,7 @@
> >  #include "time_helper.h"
> >  #include "exec/exec-all.h"
> >  #include "qapi/error.h"
> > +#include "qapi/visitor.h"
> >  #include "qemu/error-report.h"
> >  #include "hw/qdev-properties.h"
> >  #include "migration/vmstate.h"
> > @@ -199,7 +200,7 @@ static const char * const riscv_intr_names[] = {
> >      "reserved"
> >  };
> >
> > -static void register_cpu_props(DeviceState *dev);
> > +static void register_cpu_props(Object *obj);
>
> Please do this dev -> obj change in a separate ("no functional change
> intended") patch.

Ok, I can do that.

>
> >
> >  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
> >  {
> > @@ -237,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >  #endif
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > -    register_cpu_props(DEVICE(obj));
> > +    register_cpu_props(obj);
> >  }
> >
> >  #if defined(TARGET_RISCV64)
> > @@ -246,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV64, 0);
> > -    register_cpu_props(DEVICE(obj));
> > +    register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> >  }
> > @@ -279,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV128, 0);
> > -    register_cpu_props(DEVICE(obj));
> > +    register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> >  }
> > @@ -289,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV32, 0);
> > -    register_cpu_props(DEVICE(obj));
> > +    register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> >  }
> > @@ -342,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
> >  #elif defined(TARGET_RISCV64)
> >      set_misa(env, MXL_RV64, 0);
> >  #endif
> > -    register_cpu_props(DEVICE(obj));
> > +    register_cpu_props(obj);
> >  }
> >  #endif
> >
> > @@ -612,6 +613,71 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
> >      }
> >  }
> >
> > +#define OFFSET_SATP_MODE_64     16
>
> It's not clear to me why we need this offset. Looking below it seems to be
> for helping to distinguish rv64-only modes when sanity checking modes for
> rv32, but can't we just do that with valid_vm_1_10_32/64[]?

If we don't duplicate the bitmap for rv32 and rv64, it's hard to
reject the following input -cpu rv64,sv32=on but using
valid_vm_1_10_32/64 could do the trick indeed.

>
> > +
> > +static uint8_t idx_satp_mode_from_str(const char *satp_mode_str)
>
> nit: I'd drop the 'idx_' prefix.

This function does not return the 'real' satp_mode, but the index in
the bitmap (which is offsetted for 64-bit), will remove if I can get
rid of OFFSET_SATP_MODE_64.

>
> > +{
> > +    if (!strncmp(satp_mode_str, "mbare", 5)) {
> > +        return VM_1_10_MBARE;
> > +    }
>
> Do we need a property for mbare? It should always be present, no?

That's an interesting question actually: in this patch version, to
only enable mbare mode, one should use "mbare=on". But that's weird
actually, I think we should rather explicitly disable the mode n+1,
ie:

sv39=off # enable mbare only
sv48=off # enable sv39
...etc

So you're right, mbare is always there, so I'll remove the property.

>
> > +
> > +    if (!strncmp(satp_mode_str, "sv32", 4)) {
> > +        return VM_1_10_SV32;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv39", 4)) {
> > +        return VM_1_10_SV39 + OFFSET_SATP_MODE_64;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv48", 4)) {
> > +        return VM_1_10_SV48 + OFFSET_SATP_MODE_64;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv57", 4)) {
> > +        return VM_1_10_SV57 + OFFSET_SATP_MODE_64;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv64", 4)) {
> > +        return VM_1_10_SV64 + OFFSET_SATP_MODE_64;
> > +    }
> > +
> > +    /* Will never get there */
> > +    return -1;
>
> g_assert_not_reached()

Thanks

>
> > +}
> > +
> > +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit)
>
> We shouldn't need is_32_bit.
>

If we get rid of OFFSET_SATP_MODE_64, I agree.

> > +{
> > +    return is_32_bit ?
> > +        (31 - __builtin_clz(map & 0xFFFF)) : (31 - __builtin_clz(map >> 16));
>
> __builtin_clz is undefined when its input is zero, so we should either
> use the clz32() wrapper or handle zero ourselves. How about
>
>  {
>    /*
>     * map is always valid when this is called. It's either zero or
>     * only valid mode bits are set.
>     */
>    return map ? __builtin_clz(map) : 0;
>  }
>

I did not know, thanks

> > +}
> > +
> > +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>
> This function is not used outside this file, so can be static.

It is actually used in hw/riscv/virt.c

> Since we pass is_32_bit in here, then I don't think we need
> OFFSET_SATP_MODE_64
>
> > +{
> > +    if (is_32_bit) {
> > +        switch (satp_mode) {
> > +        case VM_1_10_SV32:
> > +            return "sv32";
> > +        case VM_1_10_MBARE:
> > +            return "none";
> > +        }
> > +    } else {
> > +        switch (satp_mode) {
> > +        case VM_1_10_SV64:
> > +            return "sv64";
> > +        case VM_1_10_SV57:
> > +            return "sv57";
> > +        case VM_1_10_SV48:
> > +            return "sv48";
> > +        case VM_1_10_SV39:
> > +            return "sv39";
> > +        case VM_1_10_MBARE:
> > +            return "none";
> > +        }
> > +    }
> > +
> > +    return NULL;
>
> g_assert_not_reached()

Thanks

>
> > +}
> > +
> >  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >  {
> >      CPUState *cs = CPU(dev);
> > @@ -907,6 +973,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >       }
> >  #endif
> >
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +
> > +    /*
> > +     * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
> > +     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> > +     */
> > +    if (cpu->cfg.satp_mode.map == 0) {
> > +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > +            if (rv32) {
> > +                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv32"));
> > +            } else {
> > +                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv57"));
> > +            }
> > +        } else {
> > +            cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("mbare"));
>
> If we can drop the mbare property then it's implied and we don't need to
> add it to the map.

Agreed

>
> > +        }
> > +    }
> > +
> > +    riscv_cpu_finalize_features(cpu, &local_err);
> > +    if (local_err != NULL) {
> > +        error_propagate(errp, local_err);
> > +        return;
> > +    }
> > +
> >      riscv_cpu_register_gdb_regs_for_features(cs);
> >
> >      qemu_init_vcpu(cs);
> > @@ -915,6 +1005,115 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >      mcc->parent_realize(dev, errp);
> >  }
> >
> > +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
> > +{
> > +    RISCVSATPMap *satp_map = opaque;
> > +    uint8_t idx_satp = idx_satp_mode_from_str(name);
> > +    bool value;
> > +
> > +    value = (satp_map->map & (1 << idx_satp));
> > +
> > +    visit_type_bool(v, name, &value, errp);
> > +}
> > +
> > +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
> > +{
> > +    RISCVSATPMap *satp_map = opaque;
> > +    uint8_t idx_satp = idx_satp_mode_from_str(name);
> > +    bool value;
> > +
> > +    if (!visit_type_bool(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (value) {
> > +        satp_map->map |= 1 << idx_satp;
> > +    }
>
> If the user does e.g. sv32=on,sv32=off, which is pointless but valid,
> then unless we have an
>
>    else {
>        satp_map->map &= ~(1 << idx_satp);
>    }
>
> we won't properly disable sv32. It's best to use deposit32.

Ok thanks, I'll take a look at this function.

>
> > +
> > +    satp_map->init |= 1 << idx_satp;
> > +}
> > +
> > +static void riscv_add_satp_mode_properties(Object *obj)
> > +{
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> > +    object_property_add(obj, "mbare", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> > +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +}
> > +
> > +#define error_append_or_setg(errp, str, ...) ({             \
> > +        if (*errp)                                          \
> > +            error_append_hint(errp, str"\n", ##__VA_ARGS__);\
> > +        else                                                \
> > +            error_setg(errp, str, ##__VA_ARGS__);           \
> > +    })
>
> Missing {} on the if/else and the if should be if (errp && *errp), but
> I'd rather not have this macro at all. Why not just do error_setg and
> return on the first error? I realize the user will only get one error
> per try, but why not, at least they won't get confused as to what to
> fix each try.

Ok, I'll do that then!

>
> > +
> > +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>
> This is only called from one place in the same file, so it can be static.

Ok

>
> > +{
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +
> > +    /* Get rid of 32-bit/64-bit incompatibility */
> > +    if (rv32) {
> > +        if (cpu->cfg.satp_mode.map >= (1 << OFFSET_SATP_MODE_64))
>
> Missing {}

Ok

>
> > +            error_append_or_setg(errp, "cannot enable 64-bit satp modes "
> > +                                 "(sv39/sv48/sv57/sv64) if cpu is in 32-bit "
>
> I'd drop the "(sv39/sv48/sv57/sv64)" rather than introduce another place to
> maintain when the list changes.

Ok

>
> > +                                 "mode");
> > +    } else {
> > +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32))
> > +            error_append_or_setg(errp, "cannot enable 32-bit satp mode (sv32) "
> > +                                 "if cpu is in 64-bit mode");
> > +    }
> > +
> > +    /*
> > +     * Then make sure the user did not ask for an invalid configuration as per
> > +     * the specification.
> > +     */
> > +    if (rv32) {
> > +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32)) {
> > +            if (!(cpu->cfg.satp_mode.map & (1 << VM_1_10_MBARE)) &&
> > +                 (cpu->cfg.satp_mode.init & (1 << VM_1_10_MBARE)))
>
> Missing {}

Ok

>
> > +                error_append_or_setg(errp, "cannot disable mbare satp mode if "
> > +                                     "sv32 is enabled");
>
>   } else if ((cpu->cfg.satp_mode.map & (1 << VM_1_10_MBARE)) &&
>              !(cpu->cfg.satp_mode.init & (1 << VM_1_10_MBARE))) {
>       cpu->cfg.satp_mode.map |= (1 << VM_1_10_MBARE);
>   }

I can remove this check as mbare is always present

>
> > +        }
> > +    } else {
> > +        uint8_t satp_mode_max;
> > +
> > +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, false);
> > +
> > +        for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +            if (!(cpu->cfg.satp_mode.map & (1 << (i + OFFSET_SATP_MODE_64))) &&
> > +                 (cpu->cfg.satp_mode.init & (1 << (i + OFFSET_SATP_MODE_64))))
>
> Missing {}

Ok

>
> > +                error_append_or_setg(errp, "cannot disable %s satp mode if %s "
> > +                                     "is enabled",
> > +                                     satp_mode_str(i, false),
> > +                                     satp_mode_str(satp_mode_max, false));
>
> Same else-if concept needed here. Since I'd think we'd want to populate
> the map with all the implicit modes.

The point of this function is to make sure the user did not ask for an
invalid configuration, right? As for setting the bits of the implicit
modes, I'll see if that's needed, I'm not opposed to it, just did not
find the utility.

>
> > +        }
> > +    }
>
> Additionally I'd think we want to try and work valid_vm_1_10_32/64[]
> checks into this function in order to be sure that map is fully populated
> with valid bits when we're done.

Ok I'll try to come up with something.

>
> > +}
> > +
> > +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> > +{
> > +    Error *local_err = NULL;
> > +
> > +    riscv_cpu_satp_mode_finalize(cpu, &local_err);
> > +    if (local_err != NULL) {
> > +        error_propagate(errp, local_err);
> > +        return;
> > +    }
> > +}
> > +
> >  #ifndef CONFIG_USER_ONLY
> >  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
> >  {
> > @@ -1070,13 +1269,16 @@ static Property riscv_cpu_extensions[] = {
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > -static void register_cpu_props(DeviceState *dev)
> > +static void register_cpu_props(Object *obj)
> >  {
> >      Property *prop;
> > +    DeviceState *dev = DEVICE(obj);
> >
> >      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> >          qdev_property_add_static(dev, prop);
> >      }
> > +
> > +    riscv_add_satp_mode_properties(obj);
> >  }
> >
> >  static Property riscv_cpu_properties[] = {
> > @@ -1094,6 +1296,7 @@ static Property riscv_cpu_properties[] = {
> >
> >      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> >      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> > +
>
> Stray change

Thanks

>
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 3a9e25053f..1717b33321 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -27,6 +27,7 @@
> >  #include "qom/object.h"
> >  #include "qemu/int128.h"
> >  #include "cpu_bits.h"
> > +#include "qapi/qapi-types-common.h"
> >
> >  #define TCG_GUEST_DEFAULT_MO 0
> >
> > @@ -407,6 +408,22 @@ struct RISCVCPUClass {
> >      DeviceReset parent_reset;
> >  };
> >
> > +/*
> > + * map and init are divided into two 16bit bitmaps: the upper one is for rv64
> > + * and the lower one is for rv32, this is because the value for sv32 (ie. 1)
> > + * may be reused later for another purpose for rv64 (see the specification which
> > + * states that it is "reserved for standard use").
>
> I understand this, but I'm not sure why we can't use the same bit1 for
> rv32 to mean one thing and for rv64 another. We can have another define
> for rv64 that is also 1 and valid_vm_1_10_64[] is the authority.

Ok

>
> > + *
> > + * In a 16bit bitmap in map, the most significant set bit is the maximum
> > + * satp mode that is supported.
> > + *
> > + * Both 16bit bitmaps in init are used to make sure the user selected a correct
> > + * combination as per the specification.
> > + */
> > +typedef struct {
> > +    uint32_t map, init;
> > +} RISCVSATPMap;
> > +
> >  struct RISCVCPUConfig {
> >      bool ext_i;
> >      bool ext_e;
> > @@ -480,6 +497,8 @@ struct RISCVCPUConfig {
> >      bool debug;
> >
> >      bool short_isa_string;
> > +
> > +    RISCVSATPMap satp_mode;
> >  };
> >
> >  typedef struct RISCVCPUConfig RISCVCPUConfig;
> > @@ -789,4 +808,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >
> >  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> >
> > +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit);
> > +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> > +
> > +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
>
> satp_mode_str and riscv_cpu_satp_mode_finalize should be static
> so they should be dropped from here.

Yes riscv_cpu_satp_mode_finalize can be dropped

>
> > +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> > +
> >  #endif /* RISCV_CPU_H */
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 5c9a7ee287..5c732653b2 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1109,10 +1109,17 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
> >
> >  static int validate_vm(CPURISCVState *env, target_ulong vm)
> >  {
> > -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> > -        return valid_vm_1_10_32[vm & 0xf];
> > +    uint8_t satp_mode_max;
> > +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> > +    bool is_32_bit = riscv_cpu_mxl(env) == MXL_RV32;
> > +
> > +    vm &= 0xf;
> > +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, is_32_bit);
> > +
> > +    if (is_32_bit) {
> > +        return valid_vm_1_10_32[vm] && (vm <= satp_mode_max);
> >      } else {
> > -        return valid_vm_1_10_64[vm & 0xf];
> > +        return valid_vm_1_10_64[vm] && (vm <= satp_mode_max);
> >      }
> >  }
> >
> > --
> > 2.37.2
> >
>
> Thanks,
> drew

Lot to process but I'll be back soon with a v5.

Thanks for the thorough review,

Alex

