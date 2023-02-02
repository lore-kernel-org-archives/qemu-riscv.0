Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNZDt-0006Di-OC
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNZDF-000605-81
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:01:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNZD9-0000Rl-K3
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:01:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id m7so1624126wru.8
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IjXuu4uhkJlpiS407OakS4tU/O61gU0/VzYlvcJmX6Y=;
 b=RALcBq2VZJ7TrJJ+wb2hm+4Nw8ePsnuZB5BdK58phqHMV/9jQubdI5eSlMZkujNI1o
 H5pdKFXgKylgE3jPYbMRbA5w0m2DX7O1PC3qfXYFutSvomMNCBD3SvHBAdCGSflBFo/k
 4IPJlE80jhZciq+8LfSr0QNKqngle9k5od/xXelxjcawLwdY81o9EbuAIkbw1fY6xKi9
 ac9mnkPVGGofVwVZ1fLyCcs6rEXMWWFr+Um/s5OvRwRpRhCmxGYPQg7fuGmFjKWiRx4q
 EK0dUDvAnk+6CT65Q4qwFDwrm66p0IgDp6YYNT7gpZzG2N9FFkoHXbarsDqFPluR5Xtr
 zP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IjXuu4uhkJlpiS407OakS4tU/O61gU0/VzYlvcJmX6Y=;
 b=M2KPhpa6JXZ2/k/KOmxPK4MwZ3L2CzPQsagJZzyx+diDtm1JSvdqK2mo35NyAmSCFo
 YVIFh/E53SHLoKAZpTA3Vtk+ZiMcjgLPM6AdTXN3Qa00egnoJqU4ai2Bdcd+cF+71FFK
 OF5277H9yPtwEROQ/FRIAjxWwBsB4MhXynCCOfARKuesSAlSjhgid8ckxsKAjXXvTmKJ
 uLoiD0KuvF8fAgoRnpTGNVbIMyTYL5QAMfny3zbKinA6AaZ95q7riI6ptN5TqRh7UAxh
 gs3nR7kVnel8YjHdMUtOCh7/rHHWFJhu+33i9m6CwrrLnQzMr8jtQ/PtIM3fRaQrzq12
 osgQ==
X-Gm-Message-State: AO0yUKUHpgo0qA/xE1i7Ln3HZ/vEbG6O3aI4cugzmKG8a1054+xaoDm3
 arFogyd+m/lZ0MVfYZtEQQU35tSfVa7D5SwZq3N4vQ==
X-Google-Smtp-Source: AK7set/52WIPfqWwZAcWi8uQzSLkPK/yPS3m5TmV9hTjk0QUYDcS7i60JULJFTsO7zS0pRr+zpEWyFwsRft5b1toNkk=
X-Received: by 2002:a5d:5587:0:b0:2c2:de2b:e7d1 with SMTP id
 i7-20020a5d5587000000b002c2de2be7d1mr205661wrv.55.1675342863889; Thu, 02 Feb
 2023 05:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-5-alexghiti@rivosinc.com>
 <CANzO1D0UEj9d=jnHWUaCxsrZpLHL9C-hKiJPn6CPVUrjyYg-sw@mail.gmail.com>
In-Reply-To: <CANzO1D0UEj9d=jnHWUaCxsrZpLHL9C-hKiJPn6CPVUrjyYg-sw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 2 Feb 2023 14:00:52 +0100
Message-ID: <CAHVXubgsrMEdAR6uCDCsWm5ApGiNRzb=aJJg0nOCgqEYU_sZGA@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] riscv: Introduce satp mode hw capabilities
To: Frank Chang <frank.chang@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:01:25 -0000

Hi Frank,

