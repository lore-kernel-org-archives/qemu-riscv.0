Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434D2C02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiBAa-00089j-13; Wed, 12 Feb 2025 06:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBAP-00087k-Q0
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:44:34 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBAK-000213-8i
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:44:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso46673825e9.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360665; x=1739965465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUtgXWeGjH4fmUCFTN1pAgkStUkgWd6guj/Zi5JuNq0=;
 b=aWmGp5dOtduKglVDbobIIZIOwmXk/tN/cvSGHB/M00j8Ya7vyP/6xg5b4GniaaAqPi
 KLjBAQp1recKH7NX3GD8CoBwnScE4ebdY/Hn0oDjn/FM6f8S8Yv+Yqnyd+W/jUTr0ll6
 cOn+4LG5+hunsAQhOiro3iRVebop03f7yWngQV/1OLah/DhkeRHmmN5DgZf/iSj6ZC22
 fo3UnvHKX0yJh9z7Ehi3FZS2g7NJWAd4mql1Kd1CVsCBQqwrE9uJi/LRxlPHu/owARhg
 3VFNO0pJVbkzmA6pd0PqRIvSDy7xn5rNCowG2GlBLZFkxKIA++MDRoBdGFwqTb1Hap2w
 r41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360665; x=1739965465;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUtgXWeGjH4fmUCFTN1pAgkStUkgWd6guj/Zi5JuNq0=;
 b=FuOD16qYMFHk6DpAYMmVNPZMK/VKb2vm52q1AmBkg4fNzuX9ckMGtyYx+b59tX3wBo
 lx5/izw2v1xBJJpbqqdCByo9FML70KT1yvLGaRrUy7lr/N8FfwwSv+zj9mhsGGgV4IbD
 8jHBARXWPgi5r8rkRlXuCw4BDNp9/adwGKFECYAEfs7iZtat8SSB3u7QDYfccnoI7ImV
 CtQ+yxqOk6t7mq5aU5Xnh3GRBTiDqmsXm/ghBBLSqPhgekML10bm7ReX2+2ngyXPp2FH
 SGQyPsR/CT3uhDchFh9jIRun7HjjJK2/dpgAVB9jPKCoo/+F1Ln5sY6pdTSTgt15uhgc
 ZteQ==
X-Gm-Message-State: AOJu0Yy8nj94DUjnAzRAd6M56fC0Y5HUNCUR0s7O+7vjGOQIVuRAtOoo
 BBbW2t/pyL+cgzMtYnIS9WU/k66gQS3qQrfd7q5NlHtkD1xI4THzvWYJIR8x9Zg=
X-Gm-Gg: ASbGncthtdov+JZjcyVDrIpkhKivbYkbjYi5rBI0si+M8wK9YI84THcEnak2+nV+hO6
 J0rzTHgVb3VnllgbjEm6TFQue0V1LGw3hzmtIB5zi62SUEcXQ4qLs/KM5qCAmtqlKqc+j4vCf01
 MAi7AtRMbkU7RqTTx1f/FuwNjarCMxtfc/mMnrpr6zZeQeBKUXRBy/+Yz9BuYSSruN5asFZmy6J
 SNhqE1kPCG5Kf0EjnYkPXKTR8oV1aY8uud+oSIJXzZPQHcuMX2TraMyi5NNZT5QNqnozks+K2oD
 u4j/NC52SDI/XwZWS/3KqHbrT7KEbwmH+ASz0na6AxtbaJKzbxrSR3jPkOY=
X-Google-Smtp-Source: AGHT+IGNcRPoMzg835nHjPOOSzD9N3UIianWBwLzJQ8vegn4CZ8+aSDXyyDTA77urxJZikfMgJENGg==
X-Received: by 2002:a05:600c:1d9a:b0:439:5573:932a with SMTP id
 5b1f17b1804b1-439581cb97bmr27062355e9.29.1739360665149; 
 Wed, 12 Feb 2025 03:44:25 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06b1ddsm17519645e9.22.2025.02.12.03.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:44:24 -0800 (PST)
