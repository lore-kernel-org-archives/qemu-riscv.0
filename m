Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNqyJ-0004xD-Nb
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 02:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNqxw-0004r6-LJ
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 02:58:37 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pNqxj-0007sS-Ml
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 02:58:26 -0500
Received: by mail-oi1-x22b.google.com with SMTP id s66so3512944oib.7
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kcefwA5K6WcbLC0SdGXIhhLFpzcpFgtKkLin8cMadwo=;
 b=W8+jQ4zPjqtBqxXi1DRqDUC5CQfrmmb5ETQBJVIfxTKm7xFHNxoyxcNC2IcLvU6on/
 H9oPi4lwDv+DuvTwf9G5g50w0GKZpcNZgout8xUheKDZfVG6GJkYG9kiqaU0A6cR/WBI
 gJQHesTm1cuo1h8wfpm2kS5x0aDfkvOGGrPJ6g/QG2lHIEILjMEtGsGcIs3gbV2YLWTb
 eF8kE1imD1ja8RzK9emCX0RO+ZLRXmiPLvha5IKNQHWGa9bmUPjSNSji91swRMbIVOf5
 o64Mhn4eie31M1A9dPHuv2/9V41dq2/xRZXaJpYcIhVZlWmtrU8PkmpOaGiEs7lsblpl
 65+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcefwA5K6WcbLC0SdGXIhhLFpzcpFgtKkLin8cMadwo=;
 b=M9Y+v/p9pbr+PiWi+QL3LzxZh0vA+sOL0h5bISo84YFnqnjG1snOJdrSVMOcwLRD5U
 gP6v1Cxib7Nyp+Z0/UP6oD2jrMWqZzDRNSOC9GGH9sEYBIMBSY8Cp1PUBFbHxoVl04WL
 3AeWXJgJf/ba2yrw6sWuniIhrzG/LlfkIhu6QCKOyYBI+yNQVWe0thadVdH5YXnV0tPy
 9i3bcEUnCHX4X6beTmF2KyaGHNt2UqCnpFrxJ96gKcMlW58k9zS1SgY+nCeH6GVog/98
 Qt+AaI+sw9qvqSqweI8ccZwOBP4fbCoiVB9uGcmMu4N6sUxgpoIvJx5vLbWnqWiWlw4p
 bF+g==
X-Gm-Message-State: AO0yUKWusDdNkkTQyFHbDrw4/rzNBL0gbQRvfMusQI/MptnaLvOTu5xW
 2UgwzzrCL6TtFo3CXRsKYMcQrXY009ZSja2uWU1/Vg==
X-Google-Smtp-Source: AK7set+XqgbOzC0DHVum758vkSXYkp57orxQwgPWWZoFV1534DtsHmfXgsguwOd/j+x7NoQxl9UvPpvZWwTdWe07nzI=
X-Received: by 2002:aca:5986:0:b0:378:721e:ab8c with SMTP id
 n128-20020aca5986000000b00378721eab8cmr390682oib.4.1675411097743; Thu, 02 Feb
 2023 23:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
 <20230203055812.257458-5-alexghiti@rivosinc.com>
In-Reply-To: <20230203055812.257458-5-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 3 Feb 2023 15:58:06 +0800
Message-ID: <CAE_xrPgJLZkhxL6HCiY2ZAoAVGgihgOaY9cuy7LA3_ocTWEH4w@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] riscv: Introduce satp mode hw capabilities
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Bin Meng <bmeng@tinylab.org>
Content-Type: multipart/alternative; boundary="0000000000005597ba05f3c70b1d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 07:58:46 -0000

