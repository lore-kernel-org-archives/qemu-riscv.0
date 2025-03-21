Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF4C36000
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 17:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvgPS-0000Xu-BS; Fri, 21 Mar 2025 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvgPL-0000XI-8b
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 13:43:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tvgPJ-0006Gy-Jr
 for qemu-riscv@nongnu.org; Fri, 21 Mar 2025 13:43:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so1690123f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742579023; x=1743183823; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ffp+FJ6iWhSQvdeCaei1t2HUUY55pSIFlatWQrOLzXE=;
 b=ZZ6BAw9RZlxoWZ0mgDEOParCUu6Vdpq7aIKvOwrSmo6fLrWzEF01eY6axAVAtJffcE
 Vk7FW2hJ4v8pLWnRqE3VTAIJ9nGKPgQEQnXmiMM1vcPHxIwuj3HK1CdmeVDnHSoJQ/VE
 htFAeHIY5q7c/zHxVVlfcHG7BedX5UFbDjfkLRhF6M7+2Tc40uK3pGP7Ge9C8T0VWKcP
 fzK0d7kMO7EOCIU3QCNctPha3xC7yW26N5EN9OsvEHOBVKt7HNjLPlMphiZ/Hz93SMXk
 Oot6WVAlUU6V/p53wTrJdAFZBpykY4OJUnhpr+yXZWhI5iNmZqw5YdLiOWLKe3vW25Gq
 v0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742579023; x=1743183823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffp+FJ6iWhSQvdeCaei1t2HUUY55pSIFlatWQrOLzXE=;
 b=GP1qoR2e3daFh4Y1Sxr6Hh90b1XDOtzk/Oqhoc+Ycu2M1tWF7632sSz1JxwhM1gkj+
 7q3dCTnhFb5shH59jd1Ur+vFE3VhvqQvxTn9hHIkjL9qZ9eDOGnLC5ogGu4qwSM5yzTp
 XhbCzsNeFMpkTnyh6NX7sLX/a/TpCkEzANENZ+fqeRQMNOck6S12471yED0ZCuPX/ONh
 J2Y+q7joCniRg5j/3PCk2cHHLuUEZGufd6El1dAeQsxJdjJkAdy3jLJLRb08bNU7u2Xy
 Hc8THDgoZpwQHV4tjuowChBtJDM+OBMGCNQw7Kj1Dwp7xFDFPy7y7BYp1iGOjOQ2MNGI
 aRug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcHhShVR/eHhYGoQ2whT3iRCo6j4nhDIycZ5m/hvI77hel97g0uwxhBWguTBAoi/Nc3gbSMtfVHbPf@nongnu.org
X-Gm-Message-State: AOJu0YwRaJisvFtMqvod/jJ30DE790XENj36AHCriUwC3wJ0dyUPsgfH
 txfRy1i44srrXikNfFGBgHfWY0W0bimNxrx4K7S1ZyDhF7kLY1jW6Q7qLXarDUs=
X-Gm-Gg: ASbGnctSrJG7aYrTqLHhv9RfxsiH9+PO7HA/bOPuuGmJpmrctQGvuSSE3epAXpNPSq3
 jW5uxTZuc2oaoCOFB/8YavC34PvtJIcm8uhIG6LXHnfKAxByLi/PmWTfv8RmlZ89HlaNmZjCioG
 5VLzGJXwEae/l77Wi6YOqgAKbkEbqpans+ewuIJvjumR9yj4RtFV5Vs/FcDhD2jYSXQKUM96uwc
 Xo08e9jm4KAtuUEu+a5/loYMviiscCecWYPIbDGxc8xuYfOOD6V7gfQmgEf8Tz2YO3+Po1t1O92
 omrDcAxCPB0Vn9JzoKCh7PbzLRNbjfhq2cUE7FakmrxAumoo/Pp9efQq0hcFKfc7zBg6W6mt2D5
 fnMjNumTkmJ46
X-Google-Smtp-Source: AGHT+IFTfFoD1qdu+7RkrahLO3/ZwWjjR5uBm77eLJfzrzEl7v4xe94nqvd8rCKdvOWLeVJUBI0sGA==
X-Received: by 2002:a05:6000:1fa4:b0:391:952:c730 with SMTP id
 ffacd0b85a97d-3997f8f8c1fmr4074869f8f.11.1742579023278; 
 Fri, 21 Mar 2025 10:43:43 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efe61sm2973189f8f.97.2025.03.21.10.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 10:43:42 -0700 (PDT)
