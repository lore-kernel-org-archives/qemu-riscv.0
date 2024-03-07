Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248A5C54798
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 19:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riJOu-0002e5-PW; Thu, 07 Mar 2024 14:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riJOq-0002di-Ak
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 14:27:28 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riJOk-0008Td-K5
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 14:27:25 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3c1a2f7e1d2so5000b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Mar 2024 11:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709839636; x=1710444436; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDDEf++BkdQj7+uDCp7A7THqFceLnTiljmVi41v8cYM=;
 b=gO0m6NsYEtOID//xBzF+tsEUlJhRKIljYkU0yV5MLtcZ6T2TGQedo/dO1T+yd8rAie
 MHge20vChCV3kWac/CYlWvDnf0sSZZUwKavb9K0gTRc+lbP6/eOLeXI/Yl2YMk34UqUY
 ZE++mHLFcR6aY8Z5UJW8OanSr9hYCDzRiTR3Q1uXG6yUDX5SjEmXpZED2nUHpgzUeas/
 D0ZVf1lbnocU7fpwu3Bb8Eo2Qe3qKrlbbhQSTEoowzuGBE2jLXWHuP5E44GRBCdhzkGf
 FbsXr0G0BK6dYhQhDNRQ1hruKmCzYxgJ3rlM0oE+tI4Vik/i4dRR4X1UoEYyX5xJ9hsm
 Vd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709839636; x=1710444436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDDEf++BkdQj7+uDCp7A7THqFceLnTiljmVi41v8cYM=;
 b=Jowr6C9itD+LIuZBmwLfkb9U843IJeUjkIibud/8gGG76g0WdsprWn1NNROuYv+3px
 N9AhOU1Bxo5gBa05CILTz3U7z7rANLK2tR5s2pWNiJVPnvPCN/KU/L4VU9HGJxGTXryE
 ONtJvwKi345GWtihHdBfGdDiih3ZV78Nm7y1GPGdlePB4mUuOSqaPivXz9nikK0aZi8t
 4BvcCSjGPRU4W1upPbhtNNJm4eq9+q+m1Ih0OD9XyUm0Qgl2E+ejUWXushfyY7DWPSNK
 M6qdUJ+gkSnFzAInM2R5EbRNOtE/wgYf5Qy/c+FNaAZs2ScXN5u/3sK2fcn5hTNq2DM4
 6N7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3qNyMIL0nBD8CiHtRTKo9T6e4W76UNFcyAwh46NkdjBXjVUOQLzLS+LxZV0/fi9KljDhewx641Wa25tEeuGe7KGc1eCU=
X-Gm-Message-State: AOJu0YyYteK+ZTO9kjM0jtseAbH201bcNWUSZD0Kxrtpjg+yY8YrhkFe
 AJXeP8O3x5d91ag7nehI7V6hZOpZIptSyr1jKyZ5HN0cTMeOwcYzGeZx81oTnAI=
X-Google-Smtp-Source: AGHT+IFUap+Nxd6OoOHQgcvlzyNIhsIYQH36guqI9a7hoGffZr1yld203NFfaEVvEZ2doLIVcw+q0w==
X-Received: by 2002:a05:6808:4408:b0:3c1:f571:f5b0 with SMTP id
 eo8-20020a056808440800b003c1f571f5b0mr8453525oib.49.1709839636465; 
 Thu, 07 Mar 2024 11:27:16 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a63d915000000b005d8b89bbf20sm12717545pgg.63.2024.03.07.11.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 11:27:16 -0800 (PST)
Message-ID: <36e03836-89d6-420d-8f8a-f93f7eabd5d5@ventanamicro.com>
Date: Thu, 7 Mar 2024 16:27:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RISC-V][tech-server-platform] [RISC-V][tech-server-soc] [RFC
 2/2] target/riscv: Add server platform reference cpu
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 "Wu, Fei2" <fei2.wu@intel.com>
Cc: tech-server-soc@lists.riscv.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 andrei.warkentin@intel.com, shaolin.xie@alibaba-inc.com, ved@rivosinc.com,
 sunilvl@ventanamicro.com, haibo1.xu@intel.com, evan.chai@intel.com,
 yin.wang@intel.com, tech-server-platform@lists.riscv.org
