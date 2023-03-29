Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phXYV-0005ms-U8
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 11:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phXYU-0005mJ-3t
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 11:17:42 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phXYS-00061N-7P
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 11:17:41 -0400
Received: by mail-oi1-x229.google.com with SMTP id w133so11836672oib.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680103057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2wAs1Bt4Ldoicm0vdFjv3+AAh4pAPL1kVD7oGWDw6A=;
 b=TKQ8mIzGj1S3cfr28SbdRMIz0cyfwNPyUBVBICZkgYtkTG4lvrlwtPnULkWCejPzZe
 7hIUB6h4AhaKDHwMUJ/TYg3yoFrb+2D4Nfztz3rszzu68H6AHjGkgrWWZ9f+VRulyZr3
 Fk+wGpdCs4jQwYPpfE4QPlMxdoB2jbsLw0I+2EkjR7Z5uqy288lVP7fw7FQ8DWWDm9cs
 ruIGsFPYHmoSg4cOsHM480IZXs7tk/6rxMDvbaNGEr4TJiim83QrYgKtIFRdS7h5rs3f
 4oep4cVMSmvfFiptNKKo77xBZnDTpOAb/pw8BEwRbOE/4eppXneV02faDmESAtWijZS5
 uMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2wAs1Bt4Ldoicm0vdFjv3+AAh4pAPL1kVD7oGWDw6A=;
 b=TEcdwE1dXQrYGmKTR72RMUwGqZEtxGqTd9bg+DskWThdsS4CV6+3+rRXNGnAJKsSzU
 DS3ic1Wa/yaAk5wn1gklvtoQVrg/gPUvNKYw29uk3tA9Y96alZ2phZtrWF3lW+zc10dP
 4KpuzIs0WIHZms5hlm4+GbPXG9I8ri6djQl8Lfiy+80QxDcJGtO3bQ4EtB2RahGnq2rI
 VY2VVTsnZOlWj6ptloqXTXSVVUOYkUi5w9zFQnsXuPUpXSkb97Th1icSwrLZekPkUEll
 99vuxIGKaAB4zy5hLpEOBS04RokaWATKUwqONUdX+EjSxjpl0J0aIXZ99g2nGsQPgVC9
 rbDg==
X-Gm-Message-State: AAQBX9eVl6PUZkshGweFWCK7WCJX0F+sM2U29wlVtFiYPRRIytGDv/aY
 T97C2W0aE8IezuFnbb2tup/TuA==
X-Google-Smtp-Source: AKy350Y7tq171wfC6PpIJx5QEOth1T/vx7af//J9DiYMsR+pokqDPz/muMekquEX2kepXkerzHTa1w==
X-Received: by 2002:a05:6808:3a95:b0:389:2a69:72b7 with SMTP id
 fb21-20020a0568083a9500b003892a6972b7mr5255053oib.16.1680103056840; 
 Wed, 29 Mar 2023 08:17:36 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a0568080bc200b00386a2019ab6sm13505128oik.30.2023.03.29.08.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:17:36 -0700 (PDT)
Message-ID: <e263afd5-1fb8-31b8-5e11-e8a5772ca76b@ventanamicro.com>
Date: Wed, 29 Mar 2023 12:17:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/19] target/riscv: remove MISA properties from
 isa_edata_arr[]
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
 <20230327224934.363314-3-dbarboza@ventanamicro.com>
 <4464e2e6-278f-5031-b358-fab35a37b927@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <4464e2e6-278f-5031-b358-fab35a37b927@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 15:17:42 -0000



On 3/29/23 05:32, liweiwei wrote:
> 
> On 2023/3/28 06:49, Daniel Henrique Barboza wrote:
>> The code that disables extensions if there's a priv version mismatch
>> uses cpu->cfg.ext_N properties to do its job.
>>
>> We're aiming to not rely on cpu->cfg.ext_N props for MISA bits. Split
>> the MISA related verifications in a new function, removing it from
>> isa_edata_arr[].
>>
>> We're also erroring it out instead of disabling, making the cpu_init()
>> function responsible for running an adequate priv spec for the MISA
>> extensions it wants to use.
>>
>> Note that the RVV verification is being ignored since we're always have
>> at least PRIV_VERSION_1_10_0.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 2711d80e16..21c0c637e4 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -72,10 +72,11 @@ struct isa_ext_data {
>>    * 4. Non-standard extensions (starts with 'X') must be listed after all
>>    *    standard extensions. They must be separated from other multi-letter
>>    *    extensions by an underscore.
>> + *
>> + * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
>> + * instead.
>>    */
>>   static const struct isa_ext_data isa_edata_arr[] = {
>> -    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>> -    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
> 
> If misa properties are removed from here,  the multi_letter field in isa_edata_arr will be redundant.
> 
> We can just remove it. Otherwise, the all patchset is LGTM.

Good point. I'll remove it.

> 
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>


Thanks!


Daniel

> 
> Weiwei Li
> 
>>       ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
>>       ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
>>       ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
>> @@ -1131,6 +1132,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
>>       env->misa_ext = env->misa_ext_mask = ext;
>>   }
>> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>> +{
>> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
>> +        error_setg(errp, "H extension requires priv spec 1.12.0");
>> +        return;
>> +    }
>> +}
>> +
>>   static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>   {
>>       CPUState *cs = CPU(dev);
>> @@ -1174,6 +1183,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>        */
>>       riscv_cpu_sync_misa_cfg(env);
>> +    riscv_cpu_validate_misa_priv(env, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>>       /* Force disable extensions if priv spec version does not match */
>>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>           if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> 

