Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71262C369D5
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 12:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9NaD-0003n6-D5; Mon, 28 Apr 2025 08:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9NaB-0003im-Kk
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 08:27:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9Na9-0007Qw-31
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 08:27:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7376dd56f8fso6338703b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745843251; x=1746448051; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LHD5Hw3xe7D3CUfCU4oZp5+98TPBTV4XN9wlZ0CFwyY=;
 b=DgHApvB4bpUwcDSthzK9zSd/BfrEPMwzIO6Z4/X+Son6pOs3TQ+g7bc9hIvymYZhUP
 C1wbT2s8o1Mm3S4dp3x9I+6vkf+h2+XeuSaTJ9kAEdwBCrqYR02Yks/BO11IX9uUEdkS
 68rYyhOgPFrZO1dIJt99NOtYAwxOpkiwsq5TGOg9a/Wqd5NFbJApW5UF61DBHapw0jnO
 6dw+MnP+XYqUNqAB0nvWOjJKz9nGLHA1doDhZjVPyUBAt6KOPvGVpE0MEcdZ/a2FpgGY
 jlZ9+b8R7I6+D6mu9uDKYw9HJi/P5bQ1aVS1jGzG7P3NivhTMPmXcRFFy8Pb63aBxYAf
 G+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745843251; x=1746448051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHD5Hw3xe7D3CUfCU4oZp5+98TPBTV4XN9wlZ0CFwyY=;
 b=EvUb09evLryrhEIx53DdYyU11ZE5SHDMp6YC05/1cbE/h/EbY6xGf/YvMfBCoyXczs
 IETdXWewWAC1/TM7DJfugICvr5ccQ4/NqAntJ3LkNpMT+zJYpPiFbcAPKe5IFxiYNZTP
 N+U5nMtnPuHpII+ZMIaw+ts9CVPLClggJTZcBeA6wRL7q5kMi5zVqTRGPekDVdzmEKSb
 tojpaPGgbA4O4FvHnsaO6V8bXtIeVcXg2SBGUeJSr3Jq9NhJdLGNKvlDiQMYWn3K9d6k
 GB2PrzJDriOJZMtWjELbn0lgT9Bw2kg9k3K+RXzzn9ogdNMPw7NM8oxoCwSXSCXfosB6
 GjEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLivFat/JzSZbFCY1yMfkFk/BC5eWthhcY1TuQR3BONLowQDpmQm+OvYzo5thfcwXD1dz+QVvP5es2@nongnu.org
X-Gm-Message-State: AOJu0YwFSi1/vC/K3ss1JHgos99gvwXv9P5S1eBE9wjEzG9zRAaCf8KL
 IPbiCut2KGjnYc28POXehWwiKTHOb5YX8F7ZLvBE2GSfnekhujDQtDtnIIG/fTw=
X-Gm-Gg: ASbGnctzt9FUWHy7lsWSeEvxbiXqSrcI+M/v1tdfcove+ZT3FrfyAHPDIkzfTu0t6G4
 uN5FEdd6/+7XOL5Jrfe0WdeI92qKsrYtTouIG7GhrtVHpqZj2a44wE7TA+x8BcLt/DSMzzaNhb/
 p/UPwCldKawZWNCTEEyV+Yc1KUrX7Gjdof2BoG0akY4d9FQakl0UD7VMQfHo2jr1z75T2WSxnk4
 TdcV8GU7GO7OdtriTPXbOMLAQL82cvxLUtCKPwmdZklQnSXBx2mQtwzrbjnX0m+OV5zKliqAiCz
 MnDha/WeFGqPMydiB4gjwRcoRV/zXsid6jTf3aINbFfLElegllfwJKI=
X-Google-Smtp-Source: AGHT+IF0ce7SPg+TpOh+niFf/8FSQc0f+snrRT9SuLCyoj3Wvep0JX1GgAtr5XL2838C8jYvM9mGvw==
X-Received: by 2002:a05:6a21:10f:b0:1f5:79c4:5da6 with SMTP id
 adf61e73a8af0-2045b6984f2mr14792141637.5.1745843250999; 
 Mon, 28 Apr 2025 05:27:30 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15faded634sm7146869a12.73.2025.04.28.05.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 05:27:30 -0700 (PDT)
