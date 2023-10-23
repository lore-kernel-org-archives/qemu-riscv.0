Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD41C25B45
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:54:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quz88-00063a-Sb; Mon, 23 Oct 2023 13:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1quz85-00062k-9K
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 13:54:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1quz83-00043l-An
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 13:54:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c9e95aa02dso25791485ad.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698083653; x=1698688453; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZo23YFm4QqKgSGHxWbGe6SJ0fM9iBrCRT1JcWoA+oc=;
 b=WaCByc16wDdwvtz9AFFHb/2vrXrHEGAHYFV5kkFXxkZXHgmLYLwk5xhip+ULdBIaN0
 7D9t+m0BVSfw/GZ97RinaOTr6Xuw9Xc9gRRQHTYZsVoqCtv6982SFq7A+Bl5lGsFpF3A
 PIALWj/3SPZ3ectRUtYhkYbHyJBWBM3ppTnPwHahUDIthVKLnVaRCaj2DR6w1ISmPZ37
 18TpGHtT94b4L1BU73m+WzK8jQGapNsEaioXaZGtrUzPlWonWdV8SBbrfpiU2Ym7NTrr
 AwZkQHcY0qfMIPGvoHeE+yJQpGUFAFVSNepluXr9nKEmBAWq8ZOMei3Y2ZZxVuYz2PaJ
 8FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698083653; x=1698688453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZo23YFm4QqKgSGHxWbGe6SJ0fM9iBrCRT1JcWoA+oc=;
 b=vBGlbb34E0zK22lUmNzq2PTchltZJQsmqoxhSx1EMYlZkIKlEADo9LC0lWtFQ1XuV+
 sNYTUkyVTHQlufi8Zao8V/Jw0zvkv7esTw3QzZYYMo5Z+OkFH3FyInZLMEVJL8dylhwu
 wkBAPpV4lPp37HO6p6OXwQvRnshTcdMyvvTEuIbZyB5HuvIl0drmbx69vRc40gxSBc/M
 j3jXiIj+lNL9G6QFmwj7/7ywL90ZrocE4NUnRMWmkrS5KZREc6kDj5ze/AfugHAgjXJU
 VD2fPD/klxfz+e9jA+pqMBNtmn81CUr6jGjFAbvZT4QM8zhX14RVEpfuCBSj2qNBYJqJ
 VmXA==
X-Gm-Message-State: AOJu0YyWSMzjLBgKVeU3713SEjxOewvPJuPQZ7nwmxGhJsdJ8z9CSPmh
 g7UnAyG4q6L34gAi5KIq0o5N3A==
X-Google-Smtp-Source: AGHT+IH93Yp0Qd1NAQZL0cghS6w4NH8FSmZPf36upwnNM1a4sAp4zU9SAkRZGfoB+P46FBFHtAUDsQ==
X-Received: by 2002:a17:902:f542:b0:1bf:193a:70b6 with SMTP id
 h2-20020a170902f54200b001bf193a70b6mr12578621plf.5.1698083653514; 
 Mon, 23 Oct 2023 10:54:13 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b001c62d63b817sm6222936plg.179.2023.10.23.10.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 10:54:13 -0700 (PDT)
Message-ID: <847f7055-f8dc-49f9-a194-cab510c941f4@ventanamicro.com>
Date: Mon, 23 Oct 2023 14:54:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231023-b0eb8f3478a61875a22de747@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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



