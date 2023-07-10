Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB79EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfn2-0000B0-Tk; Sun, 09 Jul 2023 21:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfn1-0000Af-7j; Sun, 09 Jul 2023 21:34:11 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfmz-000209-GC; Sun, 09 Jul 2023 21:34:11 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7672073e7b9so282510185a.0; 
 Sun, 09 Jul 2023 18:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688952848; x=1691544848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KG+yoh1iL6bBWzlNe1RxqJfKCuQexuk7TiMl9JpAoS8=;
 b=Q0JBLmGzfRZkE/8aTpRm4pfol1LgKvU8kqDcdOEC2Z6NK8SIjY3wTnjV57/pMX746l
 gUg+KFnUC1vwJboZerx+DzfLbRikT/vhnvXRTpDfvy8Wt/NVOPAkHN+zXMnwDAwBkf/T
 I+hTqfI64PDW3rnMz9TRiS4S9Y68UnRBrMttJBtnU1mmOmjlIpYPi/8shp4qvbtUavnP
 zHIVIXZDkOK6dYd++OVG+p3Mx56qLP2ouktf5VNHPhqKut3Dmi4+wBmbk0q0VpRLMEUz
 w/2jG+luDGJ++Q1iGztfAHSRewZ7x0OCLku80zhCPvgtivdJfj9G9+2MIjfN515S4PWF
 +zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688952848; x=1691544848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KG+yoh1iL6bBWzlNe1RxqJfKCuQexuk7TiMl9JpAoS8=;
 b=jOurWM9S3AzVRiwLhl/DirG7fb8MNZTAypLE17vAMYxOTlmOueS8t8n/owsPLe9iJA
 h1y5blnZE0/5oiRnvR9hNcx9n9+GUlwNz2v5uQcxKMt3EukXVRVy2Qeid1w4l2HBe75S
 XVYvrJiUBkhrxhRtyWv/16rnSm++zUD0WJ32unkzLemb+8CQMFyMoUrvAB9mane1IHub
 IdU1aJpMgPhi4ilhYarrUSj8oIKaAd0fVo3QeIuDcLcmsQN1FPQ0yzwyPiBqnqSG73yE
 fUIhwDpVBVZYYriwUAi/RoRirTMQeYucHqIzI3uB0Qeak/jbUL/WkrcnjSFF2cjwr18Q
 wndw==
X-Gm-Message-State: ABy/qLbFtBlWjsE5OJJAmf1MYVgNCeGAHdXT7G23SIKKoFIc9DLDvdGM
 aoo86GY5a+cA6+vttPr2ZzL6D9h8yUDQVzqWwbY=
X-Google-Smtp-Source: APBJJlHaG7NbcJildaRjDUfqS7sK4UTk2mrp4eZrBLSOGHJjnJT9olwtZVU2qiY0WkNT+kUm9VHFWic2ZbcicMFbHG8=
X-Received: by 2002:a05:620a:2401:b0:767:3cfc:32aa with SMTP id
 d1-20020a05620a240100b007673cfc32aamr12469495qkn.21.1688952848144; Sun, 09
 Jul 2023 18:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:33:42 +1000
