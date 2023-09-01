Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E99CA0FEC
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 20:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcBDI-0006ID-Cv; Fri, 01 Sep 2023 16:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcBDH-0006Hr-A3
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 16:57:55 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcBDE-0000gP-PD
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 16:57:55 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1c4c7a83bcdso1598299fac.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693601871; x=1694206671; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JcO06MSV40AT66hNiGv2NgetfOXhBLNl6o6saP+naio=;
 b=J6mv4YQMUkOUsC38VybTrP9EeppzRxD3NVow6H45tKu1jYdJTM6pYfprMQfsNSB3c7
 1KyObWqVpHHP+zod31m+ZJMVcGDb9wXFZHNlJuKaGRWMLzoJRVdigVDOgRB8kQQc53L4
 EdO2c+xIL8F+e48LNKdwBdO/sbNrP0d4HwVPYxbDB7brL83UwhPoJymbnSKmxxtEu57c
 o5lpKWuro+gv9ATCFcNGkaSVfwODkZlOILFG/oIOfw3YHaAUReEOe+TCBKg9CU9YJ5Tv
 gWRLeX8EeuiAdMnDYlZaCYyRENGU/dLCQfmaw/Etb0p+G64EqdCzUjE+fXvQHog2VTdY
 tPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693601871; x=1694206671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JcO06MSV40AT66hNiGv2NgetfOXhBLNl6o6saP+naio=;
 b=jTzQtp2L6sB9n6Dw7o6HiWwDkAeqf9516HDSbt+9Ae3ADhXizEqcw9uZhAyES1lUXJ
 dZ/5Vb06cOWI7EuFIci0yIRDhAj6H8YSncna5S0IssxeE2u14LOf6Fdm+q3W0N9pnhNu
 Oi2l75qRywxUSTsGK8lrtm7kMx0+AURIcApgxqDQieWbO6C7/ISE9NnX2+wBcBWha005
 CDucLVfgTbcy6IW5n2ZbKE5WFBSgWWe7GFf4ppjavRfIWv9KmSFxIcJLx9i5yjb+5+cE
 IbPUDNWVHO5zA5uLBzWxZ8rIn13oz+iO1n29602vfKlWFwds4Vt6pvp5Sgh9wMoYzKlh
 j6sA==
X-Gm-Message-State: AOJu0YxdsIERZM0NA5nqLrrvrZxj9YyuXxvpV3qE3qCPsvvteJTubR0Z
 rWIYRxNJNAvQ5tnR/ZNLmyHnwQ==
X-Google-Smtp-Source: AGHT+IGzlcOXrv296i3HZkYL96ks2x4H8xNfMonb4fQqf2c1D7BgF7czWUM8VWJEiIzxg9d9/cyjQQ==
X-Received: by 2002:a05:6870:569e:b0:1bb:c50d:7437 with SMTP id
 p30-20020a056870569e00b001bbc50d7437mr4101689oao.53.1693601871402; 
 Fri, 01 Sep 2023 13:57:51 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a056870435400b001cc95dfce7csm2579147oah.21.2023.09.01.13.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 13:57:51 -0700 (PDT)
Message-ID: <7b4c103a-facd-6965-5bb3-8354ab03feb0@ventanamicro.com>
Date: Fri, 1 Sep 2023 17:57:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 20/20] target/riscv: add 'kvm_supported' class property
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-21-dbarboza@ventanamicro.com>
 <20230831-786fd32dfa7014f439b69775@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-786fd32dfa7014f439b69775@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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



On 8/31/23 09:47, Andrew Jones wrote:
> On Fri, Aug 25, 2023 at 10:08:53AM -0300, Daniel Henrique Barboza wrote:
>> This follows the same idea of 'tcg_support' property added in the
>> previous patch. Note that we're now implementing the 'cpu_realizefn' for
>> the KVMAccel class since this verification is done in realize() time.
>>
>> Supporting vendor CPUs with KVM is not possible. We rely on the
>> extension support of the KVM module running in the host, making it
>> impossible to guarantee that a vendor CPU will have all the required
>> extensions available. The only way to guarantee that a vendor CPU is KVM
>> compatible is running KVM in a host that has the same vendor CPU, and
> 
> Or to attempt to enable each extension which the vendor CPU expects and
> to attempt to disable everything else. If all those actions succeed, then
> we can override the ID registers with those of the CPU we want to model
> and go for it. There's still risk, though, that the guest kernel will see
> the ID registers of the model and attempt to apply some errata workaround
> which may or may not work and/or crash the guest.

This can also happen when migrating the guest from a host that happens to have
an errata to one that doesn't have, regardless of the CPU type the guest
is using (host CPU vs vendor CPU). The guest would need a power cycle to
identify the current model ID.

We don't have the tooling needed to mitigate this risk in QEMU I'm afraid. Upper
layers like libvirt are more able to deal with it.

