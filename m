Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45625C001DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 09:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKF4S-0001hi-A4; Fri, 14 Jul 2023 05:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKF4Q-0001gS-8i
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 05:26:38 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKF4O-0004SX-HO
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 05:26:38 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1b078b34df5so1358230fac.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689326795; x=1691918795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4BBIQyuVf8F+qWMWYtLxgzTlmaLQso5Z+CGGXEf0uEM=;
 b=DADJqHBT8dwTD96LyJrlvAqrBJwUy+q5QvgG+mGP+WlC9VnXlwj+6Q5tG2q/2ef6SW
 a2XlnaacbduHIGnygBO2+4SjxgjhxooQ+dTlXQRooHpX41DEQ9pj3ddC39GbvcQl7udP
 LsMWWVbPYTwRts0O+T6w1WWw3gXFedUpPL+jgcUumL/Fubv/oKeDbSGo6LgRlEP+vRn2
 B59yT4Hkq1K7CdQ5KdFIsIgnppdC8aoldeq10AncLyvxt1Yt9/gqBphP0fqv6Fd2THWK
 2s8gbhydAV5gf+o0ms3wsJg98UHMWtI+3Q9+ZDzIT9h70jxVwnyDEVpL6Gec16X14U1Z
 omxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689326795; x=1691918795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4BBIQyuVf8F+qWMWYtLxgzTlmaLQso5Z+CGGXEf0uEM=;
 b=Mz1aCuxRdIUNu+oUd6gBJm5jawjCnXexs2m68nxJ3YZGacxIdVyKTXq04nWZEuVH9J
 Q4iVCRIcC7P4UY0hkox89jug9PRUts49lYCS3slN/fTuF111Tam4cFt48Xvsk4mBifJC
 5+SXTb3AFk2/pYseg9Iow0eqDt9CQ/y7EY9oKuJj8zB1zJRvMRSSmGkKX/FKNom0we3R
 zyUk8Awn1fwgJGrztsRJmvx265qgHiV3Jkk8ajoGXpyyDb/1Kzj4OFPorBzDm8eAUv9V
 a5h6mMMDyanR8b9GhIhpPCn7ULYEKCGMUa5oUTKQBmBpaYhpq0q1dAdHJXJgedVdcrI5
 3UCA==
X-Gm-Message-State: ABy/qLbHjimgVIzQk5Qxb29CRoEsQg9YM8HXJFLWGwfE8vQ4kXIGRXV+
 +ZxHUCwqSvjGHILRlQLlDQfuzw==
X-Google-Smtp-Source: APBJJlHX5f381MKKttAnXNL3FC7C0qd7zoejtdsTWA6S3VOHfprsC/fIIJH8lEBN4bIjHdABKE5LHg==
X-Received: by 2002:a05:6870:b507:b0:1b0:81eb:aca0 with SMTP id
 v7-20020a056870b50700b001b081ebaca0mr5371382oap.51.1689326794690; 
 Fri, 14 Jul 2023 02:26:34 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 v48-20020a4a8c73000000b00565fbd0d4c0sm3727214ooj.28.2023.07.14.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 02:26:34 -0700 (PDT)
Message-ID: <1eb03edb-929c-920f-04d8-eb4d7626a854@ventanamicro.com>
Date: Fri, 14 Jul 2023 06:26:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <f5f76a03-411c-fb7e-5c21-f261a0e0b141@ventanamicro.com>
 <20230713-tank-blubber-2501cf7a0cf1@spud>
 <7a9c1c99-6820-119a-4815-37c166b664ff@ventanamicro.com>
 <CAKmqyKMuo5pnkXf7+V57=ucVWfCo1s7dOSop5f2D1i_xg+GjTQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMuo5pnkXf7+V57=ucVWfCo1s7dOSop5f2D1i_xg+GjTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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



On 7/14/23 00:12, Alistair Francis wrote:
> On Fri, Jul 14, 2023 at 11:14 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 7/13/23 19:47, Conor Dooley wrote:
>>> On Thu, Jul 13, 2023 at 07:35:01PM -0300, Daniel Henrique Barboza wrote:
>>>> On 7/13/23 19:12, Conor Dooley wrote:
>>>
>>>>> And a question for you below Daniel.
>>>>>
>>>>> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
>>>
>>>
>>>>>
>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000002 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000002 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000003 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000003 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000004 because privilege spec version does not match
>>>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000004 because privilege spec version does not match
>>>>>
>>>>> Why am I seeing these warnings? Does the mpfs machine type need to
>>>>> disable some things? It only supports rv64imafdc per the DT, and
>>>>> predates things like Zca existing, so emitting warnings does not seem
>>>>> fair at all to me!
>>>>
>>>> QEMU will disable extensions that are newer than a priv spec version that is set
>>>> by the CPU. IIUC the icicle board is running a sifive_u54 CPU by default. That
>>>> CPU has a priv spec version 1_10_0. The CPU is also enabling C.
>>>>
>>>> We will enable zca if C is enabled. C and D enabled will also enable zcd. But
>>>> then the priv check will disabled both because zca and zcd have priv spec 1_12_0.
>>>>
>>>> This is a side effect for a change that I did a few months ago. Back then we
>>>> weren't disabling stuff correctly.
>>>
>>> Yah, I did check out the blame, hence directing it at you. Thanks for
>>> the explanation.
>>>
>>>> The warnings are annoying but are benign.
>>>
>>> To be honest, benign or not, this is kind of thing is only going to
>>> lead to grief. Even though only the direct kernel boot works, we do
>>> actually have some customers that are using the icicle target in QEMU.
>>>
>>>> And apparently the sifive_u54 CPU is being inconsistent for some time and
>>>> we noticed just now.
>>>> Now, if the icicle board is supposed to have zca and zcd then we have a problem.
>>>
>>> I don't know, this depends on how you see things in QEMU. I would say
>>> that it supports c, and not Zca/Zcf/Zcd, given it predates the
>>> extensions. I have no interest in retrofitting my devicetree stuff with
>>> them, for example.
>>>
>>>> We'll need to discuss whether we move sifive_u54 CPU priv spec to 1_12_0 (I'm not
>>>> sure how this will affect other boards that uses this CPU) or remove this priv spec
>>>> disable code altogether from QEMU.
>>>
>>> I think you should stop warning for this? From my dumb-user perspective,
>>> the warning only "scares" me into thinking something is wrong, when
>>> there isn't. I can see a use case for the warning where someone tries to
>>> enable Zca & Co. in their QEMU incantation for a CPU that does not
>>> have the correct privilege level to support it, but I didn't try to set
>>> any options at all in that way, so the warnings seem unfair?
>>
>>
>> That's a fair criticism. We had similar discussions a few months back. It's weird
>> to send warnings when the user didn't set the extensions manually, but ATM we
>> can't tell whether an extension was user enabled or not.
>>
>> So we can either show unfair warning messages or not show warnings and take the risk
>> of silently disabling extensions that users enabled in the command line. It seems
>> that the former is more annoying to deal with than the latter.
>>
>> I guess I can propose a patch to remove the warnings. We can send warning again
>> when we have a better solution.
> 
> A better solution is to just not enable Zca and friends automatically,
> or at least look at the priv spec before we do

Good idea. In fact we should do that for all extensions that we're enabling
automatically.


I'll work something out. Thanks,


Daniel

> 
> Alistair
> 
>>
>>
>> Daniel
>>
>>
>>>
>>> Cheers,
>>> Conor.
>>

