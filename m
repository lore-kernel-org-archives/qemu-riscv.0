Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EE4C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qy7VH-0003ZH-E2; Wed, 01 Nov 2023 05:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qy7VG-0003Z0-O6
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:27:10 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qy7VE-0003NP-Lr
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:27:10 -0400
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-77774120c6eso435573485a.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698830827; x=1699435627; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6R5gptA+V8JSiL/p2T1hP6oYX9nGiN/ihBTHJ21xGcw=;
 b=ONut/ePZXiWLzgJAiZiSYUmmvx69VR1KVgGvaafQTt5nhZasiVz2l43KVaqGhuayjW
 FjXfZSU+JHeZCcXuFLBu9TDd67dDraXzAN8zI21RmEHjipJD2/EH+H1aidqfidWh62wb
 IAoNAEbtKiWT59oSKfViwXHVBr3sL6/Re2vENE4u2vdAKyPoTcaLaqu1mdDPuzgW74LV
 /hd1bvlxdrQ5QtgjK5+WISdGFXPMHbbmPGkK69kqwW1AYbZpAR0JZGPPSu135g7A43W+
 dWpTPwYXKMY9glkQF19Ex3vWgjFs/sCSJc9o10coVPLuDK0EFhWPcuVfW3IrbkZ0trBU
 1U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698830827; x=1699435627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6R5gptA+V8JSiL/p2T1hP6oYX9nGiN/ihBTHJ21xGcw=;
 b=KhKFcpsJ2Z3/raIfwitCh96DwpoTC2IZj8rT4wPg1oqrIbO1s25munsZBcDRyeZBHO
 Jr6Hl1sSQgs8HeOqdDFLoa1UFtJ3SKkFKX4c6gFs9IrrNfMGOvraivb8agNm0yOtp8Ki
 1HSL/hoXl2nn2u4Rd+rH2G1qM4+lBYu+ZbGEqdUojkEtSReqfq61ivMGLju465BE0mjd
 jhFOY/otI8NJLPQLwKdo6PpKcONWfC2lRP23H0Pm7Oe26iVEuo5u38GPRRyJrDr53dui
 R6oQ1oDi1ZjUOGSZF4355EXf1n0IZpN7m8X92gXD1Nk5kGteuOQEBftOxG3Fj6avhjd4
 BQLw==
X-Gm-Message-State: AOJu0YwNGNtLcQ1eAvmi0cQ8iwJjbzlHdnO66oPqGdzfZOyOr10JjqWH
 nIKEWmCqOE+UIE0sVfASU0cTCg==
X-Google-Smtp-Source: AGHT+IEeIxJXPrAoYfpG6Gqlyc6hXD40oeO+PJY3BQMbx27fw4/J4Sb+TuhH4HvgJ3iQrILD0iZE0g==
X-Received: by 2002:a05:620a:4395:b0:778:909b:58c8 with SMTP id
 a21-20020a05620a439500b00778909b58c8mr14274151qkp.78.1698830827332; 
 Wed, 01 Nov 2023 02:27:07 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05620a005100b007742c2ad7dfsm1253806qkt.73.2023.11.01.02.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 02:27:06 -0700 (PDT)
Message-ID: <5162c752-7907-458f-a976-b89f6623f9e7@ventanamicro.com>
Date: Wed, 1 Nov 2023 06:27:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/16] target/riscv: add rv64i CPU
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
 <20231031203916.197332-4-dbarboza@ventanamicro.com>
 <20231101-f72b888f87063028f40c6e7a@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231101-f72b888f87063028f40c6e7a@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 11/1/23 06:02, Andrew Jones wrote:
