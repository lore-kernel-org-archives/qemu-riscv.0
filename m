Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82821C7EE37
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 20:07:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6cx3-0000CP-9P; Tue, 06 Jun 2023 16:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6cx1-0000C5-V1
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 16:06:43 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6cwx-0006Ag-8W
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 16:06:43 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso5853901fac.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686081997; x=1688673997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQc9I3jtWoHWpi8EP93ZodPhGWthtBVaxnpKyY3MK+8=;
 b=ddIq2oa6j5nvvA6JMlBRDzBtiE3QoWoeE0ZUFROOCNnKNC02mAUhb+rg+EU5ynYXIc
 iCX6TKLERXYfsqWLKc9ifDT/sMZW0zim0HGyNnAcXhgKyNgRfU7IiNeONPylXvxIatQZ
 NzmFw51B+FYlN4O0ZZKN5op+/Gm3emMPAKgDiYogXDqK5CqSXFnRiPTfizcdEhnUL+lg
 MCWiarcYUngR4Q6eh+Pglr9OBZgRwxPuWu6b+ALQs07Y8e5zbPcCWV03vB7Cgv3nk0KB
 s1AfAn45iQJYkdMopamFi1rZhww1NSY4Ahg3GsoHTbhwK3P1H//GFIY/Q1T04wZg0ONe
 djtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686081997; x=1688673997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQc9I3jtWoHWpi8EP93ZodPhGWthtBVaxnpKyY3MK+8=;
 b=GOIiOukzK4wdkl2iDQO/3MQ1zSiyKo9wjdqQEEUOitGWxwEi4McAm/WBBM1EEykpA2
 CtpnlJUHqhySF3LcaVUo78ya0CYbyNYaUA6hkU5UgQ38rLfYUWdq/u8IL6Zc35nEMvaj
 4Z3lHcYiiBeVdbUynbBTkNCIAb90B4q9LxkETtH0YRCj70OTX/1ARY1bM3dbWtK+gDBj
 /gd0n6G1PtI5JIpewIkdOXlm02Oxe5mjAXPqXbVytat6+KVR8FUchjNWTkr4V/IwIggt
 PHZGwEAJLUFSIdd/Nhd07zMAcsR5yi1x9Sz7iBBR4iecB3w1pzXVXJdaJgSdPMdKmwr3
 LBzQ==
X-Gm-Message-State: AC+VfDxaefl/ODXJK4t8xJHeNRi8WafB6/gDFdOphWB6cAgPXHm8vTe8
 TnG23xMeTe0qTIRwyplu/VAcSA==
X-Google-Smtp-Source: ACHHUZ4iEsRZmliTMT/fnq3MLM9kqeFhtQrqm+8QlNHUuGYeZMNiG/BIAJTIgR7OVRIeN9MJQpJdJA==
X-Received: by 2002:a05:6870:988b:b0:196:46f6:4f00 with SMTP id
 eg11-20020a056870988b00b0019646f64f00mr2862029oab.52.1686081997590; 
 Tue, 06 Jun 2023 13:06:37 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a056870e60100b0019f7184d7e0sm5188813oag.21.2023.06.06.13.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 13:06:37 -0700 (PDT)
Message-ID: <51387715-7294-dc89-41db-db6b72d643af@ventanamicro.com>
Date: Tue, 6 Jun 2023 17:06:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/16] target/riscv/cpu.c: restrict 'mvendorid' value
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-4-dbarboza@ventanamicro.com>
 <20230606-aadc97a378f5d52fd233dcaa@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230606-aadc97a378f5d52fd233dcaa@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 6/6/23 10:19, Andrew Jones wrote:
> On Tue, May 30, 2023 at 04:46:10PM -0300, Daniel Henrique Barboza wrote:
>> We're going to change the handling of mvendorid/marchid/mimpid by the
>> KVM driver. Since these are always present in all CPUs let's put the
>> same validation for everyone.
>>
>> It doesn't make sense to allow 'mvendorid' to be different than it
>> is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
>> any 'mvendorid' they want.
>>
>> Change 'mvendorid' to be a class property created via
>> 'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
>> macro. This allow us to define a custom setter for it that will verify,
>> for named CPUs, if mvendorid is different than it is already set by the
>> CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' is
>> set to an invalid value:
>>
>> $ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=2
>> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=2:
>>      Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 31 ++++++++++++++++++++++++++++++-
>>   1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 72f5433776..bcd69bb032 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1723,7 +1723,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>   static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>>   
>> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
>>       DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
>>   
>> @@ -1810,6 +1809,32 @@ static const struct TCGCPUOps riscv_tcg_ops = {
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
>>   
>> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>> +{
>> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
>> +}
>> +
>> +static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
>> +                              void *opaque, Error **errp)
>> +{
>> +    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    uint32_t prev_val = cpu->cfg.mvendorid;
>> +    uint32_t value;
>> +
>> +    if (!visit_type_uint32(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (!dynamic_cpu && prev_val != value) {
>> +        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
>> +                   object_get_typename(obj), prev_val);
>> +        return;
>> +    }
>> +
>> +    cpu->cfg.mvendorid = value;
>> +}
>> +
>>   static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>   {
>>       RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
>> @@ -1841,6 +1866,10 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>       cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
>>       cc->tcg_ops = &riscv_tcg_ops;
>>   
>> +    object_class_property_add(c, "mvendorid", "uint32", NULL,
>> +                              cpu_set_mvendorid,
>> +                              NULL, NULL);
>> +
> 
> Shouldn't we provide a get function as well?

We can. I refrain from adding a get() interface because I didn't add new code that
access mvendorid via object_property_get_uint(OBJECT(cpu), "mvendorid", errp). The
code that access this value uses cpu->cfg.mvendorid directly.

It would be interesting to add a get() interface if cpu->cfg.mvendorid was a value
that was read in a different manner that it's stored. It's not the case ATM, so
I only added the set() interface.


Thanks,


Daniel



> 
>>       device_class_set_props(dc, riscv_cpu_properties);
>>   }
>>   
>> -- 
>> 2.40.1
>>
>>
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

