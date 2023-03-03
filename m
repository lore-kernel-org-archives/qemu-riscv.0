Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAaj-0002DT-RS
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAah-00028n-Qn
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:57:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAaf-0004mW-Bd
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:57:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id i10so3705032plr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=S49icHihSGSwmnjrYViahlrSAljre0y740yYd6UN4zwtdJCdfr9fRHMi9sdtxv2j0a
 ndJj1d+GDGGYljI7nSb5upk1h3lp30bdU9d//E45ildngxUdGOIgYFmXPZsWl7O/DguV
 5aF+AFa7jgO8UkDkXrb0nzdERNY5APzwzutV5WyQUU7oC09ej4T+HQIOyvkkvGBIkn2o
 89BlTUbdZPSTl9Sec+ye1sJDw+x2pqu1FSNtsc829daa4OT+mw4foe4wNniYeQ0c19MZ
 Hui+w4z8pndyKVhu3GA5xUGqzCn76iP73PyvwesiY4Zwdt2hZHKDjNVi8SNODJ7QlL+6
 BV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=QmGVAhzut/6I1s5NDEdzQBmwwVGm7iqr22DkSENaD+FS0NJUt+EPszCpG1vpZy77SZ
 jtXiW0RybKfvLyu4GHKm1HkHObO4+JEewfGpo063gfTZwyXMKV1pnAvBZnvUVpi4a5+P
 iMFnKFGulHXvY11BP7Sf6o3liH2RgGEdyo+ejvkDfPsUOMt8DZvA8ro0vGEcNR6KzkdM
 IjD3/sHfbw2lByBEPJIT7qd9TErPLEd/j47xYekMkVgjGqpQkDKmYMn86YgMoLzAvHfg
 5Gn4MsTVuzZtXYK3/kV1q9apVK2AvSDfbv/TCVjtyespJWYv6BMmhcSFhVlOoZHDXWM8
 MvBQ==
X-Gm-Message-State: AO0yUKW2P8qfyjV2IpnHs0D4po8CicLVecMxLJRy1sjuKx01qpTMqlEn
 BU3X1g2SgztEuxgqmkjVbGe1+mw8927ixe0+MNwIag==
X-Google-Smtp-Source: AK7set/gUOO64mLarW0NX79U8W/4BpGx0M70iPzfL/pfyupYBPWuedeQBZcirPWZ12SyEE9esVe/80ipSpvZBsPkcX0=
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1083486plb.13.1677869832105; Fri, 03
 Mar 2023 10:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-34-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:57:00 +0000
Message-ID: <CAFEAcA-ktFQ9JesbmpTOnPOcuuZQbZyN4R86RTZyJsJnj2nK=A@mail.gmail.com>
Subject: Re: [PATCH v2 33/76] target/m68k: Drop mark_to_release
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 18:57:16 -0000

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 55 ++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

