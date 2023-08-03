Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D9C41513
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 13:05:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRY0f-0007jf-F5; Thu, 03 Aug 2023 09:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRY0e-0007jP-Kx
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 09:04:56 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRY0c-0001oE-EE
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 09:04:56 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bca88c3487so815236a34.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Aug 2023 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691067893; x=1691672693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7lBDXMXlinPlIOi2c2I77Ijbdr50mbYoa7TNAJopYZY=;
 b=MVqFwkzrX+2MIPS5s0Xv2GJPAksW/mvWSYs6kLsmGh486LoZKboilJ2601/nCx0Jzn
 G/10Ed3dzkInGjdzrZf0eCMSRuMyL6SVJHyZo9SW+/3YKmpbS5A0XnIQnVU9pY8t56ra
 WDWtGX9HBfkyu12aZ4Z6qRY6OifWiQthey2PEguIgw8Pgk9tEw7V7jxTuWlY1mgMEyK/
 HK+46Qp/yzwMIw5hEw8H3SG7QVhuEkQcFB3FBm5OXYP4ozBjK8MpHZM6gXj4ReTs1Gu2
 5LtpYzvqoG4kXTKKe35Ft2/Qjw3vKG2UkLuAW2LA1D6lrVQeX65rSvndno2a578nYY+S
 jGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691067893; x=1691672693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7lBDXMXlinPlIOi2c2I77Ijbdr50mbYoa7TNAJopYZY=;
 b=DHnGKC86j/Bv+waPshRBtjxQHlEX4UUMMj40xtrVjGtTCJSb2jYkuuP7xc8rBWdNIb
 ysrQn/h8KrfIP9TG6BornIi5KVVM71A+fNBHcxa1gU4ZhoTX7zph2vB6O6HhQcUigYRc
 dcnryHG9HAKscFdRoht8w+IWzfLPFXM0s2tSPceVceDkZraCbPDX2QyrHD8reTRFbD1E
 JEatluMK2BCQc+sm39Gs0Nt2s2UWIcl8i+WnqtSCmNQg3smfzW9CdN2OPB+w/JxvahUO
 s+754ffaF1bUqUDrq9nCZ6PNXltiPjvnbzejrlbFNuItTwMopnxvNbN14/hjoVJS8uWr
 vHjw==
X-Gm-Message-State: ABy/qLZ6v+/tEcPUIAGI24y8Efw4ItSoZA4uAtXQoASkjOgKF4wndtjc
 gK7SQQ67tftyEHw41RNwfgocTQ==
X-Google-Smtp-Source: APBJJlHTedIxhr8Rwh39gHaCppp2+0JStD/OHa8JirWSoGmTJ+cSrerytsCIu1+EKki7uZIuOCL2Lg==
X-Received: by 2002:a9d:6f89:0:b0:6bc:b80c:bd53 with SMTP id
 h9-20020a9d6f89000000b006bcb80cbd53mr6120830otq.38.1691067892883; 
 Thu, 03 Aug 2023 06:04:52 -0700 (PDT)
Received: from [192.168.68.108] ([187.11.154.63])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a056830148800b006b45be2fdc2sm6856928otq.65.2023.08.03.06.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 06:04:52 -0700 (PDT)
Message-ID: <aed978bd-650b-dfa8-28ab-e87830332364@ventanamicro.com>
Date: Thu, 3 Aug 2023 10:04:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
 <20230803-3d2b378004c77196efc74f09@orel>
 <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
 <20230803-70bedcfb60cb5b2efb87cedc@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230803-70bedcfb60cb5b2efb87cedc@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 8/3/23 09:05, Andrew Jones wrote:
