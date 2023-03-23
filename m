Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfUHh-0003ov-OX
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 19:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfUHg-0003oQ-Vb
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 19:23:52 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pfUHc-0005MO-Oq
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 19:23:51 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17683b570b8so86762fac.13
 for <qemu-riscv@nongnu.org>; Thu, 23 Mar 2023 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679613822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SuDizPkXYGLtbew1xN/iUh+fbg6F4GO1RWCwvLIE7Og=;
 b=ndtTMvD4XuGd5wR/fzDxuv8WEp0Qs3bZPBKzrd70X9vWC/o3Y0Ct07srHdpYNYq79b
 NnnYRavj3ZvnzOz2bKJQqBvO7UP/KiK6uOt1qvSau17vuByjGAUGNCaK1VKt7FtRYOZp
 U37E5TR9n7z6zdrmIwY4xWvLacLg8dnf4Bj8CoN5uLr0lyzWZZ0jTkrYxKuCDoRYp6oL
 S7Lzd0XSTBtyAr+fTC0fE2b9O769+fvt49lB4nHrb1n1oGsu3Kr+nZJGLjIbAqSuGest
 s5EAQdYMU1bJgjhmYArqcmGeXR4fG1pwmJ6UNROaPKdMB9Grq4uQ2wL8eJtZPoMROegi
 GPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679613822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuDizPkXYGLtbew1xN/iUh+fbg6F4GO1RWCwvLIE7Og=;
 b=BeHcorJI+w+5q2dK45DJWO+4tuV1G677/cK0XpD3PwJJQn7/7uOu1IUuGSdY5k6jzv
 drdpE8pAzM6hkA/8FOejtxN5IDOJrC4S2wP2qY78DRcv2N8zDHQe/onVHssbQCFZWQHI
 act+VGhXZiYBko1QAiETx9c39JvbU36/z3lhaiOGal3Dduo6E8wJSJLAyQKxlbI6U8Gp
 GAUc4a0vJiQhgk0UAzEMohN1H8j3UmjSWqWP/iGTbDYxP/93pRDEqDo41dcf2UYSqADA
 /fMF0AnO+7PMGUMnJem4xErxL33pP7OU2U3GZHTDi0Ed0qxQT/D+/HvMaOg98kWbqQww
 yW1w==
X-Gm-Message-State: AAQBX9dsL9Wa7olJzyV495hGlCHjoBZzzIg8B2l4CA53E8kFjiV7+P+a
 jagxZnuNfMduOspjBvfGyrRykg==
X-Google-Smtp-Source: AKy350ZYEfB+yW/1XjUq9MPwIbQ92dYVHYHLeb6uHpidYxs90NsfvcdiE9tnrNJp5SjMg6tqXUeK/A==
X-Received: by 2002:a05:6870:b312:b0:17e:2a10:c2e2 with SMTP id
 a18-20020a056870b31200b0017e2a10c2e2mr680966oao.38.1679613818074; 
 Thu, 23 Mar 2023 16:23:38 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a056830209a00b006a06e7972ebsm44991otq.38.2023.03.23.16.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 16:23:37 -0700 (PDT)
Message-ID: <c84e9446-de00-a305-8935-0ad898029298@ventanamicro.com>
Date: Thu, 23 Mar 2023 20:23:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 11/25] target/riscv/cpu.c: set cpu config in
 set_misa()
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-12-dbarboza@ventanamicro.com>
 <54371a2c-78f2-19a7-7a85-10ad0dec72a7@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <54371a2c-78f2-19a7-7a85-10ad0dec72a7@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Thu, 23 Mar 2023 23:23:53 -0000



