Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC31C021A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:03:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiBS9-00084M-GZ; Wed, 12 Feb 2025 07:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBS3-00083N-Hw
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:02:47 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBS0-0005Uq-Gu
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:02:47 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5de849a0b6cso5952385a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739361758; x=1739966558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Basu0NzGRbdjUqVR/+YNCnEJIE3+3Y+dcbfNVJalzX4=;
 b=wgq0ikObQGzOURXDlfJtz0mPyMs7hKQbsdDKhPoS6l0v1Dwigk5Ao2G/ZuTNQKAHPq
 C3knENWrG2HuXOLUv88H6DUcOlvlIE1kcwvAUgAB6mIYP5P37XTO4q8VrWx9F9GZRO1T
 yh5sAqt8fYxLG1Fvscc/fRQ1biBNEyCECm/M0rm3DNXaPwmuxzavL3DVielUIo+RWlmG
 P8lZd0dngx4eCBQwT89JqnLqy55/A3+AwgcEFku++PwpTJev0aZh0z2NMb/ai9yhO4TE
 cHYgJYIfxiYxO0AekJROR2nCyJMvjk9R3t1ixa6JTT/UHgDckfotJR6Jjv9pfAucWn4V
 KAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739361758; x=1739966558;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Basu0NzGRbdjUqVR/+YNCnEJIE3+3Y+dcbfNVJalzX4=;
 b=bB/4xz33UH/OEvkp5cWBYnWB+itL0Y3P7uHsnrhZwj/nNCNm4WJqPrYH8FAEVzjnr3
 /P2UyltJtJOS311iKV71uw5Durp4atBw6yPPXiEUaPKUSl3qA1PEXF/NoMjDzfdPXi2C
 BU3vn/nG0J/TH+4bM5T2TDbRBTYNtbfcR/QPzN/PhwiBaD/nnXbg+fkIgsszv5MYakgg
 qrYd0TQ3Q9KjUZRMF2v0PFHY6Oa/3jCdUosqWfkbZSeM2E2CfYmtO/yAZjyQQY1ps2Qc
 f1ic1vx181/9YXJJtVUUBK+yXDtg6Ug+BgJqmm/oIeP7ETMVJplCs0HDEwvSd29nJznV
 aUlg==
X-Gm-Message-State: AOJu0YzuX5zkwz6Dq5hmnUf8GGAy7QTinQ/z1DHj8ghkrg02+JLePeVv
 1zDpwB+Y4cYv4EITbyQNAwPi3VJqero/NGREC50XOu76+oilsP6INd4VbnsY8TjnbOq6sI/Nh26
 94As=
X-Gm-Gg: ASbGncv71F7mSmDT4t7iBF13TsPJhEdW1sgE3gI/Dnhnw7xzBXvUMe8Is4speMNVfDD
 EY9m+IMJbRpyrQJooAyXgUxVJNKYuuYJenYbUFQEGoGki6nr7joquIlSc0Lvuk8m9HSX5DyHPxR
 XpZoZAFldv6noo4eIv+ajW+eOTWIgNeDD9FhJExyLLg9mjKWlEKxsqphuj694FkO0jhofrHWDwl
 nEVcC9fv7zWbYJ5dO73+ez+7qAshXuHi1WhGUAsvR3Ywe2WWVgg21oRtzaGh5ZF8kb/2U54yRNA
 6Sr2X9H8gD66jm6HFgPE3InQgPj0u02/Xotxxlx7xK5DSLNDQfVj/N/h9vE=
X-Google-Smtp-Source: AGHT+IGY959yXJUmTUlxZEAKdHlBBgnt69Gxl2UhLJZJDq2WiEDqwqCyM4EtVbB49LOr23yu/5LFEw==
X-Received: by 2002:a05:600c:4e8d:b0:439:4a1f:cf8b with SMTP id
 5b1f17b1804b1-439580e73femr31401585e9.0.1739361739588; 
 Wed, 12 Feb 2025 04:02:19 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f039sm17595138f8f.59.2025.02.12.04.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:02:18 -0800 (PST)
Message-ID: <24377a63-0772-4dda-875d-2c4fddd1bbca@linaro.org>
Date: Wed, 12 Feb 2025 13:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
 <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
 <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
Content-Language: en-US
In-Reply-To: <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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

On 12/2/25 12:43, Philippe Mathieu-Daudé wrote:
> On 12/2/25 12:37, Thomas Huth wrote:
>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>   3 files changed, 34 insertions(+)
>>>
>>> diff --git a/qapi/common.json b/qapi/common.json
>>> index 6ffc7a37890..217feaaf683 100644
>>> --- a/qapi/common.json
>>> +++ b/qapi/common.json
>>> @@ -212,3 +212,19 @@
>>>   ##
>>>   { 'struct': 'HumanReadableText',
>>>     'data': { 'human-readable-text': 'str' } }
>>> +
>>> +##
>>> +# @EndianMode:
>>> +#
>>> +# An enumeration of three options: little, big, and unspecified
>>> +#
>>> +# @little: Little endianness
>>> +#
>>> +# @big: Big endianness
>>> +#
>>> +# @unspecified: Endianness not specified
>>> +#
>>> +# Since: 10.0
>>> +##
>>> +{ 'enum': 'EndianMode',
>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>
>> Should 'unspecified' come first? ... so that it gets the value 0, i.e. 
>> when someone forgets to properly initialize a related variable, the 
>> chances are higher that it ends up as "unspecified" than as "little" ?

BTW I'm not sure QAPI guaranty enums are following an order
(at least, as in C, I wouldn't rely on that assumption).


