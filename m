Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF3C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 22:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTrTQ-0002Px-MF; Wed, 09 Aug 2023 18:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTrTP-0002PS-1J
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 18:16:11 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTrTL-0003NT-2Y
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 18:16:10 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a78a2c0f81so244537b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Aug 2023 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691619365; x=1692224165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYuct3OTuvKgCYJDGQ6dFDQnBIb+9Efrs+RKsSQi53Q=;
 b=Ng9flm/0QvicM7RocLhElUGs4SI/NARPCXhlRprKNHLsEujLg1ES0olWF0JeI+LFVx
 7GXhrS7huErRmF9+TLW4mMHP6JxR7W8EXiGh5uEL6U72kgVUwyyV7kgFwlSFdx227xTm
 KtQWjfm4bKa5J4RVu9eg3b1ZMAxS4HtP57aYzn8/sQ3hiR1ZQmRaREdsXVTLGRFkeDkN
 vVP5qCo1WZ9Iz9LN4arV1zIuSCdWBGZB9sW3c1+BqqPCPgW2DB4aLjmmhNiwDTWIsZCi
 yXxXLI9uLdvYk50UVs3kbweXJO54CiZymze1L6ILHCbmxFJ4VnGtY1+se5ALc6+v1bxD
 a1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691619365; x=1692224165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYuct3OTuvKgCYJDGQ6dFDQnBIb+9Efrs+RKsSQi53Q=;
 b=asf3MjNivOJdjQB0irvPwawPgiIayDZjB7Oyg4664Qn8RurXf8+l/e6vr7Qi2vAKjj
 RrbDJlsO1+9sWM/hllfbo9If1LK4uiFWYk14oNp5XWkJRM5wRpzlYLpaXZBz3acW9NYP
 /SlP+E/td1NrSdq+FxvyV0wZzU+vN6NTHsB+Mow1Y7WjFr+5OMd7Gf8UM+PKb4Y7cTx8
 sa9M1JcOgSNp+9s+9L2dRvNGGw76SifX2YSOwTHJTvRrGgeJZr4qTU1L87huTaFfn+FW
 I/m2YB5bMDNjJ1UoRgsEKhINwYUIIdlhYJG5FG1NlpiXSt1kW8tbrrCAAckVAIKxMGdr
 X1Jw==
X-Gm-Message-State: AOJu0Yzmy3NgGXsHjVqZuKa7oPSpMXtHMh0iwwaPgQRRXkwDofK4WYJP
 fm+gaMw4GcdpP9Ffznsugg2szg==
X-Google-Smtp-Source: AGHT+IHEg4uEtkgAGEodeVWYSbFQx02Qslb21VamvzXK4qbKH6afYxlobDXKxMmLJcNkuh1QUr3vUg==
X-Received: by 2002:a05:6808:4389:b0:3a7:7366:7526 with SMTP id
 dz9-20020a056808438900b003a773667526mr699511oib.53.1691619365241; 
 Wed, 09 Aug 2023 15:16:05 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 eu9-20020a056808288900b003a1dfa93903sm68727oib.12.2023.08.09.15.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 15:16:04 -0700 (PDT)
Message-ID: <93cf5366-9723-3c08-6ce1-d0dbd1f4a76f@ventanamicro.com>
Date: Wed, 9 Aug 2023 19:16:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
 <20230803-3d2b378004c77196efc74f09@orel>
 <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
 <20230803-70bedcfb60cb5b2efb87cedc@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230803-70bedcfb60cb5b2efb87cedc@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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

Drew,

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
> 
> So, I think we need a helper that has a switch on the KVM register type
> and provides the right sized buffer for each case.

Is this a suggestion to do this right now in this patch? I didn't understand
whether you're ok with the fix as is for 8.1 or if you want more things done
right away.


Thanks,

Daniel

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

