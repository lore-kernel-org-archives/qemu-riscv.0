Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976EC02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 18:18:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiHIs-0007V5-1M; Wed, 12 Feb 2025 13:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiHIq-0007Uh-HD
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 13:17:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiHIo-0004JG-Ou
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 13:17:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4395578be70so186995e9.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 10:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739384257; x=1739989057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Ea/unt4MhP0f/terIThLxNfYeVG+ijIsONPszpxo8g=;
 b=AUdbiubXbPyEcboVM+q+q5Dsi8v3ISTYnpqnb3yEznC5hWlzQlgZyomiyBD6ow69p7
 Ylt9/d5r4p3PweqSoAVo7RyMsnB4PrfdGqzGaZy1OBeAidEUKNWAxAhXMKXWIaeocvmv
 f4uQN+j2RkakwJpSqw/y/CZyINgNrq5VvAYUGI4KP/chK/7TpmZuwxvcM622ov8TcNgp
 ixQkiljZSOBOPvCZOm6FMuErYWPwBOA6YWxFDoiitYFpSMOlZPxKuaSHdC975P3hsV4B
 GnJBTzh6I+HNsCxkgoXYlX+wuuQUlZYaiXoHqoPO/3cEFVgcy9xD+D7TH67NJ2RFFVYz
 pHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739384257; x=1739989057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ea/unt4MhP0f/terIThLxNfYeVG+ijIsONPszpxo8g=;
 b=ZKGZJwd6AcGk2cWiHqFSlMYEjTwcOp9Du9kUtF4VSfFa87RsYLh4DthbrV2rKZ4sXJ
 9nCycGWU8AUfj6H5qrgE8Cp16tvPDefpH7r6QGSkGLmlCA0VYOsRLify+UzydMr4nHu7
 FkRjLg5jCoyHWft4XcUhFnofxpcHODTUgLr26z3bKxViVeplEEeXlhCOCpcOxyl97JrO
 ZqEknCORMIorPt8/AQ0qWoHRriveeFMoQGgSWpOy3nuUkigW1DYVBhuDP/82mEVlbRe2
 ipcHNDA7yP2yWdUxKyHVXdl3wnyhIz1qbsmCSpWa4mAz0Ibdcmzr6wh/fRFWdIhWFSKV
 Nm5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhPt39RWdseNfq7hP1LfGHAQqkmRl7UoJt4LUqL3s954rY90sAPBm1275Lk18wjme5fBgaWGo9T8ij@nongnu.org
X-Gm-Message-State: AOJu0Yy+5W/O63sIWr9atD9Sr1qto9q05skRJF1kyRcF039z29bcqu3u
 Hs9zqAXei2y4oe7du5aDh1QmlS1FIxLkeCg9sEGDvW4nuQZCIB4mfSR7lyj+NLxt1xeQNHYZcvo
 w2BE=
X-Gm-Gg: ASbGncsMCtQGnk8XgcBMmO/bL7PA+bXanHd442YcWyvxhIHb3p6zwsvMZ2GiMctLIA7
 D876u8ShUGpbMWdUfA+Y/zBYX+4Z0rg9jslQMfIZIyR0JW5EEGu6qYsFw7BUk+G2Fdp/Y0vWMNH
 6ryyL/fzS3e0HeUNK4bSxWBlv16kvRvuIi9TGe4UtbzjWeU/axN2c4owOAzTA/wue7UqgXFx+c7
 EIBMXlUiJa+Scd9j9rp88dS5SKUU0QmNZZvyDWe1jCKi9WKNLQCcCwb13rdNqV8M2cKbc6TGQOY
 r/1fqG049DBSsdBgh3NR4MR9Pi+dVHwvTNTeJO0xrRNTDpe51NgKlxGMA1Uj1yPA