On 10/23/23 14:35, Andrew Jones wrote:
> On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 10/23/23 05:16, Andrew Jones wrote:
>>> On Fri, Oct 20, 2023 at 07:39:48PM -0300, Daniel Henrique Barboza wrote:
>>>> The TCG emulation implements all the extensions described in the
>>>> RVA22U64 profile, both mandatory and optional. The mandatory extensions
>>>> will be enabled via the profile flag. We'll leave the optional
>>>> extensions to be enabled by hand.
>>>>
>>>> Given that this is the first profile we're implementing in TCG we'll
>>>> need some ground work first:
>>>>
>>>> - all profiles declared in riscv_profiles[] will be exposed to users.
>>>> TCG is the main accelerator we're considering when adding profile
>>>> support in QEMU, so for now it's safe to assume that all profiles in
>>>> riscv_profiles[] will be relevant to TCG;
>>>>
>>>> - we'll not support user profile settings for vendor CPUs. The flags
>>>> will still be exposed but users won't be able to change them. The idea
>>>> is that vendor CPUs in the future can enable profiles internally in
>>>> their cpu_init() functions, showing to the external world that the CPU
>>>> supports a certain profile. But users won't be able to enable/disable
>>>> it;
>>>>
>>>> - Setting a profile to 'true' means 'enable all mandatory extensions of
>>>> this profile, setting it to 'false' means disabling all its mandatory
>>>> extensions. Disabling a profile is discouraged for regular use and will
>>>> issue an user warning. User choices for individual extensions will take
>>>> precedence, i.e. enabling a profile will not enable extensions that the
>>>> user set to 'false', and vice-versa. This will make us independent of
>>>> left-to-right ordering in the QEMU command line, i.e. the following QEMU
>>>> command lines:
>>>>
>>>> -cpu rv64,zicbom=false,rva22u64=true,Zifencei=false
>>>> -cpu rv64,zicbom=false,Zifencei=false,rva22u64=true
>>>> -cpu rv64,rva22u64=true,zicbom=false,Zifencei=false
>>>>
>>>> They mean the same thing: "enable all mandatory extensions of the
>>>> rva22u64 profile while keeping zicbom and Zifencei disabled".
>>>
>>> Hmm, I'm not sure I agree with special-casing profiles like this. I think
>>> the left-to-right processing should be consistent for all. I'm also not
>>> sure we should always warn when disabling a profile. For example, if a
>>> user does
>>>
>>>    -cpu rv64,rva22u64=true,rva22u64=false
>>>
>>> then they'll get a warning, even though all they're doing is restoring the
>>> cpu model. While that looks like an odd thing to do, a script may be
>>> adding the rva22u64=true and the rva22u64=false is the user input which
>>> undoes what the script did.
>>
>> QEMU options do not work with a "the user enabled then disabled the same option,
>> thus it'll count as nothing happened" logic. The last instance of the option will
>> overwrite all previous instances. In the example you mentioned above the user would
>> disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
>> same profile was enabled beforehand.
> 
> Yup, I'm aware, but I keep thinking that we'll only be using profiles with
> a base cpu type. If you start with nothing (a base) and then add a profile
> and take the same one away, you shouldn't be taking away anything else. I
> agree that if you use a profile on some cpu type that already enabled a
> bunch of stuff itself, then disabling a profile would potentially remove
> some of those too, but mixing cpu types that have their own extensions and
> profiles seems like a great way to confuse oneself as to what extensions
> will be present.  IOW, we should be adding a base cpu type at the same
> time we're adding these profiles.

After this profile work is merged I suggest:

1a - make rv64 a base cpu type, no extensions enabled by default. Change the default
CPU to 'max' like linux-user mode is already doing to avoid breaking users

OR

1b - create a new rv64base|rv64bare to be used exclusively with profiles or when users
really want to know what they're loading in the CPU. No extensions enabled by default.
'rv64' remains untouched as default CPU


I can see a case for both. 1b is less work to make it happen. Thanks,


Daniel


> 
>>
>> Sure, the can put code in place to make this happen, but then this would make
>> profiles act different than regular extensions. "-cpu rv64,zicbom=true -cpu rv64,zicbom=false"
>> will disable zicbom, it will not preserve the original 'zicbom' rv64 default. If
>> we're going to keep left-to-right ordering consistent, this behavior should also
>> be consistent as well.
> 
> It will be consistent if we always override whatever was on the left with
> what's on the right, which means with
> 
>   -cpu rv64,rva22u64=true -cpu rv64,zicbom=false
> 
> zicbom will be disabled, but with
> 
>   -cpu rv64,zicbom=false -cpu rv64,rva22u64=true
> 
> it will be enabled. The same goes if the properties are given to the same
> -cpu parameter.
> 
>>
>>
>> As for warnings, I agree that we'll throw warnings even when nothing of notice happened.
>> For example:
>>
>> -cpu rv64,rva22u64=false -cpu rv64,rva22u64=true
>>
>> This will throw a warning even though the user ended up enabling the extension
>> in the end.
>>
>>
>> We can fix it by postponing warnings to realize().
>>
>>
>>>
>>> As far as warnings go, it'd be nice to warn when mandatory profile
>>> extensions are disabled from an enabled profile. Doing that might be
>>> useful for debug, but users which do it without being aware they're
>>> "breaking" the profile may learn from that warning. Note, the warning
>>> should only come when the profile is actually enabled and when the
>>> extension would actually be disabled, i.e.
>>>
>>>    -cpu rv64,rva22u64=true,c=off
>>>
>>> should warn
>>>
>>>    -cpu rv64,c=off,rva22u64=true
>>>
>>> should not warn (rva22u64 overrides c=off since it's to the right)
>>>
>>>    -cpu rv64,rva22u64=true,rva22u64=false,c=off
>>>
>>> should not warn (rva22u64 is not enabled)
>>
>> Ack for all the above.
>>
>>>
>>> And,
>>>
>>>    -cpu rv64,rva22u64=true,rva24u64=false
>>>
>>> should warn for each extension which is mandatory in both profiles.
>>
>> The way I'm imagining this happening is to cycle through all profiles during realize(),
>> see which ones are enabled, and then warn if the user disabled their mandatory
>> extensions. In this example we would warn for all rva22 mandatory extensions
>> that were disabled because we disabled rva24, but we won't emit any warnings for
>> rva24 mandatory extensions given that the profile is marked as disabled.
> 
> Yup, sounds good.
> 
> Thanks,
> drew