> 
>> for this case we already have the 'host' CPU type.
>>
>> We're better of declaring that all vendors CPUs are not KVM capable.
>> After this patch, running KVM accel with a vendor CPU will produce an
>> error like the following:
>>
>> $ ./qemu-system-riscv64 -M virt,accel=kvm -cpu veyron-v1
>> qemu-system-riscv64: 'veyron-v1' CPU is not compatible with KVM acceleration
> 
> Shouldn't we at least check if the host matches the requested CPU first?
> So, if we happen to be on a veyron-v1, then the veyron-v1 model should
> be equivalent to 'host'. (They may not be 100% equivalent in practice, but
> theoretically they should be, which means trying it and debugging the bugs
> should improve the CPU models on both sides.)

If we're really going this route we would need to match host and vendor CPU
in the extension level, matching each vendor CPU extension with what the
CPU can provide, failing if the host can't provide all extensions the vendor
CPU requires. I wouldn't even bother checking for things like machine ID since
they can be easily impersonated (e.g. use a rv64 emulated host, edit mvendorid)
and can't be trusted.

TBH I am not thrilled with the idea of supporting vendor CPUs with KVM. The user
can pick the 'host' CPU to have the most capable KVM CPU available in the host,
and that is already not trivial to support in cases like live migration and so
on. Vendor CPU KVM support will promote things like:

"I tried to use a veyron-v2 KVM CPU in a veyron-v1 host, why is that not possible
it should be it's not fair"

"why can't I use a vendor X KVM CPU A into a vendor Y CPU B host it surely should
work since CPU A is older than CPU B right"

And then, even if we decide to support vendor CPUs with KVM in a feasible way, with
a lot of conditions and training wheels, we'll be so restrictive that the user will
be better of using the 'host' CPU anyway.


All this said, there's a lot going on in this series already and this vendor CPU + KVM
discussion might deserve its own RFC/thread. I'll drop this patch from the series to
give us time to discuss this properly. Let's leave it as is for now.


Thanks,

Daniel


> 
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu-qom.h     |  1 +
>>   target/riscv/cpu.c         |  1 +
>>   target/riscv/kvm/kvm-cpu.c | 24 ++++++++++++++++++++++++
>>   3 files changed, 26 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index e86b76f9fe..32d9bb07b4 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -72,5 +72,6 @@ struct RISCVCPUClass {
>>   
>>       bool user_extension_properties;
>>       bool tcg_supported;
>> +    bool kvm_supported;
>>   };
>>   #endif /* RISCV_CPU_QOM_H */
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index f749ea2a2e..73302bb72a 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1646,6 +1646,7 @@ static void riscv_dynamic_cpu_class_init(ObjectClass *c, void *data)
>>   
>>       rcc->user_extension_properties = true;
>>       rcc->tcg_supported = true;
>> +    rcc->kvm_supported = true;
>>   }
>>   
>>   static void riscv_vendor_cpu_class_init(ObjectClass *c, void *data)
>> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
>> index 501384924b..85f3b8c80e 100644
>> --- a/target/riscv/kvm/kvm-cpu.c
>> +++ b/target/riscv/kvm/kvm-cpu.c
>> @@ -1289,6 +1289,7 @@ static void riscv_kvm_cpu_class_init(ObjectClass *c, void *data)
>>       RISCVCPUClass *rcc = RISCV_CPU_CLASS(c);
>>   
>>       rcc->user_extension_properties = true;
>> +    rcc->kvm_supported = true;
>>   }
>>   
>>   static const TypeInfo riscv_kvm_cpu_type_infos[] = {
>> @@ -1302,6 +1303,28 @@ static const TypeInfo riscv_kvm_cpu_type_infos[] = {
>>   
>>   DEFINE_TYPES(riscv_kvm_cpu_type_infos)
>>   
>> +/*
>> + * We'll get here via the following path:
>> + *
>> + * riscv_cpu_realize()
>> + *   -> cpu_exec_realizefn()
>> + *      -> kvm_cpu_realizefn() (via accel_cpu_realizefn())
>> + */
>> +static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
>> +{
>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
>> +
>> +    if (!rcc->kvm_supported) {
>> +        g_autofree char *name = riscv_cpu_get_name(rcc);
>> +        error_setg(errp, "'%s' CPU is not compatible with KVM acceleration",
>> +                   name);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void kvm_cpu_instance_init(CPUState *cs)
>>   {
>>       Object *obj = OBJECT(RISCV_CPU(cs));
>> @@ -1328,6 +1351,7 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>>   
>>       acc->cpu_instance_init = kvm_cpu_instance_init;
>> +    acc->cpu_realizefn = kvm_cpu_realizefn;
>>   }
>>   
>>   static const TypeInfo kvm_cpu_accel_type_info = {
>> -- 
>> 2.41.0
>>
>>
> 
> I don't think we want kvm_supported nor tcg_supported as they necessarily
> bring accelerator knowledge into target/riscv/cpu.c, where the booleans
> have to be set. It would be better if the decisions as to what is
> supported or not are made in the accelerator's respective files. So, we
> try to realize some model with some accel and let that accel do some
> checks and error out when it can't. If riscv kvm only supports 'host',
> then it's check would simply be "is the model host?" and the inverse for
> tcg.
> 
> Thanks,
> drew

