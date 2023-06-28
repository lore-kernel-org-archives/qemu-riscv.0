Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E96EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOqV-0007nE-Ix; Wed, 28 Jun 2023 02:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOqU-0007mX-Cb
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:40:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOqS-0004lD-AM
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:40:06 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so6860239a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687934402; x=1690526402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgTOsVwz61x5ctT1BdUUTTMFqLoepNYh9F6UZKiQido=;
 b=YP7Wj/HjpvuIM4tTR2HBBHM+zcUHDJIJY+/Lj/TM0lkMFa7PbVxV1NrtX6Cv8vABOn
 QeK8/FmvwsM3cAzXx/unX7VqxT6p5cQBS4zvvq1FjElNmFIJg+feFUPnnbjoILhs6ZJb
 FoYW6xTDRu6GvBSr3fQlFU5pP6k+k5hKHgYievhlLKh4T+CE3bmKfDI4A6IY/DybHxxN
 rQSfD137GSQ9VGQICwkc2KF5MlOntwmYuhfN177fgiYZ7JlAIifE+CFhnyWm6GjmEG8n
 P6swahGZLjUvi814xEIvkCSKXbRtc1CDEafsgrA+YBvicyZCN48pgOJNwn16X3YYKNa1
 d/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687934402; x=1690526402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgTOsVwz61x5ctT1BdUUTTMFqLoepNYh9F6UZKiQido=;
 b=NPq3ANiQaYRoYWjztyILTlAsSvmu/MTEUwfw3w6ITSO673XIU9oSH1S6VJKi8upNPu
 d7jNXdbj4rbfyXn/JKEW4HDh09spmBMkS83kIYBWdObAH0ck/lvHYmYvcASJxqkv3Ogr
 HTczyS5I191x5/EHJxkrIYpVIeQdI77qXJOJA06Fdno/HIli+Knx9641MCeG0cUBz3Ke
 7b47pTO/4XEzHGK69bkw0+7tzS6NPZ2nEVoYDDGTrHJS/pXSppHNVIkGoSzqVKmJS1Vn
 r1Xpd5mytlz9FwrXmc+YH25ugWJbeKcd6nEq31SiRsMGzRaNlT6ygnr8fYkcMVBCcXFy
 hEHA==
X-Gm-Message-State: AC+VfDwKdlq93R65AzDFpfKbQMRVWjHbA9VeNFGrJ49rfcl0ACBqw6Ye
 mqcEHxD0QJ/joDt8DkCig+KVzA==
X-Google-Smtp-Source: ACHHUZ4ufL8TwyNbn+Wc6x3r/IM295SHuGA8QtJPFqtP+o1ZOHRsoHHyVCBYwVGfeZLf1cIRXxf8gg==
X-Received: by 2002:a17:907:748:b0:982:b920:daad with SMTP id
 xc8-20020a170907074800b00982b920daadmr31464647ejb.71.1687934402531; 
 Tue, 27 Jun 2023 23:40:02 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a170906565500b00991bba473e1sm3316468ejr.3.2023.06.27.23.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 23:40:02 -0700 (PDT)
Message-ID: <110b3269-02a8-0364-4104-1b8ef469c03c@linaro.org>
Date: Wed, 28 Jun 2023 08:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/19] target/riscv: skip features setup for KVM CPUs
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-2-dbarboza@ventanamicro.com>
 <29ffa6db-a4ed-0e67-2995-951248e8302e@linaro.org>
 <b76be116-a277-1681-7922-6c09ddb77fad@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b76be116-a277-1681-7922-6c09ddb77fad@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

