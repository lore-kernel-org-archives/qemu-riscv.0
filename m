Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B708EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:59:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEnUq-0007Xk-T8; Thu, 29 Jun 2023 04:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnUp-0007XD-Jo
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 04:59:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnUm-0006EG-73
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 04:59:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-314172bac25so399339f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688029158; x=1690621158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GYNH7wVD1iufSkkb4dmjVCoFr+UFGYKz9CU923WLGVI=;
 b=GFhefHVFsJY1opTmPAcKNjUNjEKjBoOZHnVCfg49n8b4fLsRoGAoKf15Jwwjxv13EG
 /rPHKKqs9sBLbDvgeLsXSVIMU3Ah+ZXRXKZnUgXhtCCv0bLQqIKc65vRE3L5tb4Evse9
 t85Sv6XlrDs7r8On9/HAwM12LuCtEneGKIG/bP8SLT7vP5amPDDrxfv0kAPU/TSTaEp4
 SFBrWhU9lOivKY77DahAj1Y2ijixfIEtghjDwh9ojI3e4exIA1oUcSV4HRegGwEGrYJo
 nusOxfNV0daqUS6G/S0EdpuXwTFi7FSmDSQ/bmN+IwijaL9Wo4Q7TA79W1uoRKJf0xzm
 aK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688029158; x=1690621158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYNH7wVD1iufSkkb4dmjVCoFr+UFGYKz9CU923WLGVI=;
 b=RB7xvUNda2rIjj3mxuXwbuRO7q8EdKzuBRzI5wgr+pogPTM6YSa1Hr3ptq0VxN76XY
 BIOhlN+DL4CwqAJkWpBSaJnUfYnY7syIxj/dG9O+pZIZFUL0lLs4NzuPDBHobLlh5S4z
 rNNbPy9jPHB9ZJJW2QK/0b6xJsMUpP7pXHjvpQZZu5aBkm/Q9XEqZQbRFk49dTOPa4rU
 8GUzGanljZk+WBGNecKJbgNGN428rZg/LuCA0x2X3bumA2+feM9dAaHyxp+xkLWH0KIB
 QYchBUXjtuSX/vdJySL6g1tm7eKb7hT8YTF1Tjf6662Sb+nA61B022AILZLyOQJzsBs7
 cIuA==
X-Gm-Message-State: AC+VfDyw0SXM46QJbJ5Qu/eTGjfbH7jwOZDX/qpsMuKec3chgJp8Lkhd
 mFi9pA0RPV5fSHktZEvYWPbR+A==
X-Google-Smtp-Source: ACHHUZ7RAVYKXyWi8v9wiukXTl0S7qhPt0NAun7Joi0FP83DSK2vVfX/2VfFdK0JVVgQn567CACt/w==
X-Received: by 2002:a5d:6385:0:b0:314:12c:6f2d with SMTP id
 p5-20020a5d6385000000b00314012c6f2dmr5291903wru.51.1688029158288; 
 Thu, 29 Jun 2023 01:59:18 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b00307c8d6b4a0sm15283561wrm.26.2023.06.29.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:59:17 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:59:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Message-ID: <20230629-6a932f8d5f71fefc9afbd974@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628213033.170315-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x430.google.com
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

On Wed, Jun 28, 2023 at 06:30:24PM -0300, Daniel Henrique Barboza wrote:
> Next patch will add KVM specific user properties for both MISA and
> multi-letter extensions. For MISA extensions we want to make use of what
> is already available in misa_ext_cfgs[] to avoid code repetition.
> 
> misa_ext_info_arr[] array will hold name and description for each MISA
> extension that misa_ext_cfgs[] is declaring. We'll then use this new
> array in KVM code to avoid duplicating strings.
> 
> There's nothing holding us back from doing the same with multi-letter
> extensions. For now doing just with MISA extensions is enough.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
>  target/riscv/cpu.h |  7 +++-
>  2 files changed, 61 insertions(+), 29 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2485e820f8..90dd2078ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
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
> +#define MISA_EXT_INFO(_idx, _propname, _descr) \
> +    [(_idx - 'A')] = {.name = _propname, .description = _descr}

We don't have to give up on passing RV* to this macro. Directly
using __builtin_ctz() with a constant should work, i.e.

 #define MISA_EXT_INFO(_bit, _propname, _descr) \
     [__builtin_ctz(_bit)] = {.name = _propname, .description = _descr}

and then

 MISA_EXT_INFO(RVA, "a", "Atomic instructions"),
 MISA_EXT_INFO(RVD, "d", "Double-precision float point"),
 ...

(We don't need the ctz32() wrapper since we know we'll never input zero to
__builtin_ctz().)

> +
> +static const MISAExtInfo misa_ext_info_arr[] = {
> +    MISA_EXT_INFO('A', "a", "Atomic instructions"),
> +    MISA_EXT_INFO('C', "c", "Compressed instructions"),
> +    MISA_EXT_INFO('D', "d", "Double-precision float point"),
> +    MISA_EXT_INFO('F', "f", "Single-precision float point"),
> +    MISA_EXT_INFO('I', "i", "Base integer instruction set"),
> +    MISA_EXT_INFO('E', "e", "Base integer instruction set (embedded)"),
> +    MISA_EXT_INFO('M', "m", "Integer multiplication and division"),
> +    MISA_EXT_INFO('S', "s", "Supervisor-level instructions"),
> +    MISA_EXT_INFO('U', "u", "User-level instructions"),
> +    MISA_EXT_INFO('H', "h", "Hypervisor"),
> +    MISA_EXT_INFO('J', "x-j", "Dynamic translated languages"),
> +    MISA_EXT_INFO('V', "v", "Vector operations"),
> +    MISA_EXT_INFO('G', "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
> +};
> +
> +const char *riscv_get_misa_ext_name(uint32_t bit)
> +{
> +    return misa_ext_info_arr[ctz32(bit)].name;
> +}
> +
> +const char *riscv_get_misa_ext_descr(uint32_t bit)

nit: I'd prefer riscv_get_misa_ext_description() for the name.

> +{
> +    return misa_ext_info_arr[ctz32(bit)].description;
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
> @@ -1592,7 +1616,10 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      int i;
>  
>      for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +
> +        misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
> +        misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);

This might be necessary for the KVM side, but we should be able to avoid
this runtime setting here where the compiler can be certain everything is
a constant. We just need the old MISA_CFG() back, slightly tweaked to use
__builtin_ctz().

>  
>          object_property_add(cpu_obj, misa_cfg->name, "bool",
>                              cpu_get_misa_ext_cfg,
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cc20ee25a7..acae118b9b 100644
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
> +const char *riscv_get_misa_ext_descr(uint32_t bit);
>  
>  /* Privileged specification version */
>  enum {
> -- 
> 2.41.0
>

Thanks,
drew

