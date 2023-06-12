Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F60C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8haC-0007JW-78; Mon, 12 Jun 2023 09:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hZr-0006z7-AA; Mon, 12 Jun 2023 09:27:23 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hZo-0003Xh-4z; Mon, 12 Jun 2023 09:27:23 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f2fb9b1cdso2206796fac.0; 
 Mon, 12 Jun 2023 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576438; x=1689168438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v9GFd/XLGn7s2Ohq4cs9ru5eulHKEtKUWQdKGMRNXO8=;
 b=B+vzTNlI9IF4qq5rEmSBAmP4L8ZHTvE/PAmqYfGRWhS7qcsihOXz+R7Rew10r4quyN
 PPCXBhjrLHryQVlR92bSkdBQtN5i0HFW8RnxBwzcD6NndNC/+Dgt4WVBEFKnsO1Jt9EB
 6pPpfCkdvXUKqCdeeIkg5cBbefo2mjeyooN+7kiefGynfgk4ybCorCIhIfx0lM4n6lFW
 SxR761GWkvPSa0JyN4LOpdsPLnKMSZ988O69f/ZJxadjIJmwSXQdDjCQVsCvRl3FvUls
 Mi+d/6Apak6g1UkTcttlGML9WR5alpdzwh/XF662lGYlY8FVFx8g8RPWO/vWFKaUt4nj
 2n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576438; x=1689168438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9GFd/XLGn7s2Ohq4cs9ru5eulHKEtKUWQdKGMRNXO8=;
 b=YIn3+YEtV1FRsRJCC99jykJqpbCtRYsyUriy/AP+PSDdM2KTxHcaPOIWlN6XgtFODZ
 hTgF+zUPPLf0qOrxUe9gMsvl0pziv3ELfcPq1sNUEzzN79SCC4YQnBLAW/iptTLOKZkR
 pcA1pLOULyJ+uUxHm89q+rQtlMg/DCtCyDSEAs1nsiGZoMhL7RdDI+9VZKoFZxhDGttP
 9f74bRwZr+G03EsZcFeLwjayNxh3I9rgaPhWt4WkjhhU3zP7saiL/M7M/uoBp+KQIJYG
 kgNmiLey24vk6FYOAD4KOQoqFZR83zDPHoaM/TLnDMsCC2qxOY7ESDB13i31JhJK2O3u
 dmGA==
X-Gm-Message-State: AC+VfDy5X8/t3K0Xxbhb9VWUSw6di2WHO067/g1gQOtXXIO5Opxvejwd
 p79BKPh1iPJVMmJe0B7ZzZU=
X-Google-Smtp-Source: ACHHUZ5MbJW6i8GwKag7Vu7AzqOLqVhUqu90/F0OAk0+GZuNW5XnR1WfFskedvO01JpncPIQfA8fYw==
X-Received: by 2002:a05:6870:a114:b0:1a6:8911:61a9 with SMTP id
 m20-20020a056870a11400b001a6891161a9mr1722625oae.29.1686576437811; 
 Mon, 12 Jun 2023 06:27:17 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a05687032d500b001a663e49523sm2663699oac.36.2023.06.12.06.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:27:17 -0700 (PDT)
Message-ID: <1a7d9338-ec1f-0708-c4d0-930ff960d6bf@gmail.com>
Date: Mon, 12 Jun 2023 10:27:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/38] util: Add cpuinfo-ppc.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-3-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.096,
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



