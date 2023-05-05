Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puslY-0002KP-MH
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puslX-0002K2-07
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:34:19 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puslR-0003pU-Uc
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:34:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so3040840a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683282852; x=1685874852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HehyRZ2RNRo6V2X14vMDa6iRe3yLHGMx7sSxA2v9qUw=;
 b=vX5he42ewGq0C/Nm2kbS1CnWGPCx6BHWW3m3aEjBdPArrnbN0DMLio7hHruUtLDWng
 OghoFMSRPmM0XdYTU+BTVFBqWH6GNgdr1vl1jHwC5SAfCxGOqKM+DTRclutDrdIA7isd
 lwTgrZ3JIs+ZXp0n0aZmjQNlvqYSMeP8h8SD6alVFOBCZi9s2T7hA29hco1PYQcE9cS6
 bEeqv2EJIc8pqkb22h4EV473P8esGi4+f+hqbpzFHj9glElj6apvbT+vO0Mne1Tg83oQ
 4fcfVTX9FkgyJZlZRQxwI5aE2EA49AzeyWvVL4TzWq7cu6wdD1qw+gidBMgRg+rKlicu
 rwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683282852; x=1685874852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HehyRZ2RNRo6V2X14vMDa6iRe3yLHGMx7sSxA2v9qUw=;
 b=Dp+jcDBxTFVXe9jCaFxRyTVtBg8guOtRNfnLmmHXfUOdCAJCxTBdPPbFJtMkiUCFy6
 cYuKyHES74/gUbgAq7JgHZ34taULXa5EKUkpMjxlqcLcKyqGDb5q4/aRINTS9+Qa54X/
 yOsRwANGWmATze+0IpVw9r7siFV4YqpBMUhSoiaKDHkxfSYLrnrrmMhIEZOcIQiqvlX7
 tz4ZDEOh1YRW47mD3l4uunYuMN59j+Jy56UurmVZnZ8Ejy+c1jl1wb530xTjcqBj9eBv
 oNyX53yuV1CQyXoo+ZHkQkCmFscrtQhG9zogpWO1HoibirwJJj8O79xkVfRnegrHrzKY
 jZiQ==
X-Gm-Message-State: AC+VfDzbbZ2tkYSbfCPS5gl5PU3gJBnginLTDNR9SBcB+4t2e6t4/eSI
 oJCaQQpAX86zKm6Ac5WYzTOdVdJ8JhHJOfGC59sbtw==
X-Google-Smtp-Source: ACHHUZ6eYEcfNif0ObYBNTSFoadn4soOFH5UEXLM5ZMGleeE4tgy6EqEb8CTJG8aEMmt2Ytl1qmkV39WOw2wvkcEke0=
X-Received: by 2002:aa7:cf16:0:b0:50b:f654:8846 with SMTP id
 a22-20020aa7cf16000000b0050bf6548846mr858995edy.19.1683282852406; Fri, 05 May
 2023 03:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-15-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:34:01 +0100
Message-ID: <CAFEAcA_BMbNPYEoHacYk5ETJp6N9b8NKQvnZvfgrsDhH6yDOdw@mail.gmail.com>
Subject: Re: [PATCH v4 14/57] tcg/i386: Add have_atomic16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 10:34:19 -0000

On Wed, 3 May 2023 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
> The new variable will also be used in generated code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/cpuid.h      | 18 ++++++++++++++++++
>  tcg/i386/tcg-target.h     |  1 +
>  tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>
> diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
> index 1451e8ef2f..35325f1995 100644
> --- a/include/qemu/cpuid.h
> +++ b/include/qemu/cpuid.h
> @@ -71,6 +71,24 @@
>  #define bit_LZCNT       (1 << 5)
>  #endif
>
> +/*
> + * Signatures for different CPU implementations as returned from Leaf 0.
> + */
> +
> +#ifndef signature_INTEL_ecx
> +/* "Genu" "ineI" "ntel" */
> +#define signature_INTEL_ebx     0x756e6547
> +#define signature_INTEL_edx     0x49656e69
> +#define signature_INTEL_ecx     0x6c65746e
> +#endif
> +
> +#ifndef signature_AMD_ecx
> +/* "Auth" "enti" "cAMD" */
> +#define signature_AMD_ebx       0x68747541
> +#define signature_AMD_edx       0x69746e65
> +#define signature_AMD_ecx       0x444d4163
> +#endif

> @@ -4024,6 +4025,32 @@ static void tcg_target_init(TCGContext *s)
>                      have_avx512dq =3D (b7 & bit_AVX512DQ) !=3D 0;
>                      have_avx512vbmi2 =3D (c7 & bit_AVX512VBMI2) !=3D 0;
>                  }
> +
> +                /*
> +                 * The Intel SDM has added:
> +                 *   Processors that enumerate support for Intel=C2=AE A=
VX
> +                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit =
28])
> +                 *   guarantee that the 16-byte memory operations perfor=
med
> +                 *   by the following instructions will always be carrie=
d
> +                 *   out atomically:
> +                 *   - MOVAPD, MOVAPS, and MOVDQA.
> +                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with V=
EX.128.
> +                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when e=
ncoded
> +                 *     with EVEX.128 and k0 (masking disabled).
> +                 * Note that these instructions require the linear addre=
sses
> +                 * of their memory operands to be 16-byte aligned.
> +                 *
> +                 * AMD has provided an even stronger guarantee that proc=
essors
> +                 * with AVX provide 16-byte atomicity for all cachable,
> +                 * naturally aligned single loads and stores, e.g. MOVDQ=
U.
> +                 *
> +                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10=
4688
> +                 */
> +                if (have_avx1) {
> +                    __cpuid(0, a, b, c, d);
> +                    have_atomic16 =3D (c =3D=3D signature_INTEL_ecx ||
> +                                     c =3D=3D signature_AMD_ecx);
> +                }

If the signature is 3 words why are we only checking one here ?

thanks
-- PMM

