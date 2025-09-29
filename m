Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A99CAC5B9
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 15:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Ff6-0007RF-Qz; Mon, 29 Sep 2025 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3Ff4-0007Qd-Ae
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 11:19:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3Feu-0006pA-0y
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 11:19:32 -0400
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso703575e9.2
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759159159; x=1759763959; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o14JpL0T0jjQKC0IN3HA4kheY94YveiYMNA4OZJG7K0=;
 b=LMOuPGqt3fQ4Zcb9WmTAQ9WdVpdBm5muNhGTOaFdYRWOvVxfZFOGPjwdJSKpw1Qs9a
 xA2qsOhiep1WKKq8I1p/308OZY8JsbFoCRxBYVqknZccs0UwAJytBxcBZxB7qHMhts+s
 y6c5rG/0Rlkhy+LzmmzQaED2w2/WIKzPBMmie8Ok21uyGFeDXPRMPGZr3HK+iieyNWMo
 QJhCcqQ/OPyYYYNdV5X9XGgPjfymu32OdftXz0VsHoZ5e9P899BVwj651u5z1OibhPvN
 VLzesIITnWbCKoMpFBIKH5VCVg8xMK4KqQdX65tI4tZ/g/evaJA623KpdN6RHEUxmc+b
 u5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759159159; x=1759763959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o14JpL0T0jjQKC0IN3HA4kheY94YveiYMNA4OZJG7K0=;
 b=IWFDfP6rkCpaQmpLd3t//a9H317j/0A/Hrsk+aC/SZK9siJFPLXvEZF4b1yoNoCHd4
 KcBQFEJk9EbYLH910Z1w5m1vBHUv6ZbLeZczVcru1A+YJ/ca7SUNilJktXpdDHd2QoYN
 kkilztn8erTWjrqGh7sZcsZ9HVF1FCBL2cCvtxDuZD6WJ3AaK9lNix/UaNFonIxMUOXt
 /VtRliTzTwFuzFgtni4vWfJlr0/IJpb7jGvrpXYO9BrsYEG/BgoRl+W3ADgCBZMpy4fc
 tb4AqX3Sup+vWUI4E/GpxZJVbP75OO517LZYL9chk6AHeilPuydzsLuaus0lvXQj2mE6
 Qv5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVyXZIt7syjjnOrB/xeuDlCcB+bfecE2PHBtBfMP9By85y6PKFssNYhk6hv/v40UxycdnRhKV0DHTc@nongnu.org
X-Gm-Message-State: AOJu0YzV5jykRfvEPfbgyOLRlZqMGTC128watIEeaQGgkzbH1q0C87IS
 7coZD3fkyKcQjsQoDsqBFiHIJ3w7xuh/PvO8yo0Jdts8JDLJjlvF1uOyrmC1ZxGnw+s=
X-Gm-Gg: ASbGncuXPxA+9zdxFNSDKy7LzKiUPR1KcR2cv6q4iMfmTxcCZO21DDjUmrsp9eNPmIa
 UE8I59OZLhUKe7a26U6x/zU0hU414wqG4h7CaU03hAHBlDWaU9hka+Oo75w9YB1z2xidbv4F8Vs
 acEH/SP40PIj5XPhNrYr2bdXu0yutFtkFruLsm/1cl2U1O85n4LT8qjXd7ZJLjVqFHWzrR7ezBc
 5DmvMmCHovHO6q3epWq1vA336IGNcQ1KkloWn+egVXyEoxRNVJqjySBrwZXQ903GudN/R/Mx50t
 kHBBSlJQnk/ri6/si/784IWD78VaBmWFj3vSU5ClaeAB6HHQCUFwH5D8lcILs7xqSOSxH0eupL8
 vIf04A3bPiEq9yETNW8zhKt6WX2omseN1Du4knjcq4HxWYt7wkrReLe7cITzv+XIW5NqD95CtVX
 Qf
X-Google-Smtp-Source: AGHT+IG6syzJUXTrGnVt7Npls2km5gQj+MtupwaUoSmLc0aW/szXNSdxJoB1eLOCnw5yOnOdxZ4FUA==
X-Received: by 2002:a05:600c:548b:b0:46e:32f7:98fc with SMTP id
 5b1f17b1804b1-46e32f79d44mr117922605e9.21.1759159159208; 
 Mon, 29 Sep 2025 08:19:19 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602dfdsm18549379f8f.33.2025.09.29.08.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:19:18 -0700 (PDT)
Message-ID: <726f2410-a977-4142-9f17-82b0487d5be8@linaro.org>
Date: Mon, 29 Sep 2025 17:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>
Cc: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
 <cc5b1d2c-90cb-4276-a192-fd0ce9e926e8@linaro.org>
 <x6aqkgtvpzki7sgy7vkwqky76sfuvgs4qgf6g7jm2exks4j7tr@m76wj23zdejf>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <x6aqkgtvpzki7sgy7vkwqky76sfuvgs4qgf6g7jm2exks4j7tr@m76wj23zdejf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x344.google.com
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

On 29/9/25 17:12, Anton Johansson wrote:
> On 29/09/25, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>>
>> On 29/9/25 13:55, Valentin Haudiquet wrote:
>>> From: vhaudiquet <vhaudiquet343@hotmail.fr>
>>>
>>> Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.
>>
>> I suppose you mean "big-endian host architectures".
>> If so, please clarify.
>>
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
>>> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
>>>
>>> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>>> ---
>>>    target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
>>> index c77c2b927b..dd15af0f54 100644
>>> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
>>> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
>>>    static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>>>    {
>>>        REQUIRE_ZCB(ctx);
>>> -    return gen_load(ctx, a, MO_UW);
>>> +    return gen_load(ctx, a, MO_TEUW);
>> NAck.
>> Please do not use MO_TE* anymore. Use explicit endianness.
>>
>> So far all our RISC-V targets are little-endian:
>>
>>    $ git grep TARGET_BIG_ENDIAN configs/targets/riscv*
>>    $
>>
>> If you are not worried about RISCV core running in BE mode
>> (as we currently don't check MSTATUS_[USM]BE bits), your change
>> should be:
>>
>>   -    return gen_load(ctx, a, MO_UW);
>>   +    return gen_load(ctx, a, MO_UW | MO_LE);
>>
>>>    }
>>
>> Regards,
>>
>> Phil.
> 
> Right, I forgot about the MO_TE changes when reviewing. My bad.

Well, since this is a bugfix for current tree, maybe let's go with
this patch and remove MO_TE on top...

