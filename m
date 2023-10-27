Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B2EC25B48
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 17:53:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwR0q-0004mQ-Oh; Fri, 27 Oct 2023 13:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwR0p-0004lt-9f
 for qemu-riscv@nongnu.org; Fri, 27 Oct 2023 13:52:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwR0n-00078i-2p
 for qemu-riscv@nongnu.org; Fri, 27 Oct 2023 13:52:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso1731024b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 27 Oct 2023 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698429163; x=1699033963; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QtsTmlbZGwD0fbWsNIdW/zI3E1/VLngJHIAuL0WE4e4=;
 b=kL6z2E62KiEsaxFyYvaHizTVgv0x/wzwFjAqei+T1TI7UqI3gMY5KAjXztzIbVoR5Y
 vgWrPLfSC+IAJxHzvlbasyuTVJ/ld/4CkCe/9fRnVpQg7gdMZbQ+dEWb66uaK56+pLWC
 IKDab6vkHSHxWg6tcAE0coEX/RbGZ6fpPip9OxAqB6Jz3isq3oGNoBSk58DU1ZTMoOTN
 bA7fJk1Jtkknm/uw81KGcc8c0ncD/vSW9I0ud1XUQ8dXsD+QcmQ53kzaQTd04mFArJhU
 GUpQ+7oPIq3/+o6d1ktMAa3iXSGeOWORDlYnqcJNVwkAMxK1Z8D01Xr3rLApRKBc3ycW
 MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698429163; x=1699033963;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QtsTmlbZGwD0fbWsNIdW/zI3E1/VLngJHIAuL0WE4e4=;
 b=JeK5kyIVkFWg9SmPDEFXliMNUGuhW3LarU3aJiLJfmAcVNFNRBXom9EvAuHnBaTssa
 z5DWM4TLwYoNsT4pvrdbknp80Tqa6N2jnDjhfj+bCectl8ynXpA1CWwlBLwhjdndvB87
 58Ji0eirxzRJbWWwFTnYJE14sbevQep8DV7npajhMoE4h5CP4S2sXtaifGLFSmVFzEYn
 xQN69uIeHYg2/8fvSgfgex0DGVVvJDfZRFQGnSOlf4o1KTgxI8O0KI3TGmrRjimd90+z
 1FxBgB5Qc+cXbfCJiNk08QGY+oY60gLUMJBVP+zwkibGfLxVOX6gSsWJvvEn+LapHgxI
 qQwQ==
X-Gm-Message-State: AOJu0YwoBBbXXpfcMO+13AeF3RRJj+P6oKiqBZZS+8t6mf01T2ZXzh4t
 Y0wdx5GnrKv5bMgAdzT5+RecCg==
X-Google-Smtp-Source: AGHT+IF2UsDPF0ExRLyouSFBQnV2yGWxgYIvoDrHellsukLS0Mw+WJmIq3armmW7vw+rh2eJWhLoFQ==
X-Received: by 2002:a05:6a00:2b8b:b0:68f:c1e0:a2c4 with SMTP id
 dv11-20020a056a002b8b00b0068fc1e0a2c4mr7540220pfb.3.1698429162965; 
 Fri, 27 Oct 2023 10:52:42 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 c6-20020aa78806000000b00688965c5227sm1672821pfo.120.2023.10.27.10.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 10:52:42 -0700 (PDT)
Message-ID: <e3f53179-7f7e-42a9-8a13-a81bf1beeb89@ventanamicro.com>
Date: Fri, 27 Oct 2023 14:52:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
 <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
 <20231026-c8c8065150673a1f48f41dd5@orel>
 <CABJz62N0D2x1kP+sPi7xrDMMyG080BesyeAR+6HsnVt0-yi=TQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CABJz62N0D2x1kP+sPi7xrDMMyG080BesyeAR+6HsnVt0-yi=TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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



