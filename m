Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11149CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 18:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qr0Ly-00078G-D7; Thu, 12 Oct 2023 14:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr0Lv-00076z-4x
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 14:24:07 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr0Ls-0005K6-SZ
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 14:24:06 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1dcf357deedso693021fac.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697135042; x=1697739842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VeI/nJ1stkOlj6RZX2ZlognUBv+luFAAog8plQeH90Q=;
 b=JPC4OSjMjbblqajE0xSH5n1sT2+GnfOI686Qs95uk+XOWIkH/Alpy3ERj5oZjhk+ZH
 Lz3wuxjkcLY+/T3ESXQah4CiX2Wk/YV0Izd+PdbvLyuKAZMcaJbMs/WH0743Em6LkO7v
 UPWu88JsuGlvavvjDRibLkWLJO381n+rdqvWVnVsUeUGWnQq6OzJEi7Jfb0oUCbNQYrR
 qZAUh7raDvo6azB/LVGmSNgEz1ynWRDEjOt6mzZg8UNR2SkYAPkU/Q/tqG4KHndVGsFE
 hKQeimIgWzHCwWTpk1qb4qk9rUstHIH/hflnTEAs6hJM8XbuOZWArl90Brg1/2dS0mOA
 gYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697135042; x=1697739842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VeI/nJ1stkOlj6RZX2ZlognUBv+luFAAog8plQeH90Q=;
 b=Sc3M3IYb4beCB1yxOJbZ4pOXVBry0eZKbojA3GekowpxFsAC5Ev4SA6s5id0KU2XVP
 CjKrcrMhvfBVmS15RWZ/ZUZXlR+QD2EMRfoDKkf4B8H19hg928zV6uy5Brf+sHxVwXAh
 XyViL/7ckEZW6IV47ROHRx55hDGeTKG4mexdW1dkY4h4U4MmCuodgDCs3PC7XJyC5JtB
 b47OooHGaZhAih6utGIBToSaOwjD/YogjUkJBPv860U7gYTe5RttF2DMJFwa4i+Pyi21
 zXySOFCDUjSEnL6zo/WikW8W+BKg0NNfoN5wdKlPH6Jvj3DzDNS1tn/5pFELdUOZyVmf
 4O2Q==
X-Gm-Message-State: AOJu0Yx83l66M3hBM6iVx/ZKB8/gBfy/Gq5hiKEP63mvVyPQLiCxxYxI
 AtxFUcsAlLrXkz87lCoYt7EtBw==
X-Google-Smtp-Source: AGHT+IEiaUTIKwc63n9zavDhQquiuu4vTWW2JMvhjXmBPnPltDUZ3+oHKxozj6qdtYRbnNNDVPFYpw==
X-Received: by 2002:a05:6870:9602:b0:1dd:443c:57a8 with SMTP id
 d2-20020a056870960200b001dd443c57a8mr32582348oaq.26.1697135042338; 
 Thu, 12 Oct 2023 11:24:02 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa78606000000b0068c006dd5c1sm12095305pfn.115.2023.10.12.11.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 11:24:01 -0700 (PDT)
Message-ID: <08b9a82f-a0a7-4be2-998a-399f6e482901@ventanamicro.com>
Date: Thu, 12 Oct 2023 15:23:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target/riscv/cpu.c: add zicntr extension flag
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-2-dbarboza@ventanamicro.com>
 <CAKmqyKNsg11Cg73MRLcHN-y-w_ytvdMz7WN_4fFo9aqWYwj5yw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKNsg11Cg73MRLcHN-y-w_ytvdMz7WN_4fFo9aqWYwj5yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 10/10/23 23:51, Alistair Francis wrote:
> On Fri, Oct 6, 2023 at 11:23 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> zicntr is the Base Counters and Timers extension described in chapter 12
>> of the unprivileged spec. It describes support for RDCYCLE, RDTIME and
>> RDINSTRET.
>>
>> QEMU already implements it way before it was a discrete extension.
>> zicntr is part of the RVA22 profile, so let's add it to QEMU to make the
>> future profile implementation flag complete.
>>
>> Given than it represents an already existing feature, default it to
>> 'true'. Change the realize() time validation to disable it in case its
>> dependency (icsr) isn't present.
> 
> What happens if a user disables this though?


Hmmmm ... nothing hehe

I think I'll have to go back to the drawing board with this and the next patch.
Both zicntr and zihpm are regular extensions and should be treated as such, meaning
that we should be able to disable what they're doing.

To avoid breaking what we currently have we'll make them always 'true' by default,
for all current CPUs, and then users are free to disable them.



Thanks,

Daniel

> 
> Alistair
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c         | 7 +++++++
>>   target/riscv/cpu_cfg.h     | 1 +
>>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 521bb88538..8783a415b1 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -79,6 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>>       ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>>       ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>>       ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>> +    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_icntr),
>>       ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>>       ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
>>       ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>> @@ -1265,6 +1266,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>>       MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
>>       MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
>>
>> +    /*
>> +     * Always default true - we'll disable it during
>> +     * realize() if needed.
>> +     */
>> +    MULTI_EXT_CFG_BOOL("zicntr", ext_icntr, true),
>> +
>>       MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
>>       MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
>>       MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
>> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>> index 0e6a0f245c..671b8c7cb8 100644
>> --- a/target/riscv/cpu_cfg.h
>> +++ b/target/riscv/cpu_cfg.h
>> @@ -62,6 +62,7 @@ struct RISCVCPUConfig {
>>       bool ext_zksh;
>>       bool ext_zkt;
>>       bool ext_ifencei;
>> +    bool ext_icntr;
>>       bool ext_icsr;
>>       bool ext_icbom;
>>       bool ext_icboz;
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 08b806dc07..df187bc143 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -542,6 +542,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
>>       }
>>
>> +    if (cpu->cfg.ext_icntr && !cpu->cfg.ext_icsr) {
>> +        cpu->cfg.ext_icntr = false;
>> +    }
>> +
>>       /*
>>        * Disable isa extensions based on priv spec after we
>>        * validated and set everything we need.
>> --
>> 2.41.0
>>
>>

