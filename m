Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNZGU-0008Ad-CK
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNZGS-0008A3-LQ
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:04:32 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNZGP-00034D-Cd
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:04:32 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-142b72a728fso2301530fac.9
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tJr/LTHW+GqkSNY8ozSyLnL3Dk088Zn6xsAbqcrNL1s=;
 b=KoiX1l09MyJR2N3IBe1RLw4OkMALFgF/PT92WP0GX4InQwRt8B+feBkAv6TSs54gJS
 2LMNLjIx4E6ZhcYNSHMyb1BGtbseYySgb6V2cEqQMkN8WI05lsk7xCIAvVw2akTjJUgt
 bLR2DI53KdY7fAj9YdH+Tm2dT2C6HOz4t1OBmN28Z5tT9m4hKKygU88iJU7vLbZJgtS3
 TNalbZnTQneQV+SJ1tbe4tiFaBMTq6If8kxoiiB+ZW1w/8dQ2TVsNZM0uRqWJ4jJ/nD8
 mr9EBEL2l8ztvF5MkYnQEX6rBPWU7bbBZbqlaQ7tCTZSlX24yIhbVePd9Va/DGtbcjNg
 HriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJr/LTHW+GqkSNY8ozSyLnL3Dk088Zn6xsAbqcrNL1s=;
 b=hM6FqpN5wk8HQ1VNiEgyA0weU5ljUN0NvUVJx7VvJPemYXY7cmuUcVSlByn2S/BPEC
 SUoYzDL4vi2IyfPBPGbCXjRiHBT7ZsS5LLpxRkU4Y36sui/vazQKKBI70bCVdyavFCGS
 upon8OO4U6wwFRqJclFvbuY9Ab8e0JvFkkwBqx8SLA1u2VGEYpQhgrmnFszlNj8bvoLL
 +7WYfIpVWPDbVLCuMRpmRAAw8hTK1F4iwbO2OjW5mEPMV1ve1Fo1f7BFvUyh3OsQc06H
 j5Wqfs3vslK4AQ7jiW9yQ6OJQ2U8rOyqxRuJwovGYJTro8rZ/gLvVPWx+QtHmE46SV4E
 xY0A==
X-Gm-Message-State: AO0yUKXEMKXJQgxhJfKqEb9ZoyvWsaaNfKNI18RlQy11TwY7UJ5IVwfH
 Zi9EnT2HfKX8HGIGeHCtDqqhnOEfV6Ou+U8/Y3ho5A==
X-Google-Smtp-Source: AK7set+knSTjRtRQSP5wv/ukuDPXb3xYihNOQOlObm2t0+6U+Ywa20OxSPvaqM91XssKcUB8oF3Rnthecy5zH1hCSRg=
X-Received: by 2002:a05:6871:80c:b0:15f:24bb:cd74 with SMTP id
 q12-20020a056871080c00b0015f24bbcd74mr232122oap.165.1675343067875; Thu, 02
 Feb 2023 05:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-5-alexghiti@rivosinc.com>
 <CANzO1D0UEj9d=jnHWUaCxsrZpLHL9C-hKiJPn6CPVUrjyYg-sw@mail.gmail.com>
 <CAHVXubgsrMEdAR6uCDCsWm5ApGiNRzb=aJJg0nOCgqEYU_sZGA@mail.gmail.com>
In-Reply-To: <CAHVXubgsrMEdAR6uCDCsWm5ApGiNRzb=aJJg0nOCgqEYU_sZGA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 2 Feb 2023 21:04:16 +0800
Message-ID: <CAE_xrPh0WQpNdwTJBnpbodcwFhoQugNO2bs9Lqax_68aD4i7yg@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] riscv: Introduce satp mode hw capabilities
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007021d805f3b734dc"
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=frank.chang@sifive.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:04:32 -0000

