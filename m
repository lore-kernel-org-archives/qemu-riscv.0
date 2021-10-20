Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdI0I-0002VJ-AE
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 16:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdI09-0002RS-Jb
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 16:15:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdI07-000460-99
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 16:15:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x66so542690pfx.13
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A96rvSYKEMZ6pLQhJv5fKt3nJS/YnRiJiux0GMK4py0=;
 b=ur3nX/jbutQ63Hp5NvjAovbl4WZnB5UVwv5q5t0N3l+BaJwtUtF/z5AuBXkmKg8Oq/
 OQGcdX9isToGZA4AlTloEs/RETuToNfSZMZASDvgcoB7jGIULoBM30jV0VmRQLH/7O7e
 qk5xz13Emu/dTFZc4jFqJptUXHbYR3qRssqZW859MiZ8eISQr2/9w6+LunqoYCCD5U8x
 p6+LJXn9hUAQSiURqLdLiF4SYeoUzTpkr+Mn2cRLc7fn9puD4QVgQdm08/pjhkx9RIgg
 9L0cype6y2g2L7KIX2jHaO1KS8MVf9MPF3gr/zdMnHq97cM/zanJOfIq+IrCbmFpI1u7
 UM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A96rvSYKEMZ6pLQhJv5fKt3nJS/YnRiJiux0GMK4py0=;
 b=4CR5MQ7pvL0Fbxm/Ej+BlfNj1B4v9Nl/tHFtiRil0U0N68gn3R8kxm8eedE2rAjGjv
 9o1iVhWOqoI1DBFvdhW5oUKj8czlMMKzNSBj+n+6pRuvGxeJnT7aS9jFlPJUpaeTnXgf
 TraFlgPCx7tH2zBhrFLb3AGoKR4mPgX6HN55U5mlSSH9l8aNsF3JtC9vAG2H8HTTtxtW
 HBdRVbjOKxWYL2+Lx/RVG+004ZFPt8EG0d9j+8P3Y8IGiynT/hJHAExzchmC6W/WNsLr
 2C2EkRIdPsGfJJV97I1q2b1lcAxPlNAPVvqGENfh6yBXYsZMJfRibAcs+iA/mzjeQgES
 ih+Q==
X-Gm-Message-State: AOAM531iXf8pOQX5LvTTBVPGbArwcup3gCCY7D0FclWFZM3BrqshcZ7C
 DY1wc86TUHQwEQjRTElMEHCxbw==
X-Google-Smtp-Source: ABdhPJxm4gf2PcJjhRVBsX4OmgxrZVdc+v005tbAx6zHp7iW1dF+axGAPAIKjBjg5wEEO1CqNYEDuw==
X-Received: by 2002:a63:6fc9:: with SMTP id k192mr1080254pgc.49.1634760948073; 
 Wed, 20 Oct 2021 13:15:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v9sm3504094pfc.23.2021.10.20.13.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 13:15:47 -0700 (PDT)
Subject: Re: [PATCH v3 14/21] target/riscv: support for 128-bit arithmetic
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-15-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80a30084-63c0-3fe6-cb9b-5927c35a9f5a@linaro.org>
Date: Wed, 20 Oct 2021 13:15:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-15-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
X-List-Received-Date: Wed, 20 Oct 2021 20:15:54 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +static bool gen_setcond_i128(TCGv rl, TCGv rh,
> +                             TCGv al, TCGv ah,
> +                             TCGv bl, TCGv bh,
> +                             TCGCond cond)
> +{
> +    switch (cond) {
> +    case TCG_COND_EQ:
> +        tcg_gen_setcond_tl(TCG_COND_EQ, rl, al, bl);
> +        tcg_gen_setcond_tl(TCG_COND_EQ, rh, ah, bh);
> +        tcg_gen_and_tl(rl, rl, rh);
> +        break;
> +
> +    case TCG_COND_NE:
> +        tcg_gen_setcond_tl(TCG_COND_NE, rl, al, bl);
> +        tcg_gen_setcond_tl(TCG_COND_NE, rh, ah, bh);
> +        tcg_gen_or_tl(rl, rl, rh);
> +        break;

But of course setcond is more expensive than logic
Better as xor + xor + or + setcond.


> +    case TCG_COND_LTU:
> +    {
> +        TCGv tmp1 = tcg_temp_new(),
> +             tmp2 = tcg_temp_new();
> +
> +        tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
> +        tcg_gen_eqv_tl(tmp1, ah, bh);
> +        tcg_gen_and_tl(tmp1, tmp1, rh);
> +        tcg_gen_andc_tl(tmp2, bh, ah);
> +        tcg_gen_or_tl(tmp1, tmp1, tmp2);
> +        tcg_gen_shri_tl(rl, tmp1, 63);

Hmm.  Seems like it would work.
I make that 7 operations.

Or GEU in 6 operations:

     /* borrow in to second word */
     setcond_tl(TCG_COND_LTU, t1, al, bl);
     /* seed third word with 1, which will be result */
     sub2_tl(t1, t2, ah, one, t1, zero);
     sub2_tl(t1, rl, t1, t2, bh, zero);

> +        } else {
> +            gen_setcond_i128(tmpl, tmph, src1, src1h, src2, src2h, cond);
> +            tcg_gen_brcondi_tl(TCG_COND_NE, tmpl, 0, l);
> +        }

There are two setcond cases that invert their result; you should fold that in here and 
invert the branch condition.  As long as you're special casing 0, you might as well 
special case TCG_COND_LT/GE and test the sign of the high word.


r~

