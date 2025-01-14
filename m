Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F32E77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 16:09:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXjTU-00089s-Sc; Tue, 14 Jan 2025 11:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXjTK-00089L-Gl
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 11:08:54 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXjTI-00033Y-4w
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 11:08:53 -0500
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-2163bd70069so103789485ad.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 08:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736870930; x=1737475730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LvuP4HP8BGiJJQru02wn1It3jrofqKr9zel2reZu2jk=;
 b=A3bywYuu9VELIi1HF0Y8UDnf4xaaC+c8dQSDZrYQPXIZL4b+gojg76uJLn1gBPD9nB
 lgTQFQ1Z6Gdj0le6qxQz+IEAQiaDNOpFCFbVaTDX7N6wpmk+MoE6Td+JdXeWpiTNvZF6
 z75vp8qn3QoM5ZNevlpz/M+VshW7HEb33AIgkqOcPIPbpRolJPN0bFheRn4rx2+jGlrT
 O6bdK2S2cprXSxTjR65sD9BrPB7GaV7woXI+gMapK7RCxQHaVXgylXDLHBL1n1y1+K0R
 pXcK2ZDV3vB7BbTPBeyxbMyNCq/+uTEtn8QpSwNPo3kO/q8mK2JyQIn1RaE8fpVTRvNV
 +q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736870930; x=1737475730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvuP4HP8BGiJJQru02wn1It3jrofqKr9zel2reZu2jk=;
 b=NoD4dO4GSOuSafajqZQWhKaBeY3xLrHSjNI+jGq0QmM4OY0Y9Q0Kb9eMX5/Nzgrw/C
 OdzX6jgPdURcl1Xc6uM3nT9iXDwbjdBIsVHt9suwSTzeUFbH4JSFn106g++zZnlLhFIq
 cDCXfy44mzcfQBK5XOoZoXSmwsiJtB+g0L1nX9bIimdVD3HHYYTf1aCGOML8i2xktleI
 uQsgWJDn52fsoZso58qc0G4r4hbROAvVcacQZKUpirlkYcvE3D2na9lWHAe4JsRkmvZa
 +046FdJgAtJVGTMgJGjOxw7IKfSBvj59/TWW3a5sCZZSB3DPzQQxwO3KBOCaLqqCWYf0
 9g1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlqmMihSdB2OjQ0ZXOvBs3h8+wszgvZ9GLyCjMnIt5qzaiJXj//IQtTFvQdrCWYB7D4c8swBCag4Zz@nongnu.org
X-Gm-Message-State: AOJu0Yx+ZZrtts1rDUgMcayAHnwej4b0yjvFWyB+aDCac7b929DZ1Z56
 3MPFarwz0eaU7j1PbWOtedWvxn8md7yILYdsn+MdTMwq+DHSUBilcWhy7rK9u0k=
X-Gm-Gg: ASbGncuBAuAxcz7okYgGLSHPuuX22xTVF9lKmI7U1ArZr0FZ1Y6RmCS26WnecVTcu1s
 iA8bpStSDZC41dnRP0+SBlUIUBhDZUn7z5vb4hedj1LJQk4RpoNxbYYTMaTC5uBn74QvMyqiTiL
 RKBOLe1I5ymwQ02VSnDWYF/xKdedumJsXcMJrse0bR58T1zGVsdXp7dycVblGNczTkvgk4zYdNZ
 hAFYDUR7U8nVW8Xhs9dlxmIHRW1MadyI9znNx6F+jDSXl7NpPDbVvpymlfHph261A/fKtV1
X-Google-Smtp-Source: AGHT+IHEHetUG0fD2zi3MY5i9Xeplap1igeuWDZtBUI2FQSLWVPmh7/Vz9opK3ifFnfSpwXMeWR8BA==
X-Received: by 2002:a17:902:d2d2:b0:215:72aa:693f with SMTP id
 d9443c01a7336-21a83f46988mr377431625ad.9.1736870930119; 
 Tue, 14 Jan 2025 08:08:50 -0800 (PST)
