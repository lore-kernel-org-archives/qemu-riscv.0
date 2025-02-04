Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447C5C02193
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 19:11:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfOK3-0002Rs-Sc; Tue, 04 Feb 2025 14:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOK0-0002QG-NJ
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 14:10:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOJx-0007pt-9L
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 14:10:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283d48so44667705e9.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 11:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738696251; x=1739301051; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eqgr5shpCO/hEIaKEyQKSGNXhXaBTHRJwfrnUc+Ak0A=;
 b=eg8RjvU00VuvyKCCmS9lN7v6Oz46bO0svCKUhKociayqZ/EWfaqiXch+hPn9b/GRzq
 LmLX12Qfu7Pb3vSUTwpVce/L7llD09rwS8Zr3VUdGuWSrfd30h3JTkmsWxgMnB0gy6Ai
 RijsiZadEjZ0WiMEP3Gq4BG9XC7pSr2Av0SoG1k+v/0ReExSBgPNh/oNfAJ7OALu0tTR
 ga55Fe6Ta/GFCdBbVIP5BAEz1dAAFYR4iqo1qNt4lOy4NzzV3W7Bkr/bBYKHs8TCOXaN
 713rYlBerDPPSQGR9MXVrAkORrNxtRAK2+k76F5HRJxtXGC5B0kWxltMJ9+5clFGk0m/
 caOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738696251; x=1739301051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eqgr5shpCO/hEIaKEyQKSGNXhXaBTHRJwfrnUc+Ak0A=;
 b=jVLzchShHFljL0LBGWY0f+qxs4kcbMnRczIK8p8zZuafbkd/ymtUtcklDGDjKi1Jr9
 QpQVW/QNnRf3AfxkQfQBGt667I81JZZZi/TLeP6RP588tGi26XyyAyXkOWtzE7jipT6n
 hFh9DJG5jX3GtkYysk4UuI1l2sRGzI34+HrhxlJf9c6wrttmxa2fYigtdJTpq/0h+GzN
 9MWtHvjWDEljDGJwXr07YYhbSR0SGPkguNVv7Q2U2X+i+ZopJAlvfZMCQxUvHMzpI1IH
 4Ze+iMqt6k0d5+2B894PelJeHSh8uBo/jApfUqb11nSmX+xMO5rtakczUSVBvqztFXqg
 Q+GA==
X-Gm-Message-State: AOJu0YxmKY4MQWtoVWmnTPjiPGL1mhe5d536A5LUp9aS1lqWZKg0xvi6
 I2nCwMwJ7SZ+rQo6Ppx+0MsvjGrEAjTEQQ2QbcJC/yzRJESZGzw8jAfNzUsqz8M=
X-Gm-Gg: ASbGncuON5mtvxs9hJWNuHw7EUIF9CLuY/30VrxDAg+HolZRYcLhrMoanSJ4Q+JnQ+h
 ZD0OxX8f6eK6h7QUm0oVfHtWnsuG+BiaA9UjnpKRnvKc3LyvHsmWBuKQjTrBhGPi6Ghqq8vX82G
 I77F0VHI3tD8bV8hs7DOammMbx766n3cKL4QIfwwVV2tF7qbYi91GtenDy/tbwc+EsITCqETwdf
 9ZmH+xluF8n5PqHDA776xdtIdFEW6S6d9dWNSDyg3dH0VmDLyzhMB5e+Tvr3Auwef7FE6QvWREp
 K57JFBT/Vyr1qTEJ2Mlu6RfMaiJ8hR94XgcT5wGNjBahBodkrgNIiCeFW50=
X-Google-Smtp-Source: AGHT+IHZeqDu0P8mvEcoSdAe7XsTkYpde+2I1hFjdYCnEI2yXUOlO00MNsGJWrRX7Pef+E7PuQ93Kw==
X-Received: by 2002:a05:600c:3508:b0:435:194:3cdf with SMTP id
 5b1f17b1804b1-438dc40c43emr222668025e9.19.1738696251037; 
 Tue, 04 Feb 2025 11:10:51 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23dea58sm196996815e9.15.2025.02.04.11.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 11:10:49 -0800 (PST)
