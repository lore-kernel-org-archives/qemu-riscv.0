Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44179C87FD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 01:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhemN-0004Sw-Fl; Thu, 31 Jul 2025 21:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekp-0001l8-AN
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:40:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhekn-00018d-Kp
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:40:15 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso983343b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 18:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754012412; x=1754617212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ye5hpRNxeghqWQrxXm1r6vsgWr11gO5dChXwYTAC8gw=;
 b=gjdtrYtEs3AASDMnNZKkrIkRSpHhfY9eKmphHykENUsLW6f1InMQ1O226mgId7+/r7
 78a4vglJMnbKgoZk/3c2khi5xN2KjEb1JTeLzVIACmq2TXBrON1iWmxLsAsTXJiyJL4N
 Lbvr8t15wu2qY2996bqtQAtPuPmGGMkdYe1PvrAKnNO3/Qb1RWm3+MKkFk957LZKxfEY
 QxqhxybR7dzDcYANVhom+Tp5Nje072xXsLYZx6a5aLBpmEaShE6htngEORC86pLVHUK9
 1ioPbZwZWKXizluJWqpHCvg5nuTKN4ds8sKcZQqQFbBMUQaJ+DlVAYGsWrtM3sjRTvVZ
 mxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754012412; x=1754617212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ye5hpRNxeghqWQrxXm1r6vsgWr11gO5dChXwYTAC8gw=;
 b=IX6xLpIHpIJLx7y0VYAwBMWqE3Br3WPAngO7htqXrsu6JEZuDrKLhsRVfojfDk1KIm
 UJ/qiL++od9RXtESAjEg25uWtj0H+0+FRgQ3viYqJlW4Cv3E/bkzWTqjx/16oBPz7nfe
 vGGFHVyFyHg+jGuhn08otbWbwqm3LD67PYQW5b/cFlDcKAyHZHH6j/03P2hBpc0sa2gT
 DAy6Lrg1yIIsehOHHA+qQL30K1+NP5UpmUtvVR1a097iFbdGzgB+WH8SAc1hrbCLgjEt
 nj/Z8FUPu63MYBOIv/6gkF0elC+QVm65ceWrphdhhTyqzfazX65LokyWzXuRc65+r66Y
 3CMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUm/L9QdGF40xW5P9gtZpw6ABkxMIukHxzGM9wmv3kjG/YgKom5vrD7VhkxymJBgVpMnEZ60Kw/N03@nongnu.org
X-Gm-Message-State: AOJu0Yz+c7mLR23iNxmopnuputhtUUwMTLCGUK4Pr4zj6cllN/Qbz3an
 y+wDIV9b0C8ApNNeQNoevztkBHQNbyk4mC7JJc/DM972CW/QbR9SqAsrEaryGUF/oys=
X-Gm-Gg: ASbGncuZvMblPTeclX8s81DUojTbB5YKbhv4VezQXBBBZliWAJPJWxqgD9B4W5Q6na5
 qqVgMOJHYLyZjls+0It/Snf3k7d8wR1XROXpmurBxXBi13aHJRORicqYWRL1f5TzI2GbU9JN2G+
 Kgb3iWhziHAQ4txZTW+CTK7D0+BVc+zLOxGzFtT7FTHkl3gSxYaADEqLV8oHDszd3UUKb86ZXbA
 1CWAZt8UFTCH0V6/XuncCB1Y3+tvlkGReIR60KB6S9aKJ8SoqvYakqZ9FX7JU9Ej7XZKv6R1kl7
 slAvUbVp92QJBfdSxSrdkKMZzHX49CFpVy/e/l5mn6vigHQTRzMqznWaS7E6nffrBgz9U6lKFOC
 FN7vH3vGqbV0K1jR7ZOfn7DPr6sGGIa/L8XT+RkMDkAdIsQ==
X-Google-Smtp-Source: AGHT+IHdelnKGLrIEmWoUUNaZIsBmvi4pgxb8er7ETiIwl0K4lk+RLx0UzL9m/pNrm9mDn3Nrq5+IA==
X-Received: by 2002:a05:6a20:7346:b0:23d:ac50:333e with SMTP id
 adf61e73a8af0-23de8226dfdmr1273624637.43.1754012412007; 
 Thu, 31 Jul 2025 18:40:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8f9b3sm2663859b3a.38.2025.07.31.18.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:40:11 -0700 (PDT)
Message-ID: <02748c9e-38f0-4b2e-a7d0-c697cf860e67@linaro.org>
Date: Thu, 31 Jul 2025 18:40:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] semihosting/arm-compat-semi: replace target_ulong
 with uint64_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
 <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/31/25 4:33 PM, Richard Henderson wrote:
> On 7/31/25 08:06, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>>    1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index e5a665d604b..e3b520631b3 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -123,7 +123,7 @@ GuestFD console_out_gf;
>>     */
>>    
>>    typedef struct LayoutInfo {
>> -    target_ulong rambase;
>> +    uint64_t rambase;
> 
> vaddr.
> 
> 
>> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>>     * is defined by GDB's remote protocol and is not target-specific.)
>>     * We put this on the guest's stack just below SP.
>>     */
>> -static target_ulong common_semi_flen_buf(CPUState *cs)
>> +static uint64_t common_semi_flen_buf(CPUState *cs)
>>    {
>> -    target_ulong sp = common_semi_stack_bottom(cs);
>> +    uint64_t sp = common_semi_stack_bottom(cs);
>>        return sp - 64;
>>    }
>>    
> 
> vaddr.
> 

Will change to it, thanks.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~


