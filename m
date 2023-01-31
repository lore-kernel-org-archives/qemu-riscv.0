Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqik-0002Bb-3g
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqih-0002BH-8v
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:30:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqiE-0003H7-2i
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:30:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id m14so13740945wrg.13
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zCyDb38N1UGG2MKSDZLSNDVUbUGunQ5Fb/06lZ1tIuk=;
 b=vzdWiS2RcH4FhCbXcNFa1NYLH6VzX6HizZ0BqNUtegYdKJ9mJDVkGin8Tj7iz4ckuJ
 JsgvUQL9kY38s3V3H1SjuopR1szM58j0FLWQlJyvcxW7LiRBawDPCUImdqexiggeUucW
 R56dY0ww6wLebrgQtpHF1RjuHLPCwoTpkP9vNmzgrNcdXBBjv205qQ2FWaSINaTL1veu
 WDmS2B3gKpzdin4633jLOZ9PramOuDWWTIyR3Jjfc/u5JboXZWS4+CYYBB7PnzaTzJNx
 0CzIK+e1Uj/nU1VTYWT5R4UqmWZ8sYB2j35AFMAAi2Ueu2sArEiIswobk2IzZbU+8V+M
 lshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zCyDb38N1UGG2MKSDZLSNDVUbUGunQ5Fb/06lZ1tIuk=;
 b=RXPjQwgLPcYnqsgJ7VT1eq58O8XHORJqFCYoN/14xm82HpJQlmNJVNgO1s26ttTFQ3
 vD2KV9z+Nj9/mPZFBSRtePK/qcAZPFCLnOKUnVC0LRkqEjCJiND5wsjU8puLR7r6qKM8
 nO9BDrKQZeuGCS/zqySJt/Y84WyFS5YMa4wpplxhkzK+Ir9nIKMHwZpXU9GIOET6M95Q
 u2zYv2CYprck3iJ44sDRepOG50zOpintk3EDWmr3qBlLGqbo/FZuh5Xft/Yo9TxNLGHX
 pUvIz2gX/76VY49pUoZtP0zkr8doAswbSyvNrWP278C75Dj4fDFyMLmY5UPjgGGZnjGX
 oe7A==
X-Gm-Message-State: AO0yUKX4G0Mrnacxe31lst0JwFu+X0fvcX3K9Kt9MNf0Olbi5u7hIJGd
 +2d8pcMyRwQulINjt9m5Dcf2/GQCvrapBzW8YjsVQg==
X-Google-Smtp-Source: AK7set/BIMYfnBIyvdz7CirIE/8oLH0Ug80IdsJwdyL2qg0WBq/Kj3MGyJXj29bPCkpkomr/DNFaK1J3s8JWEfJFiEE=
X-Received: by 2002:adf:e708:0:b0:2c2:de2b:e7d1 with SMTP id
 c8-20020adfe708000000b002c2de2be7d1mr49754wrm.55.1675171803539; Tue, 31 Jan
 2023 05:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-5-alexghiti@rivosinc.com>
 <CAEUhbmXAdACY9GpSaO0MOsuppZxONa+c4UsBopobzeercwJy-w@mail.gmail.com>
In-Reply-To: <CAEUhbmXAdACY9GpSaO0MOsuppZxONa+c4UsBopobzeercwJy-w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 31 Jan 2023 14:29:52 +0100
Message-ID: <CAHVXubjju2uxjXU=_e=OpOkGmSMTbkfY2XaqSALC97V67QrH2w@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] riscv: Introduce satp mode hw capabilities
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 13:30:43 -0000

On Mon, Jan 30, 2023 at 5:29 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 12:24 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > Currently, the max satp mode is set with the only constraint that it must be
> > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
>
> nits: s/qemu/QEMU/g

Ok

>
> >
> > But we actually need to add another level of constraint: what the hw is
> > actually capable of, because currently, a linux booting on a sifive-u54
> > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > capability.
> >
> > So add a new bitmap to RISCVSATPMap which contains this capability and
> > initialize it in every XXX_cpu_init.
> >
> > Finally:
> > - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
> > - the CPU hw capabilities constrains what the user may select
> > - the user's selection then constrains what's available to the guest
> >   OS.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 74 +++++++++++++++++++++++++++++++---------------
> >  target/riscv/cpu.h |  8 +++--
> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 54494a72be..e7e1fb96dc 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> >      g_assert_not_reached();
> >  }
> >
> > -/* Sets the satp mode to the max supported */
> > -static void set_satp_mode_default(RISCVCPU *cpu)
> > +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> > +                                        uint8_t satp_mode)
> >  {
> >      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> >
> > -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > -        cpu->cfg.satp_mode.map |=
> > -                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
> > -    } else {
> > -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > +    for (int i = 0; i <= satp_mode; ++i) {
> > +        if (valid_vm[i]) {
> > +            cpu->cfg.satp_mode.supported |= (1 << i);
> > +        }
> >      }
> >  }
> >
> > +/* Sets the satp mode to the max supported */
>
> nits: s/Sets/Set

