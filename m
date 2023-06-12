Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C11C7EE2F
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 14:52:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8itl-0005Ug-Sx; Mon, 12 Jun 2023 10:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1q8ite-0005SJ-FG
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 10:51:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1q8itR-0004uu-Vn
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 10:51:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30fc26affa9so750312f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686581499; x=1689173499;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcTh8vrn3g1pU9oOdZY3Ut51ZaAnBBJP+ZIEmtafV3k=;
 b=WaqySy0SbMUbWlBXAAJ26ywJByf7Wpf7WNisizCpOc5sfC/Eo0uPHebF7XQRD2nElb
 3BKHKnHL29/oRUlrt+W3gXISid08E6/NE5yD42coNXf/Q88INtAOjbWNTqXR454RuVK7
 3+CuWULzWFLvaVIkjWoGr4aMrVKYDVPtyGy1JRL4orLdXo/D/Bmhbfk/OlfG8uiTz3OC
 Xi3vIRWLCTFxK5a/LXrvpeWalJTwrmhL2wGMvr4TMsAQelgyR29rjVytZl6oXjxtuOk8
 jkXg9GGYzoDJOI3jwZAZgn4b5P75cUBZw2zycOGUnvhhe1JkK6lbBWxUFvSE328oePlA
 YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686581499; x=1689173499;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QcTh8vrn3g1pU9oOdZY3Ut51ZaAnBBJP+ZIEmtafV3k=;
 b=bk8ih0EHMuHAxw2qZrxg40DyfQ+mQzTWjVizZfjiw1LTzaQEQCCu0xUlsAN9jpRlSy
 77XoCKJZpMdp1tVupRH/64ygj3IRbACVg+WJqXegv6UvyQJRHyiJ390E+zTkEpaBehjU
 j2I95PmdHXWzuM5BThLFBIoGG5CIdJLJbekdHWtJtiCQfDuuBQYZj4t27nXNy9nSbMBW
 9VSfBV41o/K/daZWZSA5m70Mm8wypY4iSgvC15igKFxmfnPUV1Vbrv0ss2FB3htqOvq6
 6/Qnf//wTi64Ngt26bwojJjABB0S2e2RS1xqTnEPMVeYZoZfBy59b7HBV93WZG9DyBl6
 EUtw==
X-Gm-Message-State: AC+VfDwIpAuh/Swwn2Fwptmqs5tIlPR3/83V5+lPywp3B5NchtyPlo4H
 sZDouIwBv4KlVQyZ5LY90ebzkw==
X-Google-Smtp-Source: ACHHUZ7TIlJKxWSs0kjJ9pAv09tx+zzQTs0d5DFZlhApOwG54QO6DSDIUx/t3vuLWPhcBF+vvm30ZQ==
X-Received: by 2002:a5d:618c:0:b0:306:2656:66d4 with SMTP id
 j12-20020a5d618c000000b00306265666d4mr3810098wru.58.1686581499248; 
 Mon, 12 Jun 2023 07:51:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d52d1000000b002c71b4d476asm12646344wrv.106.2023.06.12.07.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 07:51:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 541F11FFBB;
 Mon, 12 Jun 2023 15:51:38 +0100 (BST)
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-4-richard.henderson@linaro.org>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 03/38] tests/multiarch: Add test-aes
Date: Mon, 12 Jun 2023 15:46:50 +0100
In-reply-to: <20230609022401.684157-4-richard.henderson@linaro.org>
Message-ID: <87zg5468ed.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Use a shared driver and backends for i386, aarch64, ppc64, riscv64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/test-aes.c            |  58 ++++++++
>  tests/tcg/i386/test-aes.c               |  68 +++++++++
>  tests/tcg/ppc64/test-aes.c              | 116 +++++++++++++++
>  tests/tcg/riscv64/test-aes.c            |  76 ++++++++++
>  tests/tcg/multiarch/test-aes-main.c.inc | 183
> ++++++++++++++++++++++++

I find it odd the file with the main function is the c.inc and the per
guest impl's are the plain .c files. Is it possible to have it the other
way around? If we have a fallback library function for aes then we could
enable the test for all targets (a true multiarch test) with some having CP=
U specific
accelerations where available.

