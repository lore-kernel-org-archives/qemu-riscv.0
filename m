Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1263E71D2D
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 13:26:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmDVd-0007Ed-CM; Fri, 29 Sep 2023 09:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmDVZ-0007EB-8k
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:26:18 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmDVX-0000I7-6s
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:26:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so109362055ad.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695993973; x=1696598773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2xTgKcyUe7GD8wTMncPLGUmiX4p3ErMSPHISdg03bDo=;
 b=G54OWjoRalPAbGQ8iQKTc/fYa9M3M4WHkYdpoEKTSmdU0B8HIjwb6RXq+5KrUde3Np
 dXf3pNBRnxNZhp1iLHW0ADrAk6Xv12PehDaHlAxhPit+DN0u1jde+bnRH7THm4S9/93y
 purrTcQ7qysXE6qHm9RAo/7eGw4L8Fj4TRa1S4U4ybnTODnlamGn2/G+RHNKg5w7ibrl
 cjlHXoCECihUgGKDXHTKnf44SZUrmxcrevaA+dspM08InlPqKW29/am2PqLP8TGEX/fC
 ge7nMkynzKUvHVjg7A0RRA5Z2336BB0D6UIOiK4vuP84QTOa5BrsRt6IFZUFFORrdFtx
 ORjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695993973; x=1696598773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2xTgKcyUe7GD8wTMncPLGUmiX4p3ErMSPHISdg03bDo=;
 b=Rejl/Q8WDkQn3Pui2nwxYsRvezts0HUh5wiyyQoN9/t+zukBqm83XOBFmjbmHLAn2K
 kts2mFqVYrUzTFYkNNphO0OxTV4RTEGlN0K728pq/udeaxgSd6X7rIBJFTt4YOS96/+R
 0EP6uKj5zN8EOluqYiUDaC/iBPx/lNU15lV3GSjZkSI4n6i6lbBMM2E/wcUVY8RLWeSv
 swfTGRolgU/JaEJm7lWR49J5ukktcoV5qv4hN3kk4FQMVjUXKX4pLe5EBtroQmDWWmhl
 A8iMpQcHHov16QSs5mzAvJwRxAvuiLm3TVAqx2gESv1ioUpgHGgvbnk7dErrJcvtkqd1
 mIUg==
X-Gm-Message-State: AOJu0YyRwD4vq1vqPnDHwkCDByVjuoWTdRebBPTwETUHs2GnkJGPiCJF
 2QJKNV6cF/C+4ZNuuCFvzFYKLw==
X-Google-Smtp-Source: AGHT+IEt9BHwc9RsUfQr3GeA25FurW3ISY1Nx31uJFT9Uq7+Ir7f4MFKM1se3aS+RS3g/B8PWJh1Bg==
X-Received: by 2002:a17:903:25c2:b0:1c5:bb45:dd22 with SMTP id
 jc2-20020a17090325c200b001c5bb45dd22mr3672163plb.22.1695993972614; 
 Fri, 29 Sep 2023 06:26:12 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170903049300b001b9d7c8f44dsm7673576plb.182.2023.09.29.06.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 06:26:12 -0700 (PDT)
Message-ID: <2acdbc24-33e6-3cd2-b4c7-713844f8211d@ventanamicro.com>
Date: Fri, 29 Sep 2023 10:26:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
 <ZRarBuEeBi7WkS6K@redhat.com>
 <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
 <ZRa7O67ZTukOq5GL@redhat.com>
 <b6256c0e-5000-2af1-5ffa-caae55d9f694@ventanamicro.com>
 <ZRbIqHuefKCBNudv@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ZRbIqHuefKCBNudv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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