Message-ID: <b4556abe-2b9e-46d1-9135-498bc30e8a91@linaro.org>
Date: Fri, 21 Mar 2025 18:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/1] goldfish_rtc: keep time offset when resetting
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Frederik Du Toit Lotter <fred.lotter@canonical.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20250321081255.30564-1-heinrich.schuchardt@canonical.com>
 <5dd32cd5-ff51-4d28-bbaa-3153493dec39@linaro.org>
 <3252f0c4-654d-4066-8f9c-87d56d144a6f@canonical.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3252f0c4-654d-4066-8f9c-87d56d144a6f@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 21/3/25 17:10, Heinrich Schuchardt wrote:
> On 21.03.25 17:08, Philippe Mathieu-Daudé wrote:
>> Hi Heinrich,
>>
>> On 21/3/25 09:12, Heinrich Schuchardt wrote:
>>> Currently resetting leads to resynchronizing the Goldfish RTC with the
>>> system clock of the host. In real hardware an RTC reset would not change
>>> the wall time. Other RTCs like pl031 do not show this behavior.
>>>
>>> Move the synchronization of the RTC with the system clock to the 
>>> instance
>>> realization.
>>>
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 9a5b40b8427 ("hw: rtc: Add Goldfish RTC device")
>>
>>> Reported-by: Frederik Du Toit Lotter <fred.lotter@canonical.com>
>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>> ---
>>>   hw/rtc/goldfish_rtc.c | 14 +++++++-------
>>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
>>> index 0f1b53e0e4..203a343511 100644
>>> --- a/hw/rtc/goldfish_rtc.c
>>> +++ b/hw/rtc/goldfish_rtc.c
>>> @@ -239,15 +239,8 @@ static const VMStateDescription 
>>> goldfish_rtc_vmstate = {
>>>   static void goldfish_rtc_reset(DeviceState *dev)
>>>   {
>>>       GoldfishRTCState *s = GOLDFISH_RTC(dev);
>>> -    struct tm tm;
>>>       timer_del(s->timer);
>>> -
>>> -    qemu_get_timedate(&tm, 0);
>>> -    s->tick_offset = mktimegm(&tm);
>>> -    s->tick_offset *= NANOSECONDS_PER_SECOND;
>>> -    s->tick_offset -= qemu_clock_get_ns(rtc_clock);
>>> -    s->tick_offset_vmstate = 0;
>>>       s->alarm_next = 0;
>>>       s->alarm_running = 0;
>>>       s->irq_pending = 0;
>>> @@ -258,6 +251,7 @@ static void goldfish_rtc_realize(DeviceState *d, 
>>> Error **errp)
>>>   {
>>>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>       GoldfishRTCState *s = GOLDFISH_RTC(d);
>>> +    struct tm tm;
>>>       memory_region_init_io(&s->iomem, OBJECT(s),
>>>                             &goldfish_rtc_ops[s->big_endian], s,
>>> @@ -267,6 +261,12 @@ static void goldfish_rtc_realize(DeviceState *d, 
>>> Error **errp)
>>>       sysbus_init_irq(dev, &s->irq);
>>>       s->timer = timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
>>> +
>>> +    qemu_get_timedate(&tm, 0);
>>> +    s->tick_offset = mktimegm(&tm);
>>> +    s->tick_offset *= NANOSECONDS_PER_SECOND;
>>> +    s->tick_offset -= qemu_clock_get_ns(rtc_clock);
>>
>> OK
>>
>>> +    s->tick_offset_vmstate = 0;
>>
>> This last line is pointless. Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Thanks for reviewing. Is the DeviceState structure fill with 0x00 when 
> allocated?

The QOM hierarchy of this device is:

GOLDFISH_RTC -> SYS_BUS_DEVICE -> DEVICE -> OBJECT

When objects are created, object_new() ends up calling
object_initialize_with_type() which calls memset(0).

Objects initialized "in place" via object_initialize_child()
also end calling object_initialize() -> object_initialize_with_type()
then memset(0).

So yes, QOM-based objects have their state zero-initialized.

Regards,

Phil.


