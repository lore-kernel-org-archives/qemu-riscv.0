Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0899EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 11:27:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFCHO-0006b4-18; Fri, 30 Jun 2023 07:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qFCHN-0006ag-7g
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 07:27:09 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qFCHJ-0004fC-JM
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 07:27:09 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b5c231f842so27051631fa.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688124423; x=1690716423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OjV2KRDZq+L8wEgocTAkFF8mjU9Gemc5M7VCOFlYJHs=;
 b=O+nsk74DoUy6WS8cL6dwOLR+2+1HDdMDKZQpfRf0x3KXFezvHyoe6KiQ2+NlVD5FCn
 r126iAWwBEivywQvV+GLuEJb5Kh1w/dLgYdbFlToGCbdTHn/Z/IODUz+dBYqlacevOLq
 eK0Z+CTe6nkvBO1pepjrV6awPEJ2/2wYC4EQPdWGUcxzqYazDmoAlfFvUYZulQKg/7iJ
 JhQs/XMGsJfEhV2XaKuVZxgAADTg4gGvinqE9rT21IBCYvPyMQygdEB9xZ/Xp5914+I2
 VmuhR/wPHNW0kN5CWRcUOo8xch9txT+jvaQge4c0Xh91W4UJ4t+TgeLl4/hqzIVYzhm6
 UVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688124423; x=1690716423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjV2KRDZq+L8wEgocTAkFF8mjU9Gemc5M7VCOFlYJHs=;
 b=UbdjZ00K1BEnxaaoHmk/T4zWvfhCLPv8uFuCgJgBtMhuLbGgadrwkGnR0OVxQrvqrE
 KEOIzG2VRc+wbriEDVv0FgIfY5rI4Dt7NZZxlV0CIe/NuOLUygYNDPqCrGlUCjuMaKph
 fK3K+/YDGBrU8Hqker+GDqaLaosUdZqHKh348Bv3pKOOAo2wN9Nj8c39jowpXUQu3Kwy
 QKew3oaFUHCQ5LLsITDiKr+aDpKBlkwVHZ0Ue05y1y1SOpTR5x8oNrF+g5LOHAfyetrU
 QKB2RpeYlb0VCqPAozfj19dM/iiGxaVxc2TL3fzx97E3hPwLtCdTbiWqBbLV5yv0xvex
 ivAg==
X-Gm-Message-State: ABy/qLaTOzFuajX01rv/HabaZv4kW3Bk8tvdePeTYdhGYXg77lib36GS
 031Bpoi3/CeA7jbfK9O2qI2ZBQ==
X-Google-Smtp-Source: APBJJlFr+UDNgOkRM4YqsViFGyFmvgH2JBlcs2DSCsWaomAub8WGwdcC7didac2VOkFhYnwTvh/JDw==
X-Received: by 2002:a2e:b012:0:b0:2a8:a9f7:205b with SMTP id
 y18-20020a2eb012000000b002a8a9f7205bmr1948807ljk.36.1688124422945; 
 Fri, 30 Jun 2023 04:27:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170906c30a00b009930042510csm89539ejz.222.2023.06.30.04.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 04:27:02 -0700 (PDT)
Date: Fri, 30 Jun 2023 13:27:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v7 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Message-ID: <20230630-921184e4ddf3d3e7e5797ecd@orel>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
 <20230630100811.287315-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630100811.287315-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 30, 2023 at 07:08:02AM -0300, Daniel Henrique Barboza wrote:
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
>     {.name = misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
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
> ---
>  target/riscv/cpu.c | 110 +++++++++++++++++++++++++++++++++------------
>  target/riscv/cpu.h |   7 ++-
>  2 files changed, 88 insertions(+), 29 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 58439a05d1..c1693d5e9c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1558,33 +1558,83 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>  
> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
> -    {.name = "a", .description = "Atomic instructions",
> -     .misa_bit = RVA, .enabled = true},
> -    {.name = "c", .description = "Compressed instructions",
> -     .misa_bit = RVC, .enabled = true},
> -    {.name = "d", .description = "Double-precision float point",
> -     .misa_bit = RVD, .enabled = true},
> -    {.name = "f", .description = "Single-precision float point",
> -     .misa_bit = RVF, .enabled = true},
> -    {.name = "i", .description = "Base integer instruction set",
> -     .misa_bit = RVI, .enabled = true},
> -    {.name = "e", .description = "Base integer instruction set (embedded)",
> -     .misa_bit = RVE, .enabled = false},
> -    {.name = "m", .description = "Integer multiplication and division",
> -     .misa_bit = RVM, .enabled = true},
> -    {.name = "s", .description = "Supervisor-level instructions",
> -     .misa_bit = RVS, .enabled = true},
> -    {.name = "u", .description = "User-level instructions",
> -     .misa_bit = RVU, .enabled = true},
> -    {.name = "h", .description = "Hypervisor",
> -     .misa_bit = RVH, .enabled = true},
> -    {.name = "x-j", .description = "Dynamic translated languages",
> -     .misa_bit = RVJ, .enabled = false},
> -    {.name = "v", .description = "Vector operations",
> -     .misa_bit = RVV, .enabled = false},
> -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
> -     .misa_bit = RVG, .enabled = false},
> +typedef struct misa_ext_info {
> +    const char *name;
> +    const char *description;
> +} MISAExtInfo;
> +
> +#define MISA_INFO_IDX(_bit) \
> +    __builtin_ctz(_bit)
> +
> +#define MISA_EXT_INFO(_bit, _propname, _descr) \
> +    [MISA_INFO_IDX(_bit)] = {.name = _propname, .description = _descr}
> +
> +static const MISAExtInfo misa_ext_info_arr[] = {
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
> +    g_assert(bit != 0);
> +    idx = MISA_INFO_IDX(bit);
> +
> +    g_assert(idx < ARRAY_SIZE(misa_ext_info_arr));
> +    return idx;
> +}
> +
> +const char *riscv_get_misa_ext_name(uint32_t bit)
> +{
> +    int idx = riscv_validate_misa_info_idx(bit);
> +    const char *val = misa_ext_info_arr[idx].name;
> +
> +    g_assert(val != NULL);
> +    return val;
> +}
> +
> +const char *riscv_get_misa_ext_description(uint32_t bit)
> +{
> +    int idx = riscv_validate_misa_info_idx(bit);
> +    const char *val = misa_ext_info_arr[idx].description;
> +
> +    g_assert(val != NULL);
> +    return val;
> +}
> +
> +#define MISA_CFG(_bit, _enabled) \
> +    {.misa_bit = _bit, .enabled = _enabled}
> +
> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
> @@ -1592,7 +1642,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        int bit = misa_cfg->misa_bit;
> +
> +        misa_cfg->name = riscv_get_misa_ext_name(bit);
> +        misa_cfg->description = riscv_get_misa_ext_description(bit);
>  
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
>                              cpu_get_misa_ext_cfg,
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cc20ee25a7..9830ec5f75 100644
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

