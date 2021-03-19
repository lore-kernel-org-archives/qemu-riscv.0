Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNGxc-0002cv-1p
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 11:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNGxb-0002cm-1c
 for qemu-riscv@nongnu.org; Fri, 19 Mar 2021 11:22:47 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNGxZ-0005iE-Gc
 for qemu-riscv@nongnu.org; Fri, 19 Mar 2021 11:22:46 -0400
Received: by mail-oi1-x22e.google.com with SMTP id x2so5136295oiv.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Mar 2021 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mwfyC12AiUm/OaK6hdY3Txc0TSDYb7HeYwNGyCkxqgI=;
 b=IoEX/sXzEQYV8EbfXKV7rTmGjrBH9c5JUEPzjk8bPwxTT2AE4bnK6MSGSY9IaDgYiH
 r5u3hrgmr46PHLwdv/c5XxChHVB5M+ev0HEVyvy1xq8I3NCoFt63ARLagUPVYO/WykXC
 uPnsuy0/VVIWE82CrScyQKVHn0lAwsK80hR3LTwmgKtQsvvtEIBbBec87FZADudsd2dZ
 Ofj1w6y/1Allc2BU+ezElEwugjFlnhEjX7iDohqAtmQ5sFobPU4G/qXS55uoi7XFAI5Y
 T9Udx+06IVvqJ3CO71g9W5p4QbNDCEpvPA5xXAyG5HFvfSGWNK9Qxf2PqUYI2RPn6+oX
 PU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mwfyC12AiUm/OaK6hdY3Txc0TSDYb7HeYwNGyCkxqgI=;
 b=T8p6zWcZRLg7icQI2ddaOVsvIIkndxNrokfZxdFyi2xYbn594EpWtUQpifw/3rXwyh
 4ii3TPeuOyAkTArP0ehvsIqmnVLwZJyha4WwG5oKTYtihJrUGhJTWfHstIsSM3DxwdVB
 rbOAsM7QTkIyBYaAnEhBKzw+tVk8afQI2/r/jTvmfaiEfNyLr/9iGGIJbz6ETRW07351
 iJvNbhBGUuzCmC6I3UaDsLVV6RZTPTjzRxhqPVcu6H99+hhbqmOe6WQ/P5I1rwdjsbAf
 H2jwXNxhQ9kLx26LGS0GpnWzIVd6lWq450b2NAl++B7++915Ags6elys5iuLrWTh0pVZ
 5Ivg==
X-Gm-Message-State: AOAM5331vtCh8NPuUiuUo8YsLKPhi+v8eqN0bBRgfqasLT5mfdoT44sw
 qFpCjUSdTyzTKJctST7vm+Q0qg==
X-Google-Smtp-Source: ABdhPJzkQ1E4DsFaQLysvPxPn2UEaChKub8oEZwMKkFgV9+gkOFI+XixK34SkJ1qDmh5uHY0BHDuew==
X-Received: by 2002:aca:df54:: with SMTP id w81mr1426214oig.108.1616167364234; 
 Fri, 19 Mar 2021 08:22:44 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g11sm1249103ots.34.2021.03.19.08.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 08:22:43 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Prevent lost illegal instruction exceptions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20210316150354.1948265-1-georg.kotheimer@kernkonzept.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08b6fe4d-03bb-04d9-e44b-f939f839278d@linaro.org>
Date: Fri, 19 Mar 2021 09:22:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316150354.1948265-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 15:22:47 -0000

On 3/16/21 9:03 AM, Georg Kotheimer wrote:
> When decode_insn16() fails, we fall back to decode_RV32_64C() for
> further compressed instruction decoding.

I think this is all dead code now.  Certainly c.ld/c.sd are in insn16-64.decode 
and c.flw/c.fsw are in insn16-32.decode.

Digging, we failed to remove these functions here: f330433b363.

You are absolutely right there's a missing

>               if (!decode_insn16(ctx, opcode)) {
>                   /* fall back to old decoder */
> -                decode_RV32_64C(ctx, opcode);
> +                if (!decode_RV32_64C(ctx, opcode)) {
> +                    gen_exception_illegal(ctx);

exception here, but we can remove the last remnants of the old decoder instead 
of patching them.


r~