--0000000000007021d805f3b734dc
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 9:01 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> Hi Frank,
>
> On Wed, Feb 1, 2023 at 4:49 PM Frank Chang <frank.chang@sifive.com> wrote:
> >
> > On Tue, Jan 31, 2023 at 10:36 PM Alexandre Ghiti <alexghiti@rivosinc.com>
> wrote:
> >>
> >> Currently, the max satp mode is set with the only constraint that it
> must be
> >> implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].
> >>
> >> But we actually need to add another level of constraint: what the hw is
> >> actually capable of, because currently, a linux booting on a sifive-u54
> >> boots in sv57 mode which is incompatible with the cpu's sv39 max
> >> capability.
> >>
> >> So add a new bitmap to RISCVSATPMap which contains this capability and
> >> initialize it in every XXX_cpu_init.
> >>
> >> Finally:
> >> - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
> >> - the CPU hw capabilities constrains what the user may select
> >> - the user's selection then constrains what's available to the guest
> >>   OS.
> >>
> >> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++---------------
> >>  target/riscv/cpu.h |  8 +++--
> >>  2 files changed, 60 insertions(+), 27 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 3a7a1746aa..6dd76355ec 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool
> is_32_bit)
> >>      g_assert_not_reached();
> >>  }
> >>
> >> -/* Sets the satp mode to the max supported */
> >> -static void set_satp_mode_default_map(RISCVCPU *cpu)
> >> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> >> +                                        uint8_t satp_mode)
> >>  {
> >>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> >> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> >
> >
> > This will break user-mode QEMU.
> > valid_vm_1_10_32 and valid_vm_1_10_64 are defined in !CONFIG_USER_ONLY
> section.
> > This issue also exists in patch 3.
> > You have to move valid_vm_1_10_32 and valid_vm_1_10_64 out from
> !CONFIG_USER_ONLY.
>
> Indeed, good catch, thanks! Rather than moving valid_vm_1_10_[32|64],
> I'm going to try to surround all the satp handling inside #ifdef
> CONFIG_USER_ONLY. But if it's too cumbersome, I'll do as you suggest.
>

Hi Alex,

I think surrounding all the satp handling inside #ifdef is okay,
since satp is not been used in user-mode QEMU.

Regards,
Frank Chang


>
> Thanks again,
>
> Alex
>
> >
> > Regards,
> > Frank Chang
> >
> >>
> >> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> >> -        cpu->cfg.satp_mode.map |=
> >> -                        (1 << satp_mode_from_str(rv32 ? "sv32" :
> "sv57"));
> >> -    } else {
> >> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> >> +    for (int i = 0; i <= satp_mode; ++i) {
> >> +        if (valid_vm[i]) {
> >> +            cpu->cfg.satp_mode.supported |= (1 << i);
> >> +        }
> >>      }
> >>  }
> >>
> >> +/* Set the satp mode to the max supported */
> >> +static void set_satp_mode_default_map(RISCVCPU *cpu)
> >> +{
> >> +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
> >> +}
> >> +
> >>  static void riscv_any_cpu_init(Object *obj)
> >>  {
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >> +
> >>  #if defined(TARGET_RISCV32)
> >>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> >>  #elif defined(TARGET_RISCV64)
> >>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >>  #endif
> >>      set_priv_version(env, PRIV_VERSION_1_12_0);
> >>      register_cpu_props(obj);
> >> @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
> >>  static void rv64_base_cpu_init(Object *obj)
> >>  {
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >> +
> >>      /* We set this in the realise function */
> >>      set_misa(env, MXL_RV64, 0);
> >>      register_cpu_props(obj);
> >>      /* Set latest version of privileged specification */
> >>      set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >>  }
> >>
> >>  static void rv64_sifive_u_cpu_init(Object *obj)
> >>  {
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >> +
> >>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
> >>  }
> >>
> >>  static void rv64_sifive_e_cpu_init(Object *obj)
> >> @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
> >>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_10_0);
> >>      cpu->cfg.mmu = false;
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >>  }
> >>
> >>  static void rv128_base_cpu_init(Object *obj)
> >> @@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)
> >>          exit(EXIT_FAILURE);
> >>      }
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >>      /* We set this in the realise function */
> >>      set_misa(env, MXL_RV128, 0);
> >>      register_cpu_props(obj);
> >>      /* Set latest version of privileged specification */
> >>      set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> >>  }
> >>  #else
> >>  static void rv32_base_cpu_init(Object *obj)
> >>  {
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >> +
> >>      /* We set this in the realise function */
> >>      set_misa(env, MXL_RV32, 0);
> >>      register_cpu_props(obj);
> >>      /* Set latest version of privileged specification */
> >>      set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> >>  }
> >>
> >>  static void rv32_sifive_u_cpu_init(Object *obj)
> >>  {
> >>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >> +    RISCVCPU *cpu = RISCV_CPU(obj);
> >> +
> >>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> >>  }
> >>
> >>  static void rv32_sifive_e_cpu_init(Object *obj)
> >> @@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
> >>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_10_0);
> >>      cpu->cfg.mmu = false;
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >>  }
> >>
> >>  static void rv32_ibex_cpu_init(Object *obj)
> >> @@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_11_0);
> >>      cpu->cfg.mmu = false;
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >>      cpu->cfg.epmp = true;
> >>  }
> >>
> >> @@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
> >>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> >>      set_priv_version(env, PRIV_VERSION_1_10_0);
> >>      cpu->cfg.mmu = false;
> >> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >>  }
> >>  #endif
> >>
> >> @@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s,
> disassemble_info *info)
> >>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >>  {
> >>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> >> -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> >> -    uint8_t satp_mode_max;
> >> +    uint8_t satp_mode_map_max;
> >> +    uint8_t satp_mode_supported_max =
> >> +
> satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> >>
> >>      if (cpu->cfg.satp_mode.map == 0) {
> >>          if (cpu->cfg.satp_mode.init == 0) {
> >> @@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
> *cpu, Error **errp)
> >>               * valid_vm_1_10_32/64.
> >>               */
> >>              for (int i = 1; i < 16; ++i) {
> >> -                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> valid_vm[i]) {
> >> +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> >> +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
> >>                      for (int j = i - 1; j >= 0; --j) {
> >> -                        if (valid_vm[j]) {
> >> +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
> >>                              cpu->cfg.satp_mode.map |= (1 << j);
> >>                              break;
> >>                          }
> >> @@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
> *cpu, Error **errp)
> >>          }
> >>      }
> >>
> >> -    /* Make sure the configuration asked is supported by qemu */
> >> -    for (int i = 0; i < 16; ++i) {
> >> -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> >> -            error_setg(errp, "satp_mode %s is not valid",
> >> -                       satp_mode_str(i, rv32));
> >> -            return;
> >> -        }
> >> +    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> >> +
> >> +    /* Make sure the user asked for a supported configuration (HW and
> qemu) */
> >> +    if (satp_mode_map_max > satp_mode_supported_max) {
> >> +        error_setg(errp, "satp_mode %s is higher than hw max
> capability %s",
> >> +                   satp_mode_str(satp_mode_map_max, rv32),
> >> +                   satp_mode_str(satp_mode_supported_max, rv32));
> >> +        return;
> >>      }
> >>
> >>      /*
> >>       * Make sure the user did not ask for an invalid configuration as
> per
> >>       * the specification.
> >>       */
> >> -    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> >> -
> >>      if (!rv32) {
> >> -        for (int i = satp_mode_max - 1; i >= 0; --i) {
> >> +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> >>              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> >>                  (cpu->cfg.satp_mode.init & (1 << i)) &&
> >> -                valid_vm[i]) {
> >> +                (cpu->cfg.satp_mode.supported & (1 << i))) {
> >>                  error_setg(errp, "cannot disable %s satp mode if %s "
> >>                             "is enabled", satp_mode_str(i, false),
> >> -                           satp_mode_str(satp_mode_max, false));
> >> +                           satp_mode_str(satp_mode_map_max, false));
> >>                  return;
> >>              }
> >>          }
> >>      }
> >>
> >>      /* Finally expand the map so that all valid modes are set */
> >> -    for (int i = satp_mode_max - 1; i >= 0; --i) {
> >> -        if (valid_vm[i]) {
> >> +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> >> +        if (cpu->cfg.satp_mode.supported & (1 << i)) {
> >>              cpu->cfg.satp_mode.map |= (1 << i);
> >>          }
> >>      }
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index e37177db5c..b591122099 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -416,13 +416,17 @@ struct RISCVCPUClass {
> >>
> >>  /*
> >>   * map is a 16-bit bitmap: the most significant set bit in map is the
> maximum
> >> - * satp mode that is supported.
> >> + * satp mode that is supported. It may be chosen by the user and must
> respect
> >> + * what qemu implements (valid_1_10_32/64) and what the hw is capable
> of
> >> + * (supported bitmap below).
> >>   *
> >>   * init is a 16-bit bitmap used to make sure the user selected a
> correct
> >>   * configuration as per the specification.
> >> + *
> >> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> >>   */
> >>  typedef struct {
> >> -    uint16_t map, init;
> >> +    uint16_t map, init, supported;
> >>  } RISCVSATPMap;
> >>
> >>  struct RISCVCPUConfig {
> >> --
> >> 2.37.2
> >>
> >>
>

--0000000000007021d805f3b734dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 2, 2023 at 9:01 PM Alexandre =
Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@rivosinc.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Frank,<br>
<br>
On Wed, Feb 1, 2023 at 4:49 PM Frank Chang &lt;<a href=3D"mailto:frank.chan=
g@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jan 31, 2023 at 10:36 PM Alexandre Ghiti &lt;<a href=3D"mailto=
:alexghiti@rivosinc.com" target=3D"_blank">alexghiti@rivosinc.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Currently, the max satp mode is set with the only constraint that =
it must be<br>
&gt;&gt; implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].<br>
&gt;&gt;<br>
&gt;&gt; But we actually need to add another level of constraint: what the =
hw is<br>
&gt;&gt; actually capable of, because currently, a linux booting on a sifiv=
e-u54<br>
&gt;&gt; boots in sv57 mode which is incompatible with the cpu&#39;s sv39 m=
ax<br>
&gt;&gt; capability.<br>
&gt;&gt;<br>
&gt;&gt; So add a new bitmap to RISCVSATPMap which contains this capability=
 and<br>
&gt;&gt; initialize it in every XXX_cpu_init.<br>
&gt;&gt;<br>
&gt;&gt; Finally:<br>
&gt;&gt; - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use=
<br>
&gt;&gt; - the CPU hw capabilities constrains what the user may select<br>
&gt;&gt; - the user&#39;s selection then constrains what&#39;s available to=
 the guest<br>
&gt;&gt;=C2=A0 =C2=A0OS.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@riv=
osinc.com" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicr=
o.com" target=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++-----=
----------<br>
&gt;&gt;=C2=A0 target/riscv/cpu.h |=C2=A0 8 +++--<br>
&gt;&gt;=C2=A0 2 files changed, 60 insertions(+), 27 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt;&gt; index 3a7a1746aa..6dd76355ec 100644<br>
&gt;&gt; --- a/target/riscv/cpu.c<br>
&gt;&gt; +++ b/target/riscv/cpu.c<br>
&gt;&gt; @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode,=
 bool is_32_bit)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -/* Sets the satp mode to the max supported */<br>
&gt;&gt; -static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
&gt;&gt; +static void set_satp_mode_max_supported(RISCVCPU *cpu,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint8_t satp_mode)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =
=3D=3D MXL_RV32;<br>
&gt;&gt; +=C2=A0 =C2=A0 const bool *valid_vm =3D rv32 ? valid_vm_1_10_32 : =
valid_vm_1_10_64;<br>
&gt;<br>
&gt;<br>
&gt; This will break user-mode QEMU.<br>
&gt; valid_vm_1_10_32 and valid_vm_1_10_64 are defined in !CONFIG_USER_ONLY=
 section.<br>
&gt; This issue also exists in patch 3.<br>
&gt; You have to move valid_vm_1_10_32 and valid_vm_1_10_64 out from !CONFI=
G_USER_ONLY.<br>
<br>
Indeed, good catch, thanks! Rather than moving valid_vm_1_10_[32|64],<br>
I&#39;m going to try to surround all the satp handling inside #ifdef<br>
CONFIG_USER_ONLY. But if it&#39;s too cumbersome, I&#39;ll do as you sugges=
t.<br></blockquote><div><br></div><div>Hi Alex,</div><div><br></div><div>I =
think surrounding all the satp handling inside #ifdef is okay,</div><div>si=
nce satp is not been used in user-mode QEMU.</div><div><br></div><div>Regar=
ds,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Thanks again,<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (riscv_feature(&amp;cpu-&gt;env, RISCV_FEATURE_M=
MU)) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; satp_mode_from_str(rv32 ? &quot;sv32&quot;=
 : &quot;sv57&quot;));<br>
