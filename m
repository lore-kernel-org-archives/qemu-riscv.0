Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA3EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 23:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEI30-0007xt-E4; Tue, 27 Jun 2023 19:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEI2z-0007xa-43
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 19:24:33 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEI2w-0002ys-Jt
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 19:24:32 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1aa291b3fc9so4711875fac.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687908268; x=1690500268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hswAE9iQ84h5owfyZddGb2HQ3uXnwBZev7P7hONg8tQ=;
 b=IFw35Z9Tl+MA9QQZ+tphzS5EVavgatzFuO78B+Gl05Ra57aO7sPP4p51vUGcijTBIe
 iwNjv011TafzX9908omcbu2kTDNIgLRJcpu7eSFfZdksSXKU5WnTxCQwmo3p54kcwzsU
 JKrKN5iUDb7YY8ScTsAQD5WMukJqQ9VuxnewzxNJST+jGuYL+RVW/RyiNOlrwMeu91K6
 SI3MhUDGMRhXH8aHUNMfTdW9BpZ5nJWikFgudM+a0uP+c+xXhDiQ6TR8Nx0dYzz7vDQY
 uVuee85mRDcUz9gLZ244QJ/6yABVQ8aor/IedP7F9E5HDvd7ZKCRqpH9s0LuLJqYQ7ke
 yXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687908268; x=1690500268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hswAE9iQ84h5owfyZddGb2HQ3uXnwBZev7P7hONg8tQ=;
 b=Q8ukGizp6W+Dce+JEcjXkEhfIcAoI6/eM31C/Hu1WthqEfpSILEshoLkisOzvhQtpt
 EftrngfrBNcFBGUUVYJ3fdQ8Y6FWOYJ29HTPBWpw6jrpwcGrxQMs592B0JKPrfWD2ZDd
 WBtyBpK3Su4FdKF0093Wx+6hSLXP/jKvjaIr8lZ7RFS5+of0v37xNWm1YsFSxQ07OChX
 Ehcf47gtpuimgvgO0hFt/f051LisDE7vL24HadL/7EYm4DVVZ1PE1HvtlzdsBFQHTrzx
 dZJuMZ2pEoIfeQRCctdfvoN1b5zOidBMKGWguo+hykXTaSGSbBqZbBDf4GGaWYFkseCM
 8i2w==
X-Gm-Message-State: AC+VfDwetlALcUdOtFeJ5UzfGqMYnnB7QBBfY48mjjEzxu9B0J2o2Z6h
 MZTjF0t9W6KmATMVk9YM2JTE2w==
X-Google-Smtp-Source: ACHHUZ4YK8bBttuI0s1T2mka1Nsy4R/amSMp62RrIdwjzgM5bGX/illoViFfAtLbzniY/zBn9/ZaZg==
X-Received: by 2002:a05:6871:506:b0:1b0:4c1e:424f with SMTP id
 s6-20020a056871050600b001b04c1e424fmr4664599oal.42.1687908268651; 
 Tue, 27 Jun 2023 16:24:28 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 u3-20020a4ae683000000b005525c26a605sm3828577oot.27.2023.06.27.16.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 16:24:28 -0700 (PDT)
Message-ID: <b76be116-a277-1681-7922-6c09ddb77fad@ventanamicro.com>
Date: Tue, 27 Jun 2023 20:24:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/19] target/riscv: skip features setup for KVM CPUs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-2-dbarboza@ventanamicro.com>
 <29ffa6db-a4ed-0e67-2995-951248e8302e@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <29ffa6db-a4ed-0e67-2995-951248e8302e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/27/23 18:19, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 27/6/23 18:31, Daniel Henrique Barboza wrote:
>> As it is today it's not possible to use '-cpu host' if the RISC-V host
>> has RVH enabled. This is the resulting error:
>>
>> $ sudo ./qemu/build/qemu-system-riscv64 \
>>      -machine virt,accel=kvm -m 2G -smp 1 \
>>      -nographic -snapshot -kernel ./guest_imgs/Image  \
>>      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>>      -append "earlycon=sbi root=/dev/ram rw" \
>>      -cpu host
>> qemu-system-riscv64: H extension requires priv spec 1.12.0
>>
>> This happens because we're checking for priv spec for all CPUs, and
>> since we're not setting  env->priv_ver for the 'host' CPU, it's being
>> default to zero (i.e. PRIV_SPEC_1_10_0).
>>
>> In reality env->priv_ver does not make sense when running with the KVM
>> 'host' CPU. It's used to gate certain CSRs/extensions during translation
>> to make them unavailable if the hart declares an older spec version. It
>> doesn't have any other use. E.g. OpenSBI version 1.2 retrieves the spec
>> checking if the CSR_MCOUNTEREN, CSR_MCOUNTINHIBIT and CSR_MENVCFG CSRs
>> are available [1].
>>
>> 'priv_ver' is just one example. We're doing a lot of feature validation
>> and setup during riscv_cpu_realize() that it doesn't apply KVM CPUs.
>> Validating the feature set for those CPUs is a KVM problem that should
>> be handled in KVM specific code.
>>
>> The new riscv_cpu_realize_features() helper contains all validation
>> logic that are not applicable to KVM CPUs. riscv_cpu_realize() verifies
>> if we're dealing with a KVM CPU and, if not, execute the new helper to
>> proceed with the usual realize() logic for all other CPUs.
>>
>> [1] lib/sbi/sbi_hart.c, hart_detect_features()
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++----------
>>   1 file changed, 33 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index fb8458bf74..e515dde208 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>>   }
>>   #endif
>> +static bool riscv_running_kvm(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    return kvm_enabled();
>> +#else
>> +    return false;
>> +#endif
>> +}
> 
> Instead of this, ...
> 
>> @@ -1369,6 +1370,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           }
>>        }
>>   #endif
>> +}
>> +
>> +static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>> +{
>> +    CPUState *cs = CPU(dev);
>> +    RISCVCPU *cpu = RISCV_CPU(dev);
>> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    if (!riscv_running_kvm()) {
> 
> ... why not simply do:
> 
>     #ifndef CONFIG_USER_ONLY
> 
>         if (!kvm_enabled()) {
> 
>> +        riscv_cpu_realize_features(dev, &local_err);
>> +        if (local_err != NULL) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>> +    }
> 
>     #endif
> 
> ?

Because a month back, when I first wrote this series, I was getting a lot of
failed linux-user builds because kvm_enabled() was being called in a linux-user
context. I got a little tired of it and created this wrapper that included
the #ifndef.

After all patches are applied we have 3 places where this function is called.
There's a chance that some of them are being called in a sysemu emulation
only and we could make it do with just a kvm_enabled(). I guess it doesn't
hurt to remove this function and handle each case one by one.


> 
> If riscv_cpu_realize_features() is for all but KVM, then the
> name isn't ideal.

I guess we could rename it to riscv_cpu_realize_tcg(). We don't have any other
accelerators aside from KVM and TCG, and there's a high chance that only TCG would
care about this code even with other acccelerators in place.

In fact, this check could also be made with "if (tcg_enabled())" instead of
!kvm_enabled().This goes in line with a change you posted in qemu-ppc a few
days ago.


Thanks,


Daniel


