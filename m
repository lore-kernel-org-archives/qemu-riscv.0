Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMr4U-0005AM-7l
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMr4T-0005AD-7z
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:53:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMr4Q-0008Hn-QG
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:53:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id o18so4798804wrj.3
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tr+9fMoK+7xem/mByWkxsjyKMwLe6C3vy1wJdrSguU=;
 b=H5Advl6ZBid+GJzf4xI2ifFlNVnO09QddiszDejkKDRpueL/OOSecRfZixhkjHQuxN
 AabEa+AtMn5NEungOpbpU0GGA+WCUE15ma4NK7sYFQzbbQk9Nw6lHu9cuSOpxJhokpsj
 8Uky1JbqKiFsBys16z4jA/XITCpDdssNyqo4BkG5nMI74esCyDMCJ7YoZvU/QAqSpWDM
 4dSOuvhOhCO0d6CMYd28iXquWe/VGtVDd2lIQ8PN5dSU7lzyTP5hDOyCMFH+mGDm4VKF
 lFNjWTo+vpxVeKu7PNotFgXakkfbzHvk7+0JnoMqwdw2vC1Bjr1AU/zYYX0+fpYlDI1a
 wyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Tr+9fMoK+7xem/mByWkxsjyKMwLe6C3vy1wJdrSguU=;
 b=j53YQ9KWQMHs7aRS57/r6sl7M37IuQBaSWrK3G1lYqaRBXW7Ix1ggrD+1hktHeMQgj
 iuSRs0HJPQVwfs+uKveYs4S7QlK2f1v+vJ7M+f8ubOPwwce+UO6WJj9wWPa9COs/spcT
 lezwhYwVZUyF1daqERv00ZHzYdMKZI09sx08WPKqwSDDXD+BFsqk79+X5GG7SwJJnoLc
 Tgcw2uAP74N8zz/Q9Do4aTldLzYX/DWILeGk3uCLdH1Vb5+5N5VrRtuWlL23j7MTB2ce
 OoRWVKk9YIPWPgQYdae/Tdzls/Y7jtqTx+g+mIYG9tf3kRykQG4WieAfHacCv0Ks3pa8
 JwYw==
X-Gm-Message-State: AO0yUKWV8H4YPxi8OUVwOHVc/xgjT4kKUkEXtgQyCLvvvIxyaRCdH3+S
 +CWGIdDBkRQwJY3JPhX1AMJrwQ8xVmEA7AEQG2GH0mGqk4W+lPTx
X-Google-Smtp-Source: AK7set+2aqBlB0j9DTUcnLkMgVHdK89AfIfoorjNMBvK2d4brBn2i1o+jQDR7zKOnlIlwDp4EXNqyQ/Jc0fy0DVPEhA=
X-Received: by 2002:adf:f787:0:b0:2bf:c4c8:af08 with SMTP id
 q7-20020adff787000000b002bfc4c8af08mr854190wrp.108.1675171250460; Tue, 31 Jan
 2023 05:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-4-alexghiti@rivosinc.com>
 <CAEUhbmVvtuB6__n2PxofOs34QZXDqGtYCaEwoqd1efE=tn6+2w@mail.gmail.com>
In-Reply-To: <CAEUhbmVvtuB6__n2PxofOs34QZXDqGtYCaEwoqd1efE=tn6+2w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 31 Jan 2023 14:20:39 +0100
Message-ID: <CAHVXubh5z6EPQTNVQBnhuv_GdaGk+sajFnpXAV5YNXB9aRcXtA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] riscv: Allow user to set the satp mode
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 13:53:13 -0000

Hi Bin,

