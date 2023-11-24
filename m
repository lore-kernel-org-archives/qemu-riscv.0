Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D71C61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:13:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cY6-00089j-Rx; Fri, 24 Nov 2023 15:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cY5-00089U-7v
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:13:13 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cY2-0002Fq-UE
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:13:12 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cf8c462766so14860385ad.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700856789; x=1701461589; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u/lY1ENw4SxUwu5ioM+kO3Nf9QUQEiUaruWzHyu75I4=;
 b=BvHdAZG79KPFuynfyw82msta4NpdMvqdyxpufPUtqx25eUNhowdga9A4q3q8hsqkHI
 w5dx4sx7EXhdcsEYeqaPddHpCxL8YczzJcGybdMGo5Vtwyqx4QpXvQq+d3tKj5CRrenm
 2i8YSQUCfpPH943oZ+mmn/gEJ7dZ/DuQKrvibkR7jzceFnb0j8Km9T0UtEpDEEcsNyK5
 m37YoZfvAWlJkrB2SGWR2fjMFdqvcCZ9HppD5zhkMiFerE0ZVv7GeuG3oquZfdE6/QEq
 1S3KuzKguQQvjPsp8wDYmq5lwKuL6y8aukNyGFKvrz0fAyGpNCUy60SIdiS99dPIgKM/
 gnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700856789; x=1701461589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u/lY1ENw4SxUwu5ioM+kO3Nf9QUQEiUaruWzHyu75I4=;
 b=T93PG7QwFPm6qcF+VdOSkRI/CNWOIpO9xnWv8ovTzOjrLAC/Mv0iUbooi7LqMdPZEY
 tTzuoBLMoBMmKq7bYf/zZkQRmU7hQk2Rc9RLp+1Pg9XN2OvzEW9Rx4tXRvbmwxvo5V0e
 rcH7cDM1iqw/PSzqaicJ4UfrQbtztZGPnGS52BU6etwHRnqY77J0bDp359H3SgjYAPgt
 SwUFT3Sxl609csAUNshwCpHeCCpZMiLzFxxLqvyNN4MRvKAId3P7VPsS5quGFktPCfkB
 CnwuegchK5UGZL1UkhVowsxdeDJ7EFQAAG5r9s28tfBeNb+DuLr43svOkXtbTHVBloRZ
 yUQw==
X-Gm-Message-State: AOJu0Yykr958DRhxt5zbJy8+0rz8J24cysS/7Z3t31RshMFQSv0fVMuf
 fA5gT+yJnmM8T0Oan/nAtBAvXg==
X-Google-Smtp-Source: AGHT+IFz9iGOtzbLlJj02dvQyrOJ5Af/4GrdeYmjDp83hwWrW/NMvkNIaS3f+eJHCpt3gI8UiEbAog==
X-Received: by 2002:a17:903:44d:b0:1cf:7a4b:9dc6 with SMTP id
 iw13-20020a170903044d00b001cf7a4b9dc6mr3384142plb.61.1700856789310; 
 Fri, 24 Nov 2023 12:13:09 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170902e9c400b001cc52b58df6sm3559955plk.215.2023.11.24.12.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 12:13:08 -0800 (PST)
Message-ID: <0c8496cb-8105-4676-adf5-baa6da2b91a5@ventanamicro.com>
Date: Fri, 24 Nov 2023 17:13:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 6/7] target/riscv: add RVA22S64 profile
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
 <20231123191532.1101644-7-dbarboza@ventanamicro.com>
 <20231124-bd1c3479fa6c2bd9fdba7cc9@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231124-bd1c3479fa6c2bd9fdba7cc9@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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



On 11/24/23 14:16, Andrew Jones wrote:
> On Thu, Nov 23, 2023 at 04:15:31PM -0300, Daniel Henrique Barboza wrote:
>> The RVA22S64 profile consists of the following:
>>
>> - all mandatory extensions of RVA22U64;
>> - priv spec v1.12.0;
>> - satp mode sv39;
>> - Ssccptr, a cache related named feature that we're assuming always
>>    enable since we don't implement a cache;
>> - Other named features already implemented: Sstvecd, Sstvala,
>>    Sscounterenw;
>> - the new Svade named feature that was recently added.
>>
>> Most of the work is already done, so this patch is enough to implement
>> the profile.
>>
>> After this patch, the 'rva22s64' user flag alone can be used with the
>> rva64i CPU to boot Linux:
>>
>> -cpu rv64i,rva22s64=true
>>
>> This is the /proc/cpuinfo with this profile enabled:
>>
>>   # cat /proc/cpuinfo
>> processor	: 0
>> hart		: 0
>> isa		: rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
>> mmu		: sv39
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index a77118549b..d00548d164 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1559,8 +1559,48 @@ static RISCVCPUProfile RVA22U64 = {
>>       }
>>   };
>>   
>> +/*
>> + * As with RVA22U64, RVA22S64 also defines 'named features'.
>> + *
>> + * Cache related features that we consider enabled since we don't
>> + * implement cache: Ssccptr
>> + *
>> + * Other named features that we already implement: Sstvecd, Sstvala,
>> + * Sscounterenw
>> + *
>> + * Named features that we need to enable: svade
>> + *
>> + * The remaining features/extensions comes from RVA22U64.
>> + */
>> +static RISCVCPUProfile RVA22S64 = {
>> +    .name = "rva22s64",
>> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVS,
>> +    .priv_spec = PRIV_VERSION_1_12_0,
>> +    .satp_mode = VM_1_10_SV39,
>> +    .ext_offsets = {
>> +        /* rva22u64 exts and features */
>> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
>> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
>> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
>> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
>> +        CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
>> +        CPU_CFG_OFFSET(zic64b),
>> +
>> +        /* rva22s64 exts */
>> +        CPU_CFG_OFFSET(ext_zifencei), CPU_CFG_OFFSET(ext_svpbmt),
>> +        CPU_CFG_OFFSET(ext_svinval),
>> +
>> +        /* rva22s64 named features */
>> +        CPU_CFG_OFFSET(svade),
>> +
>> +        RISCV_PROFILE_EXT_LIST_END
>> +    }
>> +};
>> +
>>   RISCVCPUProfile *riscv_profiles[] = {
>>       &RVA22U64,
>> +    &RVA22S64,
>>       NULL,
>>   };
>>   
>> -- 
>> 2.41.0
>>
> 
> Since S-mode profiles will all presumably state they support everything a
> U-mode profile supports too, then I wonder if we shouldn't be able to
> point S-mode profiles at U-mode profiles somehow, rather than redundantly
> add their extensions.

Good point. I just checked and RVA23S64 also works the same way (i.e. the s-mode
mandatory extensions mandates the u-mode mandatory extensions), so this change
is worth doing for the sake of at least these 2 profiles.

I'll add a 'parent' field in the profile description and, if set, a profile
will also enable its parent.


Thanks,


Daniel

> 
> Anyway,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