References: <20240304102540.2789225-1-fei2.wu@intel.com>
 <20240304102540.2789225-3-fei2.wu@intel.com>
 <bd34501b-3dda-40eb-aa92-73ea289297d1@ventanamicro.com>
 <8ad091f3-c00f-4786-a89b-799304eace73@intel.com>
 <56448108-c655-4684-bab9-b8d7747f79f7@intel.com>
 <4e16f394-fe9b-4edf-80eb-fc3220bcf6e1@intel.com>
 <95e45995-fb10-4c68-9937-fd9f7e032bf1@canonical.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <95e45995-fb10-4c68-9937-fd9f7e032bf1@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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



On 3/7/24 09:17, Heinrich Schuchardt wrote:
> On 07.03.24 08:36, Wu, Fei2 wrote:
>> On 3/6/2024 9:26 PM, Wu, Fei wrote:
>>> On 3/5/2024 1:58 PM, Wu, Fei wrote:
>>>> On 3/5/2024 3:43 AM, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 3/4/24 07:25, Fei Wu wrote:
>>>>>> The harts requirements of RISC-V server platform [1] require RVA23 ISA
>>>>>> profile support, plus Sv48, Svadu, H, Sscofmpf etc. This patch provides
>>>>>> a virt CPU type (rvsp-ref) as compliant as possible.
>>>>>>
>>>>>> [1]
>>>>>> https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
>>>>>>
>>>>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>>>>> --->   hw/riscv/server_platform_ref.c |  6 +++-
>>>>>>    target/riscv/cpu-qom.h         |  1 +
>>>>>>    target/riscv/cpu.c             | 62 ++++++++++++++++++++++++++++++++++
>>>>>>    3 files changed, 68 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/riscv/server_platform_ref.c
>>>>>> b/hw/riscv/server_platform_ref.c
>>>>>> index ae90c4b27a..52ec607cee 100644
>>>>>> --- a/hw/riscv/server_platform_ref.c
>>>>>> +++ b/hw/riscv/server_platform_ref.c
>>>>>> @@ -1205,11 +1205,15 @@ static void
>>>>>> rvsp_ref_machine_class_init(ObjectClass *oc, void *data)
>>>>>>    {
>>>>>>        char str[128];
>>>>>>        MachineClass *mc = MACHINE_CLASS(oc);
>>>>>> +    static const char * const valid_cpu_types[] = {
>>>>>> +        TYPE_RISCV_CPU_RVSP_REF,
>>>>>> +    };
>>>>>>          mc->desc = "RISC-V Server SoC Reference board";
>>>>>>        mc->init = rvsp_ref_machine_init;
>>>>>>        mc->max_cpus = RVSP_CPUS_MAX;
>>>>>> -    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
>>>>>> +    mc->default_cpu_type = TYPE_RISCV_CPU_RVSP_REF;
>>>>>> +    mc->valid_cpu_types = valid_cpu_types;
>>>>>
>>>>> I suggest introducing this patch first, then the new machine type that
>>>>> will use it as a default
>>>>> CPU. The reason is to facilitate future bisects. If we introduce the
>>>>> board first, a future bisect
>>>>> might hit the previous patch, the board will be run using RV64 instead
>>>>> of the correct CPU, and
>>>>> we'll have different results because of it.
>>>>>
>>>> Good suggestion.
>>>>
>>>>>>        mc->pci_allow_0_address = true;
>>>>>>        mc->default_nic = "e1000e";
>>>>>>        mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
>>>>>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>>>>>> index 3670cfe6d9..adb934d19e 100644
>>>>>> --- a/target/riscv/cpu-qom.h
>>>>>> +++ b/target/riscv/cpu-qom.h
>>>>>> @@ -49,6 +49,7 @@
>>>>>>    #define TYPE_RISCV_CPU_SIFIVE_U54
>>>>>> RISCV_CPU_TYPE_NAME("sifive-u54")
>>>>>>    #define TYPE_RISCV_CPU_THEAD_C906
>>>>>> RISCV_CPU_TYPE_NAME("thead-c906")
>>>>>>    #define TYPE_RISCV_CPU_VEYRON_V1
>>>>>> RISCV_CPU_TYPE_NAME("veyron-v1")
>>>>>> +#define TYPE_RISCV_CPU_RVSP_REF         RISCV_CPU_TYPE_NAME("rvsp-ref")
>>>>>>    #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>>>>>>      OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>>>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>>>> index 5ff0192c52..bc91be702b 100644
>>>>>> --- a/target/riscv/cpu.c
>>>>>> +++ b/target/riscv/cpu.c
>>>>>> @@ -2282,6 +2282,67 @@ static void rva22s64_profile_cpu_init(Object *obj)
>>>>>>          RVA22S64.enabled = true;
>>>>>>    }
>>>>>> +
>>>>>> +static void rv64_rvsp_ref_cpu_init(Object *obj)
>>>>>> +{
>>>>>> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
>>>>>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>>>>>> +
>>>>>> +    riscv_cpu_set_misa_ext(env, RVG | RVC | RVS | RVU | RVH | RVV);
>>>>>> +
>>>>>> +    /* FIXME: change to 1.13 */
>>>>>> +    env->priv_ver = PRIV_VERSION_1_12_0;
>>>>>> +
>>>>>> +    /* RVA22U64 */
>>>>>> +    cpu->cfg.mmu = true;
>>>>>> +    cpu->cfg.ext_zifencei = true;
>>>>>> +    cpu->cfg.ext_zicsr = true;
>>>>>> +    cpu->cfg.ext_zicntr = true;
>>>>>> +    cpu->cfg.ext_zihpm = true;
>>>>>> +    cpu->cfg.ext_zihintpause = true;
>>>>>> +    cpu->cfg.ext_zba = true;
>>>>>> +    cpu->cfg.ext_zbb = true;
>>>>>> +    cpu->cfg.ext_zbs = true;
>>>>>> +    cpu->cfg.zic64b = true;
>>>>>> +    cpu->cfg.ext_zicbom = true;
>>>>>> +    cpu->cfg.ext_zicbop = true;
>>>>>> +    cpu->cfg.ext_zicboz = true;
>>>>>> +    cpu->cfg.cbom_blocksize = 64;
>>>>>> +    cpu->cfg.cbop_blocksize = 64;
>>>>>> +    cpu->cfg.cboz_blocksize = 64;
>>>>>> +    cpu->cfg.ext_zfhmin = true;
>>>>>> +    cpu->cfg.ext_zkt = true;
>>>>>
>>>>> You can change this whole block with:
>>>>>
>>>>> RVA22U64.enabled = true;
>>>>>
>>>>>
>>>>> riscv_cpu_add_profiles() will check if we have a profile enabled and, if
>>>>> that's the
>>>>> case, we'll enable all its extensions in the CPU.
>>>>>
>>>>> In the near future, when we implement a proper RVA23 support, we'll be
>>>>> able to just do
>>>>> a single RVA23S64.enabled = true in this cpu_init(). But for now we can
>>>>> at least declare
>>>>> RVA22U64 (perhaps RVA22S64) support for this CPU.
>>>>>
>>>
>>> Hi Daniel,
>>>
>>> I'm not sure if it's a regression or the usage has been changed. I'm not
>>> able to use '-cpu rva22s64' on latest qemu (db596ae190).
>>>
>> I did a quick git bisect and found that commit d06f28db6 "target/riscv:
>> move 'mmu' to riscv_cpu_properties[]" disabled mmu by default, so that
>> an explicit mmu option should be added to qemu command line like '-cpu
>> rva22s64,mmu=true', I think rva22s64 should enable it by default.
>>
>> Thanks,
>> Fei.
> 
> It is nice that the MMU can be disabled. But is there any reason why the MMU should be disabled by default on the virt machine (which typically is used to run an operating system)?

'mmu' is currently being handled as a CPU property, not a board property. So using
the 'virt' board without a MMU is valid (albeit not that useful/common).

> 
> Can we add mmu=true as default to the rv64 CPU?

Excluding vendor CPUs (where every vendor can do whatever they want), all CPUs that
aren't bare (rv32i, rv64i, rv32e, rv64e) are running with mmu=true. The behavior
described by Fei with profile CPUs is fixed in riscv-to-apply and queued to be
merged.


Thanks,

Daniel


> 
> Best regards
> 
> Heinrich

