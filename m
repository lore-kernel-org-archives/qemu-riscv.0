Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB16E71D21
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 12:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmCwj-00059L-Od; Fri, 29 Sep 2023 08:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmCwf-00058m-Em
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:50:13 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmCwY-0007mL-Fb
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:50:10 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1dd830ed844so2699805fac.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695991792; x=1696596592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psCRpBq/U9OjlmcAxothpQw4UR6vRHZJkLtoK0d2TMs=;
 b=iwa42LE7XcA5FGuWHP+Yljs0EkxUy0o6vILTnZXeR5js9zZybVhTsuoyJkxiUEGE5r
 qcerrjwNCNadCMIwmp1v2Qhm+WDRfurPAbAacA+NUwAqdOQDfjoFchfsWMFLpfkln+e7
 Rcib/hOMybDnXnCfWwoQoM8/4aIqFEVxawXfoQ34Jk4KAkLG6S1qrN05P/KKLRtPjMig
 muRUGtT6HB1AvHZ4Crqw7+70kPJLtYghnbZQLVyLJ8bKrhEJwB3Py/5cAVX1y2Gz3QX/
 D64ppxGIgRX8gaiVYBpRfpSuAR4KFhm1ncE4gxgccjFtYNp9Sc7wHW3zCaAyOeNVmcdM
 skxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695991792; x=1696596592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psCRpBq/U9OjlmcAxothpQw4UR6vRHZJkLtoK0d2TMs=;
 b=oko/nxTnBEbbLVn44pn0dob+Tn6rF36Sws75kjIkBa/BsPQtKzopM3Hpwp3+DWEEFY
 ycncnIVlho3sJJWkOKyJjoPWRFVf/3cRCXAgF7o8X/n1wshwQWbV+z33ZLxDwIzpXgNP
 iBuQL5CIAI9x+1wuPcccmsLOLxluvqYZL4Q8CXrdHvPlGvjvg1n5l15RlPCF5UmmBd2B
 eBBVxSEm+sGOmnswTaE67Qs+U2Jmz8XmzS3qHU79jmxSh4mOw6Q93tXE4CKD09Yhix1c
 0lR9eX+vEpx/2nyw8oljgyBdXc6ySKwQc//Qje55ripCKVZbBYhK9fAGAm9PVeRG8ZQt
 g7Og==
X-Gm-Message-State: AOJu0YxkfhNoJo9242xUMhcB8DOPp9u4yUxsmJYi0P2LWSQHt/Doesty
 595pffIa558UYcQUez0kiSXLAA==
X-Google-Smtp-Source: AGHT+IEUuF3vneqGwlkTp7Rqa8dJAKaDIFx/BJA6rcbUi1Jw5DonAxCOUnWRqwAvveLqyVJo9bR96w==
X-Received: by 2002:a05:6870:14d0:b0:1d1:3c89:a7e5 with SMTP id
 l16-20020a05687014d000b001d13c89a7e5mr4361722oab.51.1695991791682; 
 Fri, 29 Sep 2023 05:49:51 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a63f114000000b005703a63836esm14528773pgi.57.2023.09.29.05.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 05:49:51 -0700 (PDT)
Message-ID: <b6256c0e-5000-2af1-5ffa-caae55d9f694@ventanamicro.com>
Date: Fri, 29 Sep 2023 09:49:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
 <ZRarBuEeBi7WkS6K@redhat.com>
 <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
 <ZRa7O67ZTukOq5GL@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ZRa7O67ZTukOq5GL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.295,
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



