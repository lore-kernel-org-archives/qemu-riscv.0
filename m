Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E85CE7F154
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 11:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmBgP-0001G1-39; Fri, 29 Sep 2023 07:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmBgN-0001Fi-E2
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 07:29:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qmBgJ-0001BE-3o
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 07:29:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c736b00639so14715715ad.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695986953; x=1696591753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2agJXzV0YAIg6OBb6DLDrY4ExbClLF+uqg1FrUBp3U=;
 b=lfd0GqwzPUMaKXEvQ57xQ3qe4/w4L9ws9HzyKFAwIvC+vghcZWlFMHcz08UJ1juk2N
 5n60RLi/JFV6dlyN05JvATaTP/4xSsfkY6E19B+2FNLquxvq1p2ozqo6QzINL1o0nu0X
 Gt28UGQx+AnkoEA2n+Ljy6vluMxYNlNYyxmbNs2rwBp7hHhSrUFXirfOp3EOFBn0Y/u3
 /EQ0bQ/kQ3oR7eItyul0zJL69EPVd/g2t1UlDeFDqRc9GkU7TSFTyGknunMv0mPjjt3J
 pzFcwMZQoIUDOUBZTKoEZQfCqiHYnAeD3N/ILLAxg5j0miRDJQn9oER7OBQt9eMFzLJS
 mv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695986953; x=1696591753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2agJXzV0YAIg6OBb6DLDrY4ExbClLF+uqg1FrUBp3U=;
 b=CRSWuvhQ/BAR5YGAnCDojBf8NzSKoVQ6ZGj8uXt9Qf14BmRQaTq2BjqiepE8Uo7vhM
 1up1zNJvIlnCNyuZwJ3IID4YNtE2+UghvWC8wDssGEnalJ5yEWoYKKnAJCgXk6WSK6Ip
 +tMUGpHdC1wBw2pFocc3oSYzgRUgrAZ+tCIbFGax12VJ23vph329tNBUfyIlnvFZqD44
 hkXTchth8pB3lhi/VCh2iL8D2VCSRKxHFUHR6Tyx71KGqPbvEC7WVq330ZvBhyXqcp2c
 Utl2dKlDuclfzCWjaNeUSz8xQDtBSeRCLNW71IlCsh7euD5MoGyfUxPhKRzvllVT0+fk
 5IKw==
X-Gm-Message-State: AOJu0Yze5ZWcPflZnPGk6OwULfyYIrseLJTzX8NDcQ88NKrgvkQTM4mT
 DkpxjTphDPJYOisdxC2DT1EAJQ==
X-Google-Smtp-Source: AGHT+IEI0tVCMa1u3Hi0EG+8JinqH9gnVKXUVuaWR6XyVy9EVL3Svc8ywP0qZMDOt8huBgCF7ObH5Q==
X-Received: by 2002:a17:90b:ecb:b0:274:6cc9:ec6d with SMTP id
 gz11-20020a17090b0ecb00b002746cc9ec6dmr3594708pjb.44.1695986952806; 
 Fri, 29 Sep 2023 04:29:12 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.15.124])
 by smtp.gmail.com with ESMTPSA id
 iq12-20020a17090afb4c00b00274262bcf8dsm1222700pjb.41.2023.09.29.04.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 04:29:12 -0700 (PDT)
Message-ID: <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
Date: Fri, 29 Sep 2023 08:29:08 -0300
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
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ZRarBuEeBi7WkS6K@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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



On 9/29/23 07:46, Daniel P. Berrangé wrote:
> On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
>> Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
>> ("[PATCH 0/2] riscv: add extension properties for all cpus")
>>
>> Hi,
>>
>> These patches implements the base profile support for qemu-riscv and the
>> first profile, RVA22U64.
>>
>> As discussed in this thread [1] we're aiming for a flag that enables all
>> mandatory extensions of a profile. Optional extensions were left behind
>> and must be enabled by hand if desired. Since this is the first profile
>> we're adding, we'll need to add the base framework as well.
>>
>> The RVA22U64 profile was chosen because qemu-riscv implements all its
>> extensions, both mandatory and optional. That includes 'zicntr' and
>> 'zihpm', which we support for awhile but aren't adverting to userspace.
>>
>> Other design decisions made:
>>
>> - disabling a profile flag does nothing, i.e. we won't mass disable
>>    mandatory extensions of the rva22U64 profile if the user sets
>>    rva22u64=false;
> 
> Why shouldn't this be allowed ?
> 
> IIUC, a profile is syntactic sugar for a group of features. If
> we can disable individual features explicitly, why should we
> not allow use of the profile as sugar to disable them en-mass ?

In theory there's no harm in allowing mass disabling of extensions but, given
it's a whole profile, we would end up disabling most/all CPU extensions and
the guest would do nothing.

