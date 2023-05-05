Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1push4-0000QY-Hy
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push3-0000Pn-OO
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:29:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push1-0002uK-7B
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:29:41 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-965ddb2093bso83549466b.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=bLmzlWrtk62D96W986phTUm7TZIFl+TN0MS0hDOlAYnfK13Vs5CUeMmDuSO10KCUwL
 QlpZYTLmBPSLpUdyBTx30Kld0tX2wWii0RyeJB38zU3EqInaORcLQzSftOWaWK7y8XHv
 ohehcl2w0EcN/mdRWCnuHCQpGqmfiEVF9oA6tOwbr+Dh53+vRszcyKTyb41ZMD9hgDt7
 Y2QL7/OxYVWLkJ/ClNL6j+IQ9igd2pxoplZWMgVx0WsryQpCGh3CeFLtn5k0qCXGOo61
 0iS9xFXaMfJsYK4b1n24QUWt+/JdjATkmUgJsYrBTw/Hbf54bQwg17020MwpMxQc/qDQ
 mdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=gzKPZ7uengT5UaVmeYsvVrdELM+XulRvGjexSVh5RH1xFj2oJlVIKvecKCWhZdEdqe
 rxQ2A8IV3xmpAkjxFG7s7QKX51HZF7SLSmA+cSmeNbMJft6DvCaxqwTSl//edBGa2G+0
 7sfbw8IKQELl2jov5f8XSweFnJT+Vs8KrLgs1H+F59uTS/k6/SlFNC4EQgqd8Vzec0Xc
 vPVDPnFbjnIztZSNyXE4LEKKso65XwsMV+t35Dwvt+plWZCtd/ngrB6leoNJMmj46abN
 UyP/8ROUKn8y+zkS2URcAGjAxerBWUEU0aP9R0iK+gx630JOqQA9tMXj9NHi+bZKlS0P
 uE6w==
X-Gm-Message-State: AC+VfDxxKIFgfRtrYAPB/QhVhM9Qsd865xa6i2+fY3iuXls7yYxwoJyt
 xX6v86i9E8ENx2V3RxkA4lgSCmMrbN2SpaScMdqB75LKbQlghEdt
X-Google-Smtp-Source: ACHHUZ6ah5RLuhts2HKf1GIwuI3tGNRWmrDyqKb19ilrTrAQCsVSBQNY9kkz86r8VJN/zKvHc93PW6HUeKeH6tOctYA=
X-Received: by 2002:a17:907:724a:b0:95f:3a55:1dfc with SMTP id
 ds10-20020a170907724a00b0095f3a551dfcmr900570ejc.35.1683282576591; Fri, 05
 May 2023 03:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-14-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:29:25 +0100
Message-ID: <CAFEAcA-Qt6SBE42p_qWbETzBtgkqLbkBkyqLQ=Q7nMbjFrcKDw@mail.gmail.com>
Subject: Re: [PATCH v4 13/57] meson: Detect atomic128 support with optimization
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Fri, 05 May 2023 10:29:41 -0000

On Wed, 3 May 2023 at 08:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is an edge condition prior to gcc13 for which optimization
> is required to generate 16-byte atomic sequences.  Detect this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
>  meson.build                    | 52 ++++++++++++++++++++++------------
>  2 files changed, 61 insertions(+), 29 deletions(-)
>



> @@ -676,28 +695,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
>   *
>   * Atomically store 16 aligned bytes to @pv.
>   */
> -static inline void store_atomic16(void *pv, Int128 val)
> +static inline void ATTRIBUTE_ATOMIC128_OPT
> +store_atomic16(void *pv, Int128Alias val)
>  {
>  #if defined(CONFIG_ATOMIC128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> -    Int128Alias new;
> -
> -    new.s = val;
> -    qatomic_set__nocheck(pu, new.u);
> +    qatomic_set__nocheck(pu, val.u);
>  #elif defined(CONFIG_CMPXCHG128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
>      __uint128_t o;
> -    Int128Alias n;
>
>      /*
>       * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
>       * defer to libatomic, so we must use __sync_val_compare_and_swap_16
>       * and accept the sequential consistency that comes with it.
>       */
> -    n.s = val;
>      do {
>          o = *pu;
> -    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
> +    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
>  #else
>      qemu_build_not_reached();
>  #endif

Should this change be in a different patch? It doesn't
seem related to the meson detection.



Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

