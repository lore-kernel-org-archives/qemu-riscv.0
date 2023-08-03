Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113ECC001DF
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 11:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRWdg-00034N-88; Thu, 03 Aug 2023 07:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRWde-00033m-3b
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 07:37:06 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRWdc-0002TB-9x
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 07:37:05 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1bb575a6ed3so580764fac.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Aug 2023 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691062623; x=1691667423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NZRwNzSD+I4t1eFXjKBQJrRSnsZIg8tGJuFy2QfSlCU=;
 b=CdxHR3VCx6s1FXGRvXxTcZRneTdRts+9K1UuNGj620MyNu+NETKSwS1mMPU3cws+/P
 n8f+ZqYr7B934j377E8eA4z5TgzeITebbhXVnbIaejHWczPzaJ+OckQl7knd3o2bdRdI
 9+Qww5Fd/Dxe79C8PqdakXGFX/wAX/u9NCdhWOUK1+KIcvFO0D3mVp81URC3vzU1U4GY
 K4lBK6EtwxH/uoHYBwbZnMsCaDswkl+tMCcnHC9aDp39op9MCxDhi/qhc78id/X0zRw1
 GZgv7uPL6+t4fPSIQhekDbqgAZjwEEHy27GWSUgGbdvcjsI24uIoRYe7Lf2MVWi1su9P
 +XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691062623; x=1691667423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NZRwNzSD+I4t1eFXjKBQJrRSnsZIg8tGJuFy2QfSlCU=;
 b=EweQF0leh/FNnPXHCyYMPNKgbZrI7Oc9criL9DWyBdXLfQkXJ1ou1SiFJQbnORqxbd
 uiHe1aSbXCZxeS8uW5vgCEKcDQpoKnZj2+rh+NrFcl4h6J5/mop8rDRIAO6OKrgFqoTf
 tzZy8RNSYIiwVozSFm2VeA+Wbw8ePUoxWSy4WcUrwoc7x6O3NueIQMv3e2zBtdc0Wv+Q
 z/TnIPh2wScHCrfa1YWC4Jz/nov3kvld2tZNUwkxcgQSPWUf3L0wePMzZQazx8wnzvra
 Hw0/cIvSl1oc6xe8EdQx9AVIQObmrOaGJPKWY76VrHDWxAoZVEFLEoor3XS71liw8e0M
 II3g==
X-Gm-Message-State: ABy/qLZgC2FKVXqEprvzmEuBBi8PHfgCgPpaAWOsZ9ZVvR3FwV6J6vB8
 BFbvtKqIXDfEWXhZtwo1gg/Fzw==
X-Google-Smtp-Source: APBJJlGaQgdJ9MHK2lb0E+CqYsJMvmWKJYokzDW8qoQH2L03CmTk95s3OeId9vnAbev201Xc5+D80Q==
X-Received: by 2002:a05:6870:9126:b0:1be:e1d9:6f88 with SMTP id
 o38-20020a056870912600b001bee1d96f88mr14571814oae.40.1691062622690; 
 Thu, 03 Aug 2023 04:37:02 -0700 (PDT)
Received: from [192.168.68.108] ([187.11.154.63])
 by smtp.gmail.com with ESMTPSA id
 lf13-20020a05687c348d00b001bf5778d1a1sm1217410oac.34.2023.08.03.04.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 04:37:02 -0700 (PDT)
Message-ID: <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
Date: Thu, 3 Aug 2023 08:36:57 -0300
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
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230803-3d2b378004c77196efc74f09@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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



On 8/3/23 06:29, Andrew Jones wrote:
> On Wed, Aug 02, 2023 at 03:00:58PM -0300, Daniel Henrique Barboza wrote:
>> cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
>> a target_ulong val, i.e. a 64 bit field in a 64 bit host.
>>
>> Given that we're passing a pointer to the mvendorid field, the reg is
>> reading 64 bits starting from mvendorid and going 32 bits in the next
>> field, marchid. Here's an example:
>>
>> $ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \
>>     -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)
>>
>> (inside the guest)
>>   # cat /proc/cpuinfo
>> processor	: 0
>> hart		: 0
>> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
>> mmu		: sv57
>> mvendorid	: 0xab000000cd
>> marchid		: 0xab
>> mimpid		: 0xef
>>
>> 'mvendorid' was written as a combination of 0xab (the value from the
>> adjacent field, marchid) and its intended value 0xcd.
>>
>> Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
>> use it as input for kvm_set_one_reg(). Here's the result with this patch
>> applied and using the same QEMU command line:
>>
>>   # cat /proc/cpuinfo
>> processor	: 0
>> hart		: 0
>> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
>> mmu		: sv57
>> mvendorid	: 0xcd
>> marchid		: 0xab
>> mimpid		: 0xef
>>
>> This bug affects only the generic (rv64) CPUs when running with KVM in a
>> 64 bit env since the 'host' CPU does not allow the machine IDs to be
>> changed via command line.
>>
>> Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/kvm.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>> index 9d8a8982f9..b1fd2233c0 100644
>> --- a/target/riscv/kvm.c
>> +++ b/target/riscv/kvm.c
>> @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
>>   static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
>>   {
>>       CPURISCVState *env = &cpu->env;
>> +    target_ulong reg;
> 
> We can use the type of cfg since KVM just gets an address and uses the
> KVM register type to determine the size. So here,
> 
>   uint32_t reg = cpu->cfg.mvendorid;
> 
> and then...
> 
>>       uint64_t id;
>>       int ret;
>>   
>>       id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
>>                             KVM_REG_RISCV_CONFIG_REG(mvendorid));
>> -    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
>> +    /*
>> +     * cfg.mvendorid is an uint32 but a target_ulong will
>> +     * be written. Assign it to a target_ulong var to avoid
>> +     * writing pieces of other cpu->cfg fields in the reg.
>> +     */
> 
> ...we don't need this comment since we're not doing anything special.

I tried it out and it doesn't seem to work. Here's the result:

/ # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
mmu		: sv57
mvendorid	: 0xaaaaaa000000cd
marchid		: 0xab
mimpid		: 0xef


The issue here is that the kernel considers 'mvendorid' as an unsigned long (or
what QEMU calls target_ulong). kvm_set_one_reg() will write an unsigned long
regardless of the uint32_t typing of 'reg', meaning that it'll end up writing
32 bits of uninitialized stuff from the stack.

target_ulong seems that the right choice here. We could perhaps work with
uint64_t (other parts of the code does that) but target_ulong is nicer with
32-bit setups.


Thanks,

Daniel

> 
>> +    reg = cpu->cfg.mvendorid;
>> +    ret = kvm_set_one_reg(cs, id, &reg);
>>       if (ret != 0) {
>>           return ret;
>>       }
>> -- 
>> 2.41.0
>>
> 
> We should audit and fix all uses of &cpu->cfg.* with KVM ioctls. We can
> also consider introducing wrappers like
> 
> #define kvm_set_one_reg_safe(cs, id, addr)	\
> ({						\
> 	typeof(*(addr)) _addr = *(addr);	\
> 	kvm_set_one_reg(cs, id, &_addr)		\
> })
> 
> Thanks,
> drew

