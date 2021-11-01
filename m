Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUZn-0001g9-OE
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUZm-0001cE-43
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:30:02 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUZk-0002n2-FL
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:30:01 -0400
Received: by mail-qt1-x829.google.com with SMTP id s1so13949702qta.13
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VQopp7ZnprTdgenLJnbXh5i1g85SoAND0AEDo9Wz+70=;
 b=Q+G9tp7807hYKQtXVrTQUHLSLy/0K9/h2oyCM+ahzSzJZhl2GW8Bs1MBRvOKER/G5j
 4EGDVjG94vdMmpN7ilnTpVcJmz3flxFxOD//pzDOO1/4M43tuqz3dQy9lVmIegFMMABS
 dFxVaHMW8WI2YuR5brrVfQvbS1BHQcz2HVwKiPDyxWTPfoiDzp+CKUz+jev+glRnE9Ne
 goWkSnTIt8gkaCn/P/+Kq8qiYTKih0hoHM0q9gHjRPAgAiANDjMj0ggesd5NWem9ycwW
 m62AlQ+jL6jCK/Xw4UMn8fx8JthtDcw9wMdbBI3vwWIL68TCZG2jDdkL3h7THqkcJSIs
 0jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQopp7ZnprTdgenLJnbXh5i1g85SoAND0AEDo9Wz+70=;
 b=U3WId/uw6MIVgbyL7r7Vl8PNMOH4c1Jau7OSj00QOZs1FUQ9WZ2C8GhpZHzf9mUl7K
 Fb9Nf2fFF1k6aE5erHHdn9+RIpQNCtVpV0KN+Bq8OkrOO1IN46m7Y18boyjktSPJjTYR
 SZsMRnSgDm3zbGEuMvGMVLG9DccA3STSKcoD91wTGsag/e77JJMJ6oDTe69ds5wBTsDR
 UQPnSr/rcgObZ0VLunhO34mhSJ5eoGwUfUHhVyeJD8XY4BV2KSSJYx23v++VaiUk6FYy
 EVL90Ibj/zP4S5unCTmvVifRWplMqV5yR7fTvfQ0wYlTrk6uS5TjVlAAIAT/lR6lhvKy
 nR3g==
X-Gm-Message-State: AOAM530z4yWKHk8goSVFETtL1ei120XiqbXE9Z2QBlM8y/GmP7EFQjtB
 yf8lGVGKLfs4ao6vFdwUWFkmsg==
X-Google-Smtp-Source: ABdhPJxozbheaTIzXP3dt1tTHIdufVH6E/TpoqJKZvgN9dl4FsxTW1jGyufGzitnEQW98/Wyp4UqHg==
X-Received: by 2002:a05:622a:83:: with SMTP id
 o3mr26948617qtw.377.1635762599318; 
 Mon, 01 Nov 2021 03:29:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a124sm4368676qkc.64.2021.11.01.03.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:29:59 -0700 (PDT)
Subject: Re: [PATCH 01/13] target/riscv: Sign extend pc for different ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a827e6f4-0973-fa28-e331-45d5f3ee95ff@linaro.org>
Date: Mon, 1 Nov 2021 06:29:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:30:02 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> +static void gen_set_pc(DisasContext *ctx, target_ulong dest)
> +{
> +    TCGv t = tcg_constant_tl(dest);
> +    switch (get_ol(ctx)) {
> +    case MXL_RV32:
> +        tcg_gen_ext32s_tl(cpu_pc, t);

Don't compute with tcg to do what you can in C.  Dest is constant.
And I think that XL is more appropriate than OL (which *should* be the same, but still 
looks weird).

     if (get_xl(ctx) == MXL_RV32) {
         dest = (int32_t)dest;
     }
     tcg_gen_movi_tl(cpu_pc, dest);


r~