Message-ID: <CAKmqyKP=Gvr+k8cFuECoLcGsjxkZhbq9Pkb8Ox+hWS1UKhQaeA@mail.gmail.com>
Subject: Re: [PATCH v9 11/20] target/riscv/cpu: add misa_ext_info_arr[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72c.google.com
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

On Thu, Jul 6, 2023 at 8:18=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Next patch will add KVM specific user properties for both MISA and
> multi-letter extensions. For MISA extensions we want to make use of what
> is already available in misa_ext_cfgs[] to avoid code repetition.
>
> misa_ext_info_arr[] array will hold name and description for each MISA
> extension that misa_ext_cfgs[] is declaring. We'll then use this new
> array in KVM code to avoid duplicating strings. Two getters were added
> to allow KVM to retrieve the 'name' and 'description' for each MISA
> property.
>
> There's nothing holding us back from doing the same with multi-letter
> extensions. For now doing just with MISA extensions is enough.
>
> It is worth documenting that even using the __bultin_ctz() directive to
> populate the misa_ext_info_arr[] we are forced to assign 'name' and
> 'description' during runtime in riscv_cpu_add_misa_properties(). The
> reason is that some Gitlab runners ('clang-user' and 'tsan-build') will
> throw errors like this if we fetch 'name' and 'description' from the
> array in the MISA_CFG() macro:
>
> ../target/riscv/cpu.c:1624:5: error: initializer element is not a
>                               compile-time constant
>     MISA_CFG(RVA, true),
>     ^~~~~~~~~~~~~~~~~~~
> ../target/riscv/cpu.c:1619:53: note: expanded from macro 'MISA_CFG'
>     {.name =3D misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>
> gcc and others compilers/builders were fine with that change. We can't
> ignore failures in the Gitlab pipeline though, so code was changed to
> make every runner happy.
>
> As a side effect, misa_ext_cfg[] is no longer a 'const' array because
> it must be set during runtime.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 110 +++++++++++++++++++++++++++++++++------------
>  target/riscv/cpu.h |   7 ++-
>  2 files changed, 88 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0e1265bb17..35ba220c8f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1636,33 +1636,83 @@ static void cpu_get_misa_ext_cfg(Object *obj, Vis=
itor *v, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>
> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> -    {.name =3D "a", .description =3D "Atomic instructions",
> -     .misa_bit =3D RVA, .enabled =3D true},
> -    {.name =3D "c", .description =3D "Compressed instructions",
> -     .misa_bit =3D RVC, .enabled =3D true},
> -    {.name =3D "d", .description =3D "Double-precision float point",
> -     .misa_bit =3D RVD, .enabled =3D true},
> -    {.name =3D "f", .description =3D "Single-precision float point",
> -     .misa_bit =3D RVF, .enabled =3D true},
> -    {.name =3D "i", .description =3D "Base integer instruction set",
> -     .misa_bit =3D RVI, .enabled =3D true},
> -    {.name =3D "e", .description =3D "Base integer instruction set (embe=
dded)",
> -     .misa_bit =3D RVE, .enabled =3D false},
> -    {.name =3D "m", .description =3D "Integer multiplication and divisio=
n",
> -     .misa_bit =3D RVM, .enabled =3D true},
> -    {.name =3D "s", .description =3D "Supervisor-level instructions",
> -     .misa_bit =3D RVS, .enabled =3D true},
> -    {.name =3D "u", .description =3D "User-level instructions",
> -     .misa_bit =3D RVU, .enabled =3D true},
> -    {.name =3D "h", .description =3D "Hypervisor",
> -     .misa_bit =3D RVH, .enabled =3D true},
> -    {.name =3D "x-j", .description =3D "Dynamic translated languages",
> -     .misa_bit =3D RVJ, .enabled =3D false},
> -    {.name =3D "v", .description =3D "Vector operations",
> -     .misa_bit =3D RVV, .enabled =3D false},
> -    {.name =3D "g", .description =3D "General purpose (IMAFD_Zicsr_Zifen=
cei)",
> -     .misa_bit =3D RVG, .enabled =3D false},
> +typedef struct misa_ext_info {
> +    const char *name;
> +    const char *description;
> +} MISAExtInfo;
> +
> +#define MISA_INFO_IDX(_bit) \
> +    __builtin_ctz(_bit)
> +
> +#define MISA_EXT_INFO(_bit, _propname, _descr) \
> +    [MISA_INFO_IDX(_bit)] =3D {.name =3D _propname, .description =3D _de=
scr}
> +
> +static const MISAExtInfo misa_ext_info_arr[] =3D {
> +    MISA_EXT_INFO(RVA, "a", "Atomic instructions"),
> +    MISA_EXT_INFO(RVC, "c", "Compressed instructions"),
> +    MISA_EXT_INFO(RVD, "d", "Double-precision float point"),
> +    MISA_EXT_INFO(RVF, "f", "Single-precision float point"),
> +    MISA_EXT_INFO(RVI, "i", "Base integer instruction set"),
> +    MISA_EXT_INFO(RVE, "e", "Base integer instruction set (embedded)"),
> +    MISA_EXT_INFO(RVM, "m", "Integer multiplication and division"),
> +    MISA_EXT_INFO(RVS, "s", "Supervisor-level instructions"),
> +    MISA_EXT_INFO(RVU, "u", "User-level instructions"),
> +    MISA_EXT_INFO(RVH, "h", "Hypervisor"),
> +    MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
> +    MISA_EXT_INFO(RVV, "v", "Vector operations"),
> +    MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
> +};
> +
> +static int riscv_validate_misa_info_idx(uint32_t bit)
> +{
> +    int idx;
> +
> +    /*
> +     * Our lowest valid input (RVA) is 1 and
> +     * __builtin_ctz() is UB with zero.
> +     */
> +    g_assert(bit !=3D 0);
> +    idx =3D MISA_INFO_IDX(bit);
> +
> +    g_assert(idx < ARRAY_SIZE(misa_ext_info_arr));
> +    return idx;
> +}
> +
> +const char *riscv_get_misa_ext_name(uint32_t bit)
> +{
> +    int idx =3D riscv_validate_misa_info_idx(bit);
> +    const char *val =3D misa_ext_info_arr[idx].name;
> +
> +    g_assert(val !=3D NULL);
> +    return val;
> +}
> +
> +const char *riscv_get_misa_ext_description(uint32_t bit)
> +{
> +    int idx =3D riscv_validate_misa_info_idx(bit);
> +    const char *val =3D misa_ext_info_arr[idx].description;
> +
> +    g_assert(val !=3D NULL);
> +    return val;
> +}
> +
> +#define MISA_CFG(_bit, _enabled) \
> +    {.misa_bit =3D _bit, .enabled =3D _enabled}
> +
> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> +    MISA_CFG(RVA, true),
> +    MISA_CFG(RVC, true),
> +    MISA_CFG(RVD, true),
> +    MISA_CFG(RVF, true),
> +    MISA_CFG(RVI, true),
> +    MISA_CFG(RVE, false),
> +    MISA_CFG(RVM, true),
> +    MISA_CFG(RVS, true),
> +    MISA_CFG(RVU, true),
> +    MISA_CFG(RVH, true),
> +    MISA_CFG(RVJ, false),
> +    MISA_CFG(RVV, false),
> +    MISA_CFG(RVG, false),
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1670,7 +1720,11 @@ static void riscv_cpu_add_misa_properties(Object *=
cpu_obj)
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        const RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> +        RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> +        int bit =3D misa_cfg->misa_bit;
> +
> +        misa_cfg->name =3D riscv_get_misa_ext_name(bit);
> +        misa_cfg->description =3D riscv_get_misa_ext_description(bit);
>
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
>                              cpu_get_misa_ext_cfg,
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3081603464..6ea22e0eea 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -41,7 +41,10 @@
>
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>
> -/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
> +/*
> + * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
> + * when adding new MISA bits here.
> + */
>  #define RVI RV('I')
>  #define RVE RV('E') /* E and I are mutually exclusive */
>  #define RVM RV('M')
> @@ -56,6 +59,8 @@
>  #define RVJ RV('J')
>  #define RVG RV('G')
>
> +const char *riscv_get_misa_ext_name(uint32_t bit);
> +const char *riscv_get_misa_ext_description(uint32_t bit);
>
>  /* Privileged specification version */
>  enum {
> --
> 2.41.0
>
>

