Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNFN6-00018v-SM
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 10:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNFMv-00012A-LY
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 10:49:58 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNFMs-0003PW-NQ
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 10:49:53 -0500
Received: by mail-lf1-x12a.google.com with SMTP id h24so29914884lfv.6
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgwV7aGyci2+rECTp64GNpp+MHpxj99BPO3HnCP3T1U=;
 b=b661G3yt29KuC6hRNYWfoVP2A49igBK2yWXEcY24Czaoyy98Pmrd5Y1VCaiw1yjHbl
 H6sDv29wTDY6yPUaTIRUYTHSPJAhYDS5omRmB3vHPomoAD+UkoyJdL0wflBCdDwr6ayt
 AMCkTUCI1S5YoMz/AOPDRidvPrVs5dX7U2eVUiI5s4glRtaMzQSjPnpECf1SX2Xc8imK
 R7UR4oESz7XIHvirJNG6zkjNotnxWYh/Zv7PhSixad/pcJB2vkiGAhooCxaZMjTcQXou
 XZSc/EE/QzhqyRvALZ4CDPVaCe3UDINb9GckjCdRubI1RiJGJ7CEcqShmYwIKwOcc40c
 80pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgwV7aGyci2+rECTp64GNpp+MHpxj99BPO3HnCP3T1U=;
 b=n9HIxefiVtl02veM8NpgDUWGkt/eVWhmwtw1J17nKCPFzxrb/iygwHUPxftUbPCZlO
 xZD5gBZzI0Hscvf/obMyerEcdrCRel3ypOv0WZf39zG/UR/+Q4Vzo2d3oT4ExhQYlUJZ
 lXvBD9z02EJhokUICIDcoaeyBGJRNlrxw/adRAw+eAYt3hkA2Nv/ofv3w+HOpwIPyyqq
 S9BM/tyCKMn7opzK0QqeuXGFwlh1aGcWyhGaA3mb9Iddqh6DNQnOWAjuhd3l3zTF0Shl
 vIuXPi0+gSOfSNeqMIkp8zEFhilipYwT/4pGqF3RRhDFBerVligSKzd7DZO94YnJFMYO
 1NBQ==
X-Gm-Message-State: AO0yUKXAOIZuhFyaWomaR1YJzvPlC49eL5S2EEMa0cgExqIEHmC6v1zn
 D5eZc3uRmY5QIcGun9P273ZYy6fEI297S7mgHlAmErMzw4p9uya1dTRqj06WBwK232gpn56dmbx
 vjnjsCXD0oSQksM8a8vfmAIjYJ8g5Y9Vv9bUnNUalodQ8xGWtTADEoUgpckZxlWQ/8db/aTGpDq
 1Q7A==
X-Google-Smtp-Source: AK7set/Km0v3YDt6Rp+dJnEOPouDoL8aLV5bDqSRgdeT/MTrA32FYQq1PuHy8ZkMWU5aGkUanadYuA==
X-Received: by 2002:ac2:5607:0:b0:4cb:430b:c6b with SMTP id
 v7-20020ac25607000000b004cb430b0c6bmr548189lfd.29.1675266588779; 
 Wed, 01 Feb 2023 07:49:48 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 u13-20020a056512094d00b004ca0ea7af24sm1197182lft.174.2023.02.01.07.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 07:49:48 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id d8so7474127ljq.9;
 Wed, 01 Feb 2023 07:49:47 -0800 (PST)
X-Received: by 2002:a05:651c:22c:b0:290:795d:1e07 with SMTP id
 z12-20020a05651c022c00b00290795d1e07mr448271ljn.211.1675266587651; Wed, 01
 Feb 2023 07:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-5-alexghiti@rivosinc.com>
In-Reply-To: <20230131133906.1956228-5-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 1 Feb 2023 23:49:36 +0800
X-Gmail-Original-Message-ID: <CANzO1D0UEj9d=jnHWUaCxsrZpLHL9C-hKiJPn6CPVUrjyYg-sw@mail.gmail.com>
Message-ID: <CANzO1D0UEj9d=jnHWUaCxsrZpLHL9C-hKiJPn6CPVUrjyYg-sw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] riscv: Introduce satp mode hw capabilities
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000dc742f05f3a565b9"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x12a.google.com
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
X-List-Received-Date: Wed, 01 Feb 2023 15:50:02 -0000