--0000000000005597ba05f3c70b1d
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Feb 3, 2023 at 2:02 PM Alexandre Ghiti <alexghiti@rivosinc.com>
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
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  target/riscv/cpu.c | 91 +++++++++++++++++++++++++++++++++-------------
>  target/riscv/cpu.h |  8 +++-
>  2 files changed, 72 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 56057cf87c..7e9924ede9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -293,18 +293,24 @@ const char *satp_mode_str(uint8_t satp_mode, bool
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
> +
> +/* Set the satp mode to the max supported */
> +static void set_satp_mode_default_map(RISCVCPU *cpu)
> +{
> +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
> +}
>  #endif
>
>  static void riscv_any_cpu_init(Object *obj)
> @@ -315,6 +321,13 @@ static void riscv_any_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj),
> +            riscv_cpu_mxl(&RISCV_CPU(obj)->env) == MXL_RV32 ?
> +                                    VM_1_10_SV32 : VM_1_10_SV57);
> +#endif
> +
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>      register_cpu_props(obj);
>  }
> @@ -328,6 +341,9 @@ static void rv64_base_cpu_init(Object *obj)
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
> +#endif
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -335,6 +351,9 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> +#endif
>  }
>
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -345,6 +364,9 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> +#endif
>  }
>
>  static void rv128_base_cpu_init(Object *obj)
> @@ -361,6 +383,9 @@ static void rv128_base_cpu_init(Object *obj)
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
> +#endif
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
> @@ -371,6 +396,9 @@ static void rv32_base_cpu_init(Object *obj)
>      register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> +#endif
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -378,6 +406,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS |
> RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> +#endif
>  }
>
>  static void rv32_sifive_e_cpu_init(Object *obj)
> @@ -388,6 +419,9 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> +#endif
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
> @@ -398,6 +432,9 @@ static void rv32_ibex_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> +#endif
>      cpu->cfg.epmp = true;
>  }
>
> @@ -409,6 +446,9 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> +#endif
>  }
>  #endif
>
> @@ -701,8 +741,9 @@ static void riscv_cpu_disas_set_info(CPUState *s,
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
> @@ -715,9 +756,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
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
> @@ -728,37 +770,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU
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
> index df6d9e06e4..defc5769b5 100644
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

--0000000000005597ba05f3c70b1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 3, 2023 at 2:02 PM A=
lexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@rivo=
sinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Currently, the max satp mode is set with the only constraint that i=
t must be<br>
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
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng@tinylab.org" target=3D"_b=
lank">bmeng@tinylab.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 91 +++++++++++++++++++++++++++++++++------------=
-<br>
=C2=A0target/riscv/cpu.h |=C2=A0 8 +++-<br>
=C2=A02 files changed, 72 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 56057cf87c..7e9924ede9 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -293,18 +293,24 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_=
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
1_10_64;<br>
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
+<br>
+/* Set the satp mode to the max supported */<br>
+static void set_satp_mode_default_map(RISCVCPU *cpu)<br>
+{<br>
+=C2=A0 =C2=A0 cpu-&gt;cfg.satp_mode.map =3D cpu-&gt;cfg.satp_mode.supporte=
d;<br>
+}<br>
=C2=A0#endif<br>
<br>
=C2=A0static void riscv_any_cpu_init(Object *obj)<br>
@@ -315,6 +321,13 @@ static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0#elif defined(TARGET_RISCV64)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVU);<br>
=C2=A0#endif<br>
+<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_mxl(&amp;RISCV_CPU(obj=
)-&gt;env) =3D=3D MXL_RV32 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VM_1_10_SV32 : VM_1_10=
_SV57);<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0}<br>
@@ -328,6 +341,9 @@ static void rv64_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);<b=
r>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv64_sifive_u_cpu_init(Object *obj)<br>
@@ -335,6 +351,9 @@ static void rv64_sifive_u_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | R=
VC | RVS | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);<b=
r>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv64_sifive_e_cpu_init(Object *obj)<br>
@@ -345,6 +364,9 @@ static void rv64_sifive_e_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);<b=
r>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv128_base_cpu_init(Object *obj)<br>
@@ -361,6 +383,9 @@ static void rv128_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);<b=
r>
+#endif<br>
=C2=A0}<br>
=C2=A0#else<br>
=C2=A0static void rv32_base_cpu_init(Object *obj)<br>
@@ -371,6 +396,9 @@ static void rv32_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0register_cpu_props(obj);<br>
=C2=A0 =C2=A0 =C2=A0/* Set latest version of privileged specification */<br=
>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_12_0);<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);<b=
r>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_sifive_u_cpu_init(Object *obj)<br>
@@ -378,6 +406,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | R=
VC | RVS | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);<b=
r>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_sifive_e_cpu_init(Object *obj)<br>
@@ -388,6 +419,9 @@ static void rv32_sifive_e_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);<b=
r>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_ibex_cpu_init(Object *obj)<br>
@@ -398,6 +432,9 @@ static void rv32_ibex_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_11_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.epmp =3D true;<br>
=C2=A0}<br>
<br>
@@ -409,6 +446,9 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | R=
VU);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_10_0);<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;cfg.mmu =3D false;<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 set_satp_mode_max_supported(cpu, VM_1_10_MBARE);<br>
+#endif<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -701,8 +741,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disas=
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
@@ -715,9 +756,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu=
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
@@ -728,37 +770,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cp=
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
index df6d9e06e4..defc5769b5 100644<br>
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
</blockquote></div>

--0000000000005597ba05f3c70b1d--

