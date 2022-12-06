Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2Qxq-0003zK-K8
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 00:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p2Qxo-0003xl-Ga
 for qemu-riscv@nongnu.org; Tue, 06 Dec 2022 00:57:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p2Qxk-0001zA-OO
 for qemu-riscv@nongnu.org; Tue, 06 Dec 2022 00:57:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so21983015wrm.2
 for <qemu-riscv@nongnu.org>; Mon, 05 Dec 2022 21:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L6L4Tf8HfD4kmLRXzI1f3Ee3usoYdNSsn3qWH2PiTDo=;
 b=IhAirHA7fthwxm9hOd1ptFefM4TGuJQkLfx/b8mu0gqP5xcwgHSUlbfRIKZoQwVNZk
 t8Zvo2tSrnPKh60RE9o65h88HRoHPpS8diFiXTNlyPH0xIfcsQXqOG39RRuPbqHrNeAP
 6n4ixTiCs1dymrmCVKJNMYMNmBk4Q6r3ZRQxuU7EJlONpvtIPUEdkE1L+laa8UHkkdjB
 aUAlSLz4FI5Tky1lBUC0u2Bjr98ypnSZRimz7lQvUg9SsskSD9B62BI9y4LFxoruWKKw
 JMVLHIoMqDJNQfYc0VUXhNF5DFP9vXTmyVRzbugbb/VUUox2YoxemRz1yQjbxjqjR7MW
 9PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L6L4Tf8HfD4kmLRXzI1f3Ee3usoYdNSsn3qWH2PiTDo=;
 b=yU2WVcbhzuIqtm8W28YF4+7v3yw9QPkgaujgnmEKwtWYXT971w/32IjFEzUgiiqdF/
 wmvtqWmyGjIXKxUr/zm4H3nFIsiLm/xgRHgXRCPrPpU+PiRNdTv+CC1KO5QK2Ym4qI1C
 Oex9jzUx6b/sjMWWllpfjNb4Z1l2pWcUuuRzqPrbJdHu5S7ukDK1npASpgP3YeAG3RBV
 pUmoMrWgFQVaKQIAzWrTz0h2o8EF8kiDsrGh4FgxfgpkkhZlx6W1lyh0NnOpJVLorkYc
 c/NKqsSvv8c/4j8cpViYcReS3beiD+SBhgu8MqQOgQhyNB496DM7T6uAptJK1ZsPRmg3
 kyhQ==
X-Gm-Message-State: ANoB5pkaqeuaThquqkpyad2egIZbSfZJVURU0bdFGZbZNH3n+6lhIVsz
 YU+n7hBomgCDz2hrok74eO9W46/gZZFe7Rr4jtsVmg==
X-Google-Smtp-Source: AA0mqf495UlHJTrQABFxi3RYmTOUV73KMvFRTwdRvx/DzTwGwrkMvgFhJoS+Vy9BnQcuznMpBBaYQ8b54Dngz+rI+js=
X-Received: by 2002:a05:6000:508:b0:242:34c1:1fd1 with SMTP id
 a8-20020a056000050800b0024234c11fd1mr13533970wrf.218.1670306270353; Mon, 05
 Dec 2022 21:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20221201093623.1394747-1-alexghiti@rivosinc.com>
 <20221201144722.aq4pfmdehrghaoy2@kamzik>
In-Reply-To: <20221201144722.aq4pfmdehrghaoy2@kamzik>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 6 Dec 2022 06:57:39 +0100
Message-ID: <CAHVXubgp5G6HO4v8GwGx4KaDegPqc2mZH2BQzYqM+T1Hxx6bxQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Ludovic Henry <ludovic@rivosinc.com>
Content-Type: multipart/alternative; boundary="000000000000e936c505ef227baf"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 Dec 2022 05:57:56 -0000

--000000000000e936c505ef227baf
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, Dec 1, 2022 at 3:47 PM Andrew Jones <ajones@ventanamicro.com> wrote:

