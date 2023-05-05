Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuSY-0005L0-3l
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuST-0005KK-6l
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:22:45 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuSF-0000iU-NR
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:22:44 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2575579a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289350; x=1685881350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qPCyVI9kr62LNVgR4MbqahLwPDo/qYs+kZjMEDVEdgs=;
 b=c3/VtSjrE8eDpQLHbaU8mXFdQUcrP2PAssHxyJZRDf+eEafZC4C2BGhqJmtrRZx/Go
 Qim6W1WVIdSD9dQ3lfl/IqXocrhAHwRLX6q3BJeYref1EJ+gMQ0lnLhKdMpvHvm2Xuim
 GLMTsU8DK7zeavvsM1cXrMvMXQCN9UaP4B7FBCXzFnqEWNHDI+HXzuJYe4v+JkMo9rMH
 UUpQcdQua2xCzssBPVLA0DJBHHDgWnNzM4Oj7s71u0kOZNXtZFfht6GS8ufCZqCG3Slk
 1DXbLZjDlIVrWHQA81QSRT8RA9MfWZaWfEEegnEsKXbekjdP1ElYPbYVMZ2Osnb7b9IF
 XTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289350; x=1685881350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPCyVI9kr62LNVgR4MbqahLwPDo/qYs+kZjMEDVEdgs=;
 b=I82qHI6F4pxUL9raCjtcz5HvKkDUAcLZ/7sFbLxWhkUzEiGcNll66mot075nX7u3Lb
 ZXAMvZeBIF1dTGLSY0PB15RCfl3gEo31dyg9Etb/NGADvMB8nsdMnSpOjcyNEdbhW7Sg
 h+ivJ72HKEA3EQ4qxMGRO5GrogYnHgpnvajnKSmMC8zGZKGK4gaZ7m+qW0p0RKrI4y2P
 WlV5sa7rbD3RIXfZJK33DFnaLl6dnFIv/rAhq2qt9i0QQ5nFL6HrNdJqqJcuwu3FXZPH
 y4HDOz5aCTQMo3T8pgD2jddYMFFL9Nz3xRXO3RusYjM818Fv0efbBDr7cCYauH0yQ5DV
 5vJw==
X-Gm-Message-State: AC+VfDxTpwtJvXOOMV2uUH0e5tzJmS3FnxYijR86MyUGUhW/+tdDETa1
 iXlVUZWC4Ga6acY3cSTbNFY2xPsrdZkGtsMNvf8cdA==
X-Google-Smtp-Source: ACHHUZ7LBOByzBwKvAALCVKb2H6FJrXHwfe1n8dGGTzOXfudUqHClVQTjJnZCiMZJUxAr874wJXprR45Tva5szrHsyw=
X-Received: by 2002:a05:6402:2044:b0:50b:c77e:b071 with SMTP id
 bc4-20020a056402204400b0050bc77eb071mr1316111edb.18.1683289349953; Fri, 05
 May 2023 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-33-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:22:19 +0100
Message-ID: <CAFEAcA-mFD2-GJxOwq5Zkb0DGh_ONOxAP7NuB5WOPUGAASihNw@mail.gmail.com>
Subject: Re: [PATCH v4 32/57] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 12:22:46 -0000

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is unsigned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index 2e6127d506..e244209890 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -399,22 +399,18 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
>      tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
>  }
>
> +/* A 13-bit constant sign-extended to 64 bits.  */

This should have been in the previous patch, I think ?

>  static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
>  {
>      tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
>  }
>
> -static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
> +/* A 32-bit constant zero-extended to 64 bits.  */
> +static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
>  {
> -    if (check_fit_i32(arg, 13)) {
> -        /* A 13-bit constant sign-extended to 64-bits.  */
> -        tcg_out_movi_s13(s, ret, arg);
> -    } else {
> -        /* A 32-bit constant zero-extended to 64 bits.  */
> -        tcg_out_sethi(s, ret, arg);
> -        if (arg & 0x3ff) {
> -            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
> -        }
> +    tcg_out_sethi(s, ret, arg);
> +    if (arg & 0x3ff) {
> +        tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
>      }
>  }

More code changes in a patch that says it's a rename-only.

-- PMM

