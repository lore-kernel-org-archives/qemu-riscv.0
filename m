Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A41C021A6
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmWef-0006Jt-6L; Mon, 24 Feb 2025 06:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmWeY-0006IB-F3
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 06:29:39 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmWeW-0003mh-1E
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 06:29:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-220c665ef4cso70575655ad.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 03:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740396573; x=1741001373; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gO1FC/XjfqWm8fMqy2gYHJk1MuQi7qrZwpmSAc2t9/g=;
 b=PhkCbTT0hrj6UaKa62Qs2vFdbmhU8UNBsg+M648AL+VSVrThvKuvDf+R+j2fkaZ8BB
 Zbv4EsCL4nIq267WRmPUV3lR3VZVnhCNEP2XW0cR/zBD0q3i1/IptoadJ9cCWfU2j+05
 8KrUrbtYLtllDEt2inNFdvQ6FCCloq2jSwvfhQlqTG20TjvKkCUpOCgmj07RX/0zsrpA
 noRMhp2nzV/JhNjfAQBR6XNCPMnUSUQxw4hIF9C+jRl13dUhInsMHcUReYKl6QFiKvQH
 lnwcIalt/EjWMeJWgK9NBHzOwXML1ExSnNJShS3uuhUi2Qy+TNpNLTPD7eXDFDYyx5bn
 FJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740396573; x=1741001373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gO1FC/XjfqWm8fMqy2gYHJk1MuQi7qrZwpmSAc2t9/g=;
 b=L79BCwBjZ9vhLByF+r4jGQDoRSe9UaPbJ/RKQAAjJlvx1WMnVkNuovAe37zSKcfGsW
 UbdTLogCE2rt/yQoW4w5l2z+TBcWxgrPzAyeaQz50uWWki7GV+gkLQFsBtTWMRCizdOj
 hegVig+lxqcx1BaQrmq746ZuXvNDy/Ht2ZCOnUXlZ6AZEzmJjDQsj/Y+2Yxt9upy3oXa
 FOyU3sMYz+1/DkXskmNUrMCIlkdD2ONqCcsSiMb7iGn5K3W8j/BGt9EUu+QL2D5H/En8
 4CsEr7s5oUEMkk87OxF+PBS66sXXrZeXxggtaDQmuyf17D3iGYhvOrIpXm2YCB+y0N7Y
 JU6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJdS36Gf+TXxZuwYL4tJMDeAGGxhb3lbOBxQoJ6IqyU6mKYiinPwif/q2+NpJE6pUabpz0RC9l4l90@nongnu.org
X-Gm-Message-State: AOJu0YxkH9OVb72dEvFWQETbf6QsPxPozg4kJqFIjMpbKRDk4nwCXOB8
 9gcyPuZGVvaMv8RIvXRgMfhlttEW7Jwxwq44FEW70O38yTR5ZDywtE9kUMgk/iMEBOSnXjBgKZg
 R
X-Gm-Gg: ASbGncuzvUhJkm5nf5imzoBq3dMty1TnoR/jaiB0XGFaZRCSv/RZkZbJzyXYkqSuVYs
 5x2PYSLxt9y9jEG0ZSdnckWsbjw/gIAbROopOPm5rEvRV3v+ZvY4DQMtABeGTB8Ai1vhOrcBp8E
 cawwFvJ+gxAr85tqZpheHRdXv2mVVOW8te21T9obR3t/aX/24w9AJzqen1PWzbaLB9E9riMLbJ9
 tzxu757psjnZYf1VUnqO5bxMyeFt7accEabGaO68/CVbbsG25rXHfR7GEAH46JLZVuRJayUbCNL
 4zh0NwifrECuZwvYy8BmaPpuvtA9EmhLm0sszKcktg==
X-Google-Smtp-Source: AGHT+IFV7gjwinjTt/igpNwGZZUDVDDlgXNQP3O3hjsYoNC/vx08O2Ds/fZcifvy1bkC7aFdzoBCcA==
X-Received: by 2002:aa7:8889:0:b0:730:98ef:30b5 with SMTP id
 d2e1a72fcca58-73426c8d4d0mr18740784b3a.5.1740396571616; 
 Mon, 24 Feb 2025 03:29:31 -0800 (PST)
Received: from [192.168.68.110] ([177.170.227.219])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7327eb20b98sm14631049b3a.147.2025.02.24.03.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 03:29:31 -0800 (PST)
Message-ID: <b04d1e5a-36f6-4c54-8bc7-134c79f0addb@ventanamicro.com>
Date: Mon, 24 Feb 2025 08:29:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv/cpu: ignore TCG init for KVM CPUs in
 reset_hold
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20250220161313.127376-1-dbarboza@ventanamicro.com>
 <20250220161313.127376-2-dbarboza@ventanamicro.com>
 <CAFEAcA8u8C2HTRjOBReSQ7oN7L248034VrfTHYgHCxBPy0gwDg@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAFEAcA8u8C2HTRjOBReSQ7oN7L248034VrfTHYgHCxBPy0gwDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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



