Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB538C71153
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 23:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb8Av-00020O-6j; Tue, 29 Aug 2023 19:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb8AI-0001Zj-9W
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 19:30:30 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb8AF-00037B-3W
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 19:30:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1cca0a1b3c7so3359656fac.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 16:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351825; x=1693956625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+uNm2NVC+dP0o4Z1JWb7tcu0Jj/AtelVBBVvlXtoAA=;
 b=x9JOEoGcZk7YpkTn5p6GzmzwlcKRc5WvJ/kMZ2TJ8L3+3x/6ubj0TjvxcNfOB7xbar
 4zE78w+YAQMHobna6zjRsGkLVX3eOxnArM5jPgl10GDQzZnRMxcPw4wIkiJxdcf3QAET
 cEbGSu8hiLTplGBPCgxtYWnFpE2uXebIY4lQ/3op7YEG8lVd9o1kq/7BLBxz+TenbRYI
 g/vubRy6tMRQFXGGL+UNaM9dqv1IF8XflcYK94taA4AdMuB5PyivIOSqwCz0Va30e8jm
 Nd+8TOOn3p4VW/WX+NkgD9yylZovPIP9VVh7uErRSUuAJTAP0fSr9ojyd5t8w3tzAIuA
 KYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351825; x=1693956625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+uNm2NVC+dP0o4Z1JWb7tcu0Jj/AtelVBBVvlXtoAA=;
 b=RZlP3gQUa8PVPsyowLEF/g3ww7RqEWq1gg0t60y3KiVs3d1hnDSasBFMwYgqiY4Hjq
 ZespRChxXmG2mc31/dAhpA1udU9+XKGHD8NueGUBiZlwkJ0m4By02nTk8ZBgGCwTou56
 OMplgTGnsr9FZR9u37Ppwxb4RrDWFf99LWSmWBQweBue/OIYbebeAOzNbSEgubwNlNQ+
 Cmq19wNljPHRaIh2gQWYta83G88ndnjyjhctZcp32NhoVaJJkdcjEJtNxdXGMm0V7Rd2
 V8MOC6C2uM4jvoubtEIkssVkAuTQSiQ8K8HO5k08TKcjxJUZvG5nxD6IYjvPg5kDLRFF
 mMFg==
X-Gm-Message-State: AOJu0YyXlC5huNtthnfeAs7uCmyMfIq8JoA43WRkhSlBmcF+6yZCYJTi
 u2YL1bJqHF8jy2r6frREEuDhUg==
X-Google-Smtp-Source: AGHT+IF4O9PMtVn94yqYe8h5pfNhy+PdIkdQ6la9y21UESTETnUj82ewlm++zcC6/CP+KgOvglHqqg==
X-Received: by 2002:a05:6870:a548:b0:1c8:cf1b:feee with SMTP id
 p8-20020a056870a54800b001c8cf1bfeeemr793354oal.13.1693351825172; 
 Tue, 29 Aug 2023 16:30:25 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 25-20020a17090a199900b002693505391csm125537pji.37.2023.08.29.16.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 16:30:24 -0700 (PDT)
Message-ID: <63d099a2-ac5e-1ce9-3663-10e317d7dc5a@linaro.org>
Date: Tue, 29 Aug 2023 16:30:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
 <20230829122144.464489-3-dbarboza@ventanamicro.com>
 <c0089044-54d2-43ab-6b30-854a4fa3aa4f@linaro.org>
 <72de2f6a-5ede-40f4-5edc-a22d89587e4e@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <72de2f6a-5ede-40f4-5edc-a22d89587e4e@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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

On 8/29/23 16:09, Daniel Henrique Barboza wrote:
>> -- >8 --
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> @@ -79,7 +79,9 @@
>>   /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
>>   static bool virt_use_kvm_aia(RISCVVirtState *s)
>>   {
>> -    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>> +    return kvm_enabled()
>> +        && kvm_irqchip_in_kernel()
>> +        && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>>   }
>> ---
> 
> It doesn't work. Same error:
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 388e52a294..ac710006e7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -79,7 +79,8 @@
>   /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
>   static bool virt_use_kvm_aia(RISCVVirtState *s)
>   {
> -    return kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
> +    return kvm_enabled() &&
> +           kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>   }
> 
>   static const MemMapEntry virt_memmap[] = {
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index 01be45cc69..7d4b7c60e2 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -22,19 +22,9 @@
>   void kvm_riscv_init_user_properties(Object *cpu_obj);
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> -
> -#ifdef CONFIG_KVM
>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t aia_irq_num, uint64_t aia_msi_num,
>                             uint64_t aplic_base, uint64_t imsic_base,
>                             uint64_t guest_num);
> -#else
> -static inline void kvm_riscv_aia_create(MachineState *machine,
> -                                uint64_t group_shift, uint64_t aia_irq_num,
> -                                uint64_t aia_msi_num, uint64_t aplic_base,
> -                                uint64_t imsic_base, uint64_t guest_num) {
> -    g_assert_not_reached();
> -}
> -#endif
> 
> 
> 
> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
> /home/danielhb/work/qemu/build/../hw/riscv/virt.c:1466: undefined reference to 
> `kvm_riscv_aia_create'
> collect2: error: ld returned 1 exit status
> 
> 
> I'm no compiler expert by any means but it seems that the --enable-debug build does not 
> strip things
> out like the usual build does, e.g. it won't elide a 'if kvm_enabled()' block out by 
> checking that
> kvm_enabled() is always false.

The compiler certainly does eliminate 0 && foo(), even at -O0.

There must be something else going on.
Pointer to your tree?

r~

