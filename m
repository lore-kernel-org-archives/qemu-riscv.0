Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B455EB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 17:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIBqf-0007hS-PV; Sat, 08 Jul 2023 13:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBqd-0007gd-Mg
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:35:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBqY-00008G-T0
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:35:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so30743765e9.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688837749; x=1691429749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cesxE+dDvDajXZ0Ii2pn6CMLlyVTTmdT4wtFFhNqEu8=;
 b=dHHKIq86PF9x7jEqf4B574pPTuomL7l3gPhQTdpQmyPBJ09NpRMZHuVEjxDnhnB6qI
 QEOykphfX//AyfnWJpGikV05VZZ7FAaXKGwZBUuuxPuTGzqpGNidVzc0SsgjzETr1zSa
 NlvHNBShcmIG7e9VelAWepQ9jx3y4Hfckwt3nsxXg6617Lxp4QCrzpfh5T8xG8SRmie4
 QdOlSjYTmB+AV1QemNn0OsRGYTsxwjpCpFSv1f5vRTqg/JTF8HFelPkp5hRHsvYs+uMw
 jfs9hgcjGfNJWJaqG7NoBEDqrmsHfhZtCYjn3Yk1OiN4Vdgn88LSEDwVOwZZ+x2td7Jw
 S3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688837749; x=1691429749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cesxE+dDvDajXZ0Ii2pn6CMLlyVTTmdT4wtFFhNqEu8=;
 b=FJH+MgUA3Vu2x39M9PxhbJD8O1NM/WV8ikQvetFNZqpKYpJmp7FziP9h6Unbsibusl
 ECoQSRAaFHKGCw0c+ovbIGP2atldt2hO3mgxjyzyiNK4jLy7SKPl//8N5/hQmCgd2Qv0
 uggpsFReoNmz4RwdOSdY/gnXWMXqfS9kQ6dnQZIUUB514jQ9iNlaAXoseU1sI+SEnKk1
 wqua4mG4M1jpIvbNPNlfUOUyo4wHREmg/MevD0sZ5vyr+LrFk1D0d+b499Iewc31r5/h
 OPxABbKKFO9ThV9JboEO4NuoHINZHRUOu6TuSQT1cmlv/h/6/Ed7TdORti//B2pX/u7E
 jADw==
X-Gm-Message-State: ABy/qLb2PEQyHPT8ce/1z1jHuN6W56xbMUkxy0N7eH/siCsxVsN787Oj
 U3wx8BHRQZn+ShIzBgs1xXC08Q==
X-Google-Smtp-Source: APBJJlFL8hV6LHpotQ38vKc2gvPpRx187qTvYXbGNxxQvE7UyVafBPIB8TGtsz6elfptBPE+DPTZLw==
X-Received: by 2002:a05:600c:3786:b0:3fb:b890:128b with SMTP id
 o6-20020a05600c378600b003fbb890128bmr6367574wmr.27.1688837749243; 
 Sat, 08 Jul 2023 10:35:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a7bcd17000000b003fbb5506e54sm5627636wmj.29.2023.07.08.10.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:35:48 -0700 (PDT)
Message-ID: <5c78b1c8-0515-23ea-8f93-6563a46a8637@linaro.org>
Date: Sat, 8 Jul 2023 19:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 13/37] host/include/aarch64: Implement aes-round.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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

+Ard

