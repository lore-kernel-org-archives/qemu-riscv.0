Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pusuW-00039K-Ce
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusuU-00038Q-Tm
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:43:35 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusuS-0007Wp-8N
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:43:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso2886036a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283411; x=1685875411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoFlwzXN5mH9Aj4KpFXV88viAD32yd1whvy9VzDa++8=;
 b=mAKTKDoa/DsDFkSslH03pkeF4BZpp9EWMW24cX6a5/AKA9oSRTQwhwAhEEZWJnvWgl
 S8u3sSX9AAyFoomqHZKELGb+/0IYo6fv0u/ErIUcURLigeFA42Ouz6iU58muKNGqbOpB
 dDiMiVNimE8i/dCNC0qP/l/9gW+FyDql7tgN3KYpvonoq5VIJRE6GSsoTGkPRiKc7qvx
 YQHLLIqRGTklsvGmSQa8EmL/U5x5xFm62aY8cvCO12jDE6aniHwFhcEii6JqOdCl7qNC
 dNXi1bsUKdXMFmIZL3Df95jg+hFwOOLGSf9qNcYHg+f0aH9oPVcz3kRzn7pMy58e0RKi
 7QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283411; x=1685875411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoFlwzXN5mH9Aj4KpFXV88viAD32yd1whvy9VzDa++8=;
 b=Kh/xpbpqKC4u2sBLbnpOk6xud2ivWzenirf5xY7bpQiXNvllPqSrT+5LYMV3ghJoeD
 YpWrI8rsGxciQHRH3nbWBAL8RpmeKcS1VEgsjyeGI4B2BUGO4HzBHLcJUIn/aYdh+Lb+
 N5hLM2TpZrgTglp2q/luribobdE+wXRmxW4K3vJIFatMl6Z1DqgVNEE8f+2t0R9+V7Fy
 Ah1mIyKb9hQDLVqavpoyj9GApszC0EFo46ue0GT9OgklWRvVZtLUjSSaltDb/uYgv4DL
 6epnsLfU89kftP7KRXieTn9UG96NWUyuysvOBPExumG9Iw9ETV6x67RX+0r5W0YPB5gz
 qlfg==
X-Gm-Message-State: AC+VfDzosDqgvNdSkZIfG7yu8vB/EZBBevBGLTNMvu0JlGdof5M4tRM3
 fUKt/WhJTqUfWyc5JyJcnoUDqaPQZcJdxlbr5sgX0g==
X-Google-Smtp-Source: ACHHUZ7OlZqBCgw1LNirBvQkahUBqOz2NHXn5wyiCmSMCAM9ruLxw+vNlt6oseN2adqngkwJ/CiRey1xMbS/GnL2Bg0=
X-Received: by 2002:aa7:d54c:0:b0:509:c6e6:c002 with SMTP id
 u12-20020aa7d54c000000b00509c6e6c002mr971466edr.39.1683283410624; Fri, 05 May
 2023 03:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-19-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:43:19 +0100
Message-ID: <CAFEAcA-sXLdmmoHTfsCrPEDQvxczh10tLwcFC1qB05UV2Y1ziQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/57] tcg/aarch64: Detect have_lse,
 have_lse2 for darwin
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Fri, 05 May 2023 10:43:35 -0000

On Wed, 3 May 2023 at 08:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These features are present for Apple M1.
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +#ifdef CONFIG_DARWIN
> +static bool sysctl_for_bool(const char *name)
> +{
> +    int val =3D 0;
> +    size_t len =3D sizeof(val);
> +
> +    if (sysctlbyname(name, &val, &len, NULL, 0) =3D=3D 0) {
> +        return val !=3D 0;
> +    }
> +
> +    /*
> +     * We might in ask for properties not present in older kernels,

"might in ask" is a typo for something, but I'm not sure what.

> +     * but we're only asking about static properties, all of which
> +     * should be 'int'.  So we shouln't see ENOMEM (val too small),
> +     * or any of the other more exotic errors.
> +     */
> +    assert(errno =3D=3D ENOENT);
> +    return false;
> +}
> +#endif

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

