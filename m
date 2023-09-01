Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF21CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 20:09:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcAS5-0004ri-Nc; Fri, 01 Sep 2023 16:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcAS4-0004qs-Jk
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 16:09:08 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcAS0-00042Q-D7
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 16:09:08 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5733aa10291so1489326eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693598943; x=1694203743; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vAJsA08M/nhXr+3mDS1vaY4+2RkwaDlwFrDJRFNcigI=;
 b=l4Jg8vsDnHPeFVQp8bKb3eZYSZQ09a1/y/Q6Xc35YCBzfRBV1s4+GFJ+0u9zc9ta/Z
 95cCuV0/4R2oCvSpHavNN0yBSK3SlMORuEyq3LhcQoyGil91uAlrFKC8FM+b3Z+bbd+Q
 azAKsBSXpVoRfqlaq7OQdIU+0HRANsvnFS3q6gu4Jn26IkrkTF1N3o8Z2tCWmb0qbtIt
 XtmG7vGdWP4H1wJUTVW7P7AyaaCA5Fg3gwjZFjgtWbmNDpVL8HGk3l8PhNfyt2orEtnx
 TJzQdhYfJL6BAmHv4GuzljecWPn+qnChR1Vn03vHgfXrTbUG8wWKO7PRuuuFV4Rf4hgD
 8N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693598943; x=1694203743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vAJsA08M/nhXr+3mDS1vaY4+2RkwaDlwFrDJRFNcigI=;
 b=Azx8i2U5C7IvKPQp8q12DfplZvn3Bd4BrGRrlt+kXxoaNolroLCoRlLYuFJxauJH2R
 yOAbYIjkB2q5yLqTaNZ8ktRIBxCM7bVhiEx0qY2Nn5kLU6KQDAOw2WGihlUUNYvcgC0M
 +nwJBw/gQdsw4eKUhiJvsSdxBz/A/G874rzf68yPsmekqGjuC8q+haVaJPQNWocmfGro
 vVN0X3YP5kz2lkkYA8oL8GI0nyy0FBLBh1XHURPtvMr9OlUmlV5jkRjmugiEgPm4/xZi
 IuBvhEr3qo5wQQvm4yIfOLQhBaexmXfbNv25PAPDrXfDgR8aF0pEiYgEM0kqS4502M3r
 UZVQ==
X-Gm-Message-State: AOJu0YyV1KL6M0PR+dbB5jUdeLQGDMK7Itrm4CssoGhAuDK2ptLouRWX
 kym4Y+WaxLBdhaoRNjO1U0YiUA==
X-Google-Smtp-Source: AGHT+IEK3Zkvde1IfTbg43I7m1xi93ITumhkjmEwr+4Nkwp1AUd4tB/+pHd++Yx3AtmEdBMAIGz6Kg==
X-Received: by 2002:a4a:2553:0:b0:56e:5a8e:654f with SMTP id
 v19-20020a4a2553000000b0056e5a8e654fmr3911533ooe.8.1693598942902; 
 Fri, 01 Sep 2023 13:09:02 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a4aa9cd000000b0056dbeb283cesm2108297oon.43.2023.09.01.13.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 13:09:02 -0700 (PDT)
Message-ID: <7ef12393-e92e-087e-a2aa-0da25a3229fd@ventanamicro.com>
Date: Fri, 1 Sep 2023 17:08:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/20] target/riscv/cpu.c: add .instance_post_init()
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-8-dbarboza@ventanamicro.com>
 <20230831-863a8334e34c5248fa71d7bf@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-863a8334e34c5248fa71d7bf@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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



On 8/31/23 08:00, Andrew Jones wrote:
> On Fri, Aug 25, 2023 at 10:08:40AM -0300, Daniel Henrique Barboza wrote:
>> All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
>> calls riscv_init_max_cpu_extensions(). Both can be moved to a common
>> instance_post_init() callback, implemented in riscv_cpu_post_init(),
>> called by all CPUs. The call order then becomes:
>>
>> riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()
>>
>> A CPU class that wants to add user flags will let us know via the
>> 'user_extension_properties' property. Likewise, 'cfg.max_features' will
>> determine if any given CPU, regardless of being the 'max' CPU or not,
>> wants to enable the maximum amount of extensions.
>>
>> In the near future riscv_cpu_post_init() will call the init() function
>> of the current accelerator, providing a hook for KVM and TCG accel
>> classes to change the init() process of the CPU.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 20 +++++++++++++++-----
>>   1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index c35d58c64b..f67b782675 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -430,8 +430,6 @@ static void riscv_max_cpu_init(Object *obj)
>>       mlx = MXL_RV32;
>>   #endif
>>       set_misa(env, mlx, 0);
>> -    riscv_cpu_add_user_properties(obj);
>> -    riscv_init_max_cpu_extensions(obj);
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
>> @@ -445,7 +443,6 @@ static void rv64_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV64, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>> @@ -569,7 +566,6 @@ static void rv128_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV128, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>> @@ -582,7 +578,6 @@ static void rv32_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV32, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>> @@ -1212,6 +1207,20 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>>   }
>>   #endif /* CONFIG_USER_ONLY */
>>   
>> +static void riscv_cpu_post_init(Object *obj)
>> +{
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
>> +
>> +    if (rcc->user_extension_properties) {
> 
> It's not yet clear to me why we need 'user_extension_properties'. Can't we
> just do the 'object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) != NULL'
> check here?

I'll answer here but this also applies for patches 19 and 20.

The idea in my head was to create a flexible way of defining new CPU types in
the future that doesn't necessarily fits the 3 big molds we have: generic CPUs
(I'm considering 'max' CPU as a generic CPU on steroids), vendor CPUs and the
KVM only 'host' CPU. For example, it would be possible to create a vendor-style
CPU that has all extensions enabled and runs KVM.

This idea is probably better in my head than in reality, and there's a very high
chance that I'm adding extra stuff in the CPU class and we won't add any new
'funky' CPU type in the future to justify it.

I'll drop patches 5 and 6 with 'user_extension_properties' and 'max_features'
flag and do a regular CPU type check in post_init().'tcg_supported' in patch 19
is indeed a bit silly today since every CPU but 'host' will enable it, so we can
do a 'cpu is host' kind of check and live without it. We can still throw generic
errors in all these checks regardless of how we're doing the validation.

Patch 20 has another underlying discussion that I'd rather have there. Thanks,


Daniel





> 
>> +        riscv_cpu_add_user_properties(obj);
>> +    }
>> +
>> +    if (cpu->cfg.max_features) {
> 
> It's also not yet clear why we need max_features. I can't think of any
> other models that want max_features besides 'max'. Checking the cpu type
> here should be sufficient, no?
> 
>> +        riscv_init_max_cpu_extensions(obj);
>> +    }
>> +}
>> +
>>   static void riscv_cpu_init(Object *obj)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>> @@ -2019,6 +2028,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>           .instance_size = sizeof(RISCVCPU),
>>           .instance_align = __alignof__(RISCVCPU),
>>           .instance_init = riscv_cpu_init,
>> +        .instance_post_init = riscv_cpu_post_init,
>>           .abstract = true,
>>           .class_size = sizeof(RISCVCPUClass),
>>           .class_init = riscv_cpu_class_init,
>> -- 
>> 2.41.0
>>
>>
> 
> Thanks,
> drew

