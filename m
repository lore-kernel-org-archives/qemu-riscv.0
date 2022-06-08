Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyjSz-0005Go-3m
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 20:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyjSx-0005FZ-H3; Tue, 07 Jun 2022 20:22:31 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyjSv-0000ho-Mg; Tue, 07 Jun 2022 20:22:31 -0400
Received: by mail-oi1-x22f.google.com with SMTP id s124so7965950oia.0;
 Tue, 07 Jun 2022 17:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8Hi6AfNh0Ek5WpkpKu6wxhjwh9zLpsCGWzb6Z9szEw=;
 b=XFRWXQm9uqJvDNJDDDbxEA3iON3o9q2qLItniJJlwHQ8Pr9365hxn7MQfdpGDeAKXv
 fV4phzuICB7muenxPkhMP9goSxF956iqE+qeImbx/u2Cjv7dWato0DnMDdsO86t0Te5S
 52t64y+Ys5eRxSu2qOAWjEnAxRHcZVTpgfrpmN4YjcfwYu3x/SkAKubCE3Nfawyq50hi
 C847C1ccfnpZi3puQ2tTCX9YJJUGBadKAATnBhDhyCOLY3RKc5f4G52u1DUxhrhQt3GU
 ckhzJa+HveqK7EfSKY6lkl97urNqqk/JeK1hj4Wn40ChQQI/aqi489F+ZhoX+3fYE0bO
 5XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8Hi6AfNh0Ek5WpkpKu6wxhjwh9zLpsCGWzb6Z9szEw=;
 b=UQCk6hyTeaKnJtiUgKqW/Ba/B7QqNhvyHYD5320dGKGP56s+ZNTK/MRcyrB1qpAzBH
 9eclRq3QLhV4sthF97ZKFafLSa+HGJ5Ako/ezAQToQY3vOMgoaMomvah1KOLQXXNGEkL
 Wyt3GVedhxx4dafd2Ov/t0hU8V/srUEr8E/aThkVzRFYEy4EFXxvSoEs//kzlOIUuarW
 y2htc+UqJF8UG48hB3DKAha2QYdrvQs1BUWauPZjRM6FQi8d6tL3tPKllVXRuDrceYvg
 tIlRI6509mOihuSqU9+WvHg5TWjImZACGfs/W53Qi7/9xVUB6Lv/tw/5+rLJdK2CVhCm
 sYXA==
X-Gm-Message-State: AOAM5328sknxeGRwLc5nSQvEPVOTCcq7WVzCleysYdUOmX5APkWy6mX8
 GXMC+pcIll13w948Vs2WB27TkrmlS6k2zsX4xvQ=
X-Google-Smtp-Source: ABdhPJyGOFTjDql0SsEo47hyyXgcfB2HZ2TQnkrLv8Zbw0g0DesN5YQHMVatnBEM/xglwtZCokXCGbNIPZXPeUBgmNg=
X-Received: by 2002:a54:4e8a:0:b0:32e:bdbb:c562 with SMTP id
 c10-20020a544e8a000000b0032ebdbbc562mr1024449oiy.64.1654647748196; Tue, 07
 Jun 2022 17:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUzB6QgVS74x2mkoYV3nbcy5aZcJkwJy5pXRxUrb4gBUg@mail.gmail.com>
In-Reply-To: <CAEUhbmUzB6QgVS74x2mkoYV3nbcy5aZcJkwJy5pXRxUrb4gBUg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jun 2022 10:22:02 +1000
Message-ID: <CAKmqyKO5CyQWx3VCQ4o9T+HCXKXi3Npef+pnoazFTsaXONHXXw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Don't expose the CPU properties on names
 CPUs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Wed, 08 Jun 2022 00:22:31 -0000

On Wed, Jun 8, 2022 at 9:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jun 1, 2022 at 9:37 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > There are currently two types of RISC-V CPUs:
> >  - Generic CPUs (base or any) that allow complete custimisation
> >  - "Named" CPUs that match existing hardware
> >
> > Users can use the base CPUs to custimise the extensions that they want, for
> > example -cpu rv64,v=true.
> >
> > We originally exposed these as part of the named CPUs as well, but that was
> > by accident.
> >
> > Exposing the CPU properties to named CPUs means that we accidently
> > enable extensinos that don't exist on the CPUs by default. For example
>
> typo: extensions
>
> > the SiFive E CPU currently support the zba extension, which is a bug.
> >
> > This patch instead only expose the CPU extensions to the generic CPUs.
>
> exposes
>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index a91253d4bd..c0c0f7e71f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -118,6 +118,8 @@ static const char * const riscv_intr_names[] = {
> >      "reserved"
> >  };
> >
> > +static void register_cpu_props(DeviceState *dev);
>
> nits: please move the whole static function implementation here to
> avoid the forward declaration

