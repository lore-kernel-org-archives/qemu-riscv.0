Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525FBCA0EC4
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 13:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulp2o-0004n5-Vu; Tue, 12 Aug 2025 09:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulp2j-0004mb-E7
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:27:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulp2Z-0000vh-WE
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:27:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b914a9c77dso351152f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Aug 2025 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755005261; x=1755610061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNjUzMIbour4t9m+Ur6cjACD01Gv7DIbXsV8ETBdw+U=;
 b=zbqnyl8co8Ew3Ys1+HUxch3uTrBEnRKECjCqrraFDyaf5DUeqUin6sWjVKQ8s5WPnn
 visqNlnprrZ1lRxe79jUTLvFflANJVT8G9K5ZCDJ9prK+EKD+5r+HSTF5bStuyfWhn/M
 QVRVu+o3qMesopG0fWQAu8JpqQooa21OStwdPKtI70pOLxnRGDt+OfRATxUJ8O7BEgu8
 s12UEmuiCz5/co/jrjwQHPDGthC5wVYIvi2z7Yll4cQKnZVaksqefV8SXGeP3k40kcKe
 bIC9Jw3MLynkZU9jyquwMoFxNR3DB9tEuvQF5KjTHRgx75KQvFW8hMsfPG+BINugNYjx
 DYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755005261; x=1755610061;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNjUzMIbour4t9m+Ur6cjACD01Gv7DIbXsV8ETBdw+U=;
 b=QcPV6g3/zPPeibYMn4sP9AqySQkSiWTjy03BgtnPCEAxPoAUplXqu2BCZKdERfHaHU
 lKOx5RbvbADukGmd44D8lmVfaySZILKDLADX5CYGTg/N53KTN5rqolglLDn9Yo35r2bL
 KLybwOg812A5ZBM+uElHQ3kLQQeFPuwwIXuisRZiFNP52nEsGpx+dVsP1mOtiszHZG9X
 tETvw9HqXYIX/JG5xWF8g1Osl1sxvkTXoG6XnJ6fxfKd9Tz7gfzoPhHpKHtnFMDP7VrZ
 eHFlSfcjQZ7QGttKKDUfXs3pfOcVZ6ZLdwkjP5aAofW9EAgxsrjrlRuYUYi5hWMbNkL/
 7yxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJCGG9PIEuAoi4Xth7UJaNVX0W3sjmLgLrMoxzh1dpmZJ6hM+zO3A7xzQ9b57MxwGJk3FxMV4Rqm7Y@nongnu.org
X-Gm-Message-State: AOJu0YzM1ELOdhjR/BNNvbpjWd3nIXCMAUzytXC2FyA4xH+w9Rjl7dgv
 t4IW8Jqk4eNwXfGTHNlXZjFlqektTtI9lQIo7nXn8KzVtW5VIfPZErtWCHuFxMc+bUg=
X-Gm-Gg: ASbGncur6sky6bDY5RcSqxmH/8m37In3U7D4tXGGD7lgHJWYjRJmKb3VbFzqfTWDx+8
 C7pnOhiIOT2dq+Xf0Bnu2uLEwjPBlTzx5T5nfgtnaZfpRDfjBL2ZVAWbGnl4QShOTY6s8Y0nYGM
 kVugnNXjvsTvJ3VLLOrW/0+Q2lmCimJo0lZnRAvBHJFBFt6GqZ2vd7wVGxQkYCGqRsYqJLee692
 3L9nOEASdGHeKc1gMrtNEF7GEB7fv2d2nO+S0pKQPgrlQZ5pA9N/pO/6f+jpevHope4fuC2SUdW
 RJBsdeiRfQyaECTHgVU1u+GQJDMVf8aZfD8FGLOwNTiHb6cyWfUMYFmJGFAY4UhUtUSi7Q2yXLM
 mccB3ZDoG1AL15PsuGPz4+NifHBZozM98XyryI4WfC9+qyuN/cHFhCB4Sy2bv3be4/WgXD//GGO
 Pc
X-Google-Smtp-Source: AGHT+IHMnMs73Gl/6RxGuQnMH6YU/9yNkxEESVLp1VUa+xKA4H4JM6P5L5kTTn47AACff54MEsQbbg==
X-Received: by 2002:a5d:5f82:0:b0:3b5:e714:9c1e with SMTP id
 ffacd0b85a97d-3b90092ca4bmr11840120f8f.12.1755005260591; 
 Tue, 12 Aug 2025 06:27:40 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf970sm44081104f8f.25.2025.08.12.06.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 06:27:39 -0700 (PDT)
Message-ID: <681ecca9-272b-4851-8726-9daf7630b5ac@linaro.org>
Date: Tue, 12 Aug 2025 15:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 1/2] hw/sd/ssi-sd: Return noise (dummy byte) when
 no card connected
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-block@nongnu.org
References: <20250808135115.77310-1-philmd@linaro.org>
 <20250808135115.77310-2-philmd@linaro.org> <87o6skad76.fsf@draig.linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87o6skad76.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 12/8/25 15:20, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Commit 1585ab9f1ba ("hw/sd/sdcard: Fill SPI response bits in card
>> code") exposed a bug in the SPI adapter: if no SD card is plugged,
>> we shouldn't return any particular packet response, but the noise
>> shifted on the MISO line. Return the dummy byte, otherwise we get:
>>
>>    qemu-system-riscv64: ../hw/sd/ssi-sd.c:160: ssi_sd_transfer: Assertion `s->arglen > 0' failed.
>>
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/sd/ssi-sd.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
>> index 594dead19ee..3aacbd03871 100644
>> --- a/hw/sd/ssi-sd.c
>> +++ b/hw/sd/ssi-sd.c
>> @@ -89,6 +89,10 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>>       SDRequest request;
>>       uint8_t longresp[5];
>>   
>> +    if (!sdbus_get_inserted(&s->sdbus)) {
>> +        return SSI_DUMMY;
>> +    }
>> +
> 
> Seems fair although it's hard to track what is consuming this value. I
> think we end up in ssi_transfer() which a surprising number of calls
> don't even bother checking the return value, other just seem to | the
> result when iterating across devices.

A SPI transaction consists of shifting bit in sync the CLK line,
writing on the MOSI (output) line / and reading MISO (input) line.

IOW, each time you write a word, you also read it at the same time.

When a driver just wants to write, it is OK to ignore the returned
values.

In this case, we don't want to return "There is a card with error"
because there is no card. We shift the request on the MOSI line,
but nothing replies on the MISO line.

Should I reword the commit description?

> 
> We should probably improve on the definitions of transfer/transfer_raw
> and explain what the return value is.

Agreed.

> 
> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!