On Mon, Jan 30, 2023 at 5:22 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 12:23 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > RISC-V specifies multiple sizes for addressable memory and Linux probes for
> > the machine's support at startup via the satp CSR register (done in
> > csr.c:validate_vm).
> >
> > As per the specification, sv64 must support sv57, which in turn must
> > support sv48...etc. So we can restrict machine support by simply setting the
> > "highest" supported mode and the bare mode is always supported.
> >
> > You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> > "sv57" and "sv64" as follows:
> > -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> > -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> > -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> > -cpu rv64          # Linux will boot using sv57 scheme by default
> >
> > We take the highest level set by the user:
> > -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> >
> > We make sure that invalid configurations are rejected:
> > -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
> >                            # enabled
> >
> > We accept "redundant" configurations:
> > -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> >
> > And contradictory configurations:
> > -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
> >
> > Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  target/riscv/cpu.c | 206 +++++++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/cpu.h |  19 +++++
> >  target/riscv/csr.c |  12 ++-
> >  3 files changed, 230 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7181b34f86..54494a72be 100644
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
> > @@ -229,6 +230,81 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
> >      env->vext_ver = vext_ver;
> >  }
> >
> > +static uint8_t satp_mode_from_str(const char *satp_mode_str)
> > +{
> > +    if (!strncmp(satp_mode_str, "mbare", 5)) {
> > +        return VM_1_10_MBARE;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv32", 4)) {
> > +        return VM_1_10_SV32;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv39", 4)) {
> > +        return VM_1_10_SV39;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv48", 4)) {
> > +        return VM_1_10_SV48;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv57", 4)) {
> > +        return VM_1_10_SV57;
> > +    }
> > +
> > +    if (!strncmp(satp_mode_str, "sv64", 4)) {
> > +        return VM_1_10_SV64;
> > +    }
> > +
> > +    g_assert_not_reached();
> > +}
> > +
> > +uint8_t satp_mode_max_from_map(uint32_t map)
> > +{
> > +    /* map here has at least one bit set, so no problem with clz */
> > +    return 31 - __builtin_clz(map);
> > +}
> > +
> > +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
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
> > +    g_assert_not_reached();
> > +}
> > +
> > +/* Sets the satp mode to the max supported */
> > +static void set_satp_mode_default(RISCVCPU *cpu)
>
> This function is better named as set_satp_mode_default_map
>

Indeed, fixed in v9.

> > +{
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +
> > +    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > +        cpu->cfg.satp_mode.map |=
> > +                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
> > +    } else {
> > +        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > +    }
>
> I believe the "mbare" bit should always be set, so this can be:
>
> cpu->cfg.satp_mode.map = 1 << satp_mode_from_str("mbare");
> if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
>        cpu->cfg.satp_mode.map |=
>                         (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));

Actually, at the end of riscv_cpu_satp_mode_finalize, the map is
"expanded" so that all supported modes are set in the bitmap.

