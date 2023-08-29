Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47541C71153
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 23:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb8V1-0004TO-Ge; Tue, 29 Aug 2023 19:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qb8Uz-0004Sy-4X
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 19:51:53 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qb8Uu-0007Dv-Mq
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 19:51:52 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bf298ef1f5so650615a34.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693353107; x=1693957907; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u3PtC5OIS8AsjAGmhc4geSdk2PZS+Qc0+sZmTj3UG7g=;
 b=DbszGCjYOKb45beDIpUg/My0umSjahJPD6/uNhLPxBd4q7C0jdiHjgzqvSWM88Aaxy
 T4iwRMDrxx0FQjRU+dXzJAeLG7/xWACbn3CKTs/UHx2QIimMN5dkRB0qTv0cILUgESzy
 LzxSUR89czBalB3CH/zAs0Kjz4OsTlcBR+PUjKiWakCQqX7sspkr+PYZRL7cPq8F8W76
 uPPhj8wr3ONFuLJE1+9tQw5vXKjf/oDt1Ue3bJZf9BvOgfeNfUbuUxETZksivkd1zyGk
 6VBInXpqq9OhnBMOS2YdeZFE0RA6CK8SO3COemxd05T1IRRKTrdQTs2iPhrOVqRaIw1Y
 3AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693353107; x=1693957907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u3PtC5OIS8AsjAGmhc4geSdk2PZS+Qc0+sZmTj3UG7g=;
 b=WHCgncZl9dHJbuJFuWP2+Qvd/0HmR6wxx8c+VxwNJ/SG6iN/ncRx6Sh3yqO+aFm9/0
 aPeM30/Iwvc5CatVm+SP7g6P1o7rmAckJOQdlfSh47e18xNl0SBzILQ1LpvPsec449Qk
 Hp9k6AaTslDWxxvg7QfFvesbqlBqkRhey9t4AC46fuMJluw5kLj40GkEA+0KzhbmoZ/o
 /ko2XItIH9Oo2Nlk2sbEL74YtHCZHSAVaZTmKx1tKoUa0sLt12i4JdrxYqBzrmvAP+98
 pb0xCeXf1spe4Fny+KTzSXRedxJOI/knrgSQc21XsR1+481EUCfAATX57uUJhlURym41
 1mOg==
X-Gm-Message-State: AOJu0YypDzZFtiVgG+pOw+jEVJblWasx861pYOo6sO/1KFEo8tYxbqAu
 77CQoIIg2oTaDoITpiBV5JWTzg==
X-Google-Smtp-Source: AGHT+IHr65vht8gH3ZKFT2Oy1djt2xhSSA4LUH05PCiavRuCPZQBpLfRLZCDUZuYR6G+KnKEjbWqMw==
X-Received: by 2002:a05:6870:c18b:b0:1c3:c43c:f740 with SMTP id
 h11-20020a056870c18b00b001c3c43cf740mr663081oad.15.1693353106705; 
 Tue, 29 Aug 2023 16:51:46 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a4a5502000000b005732cbd3298sm5808160oob.40.2023.08.29.16.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 16:51:46 -0700 (PDT)
Message-ID: <40938464-2008-aff3-ffb7-37fbb16615d3@ventanamicro.com>
Date: Tue, 29 Aug 2023 20:51:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
 <20230829122144.464489-3-dbarboza@ventanamicro.com>
 <c0089044-54d2-43ab-6b30-854a4fa3aa4f@linaro.org>
 <72de2f6a-5ede-40f4-5edc-a22d89587e4e@ventanamicro.com>
 <63d099a2-ac5e-1ce9-3663-10e317d7dc5a@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <63d099a2-ac5e-1ce9-3663-10e317d7dc5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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



On 8/29/23 20:30, Richard Henderson wrote:
> On 8/29/23 16:09, Daniel Henrique Barboza wrote:
>>> -- >8 --
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> @@ -79,7 +79,9 @@
>>>   /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
>>>   static bool virt_use_kvm_aia(RISCVVirtState *s)
>>>   {
>>> -    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>>> +    return kvm_enabled()
>>> +        && kvm_irqchip_in_kernel()
>>> +        && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>>>   }
>>> ---
>>
>> It doesn't work. Same error:
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 388e52a294..ac710006e7 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -79,7 +79,8 @@
>>   /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
>>   static bool virt_use_kvm_aia(RISCVVirtState *s)
>>   {
>> -    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>> +    return kvm_enabled() &&
>> +           kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>>   }
>>
>>   static const MemMapEntry virt_memmap[] = {
>> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
>> index 01be45cc69..7d4b7c60e2 100644
>> --- a/target/riscv/kvm_riscv.h
>> +++ b/target/riscv/kvm_riscv.h
>> @@ -22,19 +22,9 @@
>>   void kvm_riscv_init_user_properties(Object *cpu_obj);
>>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>> -
>> -#ifdef CONFIG_KVM
>>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>>                             uint64_t aia_irq_num, uint64_t aia_msi_num,
>>                             uint64_t aplic_base, uint64_t imsic_base,
>>                             uint64_t guest_num);
>> -#else
>> -static inline void kvm_riscv_aia_create(MachineState *machine,
>> -                                uint64_t group_shift, uint64_t aia_irq_num,
>> -                                uint64_t aia_msi_num, uint64_t aplic_base,
>> -                                uint64_t imsic_base, uint64_t guest_num) {
>> -    g_assert_not_reached();
>> -}
>> -#endif
>>
>>
>>
>> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
>> /home/danielhb/work/qemu/build/../hw/riscv/virt.c:1466: undefined reference to `kvm_riscv_aia_create'
>> collect2: error: ld returned 1 exit status
>>
>>
>> I'm no compiler expert by any means but it seems that the --enable-debug build does not strip things
>> out like the usual build does, e.g. it won't elide a 'if kvm_enabled()' block out by checking that
>> kvm_enabled() is always false.
> 
> The compiler certainly does eliminate 0 && foo(), even at -O0.
> 
> There must be something else going on.
> Pointer to your tree?

It's this tree:

https://github.com/alistair23/qemu/tree/riscv-to-apply.next


Building using --enable-debug fails:


[danielhb@grind build]$ ../configure --target-list=riscv64-softmmu --enable-debug && make -j
(...)
0.so /usr/lib64/libcairo-gobject.so /usr/lib64/libcairo.so /usr/lib64/libgdk_pixbuf-2.0.so /usr/lib64/libX11.so /usr/lib64/libvirglrenderer.so /usr/lib64/libcacard.so /usr/lib64/libusbredirparser.so /usr/lib64/libusb-1.0.so -lbrlapi @block.syms -lnuma /usr/lib64/liburing.so -lm /usr/lib64/libfuse3.so -lpthread /usr/lib64/iscsi/libiscsi.so -laio /usr/lib64/libcurl.so /usr/lib64/libnfs.so /usr/lib64/libssh.so -lrbd -lrados -lbz2 -lutil -Wl,--end-group
/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
/home/danielhb/work/qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'
/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
/home/danielhb/work/qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
collect2: error: ld returned 1 exit status

Building without --enable-debug works. gitlab CI doesn't seem to care with it because it's all
green with this tree.


The commits that introduced these errors are listed in the 'Fixes' tag of patches 1 and 2.


Thanks,

Daniel








> 
> r~