Message-ID: <8a2ea33b-e867-4a72-b36c-012c11e428ee@ventanamicro.com>
Date: Mon, 28 Apr 2025 09:27:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] target/riscv: widen scounteren to target_ulong
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
 <20250425160203.2774835-9-dbarboza@ventanamicro.com>
 <20250427-e13fa003b1bfad48e17bcee9@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250427-e13fa003b1bfad48e17bcee9@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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



On 4/27/25 2:59 AM, Andrew Jones wrote:
> On Fri, Apr 25, 2025 at 01:02:02PM -0300, Daniel Henrique Barboza wrote:
>> We want to support scounteren as a KVM CSR. The KVM UAPI defines every
>> CSR size as target_ulong, and our env->scounteren is fixed at 32 bits.
>>
>> The other existing cases where the property size does not match the KVM
>> reg size happens with uint64_t properties, like 'mstatus'. When running
>> a 32 bit CPU we'll write a 32 bit 'sstatus' KVM reg into the 64 bit
>> 'mstatus' field. As long as we're consistent, i.e. we're always
>> reading/writing the same words, this is ok.
>>
>> For scounteren, a KVM guest running in a 64 bit CPU will end up writing
>> a 64 bit reg in a 32 bit field. This will have all sort of funny side
>> effects in the KVM guest that we would rather avoid.
>>
>> Increase scounteren to target_ulong to allow KVM to read/write the
>> scounteren CSR without any surprises.
>>
>> Aside from bumping the version of the RISCVCPU vmstate no other
>> behavioral changes are expected.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.h     | 9 ++++++++-
>>   target/riscv/machine.c | 6 +++---
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index f5a60d0c52..66d4ddfcb4 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -400,7 +400,14 @@ struct CPUArchState {
>>        */
>>       bool two_stage_indirect_lookup;
>>   
>> -    uint32_t scounteren;
>> +    /*
>> +     * scounteren is supposed to be an uint32_t, as the spec
>> +     * says. We're using a target_ulong instead because the
>> +     * scounteren KVM CSR is defined as target_ulong in
>> +     * kvm_riscv_csr, and we want to avoid having to deal
>> +     * with an ulong reg being read/written in an uint32_t.
>> +     */
>> +    target_ulong scounteren;
> 
> I'm having second thoughts about this. It seems like it should be
> avoidable with the use of an intermediary buffer (which we already
> have -- the uint64_t reg) and with tracking the size of the env state
> by capturing the size with the new macro used to build the array.
> Then,

I think I just understood what you mean. You suggested a more generic
approach instead of handling just the scounteren case.

To handle this in a more generic way we can store the size of the env
var using that macro magic you suggested in v1, and then we can handle
all cases where we have a 32 bit env in QEMU exactly like we would handle
scounteren.

I'll do a new version with this change in the patch that introduces
scounteren. Thanks,


Daniel

> 
> for reading:
>   1. read the kvm reg into a buffer of the size kvm says it is
>   2. only write the bytes we can store from the buffer into the env state,
>      using the size field to know how many that is
> 
> for writing:
>   1. put the env state into a buffer of the size kvm says the register is,
>      ensuring any upper unused bytes of the buffer are zero
>   2. write the buffer to kvm
> 
> Thanks,
> drew
> 
>>       uint32_t mcounteren;
>>   
>>       uint32_t scountinhibit;
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index df2d5bad8d..f3477e153b 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -401,8 +401,8 @@ static const VMStateDescription vmstate_ssp = {
>>   
>>   const VMStateDescription vmstate_riscv_cpu = {
>>       .name = "cpu",
>> -    .version_id = 10,
>> -    .minimum_version_id = 10,
>> +    .version_id = 11,
>> +    .minimum_version_id = 11,
>>       .post_load = riscv_cpu_post_load,
>>       .fields = (const VMStateField[]) {
>>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>> @@ -445,7 +445,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>>           VMSTATE_UINTTL(env.mtval, RISCVCPU),
>>           VMSTATE_UINTTL(env.miselect, RISCVCPU),
>>           VMSTATE_UINTTL(env.siselect, RISCVCPU),
>> -        VMSTATE_UINT32(env.scounteren, RISCVCPU),
>> +        VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>>           VMSTATE_UINT32(env.mcounteren, RISCVCPU),
>>           VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
>>           VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
>> -- 
>> 2.49.0
>>