On 6/8/23 23:23, Richard Henderson wrote:
> Move the code from tcg/.  Fix a bug in that PPC_FEATURE2_ARCH_3_10
> is actually spelled PPC_FEATURE2_ARCH_3_1.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   host/include/ppc/host/cpuinfo.h   | 29 ++++++++++++++++
>   host/include/ppc64/host/cpuinfo.h |  1 +
>   tcg/ppc/tcg-target.h              | 16 ++++-----
>   util/cpuinfo-ppc.c                | 57 +++++++++++++++++++++++++++++++
>   tcg/ppc/tcg-target.c.inc          | 44 +-----------------------
>   util/meson.build                  |  2 ++
>   6 files changed, 98 insertions(+), 51 deletions(-)
>   create mode 100644 host/include/ppc/host/cpuinfo.h
>   create mode 100644 host/include/ppc64/host/cpuinfo.h
>   create mode 100644 util/cpuinfo-ppc.c
> 
> diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
> new file mode 100644
> index 0000000000..7ec252ef52
> --- /dev/null
> +++ b/host/include/ppc/host/cpuinfo.h
> @@ -0,0 +1,29 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Host specific cpu indentification for ppc.
> + */
> +
> +#ifndef HOST_CPUINFO_H
> +#define HOST_CPUINFO_H
> +
> +/* Digested version of <cpuid.h> */
> +
> +#define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
> +#define CPUINFO_V2_06           (1u << 1)
> +#define CPUINFO_V2_07           (1u << 2)
> +#define CPUINFO_V3_00           (1u << 3)
> +#define CPUINFO_V3_10           (1u << 4)
> +#define CPUINFO_ISEL            (1u << 5)
> +#define CPUINFO_ALTIVEC         (1u << 6)
> +#define CPUINFO_VSX             (1u << 7)
> +
> +/* Initialized with a constructor. */
> +extern unsigned cpuinfo;
> +
> +/*
> + * We cannot rely on constructor ordering, so other constructors must
> + * use the function interface rather than the variable above.
> + */
> +unsigned cpuinfo_init(void);
> +
> +#endif /* HOST_CPUINFO_H */
> diff --git a/host/include/ppc64/host/cpuinfo.h b/host/include/ppc64/host/cpuinfo.h
> new file mode 100644
> index 0000000000..2f036a0627
> --- /dev/null
> +++ b/host/include/ppc64/host/cpuinfo.h
> @@ -0,0 +1 @@
> +#include "host/include/ppc/host/cpuinfo.h"
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index c7552b6391..b632a5a647 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -25,6 +25,8 @@
>   #ifndef PPC_TCG_TARGET_H
>   #define PPC_TCG_TARGET_H
>   
> +#include "host/cpuinfo.h"
> +
>   #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>   
>   #define TCG_TARGET_NB_REGS 64
> @@ -61,14 +63,12 @@ typedef enum {
>       tcg_isa_3_10,
>   } TCGPowerISA;
>   
> -extern TCGPowerISA have_isa;
> -extern bool have_altivec;
> -extern bool have_vsx;
> -
> -#define have_isa_2_06  (have_isa >= tcg_isa_2_06)
> -#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
> -#define have_isa_3_00  (have_isa >= tcg_isa_3_00)
> -#define have_isa_3_10  (have_isa >= tcg_isa_3_10)
> +#define have_isa_2_06  (cpuinfo & CPUINFO_V2_06)
> +#define have_isa_2_07  (cpuinfo & CPUINFO_V2_07)
> +#define have_isa_3_00  (cpuinfo & CPUINFO_V3_00)
> +#define have_isa_3_10  (cpuinfo & CPUINFO_V3_10)
> +#define have_altivec   (cpuinfo & CPUINFO_ALTIVEC)
> +#define have_vsx       (cpuinfo & CPUINFO_VSX)
>   
>   /* optional instructions automatically implemented */
>   #define TCG_TARGET_HAS_ext8u_i32        0 /* andi */
> diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
> new file mode 100644
> index 0000000000..ee761de33a
> --- /dev/null
> +++ b/util/cpuinfo-ppc.c
> @@ -0,0 +1,57 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Host specific cpu indentification for ppc.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "host/cpuinfo.h"
> +
> +#ifdef CONFIG_GETAUXVAL
> +# include <sys/auxv.h>
> +#else
> +# include <asm/cputable.h>
> +# include "elf.h"
> +#endif
> +
> +unsigned cpuinfo;
> +
> +/* Called both as constructor and (possibly) via other constructors. */
> +unsigned __attribute__((constructor)) cpuinfo_init(void)
> +{
> +    unsigned info = cpuinfo;
> +    unsigned long hwcap, hwcap2;
> +
> +    if (info) {
> +        return info;
> +    }
> +
> +    hwcap = qemu_getauxval(AT_HWCAP);
> +    hwcap2 = qemu_getauxval(AT_HWCAP2);
> +    info = CPUINFO_ALWAYS;
> +
> +    if (hwcap & PPC_FEATURE_ARCH_2_06) {
> +        info |= CPUINFO_V2_06;
> +    }
> +    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
> +        info |= CPUINFO_V2_07;
> +    }
> +    if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
> +        info |= CPUINFO_V3_00;
> +    }
> +    if (hwcap2 & PPC_FEATURE2_ARCH_3_1) {
> +        info |= CPUINFO_V3_10;
> +    }
> +    if (hwcap2 & PPC_FEATURE2_HAS_ISEL) {
> +        info |= CPUINFO_ISEL;
> +    }
> +    if (hwcap & PPC_FEATURE_HAS_ALTIVEC) {
> +        info |= CPUINFO_ALTIVEC;
> +        /* We only care about the portion of VSX that overlaps Altivec. */
> +        if (hwcap & PPC_FEATURE_HAS_VSX) {
> +            info |= CPUINFO_VSX;
> +        }
> +    }
> +
> +    cpuinfo = info;
> +    return info;
> +}
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 5c8378f8f6..c866f2c997 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -101,10 +101,7 @@
>   #define ALL_GENERAL_REGS  0xffffffffu
>   #define ALL_VECTOR_REGS   0xffffffff00000000ull
>   
> -TCGPowerISA have_isa;
> -static bool have_isel;
> -bool have_altivec;
> -bool have_vsx;
> +#define have_isel  (cpuinfo & CPUINFO_ISEL)
>   
>   #ifndef CONFIG_SOFTMMU
>   #define TCG_GUEST_BASE_REG 30
> @@ -3879,45 +3876,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>   
>   static void tcg_target_init(TCGContext *s)
>   {
> -    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
> -    unsigned long hwcap2 = qemu_getauxval(AT_HWCAP2);
> -
> -    have_isa = tcg_isa_base;
> -    if (hwcap & PPC_FEATURE_ARCH_2_06) {
> -        have_isa = tcg_isa_2_06;
> -    }
> -#ifdef PPC_FEATURE2_ARCH_2_07
> -    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
> -        have_isa = tcg_isa_2_07;
> -    }
> -#endif
> -#ifdef PPC_FEATURE2_ARCH_3_00
> -    if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
> -        have_isa = tcg_isa_3_00;
> -    }
> -#endif
> -#ifdef PPC_FEATURE2_ARCH_3_10
> -    if (hwcap2 & PPC_FEATURE2_ARCH_3_10) {
> -        have_isa = tcg_isa_3_10;
> -    }
> -#endif
> -
> -#ifdef PPC_FEATURE2_HAS_ISEL
> -    /* Prefer explicit instruction from the kernel. */
> -    have_isel = (hwcap2 & PPC_FEATURE2_HAS_ISEL) != 0;
> -#else
> -    /* Fall back to knowing Power7 (2.06) has ISEL. */
> -    have_isel = have_isa_2_06;
> -#endif
> -
> -    if (hwcap & PPC_FEATURE_HAS_ALTIVEC) {
> -        have_altivec = true;
> -        /* We only care about the portion of VSX that overlaps Altivec. */
> -        if (hwcap & PPC_FEATURE_HAS_VSX) {
> -            have_vsx = true;
> -        }
> -    }
> -
>       tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
>       tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
>       if (have_altivec) {
> diff --git a/util/meson.build b/util/meson.build
> index 3a93071d27..a375160286 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -113,4 +113,6 @@ if cpu == 'aarch64'
>     util_ss.add(files('cpuinfo-aarch64.c'))
>   elif cpu in ['x86', 'x86_64']
>     util_ss.add(files('cpuinfo-i386.c'))
> +elif cpu in ['ppc', 'ppc64']
> +  util_ss.add(files('cpuinfo-ppc.c'))
>   endif

