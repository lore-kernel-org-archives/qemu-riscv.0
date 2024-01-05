Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E1AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:56:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLbJe-0006eH-Ay; Thu, 04 Jan 2024 22:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbJd-0006dr-97; Thu, 04 Jan 2024 22:56:13 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbJb-0007kJ-En; Thu, 04 Jan 2024 22:56:13 -0500
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4b72e63821eso123109e0c.1; 
 Thu, 04 Jan 2024 19:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704426969; x=1705031769; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHNqs245rkQHvyPpRE3Vxul8wlKv7jFIAHpZAjdCgu0=;
 b=ExwzTeOKf6G2BLBfwimhWf8kj9xgQ94zPYosB7zLOjYcz9rUxucC2oSXI1lFy8azf2
 0ltSmna14akqKr5YUswm3luxVZbeGLD3u/TmvrnJgy2tAcAWtkFJljxkyiIA7+XZz1nA
 C2N17245lNFajVs9q2iG7n3pfAqqp1GehYWoGnJP7jukgqun0Ew6s+r5KlP2KZBN48Ay
 gI1WkVeSeyuULIAdRFKGdI9nqokPGNBOz6s4xh7el7W1nbbtsIkRSReUa+9/X2sGlSUl
 VR8yQp7Tudy+KI5D3ZoupnkCV04q+5VfJxD0K6jhM2+MMeEiKpLuLJYZGI162xWsrJyn
 uw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704426969; x=1705031769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHNqs245rkQHvyPpRE3Vxul8wlKv7jFIAHpZAjdCgu0=;
 b=g4vXaJLDYgNYZC/e0sunyFXUDZo5lm3N/uAXLHRLCWv2YJgiFyKcopRyjLLQf1vzqV
 ESlynsyuJAnxWbwcoZkPJEUpaFtICAhpUjR23HF/UU+njrm8QRywMqCbewaSSFDrSIdj
 QDln+C9ovFOqk+HPem+7DBVRANrdAlUZZDvlpGuqPl25TfEMH1NCrnRjHRwIc80N8eQ5
 sU0ndK86u9UOpUKFX+KKB2HquF8D5IFWx377jqKvRS3kT3KvfF/s3D/pFin0JGL0f+ck
 a04wz7ZXs5OYA6kDQtDfyBLeX8NCR/QU+dv252y0chhUWS20hIAE6A1a/Zdxx+Oj9Kxw
 tarw==
X-Gm-Message-State: AOJu0YwXZfzkhQqx4B3FDZjFFDtBZms2HytT3BQFlgqa0QUW90IdQkk9
 sA+xR2/EcTuRDxxg0R72M4PGMGBADjkeK6BacxQ=
X-Google-Smtp-Source: AGHT+IEZq1Pytpfcrj9LkzrQX/gLGQ1VvKRL5ZqyALhknz+CknBULVgvad9lbHos5TwsRh41C9m19bE5Fgq3D5oweqA=
X-Received: by 2002:ac5:c892:0:b0:4b6:e259:e10a with SMTP id
 n18-20020ac5c892000000b004b6e259e10amr986981vkl.5.1704426968877; Thu, 04 Jan
 2024 19:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-4-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 13:55:42 +1000
