Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015F3CD98E4
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:22:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNvH-0005vj-Ru; Tue, 10 Oct 2023 21:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNvF-0005uf-5o; Tue, 10 Oct 2023 21:22:01 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNvD-0002he-8v; Tue, 10 Oct 2023 21:22:00 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-49d0a704ac7so2377882e0c.1; 
 Tue, 10 Oct 2023 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987317; x=1697592117; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwQ7vd9+XXopYpPlDfhKPjvUFTHPDW0a0KzSMnLfUfg=;
 b=MAk255nVCEWFxuTiLRO3gwQS9Ya3zHuMyPgicgQ16/JBU52aH8Q95/GWEY0eceTfO0
 rqH5MixaiPEUJMvOvMWpRIJSqGhafNt2GRi4EPIyOYCgxM/orlSXnXKMxvNvmKQUjWSV
 agODWqT0Ep55CdqPnII0lxfAnKdZ6YD2AWPzvZ1mglFLKpqAu/nsTrMv30v/7djI7v+o
 x7xCYSxg+mvF/1LIaTU7B/RAnuTMQKgFtJ3t0x55px/8p9wxaGzFvYGC+edooeexVNQB
 6QWU19d2l8CfMio0aG9vXAf/KROA+CXQ2eoL3g4arsewuICovdL4Z17hLB+/+33F7UtX
 i/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987317; x=1697592117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwQ7vd9+XXopYpPlDfhKPjvUFTHPDW0a0KzSMnLfUfg=;
 b=RyyGm0zZeXm375ZoZJQz/SSAVEfKfHEz01FwxeQk6v/JcETEumOY2pdNiPzvdiy55T
 FavvG6mUtqFeG4nKApx7OYjpniyxnFEw2JoOqiIhA7AejGU0ImM9sQ/b29X/ivfdzb4k
 0dn/85wxiAMIx3UwtF/VCHGwFOwja5jtyO4m8SvWnqIegcy6zILNCJbsPt2OC8qcSYa0
 U0vLaPbkpA9dq1RKezESyg8XjD4F7mvjKwrHBafAnWyRJRy6+SC/Nyxf0+MRnX0R/rh0
 H22p5pxZDkwMw7FC30uE/qHflGquBk9pAHZ93tMCidgpjUNb5nSTtpqVNCW3rKSlGk7i
 DMXg==
X-Gm-Message-State: AOJu0Yw1J684phfpFQ6fYO9mvDB6N3mG3uLENe4+Pnbu5RCSm6/zMl8q
 5WI4cIOrW87CmOKlPLI+AFXeiizKKqC4XUI//Hs=
X-Google-Smtp-Source: AGHT+IEqLB5ohj1Gbow96O1KhMoadtAtZoZqtXHtxXbEBWsODMsfDOsok6POO75osz8QhfrFOl7Woy+84ddLJYuKU18=
X-Received: by 2002:a1f:4a82:0:b0:493:5363:d1dc with SMTP id
 x124-20020a1f4a82000000b004935363d1dcmr15033604vka.12.1696987317070; Tue, 10
 Oct 2023 18:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231009112817.8896-1-dbarboza@ventanamicro.com>
 <20231009112817.8896-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231009112817.8896-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:21:30 +1000
Message-ID: <CAKmqyKNJNmDi2GsouHxpWi0b959zBGx4uH_5kRV8TVrvtrUVCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: deprecate capital 'Z' CPU properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 9, 2023 at 11:08=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment there are eleven CPU extension properties that starts
> with capital 'Z': Zifencei, Zicsr, Zihintntl, Zihintpause, Zawrs, Zfa,
> Zfh, Zfhmin, Zve32f, Zve64f and Zve64d. All other extensions are named
> with lower-case letters.
>
> We want all properties to be named with lower-case letters since it's
> consistent with the riscv-isa string that we create in the FDT. Having
> these 11 properties to be exceptions can be confusing.
>
> Deprecate all of them. Create their lower-case counterpart to be used as
> maintained CPU properties. When trying to use any deprecated property a
> warning message will be displayed, recommending users to switch to the
> lower-case variant:
>
> ./build/qemu-system-riscv64 -M virt -cpu rv64,Zifencei=3Dtrue --nographic
> qemu-system-riscv64: warning: CPU property 'Zifencei' is deprecated. Plea=
se use 'zifencei' instead
>
> This will give users some time to change their scripts before we remove
> the capital 'Z' properties entirely.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  docs/about/deprecated.rst  | 23 ++++++++++++++++++++++
>  target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++-----------
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++-
>  4 files changed, 82 insertions(+), 12 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 694b878f36..fda383b5a4 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -378,6 +378,29 @@ of generic CPUs: rv32 and rv64 as default CPUs and '=
max' as a feature complete
>  CPU for both 32 and 64 bit builds. Users are then discouraged to use the=
 'any'