&gt;&gt; -=C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &lt=
;&lt; satp_mode_from_str(&quot;mbare&quot;));<br>
&gt;&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt;=3D satp_mode; ++i) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_vm[i]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.s=
upported |=3D (1 &lt;&lt; i);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +/* Set the satp mode to the max supported */<br>
&gt;&gt; +static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map =3D cpu-&gt;cfg.satp_mode=
.supported;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 static void riscv_any_cpu_init(Object *obj)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #if defined(TARGET_RISCV32)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF =
| RVD | RVC | RVU);<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
&gt;&gt;=C2=A0 #elif defined(TARGET_RISCV64)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF =
| RVD | RVC | RVU);<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register_cpu_props(obj);<br>
&gt;&gt; @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)<=
br>
&gt;&gt;=C2=A0 static void rv64_base_cpu_init(Object *obj)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* We set this in the realise function */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV64, 0);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register_cpu_props(obj);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Set latest version of privileged specificat=
ion */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv64_sifive_u_cpu_init(Object *obj)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF =
| RVD | RVC | RVS | RVU);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_10_0);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV39);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv64_sifive_e_cpu_init(Object *obj)<br>
&gt;&gt; @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj=
)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC =
| RVU);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_10_0);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.mmu =3D false;<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br=
>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv128_base_cpu_init(Object *obj)<br>
&gt;&gt; @@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* We set this in the realise function */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV128, 0);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register_cpu_props(obj);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Set latest version of privileged specificat=
ion */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt;=C2=A0 static void rv32_base_cpu_init(Object *obj)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* We set this in the realise function */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, 0);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 register_cpu_props(obj);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Set latest version of privileged specificat=
ion */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv32_sifive_u_cpu_init(Object *obj)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt=
;env;<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF =
| RVD | RVC | RVS | RVU);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_10_0);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv32_sifive_e_cpu_init(Object *obj)<br>
&gt;&gt; @@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj=
)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC =
| RVU);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_10_0);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.mmu =3D false;<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br=
>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static void rv32_ibex_cpu_init(Object *obj)<br>
&gt;&gt; @@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU)=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_11_0);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.mmu =3D false;<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.epmp =3D true;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object =
*obj)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF =
| RVC | RVU);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_10_0);<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.mmu =3D false;<br>
&gt;&gt; +=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br=
>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt; @@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState =
*s, disassemble_info *info)<br>
&gt;&gt;=C2=A0 static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =
=3D=3D MXL_RV32;<br>
&gt;&gt; -=C2=A0 =C2=A0 const bool *valid_vm =3D rv32 ? valid_vm_1_10_32 : =
valid_vm_1_10_64;<br>
&gt;&gt; -=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t satp_mode_map_max;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t satp_mode_supported_max =3D<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 satp_mode_max_from_map(cpu-&gt;cfg.satp_mode.supported=
);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.map =3D=3D 0) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.init =
=3D=3D 0) {<br>
&gt;&gt; @@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISC=
VCPU *cpu, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* valid_vm_1=
_10_32/64.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 1; =
i &lt; 16; ++i) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-=
&gt;cfg.satp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp; valid_vm[i]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-=
&gt;cfg.satp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (cpu-&gt;cfg.satp_mode.supported &amp; (1 &lt;&lt; i))) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for (int j =3D i - 1; j &gt;=3D 0; --j) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (valid_vm[j]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.supported &amp; (1 &lt;&lt; =
j)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &l=
t;&lt; j);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; @@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RIS=
CVCPU *cpu, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 /* Make sure the configuration asked is supported b=
y qemu */<br>
&gt;&gt; -=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 16; ++i) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.satp_mode.map &amp; =
(1 &lt;&lt; i)) &amp;&amp; !valid_vm[i]) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;=
satp_mode %s is not valid&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0satp_mode_str(i, rv32));<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 satp_mode_map_max =3D satp_mode_max_from_map(cpu-&g=
t;cfg.satp_mode.map);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Make sure the user asked for a supported configu=
ration (HW and qemu) */<br>
&gt;&gt; +=C2=A0 =C2=A0 if (satp_mode_map_max &gt; satp_mode_supported_max)=
 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;satp_mode %s i=
