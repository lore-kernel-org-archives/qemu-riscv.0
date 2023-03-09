Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paJ2L-0000E7-Jy
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 11:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJ2J-0000Cs-Fs
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 11:22:35 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJ2H-0001MI-G6
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 11:22:35 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-176e43eb199so2835669fac.7
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678378952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pdNVmNLiYJzPU/9Zqhd0gSUOoNHv8g8h7dpn9x7brA8=;
 b=Tf4BpFc3BexLXeliIRRPY8MaIQSP/9K5mcGueHDMJBQRgY1vljrt/joi7KlaWJ8/Ii
 yHJj/Hn8nOv6rQROvkkL0GZEtxK6B1o1KbABWhMEIZ4dUkGmZ9vJMixzYjAjal72IFBi
 v3Cg7d3tjqbHSP0MZBbOSHi8tHou1ho/AfrImtXx9GIABKKsCkq47NwqpZ27RGGeBFta
 /zZrDLM2QF6TX+lOTLluF0VYNnEoYLVZlFlhKDyT/rmspeW3lQuUD145FyPLk3Ja821A
 DenYmpPCGxTMi/updkBsuw/M5jz2o9Uk+k1KntCU5N1hmYaB2FJLjw1DX+LV9e2zWCBL
 UNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678378952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdNVmNLiYJzPU/9Zqhd0gSUOoNHv8g8h7dpn9x7brA8=;
 b=Mh1PygI6/YymnRPP6CWlJb5++lv1l0NtrlZdHazzPv1h3eSSe6yule37p4ZjnDqFwr
 ht78GQeuiU2ry1f20g042zR2IhJnH44Furn8m2CsiHAxuJxnyPP0xcRPlrwln4Efv0g4
 X07/4G4T++HFS3MIb7f1es+VEf3A90A1G3nk9vHqal+JoRVUFgQZFPERpUztSjkR+/Cg
 4dd0KrneqiK2YcP8JNfPj2KGmnWGnfsTP3xRjlXqIyxpUeanwAZHXhyWnEzWQXTA9aJe
 6DnyAkVsvPkv42+iMvMX0XN7zre7sYrbaFaYmvF2DHYyUZQTBYcDmZHYHtFQa4r7iKJv
 yXYw==
X-Gm-Message-State: AO0yUKUgKOx08BTPmQRLU5AgiK8tvSYaZLXK55ndXuQfrVDfcoALS9I0
 u1+bU5ZBDLV1l1yTEyL44koPXQ==
X-Google-Smtp-Source: AK7set9dYt1N+/BFnWmVQS6i77x7KGOcxBF15f3MUdljjpbrjp0R8tyn6rxI7c9D7zQUIglwNDNHYg==
X-Received: by 2002:a05:6870:c6a9:b0:172:36bf:e281 with SMTP id
 cv41-20020a056870c6a900b0017236bfe281mr14453700oab.23.1678378952028; 
 Thu, 09 Mar 2023 08:22:32 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 du41-20020a0568703a2900b001764b4a05f6sm7450748oab.39.2023.03.09.08.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:22:31 -0800 (PST)
Message-ID: <34d490d3-0444-e312-a125-3c2b9d3220e1@ventanamicro.com>
Date: Thu, 9 Mar 2023 13:22:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 03/17] target/riscv/cpu.c: remove
 set_priv_version()
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-4-dbarboza@ventanamicro.com>
 <9bb69365-f291-8515-2afa-1792998601b8@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <9bb69365-f291-8515-2afa-1792998601b8@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 16:22:35 -0000



On 3/9/23 04:28, LIU Zhiwei wrote:
> 
> On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
>> The setter is doing nothing special. Just set env->priv_ver directly.
> IMHO, No better than the older implementation.

In the current context having a setter means that the function is doing
something else other than simply setting the attr. Because we're setting a
lot of other 'env' attrs directly: env->pc, env->priv, env->menvcfg and
so on. So a setter is a special function (e.g. set_misa()).

But then set_priv_version() and set_vext_version() are just setting
env->priv_ver/env->vext_version and nothing else. This means that every
time we read

"set_priv_version(env, val)"

We're either required to remember that this is just a simple setter or we spend
a few seconds looking it up to see that it's a simple setter. We could, instead,
just read

"env->priv_ver = val"

and moved on.


I really think we should get rid of all these kind of setters in the code. It's not
like these are user facing APIs that needs encapsulation.


Thanks,


Daniel



> 
> Zhiwei
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 30 +++++++++++++-----------------
>>   1 file changed, 13 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 0baed79ec2..964817b9d2 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>>       env->misa_ext_mask = env->misa_ext = ext;
>>   }
>> -static void set_priv_version(CPURISCVState *env, int priv_ver)
>> -{
>> -    env->priv_ver = priv_ver;
>> -}
>> -
>>   #ifndef CONFIG_USER_ONLY
>>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
>>   {
>> @@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
>>                                       VM_1_10_SV32 : VM_1_10_SV57);
>>   #endif
>> -    set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    env->priv_ver = PRIV_VERSION_1_12_0;
>>       register_cpu_props(obj);
>>   }
>> @@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV64, 0);
>>       register_cpu_props(obj);
>>       /* Set latest version of privileged specification */
>> -    set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    env->priv_ver = PRIV_VERSION_1_12_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>>   #endif
>> @@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>>   #endif
>> @@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    env->priv_ver = PRIV_VERSION_1_10_0;
>>       cpu->cfg.mmu = false;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>> -    set_priv_version(env, PRIV_VERSION_1_11_0);
>> +    env->priv_ver = PRIV_VERSION_1_11_0;
>>       cpu->cfg.ext_g = true;
>>       cpu->cfg.ext_c = true;
>> @@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV128, 0);
>>       register_cpu_props(obj);
>>       /* Set latest version of privileged specification */
>> -    set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    env->priv_ver = PRIV_VERSION_1_12_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>>   #endif
>> @@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV32, 0);
>>       register_cpu_props(obj);
>>       /* Set latest version of privileged specification */
>> -    set_priv_version(env, PRIV_VERSION_1_12_0);
>> +    env->priv_ver = PRIV_VERSION_1_12_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>>   #endif
>> @@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>>   {
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>> +
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>>   #endif
>> @@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    env->priv_ver = PRIV_VERSION_1_10_0;
>>       cpu->cfg.mmu = false;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_11_0);
>> +    env->priv_ver = PRIV_VERSION_1_11_0;
>>       cpu->cfg.mmu = false;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>>       register_cpu_props(obj);
>> -    set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    env->priv_ver = PRIV_VERSION_1_10_0;
>>       cpu->cfg.mmu = false;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -1159,7 +1155,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>       }
>>       if (priv_version >= PRIV_VERSION_1_10_0) {
>> -        set_priv_version(env, priv_version);
>> +        env->priv_ver = priv_version;
>>       }
>>       /* Force disable extensions if priv spec version does not match */