>
> > +}
> > +
> >  static void riscv_any_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > @@ -619,6 +695,82 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
> >      }
> >  }
> >
> > +static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> > +{
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > +    uint8_t satp_mode_max;
> > +
> > +    if (cpu->cfg.satp_mode.map == 0) {
> > +        if (cpu->cfg.satp_mode.init == 0) {
> > +            /* If unset by the user, we fallback to the default satp mode. */
> > +            set_satp_mode_default(cpu);
> > +        } else {
> > +            /*
> > +             * Find the lowest level that was disabled and then enable the
> > +             * first valid level below which can be found in
> > +             * valid_vm_1_10_32/64.
> > +             */
> > +            for (int i = 1; i < 16; ++i) {
> > +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> > +                    valid_vm[i]) {
> > +                    for (int j = i - 1; j >= 0; --j) {
> > +                        if (valid_vm[j]) {
> > +                            cpu->cfg.satp_mode.map |= (1 << j);
> > +                            break;
> > +                        }
> > +                    }
> > +                    break;
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> > +    /* Make sure the configuration asked is supported by qemu */
> > +    for (int i = 0; i < 16; ++i) {
> > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > +            error_setg(errp, "satp_mode %s is not valid",
> > +                       satp_mode_str(i, rv32));
> > +            return;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * Make sure the user did not ask for an invalid configuration as per
> > +     * the specification.
> > +     */
> > +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > +
> > +    if (!rv32) {
> > +        for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +            if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> > +                (cpu->cfg.satp_mode.init & (1 << i)) &&
> > +                valid_vm[i]) {
> > +                error_setg(errp, "cannot disable %s satp mode if %s "
> > +                           "is enabled", satp_mode_str(i, false),
> > +                           satp_mode_str(satp_mode_max, false));
> > +                return;
> > +            }
> > +        }
> > +    }
> > +
> > +    /* Finally expand the map so that all valid modes are set */
> > +    for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +        cpu->cfg.satp_mode.map |= (1 << i);
>
> This blindly expands the map regardless whether it's a valid mode.

Oh, indeed, good catch, fixed in v9.

>
> > +    }
> > +}
> > +
> > +static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
> >  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >  {
> >      CPUState *cs = CPU(dev);
> > @@ -919,6 +1071,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >       }
> >  #endif
> >
> > +    riscv_cpu_finalize_features(cpu, &local_err);
> > +    if (local_err != NULL) {
> > +        error_propagate(errp, local_err);
> > +        return;
> > +    }
> > +
> >      riscv_cpu_register_gdb_regs_for_features(cs);
> >
> >      qemu_init_vcpu(cs);
> > @@ -927,6 +1085,52 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >      mcc->parent_realize(dev, errp);
> >  }
> >
> > +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
>
> nits: should align to (

Ok

>
> > +{
> > +    RISCVSATPMap *satp_map = opaque;
> > +    uint8_t satp = satp_mode_from_str(name);
> > +    bool value;
> > +
> > +    value = (satp_map->map & (1 << satp));
>
> nits: remove the outer ()

Ok

>
> > +
> > +    visit_type_bool(v, name, &value, errp);
> > +}
> > +
> > +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
>
> ditto

Ok

>
> > +{
> > +    RISCVSATPMap *satp_map = opaque;
> > +    uint8_t satp = satp_mode_from_str(name);
> > +    bool value;
> > +
> > +    if (!visit_type_bool(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    satp_map->map = deposit32(satp_map->map, satp, 1, value);
> > +    satp_map->init |= 1 << satp;
> > +}
> > +
> > +static void riscv_add_satp_mode_properties(Object *obj)
> > +{
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> > +    if (cpu->env.misa_mxl == MXL_RV32) {
> > +        object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
> > +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    } else {
> > +        object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
> > +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +        object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
> > +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +        object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
> > +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +        object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
> > +                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
> > +    }
> > +}
> > +
> >  #ifndef CONFIG_USER_ONLY
> >  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
> >  {
> > @@ -1091,6 +1295,8 @@ static void register_cpu_props(Object *obj)
> >      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> >          qdev_property_add_static(dev, prop);
> >      }
> > +
> > +    riscv_add_satp_mode_properties(obj);
> >  }
> >
> >  static Property riscv_cpu_properties[] = {
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f5609b62a2..e37177db5c 100644
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
> > @@ -413,6 +414,17 @@ struct RISCVCPUClass {
> >      ResettablePhases parent_phases;
> >  };
> >
> > +/*
> > + * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> > + * satp mode that is supported.
> > + *
> > + * init is a 16-bit bitmap used to make sure the user selected a correct
> > + * configuration as per the specification.
> > + */
> > +typedef struct {
> > +    uint16_t map, init;
> > +} RISCVSATPMap;
> > +
> >  struct RISCVCPUConfig {
> >      bool ext_i;
> >      bool ext_e;
> > @@ -488,6 +500,8 @@ struct RISCVCPUConfig {
> >      bool debug;
> >
> >      bool short_isa_string;
> > +
> > +    RISCVSATPMap satp_mode;
> >  };
> >
> >  typedef struct RISCVCPUConfig RISCVCPUConfig;
> > @@ -794,9 +808,14 @@ enum riscv_pmu_event_idx {
> >  /* CSR function table */
> >  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> >
> > +extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
> > +
> >  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
> >  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >
> >  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> >
> > +uint8_t satp_mode_max_from_map(uint32_t map);
> > +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
> > +
> >  #endif /* RISCV_CPU_H */
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 6b157806a5..3c02055825 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
> >  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
> >  static const target_ulong vsip_writable_mask = MIP_VSSIP;
> >
> > -static const bool valid_vm_1_10_32[16] = {
> > +const bool valid_vm_1_10_32[16] = {
> >      [VM_1_10_MBARE] = true,
> >      [VM_1_10_SV32] = true
> >  };
> >
> > -static const bool valid_vm_1_10_64[16] = {
> > +const bool valid_vm_1_10_64[16] = {
> >      [VM_1_10_MBARE] = true,
> >      [VM_1_10_SV39] = true,
> >      [VM_1_10_SV48] = true,
> > @@ -1211,11 +1211,9 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
> >
> >  static bool validate_vm(CPURISCVState *env, target_ulong vm)
> >  {
> > -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> > -        return valid_vm_1_10_32[vm & 0xf];
> > -    } else {
> > -        return valid_vm_1_10_64[vm & 0xf];
> > -    }
> > +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> > +
> > +    return ((vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map));
>
> nits: remove the outer ()

Ok

>
> >  }
> >
> >  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
> > --
>
> Regards,
> Bin

Thanks!

Alex

