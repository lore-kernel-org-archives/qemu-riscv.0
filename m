Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4C8EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:35:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOlw-00063w-DP; Wed, 28 Jun 2023 02:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOlu-00061q-Te
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:35:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOls-0003g2-UP
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:35:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso5364325e9.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687934119; x=1690526119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GztW//yi2sBePXq0XAR/HTbABRV/qyaeMB+/3zab8is=;
 b=dd5WBqoMajYAa6ioiZgGH77izx9NWXNUeNEnpE0Q4AetG3pd65Ouz3xaeDt3Mdriay
 u810zVbjfThIhiTdEN87NpwtPPcjgzIaEfnGBW3DmVZITyAIk0UUEvT/kHWsE0iGePMT
 Y+yzRsmIZzc7e0RXhwa5Pp/V4XX0dI76dr2Dth1UpyDNB74bmh/rNGAgRnlO76qLBorz
 /JcMxCZk+5nHHahYpigPtDmzh4QpktH84D1k9+SY0YNKUSY8/PXDGSooJ8EAWrn0oZ7L
 m614ADhzSWulzMWMkjtwp/WRnUXT5jMPxd5zg/HEzEZibJOJ/bywkhnJ9XtwJ1KF16Bc
 zx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687934119; x=1690526119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GztW//yi2sBePXq0XAR/HTbABRV/qyaeMB+/3zab8is=;
 b=JlcqjYpE6MKPIaAiaxtJiu/Vzy0XsSHp7AM6XoHxL8IsePgHPaaQuTxXuvOKfR/kuu
 jGe6yEU1Dn7utKeCD5NeF0CHL+ftx6vHRnkLs5j7CP78rcsUiu/xttBvGyDCw6LokNdR
 kYVygBZN0XaWpKcbaR+rliZlmCXmxV8xybkGKaYeZz0aD+Pnu1IjkpyNcloBPnXudVp9
 VXLSlt1aqOtMFjnuJlvGTFZmyQApEB33s5DsX4c/94KjY83jIx/x9a83XdcMHiwGnmgU
 7+1c8S/NjC4OKAdwrXLWutwWaZJbtY/5Nnl/+5mPj68hPnZ8dsPH0j+8rNO4YRMA38qR
 grxg==
X-Gm-Message-State: AC+VfDyZTeV/R3f/t0IEpPrZX6rY20BEHnk7hdGpfgBlk82vx/noebLM
 L9+C2tem6efUEFgDVg4y/7clsA==
X-Google-Smtp-Source: ACHHUZ4LrgJFIDcTEgbtHNNAPqIH8rGIXOEGMHhG8WDo5Izwl9faZrK54m9Y9OpWFCet5qRu+JWcRQ==
X-Received: by 2002:a05:600c:230d:b0:3f6:d90:3db with SMTP id
 13-20020a05600c230d00b003f60d9003dbmr545168wmo.3.1687934119084; 
 Tue, 27 Jun 2023 23:35:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a7bc398000000b003fb9ebb6b88sm4476149wmj.39.2023.06.27.23.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 23:35:18 -0700 (PDT)
Message-ID: <c2c09ab0-1f87-6e0e-6c0b-c8347bb9f93f@linaro.org>
Date: Wed, 28 Jun 2023 08:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v5 11/19] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-12-dbarboza@ventanamicro.com>
 <e217dfb9-a4c2-12e3-6053-ef2167f30a05@linaro.org>
 <997135f3-f9a3-7974-118c-48e8fb1e04d2@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <997135f3-f9a3-7974-118c-48e8fb1e04d2@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

On 28/6/23 02:04, Daniel Henrique Barboza wrote:
> 
> 
> On 6/27/23 18:29, Philippe Mathieu-Daudé wrote:
>> On 27/6/23 18:31, Daniel Henrique Barboza wrote:
>>> Next patch will add KVM specific user properties for both MISA and
>>> multi-letter extensions. For MISA extensions we want to make use of what
>>> is already available in misa_ext_cfgs[] to avoid code repetition.
>>>
>>> misa_ext_info_arr[] array will hold name and description for each MISA
>>> extension that misa_ext_cfgs[] is declaring. We'll then use this new
>>> array in KVM code to avoid duplicating strings.
>>>
>>> There's nothing holding us back from doing the same with multi-letter
>>> extensions. For now doing just with MISA extensions is enough.
>>>
>>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++--------------------
>>>   target/riscv/cpu.h | 11 ++++++++-
>>>   2 files changed, 44 insertions(+), 27 deletions(-)
>>
>>
>>> +const MISAExtInfo misa_ext_info_arr[] = {
>>> +    [RVA] = {"a", "Atomic instructions"},
>>> +    [RVC] = {"c", "Compressed instructions"},
>>> +    [RVD] = {"d", "Double-precision float point"},
>>> +    [RVF] = {"f", "Single-precision float point"},
>>> +    [RVI] = {"i", "Base integer instruction set"},
>>> +    [RVE] = {"e", "Base integer instruction set (embedded)"},
>>> +    [RVM] = {"m", "Integer multiplication and division"},
>>> +    [RVS] = {"s", "Supervisor-level instructions"},
>>> +    [RVU] = {"u", "User-level instructions"},
>>> +    [RVH] = {"h", "Hypervisor"},
>>> +    [RVJ] = {"x-j", "Dynamic translated languages"},
>>> +    [RVV] = {"v", "Vector operations"},
>>> +    [RVG] = {"g", "General purpose (IMAFD_Zicsr_Zifencei)"},
>>> +};
>>
>> Personally I prefer using a getter() helper because we can check in
>> a single place for empty entries in the array.
>>
>> IIUC this 13-entries array takes 4MiB (RVV is '1<<21' = 2MiB).
>>
>> Wouldn't it be clever to index by [a-z]? Except "x-j"...
> 
> 
> Well .. RVA is 1<<0, RVC is 1<<2, up to RVV 1<<21. I guess this array can
> be indexed at zero, and then we create a getter() that retrieves the 
> element
> we want using ctz32() to find the right index. Something in the likes of:
> 
> MISAExtInfo *get_misa_ext_info(uint32_t bit)
> {
>      return &misa_ext_info_arr[ctz32(bit)];
> }

Certainly cleaner :)

> And now, since we're using a getter, we don't need to export the whole 
> array
> anymore.

Yes.

> I'll see how it plays out. Thanks,

Thanks! (and sorry for jumping late at v5)


