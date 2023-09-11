Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A7EE57DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 19:46:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfmre-00041S-Gr; Mon, 11 Sep 2023 15:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfmrc-00040y-Qh
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 15:46:29 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfmrZ-0005Zu-Rx
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 15:46:28 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3827181fac.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694461584; x=1695066384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OlwkFs5oLXvW6umtkjICn5zayZgA00X7S9IR8hMO4fw=;
 b=ktyqm3qF9Go4HanCNJbRwS2DXMVKjVFu8AP1LZUvmfl1pnRcZve/56MMjl1dT93Z+t
 gNiAPKOUfNhEPF8dPXMSfl1G4CkslHZ1wZjhvLCeyC2aBdVD3fVrs+yPsQzuhWq82dVP
 bvEOMtY+8n/OqA4beiRUdJpNmxlaUcD1iWdpL9A1QdX6sbZ6YYFRiFXwh8ZfTLbGfHSj
 UzZ/sm7iv1y2z3q83cj2av1l9FhE5thUUslbBIRdRi/VsgjSHooQWFliDQWQfo0ip6+a
 jbnYMRBeWUp714L+MoV2WKj4FW1JpcEFvZ8mHl3fUQ2S2P52AY5NYWhON49K4zZ6ZEeC
 2ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694461584; x=1695066384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlwkFs5oLXvW6umtkjICn5zayZgA00X7S9IR8hMO4fw=;
 b=bPdiL29Zg2W0Hr+X38SEr2ntm8k2cOZseGyiqfoy48HD6uAQB+xnvb7xCbmhlL6rBI
 wUPJNMJwklMnBqs7wKWmj0CJnGOx21I4Mty4xzpXQOrFlVeohYIJlwxuFYgswBzm5H8b
 gq1JCMc2skSJNvQot8y6Im/zZodIBchrIJhweahG+Zse0qexlOG4dcDbihag4ZOTLfrH
 jWJjUUrew91nEibwtOwGqgWl/hdRWN9++QZKbfdF3zqg1rRTfm+uHIY+mUs2XngRIiEV
 KujLds+BwAn7Trf4gifxZcLo7s04L9WvxDfSXQ0xPGkkgryVJYRHZqY6z5kv9DBhBy22
 Dujw==
X-Gm-Message-State: AOJu0YyIb6pVfQpPuhS6mB1VwLPwjDZdF3ZKQ5hPdb0AUHm+C2zN1VS7
 lo8LTvvkHgVqZ9cflwy84+jkgQ==
X-Google-Smtp-Source: AGHT+IGLmMLKI++M6rAeNRBykURX0eQUiSQUogi67YYLUsGAWkQXw8VLpe1gGlK8BhLKoWgdDg5M2Q==
X-Received: by 2002:a05:6870:5689:b0:1bb:583a:db4a with SMTP id
 p9-20020a056870568900b001bb583adb4amr13211907oao.44.1694461584148; 
 Mon, 11 Sep 2023 12:46:24 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056871039100b001d4c5e4c2c5sm4317514oaf.25.2023.09.11.12.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 12:46:23 -0700 (PDT)
Message-ID: <d023da43-cb72-73bd-019b-c3070074a163@ventanamicro.com>
Date: Mon, 11 Sep 2023 16:46:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
To: Andrew Jones <ajones@ventanamicro.com>,
 Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
 <20230908-fc90cf18948effff759d1b9d@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230908-fc90cf18948effff759d1b9d@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/8/23 11:10, Andrew Jones wrote:
> On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
>> On Fri, Sep 08, 2023 at 11:13:54AM +0200, Andrew Jones wrote:
>>> On Fri, Sep 08, 2023 at 10:39:45AM +0200, Andrew Jones wrote:
>>>> On Thu, Sep 07, 2023 at 10:51:33AM -0500, Andrea Bolognani wrote:
>>>>> So, why would I want to do something like
>>>>>
>>>>>    -cpu rv64,profile=rva20u64,profile=rva23u64
>>>>>
>>>>> when the latter is a superset of the former? It seems that it would
>>>>> achieve exactly the same as
>>>>>
>>>>>    -cpu rv64,profile=rva23u64
>>>>>
>>>>> but with extra steps.
>>>>
>>>> I don't see anything in the profile spec that states we can count on later
>>>> profiles being supersets of older profiles, which means we cannot.
>>>
>>> I just found a potential example of why we cannot. A recent mail thread[1]
>>> stated some vendors are considering dropping support for the C extension
>>> on "higher end" platforms. If this were to happen, then a profile may be
>>> proposed where C is optional. In that case, platforms that still have C
>>> could state they are compatible with the older profiles where it's
>>> mandated and also the new profile where it's optional, whereas the
>>> platforms that don't have C will only state the new profile.
>>>
>>> [1] https://groups.google.com/a/riscv.org/g/fw-exchange/c/qxnKKS4jhLk
>>
>> I can't access the URL, but I get the gist. Point taken about
>> profiles not necessarily being purely additive, though I don't think
>> this invalidates my criticism of the approach.
>>
>>>> Also,
>>>> I'd guess vendors will want to implement as broad a set as possible of
>>>> profiles and then list them all when advertising. So, IMO, something like
>>>> '-cpu rv64,rva20u64=on,rva23u64=on' would be a more natural way to model a
>>>> cpu which advertises being compatible with those two profiles.
>>
>> Wouldn't that be exposed as a named vendor CPU rather than something
> 
> Probably eventually, but I think it'd be nice to translate a CPU
> description to a QEMU command line without having to do anything other
> than specify a base CPU model and a list of extensions, where most of the
> extensions could get enabled through the selection of profiles without
> even having to know which ones.
> 
>> that users have to assemble themselves by layering profiles?
> 
> Combing multiple profiles should be considered as creating a union of the
> mandatory extensions each profile represents, rather than as layering.
> 
> Let's take the hypothetical case of C being dropped from rva24u64 as an
> example. When specifying both rva22u64 and rva24u64
> (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
> even having to know about it, whereas if the user could only select the
> latest profile (-cpu rva24u64), C would not get enabled unless the user
> was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
> 
> (I changed the name of the base CPU type in the example above to 'min64'.
> More on that below.)
> 
>>
>> Note that I have zero issues with the implementation of said named
>> vendor CPU being, internally, handled effectively the same way as
>> what you've just described. I'm simply unconvinced that we should
>> expose this mechanism to users.
>>
>>>> (I swapped the 'profile=' to a '=on' syntax, because I think each profile
>>>> should be a boolean "virtual" extension.)
>>
>> On one hand, I like this because it avoids having to invent a new
>> mechanism. On the other, I dislike it because it overloads an
>> existing mechanism O:-)
>>
>>>> I'm also not sure of the benefits of using a cpu model vs. a base model
>>>> and a bunch of virtual profile extensions. If it's because it's a hassle
>>>> to collect extensions that should be enabled, then I think we'll have to
>>>> live with that for unnamed riscv cpu models. Profiles will always lag new
>>>> extensions which users will want to enable, so users will be adding plenty
>>>> of cpu properties anyway. Of course users that don't care about being
>>>> explicit have 'max' to avoid all that.
>>
>> I feel that this validates my stance on the matter.
>>
>> If you're working on defining a new CPU model and need fine-grained
>> control over the exact set of extensions, then you can already do
>> that by explicitly flipping each one of them on or off, and adding
>> the ability to layer profiles doesn't add much value except possibly
>> removing a bit of verbosity. Not particularly compelling IMO.
> 
> I think it's compelling, because the extension lists that profiles provide
> are long and mostly uninteresting. For example, how often do we want to
> type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
> those for granted, and we can, because we just specify 'g' instead. Indeed
> the profile spec even points out that using profiles as a way to deal with
> "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
> command line is effectively an ISA string, so I think it's appropriate to
> apply profiles to it as well.
> 
>>
>> If you're testing an application and want to ensure it works fine on
>> CPUs that implement a specific profile, e.g. rva20u64 because even
>> older hardware should be able to run it, then you're not going to
>> need or indeed want to layer additional profiles on top of that. So a
>> regular named CPU model will work just fine.
> 
> This line of reasoning makes sense if profiles only layer, but, as I tried
> to illustrate above, we should consider profile combining to be the
> forming of extension unions, where even the older profiles can contribute
> to the set.
> 
>>
>>    (This also gets really interesting when you start thinking about
>>    extensions that are optional for the profile... Maybe we need
>>    something like '-cpu rva23u64,optional-extensions=off' so that
>>    testing against the baseline for a profile doesn't require combing
>>    through the spec and disabling extensions manually?)
> 
> I don't think the profiles (whether they are CPU virtual extensions or
> CPU models) should enable the optional extensions by default. When
> software targets a profile (or set of profiles with the virtual
> extension approach) then it should never assume the optional extensions
> will be present. Developers should need to consciously include those
> extensions when creating the QEMU platform used for testing.
> 
>>
>> If you're someone who just needs a RISC-V VM, then you're either
>> going to be using 'max' or a named vendor CPU and profiles will not
>> enter the picture at all.
> 
> I agree, but I think we need to ensure developers can easily build more
> specific platforms too, including those that combine profiles.
> 
> 
> Now somewhat switching topics...
> 
> Thinking about this more today, I think we should have two non-vendor CPU
> models ('min' and 'max'). We also need to handle xlen, though, so I
> suggest we have min32, min64, max32 and max64 (and someday min128 and
> max128), but those would just be convenience CPU model names. The same
> CPU models could be created with 'min,xlen32=on', 'min,xlen64=on',
> 'max,xlen32=on', and 'max,xlen64=on' instead (and one could replace xlen*
> with both an mxlen* and an sxlen* when they don't match).

This makes sense when/if we unify the 32 and 64 bit binaries (CCing Alistair for
context). Today we have 32 and 64 bit CPUs in their own binaries (riscv32 and
riscv64) and it's not possible to run a 32 bit CPU with qemu-system-riscv64 because
we do not expose xlen or mxl to be set via command line.


As for the 'max' CPU I'm having second guesses about its name. We have 'rv32' and
'rv64', but 'max' can be either 32 or 64 bit depending on the binary used. This can
be considered an advantage now but it can be confusing if/when we decide to merge
all CPUs in a single binary. I believe a better name would be rv32max/rv64max or
max32/max64. Any thoughts?


Thanks,


Daniel


> 
> Besides the *xlen* boolean properties, 'min' and 'max', would both also
> get 'version1', 'version2', ... boolean properties which map to the ISA
> spec version(s) supported. (min32, min64, max32, and max64 would always
> implement the latest version in order to remain useful shorthands.)
> 
> In the end users could choose between
>   - vendor named models
>   - min/max,xlen*,version* + profiles/extensions...
>   - min32/max32/min64/max64 + profiles/extensions...
>   - host (for KVM, and max/max32/max64 could all alias 'host')
> 
> 'any', 'rv32', and 'rv64' get deprecated.
> 
> Thanks,
> drew