> On Thu, Dec 01, 2022 at 10:36:23AM +0100, Alexandre Ghiti wrote:
> > RISC-V specifies multiple sizes for addressable memory and Linux probes
> for
> > the machine's support at startup via the satp CSR register (done in
> > csr.c:validate_vm).
> >
> > As per the specification, sv64 must support sv57, which in turn must
> > support sv48...etc. So we can restrict machine support by simply setting
> the
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
> >
> > In addition, we now correctly set the device-tree entry 'mmu-type' using
> > those new properties.
> >
> > Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
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
> >  hw/riscv/virt.c         |  16 ++--
> >  target/riscv/cpu.c      | 164 ++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/cpu.h      |   8 ++
> >  target/riscv/cpu_bits.h |   1 +
> >  target/riscv/csr.c      |   8 +-
> >  5 files changed, 186 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b4..bb7c739a74 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState
> *s, int socket,
> >      int cpu;
> >      uint32_t cpu_phandle;
> >      MachineState *mc = MACHINE(s);
> > -    char *name, *cpu_name, *core_name, *intc_name;
> > +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> >
> >      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> >          cpu_phandle = (*phandle)++;
> > @@ -236,14 +236,12 @@ static void create_fdt_socket_cpus(RISCVVirtState
> *s, int socket,
> >          cpu_name = g_strdup_printf("/cpus/cpu@%d",
> >              s->soc[socket].hartid_base + cpu);
> >          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> > -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> > -                          RISCV_FEATURE_MMU)) {
> > -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > -                                    (is_32_bit) ? "riscv,sv32" :
> "riscv,sv48");
> > -        } else {
> > -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > -                                    "riscv,none");
> > -        }
> > +
> > +        sv_name = g_strdup_printf("riscv,%s",
> > +
> s->soc[socket].harts[cpu].cfg.satp_mode_str);
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> > +        g_free(sv_name);
> > +
> >          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> >          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
> >          g_free(name);
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d14e95c9dc..51c06ed057 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -907,6 +907,66 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >       }
> >  #endif
> >
> > +    /*
> > +     * Either a cpu sets its supported satp_mode in XXX_cpu_init
> > +     * or the user sets this value using satp_mode property.
>
> using the sv* and mbare properties.
>
> > +     */
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +
> > +    cpu->cfg.satp_mode = VM_1_10_UNDEF;
>
> Could probably just use -1 here instead of introducing VM_1_10_UNDEF.
>
> > +
> > +    if (rv32) {
> > +        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("sv32");
>
> No need to allocate memory, satp_mode_str = "sv32".
>
> Also I'm not sure we need to keep mode_str in CPUConfig. Providing a
> function with a switch on VM_1_10_SV* cases to get it should be enough
> for its one usecase.
>
> > +            cpu->cfg.satp_mode = VM_1_10_SV32;
> > +        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("none");
> > +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> > +        }
> > +    } else {
> > +        if (cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("sv64");
> > +            cpu->cfg.satp_mode = VM_1_10_SV64;
> > +        } else if (cpu->cfg.sv57 == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("sv57");
> > +            cpu->cfg.satp_mode = VM_1_10_SV57;
> > +        } else if (cpu->cfg.sv48 == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("sv48");
> > +            cpu->cfg.satp_mode = VM_1_10_SV48;
> > +        } else if (cpu->cfg.sv39 == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("sv39");
> > +            cpu->cfg.satp_mode = VM_1_10_SV39;
> > +        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
> > +            cpu->cfg.satp_mode_str = g_strdup("none");
> > +            cpu->cfg.satp_mode = VM_1_10_MBARE;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * If unset by both the user and the cpu, we fallback to sv32 for
> 32-bit
> > +     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
> > +     */
> > +    if (cpu->cfg.satp_mode == VM_1_10_UNDEF) {
> > +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > +            if (rv32) {
> > +                cpu->cfg.satp_mode_str = g_strdup("sv32");
> > +                cpu->cfg.satp_mode = VM_1_10_SV32;
> > +            } else {
> > +                cpu->cfg.satp_mode_str = g_strdup("sv57");
> > +                cpu->cfg.satp_mode = VM_1_10_SV57;
> > +            }
> > +        } else {
> > +            cpu->cfg.satp_mode_str = g_strdup("none");
> > +            cpu->cfg.satp_mode = VM_1_10_MBARE;
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
> > @@ -915,6 +975,102 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >      mcc->parent_realize(dev, errp);
> >  }
> >
> > +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> > +{
> > +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +
> > +    /* First, get rid of 32-bit/64-bit incompatibilities */
> > +    if (rv32) {
> > +        if (cpu->cfg.sv39 == ON_OFF_AUTO_ON
> > +                || cpu->cfg.sv48 == ON_OFF_AUTO_ON
> > +                || cpu->cfg.sv57 == ON_OFF_AUTO_ON
> > +                || cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
> > +            error_setg(errp, "cannot enable 64-bit satp modes "
> > +                       "(sv39/sv48/sv57/sv64)");
> > +            error_append_hint(errp, "cpu is in 32-bit mode, 64-bit satp
> modes "
> > +                              "can't be enabled\n");
> > +            return;
> > +        }
> > +    } else {
> > +        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
> > +            error_setg(errp, "cannot enable 32-bit satp mode (sv32)");
> > +            error_append_hint(errp, "cpu is in 64-bit mode, 32-bit satp
> mode "
> > +                              "can't be enabled\n");
> > +            return;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * Then make sure the user did not ask for an invalid configuration
> as per
> > +     * the specification.
> > +     */
> > +    switch (cpu->cfg.satp_mode) {
> > +    case VM_1_10_SV32:
> > +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
> > +            error_setg(errp, "cannot disable mbare satp mode");
> > +            error_append_hint(errp, "mbare satp mode must be enabled if
> sv32 "
> > +                              "is enabled\n");
> > +            return;
> > +        }
> > +
> > +        break;
> > +    case VM_1_10_SV39:
> > +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
> > +            error_setg(errp, "cannot disable mbare satp mode");
> > +            error_append_hint(errp, "mbare satp mode must be enabled if
> sv39 "
> > +                              "is enabled\n");
> > +            return;
> > +        }
> > +
> > +        break;
> > +    case VM_1_10_SV48:
> > +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF) {
> > +            error_setg(errp, "cannot disable mbare/sv39 satp modes");
> > +            error_append_hint(errp, "mbare/sv39 satp modes must be
> enabled if "
> > +                              "sv48 is enabled\n");
>
> Combined errors like this make the user look to see which one it is. I
> think we can we reorganize this switch to fall through from largest to
> smallest allowing the checks for smaller widths and mbare to be shared.
> If a user has more than one problem then they'll only see an error for the
> larger first, but then they'll try again and see the next one. In each
> case they'll see exactly what needs to be fixed, though.
>
> > +            return;
> > +        }
> > +
> > +        break;
> > +    case VM_1_10_SV57:
> > +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF) {
> > +            error_setg(errp, "cannot disable mbare/sv39/sv48 satp
> modes");
> > +            error_append_hint(errp, "mbare/sv39/sv48 satp modes must be
> "
> > +                              "enabled if sv57 is enabled\n");
> > +            return;
> > +        }
> > +
> > +        break;
> > +    case VM_1_10_SV64:
> > +        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF
> > +                || cpu->cfg.sv57 == ON_OFF_AUTO_OFF) {
> > +            error_setg(errp, "cannot disable mbare/sv39/sv48/sv57 satp "
> > +                       "modes");
> > +            error_append_hint(errp, "mbare/sv39/sv48/sv57 satp modes
> must be "
> > +                              "enabled if sv57 is enabled\n");
> > +            return;
> > +        }
> > +
> > +        break;
> > +    }
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
> > @@ -1094,6 +1250,14 @@ static Property riscv_cpu_properties[] = {
> >
> >      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s,
> false),
> >      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s,
> false),
> > +
> > +    DEFINE_PROP_ON_OFF_AUTO("mbare", RISCVCPU, cfg.mbare,
> ON_OFF_AUTO_AUTO),
> > +    DEFINE_PROP_ON_OFF_AUTO("sv32", RISCVCPU, cfg.sv32,
> ON_OFF_AUTO_AUTO),
> > +    DEFINE_PROP_ON_OFF_AUTO("sv39", RISCVCPU, cfg.sv39,
> ON_OFF_AUTO_AUTO),
> > +    DEFINE_PROP_ON_OFF_AUTO("sv48", RISCVCPU, cfg.sv48,
> ON_OFF_AUTO_AUTO),
> > +    DEFINE_PROP_ON_OFF_AUTO("sv57", RISCVCPU, cfg.sv57,
> ON_OFF_AUTO_AUTO),
> > +    DEFINE_PROP_ON_OFF_AUTO("sv64", RISCVCPU, cfg.sv64,
> ON_OFF_AUTO_AUTO),
>
> I'm not sure what types of issues may arise mixing booleans and OnOffAutos
> in a future cpu-model-expansion. I also think we can simplify things by
> using arm's sve* boolean properties as a pattern. For that, each property
> is a boolean which shares the same get and set accessors. The set accessor
> not only sets the property to true/false, but also tracks that the user
> did the setting, allowing for sanity checks at finalize time.
>

