Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzAuf-0006Bi-T3
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 01:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nzAua-0006AJ-BT; Thu, 09 Jun 2022 01:40:56 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nzAuX-0007su-4u; Thu, 09 Jun 2022 01:40:50 -0400
Received: by mail-oi1-x232.google.com with SMTP id p129so26025147oig.3;
 Wed, 08 Jun 2022 22:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ciw+2UagJ9Uxi4VbXvtbayrC6LMS7R3Qxc+x6ioJ7mk=;
 b=Ka6h5S7esSU5c1DFDMdzNivDv9spv8B/foz3vSveTD/W1GzmuPFmzswNhzJcmGrymj
 h2Tis7AJcClC5eBnIRsV+BF9BpMlWy1gZUTKw4aQvZQGzmalPKLh0KQRBn/Zan560vR2
 otxxFhlRsUXLUCEjXTO22wwW4o0GvRIujpXLgwtWgtD+PqnGCN8DpHS1XOs59QDPp6UK
 zu/Gv6NndOYsq9Tkt5aPwmHisOdikl+1Vg8RBl8z/VQxqIhJl0I2IV5RBcQjI1D0WNcq
 BAYeLywh+vvbuYSxtSbHgYjy4w7FsiwcU5wM3m+fRcfCpzSBrw+pddpkNMUTiiVGz2T/
 dQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ciw+2UagJ9Uxi4VbXvtbayrC6LMS7R3Qxc+x6ioJ7mk=;
 b=qgPJzFkqtcZzWUnLGKgIE01jQPBJJl+vLlCkWYYC0fYKLcyhG6rhemic32yySvz1gq
 LXysE/BgEj//CumSs0zSpAGYpVDg4yMwSwhxpv3SBfyLxJ81Z7jcAsJWoCmjkFnUn5Rx
 H8KAyqM9l1J+LDzVZjvKnpaW1A6hAvnb99FHJTYfn/SbonYVBCgbHAaeP6M3soQ43VR+
 UYK8SLItyrrj0+a7JJFQIu2rpR5O7rD6V73am7ebDsxg+Tf9yM+1YASmBnoq9lxl0mSR
 asL9Zg6lGNtxF7fZ3SWMcPADIqhdhZp3orwcX7WpdzO/KWa8ArMp6KHgXbiFJNe7oUhm
 GFBg==
X-Gm-Message-State: AOAM532abgBLjBuYsCs9pdw1gBdQLNXD7hoVF7q2TwyvkYIIqFS4Y9bA
 8aCo9LE3bZV/L7sEYcceOqrOFbRN/umTPvtw2Zo=
X-Google-Smtp-Source: ABdhPJzb35Q5f/o/Yny3QswvlbmfLo8ocuhzDJPoeSFOA2v7Udbd5ShRRiPl9Wt7Pj5YBFQakieorIUWEhI5CXRN0u0=
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr760110oiw.278.1654753247328; Wed, 08
 Jun 2022 22:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220608061437.314434-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608061437.314434-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jun 2022 15:40:20 +1000
Message-ID: <CAKmqyKOGEfWNp-taSU9CKjmrpaL1Qgv4Q_Nr_J25E2mAseBBGg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Don't expose the CPU properties on names
 CPUs
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 05:40:57 -0000

On Wed, Jun 8, 2022 at 4:14 PM Alistair Francis
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
> enable extensions that don't exist on the CPUs by default. For example
> the SiFive E CPU currently support the zba extension, which is a bug.
>
> This patch instead only exposes the CPU extensions to the generic CPUs.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> 2.36.1
>

