Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7DAC7EE23
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6zuI-0001sW-L8; Wed, 07 Jun 2023 16:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6zuG-0001rY-NG
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 16:37:25 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6zuE-0006mc-Ig
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 16:37:24 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-55b069a7cf4so1844521eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686170239; x=1688762239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jV1JIUQvQQ1YUjEO0x2SgDRsOmFkbrDHJ18fm8TtVqo=;
 b=D1VN4t+o35uaHYrK0LMl0XehtiVsg0bnl8PJXHLEEvyCdd68i2JiV9qN99l89hCwFX
 uIVS6thlq+F4PahdJSJk3q7wYoruPAOfmTWetr547eZxsMdZIGLseNi+REshK5Krk/+D
 77AMRApx2RogMKsRdxdRrt3ZdNKoRbLvOjTQe/+g4iCu4wYohDNav5/3IT/XiAhW3BKS
 HyY5hEn70hy8DUig3hLFKW2bY+cmo9BrFhVCpBukm+iyuoa/ivYfm8Arm7NaugrFf9is
 jWr4jzN1UCXwA9tBJDGCxLhij3rrtsdIhJt8PZ8WzQmWh+hHIBTv0L8jUDSNMeqLYE21
 aLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686170239; x=1688762239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jV1JIUQvQQ1YUjEO0x2SgDRsOmFkbrDHJ18fm8TtVqo=;
 b=MnFVQ3Tq6AN1vVPDvx6xmTl4EBJt3Og0l1ZLVoeBu0rQPUZup92o7ZyNcvR8XwwfSQ
 5/kk1wnChfXhe/JzIP9I4E7EujN8FQT4jLuzl4BkchHTq3FkoGGf5Wcb/4Ig/uzGMCSA
 T3JveOzlDQ4K71BNS9UVLkO5hn5oSpNMVpUNz4p5lHQdtz+cbQK+6g6p/rAI9YE2juiO
 HEw1JdmBog32Ee7OAQrfMd6nk5ngNf2zSfI4KAyOsh9gFhsprCRQvM1fYkWCHB8sVzi6
 kFgBW4H0xGrPTxAn27YU01N7/HN4QwxtUbhkwe0aEbFOUjWtYEqe4pmrUYnQfNJq2y5V
 FRhg==
X-Gm-Message-State: AC+VfDxyn6s/t7NCUxlSJ5bA7QGg9ZIJ8mf/oO8DXo2wYyQGFwuJJToO
 gvx6LWK9pFv3fyRsw2flGDXzrw==
X-Google-Smtp-Source: ACHHUZ43O3nIGIg1tbAanVjO2gV7hjG00dpHU8FkWXl8hG6VpQMl8hnEaGUnLRYdhSb8TULlEq0+NQ==
X-Received: by 2002:a4a:ca05:0:b0:558:cb7e:c52e with SMTP id
 w5-20020a4aca05000000b00558cb7ec52emr4955480ooq.8.1686170239571; 
 Wed, 07 Jun 2023 13:37:19 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 fa21-20020a0568082a5500b003896e31867esm1121620oib.49.2023.06.07.13.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 13:37:19 -0700 (PDT)
Message-ID: <34f72e57-3b3f-7da4-1fc9-8af464ee6c99@ventanamicro.com>
Date: Wed, 7 Jun 2023 17:37:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/16] target/riscv/kvm.c: read/write
 (cbom|cboz)_blocksize in KVM
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-17-dbarboza@ventanamicro.com>
 <20230607-95d85b924e7d8696ba1eac6e@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230607-95d85b924e7d8696ba1eac6e@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 6/7/23 10:01, Andrew Jones wrote:
