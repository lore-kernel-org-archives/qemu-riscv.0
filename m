Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC48C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 13:30:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8hdC-0002SS-4U; Mon, 12 Jun 2023 09:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hcm-0001mH-TD; Mon, 12 Jun 2023 09:30:27 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1q8hci-0004A5-SN; Mon, 12 Jun 2023 09:30:24 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-39a3f26688bso2167344b6e.2; 
 Mon, 12 Jun 2023 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686576617; x=1689168617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KY94OW4St7rQPlYKD+A1PxuXJlAfa+wpyBuaQM/e9P0=;
 b=Ok/hGfnQm2KEvMPv38mkC+aHiDDipljEascrqkmnlXZzyPkLhe/GCtOMkmlqX40ugE
 mSiLYp8UOV1osOIBwRroRXwfaj9XZGbOF2ChX5ndRftvlewbEOglUhAsBll2miPxT7k8
 /67nsrBClamxniJ26yGvmmSWYx/GxccWP4NQ9+ql//qryzYF4ZKWwdAxEuX+529Osce8
 DIFLc8KEuM0spPB9usYGkhyAA6anonOXdsVageLB2iNEVCgG9TQ1J50oaPOZvtNWlr3r
 gZQglFB160Rz5GOvEGcpDiOnd98XqT2wOWbe5rFKs8U1D2ntppfT8kvalT9vvWcdNLnf
 Kr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686576617; x=1689168617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KY94OW4St7rQPlYKD+A1PxuXJlAfa+wpyBuaQM/e9P0=;
 b=jw35INeqXKPZ3JA3aeuTEH16cNorw6tyWAr/OtsezXPrpOin+aJF7+YNnnkQuztBzq
 LliJh1bzQU1AVbu2+roTWhTiLpfWl04p9j0yYC+LRJb1cmmgd8IxRVzgHmwu7IVC8i75
 rGx4bKmOLN+s75lf19jOyaxSD4ltFq9h8KDm1cHGgEZ/5k09kNF5vnOGGNq3iijn5aVx
 lCgYdHoYcjQtSbzmMPmY2/T8fwYrGvgdoWkifpXi8ubqzcMR7k+A6ch/nHh1E4/VCMNs
 JrI/1JmEDkHan8GTQ+4cgUNFrBlTbI1iDHhif+mVzbdttWjYeR9eX+ZPKtjTR7uMMIAj
 E0fw==
X-Gm-Message-State: AC+VfDxzpx9w6nl41hyqbwhStoxk/U2q1PsKTBIWOVUudZNV1JM+eqUb
 6b3aDjrB98ySBYFaDs9DVQE=
X-Google-Smtp-Source: ACHHUZ4/Q12xfwtytsQcD046acJkR83OH2DuKQYdIZa8uEuNOXHb4fTh3UxT5sS149kOyToulxDk7g==
X-Received: by 2002:a05:6808:204:b0:39a:bb23:e54c with SMTP id
 l4-20020a056808020400b0039abb23e54cmr4056554oie.46.1686576617104; 
 Mon, 12 Jun 2023 06:30:17 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 bd25-20020a056808221900b003923ef75a3dsm387197oib.4.2023.06.12.06.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 06:30:16 -0700 (PDT)
Message-ID: <299e915b-fed2-7323-3fc3-8b8921d82fe8@gmail.com>
Date: Mon, 12 Jun 2023 10:30:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 38/38] host/include/ppc: Implement aes-round.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-39-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230609022401.684157-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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



