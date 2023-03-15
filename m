Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcRX8-00070Y-27
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 09:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pcRX1-0006yt-Uu
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 09:51:09 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pcRWx-0007UF-9A
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 09:51:07 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-176261d7f45so21070199fac.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678888261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2k4sr4j8b+mF7443MmU+SOoOlYwUwn7x8Qg69xt6F+E=;
 b=J6hKUBccT1k9Poihlfoz9oX5/rxUD+oES6C52BBnPlxNuA4pH0CQ53XbnqZ2VwPJrn
 7UhYoyzLXiN0gLJw3wvTKgsDJmcZhnRLrlDiZYLuxBZIscAhtz350lYPS3xY1BbOe1/3
 a0r5JiTiUq9fHKwusVTPc6SeJId/61UyHTPmqgZXgESmR4S7oV8JUrSf+bbmdr9nCVWz
 rK9nzn77aW2+ejUjDKqp9/ZRjqvYh+GbWG2XV+5nk36mABAXBGJatlcxFVlPcsaVidYL
 XqNig75AhDjs6O6u35X4mTCWgzjRQqKwLUvJsGFpRpsMjeffKrRjK6Ehm2DqMnQBuORC
 EqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678888261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2k4sr4j8b+mF7443MmU+SOoOlYwUwn7x8Qg69xt6F+E=;
 b=dmlUjb1tTXSatmjYgtki906iokjDZ93WYpbeVLazBENFfCi7y9BNs/CYTcSZUBPRzY
 TH8cUQziuoSmvGIr3xKTouhCYz7o5nGIsv/KN75ZCAgsD65gntNsMeHnitawjzNmrc3J
 tUg1Bxarl/xNPyGI8qgKOMSxKYcIqdCESRJYgJhwhm+Mk8Caxgg8V412urdE2RiZca0o
 jYQjUeZhhwMjFYmjSZAhCRh9Urc8Na6MmkS4UBwpDmqBc7aaFeFVTNmKSxB8jsUP2NUy
 xGd2ICJZRskFRcmLCArkMLL5OfEGrDH7UmbFrm/oEos2WHULwvh5230PK8+6yM2HDNik
 artQ==
X-Gm-Message-State: AO0yUKW3bm/lMYZEXfmH+z2i/ydYqIkOsu6dzBVLRS5JlCfuFqsPBtRL
 Tr2bFFKjlL22uYATe/A2J8j/oA==
X-Google-Smtp-Source: AK7set/eM5vJsl12M4lzsZ7dJWhcI3+SYe4r4TxTlz3UyoRVCc8mmVhisouyBnCgC/weakQKTH4CIQ==
X-Received: by 2002:a05:6870:7389:b0:17a:afa8:94a with SMTP id
 z9-20020a056870738900b0017aafa8094amr1198708oam.0.1678888261542; 
 Wed, 15 Mar 2023 06:51:01 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 x206-20020acae0d7000000b00383eaea5e88sm2165489oig.38.2023.03.15.06.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 06:51:01 -0700 (PDT)
Message-ID: <2a13891e-9b5e-fc3c-308c-7d5b6eb0cfa0@ventanamicro.com>
Date: Wed, 15 Mar 2023 10:50:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v2 16/26] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-17-dbarboza@ventanamicro.com>
 <dbb76e1d-112f-1de0-211d-8d0762757ac3@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <dbb76e1d-112f-1de0-211d-8d0762757ac3@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 15 Mar 2023 13:51:10 -0000



On 3/15/23 01:43, liweiwei wrote:
> 
> On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
>> We can set all RVG related extensions during realize time, before
>> validate_set_extensions() itself. It will also avoid re-enabling
>> RVG via write_misa() when the CSR start to using the same validation
>> code realize() does.
>>
>> Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
>> of just setting cfg->ext_N. The intention here is to start syncing all
>> misa_ext operations with its cpu->cfg flags, in preparation to allow for
>> the validate function to operate using a misa_ext. This doesn't make any
>> difference for the current code state, but will be a requirement for
>> write_misa() later on.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 55 +++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 48ad7372b9..133807e39f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -281,6 +281,42 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>>       return ext;
>>   }
>> +static void riscv_set_G_virt_ext(RISCVCPU *cpu)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    RISCVCPUConfig *cfg = &cpu->cfg;
>> +
>> +    if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
>> +          cfg->ext_f && cfg->ext_d &&
>> +          cfg->ext_icsr && cfg->ext_ifencei)) {
>> +
>> +        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>> +        cfg->ext_i = true;
>> +        env->misa_ext |= RVI;
>> +
>> +        cfg->ext_m = true;
>> +        env->misa_ext |= RVM;
>> +
>> +        cfg->ext_a = true;
>> +        env->misa_ext |= RVA;
>> +
>> +        cfg->ext_f = true;
>> +        env->misa_ext |= RVF;
>> +
>> +        cfg->ext_d = true;
>> +        env->misa_ext |= RVD;
>> +
>> +        cfg->ext_icsr = true;
>> +        cfg->ext_ifencei = true;
>> +
>> +        /*
>> +         * Update misa_ext_mask since this is called
>> +         * only during riscv_cpu_realize().
>> +         */
>> +        env->misa_ext_mask = env->misa_ext;
>> +    }
> 
> Another two question:
> 
> - whether we should set 'G' when all these extensions are supported?

As far as I can tell, no. RVG is being treated as a shortcut to enabled this set of
extensions, but it doesn't mean that if the user happens to chose them manually we
should enable RVG.

> 
> - whether 'G'should be disabled if some of the extensions are disabled by write_misa?

Good point. Yes, we would need to disable RVG if RVG is enabled in the hart but
then another letter extension to the group (I,M,A F or D) is disabled. Which is
something that isn't being handled now.

A simple solution is, in patch 15,  forbid IMAFD to be disabled if RVG is already
set.

In fact, this kind of logic is something that we would need to do for the future
profile extension, so in a way RVG is being handled almost like a profile now.


Thanks,


Daniel




> 
> Regards,
> 
> Weiwei Li
> 
>> +}
>> +
>>   static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>>                                          uint32_t misa_ext)
>>   {
>> @@ -1036,21 +1072,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>> -    /* Do some ISA extension error checking */
>> -    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>> -                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
>> -                            cpu->cfg.ext_d &&
>> -                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
>> -        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>> -        cpu->cfg.ext_i = true;
>> -        cpu->cfg.ext_m = true;
>> -        cpu->cfg.ext_a = true;
>> -        cpu->cfg.ext_f = true;
>> -        cpu->cfg.ext_d = true;
>> -        cpu->cfg.ext_icsr = true;
>> -        cpu->cfg.ext_ifencei = true;
>> -    }
>> -
>>       if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>>           error_setg(errp,
>>                      "I and E extensions are incompatible");
>> @@ -1313,6 +1334,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>> +    if (cpu->cfg.ext_g) {
>> +        riscv_set_G_virt_ext(cpu);
>> +    }
>> +
>>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>>       if (local_err != NULL) {
>>           error_propagate(errp, local_err);
> 

