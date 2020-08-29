Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC5fs-00054O-8t
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 14:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5fq-000549-OX
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:33:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5fp-0004ds-1C
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:33:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id k13so1132361plk.13
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s3VEZQ2WJqqIn2nbv1SGYfMM7G0CRc+I+dQMtfX7Avg=;
 b=YOCPK6N+iLTusTBrM6fMTHxMd+TwAVdFyp92p2LEX1zngcqqgUllLtWTNMvcSdVd7O
 8kM7T9hkW/eyvaUouQSn263rudhZK+tyYFVc10dp1XH7oQgPJ21TwgpfvTPp7qpsh+Gs
 waRqd/a0yEgSx5+vm/gJqwAUuDLTEXNH6I+hbhLWQatXjY1eoSEOwaItHbinlHqfQzSY
 C+3NsDsmWkdXHqrG6hxMDj353VchQeMrrvthmMM6imicNFVzCUpp1eDX0OO4LQBqAf5W
 nMpowIoK+UEN5DZe1LzDIvfqpJNDFY9ibI/9M/35zluxwt7y8vmOr6ZxcIXZVT+D4ZJO
 MV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s3VEZQ2WJqqIn2nbv1SGYfMM7G0CRc+I+dQMtfX7Avg=;
 b=cMZQVtz0FeQi027pyzT+J4FwJUKaW77zakqNDgaNKKo7RUR/mFGj7V6LKhFIvbDWvu
 RoqW3kzRwxuu7ciYQOuRKOJ3m2pJrnf79ABcbgrm/glv1KIOgkBq2D+35wP7GrN2Ffkv
 YvmQ0Q+dthA31TyfY5sJztC6mHNcV5JU38FErhgEfiAt3bDmbU2ZqImiWq5aB2ck8eIg
 qBe+4eC3Fh8SE5hzCWM4zFJby39HTV5Mf+dhxiO1FwqJ5YJDfmTGkUxDtBP6WqWz1UUJ
 LVKIFlqpjJIPV2rF0lYFcTI0kckmgyB6uUdPlZikr8Q68OBXxrJGHOpV/nGqx1oKWDHs
 eUyw==
X-Gm-Message-State: AOAM533rS5ZvZLeZd8faxaVO470jo8IaCVccjg8PJXh20OOPvDkX0+u/
 unaCaDZ+MQISzm6/v/3MioRmag==
X-Google-Smtp-Source: ABdhPJx6qVYm0T+ggTdNDMjoT9rIAtgtFeW3Oh8s+v/zqWHcdDaWUAn4bcoq5FWvVio2drlsTejhTA==
X-Received: by 2002:a17:90b:782:: with SMTP id
 l2mr3873206pjz.108.1598726035248; 
 Sat, 29 Aug 2020 11:33:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y3sm2752336pjg.8.2020.08.29.11.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 11:33:54 -0700 (PDT)
Subject: Re: [RFC v4 19/70] target/riscv: rvv-1.0: index load and store
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-20-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2ac344-423c-cd95-b62c-f2333ecaa05a@linaro.org>
Date: Sat, 29 Aug 2020 11:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-20-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 18:33:59 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
> +                                uint8_t eew)
>  {
> -    return !s->vill;
> +    uint8_t lmul_r = s->lmul < 0 ? 0 : s->lmul;
> +    int8_t emul = ctzl(eew) - (s->sew + 3) + s->lmul;
> +    return (emul >= -3 && emul <= 3) &&
> +            require_align(vs2, 1 << emul) &&
> +            require_align(vd, 1 << s->lmul) &&
> +            ((nf << lmul_r) <= (NVPR / 4) &&
> +             (vd + (nf << lmul_r)) <= NVPR);
> +}

Same comments wrt EEW as the last patch.

It wouldn't hurt to extract something like

static bool require_nf(int vd, int nf, int lmul)
{
    int size = nf << MAX(lmul, 0);
    return size <= 8 && vd + size <= 32;
}

in the previous patch as well.


r~