> On Tue, Oct 31, 2023 at 05:39:03PM -0300, Daniel Henrique Barboza wrote:
>> We don't have any form of a 'bare bones' CPU. rv64, our default CPUs,
>> comes with a lot of defaults. This is fine for most regular uses but
>> it's not suitable when more control of what is actually loaded in the
>> CPU is required.
>>
>> A bare-bones CPU would be annoying to deal with if not by profile
>> support, a way to load a multitude of extensions with a single flag. Profile
>> support is going to be implemented shortly, so let's add a CPU for it.
>>
>> The new 'rv64i' CPU will have only RVI loaded. It is inspired in the
>> profile specification that dictates, for RVA22U64 [1]:
>>
>> "RVA22U64 Mandatory Base
>>   RV64I is the mandatory base ISA for RVA22U64"
>>
>> And so it seems that RV64I is the mandatory base ISA for all profiles
>> listed in [1], making it an ideal CPU to use with profile support.
>>
>> rv64i is a CPU of type TYPE_RISCV_BARE_CPU. It has a mix of features
>> from pre-existent CPUs:
>>
>> - it allows extensions to be enabled, like generic CPUs;
>> - it will not inherit extension defaults, like vendor CPUs.
>>
>> This is the minimum extension set to boot OpenSBI and buildroot using
>> rv64i:
>>
>> ./build/qemu-system-riscv64 -nographic -M virt \
>>      -cpu rv64i,g=true,c=true,s=true,u=true
>>
>> Our minimal riscv,isa in this case will be:
>>
>>   # cat /proc/device-tree/cpus/cpu@0/riscv,isa
>> rv64imafdc_zicntr_zicsr_zifencei_zihpm_zca_zcd#
>>
>> [1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu-qom.h |  2 ++
>>   target/riscv/cpu.c     | 25 +++++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index 7831e86d37..ea9a752280 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -25,6 +25,7 @@
>>   #define TYPE_RISCV_CPU "riscv-cpu"
>>   #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
>>   #define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
>> +#define TYPE_RISCV_BARE_CPU "riscv-bare-cpu"
>>   
>>   #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>>   #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
>> @@ -35,6 +36,7 @@
>>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>>   #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>>   #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
>> +#define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
>>   #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>>   #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 822970345c..98b2a4061a 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -544,6 +544,18 @@ static void rv128_base_cpu_init(Object *obj)
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>>   #endif
>>   }
>> +
>> +static void rv64i_bare_cpu_init(Object *obj)
>> +{
>> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
>> +    riscv_cpu_set_misa(env, MXL_RV64, RVI);
>> +
>> +    /* Set latest version of privileged specification */
>> +    env->priv_ver = PRIV_VERSION_LATEST;
> 
> The beauty of rv64i is we'll finally know exactly what we're configuring
> when we select it and some set of extensions. With that in mind I think
> we should also be explicit about which version of the priv spec is
> implemented, but we can't just pick a version now, since we may need to
> update it later. I think we have the following options:
> 
>   1. Expose priv version properties (v1_10_0, ...) and either require the
>      user to select one or default to the latest. (Any versions we don't
>      want to support for rv64i would error out if selected.)

This is already the case but it's a string property instead of booleans:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64i,priv_spec="v1.11.0"
$ ./build/qemu-system-riscv64 -M virt -cpu rv64i,priv_spec="v1.10.0"
$ ./build/qemu-system-riscv64 -M virt -cpu rv64i,priv_spec="not_valid"
qemu-system-riscv64: Unsupported privilege spec version 'not_valid'

If users set 'priv_spec' we'll use it, otherwise rv64i will default to 'latest'.

In case we do not want string values (and yeah, it's extra work to parse it, check
if it's the right val and so on) then we can add priv spec bools that users would
set on or off. We would need to deprecate "priv_spec" as it is.

This can be done outside of this work (we would need a RFC first probably).

> 
>   2. Add multiple rv64i base cpu types where the version is also specified
>      in the name, e.g. rv64i_1_12_0, and then maybe have an rv64i alias
>      which always points at the latest.
> 
> A nice thing about (1) is that we can expose the boolean version
> properties in cpu model expansion. A nice thing about (2) is that the user
> will either be forced to select an explicit version or, if we have the
> alias, libvirt will convert 'rv64i' into its full name when storing it
> in the XML. But, we can force the user to select a version with (1) too by
> not providing a default. While that adds a burden of always having to
> provide a version, it's not a big deal for a barebones cpu, since all
> extensions necessary to create a useful cpu are also required. And,
> profiles alleviate the burden. For example, rva22s64 mandates Ss1p12, so
> that profile will automatically set the v1_12_0 property.
> 
> I think we should implement (1) without a default.
> 
>> +#ifndef CONFIG_USER_ONLY
>> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
> 
> I think we should require the user provide one of sv39, sv48, ... rather
> than have a default for this too. S-mode profiles will again automatically
> set this to what it mandates, relieving the burden.

Makes sense. I'll remove this default.


Thanks,


Daniel

> 
>> +#endif
>> +}
>>   #else
>>   static void rv32_base_cpu_init(Object *obj)
>>   {
>> @@ -1732,6 +1744,13 @@ void riscv_cpu_list(void)
>>           .instance_init = initfn              \
>>       }
>>   
>> +#define DEFINE_BARE_CPU(type_name, initfn) \
>> +    {                                      \
>> +        .name = type_name,                 \
>> +        .parent = TYPE_RISCV_BARE_CPU,     \
>> +        .instance_init = initfn            \
>> +    }
>> +
>>   static const TypeInfo riscv_cpu_type_infos[] = {
>>       {
>>           .name = TYPE_RISCV_CPU,
>> @@ -1754,6 +1773,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>           .parent = TYPE_RISCV_CPU,
>>           .abstract = true,
>>       },
>> +    {
>> +        .name = TYPE_RISCV_BARE_CPU,
>> +        .parent = TYPE_RISCV_CPU,
>> +        .abstract = true,
>> +    },
>>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>>   #if defined(TARGET_RISCV32)
>> @@ -1770,6 +1794,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_init),
>>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
>>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
>>   #endif
>>   };
>>   
>> -- 
>> 2.41.0
>>
> 
> Thanks,
> drew