On 9/29/23 08:55, Daniel P. Berrangé wrote:
> On Fri, Sep 29, 2023 at 08:29:08AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 9/29/23 07:46, Daniel P. Berrangé wrote:
>>> On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
>>>> Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
>>>> ("[PATCH 0/2] riscv: add extension properties for all cpus")
>>>>
>>>> Hi,
>>>>
>>>> These patches implements the base profile support for qemu-riscv and the
>>>> first profile, RVA22U64.
>>>>
>>>> As discussed in this thread [1] we're aiming for a flag that enables all
>>>> mandatory extensions of a profile. Optional extensions were left behind
>>>> and must be enabled by hand if desired. Since this is the first profile
>>>> we're adding, we'll need to add the base framework as well.
>>>>
>>>> The RVA22U64 profile was chosen because qemu-riscv implements all its
>>>> extensions, both mandatory and optional. That includes 'zicntr' and
>>>> 'zihpm', which we support for awhile but aren't adverting to userspace.
>>>>
>>>> Other design decisions made:
>>>>
>>>> - disabling a profile flag does nothing, i.e. we won't mass disable
>>>>     mandatory extensions of the rva22U64 profile if the user sets
>>>>     rva22u64=false;
>>>
>>> Why shouldn't this be allowed ?
>>>
>>> IIUC, a profile is syntactic sugar for a group of features. If
>>> we can disable individual features explicitly, why should we
>>> not allow use of the profile as sugar to disable them en-mass ?
>>
>> In theory there's no harm in allowing mass disabling of extensions but, given
>> it's a whole profile, we would end up disabling most/all CPU extensions and
>> the guest would do nothing.
> 
> True, that is just user error though.  They could disable a profile
> and then manually re-enable individual features, and thus get a
> working system.
> 
>> There is a thread in the ML:
>>
>> https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com/
>>
>> Where we discussed the possibility of having a minimal CPU extension set. We didn't
>> reach a consensus because the definition of "minimal CPU extension set" vary between
>> OSes (Linux requires IMAFD, FreeBSD might require something differ).
>>
>> Assuming we reach a consensus on what a minimal set is, we could allow disabling mass
>> extensions via probile but keeping this minimal set, for example. At very least we
>> shouldn't allow users to disable 'I' because that would kill the CPU, so RV64I is
>> the minimum set that I would assume for now.
> 
> I'd probably just call that user error too.
> 
>>>
>>> TL;DR: feature groups are pretty error prone if more than
>>> one is listed by the user, or they're combined with individual
>>> features.
>>>
>>>>
>>>> - profile support for vendor CPUs consists into checking if the CPU
>>>>     happens to have the mandatory extensions required for it. In case it
>>>>     doesn't we'll error out. This is done to follow the same prerogative
>>>>     we always had of not allowing extensions being enabled for vendor
>>>>     CPUs;
>>>
>>> Why shouldn't this be allowed ?
>>
>> There's no technical reason to not allow it. The reason it's forbid is to be
>> closer to what the real hardware would do. E.g. the real hardware doesn't allow
>> users to enable Vector if the hardware doesn't support it. Vendor CPUs also has
>> a privileged spec restriction as well, so if a CPU is running in an older spec
>> it can't enable extensions that were added later.
> 
> Real hardware is constrained in not being able to invent arbitrary
> new features on chip. Virtual machines  are not constrained, so
> I don't think the inability of hardware todo this, is an especially
> strong reason to limit software emulation.
> 
> What I don't like about this, is that (IIUC) the '$profile=on' option
> now has different semantics depending on what CPU it is used with.
> 
> ie  using it with a vendor CPU,   $profile=on  becomes an assertion
> that the vendor CPU contains all the features needed to satisfy
> $profile. It won't enable/disable anything, just check it is present.
> 
> With a non-vendor CPU, using $profile=on becomes a mechanism to force
> enable all the features needed to satisfy $profile, there is no
> mechanism to just check for presence.
> 
> Having two different semantics for the same syntax is generally considered
> bad design practice.
> 
> This points towards supporting a tri-state, not boolean. $profile=check
> for validation only, and $profile=on for force enablement.

This would leave us with:

- $profile=off => disable all extensions. Let users hit themselves in the foot if they
don't enable any other extensions. Note that disabling a profile and enabling extensions
on top of it is very sensitive to left-to-right ordering, so it would be good to have
a way to enforce this ordering somehow (feature groups always first);

- $profile=on => only valid for generic CPUs;

- $profile=check -> valid for all CPUs, would only check if the CPU implements the profile.


I think this is fine. Drew, care to weight in?


Thanks,

Daniel

> 
> 
> With regards,
> Daniel