Message-ID: <CAKmqyKPzn6VJZ-47Zd5pfccU_YKT6uQ7EW0+UgG8MGBWdUdNvQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] target/riscv: move 'pmu-mask' and 'pmu-num' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jan 4, 2024 at 5:05=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Every property in riscv_cpu_options[] will be migrated to
> riscv_cpu_properties[]. This will make their default values init
> earlier, allowing cpu_init() functions to overwrite them. We'll also
> implement common getters and setters that both accelerators will use,
> allowing them to share validations that TCG is doing.
>
> At the same time, some options (namely 'vlen', 'elen' and the cache
> blocksizes) need a way of tracking if the user set a value for them.
> This is benign for TCG since the cost of always validating these values
> are small, but for KVM we need syscalls to read the host values to make
> the validations, thus knowing whether the user didn't touch the values
> makes a difference.
>
> We'll track user setting for these properties using a hash, like we do
> in the TCG driver. All riscv cpu options will update this hash in case
> the user sets it. The KVM driver will use this hash to minimize the
> amount of syscalls done.
>
> For now, both 'pmu-mask' and 'pmu-num' shouldn't be changed for vendor
> CPUs. The existing setter for 'pmu-num' is changed to add this
> restriction. New getters and setters are required for 'pmu-mask'
>
> While we're at it, add a 'static' modifier to 'prop_pmu_num' since we're
> not exporting it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 96 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 89 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 65cfa6c740..e90b70c0a7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -53,6 +53,15 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RV=
F, RVD, RVV,
>  #define BYTE(x)   (x)
>  #endif
>
> +/* Hash that stores general user set numeric options */
> +static GHashTable *general_user_opts;
> +
> +static void cpu_option_add_user_setting(const char *optname, uint32_t va=
lue)
> +{
> +    g_hash_table_insert(general_user_opts, (gpointer)optname,
> +                        GUINT_TO_POINTER(value));
> +}
> +
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>
> @@ -1218,11 +1227,15 @@ static void riscv_cpu_post_init(Object *obj)
>
>  static void riscv_cpu_init(Object *obj)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
>  #ifndef CONFIG_USER_ONLY
>      qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
>
> +    general_user_opts =3D g_hash_table_new(g_str_hash, g_str_equal);
> +
>      /*
>       * The timer and performance counters extensions were supported
>       * in QEMU before they were added as discrete extensions in the
> @@ -1232,6 +1245,9 @@ static void riscv_cpu_init(Object *obj)
>       */
>      RISCV_CPU(obj)->cfg.ext_zicntr =3D true;
>      RISCV_CPU(obj)->cfg.ext_zihpm =3D true;
> +
> +    /* Default values for non-bool cpu properties */
> +    cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
>  }
>
>  typedef struct misa_ext_info {
> @@ -1431,26 +1447,51 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated=
_exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static bool riscv_cpu_is_vendor(Object *obj)
> +{
> +    return !riscv_cpu_is_generic(obj);
> +}
> +
> +static void cpu_set_prop_err(RISCVCPU *cpu, const char *propname,
> +                             Error **errp)
> +{
> +    g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
> +    error_setg(errp, "CPU '%s' does not allow changing the value of '%s'=
",
> +               cpuname, propname);
> +}
> +
>  static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
>                               void *opaque, Error **errp)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint8_t pmu_num;
> +    uint8_t pmu_num, curr_pmu_num;
> +    uint32_t pmu_mask;
>
>      visit_type_uint8(v, name, &pmu_num, errp);
>
> +    curr_pmu_num =3D ctpop32(cpu->cfg.pmu_mask);
> +
> +    if (pmu_num !=3D curr_pmu_num && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, curr_pmu_num);
> +        return;
> +    }
> +
>      if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
>          error_setg(errp, "Number of counters exceeds maximum available")=
;
>          return;
>      }
>
>      if (pmu_num =3D=3D 0) {
> -        cpu->cfg.pmu_mask =3D 0;
> +        pmu_mask =3D 0;
>      } else {
> -        cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, pmu_num);
> +        pmu_mask =3D MAKE_64BIT_MASK(3, pmu_num);
>      }
>
>      warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
> +    cpu->cfg.pmu_mask =3D pmu_mask;
> +    cpu_option_add_user_setting("pmu-mask", pmu_mask);
>  }
>
>  static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
> @@ -1462,16 +1503,54 @@ static void prop_pmu_num_get(Object *obj, Visitor=
 *v, const char *name,
>      visit_type_uint8(v, name, &pmu_num, errp);
>  }
>
> -const PropertyInfo prop_pmu_num =3D {
> +static const PropertyInfo prop_pmu_num =3D {
>      .name =3D "pmu-num",
>      .get =3D prop_pmu_num_get,
>      .set =3D prop_pmu_num_set,
>  };
>
> -Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MA=
SK(3, 16)),
> -    {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
> +static void prop_pmu_mask_set(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint32_t value;
> +    uint8_t pmu_num;
> +
> +    visit_type_uint32(v, name, &value, errp);
> +
> +    if (value !=3D cpu->cfg.pmu_mask && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %x\n",
> +                          name, cpu->cfg.pmu_mask);
> +        return;
> +    }
> +
> +    pmu_num =3D ctpop32(value);
> +
> +    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +        error_setg(errp, "Number of counters exceeds maximum available")=
;
> +        return;
> +    }
>
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.pmu_mask =3D value;
> +}
> +
> +static void prop_pmu_mask_get(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    uint8_t pmu_mask =3D RISCV_CPU(obj)->cfg.pmu_mask;
> +
> +    visit_type_uint8(v, name, &pmu_mask, errp);
> +}
> +
> +static const PropertyInfo prop_pmu_mask =3D {
> +    .name =3D "pmu-mask",
> +    .get =3D prop_pmu_mask_get,
> +    .set =3D prop_pmu_mask_set,
> +};
> +
> +Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>
> @@ -1490,6 +1569,9 @@ Property riscv_cpu_options[] =3D {
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> +    {.name =3D "pmu-mask", .info =3D &prop_pmu_mask},
> +    {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> --
> 2.43.0
>
>