But if that's too hard to do:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>  tests/tcg/aarch64/Makefile.target       |   4 +
>  tests/tcg/i386/Makefile.target          |   4 +
>  tests/tcg/ppc64/Makefile.target         |   1 +
>  tests/tcg/riscv64/Makefile.target       |   4 +
>  9 files changed, 514 insertions(+)
>  create mode 100644 tests/tcg/aarch64/test-aes.c
>  create mode 100644 tests/tcg/i386/test-aes.c
>  create mode 100644 tests/tcg/ppc64/test-aes.c
>  create mode 100644 tests/tcg/riscv64/test-aes.c
>  create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc
>
> diff --git a/tests/tcg/aarch64/test-aes.c b/tests/tcg/aarch64/test-aes.c
> new file mode 100644
> index 0000000000..2cd324f09b
> --- /dev/null
> +++ b/tests/tcg/aarch64/test-aes.c
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include "../multiarch/test-aes-main.c.inc"
> +
> +bool test_SB_SR(uint8_t *o, const uint8_t *i)
> +{
> +    /* aese also adds round key, so supply zero. */
> +    asm("ld1 { v0.16b }, [%1]\n\t"
> +        "movi v1.16b, #0\n\t"
> +        "aese v0.16b, v1.16b\n\t"
> +        "st1 { v0.16b }, [%0]"
> +        : : "r"(o), "r"(i) : "v0", "v1", "memory");
> +    return true;
> +}
> +
> +bool test_MC(uint8_t *o, const uint8_t *i)
> +{
> +    asm("ld1 { v0.16b }, [%1]\n\t"
> +        "aesmc v0.16b, v0.16b\n\t"
> +        "st1 { v0.16b }, [%0]"
> +        : : "r"(o), "r"(i) : "v0", "memory");
> +    return true;
> +}
> +
> +bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    return false;
> +}
> +
> +bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
> +{
> +    /* aesd also adds round key, so supply zero. */
> +    asm("ld1 { v0.16b }, [%1]\n\t"
> +        "movi v1.16b, #0\n\t"
> +        "aesd v0.16b, v1.16b\n\t"
> +        "st1 { v0.16b }, [%0]"
> +        : : "r"(o), "r"(i) : "v0", "v1", "memory");
> +    return true;
> +}
> +
> +bool test_IMC(uint8_t *o, const uint8_t *i)
> +{
> +    asm("ld1 { v0.16b }, [%1]\n\t"
> +        "aesimc v0.16b, v0.16b\n\t"
> +        "st1 { v0.16b }, [%0]"
> +        : : "r"(o), "r"(i) : "v0", "memory");
> +    return true;
> +}
> +
> +bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    return false;
> +}
> +
> +bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    return false;
> +}
> diff --git a/tests/tcg/i386/test-aes.c b/tests/tcg/i386/test-aes.c
> new file mode 100644
> index 0000000000..199395e6cc
> --- /dev/null
> +++ b/tests/tcg/i386/test-aes.c
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include "../multiarch/test-aes-main.c.inc"
> +#include <immintrin.h>
> +
> +static bool test_SB_SR(uint8_t *o, const uint8_t *i)
> +{
> +    __m128i vi =3D _mm_loadu_si128((const __m128i_u *)i);
> +
> +    /* aesenclast also adds round key, so supply zero. */
> +    vi =3D _mm_aesenclast_si128(vi, _mm_setzero_si128());
> +
> +    _mm_storeu_si128((__m128i_u *)o, vi);
> +    return true;
> +}
> +
> +static bool test_MC(uint8_t *o, const uint8_t *i)
> +{
> +    return false;
> +}
> +
> +static bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t=
 *k)
