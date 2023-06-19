Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D6EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:06:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBApY-0007mq-Ao; Mon, 19 Jun 2023 05:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBApV-0007mJ-7D
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:05:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBApS-00075p-7B
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:05:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30af56f5f52so2293985f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687165540; x=1689757540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zdNXyi0xZLAfWyndPmyW6cG6B2SU0eI8m2DtLuHRuyM=;
 b=gI/9oJogWPYhRsoZhXCexUlqRIpveay1NkPFDIoPN0uV116sVcFmrSXePVGnSn8rZZ
 MoCQ/LOeyegGA0Ee1W57ePGE3VkOzBQQUSKlrP2vg8HUC637XwbgHBXO3sJggWWdAU31
 u+o7zDmw7+H4elfOesm2AskYW88fXrvkhSqYE1LNZmcJg1SUS+5LhJjWFaWHkt75bN1W
 tYHuLtzj2WPYjNLoPTgZp+tvB0zazmBXvV96BY7AQ5+hhGmY7DMMohmItpPSERz992zg
 t2kO+eE5R6qD6avWe8Jjw0ChbFsYCXcQIraC0RANaq0rgI5lKvqzPPQqNIHmMBX8j3v2
 rYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687165540; x=1689757540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdNXyi0xZLAfWyndPmyW6cG6B2SU0eI8m2DtLuHRuyM=;
 b=B/k3d/LY7x0ZR1AMsaayXgZ86yDtsxK6IlGZT7nMVDa9xczcaQYSHaXcbnjFU7aPr1
 NaA55HDDqNjDTUVOlKxQGKu9bl6a38umVZCrHACmWhrL1IkWIMLiS9r/jZdlrWgUDhDz
 l1mV/pMl06Gq1AcaN4TmRu1VM6vln/QzYTe4Fd1T8DvjPcgyHwiB4EX5SD9EnOcZ+MnF
 mm+bppyeSUl6s7dk0nRl9NoZpWOO857fQiyEnBdN8ZMBXY7+qNqM0R87sSERkbGLwQE1
 IBSs9m5A7V2+NLLmD47lYf1rurg32JYcLXZFOrmZnpSOmPEX3vgE3Q9TO/PltlJCri3R
 m6IQ==
X-Gm-Message-State: AC+VfDyg9M2acTu6lIhhDHT3WioEgEO7Nb9MjTUZOkX5VIrl4ySgqNwS
 mbvo2jHA69r3GnHGkWl/GNCiJw==
X-Google-Smtp-Source: ACHHUZ5fBJe+sLx9/Rs6XbLGiVn8CgwtZgtDBe6exJqTOJG76jnYDKocaa0B9doAcRiFOtFHwGMiSQ==
X-Received: by 2002:adf:f5d0:0:b0:30e:5b63:7487 with SMTP id
 k16-20020adff5d0000000b0030e5b637487mr6019430wrp.58.1687165539990; 
 Mon, 19 Jun 2023 02:05:39 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adfdbc4000000b0030ada01ca78sm30811934wrj.10.2023.06.19.02.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:05:38 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:05:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 11/18] target/riscv/cpu: add misa_ext_infos[]
Message-ID: <20230619-d12af33f63215fa1890142b4@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x433.google.com
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

On Tue, Jun 13, 2023 at 05:58:50PM -0300, Daniel Henrique Barboza wrote:
> Next patch will add KVM specific user properties for both MISA and
> multi-letter extensions. For MISA extensions we want to make use of what
> is already available in misa_ext_cfgs[] to avoid code repetition.
> 
> The new misa_ext_infos[] array will hold name and description for each
> MISA extension that misa_ext_cfgs[] is declaring. We'll then use this
> new array in KVM code to avoid duplicating strings.
> 
> There's nothing holding us back from doing the same with multi-letter
> extensions. For now doing just with MISA extensions is enough.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 44 ++++++++++++++++++--------------------------
>  target/riscv/cpu.h | 22 +++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 27 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0b25d53bbe..edaf052f25 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1562,33 +1562,25 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>  
> +#define MISA_CFG(_bit, _enabled) \
> +    {.name = misa_ext_infos[_bit].name, \

Maybe just misa_ext_info[] for the name? 'infos' sounds odd to me.

> +     .description = misa_ext_infos[_bit].description, \
> +     .misa_bit = _bit, .enabled = _enabled}
> +
>  static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e3e08d315f..6d2acea478 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -41,7 +41,7 @@
>  
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>  
> -/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
> +/* Consider updating misa_ext_infos[] when adding new MISA bits here */

Both arrays (_cfgs and _info) need consideration, right?

>  #define RVI RV('I')
>  #define RVE RV('E') /* E and I are mutually exclusive */
>  #define RVM RV('M')
> @@ -56,6 +56,26 @@
>  #define RVJ RV('J')
>  #define RVG RV('G')
>  
> +typedef struct misa_ext_info {
> +    const char *name;
> +    const char *description;
> +} MISAExtInfo;
> +
> +static const MISAExtInfo misa_ext_infos[] = {
> +    [RVA] = {"a", "Atomic instructions"},
> +    [RVC] = {"c", "Compressed instructions"},
> +    [RVD] = {"d", "Double-precision float point"},
> +    [RVF] = {"f", "Single-precision float point"},
> +    [RVI] = {"i", "Base integer instruction set"},
> +    [RVE] = {"e", "Base integer instruction set (embedded)"},
> +    [RVM] = {"m", "Integer multiplication and division"},
> +    [RVS] = {"s", "Supervisor-level instructions"},
> +    [RVU] = {"u", "User-level instructions"},
> +    [RVH] = {"h", "Hypervisor"},
> +    [RVJ] = {"x-j", "Dynamic translated languages"},
> +    [RVV] = {"v", "Vector operations"},
> +    [RVG] = {"g", "General purpose (IMAFD_Zicsr_Zifencei)"},
> +};

I'd export this array from target/riscv/cpu.c, rather than having each
source file that includes this header get its own copy.

Thanks,
drew

