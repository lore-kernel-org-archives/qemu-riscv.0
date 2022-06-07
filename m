Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyibY-0006ci-Ld
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 19:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nyibW-0006Yn-RK; Tue, 07 Jun 2022 19:27:19 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:43466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nyibU-0000KM-Sh; Tue, 07 Jun 2022 19:27:18 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ec42eae76bso192185887b3.10; 
 Tue, 07 Jun 2022 16:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJYu9GuFhnjDtK6NRfjlHjCBkt9mV8RlRQkSc4fmioE=;
 b=hVHaL+OvT6JdThJ0C61zEHEzUaF+wkPt5C+S5Y2qhoQ+VF0bHKHYdt5hmi3JeLmE8k
 IEtcZPR0605Nt0DavRNAi6P58t4ndCeq3IBpPPAFyLWQfXGOHjYFozOy4iYMfcACzzOg
 ALn0EjGrpMaawTbQYaXY7DyQKi9j1jWqL1mmGt6lJYS5pvyLgXiggWbvQZx4pDPzMrRg
 +XxhyR6r2AgU7bOselBhlaw+iYBxWEvW+hYEeUeTwt/4xEcFOr/qDaqRQEuctNkj8VJD
 QQQK0VqJrVIe5A3AQwe5fGGPzUVS2vw9O5NSqou036UagLc0kV4XMrXdn0M1kTnboBDI
 ezTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJYu9GuFhnjDtK6NRfjlHjCBkt9mV8RlRQkSc4fmioE=;
 b=H2dSOqogvLRCnshm02Ja4wbdhN66hgiumk0PnEkOuZcnyEBOx82WJAYpiJIB99qyeg
 E9wVvJ80nCcaUGd/+9V/PgQ5uAkjJXieVrvT/au6Iay0N9r609Qg/IjpGp9+N68Ha7Tt
 +YUIwoCIJ+vaprRSwm8di4yXBo4gsenbSYFdadfgNflz0ovYannpaj2n+A9EEEH1VgEz
 K86to4SdzF1uj/3FJFlaEDbd/jPcPyzYxe9m06E5Sxjnt3PKq6GN/RN8SvbMLDaFtdVI
 Pm5E96Ire5lA/TZQdMmfT3ZglXKgSsdGXgNCRN44NXeleKtXNP9JM11liZawTx/+8S5m
 9UlA==
X-Gm-Message-State: AOAM531m7MrGvLlMH8rI58BIduWRzvG1Gtfc1OezVcLhvldEj3r1RV5H
 E/GvtIha+UsWn1+WNPXFw7Drrj7Zxt29krBXPFY=
X-Google-Smtp-Source: ABdhPJx+szW0yoCZYTx7WiWNXB46Q7m/BeaUHWOvrjBB2nEXOti2tkiBRPoDyBqxefYXtLa2joopCcWqA+ue4aaNOhU=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr34884913ywb.153.1654644435041; Tue, 07
 Jun 2022 16:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jun 2022 07:27:05 +0800
Message-ID: <CAEUhbmUzB6QgVS74x2mkoYV3nbcy5aZcJkwJy5pXRxUrb4gBUg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Don't expose the CPU properties on names
 CPUs
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Jun 2022 23:27:19 -0000

On Wed, Jun 1, 2022 at 9:37 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> There are currently two types of RISC-V CPUs:
>  - Generic CPUs (base or any) that allow complete custimisation
>  - "Named" CPUs that match existing hardware
>
> Users can use the base CPUs to custimise the extensions that they want, for
> example -cpu rv64,v=true.
>
> We originally exposed these as part of the named CPUs as well, but that was
> by accident.
>
> Exposing the CPU properties to named CPUs means that we accidently
> enable extensinos that don't exist on the CPUs by default. For example

typo: extensions

> the SiFive E CPU currently support the zba extension, which is a bug.
>
> This patch instead only expose the CPU extensions to the generic CPUs.

exposes

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 46 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..c0c0f7e71f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -118,6 +118,8 @@ static const char * const riscv_intr_names[] = {
>      "reserved"
>  };
>
> +static void register_cpu_props(DeviceState *dev);

nits: please move the whole static function implementation here to
avoid the forward declaration

> +
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
>      if (async) {
> @@ -161,6 +163,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> +    register_cpu_props(DEVICE(obj));
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -169,6 +172,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> +    register_cpu_props(DEVICE(obj));
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -181,9 +185,11 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  static void rv64_sifive_e_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    cpu->cfg.mmu = false;
>  }
>
>  static void rv128_base_cpu_init(Object *obj)
> @@ -197,6 +203,7 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> +    register_cpu_props(DEVICE(obj));
>  }
>  #else
>  static void rv32_base_cpu_init(Object *obj)
> @@ -204,6 +211,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> +    register_cpu_props(DEVICE(obj));
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -216,27 +224,33 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  static void rv32_sifive_e_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    cpu->cfg.mmu = false;
>  }
>
>  static void rv32_ibex_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> -    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
> +    cpu->cfg.mmu = false;
> +    cpu->cfg.epmp = true;
>  }
>
>  static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      set_resetvec(env, DEFAULT_RSTVEC);
> -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    cpu->cfg.mmu = false;
>  }
>  #endif
>
> @@ -249,6 +263,7 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> +    register_cpu_props(DEVICE(obj));
>  }
>  #endif
>
> @@ -831,6 +846,12 @@ static void riscv_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(obj);
>
> +    cpu->cfg.ext_counters = true;
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
> +
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> @@ -839,7 +860,7 @@ static void riscv_cpu_init(Object *obj)
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> -static Property riscv_cpu_properties[] = {
> +static Property riscv_cpu_extensions[] = {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> @@ -862,17 +883,12 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> -    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> -    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> -
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> @@ -909,6 +925,25 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void register_cpu_props(DeviceState *dev)
> +{
> +    Property *prop;
> +
> +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        qdev_property_add_static(dev, prop);
> +    }
> +}
> +
> +static Property riscv_cpu_properties[] = {
> +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> +
> +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> +    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> +
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
> --

Otherwise LGTM.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