> On Thu, Aug 03, 2023 at 08:36:57AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 8/3/23 06:29, Andrew Jones wrote:
>>> On Wed, Aug 02, 2023 at 03:00:58PM -0300, Daniel Henrique Barboza wrote:
>>>> cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
>>>> a target_ulong val, i.e. a 64 bit field in a 64 bit host.
>>>>
>>>> Given that we're passing a pointer to the mvendorid field, the reg is
>>>> reading 64 bits starting from mvendorid and going 32 bits in the next
>>>> field, marchid. Here's an example:
>>>>
>>>> $ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \
>>>>      -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)
>>>>
>>>> (inside the guest)
>>>>    # cat /proc/cpuinfo
>>>> processor	: 0
>>>> hart		: 0
>>>> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
>>>> mmu		: sv57
>>>> mvendorid	: 0xab000000cd
>>>> marchid		: 0xab
>>>> mimpid		: 0xef
>>>>
>>>> 'mvendorid' was written as a combination of 0xab (the value from the
>>>> adjacent field, marchid) and its intended value 0xcd.
>>>>
>>>> Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
>>>> use it as input for kvm_set_one_reg(). Here's the result with this patch
>>>> applied and using the same QEMU command line:
>>>>
>>>>    # cat /proc/cpuinfo
>>>> processor	: 0
>>>> hart		: 0
>>>> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
>>>> mmu		: sv57
>>>> mvendorid	: 0xcd
>>>> marchid		: 0xab
>>>> mimpid		: 0xef
>>>>
>>>> This bug affects only the generic (rv64) CPUs when running with KVM in a
>>>> 64 bit env since the 'host' CPU does not allow the machine IDs to be
>>>> changed via command line.
>>>>
>>>> Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>    target/riscv/kvm.c | 9 ++++++++-
>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>>>> index 9d8a8982f9..b1fd2233c0 100644
>>>> --- a/target/riscv/kvm.c
>>>> +++ b/target/riscv/kvm.c
>>>> @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
>>>>    static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
>>>>    {
>>>>        CPURISCVState *env = &cpu->env;
>>>> +    target_ulong reg;
>>>
>>> We can use the type of cfg since KVM just gets an address and uses the
>>> KVM register type to determine the size. So here,
>>>
>>>    uint32_t reg = cpu->cfg.mvendorid;
>>>
>>> and then...
>>>
>>>>        uint64_t id;
>>>>        int ret;
>>>>        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
>>>>                              KVM_REG_RISCV_CONFIG_REG(mvendorid));
>>>> -    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
>>>> +    /*
>>>> +     * cfg.mvendorid is an uint32 but a target_ulong will
>>>> +     * be written. Assign it to a target_ulong var to avoid
>>>> +     * writing pieces of other cpu->cfg fields in the reg.
>>>> +     */
>>>
>>> ...we don't need this comment since we're not doing anything special.
>>
>> I tried it out and it doesn't seem to work. Here's the result:
>>
>> / # cat /proc/cpuinfo
>> processor	: 0
>> hart		: 0
>> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
>> mmu		: sv57
>> mvendorid	: 0xaaaaaa000000cd
>> marchid		: 0xab
>> mimpid		: 0xef
>>
>>
>> The issue here is that the kernel considers 'mvendorid' as an unsigned long (or
>> what QEMU calls target_ulong). kvm_set_one_reg() will write an unsigned long
>> regardless of the uint32_t typing of 'reg', meaning that it'll end up writing
>> 32 bits of uninitialized stuff from the stack.
> 
> Indeed, I managed to reverse the problem in my head. We need to to worry
> about KVM's notion of the type, not QEMU's. I feel like we still need some
> sort of helper, but one that takes the type of the KVM register into
> account. KVM_REG_RISCV_CONFIG registers are KVM ulongs, which may be
> different than QEMU's ulongs, if we ever supported 32-bit userspace on
> 64-bit kernels. Also, not all KVM register types are ulong, some are
> explicitly u32s and others u64s. I see kvm_riscv_reg_id() is used to try
> and get the right KVM reg size set, but it's broken for RISCV_FP_F_REG(),
> since those are all u32s, even when KVM has 64-bit ulong (I guess nobody
> is testing get/set-one-reg with F registers using that helper, otherwise
> we'd be getting EINVAL from KVM). And KVM_REG_RISCV_FP_D_REG(fcsr) is also
> broken and RISCV_TIMER_REG() looks broken with 32-bit KVM, since it should
> always be u64. I guess all that stuff needs an audit.

KVM_REG_RISCV_FP_D_REG(fcsr) does not work ATM because we're missing the ptrace.h
linux header (same problem as RVV I mentioned in private).

But otherwise, yeah, we need an audit for the other cases to see if we're messing
stuff up by accident.


Daniel


> 
> So, I think we need a helper that has a switch on the KVM register type
> and provides the right sized buffer for each case.
> 
> Thanks,
> drew
> 
> 
>>
>> target_ulong seems that the right choice here. We could perhaps work with
>> uint64_t (other parts of the code does that) but target_ulong is nicer with
>> 32-bit setups.
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>>
>>>> +    reg = cpu->cfg.mvendorid;
>>>> +    ret = kvm_set_one_reg(cs, id, &reg);
>>>>        if (ret != 0) {
>>>>            return ret;
>>>>        }
>>>> -- 
>>>> 2.41.0
>>>>
>>>
>>> We should audit and fix all uses of &cpu->cfg.* with KVM ioctls. We can
>>> also consider introducing wrappers like
>>>
>>> #define kvm_set_one_reg_safe(cs, id, addr)	\
>>> ({						\
>>> 	typeof(*(addr)) _addr = *(addr);	\
>>> 	kvm_set_one_reg(cs, id, &_addr)		\
>>> })
>>>
>>> Thanks,
>>> drew