> +{
> +    __m128i vi =3D _mm_loadu_si128((const __m128i_u *)i);
> +    __m128i vk =3D _mm_loadu_si128((const __m128i_u *)k);
> +
> +    vi =3D _mm_aesenc_si128(vi, vk);
> +
> +    _mm_storeu_si128((__m128i_u *)o, vi);
> +    return true;
> +}
> +
> +static bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
> +{
> +    __m128i vi =3D _mm_loadu_si128((const __m128i_u *)i);
> +
> +    /* aesdeclast also adds round key, so supply zero. */
> +    vi =3D _mm_aesdeclast_si128(vi, _mm_setzero_si128());
> +
> +    _mm_storeu_si128((__m128i_u *)o, vi);
> +    return true;
> +}
> +
> +static bool test_IMC(uint8_t *o, const uint8_t *i)
> +{
> +    __m128i vi =3D _mm_loadu_si128((const __m128i_u *)i);
> +
> +    vi =3D _mm_aesimc_si128(vi);
> +
> +    _mm_storeu_si128((__m128i_u *)o, vi);
> +    return true;
> +}
> +
> +static bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint=
8_t *k)
> +{
> +    return false;
> +}
> +
> +static bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint=
8_t *k)
> +{
> +    __m128i vi =3D _mm_loadu_si128((const __m128i_u *)i);
> +    __m128i vk =3D _mm_loadu_si128((const __m128i_u *)k);
> +
> +    vi =3D _mm_aesdec_si128(vi, vk);
> +
> +    _mm_storeu_si128((__m128i_u *)o, vi);
> +    return true;
> +}
> diff --git a/tests/tcg/ppc64/test-aes.c b/tests/tcg/ppc64/test-aes.c
> new file mode 100644
> index 0000000000..1d2be488e9
> --- /dev/null
> +++ b/tests/tcg/ppc64/test-aes.c
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include "../multiarch/test-aes-main.c.inc"
> +
> +#undef BIG_ENDIAN
> +#define BIG_ENDIAN  (__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__)
> +
> +static unsigned char bswap_le[16] __attribute__((aligned(16))) =3D {
> +    8,9,10,11,12,13,14,15,
> +    0,1,2,3,4,5,6,7
> +};
> +
> +bool test_SB_SR(uint8_t *o, const uint8_t *i)
> +{
> +    /* vcipherlast also adds round key, so supply zero. */
> +    if (BIG_ENDIAN) {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "vspltisb 1,0\n\t"
> +            "vcipherlast 0,0,1\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i) : "memory", "v0", "v1");
> +    } else {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 34,0,%2\n\t"
> +            "vspltisb 1,0\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "vcipherlast 0,0,1\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(bswap_le) : "memory", "v0", "v1", "v=
2");
> +    }
> +    return true;
> +}
> +
> +bool test_MC(uint8_t *o, const uint8_t *i)
> +{
> +    return false;
> +}
> +
> +bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    if (BIG_ENDIAN) {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 33,0,%2\n\t"
> +            "vcipher 0,0,1\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(k) : "memory", "v0", "v1");
> +    } else {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 33,0,%2\n\t"
> +            "lxvd2x 34,0,%3\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "vperm 1,1,1,2\n\t"
> +            "vcipher 0,0,1\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(k), "r"(bswap_le)
> +              : "memory", "v0", "v1", "v2");
> +    }
> +    return true;
> +}
> +
> +bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
> +{
> +    /* vcipherlast also adds round key, so supply zero. */
> +    if (BIG_ENDIAN) {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "vspltisb 1,0\n\t"
> +            "vncipherlast 0,0,1\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i) : "memory", "v0", "v1");
> +    } else {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 34,0,%2\n\t"
> +            "vspltisb 1,0\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "vncipherlast 0,0,1\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(bswap_le) : "memory", "v0", "v1", "v=
2");
> +    }
> +    return true;
> +}
> +
> +bool test_IMC(uint8_t *o, const uint8_t *i)
> +{
> +    return false;
> +}
> +
> +bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    if (BIG_ENDIAN) {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 33,0,%2\n\t"
> +            "vncipher 0,0,1\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(k) : "memory", "v0", "v1");
> +    } else {
> +        asm("lxvd2x 32,0,%1\n\t"
> +            "lxvd2x 33,0,%2\n\t"
> +            "lxvd2x 34,0,%3\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "vperm 1,1,1,2\n\t"
> +            "vncipher 0,0,1\n\t"
> +            "vperm 0,0,0,2\n\t"
> +            "stxvd2x 32,0,%0"
> +            : : "r"(o), "r"(i), "r"(k), "r"(bswap_le)
> +              : "memory", "v0", "v1", "v2");
> +    }
> +    return true;
> +}
> +
> +bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    return false;
> +}
> diff --git a/tests/tcg/riscv64/test-aes.c b/tests/tcg/riscv64/test-aes.c
> new file mode 100644
> index 0000000000..3d7ef0e33a
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-aes.c
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include "../multiarch/test-aes-main.c.inc"
> +
> +bool test_SB_SR(uint8_t *o, const uint8_t *i)
> +{
> +    uint64_t *o8 =3D (uint64_t *)o;
> +    const uint64_t *i8 =3D (const uint64_t *)i;
> +
> +    asm("aes64es %0,%2,%3\n\t"
> +        "aes64es %1,%3,%2"
> +        : "=3D&r"(o8[0]), "=3D&r"(o8[1]) : "r"(i8[0]), "r"(i8[1]));
> +    return true;
> +}
> +
> +bool test_MC(uint8_t *o, const uint8_t *i)
> +{
> +    return false;
> +}
> +
> +bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    uint64_t *o8 =3D (uint64_t *)o;
> +    const uint64_t *i8 =3D (const uint64_t *)i;
> +    const uint64_t *k8 =3D (const uint64_t *)k;
> +
> +    asm("aes64esm %0,%2,%3\n\t"
> +        "aes64esm %1,%3,%2\n\t"
> +        "xor %0,%0,%4\n\t"
> +        "xor %1,%1,%5"
> +        : "=3D&r"(o8[0]), "=3D&r"(o8[1])
> +        : "r"(i8[0]), "r"(i8[1]), "r"(k8[0]), "r"(k8[1]));
> +    return true;
> +}
> +
> +bool test_ISB_ISR(uint8_t *o, const uint8_t *i)
> +{
> +    uint64_t *o8 =3D (uint64_t *)o;
> +    const uint64_t *i8 =3D (const uint64_t *)i;
> +
> +    asm("aes64ds %0,%2,%3\n\t"
> +        "aes64ds %1,%3,%2"
> +        : "=3D&r"(o8[0]), "=3D&r"(o8[1]) : "r"(i8[0]), "r"(i8[1]));
> +    return true;
> +}
> +
> +bool test_IMC(uint8_t *o, const uint8_t *i)
> +{
> +    uint64_t *o8 =3D (uint64_t *)o;
> +    const uint64_t *i8 =3D (const uint64_t *)i;
> +
> +    asm("aes64im %0,%0\n\t"
> +        "aes64im %1,%1"
> +        : "=3Dr"(o8[0]), "=3Dr"(o8[1]) : "0"(i8[0]), "1"(i8[1]));
> +    return true;
> +}
> +
> +bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    return false;
> +}
> +
> +bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint8_t *k)
> +{
> +    uint64_t *o8 =3D (uint64_t *)o;
> +    const uint64_t *i8 =3D (const uint64_t *)i;
> +    const uint64_t *k8 =3D (const uint64_t *)k;
> +
> +    asm("aes64dsm %0,%2,%3\n\t"
> +        "aes64dsm %1,%3,%2\n\t"
> +        "xor %0,%0,%4\n\t"
> +        "xor %1,%1,%5"
> +        : "=3D&r"(o8[0]), "=3D&r"(o8[1])
> +        : "r"(i8[0]), "r"(i8[1]), "r"(k8[0]), "r"(k8[1]));
> +    return true;
> +}
> diff --git a/tests/tcg/multiarch/test-aes-main.c.inc b/tests/tcg/multiarc=
h/test-aes-main.c.inc
> new file mode 100644
> index 0000000000..0039f8ba55
> --- /dev/null
> +++ b/tests/tcg/multiarch/test-aes-main.c.inc
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +
> +static bool test_SB_SR(uint8_t *o, const uint8_t *i);
> +static bool test_MC(uint8_t *o, const uint8_t *i);
> +static bool test_SB_SR_MC_AK(uint8_t *o, const uint8_t *i, const uint8_t=
 *k);