On 28/6/23 01:24, Daniel Henrique Barboza wrote:
> 
> 
> On 6/27/23 18:19, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> On 27/6/23 18:31, Daniel Henrique Barboza wrote:
>>> As it is today it's not possible to use '-cpu host' if the RISC-V host
>>> has RVH enabled. This is the resulting error:
>>>
>>> $ sudo ./qemu/build/qemu-system-riscv64 \
>>>      -machine virt,accel=kvm -m 2G -smp 1 \
>>>      -nographic -snapshot -kernel ./guest_imgs/Image  \
>>>      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>>>      -append "earlycon=sbi root=/dev/ram rw" \
>>>      -cpu host
>>> qemu-system-riscv64: H extension requires priv spec 1.12.0
>>>
>>> This happens because we're checking for priv spec for all CPUs, and
>>> since we're not setting  env->priv_ver for the 'host' CPU, it's being
>>> default to zero (i.e. PRIV_SPEC_1_10_0).
>>>
>>> In reality env->priv_ver does not make sense when running with the KVM
>>> 'host' CPU. It's used to gate certain CSRs/extensions during translation
>>> to make them unavailable if the hart declares an older spec version. It
>>> doesn't have any other use. E.g. OpenSBI version 1.2 retrieves the spec
>>> checking if the CSR_MCOUNTEREN, CSR_MCOUNTINHIBIT and CSR_MENVCFG CSRs
>>> are available [1].
>>>
>>> 'priv_ver' is just one example. We're doing a lot of feature validation
>>> and setup during riscv_cpu_realize() that it doesn't apply KVM CPUs.
>>> Validating the feature set for those CPUs is a KVM problem that should
>>> be handled in KVM specific code.
>>>
>>> The new riscv_cpu_realize_features() helper contains all validation
>>> logic that are not applicable to KVM CPUs. riscv_cpu_realize() verifies
>>> if we're dealing with a KVM CPU and, if not, execute the new helper to
>>> proceed with the usual realize() logic for all other CPUs.
>>>
>>> [1] lib/sbi/sbi_hart.c, hart_detect_features()
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++----------
>>>   1 file changed, 33 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index fb8458bf74..e515dde208 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU 
>>> *cpu)
>>>   }
>>>   #endif
>>> +static bool riscv_running_kvm(void)
>>> +{
>>> +#ifndef CONFIG_USER_ONLY
>>> +    return kvm_enabled();
>>> +#else
>>> +    return false;
>>> +#endif
>>> +}
>>
>> Instead of this, ...
>>
>>> @@ -1369,6 +1370,28 @@ static void riscv_cpu_realize(DeviceState 
>>> *dev, Error **errp)
>>>           }
>>>        }
>>>   #endif
>>> +}
>>> +
>>> +static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    CPUState *cs = CPU(dev);
>>> +    RISCVCPU *cpu = RISCV_CPU(dev);
>>> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>>> +    Error *local_err = NULL;
>>> +
>>> +    cpu_exec_realizefn(cs, &local_err);
>>> +    if (local_err != NULL) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +
>>> +    if (!riscv_running_kvm()) {
>>
>> ... why not simply do:
>>
>>     #ifndef CONFIG_USER_ONLY
>>
>>         if (!kvm_enabled()) {
>>
>>> +        riscv_cpu_realize_features(dev, &local_err);
>>> +        if (local_err != NULL) {
>>> +            error_propagate(errp, local_err);
>>> +            return;
>>> +        }
>>> +    }
>>
>>     #endif
>>
>> ?
> 
> Because a month back, when I first wrote this series, I was getting a 
> lot of
> failed linux-user builds because kvm_enabled() was being called in a 
> linux-user
> context. I got a little tired of it and created this wrapper that included
> the #ifndef.
> 
> After all patches are applied we have 3 places where this function is 
> called.
> There's a chance that some of them are being called in a sysemu emulation
> only and we could make it do with just a kvm_enabled(). I guess it doesn't
> hurt to remove this function and handle each case one by one.

I'd rather that, but as you prefer (can be cleaned later).

>> If riscv_cpu_realize_features() is for all but KVM, then the
>> name isn't ideal.
> 
> I guess we could rename it to riscv_cpu_realize_tcg(). We don't have any 
> other
> accelerators aside from KVM and TCG, and there's a high chance that only 
> TCG would
> care about this code even with other acccelerators in place.
> 
> In fact, this check could also be made with "if (tcg_enabled())" instead of
> !kvm_enabled().This goes in line with a change you posted in qemu-ppc a few
> days ago.

Ah. This comes from a not obvious debugging on ARM where we were
checking for '!kvm_enabled()' instead of 'tcg_enabled()', and QEMU
was misbehaving when using the HVF accelerator.

So better check for the correct accelerator from scratch, in case
some company switch to riscv in few years and add HVF implementation
for riscv ;)

