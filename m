Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D1C52D6F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 02:57:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbWrF-0007F8-8F; Tue, 06 Aug 2024 22:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbWrD-0007CP-FO
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 22:56:59 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbWrB-0005od-Mx
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 22:56:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70d28023accso1139306b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Aug 2024 19:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722999416; x=1723604216; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=59El+8l1yPalXuQ4p+e5Q6aR506L625rA2xRUFD6xvA=;
 b=uLXba4OcF4DUw2/Aj8DVTaQJgzmgqUP8WWTqxGWmchB9bJihU9sHM4zzR6/PAZQQQ7
 6tlLdLFJa698ZrXPeG0ABFgLJf1mJ/AvQ4Hgig+9n0x2aIljfH5ssrSdc42R0bO12RMs
 LtLTxPWiDM8CDhIyPZR1QuBkGecuD5anxsoz7S8jgEOzoJ771ZRhDS+NOexwrk0lnjcJ
 CTCGUsZ06UIbVqvqQBH4tYjIKW8dIBQEyTNZ7NjU9h8/D6kXBIleAk33s+6xgCLt2V5g
 Cm1wNqx0uufNzgpBc0kQCtixLAYBdLqes+YrwO/2B+OR1t5H+A3nCqDyf2MukR11U+By
 bA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722999416; x=1723604216;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59El+8l1yPalXuQ4p+e5Q6aR506L625rA2xRUFD6xvA=;
 b=Y6Wz+Qn3XIz1VLfF6E34h0p0qSDtEqvEogSOZoFKRHtGvGK8Rtc65D8mHgNLmwemzn
 OT7bSUN1ICp/M7UWm8YT0p80AjSXDCwh7HftDrtqDa6Wbwj0lXjpT48fqgaewvs3YCxU
 XlNWoKB4pwdcnRvQW7MW8oCkTET8zZoGAnWknrypB5blzH7Q5uqviQZsCilxJK6PKN4a
 DciaCX3guFBV/Ehtgud3kL3vC1mjbtsP2jed2lM8I5eTNokX2k4qHiMH0Z+QdyIGmltH
 5tb2p1dttEEcdVjLkQ7xcH+b8gZS8LcwFpwR3dEraL8gzsr0dXd4FLmZzZZWAvhWE3dc
 sArA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhJBlYYgifH9JqRhSZ9LXeJFa40PC5vopqi6HLI2wGpoX9hbnj16WXWEw4zi6DSgi0wDL4smVEMMJromgGk6TzloNU5ho=
X-Gm-Message-State: AOJu0YzJmv8HNIhPPuXMfdh7WxbvjR/MfnOn75z3lw71mL3B+TEqi4oP
 XHo89FcpszpAK6ZrglOUEAXfE+aJqNn02DuBlIbHUfji2kRvGrVmu5lv//p/C/I=
X-Google-Smtp-Source: AGHT+IH3tsc4RN2Ico1Hr1/PBs5ve52Q+oPWqmU5jDYYA9/pk667f2ittTjHbMyMARnp+p+FHKFfuw==
X-Received: by 2002:a05:6a20:3243:b0:1c2:8d16:c681 with SMTP id
 adf61e73a8af0-1c6996594d1mr13526345637.34.1722999415594; 
 Tue, 06 Aug 2024 19:56:55 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:e01b:92e5:d779:1bc0?
 (2403-580a-f89b-0-e01b-92e5-d779-1bc0.ip6.aussiebb.net.
 [2403:580a:f89b:0:e01b:92e5:d779:1bc0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ec41465sm7481700b3a.60.2024.08.06.19.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 19:56:55 -0700 (PDT)
Message-ID: <26d1f8a7-9131-40f2-8d3a-e1daabad149b@linaro.org>
Date: Wed, 7 Aug 2024 12:56:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] target/riscv: implement zicfiss instructions
From: Richard Henderson <richard.henderson@linaro.org>
To: Deepak Gupta <debug@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: pbonzini@redhat.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 laurent@vivier.eu, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Jim Shu <jim.shu@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-13-debug@rivosinc.com>
 <199f7ee2-411c-48ec-bf69-34fceab8f48a@linaro.org>
Content-Language: en-US
In-Reply-To: <199f7ee2-411c-48ec-bf69-34fceab8f48a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/7/24 12:39, Richard Henderson wrote:
>> +static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
>> +{
>> +    /* default for qemu-user, use regular RW memory and thus mmu_idx=0 */
>> +    int ss_mmu_idx = 0;
> 
> This can't be right, since 0 is M_MODE.

I'm wrong about m-mode here, but "0" is certainly not right.

I strongly suspect you want "ctx->mem_idx | MMU_IDX_SS_ACCESS",
once you add that bit in a few patches.


r~

