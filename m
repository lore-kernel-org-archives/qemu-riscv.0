Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovyYJ-0002nP-Ib
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 05:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyYH-0002mt-Ku
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 05:24:53 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyYF-0007pB-RM
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 05:24:53 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 4so4213424pli.0
 for <qemu-riscv@nongnu.org>; Fri, 18 Nov 2022 02:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uroZis+7jgNfXIzvLcargZzE2mwVuhtS6HFie8NStKw=;
 b=GPma3PnQ+VJ7rtAHel8NKkRXbyYT10U+zKnfkBYWymeQp18VKDig628mVtx5b0SOMH
 XAGfr0cs1Q2LWxsvJL7TLnmnCDpfZhn27OfnKEOZCg0mNSdOSyYd98ySeC6P9ETTBaY/
 ZfY3pb4cji5UWtOvhN5EAoGeNstsBsDC/j6bIudT+s0L7QKnpI5mfPyuV4p2obVbKQsX
 sGUaIxKqGvKhwAos6eTGWg7ggd4hRmvuhKqqPjCn7cNaepa/sdj0RO86XH72mMyM0qZ7
 rD8BbBhbBfj3tdgNCcVXiDfMvbrIVXbathRGePJ8mWob9O6y6BvuKyKOPSZhZf29Bn+F
 Mw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uroZis+7jgNfXIzvLcargZzE2mwVuhtS6HFie8NStKw=;
 b=jk6O9Y5bfQ2nQc7uoYrO4IqgaWI5AYTqBK6nsjErI+7T/WcvVcVZVIQ2kt873TzWGp
 z2IG9tmyF/TzNybh0BYjDl/2junWcX0dHPadgDdJqDLtHXSS9tpC7wQWA7ltddakK5am
 drCcYv7FegxWXkJfMd8Le3LBjY798X5c6jSqqGy34z6qrctuiPPVNvFC8glPtb3je2DZ
 MX86Rkd9wkSB2w4ACMkV0eBpibjEtZYMK8evADkZziWknL5TPefXUufP2upzMmpKVsXE
 iAKhZyc3GFj6i7F8H97Z1i2iFgi3vA7+x+HeKgfhsLf3bKZamcmJuHByL2Ou1xEguVTt
 B9Jg==
X-Gm-Message-State: ANoB5plmDUvw01JdtYdfdS3wgrYqEQwJ1ec54sOTfxpgs7BCxaRTEMxL
 fDh8+NL1yjMKLpZJGbRAzgnlow==
X-Google-Smtp-Source: AA0mqf5az+zI+sBtmHdE3FeFCMLwfA0NbW9DKLqj3ugr/NEYW8IiUDB2TSMo5l0Auy3zpKsNsDFBKA==
X-Received: by 2002:a17:90b:4390:b0:218:4d16:e0c7 with SMTP id
 in16-20020a17090b439000b002184d16e0c7mr7209448pjb.105.1668767090068; 
 Fri, 18 Nov 2022 02:24:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 e89-20020a17090a6fe200b002137d3da760sm5060350pjk.39.2022.11.18.02.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:24:49 -0800 (PST)
Message-ID: <f3525752-ac4b-f355-7ed5-3e9cf88e3116@linaro.org>
Date: Fri, 18 Nov 2022 02:24:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
 <20221118071704.26959-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221118071704.26959-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 18 Nov 2022 10:24:53 -0000

On 11/17/22 23:17, Weiwei Li wrote:
> +target_ulong HELPER(cm_jalt)(CPURISCVState *env, target_ulong index,
> +                             target_ulong next_pc)
> +{
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
> +    if (ret != RISCV_EXCP_NONE) {
> +        riscv_raise_exception(env, ret, GETPC());
> +    }
> +#endif
> +
> +    target_ulong target = next_pc;
> +    target_ulong val = 0;
> +    int xlen = riscv_cpu_xlen(env);
> +
> +    val = env->jvt;
> +
> +    uint8_t mode = get_field(val, JVT_MODE);
> +    target_ulong base = get_field(val, JVT_BASE);
> +    target_ulong t0;
> +
> +    if (mode != 0) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +
> +    if (xlen == 32) {
> +        t0 = base + (index << 2);
> +        target = cpu_ldl_code(env, t0);
> +    } else {
> +        t0 = base + (index << 3);
> +        target = cpu_ldq_code(env, t0);
> +    }

Much better.  The only problem is here where cpu_ld*_code does not have support for unwind 
from exception.  If this load faults, we won't update env->pc on the way out (we are 
normally loading for code during translation, where pc is perforce up to date).  I should 
have noticed this before.

The way to fix this is to update cpu_pc to the current instruction before calling the 
helper.  At which point none of the other exception exits need to unwind either, so you 
can replace all of the GETPC() with 0.

> +
> +    /* index >= 32 for cm.jalt, otherwise for cm.jt */
> +    if (index >= 32) {
> +        env->gpr[1] = next_pc;
> +    }

This is simple enough to do in the caller, and then you don't need to pass in next_pc.
And since you don't modify xRA in the helper you can do

DEF_HELPER_FLAGS_3(cm_jt, TCG_CALL_NO_WG, tl, env, tl, tl)

static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
{
     REQUIRE_ZCMT(ctx);

     /*
      * Update pc to current for the non-unwinding exception
      * that might come from cpu_ld*_code() in the helper.
      */
     tcg_gen_movi_tl(cpu_pc, s->base.pc_next);
     gen_helper_cm_jt(cpu_pc, cpu_env, tcg_constant_i32(a->index))

     /* c.jt vs c.jalt depends on the index. */
     if (a->index >= 32) {
         gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
     }
     tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
}


r~

