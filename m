Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pusJ7-0002to-0q
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusJ5-0002t8-Jo
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:04:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusJ2-0003a9-Ut
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:04:55 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so2322786a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683281090; x=1685873090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n/n2EIcI4moXmMiPBfU/H5CtT1+XVdcDwK249IVE7Tg=;
 b=NMpn1YsXuYQepR1ccUKYVBB86NWFlQyeWGbIHUZZ6GX5RnlPgOcokPRyc1We5St0Iv
 7vju6eDccJZp/jeeP18vzFQUv3QMiW/dkmF27Zd3eV3LxO2/u1xbcE3SqKNt3Zs0E79H
 RRwhtAdHLAmFtqQ6J06DmsfgLQu6SeS4AQv7nK+BnhOFv0h6L6v/QOb7QyJmBh63xOEZ
 aRbHMn/zEc7obYAPE1T7jpg/b5n/9MFBkObbvSQ8hd9At1QT/oAToKeiE7PK/+pTJZ91
 yUtrhlkoIEAQNp51kmXiueLv8PkUxxa3MTe6qYbmroteJRh+mlA6fmQhvbL981tqBCiO
 VaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683281090; x=1685873090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n/n2EIcI4moXmMiPBfU/H5CtT1+XVdcDwK249IVE7Tg=;
 b=XJZ8e58klpy1VwlYqs9p9zrSJC1ah6prslFUfo/SqJYFb+jvhH2cHca+OxnQ1kzTYm
 6OtFRyZ9hIU9ocB8F7NZTdJwaxQDbqXfuOp60Y4c1iEf/omxutl9q3/pbMAn1FJEoDAu
 NpiIUIm6duuh2rE2tUrwebelJ7VKe2Rv7K3Hddu694aOvmsqJTErnqNxeQfd9YHMeJFh
 VQNvL6cnBtIWovU9HzwUKJL8f5787bXAg2acW8iht4QfORNvz60SrvfxfUi+f2SMFAIf
 yzpgRi7Dbf+dtJzSZnMNgn7KF9wYkjmnHlxZuiFxrdPmnskBO9cKReyV964f2hr4Lc25
 S0VQ==
X-Gm-Message-State: AC+VfDxrGew1Kpr5yPcv7IsymoiAJOUhQTcW3rytQSSyzqnMF/bWRyFm
 MyNrYPcBhwFYkYkti7SOPuFm2t7kDMR0Kk+TXy4+KQ==
X-Google-Smtp-Source: ACHHUZ5JW9krCxZgpM0LpM+8LM00k5WqSlWwHpOvafNVel8kgvf2Lm8+1e8CQKteC/qbJKetA6rjNm8erMtDMDR0+QU=
X-Received: by 2002:aa7:d954:0:b0:50b:c164:526c with SMTP id
 l20-20020aa7d954000000b0050bc164526cmr923698eds.13.1683281090132; Fri, 05 May
 2023 03:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-13-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:04:39 +0100
Message-ID: <CAFEAcA9oMYYC1FYwqLgHxx5HdxJ4u-h-5f1mfiAF1606JMkAXw@mail.gmail.com>
Subject: Re: [PATCH v4 12/57] tcg: Add 128-bit guest memory primitives
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Fri, 05 May 2023 10:04:55 -0000

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> +/**
> + * load_atom_16:
> + * @p: host address
> + * @memop: the full memory op
> + *
> + * Load 16 bytes from @p, honoring the atomicity of @memop.
> + */
> +static Int128 load_atom_16(CPUArchState *env, uintptr_t ra,
> +                           void *pv, MemOp memop)
> +{
> +    uintptr_t pi = (uintptr_t)pv;
> +    int atmax;
> +    Int128 r;
> +    uint64_t a, b;
> +
> +    /*
> +     * If the host does not support 8-byte atomics, wait until we have
> +     * examined the atomicity parameters below.
> +     */
> +    if (HAVE_al16_fast && likely((pi & 15) == 0)) {
> +        return load_atomic16(pv);
> +    }

Comment says "8-byte atomics" but code is testing for
existence of 16-byte atomics ?

> +
> +    atmax = required_atomicity(env, pi, memop);
> +    switch (atmax) {
> +    case MO_8:
> +        memcpy(&r, pv, 16);
> +        return r;
> +    case MO_16:
> +        a = load_atom_8_by_2(pv);
> +        b = load_atom_8_by_2(pv + 8);
> +        break;
> +    case MO_32:
> +        a = load_atom_8_by_4(pv);
> +        b = load_atom_8_by_4(pv + 8);
> +        break;
> +    case MO_64:
> +        if (!HAVE_al8) {
> +            cpu_loop_exit_atomic(env_cpu(env), ra);
> +        }
> +        a = load_atomic8(pv);
> +        b = load_atomic8(pv + 8);
> +        break;
> +    case -MO_64:
> +        if (!HAVE_al8) {
> +            cpu_loop_exit_atomic(env_cpu(env), ra);
> +        }
> +        a = load_atom_extract_al8x2(pv);
> +        b = load_atom_extract_al8x2(pv + 8);
> +        break;
> +    case MO_128:
> +        return load_atomic16_or_exit(env, ra, pv);
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return int128_make128(HOST_BIG_ENDIAN ? b : a, HOST_BIG_ENDIAN ? a : b);
> + }

> +/**
> + * store_atomic16:
> + * @pv: host address
> + * @val: value to store
> + *
> + * Atomically store 16 aligned bytes to @pv.
> + */
> +static inline void store_atomic16(void *pv, Int128 val)
> +{
> +#if defined(CONFIG_ATOMIC128)
> +    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> +    Int128Alias new;
> +
> +    new.s = val;
> +    qatomic_set__nocheck(pu, new.u);
> +#elif defined(CONFIG_CMPXCHG128)
> +    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> +    __uint128_t o;
> +    Int128Alias n;
> +
> +    /*
> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
> +     * and accept the sequential consistency that comes with it.
> +     */
> +    n.s = val;
> +    do {
> +        o = *pu;
> +    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));

Same val vs bool thing as the other patch.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

