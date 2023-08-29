Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0563DC71153
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 13:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qayZr-0002BS-IV; Tue, 29 Aug 2023 09:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qayZo-00028M-7Q
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 09:16:12 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qayZj-0000V5-Eo
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 09:16:10 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1d0d3d40124so194686fac.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693314965; x=1693919765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x29g9NjIG8Vvnom/ZSmXbnn29dsJLv83xMLgsW7L9WA=;
 b=XSJG7hBhj5fff+ZPpCJ0R391UBMKoJdoNMHzCJeRz+PBaAKPiIgEzRhKB5TdESd9Pv
 u4/H3FpgsJVx+kMORICzPDKOtegaHD5MOFr2Cwjbua67/RIaBUEao0tiNjIB6JfPzQ2m
 t4FGL4DENRr9NUoSxb9jdh1cT0pKG+N1BCLxNEB4rIJqPzC8urZJXljuJMWiHx4XYpVN
 swdc4MgbQlBkn3Zm8rEK9JCVsrnZY/C+mG69BijUcOqYfAxVzE1sEjFYwMFq981boLPg
 4/41Vo6VtWfKSuB0IGZ4fYOtUqTZAHME7jRQjiY4WB8d5GjBh38tZcAKwC6T1dkh+lGT
 ZX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693314965; x=1693919765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x29g9NjIG8Vvnom/ZSmXbnn29dsJLv83xMLgsW7L9WA=;
 b=QJizR6X3OSmhJkaY3HZ4HXzxlw+mD2tpj/q+PNu/MDp1nAQTF4YNz624bR+OnaeDvH
 +urCqyeIN4AQtVEgE8As+9Cn1NwML/ook5EDOv6K/AfsN5x4J3SFJs2MtAIouft00Obe
 vyCCsNwjci3gR/eN0qBhFOmR42ZprDgEANnSy7wDZcI3elzm4qd08bc0copWEY0/35th
 D9YMriA2L9S+X613GqXB1XI5CkOxuhvWHbBxKWfNBvH1tSCoJW1TOLsQJA5ODjB3zq8f
 rVgkOAicII5gs8/Om4m8fh9Gbf0gjGhpUHY6kcjc57kAPatbnMTHX5thMhgDXbNh/rKK
 Zf3g==
X-Gm-Message-State: AOJu0YyXSOCFsAWT3x6LCN6/RDcHs0w7+slGPSJ+YQ0nZIaka546FmFJ
 5FAKR7ie1Veeha2qTtbbfn2nCg==
X-Google-Smtp-Source: AGHT+IFKkn4g0RS60OegR3VbZf0hkVuLTX5XSuYklz1V5FYvnDmgLYMY1jIkW11Gji06IICq9hX+Bg==
X-Received: by 2002:a05:6871:553:b0:1c4:d735:38e9 with SMTP id
 t19-20020a056871055300b001c4d73538e9mr14981792oal.57.1693314965650; 
 Tue, 29 Aug 2023 06:16:05 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056870538500b001babd036460sm5475116oan.19.2023.08.29.06.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 06:16:05 -0700 (PDT)
Message-ID: <f58ac06f-ec38-0814-748f-9ce2b36b644d@ventanamicro.com>
Date: Tue, 29 Aug 2023 10:16:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/20] target/riscv: introduce KVM AccelCPUClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-12-dbarboza@ventanamicro.com>
 <ce33b3b2-564e-a8c5-dfc8-ae7f6644dc88@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ce33b3b2-564e-a8c5-dfc8-ae7f6644dc88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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



On 8/28/23 13:38, Philippe Mathieu-Daudé wrote:
> On 25/8/23 15:08, Daniel Henrique Barboza wrote:
>> Add a KVM accelerator class like we did with TCG. The difference is
>> that, at least for now, we won't be using a realize() implementation for
>> this accelerator.
>>
>> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
>> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
>> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
>> through the 'cpu_instance_init' impl of the current acceleration (if
>> available) and execute it. The end result is that the KVM initial setup,
>> i.e. starting registers and adding its specific properties, will be done
>> via this hook.
>>
>> riscv_cpu_add_user_properties() is still being called via the common
>> post_init() function, thus we still need the "if kvm then return" logic
>> inside it for now. We'll deal with it when TCG accel class get its own
>> 'cpu_instance_init' implementation.
>>
>> riscv_add_satp_mode_properties() is now being exported from cpu.c since
>> it's a common helper between KVM and TCG.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c       |  8 ++---
>>   target/riscv/cpu.h       |  1 +
>>   target/riscv/kvm.c       | 64 +++++++++++++++++++++++++++-------------
>>   target/riscv/kvm_riscv.h |  1 -
>>   4 files changed, 49 insertions(+), 25 deletions(-)
> 
> 
>> -static void riscv_add_satp_mode_properties(Object *obj)
>> +void riscv_add_satp_mode_properties(Object *obj)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>> @@ -1199,6 +1199,8 @@ static void riscv_cpu_post_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
>> +    accel_cpu_instance_init(CPU(obj));
>> +
>>       if (rcc->user_extension_properties) {
>>           riscv_cpu_add_user_properties(obj);
>>       }
>> @@ -1561,12 +1563,10 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>>   static void riscv_cpu_add_user_properties(Object *obj)
>>   {
>>   #ifndef CONFIG_USER_ONLY
>> -    riscv_add_satp_mode_properties(obj);
>> -
>>       if (kvm_enabled()) {
>> -        kvm_riscv_cpu_add_kvm_properties(obj);
>>           return;
>>       }
> 
> Maybe in a preliminary patch:
> 
> if (tcg_enabled()) {
> 
>> +    riscv_add_satp_mode_properties(obj);
> 
> }
> 
> then remove the 'if kvm_enabled' in this patch?

I'll add a preliminary patch to make kvm_riscv_cpu_add_kvm_properties() call
riscv_add_satp_mode_properties() and change the order they're being called here
(i.e. call kvm_riscv_cpu_add_kvm_properties() first). Then this patch can safely
remove the 'if kvm_enabled' block as you suggested.


Thanks,

Daniel


> 
>>   #endif
> 