On 9/29/23 09:52, Daniel P. Berrangé wrote:
> On Fri, Sep 29, 2023 at 09:49:47AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 9/29/23 08:55, Daniel P. Berrangé wrote:
>>> On Fri, Sep 29, 2023 at 08:29:08AM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 9/29/23 07:46, Daniel P. Berrangé wrote:
>>>>> On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
>>>>>> Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
>>>>>> ("[PATCH 0/2] riscv: add extension properties for all cpus")
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> These patches implements the base profile support for qemu-riscv and the
>>>>>> first profile, RVA22U64.
>>>>>>
>>>>>> As discussed in this thread [1] we're aiming for a flag that enables all
>>>>>> mandatory extensions of a profile. Optional extensions were left behind
>>>>>> and must be enabled by hand if desired. Since this is the first profile
>>>>>> we're adding, we'll need to add the base framework as well.
>>>>>>
>>>>>> The RVA22U64 profile was chosen because qemu-riscv implements all its
>>>>>> extensions, both mandatory and optional. That includes 'zicntr' and
>>>>>> 'zihpm', which we support for awhile but aren't adverting to userspace.
>>>>>>
>>>>>> Other design decisions made:
>>>>>>
>>>>>> - disabling a profile flag does nothing, i.e. we won't mass disable
>>>>>>      mandatory extensions of the rva22U64 profile if the user sets
>>>>>>      rva22u64=false;
>>>>>
>>>>> Why shouldn't this be allowed ?
>>>>>
>>>>> IIUC, a profile is syntactic sugar for a group of features. If
>>>>> we can disable individual features explicitly, why should we
>>>>> not allow use of the profile as sugar to disable them en-mass ?
>>>>
>>>> In theory there's no harm in allowing mass disabling of extensions but, given
>>>> it's a whole profile, we would end up disabling most/all CPU extensions and
>>>> the guest would do nothing.
>>>
>>> True, that is just user error though.  They could disable a profile
>>> and then manually re-enable individual features, and thus get a
>>> working system.
>>>
>>>> There is a thread in the ML:
>>>>
>>>> https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com/
>>>>
>>>> Where we discussed the possibility of having a minimal CPU extension set. We didn't
>>>> reach a consensus because the definition of "minimal CPU extension set" vary between
>>>> OSes (Linux requires IMAFD, FreeBSD might require something differ).
>>>>
>>>> Assuming we reach a consensus on what a minimal set is, we could allow disabling mass
>>>> extensions via probile but keeping this minimal set, for example. At very least we
>>>> shouldn't allow users to disable 'I' because that would kill the CPU, so RV64I is
>>>> the minimum set that I would assume for now.
>>>
>>> I'd probably just call that user error too.
>>>
>>>>>
>>>>> TL;DR: feature groups are pretty error prone if more than
>>>>> one is listed by the user, or they're combined with individual
>>>>> features.
>>>>>
>>>>>>
>>>>>> - profile support for vendor CPUs consists into checking if the CPU
>>>>>>      happens to have the mandatory extensions required for it. In case it
>>>>>>      doesn't we'll error out. This is done to follow the same prerogative
>>>>>>      we always had of not allowing extensions being enabled for vendor
>>>>>>      CPUs;
>>>>>
>>>>> Why shouldn't this be allowed ?
>>>>
>>>> There's no technical reason to not allow it. The reason it's forbid is to be
>>>> closer to what the real hardware would do. E.g. the real hardware doesn't allow
>>>> users to enable Vector if the hardware doesn't support it. Vendor CPUs also has
>>>> a privileged spec restriction as well, so if a CPU is running in an older spec
>>>> it can't enable extensions that were added later.
>>>
>>> Real hardware is constrained in not being able to invent arbitrary
>>> new features on chip. Virtual machines  are not constrained, so
>>> I don't think the inability of hardware todo this, is an especially
>>> strong reason to limit software emulation.
>>>
>>> What I don't like about this, is that (IIUC) the '$profile=on' option
>>> now has different semantics depending on what CPU it is used with.
>>>
>>> ie  using it with a vendor CPU,   $profile=on  becomes an assertion
>>> that the vendor CPU contains all the features needed to satisfy
>>> $profile. It won't enable/disable anything, just check it is present.
>>>
>>> With a non-vendor CPU, using $profile=on becomes a mechanism to force
>>> enable all the features needed to satisfy $profile, there is no
>>> mechanism to just check for presence.
>>>
>>> Having two different semantics for the same syntax is generally considered
>>> bad design practice.
>>>
>>> This points towards supporting a tri-state, not boolean. $profile=check
>>> for validation only, and $profile=on for force enablement.
>>
>> This would leave us with:
>>
>> - $profile=off => disable all extensions. Let users hit themselves in the foot if they
>> don't enable any other extensions. Note that disabling a profile and enabling extensions
>> on top of it is very sensitive to left-to-right ordering, so it would be good to have
>> a way to enforce this ordering somehow (feature groups always first);
> 
> It is also order sensitive if 2 profiles have overlap in the
> extensions they represent. So might also require an ordering
> of profiles themselves to be defined if you permit multiple
> profiles.
> 
> If we dont want to think about this immediately that, then
> we should make $profile=off into a fatal error rather than
> silently ignoring it

I don't mind handling it right now, I just don't know how hehe

I'll re-read the thread you sent earlier and see if there's something I missed. I got the
impression that we need your qom patch first.


Thanks,

Daniel

> 
>> - $profile=on => only valid for generic CPUs;
>>
>> - $profile=check -> valid for all CPUs, would only check if the CPU implements the profile.
>>
>>
>> I think this is fine. Drew, care to weight in?
> 
> 
> With regards,
> Daniel

