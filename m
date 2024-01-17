Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7A6C47258
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 16:59:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQ9GD-0004If-K8; Wed, 17 Jan 2024 11:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQ9GB-0004Ep-Ka
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 11:59:27 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQ9G9-0005Xj-EN
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 11:59:27 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9b5c4f332so6399687b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705510764; x=1706115564; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AfGbZNXZF2L17UTNsZoCl7lmljeE4/g6Bo4wgNOWovo=;
 b=nW8Dm8lR5iV58xdCCgf76XraLGYVCWqQqCfqSeAvOct2t/Mp4F+lg40xi7FIJLy5TK
 s0FT3WT4YHvOxEH+36EwGQDfuthizFywNhnlVSt0H7pp5apWjFlwCoqTDUhhAa6LK+Aj
 mt7qFDHbLsIsbejQTHItkKPN9Y74cwGr5XATPy8FajrSq93Cox3GA1W3XrVtC4OCe356
 Rti/xoIz5rXN6q283N9TcmtTMwhk5vQHynVXWHzCxrHRObOJ0cxV9pVYhX+NyJQcgTjM
 jcA48xW+SoXqaUQnrPEoU1om6RXNOMFlx00mZzGThxxuRRoxMI8Nk6FWw4J1AiCIqXo7
 FKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705510764; x=1706115564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AfGbZNXZF2L17UTNsZoCl7lmljeE4/g6Bo4wgNOWovo=;
 b=FejWGpQrsv6yb1/ZPOetYWRuwZwSf9ZIMS5DUcUsO2tJpS4NsgwRmgUJDvLA7/mi0N
 Ee9kTc1ZJuS6hvZq8dzmqWdExsn3/t7Vf4z0HJ6k1+D5tEkN+RaYBFcd6W5B7knJaBYk
 0E6LJZ43P3xEdlOeIczlhULLm8/3FViIx8mk8N48KucGBVppAwmPoE92s+Qv/xJaT9ph
 shHP6pynVbxKbwjvOFE8HOdWYKpd/bJeZGGGPtzUWoDo32gLgzCCg87WCWO/fDSa6CYy
 RACNU+jMjnBiADnHwPQEI6ese4DMyXiELmJLwre4W5MbXQDYJbQ4J8auWZODRuS8W9Wi
 7o+g==
X-Gm-Message-State: AOJu0YwCwSFpNMgQx21pNe0Dld1mZAAdyahKDtEvrxLusfqMYW9amdK/
 9UB3ChkmdfNelo6ijE/e5kNCpQrpaBueRFwW5qe1uvsckVk=
X-Google-Smtp-Source: AGHT+IHZw9HzWK72XXVMrCC7iTewBNb4GzGnHXJk18zI9IoFiobMfjj9styR5bZNmoa3PhQlczGvNg==
X-Received: by 2002:a05:6a20:6f0e:b0:19b:5c69:d2dd with SMTP id
 gt14-20020a056a206f0e00b0019b5c69d2ddmr1295541pzb.70.1705510764075; 
 Wed, 17 Jan 2024 08:59:24 -0800 (PST)
Received: from [192.168.68.110] ([152.234.127.133])
 by smtp.gmail.com with ESMTPSA id
 kq17-20020a056a004b1100b006d9330a934dsm1665841pfb.64.2024.01.17.08.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 08:59:23 -0800 (PST)
Message-ID: <6f3a2208-e3dc-43fd-9783-0fad9f76c470@ventanamicro.com>
Date: Wed, 17 Jan 2024 13:59:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Export debug triggers as an extension
To: Rob Bradford <rbradford@rivosinc.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alvin Chang <alvinga@andestech.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <e2763db2-fade-482d-b433-1bfce6acf7d3@ventanamicro.com>
 <CAKmqyKOA6OtixYoMJ_qtXj_u0t6rMdHawg0VEvq3-=mK4q6_XQ@mail.gmail.com>
 <3c091744cd4bafeb7c1d177455fa9789822e7209.camel@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <3c091744cd4bafeb7c1d177455fa9789822e7209.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 1/12/24 10:34, Rob Bradford wrote:
> On Fri, 2024-01-12 at 13:52 +1000, Alistair Francis wrote:
>> On Thu, Jan 11, 2024 at 5:20 AM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>> Himanshu,
>>>
>>> We spoke offline but let's make everyone aware:
>>>
>>> - 'sdtrig' should be marked with 'x-' and be an experimental
>>> extension since
>>> the spec isn't yet frozen;
>>>
>>> - Alvin sent a patch to the ML adding the 'mcontext' CSR for
>>> 'sdtrig' some time
>>> ago:
>>>
>>> "[PATCH v2] target/riscv: Implement optional CSR mcontext of debug
>>> Sdtrig extension"
>>>
>>> It would be good to put his patch on top of this series to ease the
>>> review for everyone.
>>> The changes done in patch 2 would also be applicable to the
>>> mcontext CSR;
>>>
>>>
>>> - last but probably the most important: the existing 'debug' flag
>>> seems to be acting as
>>> the actual 'sdtrig' extension due to how the flag is gating trigger
>>> code, e.g.:
>>>
>>>     if (cpu->cfg.debug) {
>>>           riscv_trigger_realize(&cpu->env);
>>>       }
>>>
>>> and
>>>
>>>       if (cpu->cfg.debug) {
>>>           riscv_trigger_reset_hold(env);
>>>       }
>>>
>>>
>>> If that's really the case, all the checks with cpu->cfg.debug will
>>> need to also include
>>> cpu->cfg.ext_sdtrig (one or the other). And now we'll have to make
>>> an option: do we leave
>>> the debug triggers (i.e. the 'debug' flag) as always enabled?
>>
>>  From memory the "debug" property is for the original debug spec:
>> https://github.com/riscv/riscv-debug-spec/releases/tag/task_group_vote
>>
>> That was ratified and is an official extension. AFAIK this is what is
>> in physical hardware as well.
>>
>> The actual PDF says draft though, I'm not sure what's going on there.
>>
>> The debug spec doesn't have a Z* name, so it's just "debug", at least
>> AFAIK.
>>
>> "sdtrig" seems to be a new backwards-incompatible extension doing
>> basically the same thing. What a mess
>>
>>>
>>> If it's up to me I would make 'debug' as default 'false' and
>>> deprecate it. Users will need
>>
>> I don't think that's the right approach. It's a ratified extension
>> that we are supporting and is in hardware. I think we are stuck
>> supporting it
>>
>>
> 
> I've done a bit of digging and I agree things are quite messy. Here are
> my discoveries:
> 
> The debug option and the code for triggers was added in these commits:
> 
> c9711bd778 target/riscv: cpu: Enable native debug feature
> 38b4e781a4 target/riscv: machine: Add debug state description
> b6092544fc target/riscv: csr: Hook debug CSR read/write
> 1acdb3b013 target/riscv: cpu: Add a config option for native debug
> 95799e36c1 target/riscv: Add initial support for the Sdtrig extension
> 
> In March 2022 - since the commit refers to the Sdtrig extension name
> and from the date this was an implementation not of the ratified 0.13
> debug spec (which did not have Sdtrig as a separate extension) but
> rather a version of the in development 1.0 debug spec.
> 
> It's not trivial to tell if it's closer to the ratified 0.13 version or
> the (hopefully soon to be frozen) 1.0 version.
> 
> As the only part of the debug specification to be implemented is the
> triggers then effectively the debug option is x-sdtrig.
> 
> I don't think there is any way for code running on the machine to
> identify what version of the debug is implemented - the appropriate
> register is only available for external debug. Once 1.0 is frozen then
> the presence of Sdtrig isa string would indicate 1.0 trigger support is
> available.
> 
> According to JIRA - https://jira.riscv.org/browse/RVS-981 the debug
> specification should freeze this month.
> 
> How about considering this as a solution:
> 
> - Add a new x-sdtrig option that defaults to false
> - Deprecate debug option - but retain it with default on
> - Add warning if triggers are used and x-sdtrig is not enabled
> - Update the trigger implementation to match frozen spec

If x-sdtrig is 'false' and 'debug' is on, and then we warn if debug=true and x-sdtrig
is false, we'll warn every time using the defaults.

Given what you said here:

> 
> There is potentially a chance that some use cases will be broken but I
> don't think triggers are being widely use - the SBI support only just
> got merged:
> https://github.com/riscv-software-src/opensbi/commit/97f234f15c9657c6ec69fa6ed745be8107bf6a> 

I believe we can deprecate 'debug' and simply ignore its existence. Do everything else with
x-sdtrig. So if an user sets any 'debug' value we'll:

- warn that the flag is deprecated
- set x-sdtrig to whatever value the user set to 'debug'

'debug' will become just an alternate way to set x-sdtrig. The logic should just check for
x-sdtrig.


Thanks,


Daniel
   

> Hope this is helpful,
> 
> Rob
> 

