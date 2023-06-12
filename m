Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD037C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:53:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8mev-00005O-RE; Mon, 12 Jun 2023 14:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q8meu-0008Uf-0s
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 14:52:56 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q8mes-0005Fw-64
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 14:52:55 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1a68c02553aso1368204fac.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686595972; x=1689187972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aD8qe9csH0sOC8p8kSAWXpM8VCNQTyu5/Z78QX/GAEc=;
 b=cvKo0C2PGqn5BIw93+Gp/u9ayiwdlWxeY1M6TJ02v/C5a8/1jvK9qbvXg7cIxYlH7a
 fC8gccKcVLbxVP928zMDyiKeIKGDomMz8AU1H48BAWuIt6htQvh9u3eG4WTcwIBGxOIk
 geBxmMHwnfvhDQ8pmwykj5urgguM2Kk7qbu5m5uTNaxyzOm3J+I0jW4A1ZgMfxzOwghg
 nSuO4Knw9LcDbAuRFUiT2QAAVyMl4N67iipnWo8r/ZMMTQgZ43Xj/bHdSjTzlhdvoI8S
 NUOHSCt+JuLps0Z6g6YXsZ7UYUpdXMMD2bQdtrFairBjlWl4P8fZLWmIZbIfMnVchVHv
 DEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686595972; x=1689187972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aD8qe9csH0sOC8p8kSAWXpM8VCNQTyu5/Z78QX/GAEc=;
 b=ETuqD9eOHphzA/uWdb5HMXhxkC8C/7NKD6fBFo1JtL1LdEZ4HtPh+PPufyY7QTYvGD
 NRnEodmr9kaLXkMJGmjYit3D8nJZkFfEHD+eolCx6jGXRaLRqkVqvRL0TIwo8JTIjPuh
 md/MEPl/qmrsbN/DtqFbV7ABaMVY0KX4qVaq+muWA3/zUqF4BpzLB4/rUoKIwTnZVhKo
 FYjviI7n9C4JzCUbJXlULefxWN7cD3F2r/OMuIq0gVYo/NFxgGUEipdaxAUIczkr1TJT
 cALTEUHgYDoznSYsGdZwMWE3rKZpEQ2f7hRsuc3F3J3cN8AaCpOZe10keK9y3PzHEE26
 O9Lg==
X-Gm-Message-State: AC+VfDyBb+mcpi4VIvXScMTwB1QyfHFs4BoaUvgUxejudAvqYAzqNqWw
 fF+MGBLf/8tlUFR8BgXjh7oA8A==
X-Google-Smtp-Source: ACHHUZ7AdBkpfeSspDu8brOXhRQQ6LPLPkKu7QL7WJBrDKOsc2oMTbThMttdWjf+L4ja3FxFnF7N6Q==
X-Received: by 2002:a05:6870:d2a5:b0:191:f657:13ee with SMTP id
 d37-20020a056870d2a500b00191f65713eemr6730583oae.11.1686595972605; 
 Mon, 12 Jun 2023 11:52:52 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a0568301bf100b006a62aac5736sm4192109otb.28.2023.06.12.11.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 11:52:52 -0700 (PDT)
Message-ID: <11aee932-be06-ed42-bf7e-09c8e3ed1045@ventanamicro.com>
Date: Mon, 12 Jun 2023 15:52:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/16] target/riscv/cpu.c: restrict 'mvendorid' value
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, Andrew Jones <ajones@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-4-dbarboza@ventanamicro.com>
 <CAKmqyKNm1cH+fqqNKtm6+bKovdCqajoAcbTpWtA7BH=wLK5j+Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKNm1cH+fqqNKtm6+bKovdCqajoAcbTpWtA7BH=wLK5j+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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



On 6/12/23 00:56, Alistair Francis wrote:
> On Wed, May 31, 2023 at 5:49 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
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
> 
> Is this something we want to enforce? What if someone wanted to test
> using the veyron-v1 CPU but they wanted to change some properties. I
> don't see an advantage in not letting them do that

The idea is to keep things simpler for us. As it is today we forbid users to
enable/disable extensions for vendor CPUs. Doing the same thing for
mvendorid/marchid/mimpid seems consistent with what we're already doing.

Also, guest software might rely on vendor IDs from the CPU to take certain
actions, and if the user is free to change the CPU ID from vendor CPUs the
software will misbehave and the user can claim "I created a veyron-v1 CPU and
the guest it's like like it's not". Allowing mvendorid and friends to be changed
doesn't do much for users (we forbid enabling/disabling extensions, so what's
to gain from changing machine IDs?) and it can be a potential source of bugs.



Thanks,


Daniel


> 
> Alistair
> 
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
>>       device_class_set_props(dc, riscv_cpu_properties);
>>   }
>>
>> --
>> 2.40.1
>>
>>