Ok

>
> > +static void set_satp_mode_default(RISCVCPU *cpu)
> > +{
> > +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
> > +}
> > +
> >  static void riscv_any_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >  #if defined(TARGET_RISCV32)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> >  #elif defined(TARGET_RISCV64)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >  #endif
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> >      register_cpu_props(obj);
> > @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
> >  static void rv64_base_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV64, 0);
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >  }
> >
> >  static void rv64_sifive_u_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
> >  }
> >
> >  static void rv64_sifive_e_cpu_init(Object *obj)
> > @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >  }
> >
> >  static void rv128_base_cpu_init(Object *obj)
> > @@ -354,11 +371,13 @@ static void rv128_base_cpu_init(Object *obj)
> >          exit(EXIT_FAILURE);
> >      }
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV128, 0);
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >  }
> >  #else
> >  static void rv32_base_cpu_init(Object *obj)
> > @@ -369,13 +388,17 @@ static void rv32_base_cpu_init(Object *obj)
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>
> Does this compile? 'cpu' seems undeclared ..?

Oops, thanks.

>
> >  }
> >
> >  static void rv32_sifive_u_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> >  }
> >
> >  static void rv32_sifive_e_cpu_init(Object *obj)
> > @@ -386,6 +409,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >  }
> >
> >  static void rv32_ibex_cpu_init(Object *obj)
> > @@ -396,6 +420,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_11_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >      cpu->cfg.epmp = true;
> >  }
> >
> > @@ -407,6 +432,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >  }
> >  #endif
> >
> > @@ -698,8 +724,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
> >  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >  {
> >      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > -    uint8_t satp_mode_max;
> > +    uint8_t satp_mode_map_max;
> > +    uint8_t satp_mode_supported_max =
> > +                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> >
> >      if (cpu->cfg.satp_mode.map == 0) {
> >          if (cpu->cfg.satp_mode.init == 0) {
> > @@ -713,9 +740,9 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >               */
> >              for (int i = 1; i < 16; ++i) {
> >                  if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> > -                    valid_vm[i]) {
> > +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
> >                      for (int j = i - 1; j >= 0; --j) {
> > -                        if (valid_vm[j]) {
> > +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
> >                              cpu->cfg.satp_mode.map |= (1 << j);
> >                              break;
> >                          }
> > @@ -726,36 +753,35 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >          }
> >      }
> >
> > -    /* Make sure the configuration asked is supported by qemu */
> > -    for (int i = 0; i < 16; ++i) {
> > -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > -            error_setg(errp, "satp_mode %s is not valid",
> > -                       satp_mode_str(i, rv32));
> > -            return;
> > -        }
> > +    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > +
> > +    /* Make sure the user asked for a supported configuration (HW and qemu) */
> > +    if (satp_mode_map_max > satp_mode_supported_max) {
> > +        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
> > +                   satp_mode_str(satp_mode_map_max, rv32),
> > +                   satp_mode_str(satp_mode_supported_max, rv32));
> > +        return;
> >      }
> >
> >      /*
> >       * Make sure the user did not ask for an invalid configuration as per
> >       * the specification.
> >       */
> > -    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > -
> >      if (!rv32) {
> > -        for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> >              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> >                  (cpu->cfg.satp_mode.init & (1 << i)) &&
> > -                valid_vm[i]) {
> > +                (cpu->cfg.satp_mode.supported & (1 << i))) {
> >                  error_setg(errp, "cannot disable %s satp mode if %s "
> >                             "is enabled", satp_mode_str(i, false),
> > -                           satp_mode_str(satp_mode_max, false));
> > +                           satp_mode_str(satp_mode_map_max, false));
> >                  return;
> >              }
> >          }
> >      }
> >
> >      /* Finally expand the map so that all valid modes are set */
> > -    for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> >          cpu->cfg.satp_mode.map |= (1 << i);
> >      }
> >  }
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index e37177db5c..b591122099 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -416,13 +416,17 @@ struct RISCVCPUClass {
> >
> >  /*
> >   * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> > - * satp mode that is supported.
> > + * satp mode that is supported. It may be chosen by the user and must respect
> > + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> > + * (supported bitmap below).
> >   *
> >   * init is a 16-bit bitmap used to make sure the user selected a correct
> >   * configuration as per the specification.
> > + *
> > + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> >   */
> >  typedef struct {
> > -    uint16_t map, init;
> > +    uint16_t map, init, supported;
> >  } RISCVSATPMap;
> >
> >  struct RISCVCPUConfig {
> > --
>
> Regards,
> Bin

Thanks again,

Alex