On 10/26/23 14:36, Andrea Bolognani wrote:
> On Thu, Oct 26, 2023 at 05:14:49PM +0200, Andrew Jones wrote:
>> On Thu, Oct 26, 2023 at 07:36:21AM -0700, Andrea Bolognani wrote:
>>> On Mon, Oct 23, 2023 at 07:35:16PM +0200, Andrew Jones wrote:
>>>> On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
>>>>> On 10/23/23 05:16, Andrew Jones wrote:
>>>>>> Hmm, I'm not sure I agree with special-casing profiles like this. I think
>>>>>> the left-to-right processing should be consistent for all. I'm also not
>>>>>> sure we should always warn when disabling a profile. For example, if a
>>>>>> user does
>>>>>>
>>>>>>    -cpu rv64,rva22u64=true,rva22u64=false
>>>>>>
>>>>>> then they'll get a warning, even though all they're doing is restoring the
>>>>>> cpu model. While that looks like an odd thing to do, a script may be
>>>>>> adding the rva22u64=true and the rva22u64=false is the user input which
>>>>>> undoes what the script did.
>>>>>
>>>>> QEMU options do not work with a "the user enabled then disabled the same option,
>>>>> thus it'll count as nothing happened" logic. The last instance of the option will
>>>>> overwrite all previous instances. In the example you mentioned above the user would
>>>>> disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
>>>>> same profile was enabled beforehand.
>>>>
>>>> Yup, I'm aware, but I keep thinking that we'll only be using profiles with
>>>> a base cpu type. If you start with nothing (a base) and then add a profile
>>>> and take the same one away, you shouldn't be taking away anything else. I
>>>> agree that if you use a profile on some cpu type that already enabled a
>>>> bunch of stuff itself, then disabling a profile would potentially remove
>>>> some of those too, but mixing cpu types that have their own extensions and
>>>> profiles seems like a great way to confuse oneself as to what extensions
>>>> will be present.  IOW, we should be adding a base cpu type at the same
>>>> time we're adding these profiles.
>>>
>>> The question that keep bouncing around my head is: why would we even
>>> allow disabling profiles?
>>>
>>> It seems to me that it only makes things more complicated, and I
>>> really can't see the use case for it.
>>>
>>> Enabling additional features on top of a profile? There's obvious
>>> value in that, so that you can model hardware that implements
>>> optional and proprietary extensions. Enabling multiple profiles?
>>> You've convinced me that it's useful. But disabling profiles, I just
>>> don't see it. I believe Alistair was similarly unconvinced.
>>
>> The only value I see in allowing a profile to be disabled is to undo the
>> enabling of the profile by specifying the profile as 'off' to the right of
>> it being specified as 'on'. That may seem pointless, but scripts take
>> advantage of being able to do that. Besides that one possible use case,
>> there isn't much use in disabling profiles, but treating profile
>> properties like every other boolean property makes the UI consistent and
>> should actually simplify the code.
> 
> The code might be simpler, but the result is an additional burden on
> the user, as the interactions between the various flags become much
> more nuanced and less intuitive. I'm not convinced the trade-off is a
> worthwhile one.
> 
> For the script override scenario, fair enough, but once again I feel
> that we're making things much worse in the general case in order to
> cater to a much narrower one. Script authors will naturally learn to
> avoid hardcoding profile enablement once users have reported enough
> failures resulting from that.

I'm not thrilled about how we're able to disable profiles either. I'm
coping with it because (1) it was a feedback from the first version of
this work [1] and no one had strong opinions against it back then and
(2) I believe that users won't find much use in doing "-cpu rv64,profileA=false"
in a real world/common scenario, so we can get away with this kind of
weird functionality.

The profile flag is set to 'false' by default for all current CPUs. If
the user manually sets it to 'false', well, it doesn't change the internal
state of the CPU, does it? But then I need to be creative and interpret it
as 'it's not a default false, it's an user-set false, so I need to disable
extensions'. I can't think of many qemu options that behave like that, if
any.