> On Tue, May 30, 2023 at 04:46:23PM -0300, Daniel Henrique Barboza wrote:
>> If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
>> Linux Kernel will fail to detect the availability of the CBOM/CBOZ
>> extensions, regardless of the contents of the 'riscv,isa' DT prop.
>>
>> The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
>> so let's use them. We'll also expose them as user flags like it is
>> already done with TCG.
>>
>> However, in contrast with what happens with TCG, the user is not able to
>> set any value that is different from the 'host' value. And KVM can be
>> harsh dealing with it: a ENOTSUPP can be thrown for the mere attempt of
>> executing kvm_set_one_reg() for these 2 regs.
>>
>> We'll read the 'host' value and use it to set these values, regardless of
>> user choice. If the user happened to chose a different value, error out.
>> We'll also error out if we failed to read the block sizes.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/kvm.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 92 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>> index 92b99fe261..7789d835e5 100644
>> --- a/target/riscv/kvm.c
>> +++ b/target/riscv/kvm.c
>> @@ -241,8 +241,16 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
>>                               uint32_t val)
>>   {
>>       int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
>> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +    uint16_t *blocksize;
>> +    bool *ext_enabled;
>>   
>> +    if (strstr(multi_ext->name, "blocksize")) {
>> +        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
>> +        *blocksize = val;
>> +        return;
>> +    }
> 
> We should add 'get' accessors to each property and then always use those
> accessors to get the values. Trying to share a single accessor across
> properties, using the names to determine their sizes, is basically trying
> to reinvent 'get' without the function pointer.

To be honest we don't need all this machinery for the blocksize attributes.
We check them only in a few cases and could access them directly via cpu->cfg.

I'll change this up in v2.


Daniel

> 
>> +
>> +    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>>       *ext_enabled = val;
>>   }
>>   
>> @@ -250,8 +258,15 @@ static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>>                                   RISCVCPUMultiExtConfig *multi_ext)
>>   {
>>       int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
>> -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +    uint16_t *blocksize;
>> +    bool *ext_enabled;
>>   
>> +    if (strstr(multi_ext->name, "blocksize")) {
>> +        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
>> +        return *blocksize;
>> +    }
>> +
>> +    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>>       return *ext_enabled;
>>   }
>>   
>> @@ -295,6 +310,33 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>>       kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>>   }
>>   
>> +/*
>> + * We'll avoid extra complexity by always assuming this
>> + * array order with cbom first.
>> + */
>> +static RISCVCPUMultiExtConfig kvm_cbomz_blksize_cfgs[] = {
> 
> Hmm, yet another cfg struct type, and this one is specific to block sizes.
> I'd rather we find a way to keep cfg definitions more general and then use
> the same struct for all.
> 
>> +    {.name = "cbom_blocksize", .cpu_cfg_offset = CPUCFG(cbom_blocksize),
>> +     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)},
>> +    {.name = "cboz_blocksize", .cpu_cfg_offset = CPUCFG(cboz_blocksize),
>> +     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)},
>> +};
>> +
>> +static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
>> +                                      const char *name,
>> +                                      void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMultiExtConfig *cbomz_size_cfg = opaque;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    uint16_t value;
>> +
>> +    if (!visit_type_uint16(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    cbomz_size_cfg->user_set = true;
>> +    kvm_cpu_cfg_set(cpu, cbomz_size_cfg, value);
>> +}
>> +
>>   static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>>   {
>>       CPURISCVState *env = &cpu->env;
>> @@ -321,6 +363,45 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>>       }
>>   }
>>   
>> +static void kvm_riscv_finalize_features(RISCVCPU *cpu, CPUState *cs)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    uint64_t id, reg;
>> +    int i, ret;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
>> +        RISCVCPUMultiExtConfig *cbomz_cfg = &kvm_cbomz_blksize_cfgs[i];
>> +        uint64_t host_val;
>> +
>> +        if ((i == 0 && !cpu->cfg.ext_icbom) ||
>> +            (i == 1 && !cpu->cfg.ext_icboz)) {
> 
> Rather than the required array order and this magic index stuff, we can
> just save the offset of the ext_* boolean in the cfg structure, like we
> already do for the *_blocksize, and then check it here.
> 
> Also, I think we want to warn here if cbomz_cfg->user_set is set. If the
> user set some block size, but disabled the extension, then they should be
> told that the block size will be ignored. Letting them know it's ignored
> is particularly good to do since we're not validating it. I.e. the user
> shouldn't assume the block size they put there is worth anything at all.
> 
>> +            continue;
>> +        }
>> +
>> +        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
>> +                              cbomz_cfg->kvm_reg_id);
>> +
>> +        ret = kvm_get_one_reg(cs, id, &host_val);
>> +        if (ret != 0) {
>> +            error_report("Unable to read KVM reg val %s, error %d",
>> +                         cbomz_cfg->name, ret);
>> +            exit(EXIT_FAILURE);
>> +        }
>> +
>> +        if (cbomz_cfg->user_set) {
>> +            reg = kvm_cpu_cfg_get(cpu, cbomz_cfg);
>> +            if (reg != host_val) {
>> +                error_report("Unable to set %s to a different value than "
>> +                             "the host (%lu)",
>> +                             cbomz_cfg->name, host_val);
>> +                exit(EXIT_FAILURE);
>> +            }
>> +        }
>> +
>> +        kvm_cpu_cfg_set(cpu, cbomz_cfg, host_val);
>> +    }
>> +}
>> +
>>   static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>   {
>>       int i;
>> @@ -344,6 +425,14 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>                               kvm_cpu_set_multi_ext_cfg,
>>                               NULL, multi_cfg);
>>       }
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
>> +        RISCVCPUMultiExtConfig *cbomz_size_cfg = &kvm_cbomz_blksize_cfgs[i];
>> +
>> +        object_property_add(cpu_obj, cbomz_size_cfg->name, "uint16",
>> +                            NULL, kvm_cpu_set_cbomz_blksize,
>> +                            NULL, cbomz_size_cfg);
>> +    }
>>   }
>>   
>>   void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>> @@ -856,6 +945,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>   
>>       kvm_riscv_update_cpu_misa_ext(cpu, cs);
>>       kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
>> +    kvm_riscv_finalize_features(cpu, cs);
>>   
>>       return ret;
>>   }
>> -- 
>> 2.40.1
>>
>>
> 
> Thanks,
> drew