Message-ID: <fa49a483-0ec9-4e38-9eff-65f246c12d2c@linaro.org>
Date: Tue, 4 Feb 2025 20:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] hw/arm: Remove all invalid uses of
 auto_create_sdcard=true
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-7-philmd@linaro.org>
 <bf0a2502-42e5-410c-83fc-ff966cd242ef@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bf0a2502-42e5-410c-83fc-ff966cd242ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 4/2/25 19:44, Thomas Huth wrote:
> On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
>> MachineClass::auto_create_sdcard is only useful to automatically
>> create a SD card, attach a IF_SD block drive to it and plug the
>> card onto a SD bus. None of the ARM machines modified by this
>> commit try to use the IF_SD interface.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
>> index 4d84d10d24c..0a4b6f29b1c 100644
>> --- a/hw/arm/bananapi_m2u.c
>> +++ b/hw/arm/bananapi_m2u.c
>> @@ -141,7 +141,6 @@ static void bpim2u_machine_init(MachineClass *mc)
>>       mc->valid_cpu_types = valid_cpu_types;
>>       mc->default_ram_size = 1 * GiB;
>>       mc->default_ram_id = "bpim2u.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
> 
> The bananapi seems to use IF_SD ... could you please double-check 
> whether this is the right change here?

Hmm I think I missed all these cases because in the last patch I
neglected to check ambiguous sd-bus with the object_resolve_path_type
call, which only matched machines with a single sd-bus 🤦🏻

>> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
>> index 43dc89d902e..2410e2a28e8 100644
>> --- a/hw/arm/exynos4_boards.c
>> +++ b/hw/arm/exynos4_boards.c
>> @@ -165,7 +165,6 @@ static void nuri_class_init(ObjectClass *oc, void 
>> *data)
>>       mc->min_cpus = EXYNOS4210_NCPUS;
>>       mc->default_cpus = EXYNOS4210_NCPUS;
>>       mc->ignore_memory_transaction_failures = true;
>> -    mc->auto_create_sdcard = true;
>>   }
>>   static const TypeInfo nuri_type = {
>> @@ -185,7 +184,6 @@ static void smdkc210_class_init(ObjectClass *oc, 
>> void *data)
>>       mc->min_cpus = EXYNOS4210_NCPUS;
>>       mc->default_cpus = EXYNOS4210_NCPUS;
>>       mc->ignore_memory_transaction_failures = true;
>> -    mc->auto_create_sdcard = true;
>>   }
>>   static const TypeInfo smdkc210_type = {
> 
> I think this is likely wrong, too - they use IF_SD via exynos4210.c, 
> don't they?
> 
>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>> index e95ea5e4e18..c9c2e5dd3b1 100644
>> --- a/hw/arm/imx25_pdk.c
>> +++ b/hw/arm/imx25_pdk.c
>> @@ -147,7 +147,6 @@ static void imx25_pdk_machine_init(MachineClass *mc)
>>       mc->init = imx25_pdk_init;
>>       mc->ignore_memory_transaction_failures = true;
>>       mc->default_ram_id = "imx25.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
> 
> This machine seems to use IF_SD, too?
> 
>> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
>> index 86982cb0772..690cb64ef36 100644
>> --- a/hw/arm/mcimx6ul-evk.c
>> +++ b/hw/arm/mcimx6ul-evk.c
>> @@ -74,6 +74,5 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
>>       mc->init = mcimx6ul_evk_init;
>>       mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
>>       mc->default_ram_id = "mcimx6ul-evk.ram";
>> -    mc->auto_create_sdcard = true;
>>   }
>>   DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)
> 
> dito?

[...]

