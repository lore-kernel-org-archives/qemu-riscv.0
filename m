Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYVpV-0003Vj-BL
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 11:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVpQ-0003UL-Ca
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 11:28:48 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYVpO-0007L3-P1
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 11:28:48 -0400
Received: by mail-qk1-x72d.google.com with SMTP id i12so4618195qke.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Apr 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RA/PxSDKRZwBlahVGkHg7Xpt+ai4Ssg30ZSr70gUVk=;
 b=ASTMT+Ja515VmeBu20rLplxR4RV2pnjkQ3Ri5LfhEeTPWzM0xeh49zfbJOwB7/93xV
 PKBqcElN+swak+FaTtdS/IxDIQ0XXlm5yiv4jbZpMHvwkm0aR0+1TGVUWwUdYxXBKCYB
 sS5s+B14nR/VI8no7zH83f0yqu8spgMVRjuQL8+bOIaMsChXGngPbfyZcWf3iHIegtuK
 7HkKfZjLBt2Bx8LtfkXNYxWxneeNFsGtqLsZfJaAmqhUkPvJ6GOQZw6URxCBItoVSEjK
 cjosB7oB+47GIOmifAqoGMPPmtstzph0VSwm61w28q6xU+OBlrfk8OM9ZvCbx0acdLxs
 o8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RA/PxSDKRZwBlahVGkHg7Xpt+ai4Ssg30ZSr70gUVk=;
 b=G0s+C8LPR1GK67gfZmpTsIluUEJw4F+tkhR6crLvzqvr/libfDjdKwb2FAu8NNxPee
 g93XPGDQog6SR53ezaAKPKnHgvtlT/3Vr2fpOK6w5dnuPJ+OTjz4gdmfZ8CvOxvQpEtp
 gtajZEVfCA1Vpta67ACx4lBoyWVJaP/DA1m3QNTxSnojmE4/QLe5Fnyif1A0IXuYQkoy
 bVuZSKjANlHet462QKgJcdT57/pK/p36Ze+sIQYR68YJDPICICrG+14rk8Ihn9qkAjBQ
 RM5wHTSwG+PfKJttOi0G5Z32Xiq/IN3U3WoSdiNuFpSq3jUdt44PRqugcOm4wViYkKQ6
 6k5g==
X-Gm-Message-State: AOAM5307rR3GDRyUbxey+ZUREqv/3WwIDtKFnIk23Vp8ZDzP42dkGa3t
 reEcJwFltB5v+av0WkpXM9nYRw==
X-Google-Smtp-Source: ABdhPJxD1tGaCiqeHpMeA1uFMhw2EQr0YiGl0mGQH8GRsbT6ILSMAT+W2w5ZOrLwubfqJTg5tV6byg==
X-Received: by 2002:a37:9d92:: with SMTP id
 g140mr12486488qke.110.1618846125602; 
 Mon, 19 Apr 2021 08:28:45 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80ca:1129:3594:91a:8889:c77a?
 ([2607:fb90:80ca:1129:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id b15sm9929836qtg.82.2021.04.19.08.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 08:28:45 -0700 (PDT)
Subject: Re: [PATCH] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210419055614.28361-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
Date: Mon, 19 Apr 2021 08:28:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419055614.28361-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 15:28:49 -0000

On 4/18/21 10:56 PM, frank.chang@sifive.com wrote:
> +#elif defined(TARGET_RISCV)
> +    /*
> +     * For RISC-V, InvalidOp is set when multiplicands are Inf and zero
> +     * and returns default NaN.
> +     */
> +    if (infzero) {
> +        float_raise(float_flag_invalid, status);
> +        return 3;
> +    }
> +
> +    if (is_nan(a_cls)) {
> +        return 0;
> +    } else if (is_nan(b_cls)) {
> +        return 1;
> +    } else {
> +        return 2;
> +    }

This second half of the function made me go look into the spec to make sure you 
had got that selection right.  But RISCV is always in default_nan mode, so all 
this is unused (and overridden in pick_nan_muladd).

I think for avoidance of confusion, you should use

     if (infzero) {
         float_raise(float_flag_invalid, status);
     }
     return 3; /* default nan */


r~

