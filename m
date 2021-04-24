Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laLrQ-0006md-MQ
	for mharc-qemu-riscv@gnu.org; Sat, 24 Apr 2021 13:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLrJ-0006lj-U0
 for qemu-riscv@nongnu.org; Sat, 24 Apr 2021 13:14:22 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLrE-0006F6-Dp
 for qemu-riscv@nongnu.org; Sat, 24 Apr 2021 13:14:21 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so853091plf.12
 for <qemu-riscv@nongnu.org>; Sat, 24 Apr 2021 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k+yquW6Jwfr4iNaYcZTtMgJSwtJ91lwBzswa/nAFTRc=;
 b=dxvnPy3RWxY4pq2Z/3HHACmzvfrY0NjChJV92QJ3UE4egc4desjW86oxZACEuhumgQ
 LTDSOXN+P8C2ZlspWbawivnGvLLqZkb8d1ks6EQWtfCghSD9f/3nM4P0FOxg815T6bmS
 mqRe05FoMR5k/3WG5dffhijlbtZFktGY/92P0IqP676IJvhka/rhcwoTeouSthwRts54
 O1umo35MXIkqES83zcXzWvLhMgwjXCy/JETdMLiC+wc7alXXR5btx4zfeI3VKuDnNCVN
 XJqWFyNENia+v2dH3BUJ+hpeu8tmS3Dc7V0TBrbWcB735spndZpCXN3TcinvURufplsD
 0rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+yquW6Jwfr4iNaYcZTtMgJSwtJ91lwBzswa/nAFTRc=;
 b=IrzRaQZjaGgxNSeKNdznv6UTNRuJwux1N19PPm74BDZwsV3rwpdsZ1vZ8LUZlS1N2X
 BIKBetw1Ygp9y+pNfBDc3Hx/V0kONwz0gdI+rw97zlZMCeUI/8Iw48egEzWto/hJPFGX
 3VpFVudu8uWEEQmkZp6h//b6UsZjJPffba3jFUxTDp0dr2z6crzIzupGKr80q3oW/K/A
 6s4C8F/HcXZCpMXpIxbTx2L2LbH4Dhn9o96ce+tGe3NJQIK3DvsXAe/vX3ndqFJZ2WMA
 H1Km6MAcaETS97UENrE15994rENAkMIkNYP0ppjOXMaG3FL6tEe7x75xfdopX8fanI6R
 Cjag==
X-Gm-Message-State: AOAM533NESCmPsJj2/yw+mT1yWy9wEGj5liZ5daCRlkvytNWBLXBJpqM
 iG1Xn/en7TTvlA5eUG/04cafug==
X-Google-Smtp-Source: ABdhPJwt/7Ek1yO+peLSFmWhVMcd4NwppFkDruRenprbxV5vU0zo+7qB8v3v0uXtiVBpDHGSgC/qAg==
X-Received: by 2002:a17:90b:344d:: with SMTP id
 lj13mr11925442pjb.44.1619284454798; 
 Sat, 24 Apr 2021 10:14:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g24sm7911741pgn.18.2021.04.24.10.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:14:14 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] target/riscv: Fix the RV64H decode comment
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43dfcf5d-26b0-759d-296b-416d3566b2ea@linaro.org>
Date: Sat, 24 Apr 2021 10:14:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sat, 24 Apr 2021 17:14:23 -0000

On 4/23/21 8:34 PM, Alistair Francis wrote:
> BugLink: https://gitlab.com/qemu-project/qemu/-/issues/6

The issue got renumbered to 47, fwiw.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn32.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index fecf0f15d5..8901ba1e1b 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
>   hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
>   hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
>   
> -# *** RV32H Base Instruction Set ***
> +# *** RV64H Base Instruction Set ***
>   hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
>   hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
>   hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
> 


