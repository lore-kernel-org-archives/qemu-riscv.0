Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfqxQ-0000GE-Pj
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 15:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqxO-0000FH-N8
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 15:55:06 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqxL-0007p6-Sd
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 15:55:06 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q28so5346266pgk.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u/1bb+QgzdiyJkCo1DYCQIDD/ANiLo5pK7Nvi7xAKgA=;
 b=Vn4jdny2bT7DJhpKC+lPk6IaKPjPEO59SjXJZSOLEGU8lmBSg6D/tqCPdOMnMjIA6N
 WdUuhpxpY+Dx76ZZE5/b1LFtCKTlm2G2gMUliewmpxCsjzS7hOXlfnLq9bPyZtejnDMl
 KBqeUxvY77ARH9susC8pFXo20ultBuCm2GIHYjIypciDkzUQToW2QGWH7govN9WUsTaq
 vcFR5e0NqDoriP4wQOZcotE0h28i+IF6fTpvGRjaKJxWBfdWxpuEM593u4QXsSTTggNO
 KxPeh83Ks1bcQlO5Bmo0hPiUnB+ZGm2ozUUBMl2DHWdJBAtvFqJ8dTyXTfSlog64kMuM
 p9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/1bb+QgzdiyJkCo1DYCQIDD/ANiLo5pK7Nvi7xAKgA=;
 b=CaiH1YdnS0gii5XVtoId9zDpabDl7C7ezO4X3nqRR/qmZApAFffIg8dJOPfrG0L9tl
 L/MDHmrTvREfN606UYe8FvcPzHp32Kd8e9hOq6CwQz06rBzyND+KUUX7xg9nQlM65OqC
 W8jSheYlI8FMxvQGjetNErnMOYTkuzcxjWfNY+0VfF+5R8Y6IKUrvO4kADqaVo3e/Nf1
 vVmFoQMq2EoHdFnArJp7ayZmBOjZ3+m23QyG+mc+V2WSGXOcLKCrUD3HJNoNFIvIWe2e
 7fsoOZDYX+KIATQ76Xuro96yer6DbTv0TWZ8j/zcTpAJDMwAkEFsKNZGJ2vWK2/bMGzI
 M78A==
X-Gm-Message-State: AOAM530gf/vExMnR34fW7jG1KuBRbEUMG3C8E1mAtXLYh0h3NgOj2G5J
 2AnmNQVqkCyuOeVgHLQCp1UTiw==
X-Google-Smtp-Source: ABdhPJyYdRQL2mRrHFrlEFogZnEDtFrhiSCUrhZaiuKmrkVsb8I42ZLDiT4fAATKTcFEOOoBIFCSAg==
X-Received: by 2002:a63:e25:: with SMTP id d37mr14214089pgl.191.1605819302247; 
 Thu, 19 Nov 2020 12:55:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gg19sm636440pjb.21.2020.11.19.12.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 12:55:01 -0800 (PST)
Subject: Re: [RFC 09/15] target/riscv: rvb: shift ones
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b1df8d1-cfe9-41f9-4fd2-0fc6569aba16@linaro.org>
Date: Thu, 19 Nov 2020 12:54:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 20:55:06 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool trans_slo(DisasContext *ctx, arg_slo *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_slo);
> +}
> +
> +static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &gen_slo);
> +}
> +
> +static bool trans_sro(DisasContext *ctx, arg_sro *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, &gen_sro);
> +}
> +
> +static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &gen_sro);
> +}

Use the same gen_shift family of functions discussed vs patch 8.


r~

