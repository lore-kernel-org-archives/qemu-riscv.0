Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvgq-0000co-VF
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgp-0000bl-8E
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:41:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgn-0007I6-Iz
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:41:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3424290a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=yJPaqQ00/KJmQbXoIb6NFRd2HPNWf6NLeVpuC2MyDevHxgGzpD90pOJACg9MCskezj
 oIKsvLmLZGtHbj5pkwyuL3yIXIseS6K4CqTMrF29DxSI179yCw8wYP5RCYYauBoTgmRl
 YBOyKL0buoJBLAdiU7HtOp5Y2OpHasx79Itu0ZIMwQoAQxxPkqN4KvD+17jVfGMQvRSl
 yI45SNtKAjAGvLIl7e9GkLHNn1RwFe/J+KZhmg+pct9J36N1PPA32FsJc3zFf5jhNhpE
 18+PVyzEv1KuB5MeU1+Xh5jB6RQ2GEYtrpmSQRfsNBwYggbOooX2wXhGjjDxiFH+69hf
 CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=GdOnJAYIl3cMuY0n2zy0J5AtJiZsUfRxBLLlRDHk+OuSeq3e6n94bshy297uNvRHjb
 KMhBtp+hoaFvjqTvftBpAHQ7kQjiXsjpCuzVsq8wJ/8ZTXvZHvndqe5YQiuyxQzBqn40
 0/oBgyTL/K37OKYQK9+giW6riU07Cmn86q+3MwjO2HOEs/oVPgoZM9rc68LlOET+9f+V
 mTJZlXLseiiS6Yf0doofVxu0DaJLNwPCm25vG9HLu+UinMF00Y7RgfQdl3tLPtbpGYde
 B0+LYY5xLSyXOLRWzr1A18lePJgN8/16KfoJRAMlszGTtdsHseayOv0k05oFedx2rT9y
 s4sQ==
X-Gm-Message-State: AC+VfDygOql5aNAagpvx+LOcujBMpUdvWK8oX9dAh6neDeGe8fKHK54c
 p0zjpGBUIJebzKXoX+ZVJYJK8dSx+zZxUtm+zGBMy8KSrfSVFKGi
X-Google-Smtp-Source: ACHHUZ6KiAdx4Jwp8u5hWKEAnWHG9t82fJpOtt37z7CkjIo5iyyRmoAweNwgCRCZUOYGBgo/0PsjSqovrpTAnBTKLEs=
X-Received: by 2002:aa7:c241:0:b0:509:f31f:b570 with SMTP id
 y1-20020aa7c241000000b00509f31fb570mr1435960edo.23.1683294095764; Fri, 05 May
 2023 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-56-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:41:24 +0100
Message-ID: <CAFEAcA9UhVw_x_1WAgNBWB6NNfpLAt=ALXAZ+Thcg+rbNhcGUg@mail.gmail.com>
Subject: Re: [PATCH v4 55/57] tcg/aarch64: Support 128-bit load/store
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
X-List-Received-Date: Fri, 05 May 2023 13:41:39 -0000

On Wed, 3 May 2023 at 08:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use LDXP+STXP when LSE2 is not present and 16-byte atomicity is required,
> and LDP/STP otherwise.  This requires allocating a second general-purpose
> temporary, as Rs cannot overlap Rn in STXP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-con-set.h |   2 +
>  tcg/aarch64/tcg-target.h         |   2 +-
>  tcg/aarch64/tcg-target.c.inc     | 181 ++++++++++++++++++++++++++++++-
>  3 files changed, 181 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