I can't find the sve* properties you're talking about, can you point them
to me?

Thanks,

Alex


>
> Using a pair of bitmaps for the sv properties, where VM_1_10_SV* are used
> for the bit numbers, should work well. Validating input will likely reduce
> to some bitmap comparing operations. It would also drop all the extra cfg
> state. In fact, one of the temporary bitmaps could use the satp_mode
> member, before the final result gets written to it. So, only a single
> extra uint8_t for the other bitmap is needed.
>
> > +
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 3a9e25053f..dcdde1e0b7 100644
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
> > @@ -480,6 +481,10 @@ struct RISCVCPUConfig {
> >      bool debug;
> >
> >      bool short_isa_string;
> > +
> > +    OnOffAuto mbare, sv32, sv39, sv48, sv57, sv64;
> > +    uint8_t satp_mode;
> > +    char *satp_mode_str;
> >  };
> >
> >  typedef struct RISCVCPUConfig RISCVCPUConfig;
> > @@ -789,4 +794,7 @@ void riscv_set_csr_ops(int csrno,
> riscv_csr_operations *ops);
> >
> >  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> >
> > +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
> > +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> > +
> >  #endif /* RISCV_CPU_H */
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index d8f5f0abed..3e67a815d5 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -590,6 +590,7 @@ typedef enum {
> >  #define VM_1_10_SV48        9
> >  #define VM_1_10_SV57        10
> >  #define VM_1_10_SV64        11
> > +#define VM_1_10_UNDEF       16
> >
> >  /* Page table entry (PTE) fields */
> >  #define PTE_V               0x001 /* Valid */
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 5c9a7ee287..d2aab1627e 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVState
> *env, int csrno,
> >
> >  static int validate_vm(CPURISCVState *env, target_ulong vm)
> >  {
> > +    vm &= 0xf;
> > +
> >      if (riscv_cpu_mxl(env) == MXL_RV32) {
> > -        return valid_vm_1_10_32[vm & 0xf];
> > +        return valid_vm_1_10_32[vm] &&
> > +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
> >      } else {
> > -        return valid_vm_1_10_64[vm & 0xf];
> > +        return valid_vm_1_10_64[vm] &&
> > +            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
> >      }
> >  }
> >
> > --
> > 2.37.2
> >
>
> Thanks,
> drew
>

--000000000000e936c505ef227baf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Andrew,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 1, 2022 at 3:47 PM =
Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com">ajones@ventanam=
icro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Dec 01, 2022 at 10:36:23AM +0100, Alexandre Ghiti wrote:<br=
>
&gt; RISC-V specifies multiple sizes for addressable memory and Linux probe=
s for<br>
&gt; the machine&#39;s support at startup via the satp CSR register (done i=
n<br>
&gt; csr.c:validate_vm).<br>
&gt; <br>
&gt; As per the specification, sv64 must support sv57, which in turn must<b=
r>
&gt; support sv48...etc. So we can restrict machine support by simply setti=
ng the<br>
&gt; &quot;highest&quot; supported mode and the bare mode is always support=
ed.<br>
&gt; <br>
&gt; You can set the satp mode using the new properties &quot;mbare&quot;, =
&quot;sv32&quot;,<br>
&gt; &quot;sv39&quot;, &quot;sv48&quot;, &quot;sv57&quot; and &quot;sv64&qu=
ot; as follows:<br>
&gt; -cpu rv64,sv57=3Don # Linux will boot using sv57 scheme<br>
&gt; -cpu rv64,sv39=3Don # Linux will boot using sv39 scheme<br>
&gt; <br>
&gt; We take the highest level set by the user:<br>
&gt; -cpu rv64,sv48=3Don,sv57=3Don # Linux will boot using sv57 scheme<br>
&gt; <br>
&gt; We make sure that invalid configurations are rejected:<br>
&gt; -cpu rv64,sv32=3Don # Can&#39;t enable 32-bit satp mode in 64-bit<br>
&gt; -cpu rv64,sv39=3Doff,sv48=3Don # sv39 must be supported if higher mode=
s are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # enabled<br>
&gt; <br>
&gt; We accept &quot;redundant&quot; configurations:<br>
&gt; -cpu rv64,sv48=3Don,sv57=3Doff # sv39 must be supported if higher mode=
s are<br>
&gt; <br>
&gt; In addition, we now correctly set the device-tree entry &#39;mmu-type&=
#39; using<br>
&gt; those new properties.<br>
&gt; <br>
&gt; Co-Developed-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.=
com" target=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
&gt; Signed-off-by: Ludovic Henry &lt;<a href=3D"mailto:ludovic@rivosinc.co=
m" target=3D"_blank">ludovic@rivosinc.com</a>&gt;<br>
&gt; Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosin=
c.com" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt; v3:<br>
&gt; - Free sv_name as pointed by Bin<br>
&gt; - Replace satp-mode with boolean properties as suggested by Andrew<br>
&gt; - Removed RB from Atish as the patch considerably changed<br>
&gt; <br>
&gt; v2:<br>
&gt; - Use error_setg + return as suggested by Alistair<br>
&gt; - Add RB from Atish<br>
&gt; - Fixed checkpatch issues missed in v1<br>
&gt; - Replaced Ludovic email address with the rivos one<br>
&gt; <br>
&gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++--=
<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 | 164 +++++++++++++++++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 ++<br>
&gt;=C2=A0 target/riscv/cpu_bits.h |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 5 files changed, 186 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
&gt; index a5bc7353b4..bb7c739a74 100644<br>
&gt; --- a/hw/riscv/virt.c<br>
&gt; +++ b/hw/riscv/virt.c<br>
&gt; @@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState =
*s, int socket,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int cpu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t cpu_phandle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MachineState *mc =3D MACHINE(s);<br>
&gt; -=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name;<br>
&gt; +=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name, *sv_name=
;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (cpu =3D s-&gt;soc[socket].num_harts - 1; cpu =
&gt;=3D 0; cpu--) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_phandle =3D (*phandle)++;<br>
&gt; @@ -236,14 +236,12 @@ static void create_fdt_socket_cpus(RISCVVirtStat=
e *s, int socket,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_name =3D g_strdup_printf(&quot;/=
cpus/cpu@%d&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;soc[socket].hart=
id_base + cpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(mc-&gt;fdt, cpu=
_name);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;s-&gt;soc[socket].=
harts[cpu].env,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 RISCV_FEATURE_MMU)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-=
&gt;fdt, cpu_name, &quot;mmu-type&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (is_32_bit) ? &quo=
t;riscv,sv32&quot; : &quot;riscv,sv48&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-=
&gt;fdt, cpu_name, &quot;mmu-type&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,none&q=
uot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sv_name =3D g_strdup_printf(&quot;riscv,%=
s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;soc[socket].harts[c=
pu].cfg.satp_mode_str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, cpu_n=
ame, &quot;mmu-type&quot;, sv_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(sv_name);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D riscv_isa_string(&amp;s-&gt=
;soc[socket].harts[cpu]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, =
cpu_name, &quot;riscv,isa&quot;, name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index d14e95c9dc..51c06ed057 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -907,6 +907,66 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Either a cpu sets its supported satp_mode in XX=
X_cpu_init<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* or the user sets this value using satp_mode pro=
perty.<br>
<br>
using the sv* and mbare properties.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MX=
L_RV32;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D VM_1_10_UNDEF;<br>
<br>
Could probably just use -1 here instead of introducing VM_1_10_UNDEF.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (rv32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.sv32 =3D=3D ON_OFF_AUTO_O=
N) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;sv32&quot;);<br>
<br>
No need to allocate memory, satp_mode_str =3D &quot;sv32&quot;.<br>
<br>
Also I&#39;m not sure we need to keep mode_str in CPUConfig. Providing a<br=
>
function with a switch on VM_1_10_SV* cases to get it should be enough<br>
for its one usecase.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_SV32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.mbare =3D=3D ON_OF=
F_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;none&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_MBARE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.sv64 =3D=3D ON_OFF_AUTO_O=
N) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;sv64&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_SV64;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.sv57 =3D=3D ON_OFF=
_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;sv57&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_SV57;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.sv48 =3D=3D ON_OFF=
_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;sv48&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_SV48;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.sv39 =3D=3D ON_OFF=
_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;sv39&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_SV39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (cpu-&gt;cfg.mbare =3D=3D ON_OF=
F_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;none&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_MBARE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If unset by both the user and the cpu, we fallb=
ack to sv32 for 32-bit<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* or sv57 for 64-bit when a MMU is present, and b=
are otherwise.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode =3D=3D VM_1_10_UNDEF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;cpu-&gt;env, RISCV=
_FEATURE_MMU)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.s=
atp_mode_str =3D g_strdup(&quot;sv32&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.s=
atp_mode =3D VM_1_10_SV32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.s=
atp_mode_str =3D g_strdup(&quot;sv57&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.s=
atp_mode =3D VM_1_10_SV57;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode_str =
=3D g_strdup(&quot;none&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode =3D V=
M_1_10_MBARE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_finalize_features(cpu, &amp;local_err);<br>
&gt; +=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_register_gdb_regs_for_features(cs);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_init_vcpu(cs);<br>
&gt; @@ -915,6 +975,102 @@ static void riscv_cpu_realize(DeviceState *dev, =
Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mcc-&gt;parent_realize(dev, errp);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MX=
L_RV32;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* First, get rid of 32-bit/64-bit incompatibilities */=
<br>
&gt; +=C2=A0 =C2=A0 if (rv32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.sv39 =3D=3D ON_OFF_AUTO_O=
N<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv48 =3D=3D ON_OFF_AUTO_ON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv57 =3D=3D ON_OFF_AUTO_ON<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv64 =3D=3D ON_OFF_AUTO_ON) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot enable 64-bit satp modes &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;(sv39/sv48/sv57/sv64)&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;cpu is in 32-bit mode, 64-bit satp modes &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;can&#39;t be enabled\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.sv32 =3D=3D ON_OFF_AUTO_O=
N) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot enable 32-bit satp mode (sv32)&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;cpu is in 64-bit mode, 32-bit satp mode &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;can&#39;t be enabled\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Then make sure the user did not ask for an inva=
lid configuration as per<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the specification.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 switch (cpu-&gt;cfg.satp_mode) {<br>
&gt; +=C2=A0 =C2=A0 case VM_1_10_SV32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.mbare =3D=3D ON_OFF_AUTO_=
OFF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot disable mbare satp mode&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;mbare satp mode must be enabled if sv32 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;is enabled\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VM_1_10_SV39:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.mbare =3D=3D ON_OFF_AUTO_=
OFF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot disable mbare satp mode&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;mbare satp mode must be enabled if sv39 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;is enabled\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VM_1_10_SV48:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.mbare =3D=3D ON_OFF_AUTO_=
OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv39 =3D=3D ON_OFF_AUTO_OFF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot disable mbare/sv39 satp modes&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;mbare/sv39 satp modes must be enabled if &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sv48 is enabled\n&quot;);<br>
<br>
Combined errors like this make the user look to see which one it is. I<br>
think we can we reorganize this switch to fall through from largest to<br>
smallest allowing the checks for smaller widths and mbare to be shared.<br>
If a user has more than one problem then they&#39;ll only see an error for =
the<br>
larger first, but then they&#39;ll try again and see the next one. In each<=
br>
case they&#39;ll see exactly what needs to be fixed, though.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VM_1_10_SV57:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.mbare =3D=3D ON_OFF_AUTO_=
OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv39 =3D=3D ON_OFF_AUTO_OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv48 =3D=3D ON_OFF_AUTO_OFF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot disable mbare/sv39/sv48 satp modes&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;mbare/sv39/sv48 satp modes must be &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;enabled if sv57 is enabled\n&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case VM_1_10_SV64:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.mbare =3D=3D ON_OFF_AUTO_=
OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv39 =3D=3D ON_OFF_AUTO_OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv48 =3D=3D ON_OFF_AUTO_OFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cpu-&gt;cf=
g.sv57 =3D=3D ON_OFF_AUTO_OFF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;cann=
ot disable mbare/sv39/sv48/sv57 satp &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;modes&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &qu=
ot;mbare/sv39/sv48/sv57 satp modes must be &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;enabled if sv57 is enabled\n&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_satp_mode_finalize(cpu, &amp;local_err);<br>
&gt; +=C2=A0 =C2=A0 if (local_err !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 static void riscv_cpu_set_irq(void *opaque, int irq, int level)<=
br>
&gt;=C2=A0 {<br>
&gt; @@ -1094,6 +1250,14 @@ static Property riscv_cpu_properties[] =3D {<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;rvv_ta_all_1s&quot;, RISCVC=
PU, cfg.rvv_ta_all_1s, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;rvv_ma_all_1s&quot;, RISCVC=
PU, cfg.rvv_ma_all_1s, false),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;mbare&quot;, RISCVCPU, cf=
g.mbare, ON_OFF_AUTO_AUTO),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;sv32&quot;, RISCVCPU, cfg=
.sv32, ON_OFF_AUTO_AUTO),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;sv39&quot;, RISCVCPU, cfg=
.sv39, ON_OFF_AUTO_AUTO),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;sv48&quot;, RISCVCPU, cfg=
.sv48, ON_OFF_AUTO_AUTO),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;sv57&quot;, RISCVCPU, cfg=
.sv57, ON_OFF_AUTO_AUTO),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_ON_OFF_AUTO(&quot;sv64&quot;, RISCVCPU, cfg=
.sv64, ON_OFF_AUTO_AUTO),<br>
<br>
I&#39;m not sure what types of issues may arise mixing booleans and OnOffAu=
tos<br>
in a future cpu-model-expansion. I also think we can simplify things by<br>
using arm&#39;s sve* boolean properties as a pattern. For that, each proper=
ty<br>
is a boolean which shares the same get and set accessors. The set accessor<=
br>
not only sets the property to true/false, but also tracks that the user<br>
did the setting, allowing for sanity checks at finalize time.<br></blockquo=
te><div><br></div><div>I can&#39;t find the sve* properties you&#39;re talk=
ing about, can you point them to me?</div><div><br></div><div>Thanks,</div>=
<div><br>Alex</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Using a pair of bitmaps for the sv properties, where VM_1_10_SV* are used<b=
r>
for the bit numbers, should work well. Validating input will likely reduce<=
br>
to some bitmap comparing operations. It would also drop all the extra cfg<b=
r>
state. In fact, one of the temporary bitmaps could use the satp_mode<br>
member, before the final result gets written to it. So, only a single<br>
extra uint8_t for the other bitmap is needed.<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 3a9e25053f..dcdde1e0b7 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 #include &quot;qom/object.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/int128.h&quot;<br>
&gt;=C2=A0 #include &quot;cpu_bits.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-common.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TCG_GUEST_DEFAULT_MO 0<br>
&gt;=C2=A0 <br>
&gt; @@ -480,6 +481,10 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool debug;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool short_isa_string;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 OnOffAuto mbare, sv32, sv39, sv48, sv57, sv64;<br>
&gt; +=C2=A0 =C2=A0 uint8_t satp_mode;<br>
&gt; +=C2=A0 =C2=A0 char *satp_mode_str;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct RISCVCPUConfig RISCVCPUConfig;<br>
&gt; @@ -789,4 +794,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operat=
ions *ops);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);<br>
&gt;=C2=A0 <br>
&gt; +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);<br>
&gt; +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);<br>
&gt; +<br>
&gt;=C2=A0 #endif /* RISCV_CPU_H */<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index d8f5f0abed..3e67a815d5 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -590,6 +590,7 @@ typedef enum {<br>
&gt;=C2=A0 #define VM_1_10_SV48=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
&gt;=C2=A0 #define VM_1_10_SV57=C2=A0 =C2=A0 =C2=A0 =C2=A0 10<br>
&gt;=C2=A0 #define VM_1_10_SV64=C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
&gt; +#define VM_1_10_UNDEF=C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* Page table entry (PTE) fields */<br>
&gt;=C2=A0 #define PTE_V=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x001 /* Valid */<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 5c9a7ee287..d2aab1627e 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVSta=
te *env, int csrno,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int validate_vm(CPURISCVState *env, target_ulong vm)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 vm &amp;=3D 0xf;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_32[vm &amp; 0xf];<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_32[vm] &amp;&amp;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (vm &lt;=3D RISCV_CPU(env_c=
pu(env))-&gt;cfg.satp_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_64[vm &amp; 0xf];<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return valid_vm_1_10_64[vm] &amp;&amp;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (vm &lt;=3D RISCV_CPU(env_c=
pu(env))-&gt;cfg.satp_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.37.2<br>
&gt;<br>
<br>
Thanks,<br>
drew<br>
</blockquote></div></div>

--000000000000e936c505ef227baf--

