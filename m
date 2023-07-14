Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E7C001B0
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 01:13:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK7NA-0003MK-OT; Thu, 13 Jul 2023 21:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qK7N8-0003M1-HR
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 21:13:26 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qK7N5-00085L-Ex
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 21:13:25 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-392116ae103so1063491b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 18:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689297202; x=1691889202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oqv6QHMV4XaHUNggBPW1D7noH/z5wZMyL0/QRlo+aoA=;
 b=DcrPvPBM7slQUT1rQC9AOE5WCbCt4142smGlEZa/w29UsOa6EhX/MgG83ccHxXSMhr
 sJ/uWDB/93ULlnoVH981+X0eRGzXNKIzf6WQPZg16/UJpXFrqzXt6Mg8wzVgqa4uwF5R
 z65GToDhhHTK0wEXLz+pAYLoNjYVyZj09hQSlZThRJN/W4TpA7ezx4T6UsbbQ2oWCvRA
 pt+ywMCq/aGqyGTs2L4MMXoT7sByfCSuaO9BqeYvQUGkWs3CZKOf4lu0JrP0oG/PKE50
 Cw21kTDrjkauLWlVJrahJpJlA869De9ji3tQZBGHGTClh8zPU48J4A6ogfECB1TD4/VX
 PfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689297202; x=1691889202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oqv6QHMV4XaHUNggBPW1D7noH/z5wZMyL0/QRlo+aoA=;
 b=PirMErJ6YBUifpUYIi01JxywbX9ypyXPaFsSWA7oNYH0SFKODXHHaefDyB0aBk3hNl
 e4nqdF45lauC0SmqfJeS94n1peleAKlbac+45g0vxNDRu9cAe/dZKQZmgrAMQ2YH3MZQ
 648zuSw/tjgZKvXulaLT+oaahoemyVAIcguDw+4LugVABWGPDeTA5pI0VQaqzJjlR7Q1
 sHc4Eodq6lxNoXz+66XkII0FR262GhN3on+eWi6qHOhFQEMFACRXhgGPjoA06/JdJpa4
 lUMyon+GPs5vZFF9WnxGA0PIF9k9mqbIN+fVkmLF/UkRPsbSHI2hxFR2Lozkz+IOLkgo
 htMQ==
X-Gm-Message-State: ABy/qLbJgMzaQGtPI+jUz/5d4SAe2SkbKwv6P1Oh8k0xlHndm3m5vOsm
 GHr6uSARDkVlSX9R/WZ40D652g==
X-Google-Smtp-Source: APBJJlENmSz43+CtMjwcHdYLhEAgYKa0rwRuJFcR3Y3qFmD3CumLfBhNCRQ0asVsAg7QzqCcuKLewg==
X-Received: by 2002:a05:6808:2224:b0:3a4:2485:85a1 with SMTP id
 bd36-20020a056808222400b003a4248585a1mr4321854oib.3.1689297201963; 
 Thu, 13 Jul 2023 18:13:21 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 26-20020aca121a000000b003a1e38362b7sm3409949ois.25.2023.07.13.18.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 18:13:21 -0700 (PDT)
Message-ID: <7a9c1c99-6820-119a-4815-37c166b664ff@ventanamicro.com>
Date: Thu, 13 Jul 2023 22:13:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
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
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230713-tank-blubber-2501cf7a0cf1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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



On 7/13/23 19:47, Conor Dooley wrote:
> On Thu, Jul 13, 2023 at 07:35:01PM -0300, Daniel Henrique Barboza wrote:
>> On 7/13/23 19:12, Conor Dooley wrote:
> 
>>> And a question for you below Daniel.
>>>
>>> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
> 
> 
>>>
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000002 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000002 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000003 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000003 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000004 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000004 because privilege spec version does not match
>>>
>>> Why am I seeing these warnings? Does the mpfs machine type need to
>>> disable some things? It only supports rv64imafdc per the DT, and
>>> predates things like Zca existing, so emitting warnings does not seem
>>> fair at all to me!
>>
>> QEMU will disable extensions that are newer than a priv spec version that is set
>> by the CPU. IIUC the icicle board is running a sifive_u54 CPU by default. That
>> CPU has a priv spec version 1_10_0. The CPU is also enabling C.
>>
>> We will enable zca if C is enabled. C and D enabled will also enable zcd. But
>> then the priv check will disabled both because zca and zcd have priv spec 1_12_0.
>>
>> This is a side effect for a change that I did a few months ago. Back then we
>> weren't disabling stuff correctly.
> 
> Yah, I did check out the blame, hence directing it at you. Thanks for
> the explanation.
> 
>> The warnings are annoying but are benign.
> 
> To be honest, benign or not, this is kind of thing is only going to
> lead to grief. Even though only the direct kernel boot works, we do
> actually have some customers that are using the icicle target in QEMU.
> 
>> And apparently the sifive_u54 CPU is being inconsistent for some time and
>> we noticed just now.
>> Now, if the icicle board is supposed to have zca and zcd then we have a problem.
> 
> I don't know, this depends on how you see things in QEMU. I would say
> that it supports c, and not Zca/Zcf/Zcd, given it predates the
> extensions. I have no interest in retrofitting my devicetree stuff with
> them, for example.
> 
>> We'll need to discuss whether we move sifive_u54 CPU priv spec to 1_12_0 (I'm not
>> sure how this will affect other boards that uses this CPU) or remove this priv spec
>> disable code altogether from QEMU.
> 
> I think you should stop warning for this? From my dumb-user perspective,
> the warning only "scares" me into thinking something is wrong, when
> there isn't. I can see a use case for the warning where someone tries to
> enable Zca & Co. in their QEMU incantation for a CPU that does not
> have the correct privilege level to support it, but I didn't try to set
> any options at all in that way, so the warnings seem unfair?


That's a fair criticism. We had similar discussions a few months back. It's weird
to send warnings when the user didn't set the extensions manually, but ATM we
can't tell whether an extension was user enabled or not.

So we can either show unfair warning messages or not show warnings and take the risk
of silently disabling extensions that users enabled in the command line. It seems
that the former is more annoying to deal with than the latter.

I guess I can propose a patch to remove the warnings. We can send warning again
when we have a better solution.


Daniel


> 
> Cheers,
> Conor.