s higher than hw max capability %s&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0satp_mode_str(satp_mode_map_max, rv32),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0satp_mode_str(satp_mode_supported_max, rv32));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure the user did not ask for an =
invalid configuration as per<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* the specification.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; -=C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(cpu-&gt;cf=
g.satp_mode.map);<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (!rv32) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &=
gt;=3D 0; --i) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_map_max - 1;=
 i &gt;=3D 0; --i) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(cpu-&gt;cfg.=
satp_mode.map &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu=
-&gt;cfg.satp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid_vm[=
i]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu-&gt;=
cfg.satp_mode.supported &amp; (1 &lt;&lt; i))) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_setg(errp, &quot;cannot disable %s satp mode if %s &quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;is enabled&quot;, satp_mode_str=
(i, false),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(satp_mode_max, false));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(satp_mode_map_max, false));=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Finally expand the map so that all valid mo=
des are set */<br>
&gt;&gt; -=C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0; --i)=
 {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_vm[i]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 for (int i =3D satp_mode_map_max - 1; i &gt;=3D 0; =
--i) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.supported &=
amp; (1 &lt;&lt; i)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_m=
ode.map |=3D (1 &lt;&lt; i);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; index e37177db5c..b591122099 100644<br>
&gt;&gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; @@ -416,13 +416,17 @@ struct RISCVCPUClass {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0* map is a 16-bit bitmap: the most significant set bit=
 in map is the maximum<br>
&gt;&gt; - * satp mode that is supported.<br>
&gt;&gt; + * satp mode that is supported. It may be chosen by the user and =
must respect<br>
&gt;&gt; + * what qemu implements (valid_1_10_32/64) and what the hw is cap=
able of<br>
&gt;&gt; + * (supported bitmap below).<br>
&gt;&gt;=C2=A0 =C2=A0*<br>
&gt;&gt;=C2=A0 =C2=A0* init is a 16-bit bitmap used to make sure the user s=
elected a correct<br>
&gt;&gt;=C2=A0 =C2=A0* configuration as per the specification.<br>
&gt;&gt; + *<br>
&gt;&gt; + * supported is a 16-bit bitmap used to reflect the hw capabiliti=
es.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 typedef struct {<br>
&gt;&gt; -=C2=A0 =C2=A0 uint16_t map, init;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t map, init, supported;<br>
&gt;&gt;=C2=A0 } RISCVSATPMap;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 struct RISCVCPUConfig {<br>
&gt;&gt; --<br>
&gt;&gt; 2.37.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000007021d805f3b734dc--

