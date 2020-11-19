Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfr6W-00076b-8x
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 16:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr6T-000759-R1
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:04:30 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr6P-0002RO-6m
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:04:28 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q10so5696704pfn.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BmOR9YJnGmLqOYKphHeQjePxwlSG50eELAbZRz5jfOQ=;
 b=Vc6/ESACnXeUYepmE7lFR4YF15K/cT7AE5pq7rtllgP1q1f/+0covg5Pq1nWOcK9Ab
 uVZIk0By/x8BZYwPuo+RDPgzisziwgkCtG9KmxiUFgRlAOJJWt3P+3NgDwJnhUGwaF73
 VMb51FlhGz5rUvoK7URXlJs+BtcNP9QUx5c30TfFpGknQKuj/H4Kj8d+FuII6CKR3Lq9
 34vnRtbHQjTptCJYzFtBwoXKb9Jr8eOSFbbtwu1qgzqlWbRn3wBylc2BGOpoSzumhCc5
 lqTDQmM27RK9d04Wq06NLs6X2eQ8Vt9z5qvwUARvq80mUmLbSueJqHLjo8yVwhnVTA8j
 yVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmOR9YJnGmLqOYKphHeQjePxwlSG50eELAbZRz5jfOQ=;
 b=l/ddS3tavumCb3TYfRFqA89kU7SdzlkP60wogTZJmq9ynMpgT5ObjaInA9uVOjIpeh
 B42x2XQ5EzCpKxllgFk7Tfn3yGYFPncB/aOoeiYfbMzgKCLO38AHKosSDBUrvde1CaU4
 j5vo529YVs4alA9YFs6h/TcCT1KrW1PeYPUXUpEaCUcP1Ip+Nc92FNIULJ118khS7V/v
 0/MlwSlO+fD1Zh8jG76T+ELFPaXeU4+Y0xvO3WZdYY38yKOzr5iAySIBlYFmifXCU15L
 1/uySuBx1zFy9bnsXSKqp5dKH43P6lUMCDymOyogjOYuv1RWGVYPaV6qolzdortR/XWi
 B1Yw==
X-Gm-Message-State: AOAM533rqk6qmhQfl+Ak0jDAELJ2nBnyZ2lPRCV2cO66rUL55jYH94/n
 Yd1eP7WNf2eVEmdw/ZLuKMLz2Q==
X-Google-Smtp-Source: ABdhPJwXQzy3xUeRVpKw7rIKp/Ddw02ORjaoSBXTW0tiCRx2qgrHhc8njOhRtzFHZAwUVxwEFUgFKA==
X-Received: by 2002:a65:5cc6:: with SMTP id b6mr14335468pgt.417.1605819859757; 
 Thu, 19 Nov 2020 13:04:19 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e14sm582151pga.61.2020.11.19.13.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:04:19 -0800 (PST)
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
 <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
Message-ID: <bbcbfa1c-b34d-147e-a100-cbc998512fe3@linaro.org>
Date: Thu, 19 Nov 2020 13:04:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 21:04:30 -0000

On 11/19/20 12:35 PM, Richard Henderson wrote:
> On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
>> +static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbset);
>> +}
>> +
>> +static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbset);
>> +}
>> +
>> +static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbclr);
>> +}
> 
> Coming back to my re-use of code thing, these should use gen_shift.  That
> handles the truncate of source2 to the shift amount.
> 
>> +static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbclr);
>> +}
>> +
>> +static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith(ctx, a, &gen_sbinv);
>> +}
>> +
>> +static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
>> +{
>> +    REQUIRE_EXT(ctx, RVB);
>> +    return gen_arith_shamt_tl(ctx, a, &gen_sbinv);
>> +}
> 
> I think there ought to be a gen_shifti for these.

Hmm.  I just realized that gen_shifti would have a generator callback with a
constant argument, a-la tcg_gen_shli_tl.

I don't know if it's worth duplicating gen_sbclr et al for a constant argument.
 And the sloi/sroi insns besides.  Perhaps a gen_shifti_var helper instead?

Let me know what you think, but at the moment we're left with an incoherent set
of helpers that seem split along lines that are less than ideal.


r~