On 3/22/23 23:14, LIU Zhiwei wrote:
> 
> On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
>> set_misa() is setting all 'misa' related env states and nothing else.
>> But other functions, namely riscv_cpu_validate_set_extensions(), uses
>> the config object to do its job.
>>
>> This creates a need to set the single letter extensions in the cfg
>> object to keep both in sync. At this moment this is being done by
>> register_cpu_props(), forcing every CPU to do a call to this function.
>>
>> Let's beef up set_misa() and make the function do the sync for us. This
>> will relieve named CPUs to having to call register_cpu_props(), which
>> will then be redesigned to a more specialized role next.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++-----------
>>   target/riscv/cpu.h |  4 ++--
>>   2 files changed, 34 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 36c55abda0..df5c0bda70 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>>   static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>>   {
>> +    RISCVCPU *cpu;
>> +
>>       env->misa_mxl_max = env->misa_mxl = mxl;
>>       env->misa_ext_mask = env->misa_ext = ext;
>> +
>> +    /*
>> +     * ext = 0 will only be a thing during cpu_init() functions
>> +     * as a way of setting an extension-agnostic CPU. We do
>> +     * not support clearing misa_ext* and the ext_N flags in
>> +     * RISCVCPUConfig in regular circunstances.
>> +     */
>> +    if (ext == 0) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * We can't use riscv_cpu_cfg() in this case because it is
>> +     * a read-only inline and we're going to change the values
>> +     * of cpu->cfg.
>> +     */
>> +    cpu = env_archcpu(env);
>> +
>> +    cpu->cfg.ext_i = ext & RVI;
>> +    cpu->cfg.ext_e = ext & RVE;
>> +    cpu->cfg.ext_m = ext & RVM;
>> +    cpu->cfg.ext_a = ext & RVA;
>> +    cpu->cfg.ext_f = ext & RVF;
>> +    cpu->cfg.ext_d = ext & RVD;
>> +    cpu->cfg.ext_v = ext & RVV;
>> +    cpu->cfg.ext_c = ext & RVC;
>> +    cpu->cfg.ext_s = ext & RVS;
>> +    cpu->cfg.ext_u = ext & RVU;
>> +    cpu->cfg.ext_h = ext & RVH;
>> +    cpu->cfg.ext_j = ext & RVJ;
>>   }
>>   #ifndef CONFIG_USER_ONLY
>> @@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
>>   #endif
>>       env->priv_ver = PRIV_VERSION_LATEST;
>> -    register_cpu_props(obj);
> 
> This patch will break the original logic. We can only can a empty CPU here.
> 
>>       /* inherited from parent obj via riscv_cpu_init() */
>>       cpu->cfg.ext_ifencei = true;
>> @@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       CPURISCVState *env = &cpu->env;
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
>> @@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -408,9 +437,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>>       env->priv_ver = PRIV_VERSION_1_11_0;
>>       cpu->cfg.ext_g = true;
>> -    cpu->cfg.ext_c = true;
>> -    cpu->cfg.ext_u = true;
>> -    cpu->cfg.ext_s = true;
> 
> Why specially for these configurations?

Because there is a set_misa() call right before:

set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);

And since set_misa() is now syncing with cpu->cfg these are unneeded. There
are no other cases like that in other cpu_init() functions. I'll make sure to
mention this in the commit message in the next version.

Patch 14 is going to do the same thing for ext_g in this same function.


Thanks,

Daniel

> 
> Zhiwei
> 
>>       cpu->cfg.ext_icsr = true;
>>       cpu->cfg.ext_zfh = true;
>>       cpu->cfg.mmu = true;
>> @@ -472,8 +498,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       CPURISCVState *env = &cpu->env;
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>> -
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>> @@ -492,7 +516,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -510,7 +533,6 @@ static void rv32_ibex_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_11_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> @@ -529,7 +551,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>> -    register_cpu_props(obj);
>>       env->priv_ver = PRIV_VERSION_1_10_0;
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 76f81c6b68..ebe0fff668 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -66,8 +66,8 @@
>>   #define RV(x) ((target_ulong)1 << (x - 'A'))
>>   /*
>> - * Consider updating register_cpu_props() when adding
>> - * new MISA bits here.
>> + * Consider updating set_misa() when adding new
>> + * MISA bits here.
>>    */
>>   #define RVI RV('I')
>>   #define RVE RV('E') /* E and I are mutually exclusive */

