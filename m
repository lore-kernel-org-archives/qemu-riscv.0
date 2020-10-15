Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT6QS-0006u9-EL
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 12:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6QQ-0006qS-Fb
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 12:48:22 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6QO-0000tX-CI
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 12:48:21 -0400
Received: by mail-pl1-x643.google.com with SMTP id b19so1939440pld.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UvhsZGgMHqu6IDXgm3a7sou65oEWD68CgiWOS6Kzp4c=;
 b=Gfj7ycDgKmcRXgSecJT+WECivUEyjA8C+RYu6T3oX9xNKaHzq9YGJJKYNeR2RhTqAm
 oo2xB/ArBs51CkU6kX5PXRaOk7p1huxqRho7XFmX/IUz1DE6BRTBoQROe6q124beK9lE
 tKwg9NKCuFCyGB4DF4/8imUPpMflwwT1enASL3lQWn/mYYpBtNFbazTXPqI1WRTb3WDc
 ELQ5m7CkLvra1JbWVB94diJOirauSB88Um842n9wMOyZO4gt3XDQg/E3JDD6/UT34SD+
 cJV5AYFptYg3U39ckUIrl3y1MYkb3jMGSuMuplXQ9TCNHe4lHp4vwnct2gMHaJ/D31Cd
 VDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UvhsZGgMHqu6IDXgm3a7sou65oEWD68CgiWOS6Kzp4c=;
 b=oMVAVj6yp0ETInSAuEGW4cXqfvjuSTo1vvqZUtS9YQJE68PI3QkOOg7W8tUHlFWKiS
 KcAfsOrSMC/ZCnWjXhKTzDvkvEweJ5iQfG7gImlneIXHNo+s0lra/7mwif5bBzi7Q1hk
 LM+xcECIsmS2S6wuHLwMsrkNP5rLZTUtgK2agxTM0f+FWAY7GXRx7kUqrv8eQx0xFLRO
 nUvRu+j455MVqj3kTnO7ix8B6oxVHXbrEADP3LckKNUV52dqKpo2DyvBQPig2ti6HuBU
 EmyRh3TrHBgiYyNfKUeSRxGqxLdYYbzisQLGwr2aFxStF2t1yZxEHBzh7G2doJPUiyFM
 ytQw==
X-Gm-Message-State: AOAM530kDfo0RkcuCPENdjqxTV1T8yZv4hIWyg+yMF6xVRUIeZEx5lG3
 RMrR+b60oUhLGJW1nWe3BqcTLsyHvepEJQ==
X-Google-Smtp-Source: ABdhPJzJSnOFWPEgKMiKAXVNWqajNjpo8T5Mb+0MjQIHSdv3aGc6Rl/9diPnxrXi3e7Xy2wP+B9ZrQ==
X-Received: by 2002:a17:90a:73c9:: with SMTP id
 n9mr5173916pjk.90.1602780498395; 
 Thu, 15 Oct 2020 09:48:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i25sm3799202pgi.9.2020.10.15.09.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:48:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for ones in hypervisor mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201015152139.28903-1-space.monkey.delivers@gmail.com>
 <20201015152139.28903-2-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d39e0c59-3b04-6401-aaac-8e202fb5036a@linaro.org>
Date: Thu, 15 Oct 2020 09:48:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015152139.28903-2-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.019,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Oct 2020 16:48:22 -0000

On 10/15/20 8:21 AM, Alexey Baturo wrote:
> +/* Functions to access Pointer Masking feature registers 
> + * We have to check if current priv lvl could modify
> + * csr in given mode
> + */
> +static int check_pm_current_disabled(CPURISCVState *env, int csrno)
> +{
> +    /* m-mode is always allowed to modify registers, so allow */
> +    if (env->priv == PRV_M) {
> +        return 0;
> +    }
> +    int csr_priv = get_field(csrno, 0xC00);
> +    /* If priv lvls differ that means we're accessing csr from higher priv lvl, so allow */
> +    if (env->priv != csr_priv) {
> +        return 0;
> +    }
> +    int cur_bit_pos = (env->priv == PRV_U) ? U_PM_CURRENT :
> +                      (env->priv == PRV_S) ? S_PM_CURRENT : -1;
> +    assert(cur_bit_pos != -1);

This is a bit clumsy.  I suggest

    int cur_bit_pos;
    switch (env->priv) {
    case PRV_M:
        return 0;
    case PRV_S:
        cur_bit_pos = S_PM_CURRENT;
        break;
    case PRV_U:
        cur_bit_pos = U_PM_CURRENT;
        break;
    default:
        g_assert_not_reached();
    }

> +static int read_mmte(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!riscv_has_ext(env, RVJ)) {
> +        *val = 0;
> +        return 0;
> +    }
> +#endif

This ifdef is wrong.  CONFIG_USER_ONLY doesn't have anything to do with what
features the cpu supports.  Nor can it be correct.  If you try to read this on
current hardware, without J, then you get an exception not zero.

I would have expected this check would actually go into the csr predicate function.

> +    *val = env->mmte & MMTE_MASK;

Surely you don't need MMTE_MASK here because you used it when writing.

That said, don't you also need to mask vs the current priv level?  There's
language in your doc that says "XS bits are available in..." and "PM bits are
available in...".

I'll also note that it says "by default only higher priv code can set the value
for PM bits", while surely it's a security bug for lower priv code to read
anything related to a higher priv.


> +    target_ulong wpri_val = val & SMTE_MASK;
> +    assert(val == wpri_val);

Incorrect assert.  This value is under guest control.  Do not crash qemu
because the guest is doing silly things.  Raise an exception if you like, and
perhaps qemu_log_mask with LOG_GUEST_ERROR.

> +    if (check_pm_current_disabled(env, csrno))
> +        return 0;

Missing braces.


r~

