Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C5CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 21:45:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtELq-0007by-7M; Wed, 18 Oct 2023 17:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtELp-0007bf-8c
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 17:45:13 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtELn-00039l-5b
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 17:45:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b89ab5ddb7so4870890b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697665509; x=1698270309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wAOEHQ77CDEWxljUHmClboNiozu0PLhNNjRUillm338=;
 b=bV0GImePWIDWXdor+cUJvbjE0xObAkogcd3STfccACZYOvXO/vJN3eG80mlXV5F02k
 vY6kvNnuFrWWLrQUy81KoPVz9Mi7oBug73LMsWj0IL8L+a1yv8nPNoIafiK0P3VsSRAM
 Ads3fiKmQtcvSxZ3Qt6ckJkIAPzfp/htqw4VKroqIHPzviGXtmqhqOxRm3Jwl1ENlmdz
 RxaXwoudkxiFXlSvJy8P9H+qQEIHo7GwyiJlu3AwSW0iI0XKWJPSSei3vrlb3dBphXiE
 nHgxjxdJuxCugfEnQsjDfYUS1MVDYgp73oXJH2JgsaBmR9fk6Ky7IF/fp/xBfkXU0kSc
 cnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697665509; x=1698270309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wAOEHQ77CDEWxljUHmClboNiozu0PLhNNjRUillm338=;
 b=nFVwitbU84Gdrk3zVzE+GqqhcXVm03bwl/WP4Fx/QpuTm4fmNBx7tj1EiMZsvugpeO
 KlbjAVDc822W7soXSt5jjEqhpUhEwMWroqTAOfOLQOIflLzcZj30EpfQ46ia1zcW5E9Y
 /LIebvXIayJCLepkasN58y8C+CwLFP0QG4wwa/a5dDYOTnSbraDLJt52f9IvwdQzQUR/
 E0vAN5VRokTdAmza7KFoZAr+daUgqJJZcn6w6tvyrc09JALh4f1XgABej35VvRDy6xAW
 qnCUc3silsJ4C1UASJ6S1g3QrG7cYqPenjYUlOuLCn/x7+kyJbeg265qzrCZgzZSa/gC
 O/Cw==
X-Gm-Message-State: AOJu0YwWUz9o5HtCebOkEWVo2+dblNppM4b6xpGsEubqAgiyWf/AwU/d
 pAAgJ9TcdVJnKmd1KEmqZF/k7g==
X-Google-Smtp-Source: AGHT+IGRtMZ88AXTbtvNiQTkY6yQhFWKVt9MNY4aZ1jEEECFra4l3Yh35fwXEpn84i1xsSE+4ezPeg==
X-Received: by 2002:a62:798b:0:b0:690:1c1b:aefd with SMTP id
 u133-20020a62798b000000b006901c1baefdmr396359pfc.5.1697665509468; 
 Wed, 18 Oct 2023 14:45:09 -0700 (PDT)
Received: from [192.168.68.107] ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa79477000000b006bd9422b279sm3783899pfq.54.2023.10.18.14.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 14:45:09 -0700 (PDT)
Message-ID: <2a2febdb-d42e-4d72-aae1-e630f079f2c2@ventanamicro.com>
Date: Wed, 18 Oct 2023 18:45:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
 <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
 <20231016-cf26d23a1fe53ee3b5b68513@orel>
 <CAKmqyKMg0VKRQ_kFLHJQCq19p-Yv4iJqJZF3XGZWxfuYPe3rbQ@mail.gmail.com>
 <20231017-e7a4712137165b59844499e3@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231017-e7a4712137165b59844499e3@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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