We also have the example of RVG, a bit that is default set to 'false' that,
when enabled, causes IMAFD_zicsr_zifencei to be enabled. Today, if the user
set RVG to 'false', nothing happens - we're not disabling IMAFD_zicsr_zifencei.
In the latest version of this work there's a deliberate effort to make RVG
behave like a profile [2], but perhaps I should make profiles behave like RVG.

Last but not the least, I'm planning to add a couple of bare-bones CPUs (rv64i
and rv64e). Disabling profiles in these CPUs is a total waste of cycles since
the CPUs are already bare.

After writing all this stuff, and realizing that profile disablement creates a
lot of confusion and has no vocal fans, I had a change of heart. Profiles will
behave like RVG -> if set, mandatory extensions will be enabled (respecting user
choice on disabled extensions, of course). If disabled, nothing happens. Fans
of the current design are welcome to weight in the discussion, of course.

If we decide in the future that stripping extensions from a CPU model is desirable
we can come up with a 'bare' option, e.g. "-cpu rv64,bare=true" will strip all
extensions from rv64. This is a much cleaner way of doing what profile disablement
is currently doing.


Thanks,


Daniel


[1] https://lore.kernel.org/qemu-riscv/ZRarBuEeBi7WkS6K@redhat.com/
[2] https://lore.kernel.org/qemu-riscv/20231025234459.581697-10-dbarboza@ventanamicro.com/






> 
>>>>>> As far as warnings go, it'd be nice to warn when mandatory profile
>>>>>> extensions are disabled from an enabled profile. Doing that might be
>>>>>> useful for debug, but users which do it without being aware they're
>>>>>> "breaking" the profile may learn from that warning. Note, the warning
>>>>>> should only come when the profile is actually enabled and when the
>>>>>> extension would actually be disabled, i.e.
>>>>>>
>>>>>>    -cpu rv64,rva22u64=true,c=off
>>>>>>
>>>>>> should warn
>>>>>>
>>>>>>    -cpu rv64,c=off,rva22u64=true
>>>>>>
>>>>>> should not warn (rva22u64 overrides c=off since it's to the right)
>>>>>>
>>>>>>    -cpu rv64,rva22u64=true,rva22u64=false,c=off
>>>>>>
>>>>>> should not warn (rva22u64 is not enabled)
>>>
>>> I think these should be hard errors, not warnings.
>>>
>>> If you're enabling a profile and then disabling an extension that's
>>> mandatory for that profile, you've invalidated the profile. You've
>>> asked for a configuration that doesn't make any sense: you can't have
>>> a CPU that both implements a profile and lacks one of its mandatory
>>> extensions.
>>
>> Given a platform which implements a profile which mandates extension E and
>> a need to debug E or test behavior where E is [incorrectly] absent, you'll
>> need to expand the profile first, listing each of the other extensions
>> manually. It'd be much faster to specify the profile, take away the
>> extension, and ignore the warning.
> 
> I understand the appeal, I just think that regular users should be
> prevented from stumbling into this kind of expert-level,
> intentionally-broken configuration by mistake.
> 
>>> QEMU users could easily miss the warning. libvirt users won't see it
>>> at all. It's a user error and it needs to be treated as such IMO.
>>
>> I do agree with the concern that warnings will be missed/ignored. Maybe
>> QEMU needs something like -Werror for stuff like this, i.e.
>>
>>   -cpu rv64,error-on-extension-warnings=on,profile-A=on,extension-of-A=off
>>
>> would error out, but, without the special property, just warn. Or, flip
>> the default behavior around with
>>
>>   -cpu rv64,ignore-extension-errors=on,profile-A=on,extension-of-A=off
>>
>> which would either silently proceed or just warn, but, without the
>> special property, error out. libvirt would default to the error out
>> case, whichever that one is, but also provide an element to turn off
>> erroring-out.
> 
> I would be okay with something along these lines.
> 