On 6/8/23 23:24, Richard Henderson wrote:
> Detect CRYPTO in cpuinfo; implement the accel hooks.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   host/include/ppc/host/aes-round.h   | 181 ++++++++++++++++++++++++++++
>   host/include/ppc/host/cpuinfo.h     |   1 +
>   host/include/ppc64/host/aes-round.h |   1 +
>   util/cpuinfo-ppc.c                  |   8 ++
>   4 files changed, 191 insertions(+)
>   create mode 100644 host/include/ppc/host/aes-round.h
>   create mode 100644 host/include/ppc64/host/aes-round.h
> 
> diff --git a/host/include/ppc/host/aes-round.h b/host/include/ppc/host/aes-round.h
> new file mode 100644
> index 0000000000..9b5a15d1e5
> --- /dev/null
> +++ b/host/include/ppc/host/aes-round.h
> @@ -0,0 +1,181 @@
> +/*
> + * Power v2.07 specific aes acceleration.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef PPC_HOST_AES_ROUND_H
> +#define PPC_HOST_AES_ROUND_H
> +
> +#ifndef __ALTIVEC__
> +/* Without ALTIVEC, we can't even write inline assembly. */
> +#include "host/include/generic/host/aes-round.h"
> +#else
> +#include "host/cpuinfo.h"
> +
> +#ifdef __CRYPTO__
> +# define HAVE_AES_ACCEL  true
> +#else
> +# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_CRYPTO)
> +#endif
> +#define ATTR_AES_ACCEL
> +
> +/*
> + * While there is <altivec.h>, both gcc and clang "aid" with the
> + * endianness issues in different ways. Just use inline asm instead.
> + */
> +
> +/* Bytes in memory are host-endian; bytes in register are @be. */
> +static inline AESStateVec aes_accel_ld(const AESState *p, bool be)
> +{
> +    AESStateVec r;
> +
> +    if (be) {
> +        asm("lvx %0, 0, %1" : "=v"(r) : "r"(p), "m"(*p));
> +    } else if (HOST_BIG_ENDIAN) {
> +        AESStateVec rev = {
> +            15, 14, 13, 12, 11, 10, 9, 8, 7,  6,  5,  4,  3,  2,  1,  0,
> +        };
> +        asm("lvx %0, 0, %1\n\t"
> +            "vperm %0, %0, %0, %2"
> +            : "=v"(r) : "r"(p), "v"(rev), "m"(*p));
> +    } else {
> +#ifdef __POWER9_VECTOR__
> +        asm("lxvb16x %x0, 0, %1" : "=v"(r) : "r"(p), "m"(*p));
> +#else
> +        asm("lxvd2x %x0, 0, %1\n\t"
> +            "xxpermdi %x0, %x0, %x0, 2"
> +            : "=v"(r) : "r"(p), "m"(*p));
> +#endif
> +    }
> +    return r;
> +}
> +
> +static void aes_accel_st(AESState *p, AESStateVec r, bool be)
> +{
> +    if (be) {
> +        asm("stvx %1, 0, %2" : "=m"(*p) : "v"(r), "r"(p));
> +    } else if (HOST_BIG_ENDIAN) {
> +        AESStateVec rev = {
> +            15, 14, 13, 12, 11, 10, 9, 8, 7,  6,  5,  4,  3,  2,  1,  0,
> +        };
> +        asm("vperm %1, %1, %1, %2\n\t"
> +            "stvx %1, 0, %3"
> +            : "=m"(*p), "+v"(r) : "v"(rev), "r"(p));
> +    } else {
> +#ifdef __POWER9_VECTOR__
> +        asm("stxvb16x %x1, 0, %2" : "=m"(*p) : "v"(r), "r"(p));
> +#else
> +        asm("xxpermdi %x1, %x1, %x1, 2\n\t"
> +            "stxvd2x %x1, 0, %2"
> +            : "=m"(*p), "+v"(r) : "r"(p));
> +#endif
> +    }
> +}
> +
> +static inline AESStateVec aes_accel_vcipher(AESStateVec d, AESStateVec k)
> +{
> +    asm("vcipher %0, %0, %1" : "+v"(d) : "v"(k));
> +    return d;
> +}
> +
> +static inline AESStateVec aes_accel_vncipher(AESStateVec d, AESStateVec k)
> +{
> +    asm("vncipher %0, %0, %1" : "+v"(d) : "v"(k));
> +    return d;
> +}
> +
> +static inline AESStateVec aes_accel_vcipherlast(AESStateVec d, AESStateVec k)
> +{
> +    asm("vcipherlast %0, %0, %1" : "+v"(d) : "v"(k));
> +    return d;
> +}
> +
> +static inline AESStateVec aes_accel_vncipherlast(AESStateVec d, AESStateVec k)
> +{
> +    asm("vncipherlast %0, %0, %1" : "+v"(d) : "v"(k));
> +    return d;
> +}
> +
> +static inline void
> +aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    AESStateVec t, z = { };
> +
> +    t = aes_accel_ld(st, be);
> +    t = aes_accel_vncipherlast(t, z);
> +    t = aes_accel_vcipher(t, z);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesenc_SB_SR_AK_accel(AESState *ret, const AESState *st,
> +                      const AESState *rk, bool be)
> +{
> +    AESStateVec t, k;
> +
> +    t = aes_accel_ld(st, be);
> +    k = aes_accel_ld(rk, be);
> +    t = aes_accel_vcipherlast(t, k);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
> +                         const AESState *rk, bool be)
> +{
> +    AESStateVec t, k;
> +
> +    t = aes_accel_ld(st, be);
> +    k = aes_accel_ld(rk, be);
> +    t = aes_accel_vcipher(t, k);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    AESStateVec t, z = { };
> +
> +    t = aes_accel_ld(st, be);
> +    t = aes_accel_vcipherlast(t, z);
> +    t = aes_accel_vncipher(t, z);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesdec_ISB_ISR_AK_accel(AESState *ret, const AESState *st,
> +                        const AESState *rk, bool be)
> +{
> +    AESStateVec t, k;
> +
> +    t = aes_accel_ld(st, be);
> +    k = aes_accel_ld(rk, be);
> +    t = aes_accel_vncipherlast(t, k);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    AESStateVec t, k;
> +
> +    t = aes_accel_ld(st, be);
> +    k = aes_accel_ld(rk, be);
> +    t = aes_accel_vncipher(t, k);
> +    aes_accel_st(ret, t, be);
> +}
> +
> +static inline void
> +aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    AESStateVec t, k, z = { };
> +
> +    t = aes_accel_ld(st, be);
> +    k = aes_accel_ld(rk, be);
> +    t = aes_accel_vncipher(t, z);
> +    aes_accel_st(ret, t ^ k, be);
> +}
> +#endif /* __ALTIVEC__ */
> +#endif /* PPC_HOST_AES_ROUND_H */
> diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
> index 7ec252ef52..6cc727dba7 100644
> --- a/host/include/ppc/host/cpuinfo.h
> +++ b/host/include/ppc/host/cpuinfo.h
> @@ -16,6 +16,7 @@
>   #define CPUINFO_ISEL            (1u << 5)
>   #define CPUINFO_ALTIVEC         (1u << 6)
>   #define CPUINFO_VSX             (1u << 7)
> +#define CPUINFO_CRYPTO          (1u << 8)
>   
>   /* Initialized with a constructor. */
>   extern unsigned cpuinfo;
> diff --git a/host/include/ppc64/host/aes-round.h b/host/include/ppc64/host/aes-round.h
> new file mode 100644
> index 0000000000..4a78d94de8
> --- /dev/null
> +++ b/host/include/ppc64/host/aes-round.h
> @@ -0,0 +1 @@
> +#include "host/include/ppc/host/aes-round.h"
> diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
> index ee761de33a..053b383720 100644
> --- a/util/cpuinfo-ppc.c
> +++ b/util/cpuinfo-ppc.c
> @@ -49,6 +49,14 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
>           /* We only care about the portion of VSX that overlaps Altivec. */
>           if (hwcap & PPC_FEATURE_HAS_VSX) {
>               info |= CPUINFO_VSX;
> +            /*
> +             * We use VSX especially for little-endian, but we should
> +             * always have both anyway, since VSX came with Power7
> +             * and crypto came with Power8.
> +             */
> +            if (hwcap2 & PPC_FEATURE2_HAS_VEC_CRYPTO) {
> +                info |= CPUINFO_CRYPTO;
> +            }
>           }
>       }
>   

