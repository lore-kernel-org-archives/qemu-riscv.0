Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppp3y-00029a-Ca
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 07:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppp3x-00029C-6g
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 07:36:25 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppp3v-0000HH-5q
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 07:36:24 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-38dee9a7795so682088b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682076981; x=1684668981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9BLG/9HcuGxwZaQCc42sjcmehGj1QEEM2G31hv+uJo=;
 b=Aqzsz9sJLjMqQFdT5WxXs4lP0yTvLxmoJQzJFDLJejzzw1XlSEdFoJ/70iDu6RIZb2
 tt00Fb4VFRYseFew5blps22DkVLdE41i8baIbpSNdugvrTBm/1ruzcF8v+/GgMFiX/E0
 UZ58yerpSJbcxYFEOkkSSgYxyIHEf9eDY/5+EsygNsXNqmgQbJpHtV3q5vHvo92hhq03
 uyJdrH8X70pOPw+3XyGA4rIu7DwGQnQEZJnWmowc1ZnGRDqb+OICPCVdrCiqrOQknxat
 BTjaDk0/W17ehdzCy0Ml0LZQSPnyrDm/CP2uYj+Af1z+WIFwmEEmYbQqc341YwyfckH0
 hwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682076981; x=1684668981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9BLG/9HcuGxwZaQCc42sjcmehGj1QEEM2G31hv+uJo=;
 b=FAAvAS6vfGnLmP5ZnEhTa7x4IyM1OQgFgS+vdok/v+f5tMqso3JPiV3G5Z9rODxBPH
 Hg5xBRITT67rC07dWYc4zpizYl5zyREGuMFZ1Fw07q2NLhEdLew1X6fN/F/XPDBGL+w3
 WZn5Ur+iFRYbpvXAhV/9ZDM/Ir+v5kLunF51iOXF6H7vyLcZ354sc580CrF+A05PZ413
 4OZtGO1dUx9hSFYCJQh/0g2m4xQ4otg9VvO6fXye388KtOdXw/UA+8C//VU20CcwPDAo
 Ou+VRumF+fAVFe0WJZqPSa31S3XiHxic7zieo+bUAbWfQWtunr2hfFmE8eYslmhoVlhA
 5PfQ==
X-Gm-Message-State: AAQBX9fE0cKsTgdEKiOIm/B40ig0ZXbMUVTfPQnNEmgjQHT4UYDO+dpr
 kY5bzuqRQa1gGfBBo8DnWrhjPg==
X-Google-Smtp-Source: AKy350YiR3U+nnzcCRzyFtForPth9TufswsLoRH/ei0rG62MOjIgA2idD66BexnGPsEEZkMChPnmYg==
X-Received: by 2002:a05:6808:1a26:b0:387:266e:1624 with SMTP id
 bk38-20020a0568081a2600b00387266e1624mr2906101oib.39.1682076981463; 
 Fri, 21 Apr 2023 04:36:21 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 p205-20020acaf1d6000000b00386eff32f58sm1570910oih.13.2023.04.21.04.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 04:36:21 -0700 (PDT)
Message-ID: <dfaad783-bddb-64a1-72c7-da4b7ab71349@ventanamicro.com>
Date: Fri, 21 Apr 2023 08:36:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v7 12/12] target/riscv: forbid write_misa() for
 static CPUs
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
 <20230420092100.177464-13-dbarboza@ventanamicro.com>
 <CAKmqyKPX4ThJkWfyoTmVoCtcwGdPYONYqdMLAXUGzOb+9T=ggw@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKPX4ThJkWfyoTmVoCtcwGdPYONYqdMLAXUGzOb+9T=ggw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
X-List-Received-Date: Fri, 21 Apr 2023 11:36:25 -0000



On 4/20/23 20:48, Alistair Francis wrote:
> On Thu, Apr 20, 2023 at 7:22 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Static CPUs don't want their extensions changed by user interaction. We
>> can prevent it during init by not exposing user facing properties, but
>> write_misa() is also capable of disabling/enabling extension during
>> runtime.
>>
>> We have a way of telling whether a CPU is static or not by checking for
>> TYPE_RISCV_DYNAMIC_CPU. Use it to make write_misa() a no-op for these
>> CPUs.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 5 +++++
>>   target/riscv/cpu.h | 2 ++
>>   target/riscv/csr.c | 5 +++++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 4fa720a39d..3cbcf6d320 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1452,6 +1452,11 @@ static void riscv_cpu_init(Object *obj)
>>   #endif /* CONFIG_USER_ONLY */
>>   }
>>
>> +bool riscv_cpu_is_static(RISCVCPU *cpu)
>> +{
>> +    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYNAMIC_CPU) == NULL;
>> +}
>> +
>>   typedef struct RISCVCPUMisaExtConfig {
>>       const char *name;
>>       const char *description;
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 1f39edc687..1913ab9d8d 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -587,6 +587,8 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>
>> +bool riscv_cpu_is_static(RISCVCPU *cpu);
>> +
>>   #include "exec/cpu-all.h"
>>
>>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index d449da2657..929c5477dd 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1391,6 +1391,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>       uint32_t orig_misa_ext = env->misa_ext;
>>       Error *local_err = NULL;
>>
>> +    if (riscv_cpu_is_static(cpu)) {
>> +        /* never write MISA for static CPUs */
>> +        return RISCV_EXCP_NONE;
>> +    }
> 
> Do we actually need this? We already check misa_w which would be
> disabled. What's the harm in allowing someone to manually enable
> misa_w and then change the MISA?
> 
> Also, it's possible that static CPUs actually support changing the
> MISA value at run time.

That's all valid points. I believe it's ok to drop this patch to allow
for static CPUs to have more flexibility in the future. We're still have
misa_w.


Thanks,

Daniel

> 
> Alistair
> 
>> +
>>       if (!riscv_cpu_cfg(env)->misa_w) {
>>           /* drop write to misa */
>>           return RISCV_EXCP_NONE;
>> --
>> 2.40.0
>>
>>