There is a thread in the ML:

https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com/

Where we discussed the possibility of having a minimal CPU extension set. We didn't
reach a consensus because the definition of "minimal CPU extension set" vary between
OSes (Linux requires IMAFD, FreeBSD might require something differ).

Assuming we reach a consensus on what a minimal set is, we could allow disabling mass
extensions via probile but keeping this minimal set, for example. At very least we
shouldn't allow users to disable 'I' because that would kill the CPU, so RV64I is
the minimum set that I would assume for now.


> 
> 
> BTW, I would caution that the semantics of mixing groups of
> features, with individual features in -cpu is likely to be
> ill defined, as you cannot rely on left-to-right processing
> of the -cpu arguments.
> 
> IOW, if you say  -cpu $foo,$group=on,$feature=off
> 
> you might expect this to result in '$feature' being disabled
> if it were implied by $group. This is not guaranteed as the
> QDict processing of options could result in us effectively
> processing   -cpu $foo,$feature=off,$group=on
> 
> This brokeness with CPU feature groups and their interaction
> with CPU feature flags already impacts s390x:
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2023-09/msg00981.html
> 
> There is a possible way to fix it by declaring an ordering
> such that all groups will be processed fully, before any
> individual features are processed, and declaring that group
> or feature names must not be repeated. This avoids a reliance
> on left-to-right ordering:
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2023-09/msg01005.html
> 
> that is still likely broken, however, if multiple different
> groups are listed, and there is overlap in their feature
> sets.

Just read the discussion. I agree with restricting the command line flexibility
to make things more consistent, but IIRC libvirt (and others) uses a lot of
command line appending and restricting these use cases now will break stuff
up. I recall pc64 domains using <qemu:commandline> to add extra cpu/machine
flags to the domain back in the day. Surely we can claim (I guess) that command
line pass-through is unstable and users shouldn't expect extended support for
it, but we all know that users will be less than pleased when their domains
start breaking because QEMU restricted the command line.

As for the current RISC-V case, one thing we can do is to postpone feature group
processing to realize() time, since in that stage we're already done with the
command line processing. We can make a sanity check between the feature group
flags and error out if there's something off. That would make things a little
less fragile that what they are, albeit I'm sure that there will be some cases
that will be left uncovered.

> 
> TL;DR: feature groups are pretty error prone if more than
> one is listed by the user, or they're combined with individual
> features.
> 
>>
>> - profile support for vendor CPUs consists into checking if the CPU
>>    happens to have the mandatory extensions required for it. In case it
>>    doesn't we'll error out. This is done to follow the same prerogative
>>    we always had of not allowing extensions being enabled for vendor
>>    CPUs;
> 
> Why shouldn't this be allowed ?

There's no technical reason to not allow it. The reason it's forbid is to be
closer to what the real hardware would do. E.g. the real hardware doesn't allow
users to enable Vector if the hardware doesn't support it. Vendor CPUs also has
a privileged spec restriction as well, so if a CPU is running in an older spec
it can't enable extensions that were added later.

If vendor CPUs from x86 and others behave in a different way with feature enablement
I'd like to hear about it. I can say that what RISC-V is doing in this regard is
not that far from what PowerPC does.
  


Thanks,

Daniel

> 
>> - the KVM driver doesn't support profiles. In theory we could apply the
>>    same logic as for the vendor CPUs, but KVM has a long way to go before
>>    that becomes a factor. We'll revisit this decision when KVM is able to
>>    support at least one profile.
>>
>> Patch 5 ("enable profile support for vendor CPUs") needs the following
>> series to be applied beforehand:
>>
>> "[PATCH 0/2] riscv: add extension properties for all cpus"
>>
>> Otherwise we won't be able to add the profile flag to vendor CPUs.
>>
>> [1] https://lore.kernel.org/qemu-riscv/35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com/
>>
>> Daniel Henrique Barboza (6):
>>    target/riscv/cpu.c: add zicntr extension flag
>>    target/riscv/cpu.c: add zihpm extension flag
>>    target/riscv: add rva22u64 profile definition
>>    target/riscv/tcg: implement rva22u64 profile
>>    target/riscv/tcg-cpu.c: enable profile support for vendor CPUs
>>    target/riscv/kvm: add 'rva22u64' flag as unavailable
>>
>>   target/riscv/cpu.c         | 25 ++++++++++
>>   target/riscv/cpu.h         | 10 ++++
>>   target/riscv/cpu_cfg.h     |  2 +
>>   target/riscv/kvm/kvm-cpu.c |  5 +-
>>   target/riscv/tcg/tcg-cpu.c | 98 ++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 139 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.41.0
>>
>>
> 
> With regards,
> Daniel

