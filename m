Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1purkd-0006Wi-3E
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 05:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purkc-0006W2-Bx
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:29:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purkZ-0007T6-LB
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 05:29:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso2615122a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683278955; x=1685870955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2gGeqvfK9F8Jd3DrHbnl2FNriX0MKsW9BqFzfFd0Ww=;
 b=pcFOf46VUTqNQ5u7sIZEvYzovBmd73vjId1ekEyum0lQxU66RNyuynzQQPA4kFJJeq
 XVwrIs1NXJl5TiD4G86uTJPex31+109Mtv3g2YwETLebbvDEsbMla8pcrtyH100cOgdT
 z6ZFI0JuOZe5HraJ4pyYfPaNba8+XGxP2HxmcKSXxSYVGMTtib55cbfHUZW/STLy11Qf
 uXWQROZQsD/IrReNYI4me+Q/G0CVmtgvJb0vct0LIueRHhxCewzZL4jwGd/lY4/QSAR4
 S7vsk0TIUVz4mDVRzyRXFpgNKNi6j6XKu+PgL7dDnuowXH/Ad/o7lc5Lx1ItPOPhLLif
 Gl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683278955; x=1685870955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2gGeqvfK9F8Jd3DrHbnl2FNriX0MKsW9BqFzfFd0Ww=;
 b=XcQsJCZTwg8rxP3hWIWJKV/Tv0fTFOONz7r7q+3SuuMcjOivMxhgUIeaiHjXHhvIUJ
 NV9K4WT9Kwi951EnvkOadyGtgcWiNrF7OC9Sue/Nm2wZcKBs+C/786FW0Ys1NjODCLT/
 YW89swG6Smj3UeNM6bdF8CJTjHsqmv50/gpft7iJ2Woxtv2+OfdwyrM+ZbouX+oeQPJe
 jbuUBeugrIKZh1R03Gq6OZx0V4eZIHPu/IWVnszXeO8GYQwdhnqDI281wA+xJKQXeSu3
 KMHfZWXHixg3zO0ELOTXDlLJTA4EP+9VTMEEV5S4exLaNbU8Krf92aXsyxA5K2ytbP1D
 m1SQ==
X-Gm-Message-State: AC+VfDyax0qSZBEawiBmRvFyT6JoeaW3bM1KUWJ94sf3QLC/R/sPIfsh
 scdRfEtFCS2gy5Wa9ZdYnCGXcDEEpBwsGGRpOmFmXA==
X-Google-Smtp-Source: ACHHUZ6+y4l6QNfmUGyJNRcBYb9MiNQz66pVG3EAb79InSVed7rj06fLBaDTmu9hMN1kdPcszX2T2oHTtughLAMrD8o=
X-Received: by 2002:aa7:ce18:0:b0:50b:febd:3cde with SMTP id
 d24-20020aa7ce18000000b0050bfebd3cdemr637811edv.42.1683278954904; Fri, 05 May
 2023 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-9-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:29:04 +0100
Message-ID: <CAFEAcA_JyABKoiywXpM1qOss-bcAfO1185TBa4CwNtxkKuQGqg@mail.gmail.com>
Subject: Re: [PATCH v4 08/57] target/loongarch: Do not include tcg-ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Fri, 05 May 2023 09:29:18 -0000

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This header is supposed to be private to tcg and in fact
> does not need to be included here at all.
>
> Reviewed-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