On 3/7/23 12:04, Richard Henderson wrote:
> Detect AES in cpuinfo; implement the accel hooks.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                                  |   9 +
>   host/include/aarch64/host/cpuinfo.h          |   1 +
>   host/include/aarch64/host/crypto/aes-round.h | 205 +++++++++++++++++++
>   util/cpuinfo-aarch64.c                       |   2 +
>   4 files changed, 217 insertions(+)
>   create mode 100644 host/include/aarch64/host/crypto/aes-round.h
> 
> diff --git a/meson.build b/meson.build
> index a9ba0bfab3..029c6c0048 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2674,6 +2674,15 @@ config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
>       int main(int argc, char *argv[]) { return bar(argv[0]); }
>     '''), error_message: 'AVX512BW not available').allowed())
>   
> +# For both AArch64 and AArch32, detect if builtins are available.
> +config_host_data.set('CONFIG_ARM_AES_BUILTIN', cc.compiles('''
> +    #include <arm_neon.h>
> +    #ifndef __ARM_FEATURE_AES
> +    __attribute__((target("+crypto")))
> +    #endif
> +    void foo(uint8x16_t *p) { *p = vaesmcq_u8(*p); }
> +  '''))
> +
>   have_pvrdma = get_option('pvrdma') \
>     .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
>     .require(cc.compiles(gnu_source_prefix + '''
> diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
> index 82227890b4..05feeb4f43 100644
> --- a/host/include/aarch64/host/cpuinfo.h
> +++ b/host/include/aarch64/host/cpuinfo.h
> @@ -9,6 +9,7 @@
>   #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
>   #define CPUINFO_LSE             (1u << 1)
>   #define CPUINFO_LSE2            (1u << 2)
> +#define CPUINFO_AES             (1u << 3)
>   
>   /* Initialized with a constructor. */
>   extern unsigned cpuinfo;
> diff --git a/host/include/aarch64/host/crypto/aes-round.h b/host/include/aarch64/host/crypto/aes-round.h
> new file mode 100644
> index 0000000000..8b5f88d50c
> --- /dev/null
> +++ b/host/include/aarch64/host/crypto/aes-round.h
> @@ -0,0 +1,205 @@
> +/*
> + * AArch64 specific aes acceleration.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef AARCH64_HOST_CRYPTO_AES_ROUND_H
> +#define AARCH64_HOST_CRYPTO_AES_ROUND_H
> +
> +#include "host/cpuinfo.h"
> +#include <arm_neon.h>
> +
> +#ifdef __ARM_FEATURE_AES
> +# define HAVE_AES_ACCEL  true
> +#else
> +# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_AES)
> +#endif
> +#if !defined(__ARM_FEATURE_AES) && defined(CONFIG_ARM_AES_BUILTIN)
> +# define ATTR_AES_ACCEL  __attribute__((target("+crypto")))
> +#else
> +# define ATTR_AES_ACCEL
> +#endif
> +
> +static inline uint8x16_t aes_accel_bswap(uint8x16_t x)
> +{
> +    return vqtbl1q_u8(x, (uint8x16_t){ 15, 14, 13, 12, 11, 10, 9, 8,
> +                                        7,  6,  5,  4,  3,  2, 1, 0, });
> +}
> +
> +#ifdef CONFIG_ARM_AES_BUILTIN
> +# define aes_accel_aesd            vaesdq_u8
> +# define aes_accel_aese            vaeseq_u8
> +# define aes_accel_aesmc           vaesmcq_u8
> +# define aes_accel_aesimc          vaesimcq_u8
> +# define aes_accel_aesd_imc(S, K)  vaesimcq_u8(vaesdq_u8(S, K))
> +# define aes_accel_aese_mc(S, K)   vaesmcq_u8(vaeseq_u8(S, K))
> +#else
> +static inline uint8x16_t aes_accel_aesd(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesd %0.16b, %1.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aese(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aese %0.16b, %1.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aesmc(uint8x16_t d)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesmc %0.16b, %1.16b" : "=w"(d) : "w"(d));
> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aesimc(uint8x16_t d)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesimc %0.16b, %1.16b" : "=w"(d) : "w"(d));
> +    return d;
> +}
> +
> +/* Most CPUs fuse AESD+AESIMC in the execution pipeline. */
> +static inline uint8x16_t aes_accel_aesd_imc(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesd %0.16b, %1.16b\n\t"
> +        "aesimc %0.16b, %0.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +
> +/* Most CPUs fuse AESE+AESMC in the execution pipeline. */
> +static inline uint8x16_t aes_accel_aese_mc(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aese %0.16b, %1.16b\n\t"
> +        "aesmc %0.16b, %0.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +#endif /* CONFIG_ARM_AES_BUILTIN */
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesmc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesmc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_SB_SR_AK_accel(AESState *ret, const AESState *st,
> +                      const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aese(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aese(t, z);
> +    }
> +    ret->v = (AESStateVec)t ^ rk->v;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
> +                         const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aese_mc(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aese_mc(t, z);
> +    }
> +    ret->v = (AESStateVec)t ^ rk->v;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesimc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesimc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_AK_accel(AESState *ret, const AESState *st,
> +                        const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesd(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd(t, z);
> +    }
> +    ret->v = (AESStateVec)t ^ rk->v;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t k = (uint8x16_t)rk->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        k = aes_accel_bswap(k);
> +        t = aes_accel_aesd(t, z);
> +        t ^= k;
> +        t = aes_accel_aesimc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd(t, z);
> +        t ^= k;
> +        t = aes_accel_aesimc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesd_imc(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd_imc(t, z);
> +    }
> +    ret->v = (AESStateVec)t ^ rk->v;
> +}
> +
> +#endif /* AARCH64_HOST_CRYPTO_AES_ROUND_H */
> diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
> index f99acb7884..ababc39550 100644
> --- a/util/cpuinfo-aarch64.c
> +++ b/util/cpuinfo-aarch64.c
> @@ -56,10 +56,12 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
>       unsigned long hwcap = qemu_getauxval(AT_HWCAP);
>       info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
>       info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
> +    info |= (hwcap & HWCAP_AES ? CPUINFO_AES: 0);
>   #endif
>   #ifdef CONFIG_DARWIN
>       info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
>       info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE2") * CPUINFO_LSE2;
> +    info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
>   #endif
>   
>       cpuinfo = info;