--000000000000dc742f05f3a565b9
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 10:36 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> Currently, the max satp mode is set with the only constraint that it must
> be
> implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].
>
> But we actually need to add another level of constraint: what the hw is
> actually capable of, because currently, a linux booting on a sifive-u54
> boots in sv57 mode which is incompatible with the cpu's sv39 max
> capability.
>
> So add a new bitmap to RISCVSATPMap which contains this capability and
> initialize it in every XXX_cpu_init.
>
> Finally:
> - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
> - the CPU hw capabilities constrains what the user may select
> - the user's selection then constrains what's available to the guest
>   OS.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++---------------
>  target/riscv/cpu.h |  8 +++--
>  2 files changed, 60 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3a7a1746aa..6dd76355ec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool
> is_32_bit)
>      g_assert_not_reached();
>  }
>
> -/* Sets the satp mode to the max supported */
> -static void set_satp_mode_default_map(RISCVCPU *cpu)
> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> +                                        uint8_t satp_mode)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
>

This will break user-mode QEMU.
valid_vm_1_10_32 and valid_vm_1_10_64 are defined in !CONFIG_USER_ONLY
section.
This issue also exists in patch 3.
You have to move valid_vm_1_10_32 and valid_vm_1_10_64 out from
!CONFIG_USER_ONLY.

Regards,
Frank Chang


> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> -        cpu->cfg.satp_mode.map |=
> -                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
> -    } else {
> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> +    for (int i = 0; i <= satp_mode; ++i) {
> +        if (valid_vm[i]) {
> +            cpu->cfg.satp_mode.supported |= (1 << i);
> +        }
>      }
>  }
>
> +/* Set the satp mode to the max supported */
> +static void set_satp_mode_default_map(RISCVCPU *cpu)
> +{
> +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>  #if defined(TARGET_RISCV32)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>      register_cpu_props(obj);
> @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
>  static void rv64_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>  }
>
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>
>  static void rv128_base_cpu_init(Object *obj)
> @@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)
>          exit(EXIT_FAILURE);
>      }
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>  }
>
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>      cpu->cfg.epmp = true;
>  }
>
> @@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  }
>  #endif
>
> @@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s,
> disassemble_info *info)
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> -    uint8_t satp_mode_max;
> +    uint8_t satp_mode_map_max;
> +    uint8_t satp_mode_supported_max =
> +
> satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
>
>      if (cpu->cfg.satp_mode.map == 0) {
>          if (cpu->cfg.satp_mode.init == 0) {
> @@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
> *cpu, Error **errp)
>               * valid_vm_1_10_32/64.
>               */
>              for (int i = 1; i < 16; ++i) {
> -                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
> +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
> +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
>                      for (int j = i - 1; j >= 0; --j) {
> -                        if (valid_vm[j]) {
> +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
>                              cpu->cfg.satp_mode.map |= (1 << j);
>                              break;
>                          }
> @@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
> *cpu, Error **errp)
>          }
>      }
>
> -    /* Make sure the configuration asked is supported by qemu */
> -    for (int i = 0; i < 16; ++i) {
> -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> -            error_setg(errp, "satp_mode %s is not valid",
> -                       satp_mode_str(i, rv32));
> -            return;
> -        }
> +    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +
> +    /* Make sure the user asked for a supported configuration (HW and
> qemu) */
> +    if (satp_mode_map_max > satp_mode_supported_max) {
> +        error_setg(errp, "satp_mode %s is higher than hw max capability
> %s",
> +                   satp_mode_str(satp_mode_map_max, rv32),
> +                   satp_mode_str(satp_mode_supported_max, rv32));
> +        return;
>      }
>
>      /*
>       * Make sure the user did not ask for an invalid configuration as per
>       * the specification.
>       */
> -    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> -
>      if (!rv32) {
> -        for (int i = satp_mode_max - 1; i >= 0; --i) {
> +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
>              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
>                  (cpu->cfg.satp_mode.init & (1 << i)) &&
> -                valid_vm[i]) {
> +                (cpu->cfg.satp_mode.supported & (1 << i))) {
>                  error_setg(errp, "cannot disable %s satp mode if %s "
>                             "is enabled", satp_mode_str(i, false),
> -                           satp_mode_str(satp_mode_max, false));
> +                           satp_mode_str(satp_mode_map_max, false));
>                  return;
>              }
>          }
>      }
>
>      /* Finally expand the map so that all valid modes are set */
> -    for (int i = satp_mode_max - 1; i >= 0; --i) {
> -        if (valid_vm[i]) {
> +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> +        if (cpu->cfg.satp_mode.supported & (1 << i)) {
>              cpu->cfg.satp_mode.map |= (1 << i);
>          }
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e37177db5c..b591122099 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -416,13 +416,17 @@ struct RISCVCPUClass {
>
>  /*
>   * map is a 16-bit bitmap: the most significant set bit in map is the
> maximum
> - * satp mode that is supported.
> + * satp mode that is supported. It may be chosen by the user and must
> respect
> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> + * (supported bitmap below).
>   *
>   * init is a 16-bit bitmap used to make sure the user selected a correct
>   * configuration as per the specification.
> + *
> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
>   */
>  typedef struct {
> -    uint16_t map, init;
> +    uint16_t map, init, supported;
>  } RISCVSATPMap;
>
>  struct RISCVCPUConfig {
> --
> 2.37.2
>
>
>

--000000000000dc742f05f3a565b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 31, 2023 at 10:36 PM Alexandr=
e Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@rivosinc.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Currently, the max satp mode is set with the on=
ly constraint that it must be<br>
implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].<br>
<br>
But we actually need to add another level of constraint: what the hw is<br>
actually capable of, because currently, a linux booting on a sifive-u54<br>
boots in sv57 mode which is incompatible with the cpu&#39;s sv39 max<br>
capability.<br>
<br>
So add a new bitmap to RISCVSATPMap which contains this capability and<br>
initialize it in every XXX_cpu_init.<br>
<br>
Finally:<br>
- valid_vm_1_10_[32|64] constrains which satp mode the CPU can use<br>
- the CPU hw capabilities constrains what the user may select<br>
- the user&#39;s selection then constrains what&#39;s available to the gues=
t<br>
=C2=A0 OS.<br>
<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" ta=
rget=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++--------------=
-<br>
=C2=A0target/riscv/cpu.h |=C2=A0 8 +++--<br>
=C2=A02 files changed, 60 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 3a7a1746aa..6dd76355ec 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_=
32_bit)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0}<br>
<br>
-/* Sets the satp mode to the max supported */<br>
-static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
+static void set_satp_mode_max_supported(RISCVCPU *cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t =
satp_mode)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MX=
L_RV32;<br>
+=C2=A0 =C2=A0 const bool *valid_vm =3D rv32 ? valid_vm_1_10_32 : valid_vm_=
1_10_64;<br></blockquote><div><br></div><div>This will break user-mode QEMU=
.</div><div>valid_vm_1_10_32 and valid_vm_1_10_64 are defined=C2=A0in !CONF=
IG_USER_ONLY section.<br></div><div>This issue also exists in patch 3.<br><=
/div><div>You have to move valid_vm_1_10_32 and valid_vm_1_10_64 out from !=
CONFIG_USER_ONLY.</div><div><br></div><div>Regards,</div><div>Frank Chang</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=C2=A0 =C2=A0 if (riscv_feature(&amp;cpu-&gt;env, RISCV_FEATURE_MMU)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; satp_mode_from_str(rv32 ? &quot;sv32&quot; : &quot;s=
v57&quot;));<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; sat=
p_mode_from_str(&quot;mbare&quot;));<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt;=3D satp_mode; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.supported =
|=3D (1 &lt;&lt; i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/* Set the satp mode to the max supported */<br>
+static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
+{<br>
+=C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map =3D cpu-&gt;cfg.satp_mode.supporte=
d;<br>
+}<br>
+<br>
=C2=A0static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
=C2=A0#if defined(TARGET_RISCV32)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
=C2=A0#elif defined(TARGET_RISCV64)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
@@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0static void rv64_base_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv64_sifive_u_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVS | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV39);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv64_sifive_e_cpu_init(Object *obj)<br>
@@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);<b=
r>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv128_base_cpu_init(Object *obj)<br>
@@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV128, 0);<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV57);<br>
=C2=A0}<br>
=C2=A0#else<br>
=C2=A0static void rv32_base_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, 0);<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_sifive_u_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | R=
VC | RVS | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_SV32);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_sifive_e_cpu_init(Object *obj)<br>
@@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);<b=
r>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_ibex_cpu_init(Object *obj)<br>
@@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_11_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.epmp =3D true;<br>
=C2=A0}<br>
<br>
@@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | R=
VU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disas=
semble_info *info)<br>
=C2=A0static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(&amp;cpu-&gt;env) =3D=3D MX=
L_RV32;<br>
-=C2=A0 =C2=A0 const bool *valid_vm =3D rv32 ? valid_vm_1_10_32 : valid_vm_=
1_10_64;<br>
-=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_map_max;<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_supported_max =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 satp_mode_max_from_map(cpu-&gt;cfg.satp_mode.supported);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.satp_mode.map =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.satp_mode.init =3D=3D 0) =
{<br>
@@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * valid_vm_1_10_32/64.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 1; i &lt; 16=
; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.s=
atp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp; valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.s=
atp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu=
-&gt;cfg.satp_mode.supported &amp; (1 &lt;&lt; i))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for (int j =3D i - 1; j &gt;=3D 0; --j) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (valid_vm[j]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.supported &amp; (1 &lt;&lt; j)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.satp_mode.map |=3D (1 &lt;&lt; j=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
@@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cp=
u, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* Make sure the configuration asked is supported by qemu */=
<br>
-=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 16; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((cpu-&gt;cfg.satp_mode.map &amp; (1 &lt;&l=
t; i)) &amp;&amp; !valid_vm[i]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;satp_mode=
 %s is not valid&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0satp_mode_str(i, rv32));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 satp_mode_map_max =3D satp_mode_max_from_map(cpu-&gt;cfg.sat=
p_mode.map);<br>
+<br>
+=C2=A0 =C2=A0 /* Make sure the user asked for a supported configuration (H=
W and qemu) */<br>
+=C2=A0 =C2=A0 if (satp_mode_map_max &gt; satp_mode_supported_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;satp_mode %s is higher =
than hw max capability %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_=
mode_str(satp_mode_map_max, rv32),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0satp_=
mode_str(satp_mode_supported_max, rv32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Make sure the user did not ask for an invalid config=
uration as per<br>
=C2=A0 =C2=A0 =C2=A0 * the specification.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(cpu-&gt;cfg.satp_mo=
de.map);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (!rv32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0;=
 --i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D satp_mode_map_max - 1; i &gt;=
=3D 0; --i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(cpu-&gt;cfg.satp_mode=
.map &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cpu-&gt;cfg.=
satp_mode.init &amp; (1 &lt;&lt; i)) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid_vm[i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cpu-&gt;cfg.satp_=
mode.supported &amp; (1 &lt;&lt; i))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(er=
rp, &quot;cannot disable %s satp mode if %s &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;is enabled&quot;, satp_mode_str(i, false),<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(satp_mode_max, false));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0satp_mode_str(satp_mode_map_max, false));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Finally expand the map so that all valid modes are s=
et */<br>
-=C2=A0 =C2=A0 for (int i =3D satp_mode_max - 1; i &gt;=3D 0; --i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (valid_vm[i]) {<br>
+=C2=A0 =C2=A0 for (int i =3D satp_mode_map_max - 1; i &gt;=3D 0; --i) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.satp_mode.supported &amp; (1 &=
lt;&lt; i)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.satp_mode.map |=
=3D (1 &lt;&lt; i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index e37177db5c..b591122099 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -416,13 +416,17 @@ struct RISCVCPUClass {<br>
<br>
=C2=A0/*<br>
=C2=A0 * map is a 16-bit bitmap: the most significant set bit in map is the=
 maximum<br>
- * satp mode that is supported.<br>
+ * satp mode that is supported. It may be chosen by the user and must resp=
ect<br>
+ * what qemu implements (valid_1_10_32/64) and what the hw is capable of<b=
r>
+ * (supported bitmap below).<br>
=C2=A0 *<br>
=C2=A0 * init is a 16-bit bitmap used to make sure the user selected a corr=
ect<br>
=C2=A0 * configuration as per the specification.<br>
+ *<br>
+ * supported is a 16-bit bitmap used to reflect the hw capabilities.<br>
=C2=A0 */<br>
=C2=A0typedef struct {<br>
-=C2=A0 =C2=A0 uint16_t map, init;<br>
+=C2=A0 =C2=A0 uint16_t map, init, supported;<br>
=C2=A0} RISCVSATPMap;<br>
<br>
=C2=A0struct RISCVCPUConfig {<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000dc742f05f3a565b9--