X-Google-Smtp-Source: AGHT+IFu7Eulxz6KMlvkWZaV2p039VNL90nVkNWMJ+vImxpjrtOWLgv15tBEv2sIOr/KlwTugvbNTQ==
X-Received: by 2002:a5d:5f51:0:b0:38d:d969:39c1 with SMTP id
 ffacd0b85a97d-38dea25279bmr3560595f8f.5.1739384256931; 
 Wed, 12 Feb 2025 10:17:36 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f227325bcsm980168f8f.50.2025.02.12.10.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 10:17:35 -0800 (PST)
Message-ID: <672045c1-9b09-4b7b-9bed-fa990129ce2c@linaro.org>
Date: Wed, 12 Feb 2025 19:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
 <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
 <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
 <3b3baed4-0d79-3a28-40cd-e1835e078863@eik.bme.hu>
 <6e707c7f-b94c-47ef-83ab-795605e27963@linaro.org>
 <a3608e43-79ce-403d-8ba7-6735fde66759@linaro.org>
 <e1436061-a840-0942-2c2c-4f49bfb932b8@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e1436061-a840-0942-2c2c-4f49bfb932b8@eik.bme.hu>
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

On 12/2/25 17:23, BALATON Zoltan wrote:
> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>> On 12/2/25 14:53, Philippe Mathieu-Daudé wrote:
>>> On 12/2/25 13:56, BALATON Zoltan wrote:
>>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>> On 12/2/25 12:37, Thomas Huth wrote:
>>>>>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>>>>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>>>>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>> ---
>>>>>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>>>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>>>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>>>>>   3 files changed, 34 insertions(+)


>>>>>>> +{ 'enum': 'EndianMode',
>>>>>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>>>>>
>>>>>> Should 'unspecified' come first? ... so that it gets the value 0, 
>>>>>> i.e. when someone forgets to properly initialize a related 
>>>>>> variable, the chances are higher that it ends up as "unspecified" 
>>>>>> than as "little" ?
>>>>>
>>>>> Hmm but then in this series the dual-endianness regions are defined 
>>>>> as:
>>>>>
>>>>> +static const MemoryRegionOps pic_ops[2] = {
>>>>> +    [0 ... 1] = {
>>>>
>>>> This is already confusing as you'd have to know that 0 and 1 here 
>>>> means ENDIAN_MODE_LITTLE and ENDIAN_MODE_BIG (using those constants 
>>>> here as well might be clearer). It's easy to miss what this does so 
>>
>> At this point 0 / 1 only mean "from the index #0 included to the index
>> #1 included", 0 being the first one and 1 the last one.
>>
>>>> maybe repeating the definitions for each case would be longer but 
>>>> less confusing and then it does not matter what the values are.
>>
>> This is what I tried to do with:
>>
>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>> };
>>
>> but in v7 we are back of picking an arbitrary value.
>>
>>>> Or what uses the ops.endianness now should look at the property 
>>>> introduced by this patch to avoid having to propagate it like below 
>>>> and drop the ops.endianness? Or it should move to the memory region 
>>>> and set when the ops are assigned?
>>>
>>> I'm not understanding well what you ask, but maybe the answer is in 
>>> v7 :)
> 
> I'm not sure I understand it well either. I think what I was asking 
> about is the same as what Thomas asked if this could be avoided to make 
> it necessary to allocate two separate ops for this. Looks like from now 
> on this ops struct should really loose the endianness value and this 
> should be assigned when the ops is added to the io region because that's 
> where it decides which endianness is it based on the property added in 
> this series. But I don't know if that could be done or would need deeper 
> changes as what later uses this ops struct might not have access to the 
> property and if we have a single ops struct it may need to be copied to 
> set different endianness intstead of just referencing it. So I'm not 
> sure there's a better way but I think this change makes an already 
> cryptic boiler plate even more confusing for people less knowledgeable 
> about QEMU and C programming so it makes even harder to write devices. 
> But as long as it's just a few devices that need to work with different 
> endianness then it might be OK. But wasn't that what NATIVE_ENDIAN was 
> meant for? What can't that be kept then?

Moving toward a single binary able to run heterogeneous machines, we
can't rely on a particular target endianness, so we need to remove
DEVICE_NATIVE_ENDIAN. The endianness is a property a device / machine,
not of the binary.

