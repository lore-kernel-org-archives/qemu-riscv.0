Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB9AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAKb-0007l3-37; Fri, 30 Jun 2023 05:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFAKZ-0007k1-RL
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:22:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFAKY-0006AD-2d
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:22:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso20594115e9.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688116936; x=1690708936;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NmckWYY4DImTm7/X39mu6H10aMzd/4akBzdZC6emEBk=;
 b=K9fB443uQ28zYwCbjV2uQ1gTYc+PtFWgWwpnAtFj/YE0pbMZ/KfO/VnSvY71E9/DwB
 gg8OgfyIjuvYfpVg2EXlu1+xgy9akh9wBCUwgsVT2YfY+lJjM+C3IhngsrwnVNx9RdDx
 JeK5+kA29iuSaVPYcyCOhETWboyft4Iqj1yAeRcj+aOs8iWhpFW7QtKZXEZTRYjMEHNA
 QsSjVM9ryRb8AFuZX4qZaG4lI0ECkVqSSQSM0Z3EGhuqmXXcO2k0zL3ymAgDFRhHCS/j
 zWSIgOSIIEOPC/7VykP+qdGX8UzMHKPz3DKNQj0kOYjvN7GU4vfofJDphTlwzey5bFIg
 FyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688116936; x=1690708936;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmckWYY4DImTm7/X39mu6H10aMzd/4akBzdZC6emEBk=;
 b=JVQl2aSVjNXly/I2HaTuzxIv5r6mrVkXTLDUsm5GUtwQOStsHxISADXPDFVKWo5dJa
 7mGXL7caikqL1BpvnJ/Yw4r6DbN+3gBkvX/ZcgQTqkirrvf1FLZREI3ttFZIVUPQxlwY
 tO5N+cTbkBrEqWIKU8UvV3pAi7708u2yN/aLlslx9Krfmp1hPZ+J1M6gvE85dR/PwuzV
 fCi53Tq0VsBnEQJQfhgzCvF4is0wc3MEMLe+15dU6JJToMQ4wfJ7F1h6qLL/GusDTZ8x
 KkpFUCqe7MbADglK+NF4fPqleJhswKrC74VdEZiKZdVAWQXpRe0P4SoWVrVVTEJpsqux
 eecw==
X-Gm-Message-State: ABy/qLY+GBf2MdGhTmaXqX+z7Odw0tI3briyUvNgKwkpgp5HZiXFwrxV
 PNYwjxzQgryPrGVO+NKcGVhEYw==
X-Google-Smtp-Source: APBJJlGX9vj35jt25BoQ57X5SHTZV8A05tNucfwWfniUP9b4GHjhYwqQ1Br95vF1rdJLAMXg9+M/6Q==
X-Received: by 2002:a05:6000:1087:b0:313:f551:b037 with SMTP id
 y7-20020a056000108700b00313f551b037mr1807980wrw.68.1688116936295; 
 Fri, 30 Jun 2023 02:22:16 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a5d4c83000000b0030497b3224bsm17760110wrs.64.2023.06.30.02.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 02:22:16 -0700 (PDT)
Message-ID: <599e9042-4e58-d468-940c-f8a8ee1edf5d@linaro.org>
Date: Fri, 30 Jun 2023 11:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/3] target/riscv: Use float64_to_int64_modulo for
 fcvtmod.w.d
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
References: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
 <20230630091303.1676486-3-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230630091303.1676486-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 6/30/23 11:13, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> For the most part we can use the new generic routine,
> though exceptions need some post-processing.
> 
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/fpu_helper.c | 78 ++++++++++++++-------------------------
>   1 file changed, 27 insertions(+), 51 deletions(-)
> 
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 289b3bbea5..0f897cf072 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -482,70 +482,46 @@ target_ulong helper_fcvt_w_d(CPURISCVState *env, uint64_t frs1)
>       return float64_to_int32(frs1, &env->fp_status);
>   }
>   
> +/* T floating (double) */
> +static inline float64 t_to_float64(uint64_t a)
> +{
> +    /* Memory format is the same as float64 */
> +    CPU_DoubleU r;
> +    r.ll = a;
> +    return r.d;
> +}

You don't need this.  Nor does Alpha anymore, come to that.
float64 is uint64_t now, always.

> +    int64_t ret;
> +    int32_t ret32;
> +    uint32_t e_old, e_new;
> +    float64 fvalue;
> +
> +    e_old = get_float_exception_flags(status);
> +    set_float_exception_flags(0, status);
> +    fvalue = t_to_float64(value);
> +    ret = float64_to_int32_modulo(fvalue, float_round_to_zero, status);
> +    e_new = get_float_exception_flags(status);
> +
> +    /* Map the flags to the specified ones. */
> +    if (e_new & float_flag_inexact) {
> +        e_new = float_flag_inexact;
> +    } else if (e_new) {
> +        e_new = float_flag_invalid;
>       }

Why?  Generic code will not set both inexact and invalid.
So this is a nop.

Removing that, all of your fp flags handling can go away.


>       /* Truncate to 32-bits. */
> -    int32_t ret32 = (int32_t)ret;
> +    ret32 = (int32_t)ret;
>   
>       /* If the truncation drops bits then raise NV. */
>       if ((uint64_t)ret32 != ret)

This will never fail, because you used float64_to_int32_modulo, which already returns int32_t.

But we have already raised invalid for overflow, so this can go away as well.

Finally, this patch must be merged with the previous, which introduced this function.


r~