On 10/17/23 05:08, Andrew Jones wrote:
> On Tue, Oct 17, 2023 at 01:55:47PM +1000, Alistair Francis wrote:
>> On Mon, Oct 16, 2023 at 7:03 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>>>
>>> On Thu, Oct 12, 2023 at 04:07:50PM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 10/11/23 00:01, Alistair Francis wrote:
>>>>> On Sat, Oct 7, 2023 at 12:23 AM Daniel Henrique Barboza
>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Several design changes were made in this version after the reviews and
>>>>>> feedback in the v1 [1]. The high-level summary is:
>>>>>>
>>>>>> - we'll no longer allow users to set profile flags for vendor CPUs. If
>>>>>>     we're to adhere to the current policy of not allowing users to enable
>>>>>>     extensions for vendor CPUs, the profile support would become a
>>>>>>     glorified way of checking if the vendor CPU happens to support a
>>>>>>     specific profile. If a future vendor CPU supports a profile the CPU
>>>>>>     can declare it manually in its cpu_init() function, the flag will
>>>>>>     still be set, but users can't change it;
>>>>>>
>>>>>> - disabling a profile will now disable all the mandatory extensions from
>>>>>>     the CPU;
>>>>>
>>>>> What happens if you enable one profile and disable a different one?
>>>>
>>>> With this implementation as is the profiles will be evaluated by the order they're
>>>> declared in riscv_cpu_profiles[]. Which isn't exactly ideal since we're exchanging
>>>> a left-to-right ordering in the command line by an arbitrary order that we happened
>>>> to set in the code.
>>>>
>>>> I can make some tweaks to make the profiles sensible to left-to-right order between
>>>> them, while keeping regular extension with higher priority. e.g.:
>>>>
>>>>
>>>> -cpu rv64,zicbom=true,profileA=false,profileB=true,zicboz=false
>>>> -cpu rv64,profileA=false,zicbom=true,zicboz=false,profileB=true
>>>> -cpu rv64,profileA=false,profileB=true,zicbom=true,zicboz=false
>>>>
>>>> These would all do the same thing: "keeping zicbom=true and zicboz=false, disable profileA
>>>> and then enable profile B"
>>>>
>>>> Switching the profiles order would have a different result:
>>>>
>>>> -cpu rv64,profileB=true,profileA=false,zicbom=true,zicboz=false
>>>>
>>>> "keeping zicbom=true and zicboz=false, enable profile B and then disable profile A"
>>>>
>>>>
>>>> I'm happy to hear any other alternative/ideas. We'll either deal with some left-to-right
>>>> ordering w.r.t profiles or deal with an internal profile commit ordering. TBH I think
>>>> it's sensible to demand left-to-right command line ordering for profiles only.
>>>
>>> left-to-right ordering is how the rest of QEMU properties work and scripts
>>> depend on it. For example, one can do -cpu $MODEL,$DEFAULT_PROPS,$MORE_PROPS
>>> where $MORE_PROPS can not only add more props but also override default
>>> props (DEFAULT_PROPS='foo=off', MORE_PROPS='foo=on' - foo will be on).
>>> left-to-right also works with multiple -cpu parameters, i.e. -cpu
>>> $MODEL,$DEFAULT_PROPS -cpu $MODEL,$MY_PROPS will replace default props
>>> with my props.
>>
>> That seems like the way to go then
>>
>>>
>>> I don't think profiles should be treated special with regard to this. They
>>> should behave the same as any property. If one does
>>> profileA=off,profileB=on and there are overlapping extensions then a
>>
>> But what does this mean? What intent is the user saying here?
>>
>> For example if a user says:
>>
>>      RVA22U64=off,RVA24U64=on
>>
>> They only want the extensions that were added in RVA24U64? What about
>> G and the standard extensions?
> 
> Disabling a profile is certainly odd, because I wouldn't expect profiles
> to be used with any CPU type other than a base type, i.e. they should be
> used to enable extensions on a barebones CPU model, which means setting
> them off would be noops.  And, if a profile is set off for a cpu model
> where extensions are set either by the model or by previous profile and
> extension properties, then it also seems like an odd use, but that's at
> least consistent with how other properties would work, so I'm not sure we
> need to forbid it.

It's weird to add a flag that users can set to 'off' and nothing happens.

That said, I'm considering profile disablement a debug/development option.
I am thinking about adding a warning when users disables a profile like:

"disabling a profile is recommended only for troubleshooting and is discouraged
for regular use"

And also mention something along those lines in the docs as well.

We might be compelled into implementing profile disablement because it's weird
otherwise, but we're not obligated to promote it. In fact I want to actively
discourage it.


Thanks,

Daniel


> 
>>
>> To me it just seems really strange to have more than 1 profile.
>> Profiles are there to help software and users have common platforms.
>> Why would a user want to mix-n-match them
> 
> I think it's possible users will want to describe platforms which are
> compatible with more than one profile, e.g. RVA22U64=on,RVA24U64=on.
> 
> The example I gave Andrea about this was that C may get demoted from
> mandatory to optional in later profiles. If a platform is built which
> conforms to an older profile with C and to the later profile where C
> is only optional, then enabling both profiles will ensure that C is
> enabled, whereas only enabling the later profile will not, and then
> C must be added manually after inspecting the older profile to see
> what will be missed. OIOW, the burden of individual extension management
> will still be present if only single profiles may be enabled at a time.
> (And, even if the later profile was a strict superset of the older one,
> then, if a user wants to explicitly describe a platform which claims
> compatibility with both profiles, they probably shouldn't be punished
> for it, even if the resulting extension enablement would be equivalent
> to only enabling the later profile.)
> 
> Thanks,
> drew