I did try that but the function relies on the `riscv_cpu_extensions`
array, which is defined later so unless we move the properties up to
the top of this file we need to have a declaration here. I think
keeping the properties where they are makes sense as that follows the
usual QEMU layout.

Alistair

>
> > +
> >  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
> >  {
> >      if (async) {
> > @@ -161,6 +163,7 @@ static void riscv_any_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> >  #endif
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    register_cpu_props(DEVICE(obj));
> >  }
> >
> >  #if defined(TARGET_RISCV64)
> > @@ -169,6 +172,7 @@ static void rv64_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV64, 0);
> > +    register_cpu_props(DEVICE(obj));
> >  }
> >
> >  static void rv64_sifive_u_cpu_init(Object *obj)
> > @@ -181,9 +185,11 @@ static void rv64_sifive_u_cpu_init(Object *obj)
> >  static void rv64_sifive_e_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> > +    cpu->cfg.mmu = false;
> >  }
> >
> >  static void rv128_base_cpu_init(Object *obj)
> > @@ -197,6 +203,7 @@ static void rv128_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV128, 0);
> > +    register_cpu_props(DEVICE(obj));
> >  }
> >  #else
> >  static void rv32_base_cpu_init(Object *obj)
> > @@ -204,6 +211,7 @@ static void rv32_base_cpu_init(Object *obj)
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV32, 0);
> > +    register_cpu_props(DEVICE(obj));
> >  }
> >
> >  static void rv32_sifive_u_cpu_init(Object *obj)
> > @@ -216,27 +224,33 @@ static void rv32_sifive_u_cpu_init(Object *obj)
> >  static void rv32_sifive_e_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> > +    cpu->cfg.mmu = false;
> >  }
> >
> >  static void rv32_ibex_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> > -    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
> > +    cpu->cfg.mmu = false;
> > +    cpu->cfg.epmp = true;
> >  }
> >
> >  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > -    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> > +    cpu->cfg.mmu = false;
> >  }
> >  #endif
> >
> > @@ -249,6 +263,7 @@ static void riscv_host_cpu_init(Object *obj)
> >  #elif defined(TARGET_RISCV64)
> >      set_misa(env, MXL_RV64, 0);
> >  #endif
> > +    register_cpu_props(DEVICE(obj));
> >  }
> >  #endif
> >
> > @@ -831,6 +846,12 @@ static void riscv_cpu_init(Object *obj)
> >  {
> >      RISCVCPU *cpu = RISCV_CPU(obj);
> >
> > +    cpu->cfg.ext_counters = true;
> > +    cpu->cfg.ext_ifencei = true;
> > +    cpu->cfg.ext_icsr = true;
> > +    cpu->cfg.mmu = true;
> > +    cpu->cfg.pmp = true;
> > +
> >      cpu_set_cpustate_pointers(cpu);
> >
> >  #ifndef CONFIG_USER_ONLY
> > @@ -839,7 +860,7 @@ static void riscv_cpu_init(Object *obj)
> >  #endif /* CONFIG_USER_ONLY */
> >  }
> >
> > -static Property riscv_cpu_properties[] = {
> > +static Property riscv_cpu_extensions[] = {
> >      /* Defaults for standard extensions */
> >      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> >      DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> > @@ -862,17 +883,12 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> >
> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >
> > -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> > -    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> > -    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> > -
> >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> > @@ -909,6 +925,25 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> >      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> >
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void register_cpu_props(DeviceState *dev)
> > +{
> > +    Property *prop;
> > +
> > +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> > +        qdev_property_add_static(dev, prop);
> > +    }
> > +}
> > +
> > +static Property riscv_cpu_properties[] = {
> > +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> > +
> > +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> > +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> > +    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
> > +
> >      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> >
> >      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
> > --
>
> Otherwise LGTM.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Regards,
> Bin