>  CPU type starting in 8.2.
>
> +RISC-V CPU properties which start with capital 'Z' (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +All RISC-V CPU properties which start with capital 'Z' are being depreca=
ted
> +starting in 8.2. The reason is that they were wrongly added with capital=
 'Z'
> +in the past. CPU properties were later added with lower-case names, whic=
h
> +is the format we want to use from now on.
> +
> +Users which try to use these deprecated properties will receive a warnin=
g
> +recommending to switch to their stable counterparts:
> +
> +- "Zifencei" should be replaced with "zifencei"
> +- "Zicsr" should be replaced with "zicsr"
> +- "Zihintntl" should be replaced with "zihintntl"
> +- "Zihintpause" should be replaced with "zihintpause"
> +- "Zawrs" should be replaced with "zawrs"
> +- "Zfa" should be replaced with "zfa"
> +- "Zfh" should be replaced with "zfh"
> +- "Zfhmin" should be replaced with "zfhmin"
> +- "Zve32f" should be replaced with "zve32f"
> +- "Zve64f" should be replaced with "zve64f"
> +- "Zve64d" should be replaced with "zve64d"
> +
>  Block device options
>  ''''''''''''''''''''
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 521bb88538..1cdc3d2609 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1246,17 +1246,17 @@ const char *riscv_get_misa_ext_description(uint32=
_t bit)
>  const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> -    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> -    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> -    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
> -    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> -    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> -    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
> -    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
> -    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
> -    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
> -    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
> -    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
> +    MULTI_EXT_CFG_BOOL("zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> +    MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> +    MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> +    MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> +    MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
> +    MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
> +    MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>      MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>
>      MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> @@ -1349,6 +1349,23 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimenta=
l_exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/* Deprecated entries marked for future removal */
> +const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] =3D {
> +    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
> +    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> +    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
> +    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
> +    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
> +    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3f11e69223..e98f5de32e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -722,6 +722,7 @@ typedef struct RISCVCPUMultiExtConfig {
>  extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>  extern Property riscv_cpu_options[];
>
>  typedef struct isa_ext_data {
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08b806dc07..00676593f7 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -732,6 +732,25 @@ static void riscv_cpu_add_misa_properties(Object *cp=
u_obj)
>      }
>  }
>
> +static bool cpu_ext_is_deprecated(const char *ext_name)
> +{
> +    return isupper(ext_name[0]);
> +}
> +
> +/*
> + * String will be allocated in the heap. Caller is responsible
> + * for freeing it.
> + */
> +static char *cpu_ext_to_lower(const char *ext_name)
> +{
> +    char *ret =3D g_malloc0(strlen(ext_name) + 1);
> +
> +    strcpy(ret, ext_name);
> +    ret[0] =3D tolower(ret[0]);
> +
> +    return ret;
> +}
> +
>  static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
>                                    void *opaque, Error **errp)
>  {
> @@ -744,6 +763,13 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visit=
or *v, const char *name,
>          return;
>      }
>
> +    if (cpu_ext_is_deprecated(multi_ext_cfg->name)) {
> +        g_autofree char *lower =3D cpu_ext_to_lower(multi_ext_cfg->name)=
;
> +
> +        warn_report("CPU property '%s' is deprecated. Please use '%s' in=
stead",
> +                    multi_ext_cfg->name, lower);
> +    }
> +
>      g_hash_table_insert(multi_ext_user_opts,
>                          GUINT_TO_POINTER(multi_ext_cfg->offset),
>                          (gpointer)value);
> @@ -777,13 +803,14 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
>                                     const RISCVCPUMultiExtConfig *multi_c=
fg)
>  {
>      bool generic_cpu =3D riscv_cpu_is_generic(cpu_obj);
> +    bool deprecated_ext =3D cpu_ext_is_deprecated(multi_cfg->name);
>
>      object_property_add(cpu_obj, multi_cfg->name, "bool",
>                          cpu_get_multi_ext_cfg,
>                          cpu_set_multi_ext_cfg,
>                          NULL, (void *)multi_cfg);
>
> -    if (!generic_cpu) {
> +    if (!generic_cpu || deprecated_ext) {
>          return;
>      }
>
> @@ -826,6 +853,8 @@ static void riscv_cpu_add_user_properties(Object *obj=
)
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
>
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
> +
>      for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
>          qdev_property_add_static(DEVICE(obj), prop);
>      }
> --
> 2.41.0
>
>