On Wed, Feb 1, 2023 at 4:49 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Tue, Jan 31, 2023 at 10:36 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>>
>> Currently, the max satp mode is set with the only constraint that it must be
>> implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].
>>
>> But we actually need to add another level of constraint: what the hw is
>> actually capable of, because currently, a linux booting on a sifive-u54
>> boots in sv57 mode which is incompatible with the cpu's sv39 max
>> capability.
>>
>> So add a new bitmap to RISCVSATPMap which contains this capability and
>> initialize it in every XXX_cpu_init.
>>
>> Finally:
>> - valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
>> - the CPU hw capabilities constrains what the user may select
>> - the user's selection then constrains what's available to the guest
>>   OS.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++---------------
>>  target/riscv/cpu.h |  8 +++--
>>  2 files changed, 60 insertions(+), 27 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 3a7a1746aa..6dd76355ec 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>>      g_assert_not_reached();
>>  }
>>
>> -/* Sets the satp mode to the max supported */
>> -static void set_satp_mode_default_map(RISCVCPU *cpu)
>> +static void set_satp_mode_max_supported(RISCVCPU *cpu,
>> +                                        uint8_t satp_mode)
>>  {
>>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
>> +    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
>
>
> This will break user-mode QEMU.
> valid_vm_1_10_32 and valid_vm_1_10_64 are defined in !CONFIG_USER_ONLY section.
> This issue also exists in patch 3.
> You have to move valid_vm_1_10_32 and valid_vm_1_10_64 out from !CONFIG_USER_ONLY.

Indeed, good catch, thanks! Rather than moving valid_vm_1_10_[32|64],
I'm going to try to surround all the satp handling inside #ifdef
CONFIG_USER_ONLY. But if it's too cumbersome, I'll do as you suggest.

Thanks again,

Alex

>
> Regards,
> Frank Chang
>
>>
>> -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
>> -        cpu->cfg.satp_mode.map |=
>> -                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
>> -    } else {
>> -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
>> +    for (int i = 0; i <= satp_mode; ++i) {
>> +        if (valid_vm[i]) {
>> +            cpu->cfg.satp_mode.supported |= (1 << i);
>> +        }
>>      }
>>  }
>>
>> +/* Set the satp mode to the max supported */
>> +static void set_satp_mode_default_map(RISCVCPU *cpu)
>> +{
>> +    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
>> +}
>> +
>>  static void riscv_any_cpu_init(Object *obj)
>>  {
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>>  #if defined(TARGET_RISCV32)
>>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>>  #elif defined(TARGET_RISCV64)
>>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>>  #endif
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>>      register_cpu_props(obj);
>> @@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
>>  static void rv64_base_cpu_init(Object *obj)
>>  {
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV64, 0);
>>      register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>>  }
>>
>>  static void rv64_sifive_u_cpu_init(Object *obj)
>>  {
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>>  }
>>
>>  static void rv64_sifive_e_cpu_init(Object *obj)
>> @@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_10_0);
>>      cpu->cfg.mmu = false;
>> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>>  }
>>
>>  static void rv128_base_cpu_init(Object *obj)
>> @@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)
>>          exit(EXIT_FAILURE);
>>      }
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV128, 0);
>>      register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
>>  }
>>  #else
>>  static void rv32_base_cpu_init(Object *obj)
>>  {
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV32, 0);
>>      register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>>  }
>>
>>  static void rv32_sifive_u_cpu_init(Object *obj)
>>  {
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
>>  }
>>
>>  static void rv32_sifive_e_cpu_init(Object *obj)
>> @@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_10_0);
>>      cpu->cfg.mmu = false;
>> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>>  }
>>
>>  static void rv32_ibex_cpu_init(Object *obj)
>> @@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_11_0);
>>      cpu->cfg.mmu = false;
>> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>>      cpu->cfg.epmp = true;
>>  }
>>
>> @@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>>      set_priv_version(env, PRIV_VERSION_1_10_0);
>>      cpu->cfg.mmu = false;
>> +    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>>  }
>>  #endif
>>
>> @@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>>  {
>>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
>> -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
>> -    uint8_t satp_mode_max;
>> +    uint8_t satp_mode_map_max;
>> +    uint8_t satp_mode_supported_max =
>> +                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
>>
>>      if (cpu->cfg.satp_mode.map == 0) {
>>          if (cpu->cfg.satp_mode.init == 0) {
>> @@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>>               * valid_vm_1_10_32/64.
>>               */
>>              for (int i = 1; i < 16; ++i) {
>> -                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
>> +                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
>> +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
>>                      for (int j = i - 1; j >= 0; --j) {
>> -                        if (valid_vm[j]) {
>> +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
>>                              cpu->cfg.satp_mode.map |= (1 << j);
>>                              break;
>>                          }
>> @@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>>          }
>>      }
>>
>> -    /* Make sure the configuration asked is supported by qemu */
>> -    for (int i = 0; i < 16; ++i) {
>> -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
>> -            error_setg(errp, "satp_mode %s is not valid",
>> -                       satp_mode_str(i, rv32));
>> -            return;
>> -        }
>> +    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
>> +
>> +    /* Make sure the user asked for a supported configuration (HW and qemu) */
>> +    if (satp_mode_map_max > satp_mode_supported_max) {
>> +        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
>> +                   satp_mode_str(satp_mode_map_max, rv32),
>> +                   satp_mode_str(satp_mode_supported_max, rv32));
>> +        return;
>>      }
>>
>>      /*
>>       * Make sure the user did not ask for an invalid configuration as per
>>       * the specification.
>>       */
>> -    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
>> -
>>      if (!rv32) {
>> -        for (int i = satp_mode_max - 1; i >= 0; --i) {
>> +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
>>              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
>>                  (cpu->cfg.satp_mode.init & (1 << i)) &&
>> -                valid_vm[i]) {
>> +                (cpu->cfg.satp_mode.supported & (1 << i))) {
>>                  error_setg(errp, "cannot disable %s satp mode if %s "
>>                             "is enabled", satp_mode_str(i, false),
>> -                           satp_mode_str(satp_mode_max, false));
>> +                           satp_mode_str(satp_mode_map_max, false));
>>                  return;
>>              }
>>          }
>>      }
>>
>>      /* Finally expand the map so that all valid modes are set */
>> -    for (int i = satp_mode_max - 1; i >= 0; --i) {
>> -        if (valid_vm[i]) {
>> +    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
>> +        if (cpu->cfg.satp_mode.supported & (1 << i)) {
>>              cpu->cfg.satp_mode.map |= (1 << i);
>>          }
>>      }
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index e37177db5c..b591122099 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -416,13 +416,17 @@ struct RISCVCPUClass {
>>
>>  /*
>>   * map is a 16-bit bitmap: the most significant set bit in map is the maximum
>> - * satp mode that is supported.
>> + * satp mode that is supported. It may be chosen by the user and must respect
>> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
>> + * (supported bitmap below).
>>   *
>>   * init is a 16-bit bitmap used to make sure the user selected a correct
>>   * configuration as per the specification.
>> + *
>> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
>>   */
>>  typedef struct {
>> -    uint16_t map, init;
>> +    uint16_t map, init, supported;
>>  } RISCVSATPMap;
>>
>>  struct RISCVCPUConfig {
>> --
>> 2.37.2
>>
>>