Message-ID: <e2c0e0fe-dafa-4ed6-be0d-63f9afb5a8b2@linaro.org>
Date: Wed, 12 Feb 2025 12:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] hw/intc/xilinx_intc: Make device endianness
 configurable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-3-philmd@linaro.org>
 <125a3dac-8ef9-4748-a3ce-f8fb97d8cb59@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <125a3dac-8ef9-4748-a3ce-f8fb97d8cb59@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 12/2/25 12:42, Thomas Huth wrote:
> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness for each machine using the device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/intc/xilinx_intc.c                    | 60 ++++++++++++++++++------
>>   hw/microblaze/petalogix_ml605_mmu.c      |  1 +
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  3 ++
>>   hw/ppc/virtex_ml507.c                    |  1 +
>>   hw/riscv/microblaze-v-generic.c          |  1 +
>>   5 files changed, 52 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
>> index 6930f83907a..523402b688c 100644
>> --- a/hw/intc/xilinx_intc.c
>> +++ b/hw/intc/xilinx_intc.c
>> @@ -3,6 +3,9 @@
>>    *
>>    * Copyright (c) 2009 Edgar E. Iglesias.
>>    *
>> + * https://docs.amd.com/v/u/en-US/xps_intc
>> + * DS572: LogiCORE IP XPS Interrupt Controller (v2.01a)
>> + *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>>    * of this software and associated documentation files (the 
>> "Software"), to deal
>>    * in the Software without restriction, including without limitation 
>> the rights
>> @@ -23,10 +26,12 @@
>>    */
>>   #include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "hw/sysbus.h"
>>   #include "qemu/module.h"
>>   #include "hw/irq.h"
>>   #include "hw/qdev-properties.h"
>> +#include "hw/qdev-properties-system.h"
>>   #include "qom/object.h"
>>   #define D(x)
>> @@ -49,6 +54,7 @@ struct XpsIntc
>>   {
>>       SysBusDevice parent_obj;
>> +    EndianMode model_endianness;
>>       MemoryRegion mmio;
>>       qemu_irq parent_irq;
>> @@ -140,18 +146,29 @@ static void pic_write(void *opaque, hwaddr addr,
>>       update_irq(p);
>>   }
>> -static const MemoryRegionOps pic_ops = {
>> -    .read = pic_read,
>> -    .write = pic_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> -    .impl = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4,
>> +static const MemoryRegionOps pic_ops[2] = {
>> +    [0 ... 1] = {
> 
> Hmm, ok, so here we have now an assumption that ENDIAN_MODE_BIG and 
> ENDIAN_MODE_LITTLE match 0 and 1, which would not work anymore when 
> using 0 as unspecified... a little bit ugly ... so maybe instead of 
> changing pic_ops into an array ....
> 
>> +        .read = pic_read,
>> +        .write = pic_write,
>> +        .endianness = DEVICE_BIG_ENDIAN,
>> +        .impl = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>> +        .valid = {
>> +            /*
>> +             * All XPS INTC registers are accessed through the PLB 
>> interface.
>> +             * The base address for these registers is provided by the
>> +             * configuration parameter, C_BASEADDR. Each register is 
>> 32 bits
>> +             * although some bits may be unused and is accessed on a 
>> 4-byte
>> +             * boundary offset from the base address.
>> +             */
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>>       },
>> -    .valid = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4
>> -    }
>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>>   };
>>   static void irq_handler(void *opaque, int irq, int level)
>> @@ -174,13 +191,27 @@ static void xilinx_intc_init(Object *obj)
>>       qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
>>       sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
>> -
>> -    memory_region_init_io(&p->mmio, obj, &pic_ops, p, "xlnx.xps-intc",
>> -                          R_MAX * 4);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
>>   }
>> +static void xilinx_intc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    XpsIntc *p = XILINX_INTC(dev);
>> +
>> +    if (p->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
>> +        error_setg(errp, TYPE_XILINX_INTC " property 'endianness'"
>> +                         " must be set to 'big' or 'little'");
>> +        return;
>> +    }
> 
> ... would it be possible to patch in the right value for pic_ops.endianness
> here instead?

Ah, clever than my reply on the previous patch. I'll give it a try, thanks!

> 
>   Thomas


