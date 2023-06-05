Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABD2C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 11:01:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q67xz-0005e3-Cf; Mon, 05 Jun 2023 07:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67xl-0005Zq-1D
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 07:01:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67xc-0001a1-Ja
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 07:01:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f730c1253fso14342205e9.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685962874; x=1688554874;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9iyTJv6hv5TVgHzcIxSZtEyIDrtGWZ6PsvH+kn0mbTI=;
 b=MoQwLqUSeF8pXuBCK+gE+YArWpiJ9o0h0PBE/4+88H74BIDzfEqHKZ7fFBCiByJq8w
 z+pkuO1QQl9t2cJJJKW3FL9xWYydF+uhzXVsFHIw6WNcqiXGgXESS9hvYuKNXOPGMCXN
 k/5UvJQBc1gKhtWqF/AxM1K3htQleAkCxfwhSmmZa/lpu1okN1WIiax0/M8obFIM4i0V
 BRWlYcd8ScqCt/xDmUxgjDWTucK3cco22kKNZZfSDADqv/ZsoU188FXyvu36NboyDx/c
 PCW9YTR0MUnvKHpWfEIEtQ5UdtVtaY6/WKDk3z4cudAtkI1x8go5BDSxqZ9QIzVhaa3x
 h3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685962874; x=1688554874;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9iyTJv6hv5TVgHzcIxSZtEyIDrtGWZ6PsvH+kn0mbTI=;
 b=O63gFEMuznCKQpeCy3jGdw8URYiGGkB+P7JlcJXNm3k9mq5sPyYC9zuSrBFPVSvgl/
 GhACmRk9jfCuyEqqz2GYbvBhwyyqG6ms5IAOZ+uiS+uDSUWB7VEwoN0OA4rijux2fpJ1
 Czv4kc1ksrezYLQfeuwzvikiSd2xOcI1nDtceMcbuCpDnHw25mlbglemAB6ITcs7f95j
 TGtJ+Y1TSpUNLesVKqiu4Z4XUe45cyoLOHMHcO036XSC1c8HqIfLLtNAQJV0ImGMe+XZ
 WHV/tagaYL4Vr+o0/VmOyxMjXgtmNWlEIOFHd9RSEyTxTGiX9wXrnbc855wipegyUkEh
 X+/Q==
X-Gm-Message-State: AC+VfDzPZUUiAx+23yzeFqgNC9Kv54xf9TFlauf/sOoE3wkQ4MtpOrfs
 4RpO++0ioHg/Ss0mbwk1fEcCww==
X-Google-Smtp-Source: ACHHUZ6Ysx5wvn0LxR1FHPKQZ7bm8+N4N0qwb0qb6iLO9jX47MRiE1+7rvnmC3mUG76vs1RcOmmE1w==
X-Received: by 2002:a7b:ce98:0:b0:3f6:2ee:6993 with SMTP id
 q24-20020a7bce98000000b003f602ee6993mr6473263wmj.4.1685962873732; 
 Mon, 05 Jun 2023 04:01:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f60482024fsm10478823wmc.30.2023.06.05.04.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 04:01:13 -0700 (PDT)
Message-ID: <59e63ef3-830c-fab2-3186-8eea84bd7122@linaro.org>
Date: Mon, 5 Jun 2023 13:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 02/35] target/arm: Move aesmc and aesimc tables to
 crypto/aes.c
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-3-richard.henderson@linaro.org>
 <bc89ede2-747f-c56e-5cca-e09289fb72f2@linaro.org>
In-Reply-To: <bc89ede2-747f-c56e-5cca-e09289fb72f2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/6/23 12:45, Philippe Mathieu-Daudé wrote:
> On 3/6/23 04:33, Richard Henderson wrote:
>> We do not currently have a table in crypto/ for
>> just MixColumns.  Move both tables for consistency.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/crypto/aes.h           |   6 ++
>>   crypto/aes.c                   | 142 ++++++++++++++++++++++++++++++++
>>   target/arm/tcg/crypto_helper.c | 143 ++-------------------------------
>>   3 files changed, 153 insertions(+), 138 deletions(-)
> 
> 
>>       union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
>> +    const uint32_t *mc = decrypt ? AES_imc_rot : AES_mc_rot;
>>       int i;
>>       for (i = 0; i < 16; i += 4) {
>>           CR_ST_WORD(st, i >> 2) =
>> -            mc[decrypt][CR_ST_BYTE(st, i)] ^
>> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 1)], 8) ^
>> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 2)], 16) ^
>> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 3)], 24);
>> +            mc[CR_ST_BYTE(st, i)] ^
>> +            rol32(mc[CR_ST_BYTE(st, i + 1)], 8) ^
>> +            rol32(mc[CR_ST_BYTE(st, i + 2)], 16) ^
>> +            rol32(mc[CR_ST_BYTE(st, i + 3)], 24);
> 
> Matter of style, (since you are changing these lines), I find starting
> the lines with the ^ operator clearer to review:
> 
>              mc[CR_ST_BYTE(st, i)]
>              ^ rol32(mc[CR_ST_BYTE(st, i + 1)], 8)
>              ^ rol32(mc[CR_ST_BYTE(st, i + 2)], 16)
>              ^ rol32(mc[CR_ST_BYTE(st, i + 3)], 24);

Aesthetically nicer:

                        mc[CR_ST_BYTE(st, i)]
                ^ rol32(mc[CR_ST_BYTE(st, i + 1)], 8)
                ^ rol32(mc[CR_ST_BYTE(st, i + 2)], 16)
                ^ rol32(mc[CR_ST_BYTE(st, i + 3)], 24);

:)

> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>       }
>>       rd[0] = st.l[0];
> 


