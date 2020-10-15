Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT6j0-0002nA-1d
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 13:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6iy-0002jV-F2
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 13:07:32 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6iw-0003PA-Ap
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2020 13:07:31 -0400
Received: by mail-pg1-x543.google.com with SMTP id r10so2279924pgb.10
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2020 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A4vxSpqbWc/TY+Bd40PufIAYhCeEr6WaAxBYRp0RJps=;
 b=Xj6Ha22RSA//us0fRJSYBLWsJbgi9rm3142nEnftmd3M/50FMdNCy2/12N96Cb3Kjh
 YInVadEnY0mVv2a/28pER71srSILhATVMP4jYpzDn1uHUAGqOEg+Br+fVOk7sijjLTEk
 w2i7wtETTo+cJdZskNzq89/TSiutOYFgR0reWskmw1Rz4OSyBF1BOTP26Isr0FO8106R
 7PiRhsg+oFJHzom0mZaMlBkNNI+6jwym0az6+QIV3SU3dU5t25NEv9RCrKEzSIJcIhFR
 rIhBiq9FMhEmB/RGj3cOqNew+sLKeCzl/o50dkH8HSt/fiZ2NzmQ+vxP9h4y8hBOk1Ta
 FhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A4vxSpqbWc/TY+Bd40PufIAYhCeEr6WaAxBYRp0RJps=;
 b=DgqIndnvpB5C+dmOUTIzqqp0UloZRsdCtnbbFm8IccqtDdJ6oyDp/HR4B/kZzTWEJ4
 zqCcVbaBKW6K1QFmUWeK3Gftkl0HCQHYT5IS1BRy27GyZEJ7mql26pi/jSUXPqufUaa7
 BCgLUqc/fhfDWxj3ZXbqMSUNSIfaMe5k+J5tNl8pnQo/eTrKEYr4uYUgZR5kU8mETu1u
 s3C4bZ5RmA7ic7PE0BZYcMnX+bL8y60qCYRj5F0EViDQyXFti/bjgcaGRo2RWSQKLe5n
 DBYAUeqouL5YJo5DcoTVXrK9DPeADbiGBX3E49KzXxLDO6SNc67AY8rZshYQ128UhP7O
 8E5Q==
X-Gm-Message-State: AOAM532XZoWRLEe1HuiR4a4By973+FbBXc+yIjj5YnTkiOVe6iVvp1VX
 JlfIpoZmxhVIXjDYlwWFfLDKLbVKMQTe0Q==
X-Google-Smtp-Source: ABdhPJwE2ufofkeFtq6cwnjeL2J4s2dNK5KhVg/AKb2SIhK1JYqRHItyw9mauguMJaUEgXcj+vx24Q==
X-Received: by 2002:a63:c44c:: with SMTP id m12mr3977379pgg.92.1602781648653; 
 Thu, 15 Oct 2020 10:07:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w16sm3987261pfn.148.2020.10.15.10.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 10:07:27 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201015152139.28903-1-space.monkey.delivers@gmail.com>
 <20201015152139.28903-5-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3975e121-fb59-ffaa-456b-13e1a1b871be@linaro.org>
Date: Thu, 15 Oct 2020 10:07:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015152139.28903-5-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.019,
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
X-List-Received-Date: Thu, 15 Oct 2020 17:07:32 -0000

On 10/15/20 8:21 AM, Alexey Baturo wrote:
> +        switch (priv) {
> +        case PRV_U:
> +            pm_enabled = env->mmte & U_PM_ENABLE;
> +            break;
> +        case PRV_S:
> +            pm_enabled = env->mmte & S_PM_ENABLE;
> +            break;
> +        case PRV_M:
> +            pm_enabled = env->mmte & M_PM_ENABLE;
> +            break;
> +        default:
> +            assert(0 && "Unreachable");

g_assert_not_reached();

> +    /* PointerMasking extension */
> +    uint8_t pm_enabled;

bool

> +    if (s->pm_enabled == 0) {

!s->pm_enabled

> +    if (riscv_has_ext(env, RVJ)) {
> +        ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> +        int priv = cpu_mmu_index(env, false);
> +        ctx->pm_mask = pm_mask[priv];
> +        ctx->pm_base = pm_base[priv];
> +    } else {
> +        ctx->pm_enabled = 0;
> +    }

Don't need the if.  And should it in fact be placed outside the ifdef?  This
shouldn't be related to !CONFIG_USER_ONLY here and nowhere else.


r~

