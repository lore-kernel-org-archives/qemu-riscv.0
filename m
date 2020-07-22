Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyD2f-0002oO-UO
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 07:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyD2e-0002ma-BX
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 07:36:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyD2Z-0001kl-RP
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 07:36:07 -0400
Received: by mail-wm1-x342.google.com with SMTP id w3so1650358wmi.4
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 04:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=nqpzWMhWw0dhfht62G9L5GK/ukksDN1KydO+4r1lkpA=;
 b=TnghUyLF4GYmWwcAPstMegspXO+hDGs6C8EqAggFMyZdT2C26Bq2em7Fq94m8wfS0U
 hiTWS97bPD9jX41TMxUJvnRDNPxiKKMOOlcrMpIQnV1NCkDD5Zu7vMz5m4JDCKgsv3CH
 Lax8gyVa9Sw4Zw4CH0M9/F+qvSKhbQCwTCpBD4atkks6xldTIuLmlmoGtuATlltwWbFo
 OFFTzPpeYmdjyC1Hc0jYLoPs2c+kIAcJa/J2YDYsVWZOxC592ok+FaILT5hrC9JWzdRq
 miikaQ4ZBVLXWEHTLc0RmjxupOaHq0lhL6CxxpVqN8uh5LXArDEZS/Nuale4WHWguzAl
 zRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=nqpzWMhWw0dhfht62G9L5GK/ukksDN1KydO+4r1lkpA=;
 b=hhmVifAtYmpHqvZC4nR5er/owinkySUUHs/ykizJp3Mk6v0p3z3rjcmhrcW69K+Sqp
 P0QMjZIxjT1xeZ3FBqGBHqy65IWixmZGOxkDnIx4MInnwIcdfWcEkgv54PTeuGGr9h1o
 V+q8E/SVDoB1D0+bUx9Ce9N6WMsU13Uv2JHJzYdkOClCyf6ztX3+AfiALhUuxbllluC0
 kGpEZhAXR2JfLvNGTYLnX4tB0V9Qsxd5LbB2dxd3mDqZ9yaMGDdGKWEOJ6srwx2rhj6w
 Pqox7Ujf+45Ntgo7QdynLgb0ltkI6NRjk7J+KPimdBpgtDDfpumloMrKdwsrBtXX0Ijo
 ft7A==
X-Gm-Message-State: AOAM530Tkcmwi38Mz8E/AWkXIMDfErcbjwVtvjKeuN2bOpuBZPKAJBvE
 dKJYpDtjisY2aJmxhUXgy7nMwg==
X-Google-Smtp-Source: ABdhPJy2a9+CyWGsd4In5tL8svUAMt2uXfti0PjAWR7hhGVzdr0LX6VK9CVIal/se9wOZgsvFoTbIQ==
X-Received: by 2002:a1c:2ec4:: with SMTP id u187mr8088119wmu.188.1595417760663; 
 Wed, 22 Jul 2020 04:36:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm42335896wro.71.2020.07.22.04.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 04:35:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4448D1FF7E;
 Wed, 22 Jul 2020 12:35:58 +0100 (BST)
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-53-frank.chang@sifive.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Kito Cheng
 <kito.cheng@sifive.com>, Chih-Min Chao <chihmin.chao@sifive.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v2 52/76] fpu: implement full set compare for fp16
In-reply-to: <20200722091641.8834-53-frank.chang@sifive.com>
Date: Wed, 22 Jul 2020 12:35:58 +0100
Message-ID: <87tuxzu6ht.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 11:36:08 -0000


frank.chang@sifive.com writes:

> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  fpu/softfloat.c         | 28 ++++++++++++++++++++++++++++
>  include/fpu/softfloat.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 79be4f5840..9c6640862e 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -401,6 +401,34 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
>      return soft(ua.s, ub.s, s);
>  }
>=20=20
> +/*----------------------------------------------------------------------=
------
> +| Returns the fraction bits of the half-precision floating-point value `=
a'.
> +*-----------------------------------------------------------------------=
-----*/
> +
> +static inline uint32_t extractFloat16Frac(float16 a)
> +{
> +    return float16_val(a) & 0x3ff;
> +}
> +
> +/*----------------------------------------------------------------------=
------
> +| Returns the exponent bits of the half-precision floating-point value `=
a'.
> +*-----------------------------------------------------------------------=
-----*/
> +
> +static inline int extractFloat16Exp(float16 a)
> +{
> +    return (float16_val(a) >> 10) & 0x1f;
> +}
> +
> +/*----------------------------------------------------------------------=
------
> +| Returns the sign bit of the half-precision floating-point value `a'.
> +*-----------------------------------------------------------------------=
-----*/
> +
> +static inline bool extractFloat16Sign(float16 a)
> +{
> +    return float16_val(a) >> 15;
> +}
> +
> +

There functions are no longer needed as float16_compare uses the
decompose code to get what it wants.

>  /*----------------------------------------------------------------------=
------
>  | Returns the fraction bits of the single-precision floating-point value=
 `a'.
>  *-----------------------------------------------------------------------=
-----*/
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index ff4e2605b1..267519cd65 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -285,6 +285,47 @@ static inline float16 float16_set_sign(float16 a, in=
t sign)
>      return make_float16((float16_val(a) & 0x7fff) | (sign << 15));
>  }
>=20=20
> +static inline bool float16_eq(float16 a, float16 b, float_status *s)
> +{
> +    return float16_compare(a, b, s) =3D=3D float_relation_equal;
> +}
> +
> +static inline bool float16_le(float16 a, float16 b, float_status *s)
> +{
> +    return float16_compare(a, b, s) <=3D float_relation_equal;
> +}
> +
> +static inline bool float16_lt(float16 a, float16 b, float_status *s)
> +{
> +    return float16_compare(a, b, s) < float_relation_equal;
> +}
> +
> +static inline bool float16_unordered(float16 a, float16 b, float_status =
*s)
> +{
> +    return float16_compare(a, b, s) =3D=3D float_relation_unordered;
> +}
> +
> +static inline bool float16_eq_quiet(float16 a, float16 b, float_status *=
s)
> +{
> +    return float16_compare_quiet(a, b, s) =3D=3D float_relation_equal;
> +}
> +
> +static inline bool float16_le_quiet(float16 a, float16 b, float_status *=
s)
> +{
> +    return float16_compare_quiet(a, b, s) <=3D float_relation_equal;
> +}
> +
> +static inline bool float16_lt_quiet(float16 a, float16 b, float_status *=
s)
> +{
> +    return float16_compare_quiet(a, b, s) < float_relation_equal;
> +}
> +
> +static inline bool float16_unordered_quiet(float16 a, float16 b,
> +                                           float_status *s)
> +{
> +    return float16_compare_quiet(a, b, s) =3D=3D float_relation_unordere=
d;
> +}
> +
>  #define float16_zero make_float16(0)
>  #define float16_half make_float16(0x3800)
>  #define float16_one make_float16(0x3c00)

The rest looks fine. With the extra functions removed:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