Received: from [192.168.68.110] ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f10def6sm69429145ad.38.2025.01.14.08.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:08:49 -0800 (PST)
Message-ID: <f2919b99-d131-40ca-a5e8-63c91092e083@ventanamicro.com>
Date: Tue, 14 Jan 2025 13:08:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] target/riscv: use RVB in RVA22U64
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20250114132012.1224941-1-dbarboza@ventanamicro.com>
 <20250114132012.1224941-3-dbarboza@ventanamicro.com>
 <20250114-85b134099fa79adb42628ebc@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250114-85b134099fa79adb42628ebc@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 1/14/25 11:52 AM, Andrew Jones wrote:
> On Tue, Jan 14, 2025 at 10:20:10AM -0300, Daniel Henrique Barboza wrote:
>>  From the time we added RVA22U64 until now the spec didn't declare 'RVB'
>> as a dependency, using zba/zbb/zbs instead. Since then the RVA22 spec
>> [1] added the following in the 'RVA22U64 Mandatory Extensions' section:
>>
>> "B Bit-manipulation instructions
>>
>> Note: The B extension comprises the Zba, Zbb, and Zbs extensions. At the
>> time of RVA22U64's ratification, the B extension had not yet been
>> defined, and so RVA22U64 explicitly mandated Zba, Zbb, and Zbs instead.
>> Mandating B is equivalent."
>>
>> It is also equivalent to QEMU (see riscv_cpu_validate_b() in
>> target/riscv/tcg/tcg-cpu.c).
>>
>> Finally, RVA23U64 [2] directly mentions RVB as a mandatory extension,
>> not citing zba/zbb/zbs.
>>
>> To make it clear that RVA23U64 will extend RVA22U64 (i.e. RVA22 is a
>> parent of RVA23), use RVB in RVA22U64 as well. As a bonus we can also
>> exclude zba/zbb/zbs from 'ext_offsets' and make it a bit shorter.
>>
>> (bios-tables-test change: zba/zbb/zbs no longer on riscv,isa)
> 
> We should still have zba/zbb/zbs on the ISA string. I don't think
> Linux yet supports expanding a 'B' bundle into them and other SW
> may also have not really cared about 'B' being designed to represent
> preexisting extensions after having already learned how to detect
> those extensions.

This has to do with how bios-tables-test works. The test doesn't boot the CPU
up to realize() and finalize() and, with this change, we ended up removing
zba/zbb/zbs from it because we won't reach riscv_cpu_validate_b() to add
them back.

I guess that in the end, aside from having a smaller ext list, there's not
much to gain from removing zba/zbb/zbs from the profile definition. We
can just add RVB and keep them.


Thanks,

Daniel

> 
> Anyway, what keeps them from being added? I don't see QEMU code
> for that. I do expect a bios tables change though, since the ISA
> string should now have 'B' added to it.
> 
> Thanks,
> drew
> 
>>
>> [1] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#61-rva22u64-profile
>> [2] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc#rva23u64-profile
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c                |   5 ++---
>>   tests/data/acpi/riscv64/virt/RHCT | Bin 398 -> 400 bytes
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b187ef2e4b..8d0563527f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -2351,13 +2351,12 @@ static const PropertyInfo prop_marchid = {
>>   static RISCVCPUProfile RVA22U64 = {
>>       .parent = NULL,
>>       .name = "rva22u64",
>> -    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
>> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
>>       .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
>>       .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
>>       .ext_offsets = {
>>           CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>> -        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
>> -        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
>> +        CPU_CFG_OFFSET(ext_zfhmin),
>>           CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
>>           CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
>>           CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
>> diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
>> index b14ec15e553200760a63aad65586913d31ea2edc..13c8025b868051485be5ba62974a22971a07bc6a 100644
>> GIT binary patch
>> delta 53
>> zcmeBUp1{l%<l!7LfsuiM@#{n`13^7TMg~>JqB1j+%-qDZl;ot1UQ&#clNpsc(ij;S
>> I3K$s}0ARKZK>z>%
>>
>> delta 52
>> zcmbQh+{ern<l!9B$H>6Im@tvcKtP9)kwJyAsLaeHGdD3UC3&N_6yxMHMkS6EMh1pF
>> HMg|4|IwT82
>>
>> -- 
>> 2.47.1
>>
>>


