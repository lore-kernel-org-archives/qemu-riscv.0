Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfrPq-0002SJ-K9
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 16:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrPp-0002S0-MS
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:24:29 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrPn-00014V-Rx
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:24:29 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q5so5728694pfk.6
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UN2sc9tb+6RlOX+6EMA/SQzkzvoMg4bkWWxAoMrHQdk=;
 b=ElCiirAWrKG2BXlNr8BLuvWPgHr1YBRJ2Uaq0wJpwsGPmuBA2ffLwyX6rKYGwA+biF
 IzSXTDUUmSHjC1OBpiSWgvI5wDbrq5JuL6uqTRCVKj83F0Fu0dx5OgXpfLWx/iqdtmkB
 degEOkcry8yciCnTD9jcP6DmoUxlr3uN3qgo18R1VsGAXRRHnguosPtBUKtvJQ9VfRWk
 7oCFYC5XaodFc09BukvKqveJsvyNtLIQInQkcie/gCKOWZlszQwHhGhWIcJx+KZGLu3B
 tSRTioo2KdmGiz87cxwXK7m9ucjRPSrN77BlKnrr5w9qdO17Bmtp4lyZDftHpkD17TJU
 Vjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UN2sc9tb+6RlOX+6EMA/SQzkzvoMg4bkWWxAoMrHQdk=;
 b=qSPXxOP9iopfoVOGY/y81sSxSDr7jS+/VjE5MYj7+3DZvuU81jHuEgpmrxMWm1YKpz
 13GuBGe71W5vatWf/tSyOIZqP0V68AYnpTsK94onmUrT8O1Uz4FlNjfwQtcdXJgEz7Pt
 LWBs201SfGZN4loLbuFslY7doIoEP1h6YtsLWlP9zaQcBqFbehY4LTadaxuvONia1YhM
 nZMa6f/19/yGolzil/HUU/DhxJw3zaUkQlxgLxmjOub1WzcH6qT0Lgs9jDYythCyhhVz
 pZVxYdx4W4myafgeFxEfZAJhXOrW+ev40Y/99+cADMaP5qNCVy83U3CuAJvvwFOLLS+r
 D7Xw==
X-Gm-Message-State: AOAM533esa69nFPyyMaLxAVZ5qLFaEzhqzvvBIi8QLXwMz0f756hi6cA
 SSFgzY1P66MOOfgSXG7bdVjPzA==
X-Google-Smtp-Source: ABdhPJzA4qXnq6+38rI4pTrP0bTJUQhQQagZZidic9xyw93SicJmuv09WYrjRAg7RLCsf2R/IvYw9Q==
X-Received: by 2002:a63:1619:: with SMTP id w25mr14149781pgl.34.1605821065958; 
 Thu, 19 Nov 2020 13:24:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 26sm580478pgm.92.2020.11.19.13.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:24:25 -0800 (PST)
Subject: Re: [RFC 11/15] target/riscv: rvb: generalized reverse
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92347abb-7acf-b24e-6072-ff59d97bb6ba@linaro.org>
Date: Thu, 19 Nov 2020 13:24:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Nov 2020 21:24:29 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static target_ulong do_grev(target_ulong rs1,
> +                            target_ulong rs2,
> +                            const target_ulong masks[])
> +{

I think the masks should be placed here, and not passed in.
What you should pass in is "int bits".


> +    target_ulong x = rs1;
> +    int shift = 1;
> +    int i = 0;
> +
> +    while (shift < TARGET_LONG_BITS) {
> +        if (rs2 & shift) {
> +            x = do_swap(x, masks[i], shift);
> +        }
> +        shift <<= 1;
> +        ++i;

Cleaner as for loop:

    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1)

> +    static const target_ulong masks[] = {
> +#ifdef TARGET_RISCV32
> +        0x55555555, 0x33333333, 0x0f0f0f0f,
> +        0x00ff00ff, 0x0000ffff,
> +#else
> +        0x5555555555555555, 0x3333333333333333,
> +        0x0f0f0f0f0f0f0f0f, 0x00ff00ff00ff00ff,
> +        0x0000ffff0000ffff, 0x00000000ffffffff,
> +#endif

You don't need to replicate every entry.

    dup_const(0x55, MO_8),
    dup_const(0x33, MO_8),
    dup_const(0x0f, MO_8),
    dup_const(0xff, MO_16),
    dup_const(0xffff, MO_32),
#ifdef TARGET_RISCV64
    UINT32_MAX
#endif

> +target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> +{
> +    static const target_ulong masks[] = {
> +        0x55555555, 0x33333333, 0x0f0f0f0f,
> +        0x00ff00ff, 0x0000ffff,
> +    };
> +
> +    return do_grev(rs1, rs2, masks);

This one is broken because do_grev iterated to TARGET_LONG_BITS == 64, and the
masks array is too small.

Fixed by passing in 32 as bits parameter to do_grev, as above.

> +static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_grevi(ctx, a);
> +}

While this is ok for an initial implementation, it is worth noticing the shamt
for rev8 as a special case for tcg_gen_bswap_tl.

Otherwise, this needs the same gen_shift treatment.


r~