On 2/24/25 6:59 AM, Peter Maydell wrote:
> On Thu, 20 Feb 2025 at 16:14, Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> riscv_cpu_reset_hold() does a lot of TCG-related initializations that
>> aren't relevant for KVM, but nevertheless are impacting the reset state
>> of KVM vcpus.
>>
>> When running a KVM guest, kvm_riscv_reset_vcpu() is called at the end of
>> reset_hold(). At that point env->mstatus is initialized to a non-zero
>> value, and it will be use to write 'sstatus' in the vcpu
>> (kvm_arch_put_registers() then kvm_riscv_put_regs_csr()).
>>
>> Do an early exit in riscv_cpu_reset_hold() if we're running KVM. All the
>> KVM reset procedure will be centered in kvm_riscv_reset_vcpu().
>>
>> While we're at it, remove the kvm_enabled() check in
>> kvm_riscv_reset_vcpu() since it's already being gated in
>> riscv_cpu_reset_hold().
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c         | 9 +++++----
>>   target/riscv/kvm/kvm-cpu.c | 3 ---
>>   2 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 522d6584e4..8e6e629ec4 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1050,6 +1050,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>           mcc->parent_phases.hold(obj, type);
>>       }
>>   #ifndef CONFIG_USER_ONLY
>> +    if (kvm_enabled()) {
>> +        kvm_riscv_reset_vcpu(cpu);
>> +        return;
>> +    }
>> +
>>       env->misa_mxl = mcc->misa_mxl_max;
>>       env->priv = PRV_M;
>>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>> @@ -1146,10 +1151,6 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>           env->rnmip = 0;
>>           env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
>>       }
>> -
>> -    if (kvm_enabled()) {
>> -        kvm_riscv_reset_vcpu(cpu);
>> -    }
>>   #endif
>>   }
> 
> This looks super odd, from an "I don't know anything about
> riscv specifics" position. Generally the idea is:
>   * reset in QEMU should reset the CPU state
>   * what a reset CPU looks like doesn't differ between
>     accelerators
>   * when we start the KVM CPU, we copy the state from QEMU
>     to the kernel, and then the kernel's idea of the reset state
>     matches
> 
> This patch looks like it's entirely skipping basically
> all of the QEMU CPU state reset code specifically for KVM.

Not sure I understood what you said here.

Without this patch, riscv_cpu_reset_hold() is doing initializations that are TCG
based, both for user mode and system mode, and in the end is calling the kvm
specific reset function if we're running KVM. This patch is simply skipping
all the TCG related reset procedures if we're running KVM. So the patch isn't
skipping the KVM specific QEMU CPU reset code, it is skipping the TCG specific
reset code if we're running KVM.

Granted, after applying patches 2 and 3 we could discard this patch because
now we're resetting all that KVM needs in kvm_reset_vcpu(), but why go
through the reset steps for TCG if we're going to overwrite them later during
kvm_reset_vcpu()?


> So now you'll have two different pieces of code controlling
> reset for different accelerators, and the resulting CPU
> state won't be consistent between them...

That is already the case even without this patch, doesn't it? If we have to call
a specific kvm reset function during cpu reset_hold then we're already in a point
where the reset procedure is differing between accelerators. I won't say that
this is a good design but I don't see it as a problem.

For instance, going to a code you're probably more familiar with, target/arm/cpu.c,
arm_cpu_reset_hold(), is doing something similar to what riscv_cpu_reset_hold() is
doing without this patch: a lot of TCG setups are made, then kvm_arm_reset_vcpu() is
called in the end if kvm_enabled(). kvm_arm_reset_vcpu() then overwrites at least some
of the TCG specific setup that was done before:

     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
      */
     ret = kvm_arm_vcpu_init(cpu);

kvm_arm_vcpu_init() is doing a KVM_ARM_VCPU_INIT ioctl that will populate the CPU object
with the kernel specific feature bitmask and so on. Note that this is not copying the TCG
setup into the kernel, it is in fact doing the opposite.

Note that my intention here isn't to make a case that the ARM KVM cpu doesn't need anything
that is being done in arm_cpu_reset_hold(). My point here is that KVM and TCG CPUs will have
different reset setups for some archs. For RISC-V I can say that KVM CPU does not rely on
anything that the TCG reset code is doing, hence why I sent this patch to make it official.


Thanks,

Daniel

> 
> thanks
> -- PMM


