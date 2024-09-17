Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C85C3601A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqYGG-0004BI-LF; Tue, 17 Sep 2024 09:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1sqYGB-0004AL-Nj
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 09:28:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1sqYG8-0001Xp-8w
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2024 09:28:50 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B0B233F20C
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2024 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1726579725;
 bh=+9JqzmxnIPvJunXbVafObTwwY3WDwz8ViieNzrF2UmQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=F40YMocGNV0uv5Gd0w9VutvrVYUv5BqIY5gLyVrJLS8xvoheKuHmpt5/MK+npAS8M
 m2PZHsAZuzVgYd6zcCWsO6+yK8Lel58z3cb4Vc3V8oHtE7vz5OkwMEEx7pvGKtEDPK
 nVC6l1wRTICoPBGR0xwrNRB7ooMFE0XF27+PxDWX25OpWZT7bGrWnRClvKo8n2eGq4
 rT/60ae0mTTgxmeuXnNf52GOWDY+lPo5ZQ6gY8yRJeulg+6PZn3e8J7pwDhjc8YMYC
 lJGzNPr7xa+YZMvgZudE/znXEdbXhpM1xH6AONOqVeCDfQZwmfqYSUAwsMYL9hfdTR
 I4+hr16C0eUdQ==
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb830ea86so39641485e9.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2024 06:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726579725; x=1727184525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+9JqzmxnIPvJunXbVafObTwwY3WDwz8ViieNzrF2UmQ=;
 b=lgIwJdmqlWhkYAaC38wQfXwGhhivfL8h+GYrnGV/pCwswzTPi3MdBH9RDHZhunnd8z
 Htyk7iPzVXcGN0WPCfBzLG3dGT7HtqSy5LnEwsd6qIGyYdJfJSTAER9OcmjM9LjjJid0
 C+6DGyGcp4ZRGfN1aLiQ8nis0vc502eScr3duzJo37lu84k9lG+G0/uVB/wRV8qd1Kj+
 808SBq9roKtwDw6Z80gC091sAUjjIKcQMjQkOtfGtiQNVYdGO2mLwhQ7g/WJbD5pL94t
 BXhC38VTcwqRHppHLVuk6empHPbGWgTgD2XwKkoOqAfYyaDFYw5w49XEnKCiRUPa3+y/
 7Ifg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXijT7PnREpvKBG7aUkwLFLRxilbCSdhgaHh3BBRMWSfZAxd0FSYkkslUIiBQ/T+FJagI4MsMxSd64O@nongnu.org
X-Gm-Message-State: AOJu0YxTqdhomq/HNa8HLonjP+Mgn8lF/e0luWuhHK3wEGvGW4kiM/k7
 AwH7Sxczl+bRcwG9TutWUjU5DyyBmljz+ozM26ZVpiQOTJK98OTJ4aSctpDVsdB/Fyw1nc4iUmV
 +OFSNUAhgCQpF6EthMv9DhsjsBxxJwDdgzf+aZXdXtx5yCR7zE4FFIaTLMZZlRy7L2SF2
X-Received: by 2002:a05:600c:468a:b0:42c:b309:8d18 with SMTP id
 5b1f17b1804b1-42cdb53be54mr126240165e9.19.1726579725266; 
 Tue, 17 Sep 2024 06:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtJH6TSZU5ZjrQN49f/7Zg6VVpJsXF+C7Pf4Kqbp5v0j3JIfvNC6RO/pqcsSyfYsIO8szemQ==
X-Received: by 2002:a05:600c:468a:b0:42c:b309:8d18 with SMTP id
 5b1f17b1804b1-42cdb53be54mr126239945e9.19.1726579724713; 
 Tue, 17 Sep 2024 06:28:44 -0700 (PDT)
Received: from [192.168.103.101]
 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b1899efsm136849505e9.30.2024.09.17.06.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2024 06:28:44 -0700 (PDT)
Message-ID: <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
Date: Tue, 17 Sep 2024 15:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240917-f45624310204491aede04703@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 17.09.24 14:13, Andrew Jones wrote:
> On Mon, Sep 16, 2024 at 08:16:33PM GMT, Heinrich Schuchardt wrote:
>> OpenSBI enables the floating point in mstatus. For consistency QEMU/KVM
>> should do the same.
>>
>> Without this patch EDK II with TLS enabled crashes when hitting the first
>> floating point instruction while running QEMU with --accel kvm and runs
>> fine with --accel tcg.
>>
>> Additionally to this patch EDK II should be changed to make no assumptions
>> about the state of the floating point unit.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   target/riscv/cpu.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 4bda754b01..c32e2721d4 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -923,6 +923,13 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>       if (mcc->parent_phases.hold) {
>>           mcc->parent_phases.hold(obj, type);
>>       }
>> +    if (riscv_has_ext(env, RVF) || riscv_has_ext(env, RVD)) {
>> +        env->mstatus = set_field(env->mstatus, MSTATUS_FS, env->misa_mxl);
>> +        for (int regnr = 0; regnr < 32; ++regnr) {
>> +            env->fpr[regnr] = 0;
>> +        }
>> +        riscv_csrrw(env, CSR_FCSR, NULL, 0, -1);
>> +    }
> 
> If this is only fixing KVM, then I think it belongs in
> kvm_riscv_reset_vcpu(). But, I feel like we're working around an issue
> with KVM synchronization with this, as well as with the "clear CSR values"
> part of commit 8633951530cc ("target/riscv: Clear CSR values at reset and
> sync MPSTATE with host"). KVM knows how to reset VCPUs. It does so on
> VCPU creation and for any secondaries started with SBI HSM start. KVM's
> reset would set sstatus.FS to 1 ("Initial") and zero out all the fp
> registers and fcsr. So it seems like we're either synchronizing prior to
> KVM resetting the boot VCPU, not synchronizing at all, or KVM isn't doing
> the reset of the boot VCPU.
> 
> Thanks,
> drew

Hello Drew,

Thanks for reviewing.

Concerning the question whether kvm_riscv_reset_vcpu() would be a better 
place for the change:

Is there any specification prescribing what the state of the FS bits 
should be when entering M-mode and when entering S-mode?

Patch 8633951530cc seems not to touch the status register in QEMU's 
kvm_riscv_reset_vcpu(). So it is not obvious that this patch could have 
caused the problem.

Looking at the call sequences in Linux gives some ideas where to debug:

kvm_arch_vcpu_create calls kvm_riscv_reset_vcpu which calls
kvm_riscv_vcpu_fp_reset.

riscv_vcpu_set_isa_ext_single and kvm_riscv_vcpu_set_reg_config
only call kvm_riscv_vcpu_fp_reset if !vcpu->arch.ran_atleast_once.

kvm_riscv_vcpu_fp_reset sets FS bits to "initial"
if CONFIG_FPU=y and extension F or D is available.

It seems that in KVM only the creation of a vcpu will set the FS bits 
but rebooting will not.

Best regards

Heinrich