> +
> +static bool test_ISB_ISR(uint8_t *o, const uint8_t *i);
> +static bool test_IMC(uint8_t *o, const uint8_t *i);
> +static bool test_ISB_ISR_AK_IMC(uint8_t *o, const uint8_t *i, const uint=
8_t *k);
> +static bool test_ISB_ISR_IMC_AK(uint8_t *o, const uint8_t *i, const uint=
8_t *k);
> +
> +/*
> + * From https://doi.org/10.6028/NIST.FIPS.197-upd1,
> + * Appendix B -- Cipher Example
> + *
> + * Note that the formatting of the 4x4 matrices in the document is
> + * column-major, whereas C is row-major.  Therefore to get the bytes
> + * in the same order as the text, the matrices are transposed.
> + *
> + * Note that we are not going to test SubBytes or ShiftRows separately,
> + * so the "After SubBytes" column is omitted, using only the combined
> + * result "After ShiftRows" column.
> + */
> +
> +/* Ease the inline assembly by aligning everything. */
> +typedef struct {
> +    uint8_t b[16] __attribute__((aligned(16)));
> +} State;
> +
> +typedef struct {
> +    State start, after_sr, after_mc, round_key;
> +} Round;
> +
> +static const Round rounds[] =3D {
> +    /* Round 1 */
> +    { { { 0x19, 0x3d, 0xe3, 0xbe,       /* start */
> +          0xa0, 0xf4, 0xe2, 0x2b,
> +          0x9a, 0xc6, 0x8d, 0x2a,
> +          0xe9, 0xf8, 0x48, 0x08, } },
> +
> +      { { 0xd4, 0xbf, 0x5d, 0x30,       /* after shiftrows */
> +          0xe0, 0xb4, 0x52, 0xae,
> +          0xb8, 0x41, 0x11, 0xf1,
> +          0x1e, 0x27, 0x98, 0xe5, } },
> +
> +      { { 0x04, 0x66, 0x81, 0xe5,       /* after mixcolumns */
> +          0xe0, 0xcb, 0x19, 0x9a,
> +          0x48, 0xf8, 0xd3, 0x7a,
> +          0x28, 0x06, 0x26, 0x4c, } },
> +
> +      { { 0xa0, 0xfa, 0xfe, 0x17,       /* round key */
> +          0x88, 0x54, 0x2c, 0xb1,
> +          0x23, 0xa3, 0x39, 0x39,
> +          0x2a, 0x6c, 0x76, 0x05, } } },
> +
> +    /* Round 2 */
> +    { { { 0xa4, 0x9c, 0x7f, 0xf2,       /* start */
> +          0x68, 0x9f, 0x35, 0x2b,
> +          0x6b, 0x5b, 0xea, 0x43,
> +          0x02, 0x6a, 0x50, 0x49, } },
> +
> +      { { 0x49, 0xdb, 0x87, 0x3b,       /* after shiftrows */
> +          0x45, 0x39, 0x53, 0x89,
> +          0x7f, 0x02, 0xd2, 0xf1,
> +          0x77, 0xde, 0x96, 0x1a, } },
> +
> +      { { 0x58, 0x4d, 0xca, 0xf1,       /* after mixcolumns */
> +          0x1b, 0x4b, 0x5a, 0xac,
> +          0xdb, 0xe7, 0xca, 0xa8,
> +          0x1b, 0x6b, 0xb0, 0xe5, } },
> +
> +      { { 0xf2, 0xc2, 0x95, 0xf2,       /* round key */
> +          0x7a, 0x96, 0xb9, 0x43,
> +          0x59, 0x35, 0x80, 0x7a,
> +          0x73, 0x59, 0xf6, 0x7f, } } },
> +
> +    /* Round 3 */
> +    { { { 0xaa, 0x8f, 0x5f, 0x03,       /* start */
> +          0x61, 0xdd, 0xe3, 0xef,
> +          0x82, 0xd2, 0x4a, 0xd2,
> +          0x68, 0x32, 0x46, 0x9a, } },
> +
> +      { { 0xac, 0xc1, 0xd6, 0xb8,       /* after shiftrows */
> +          0xef, 0xb5, 0x5a, 0x7b,
> +          0x13, 0x23, 0xcf, 0xdf,
> +          0x45, 0x73, 0x11, 0xb5, } },
> +
> +      { { 0x75, 0xec, 0x09, 0x93,       /* after mixcolumns */
> +          0x20, 0x0b, 0x63, 0x33,
> +          0x53, 0xc0, 0xcf, 0x7c,
> +          0xbb, 0x25, 0xd0, 0xdc, } },
> +
> +      { { 0x3d, 0x80, 0x47, 0x7d,       /* round key */
> +          0x47, 0x16, 0xfe, 0x3e,
> +          0x1e, 0x23, 0x7e, 0x44,
> +          0x6d, 0x7a, 0x88, 0x3b, } } },
> +};
> +
> +static void verify_log(const char *prefix, const State *s)
> +{
> +    printf("%s:", prefix);
> +    for (int i =3D 0; i < sizeof(State); ++i) {
> +        printf(" %02x", s->b[i]);
> +    }
> +    printf("\n");
> +}
> +
> +static void verify(const State *ref, const State *tst, const char *which)
> +{
> +    if (!memcmp(ref, tst, sizeof(State))) {
> +        return;
> +    }
> +
> +    printf("Mismatch on %s\n", which);
> +    verify_log("ref", ref);
> +    verify_log("tst", tst);
> +    exit(EXIT_FAILURE);
> +}
> +
> +int main()
> +{
> +    int i, n =3D sizeof(rounds) / sizeof(Round);
> +    State t;
> +
> +    for (i =3D 0; i < n; ++i) {
> +        if (test_SB_SR(t.b, rounds[i].start.b)) {
> +            verify(&rounds[i].after_sr, &t, "SB+SR");
> +        }
> +    }
> +
> +    for (i =3D 0; i < n; ++i) {
> +        if (test_MC(t.b, rounds[i].after_sr.b)) {
> +            verify(&rounds[i].after_mc, &t, "MC");
> +        }
> +    }
> +
> +    /* The kernel of Cipher(). */
> +    for (i =3D 0; i < n - 1; ++i) {
> +        if (test_SB_SR_MC_AK(t.b, rounds[i].start.b, rounds[i].round_key=
.b)) {
> +            verify(&rounds[i + 1].start, &t, "SB+SR+MC+AK");
> +        }
> +    }
> +
> +    for (i =3D 0; i < n; ++i) {
> +        if (test_ISB_ISR(t.b, rounds[i].after_sr.b)) {
> +            verify(&rounds[i].start, &t, "ISB+ISR");
> +        }
> +    }
> +
> +    for (i =3D 0; i < n; ++i) {
> +        if (test_IMC(t.b, rounds[i].after_mc.b)) {
> +            verify(&rounds[i].after_sr, &t, "IMC");
> +        }
> +    }
> +
> +    /* The kernel of InvCipher(). */
> +    for (i =3D n - 1; i > 0; --i) {
> +        if (test_ISB_ISR_AK_IMC(t.b, rounds[i].after_sr.b,
> +                                rounds[i - 1].round_key.b)) {
> +            verify(&rounds[i - 1].after_sr, &t, "ISB+ISR+AK+IMC");
> +        }
> +    }
> +
> +    /*
> +     * The kernel of EqInvCipher().=20=20
> +     * We must compute a different round key: apply InvMixColumns to
> +     * the standard round key, per KeyExpansion vs KeyExpansionEIC.
> +     */
> +    for (i =3D 1; i < n; ++i) {
> +        if (test_IMC(t.b, rounds[i - 1].round_key.b) &&
> +            test_ISB_ISR_IMC_AK(t.b, rounds[i].after_sr.b, t.b)) {
> +            verify(&rounds[i - 1].after_sr, &t, "ISB+ISR+IMC+AK");
> +        }
> +    }
> +
> +    return EXIT_SUCCESS;
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 3430fd3cd8..d217474d0d 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -74,6 +74,10 @@ endif
>  AARCH64_TESTS +=3D sve-ioctls
>  sve-ioctls: CFLAGS+=3D-march=3Darmv8.1-a+sve
>=20=20
> +AARCH64_TESTS +=3D test-aes
> +test-aes: CFLAGS +=3D -O -march=3Darmv8-a+aes
> +test-aes: test-aes-main.c.inc
> +
>  # Vector SHA1
>  sha1-vector: CFLAGS=3D-O3
>  sha1-vector: sha1.c
> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.tar=
get
> index 821822ed0c..3ba61e3880 100644
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -28,6 +28,10 @@ run-test-i386-bmi2: QEMU_OPTS +=3D -cpu max
>  test-i386-adcox: CFLAGS=3D-O2
>  run-test-i386-adcox: QEMU_OPTS +=3D -cpu max
>=20=20
> +test-aes: CFLAGS +=3D -O -msse2 -maes
> +test-aes: test-aes-main.c.inc
> +run-test-aes: QEMU_OPTS +=3D -cpu max
> +
>  #
>  # hello-i386 is a barebones app
>  #
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
> index b084963b9a..5721c159f2 100644
> --- a/tests/tcg/ppc64/Makefile.target
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -36,5 +36,6 @@ run-vector: QEMU_OPTS +=3D -cpu POWER10
>=20=20
>  PPC64_TESTS +=3D signal_save_restore_xer
>  PPC64_TESTS +=3D xxspltw
> +PPC64_TESTS +=3D test-aes
>=20=20
>  TESTS +=3D $(PPC64_TESTS)
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefi=
le.target
> index 9973ba3b5f..4002d14b9e 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -9,3 +9,7 @@ TESTS +=3D noexec
>  TESTS +=3D test-noc
>  test-noc: LDFLAGS =3D -nostdlib -static
>  run-test-noc: QEMU_OPTS +=3D -cpu rv64,c=3Dfalse
> +
> +TESTS +=3D test-aes
> +test-aes: CFLAGS +=3D -O -march=3Drv64gzk
> +run-test-aes: QEMU_OPTS +=3D -cpu rv64,zk=3Don


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

