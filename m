Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F90FCE79A8
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 16:08:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qidGN-0000rl-BC; Tue, 19 Sep 2023 12:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qidGL-0000p5-I7
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 12:07:45 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qidGJ-0004TJ-6c
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 12:07:44 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3751380fac.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Sep 2023 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695139661; x=1695744461; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HXnQ6/p/nxNTua78VvOJyRiQR6VP+aEWL2S1FI6hmF0=;
 b=JkP1oSE1sv8woR4ENKnnVonzkl4bUT6GiLq1jz+aWRXnxRpUW4tUKkpQZ9khrK0YLt
 CrLiilYLxQ2WelpIr7wuo7bpIcSmOLc1y3dkAHty2eGgg/88WMAORFp28QHuhr6zsCQS
 CBJCWuIONTBX1vVUCLr/VRMVAimW524tlqMjz2oEEQrOBthWqVG0iebYa67LNksUrIxR
 gVPc5GjGKdat01QCRpj5sGYLEgoU2siSSdQOFKDzBvS/ChyTtCbjqJ/lFSgWfEHgUBjD
 BnHtbhTAs3sphl64f5RpC3ND86E9j2V5/FGw/beN8v+LRZkbR1OuV12iXoQgrD7aVBUr
 cyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695139661; x=1695744461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HXnQ6/p/nxNTua78VvOJyRiQR6VP+aEWL2S1FI6hmF0=;
 b=DFCr8SSRf7oq43EsWwl8WWaWnnwuzrhp2buluxVMR/ouQS/JeQ4VWfa7PLuOVBY7q6
 BKHmGymg957kvB78KJHODdZP7MJA8X8OHoV+hi40bgslbsjUAjk7WE67KLN49r4W9z1Q
 YUTWzgCzmIu7meaPBHyGfWM255ythgamuLesbdOO01PR2hksHeByI0Z0VXE16IraWFMA
 KHq+9sMl1D3VI6Ea40lt6ZXb6wpmaGqZunrnMId9PGRRcboKZ4xskhK/VLRtlAkzGlY3
 PS1rfyT5/d5/hxOggrxpPLv3GfUjrOMVaSg33NaIFULWcNFY+AYh881UV61DEyrBWMJL
 ozlg==
X-Gm-Message-State: AOJu0YwRqQDPgK/cxulqnjD/+GntoVjKLjP6SUP5yqxbru1cqydVnQeM
 HWyMjnCeGN5U56mYSMIlVjBSpw==
X-Google-Smtp-Source: AGHT+IExCDgBOzYAioAtrJ3K4WXLhMtCinFg1Re8uCKt2nGv8i9uKcvTBzNDbEwLbtOV/Z4b86lmUw==
X-Received: by 2002:a05:6870:c683:b0:1bf:16f7:c901 with SMTP id
 cv3-20020a056870c68300b001bf16f7c901mr15069016oab.49.1695139661231; 
 Tue, 19 Sep 2023 09:07:41 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.127.211])
 by smtp.gmail.com with ESMTPSA id
 ec1-20020a0568708c0100b001d4d8efa7f9sm6224946oab.4.2023.09.19.09.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 09:07:40 -0700 (PDT)
Message-ID: <d19ae0d4-c2eb-aba4-0287-b0e5d943b7d3@ventanamicro.com>
Date: Tue, 19 Sep 2023 13:07:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/19] target/riscv/cpu.c: add .instance_post_init()
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-6-dbarboza@ventanamicro.com>
 <65e9cd16-da47-05b4-d056-f8f17f109e6f@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <65e9cd16-da47-05b4-d056-f8f17f109e6f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/19/23 06:16, LIU Zhiwei wrote:
> 
> On 2023/9/6 17:16, Daniel Henrique Barboza wrote:
>> All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
>> calls riscv_init_max_cpu_extensions(). Both can be moved to a common
>> instance_post_init() callback, implemented in riscv_cpu_post_init(),
>> called by all CPUs. The call order then becomes:
>>
>> riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()
>>
>> In the near future riscv_cpu_post_init() will call the init() function
>> of the current accelerator, providing a hook for KVM and TCG accel
>> classes to change the init() process of the CPU.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 42 ++++++++++++++++++++++++++++++++----------
>>   1 file changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 7569955c7e..4c6d595067 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -427,8 +427,6 @@ static void riscv_max_cpu_init(Object *obj)
>>       mlx = MXL_RV32;
>>   #endif
>>       set_misa(env, mlx, 0);
>> -    riscv_cpu_add_user_properties(obj);
>> -    riscv_init_max_cpu_extensions(obj);
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
>> @@ -442,7 +440,6 @@ static void rv64_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV64, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>> @@ -566,7 +563,6 @@ static void rv128_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV128, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
>> @@ -579,7 +575,6 @@ static void rv32_base_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       /* We set this in the realise function */
>>       set_misa(env, MXL_RV32, 0);
>> -    riscv_cpu_add_user_properties(obj);
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>>   #ifndef CONFIG_USER_ONLY
> I think we should also remove riscv_cpu_add_user_properties from host cpu init.

Line removed in v3. Thanks,

Daniel

>> @@ -1215,6 +1210,37 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>>   }
>>   #endif /* CONFIG_USER_ONLY */
>> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>> +{
>> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
>> +}
>> +
>> +static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
>> +{
>> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
>> +}
>> +
>> +static bool riscv_cpu_has_user_properties(Object *cpu_obj)
>> +{
>> +    if (kvm_enabled() &&
>> +        object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_HOST) != NULL) {
>> +        return true;
>> +    }
>> +
>> +    return riscv_cpu_is_dynamic(cpu_obj);
>> +}
>> +
>> +static void riscv_cpu_post_init(Object *obj)
>> +{
>> +    if (riscv_cpu_has_user_properties(obj)) {
>> +        riscv_cpu_add_user_properties(obj);
> 
> Otherwise, we will enter here for host cpu.
> 
> Thanks,
> Zhiwei
> 
>> +    }
>> +
>> +    if (riscv_cpu_has_max_extensions(obj)) {
>> +        riscv_init_max_cpu_extensions(obj);
>> +    }
>> +}
>> +
>>   static void riscv_cpu_init(Object *obj)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>> @@ -1770,11 +1796,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
>>   };
>>   #endif
>> -static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>> -{
>> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
>> -}
>> -
>>   static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
>>                                 void *opaque, Error **errp)
>>   {
>> @@ -2011,6 +2032,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>           .instance_size = sizeof(RISCVCPU),
>>           .instance_align = __alignof__(RISCVCPU),
>>           .instance_init = riscv_cpu_init,
>> +        .instance_post_init = riscv_cpu_post_init,
>>           .abstract = true,
>>           .class_size = sizeof(RISCVCPUClass),
>>           .class_init = riscv_cpu_class_init,

