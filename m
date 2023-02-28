Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX2Yh-0005dV-0L
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 11:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pX2Yf-0005d2-W9
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 11:10:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pX2Yd-0000jf-S8
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 11:10:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id p20so9740044plw.13
 for <qemu-riscv@nongnu.org>; Tue, 28 Feb 2023 08:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677600625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DjGM0IEteqDe9jCtaMeoJATFuSI/VlpZwchcVoWD2kA=;
 b=PqTjpcKLrLVvGEMEUgeDLiD64fLXpsBI/yQ01J4GIrY6wIckuSewSwcAyTYXUzNZAI
 +Ouo661FHtDEmgsuRJDSJ0GH1r9W4k6xnOB0ziOX75b9HX+30G8aTBSxh5jdI9F4P1jM
 zC4WgPg9u3n+H5WgE0klyeJYA12fMwgyKOIysQj5X1SSogjbED2H4yJcKjcXtY4FsBcw
 GFQoRnS74Ut1bi9GNzip278RDo0BopzBu1Kgo6olgJ3FrkngvET5qv73tyYoKdDeb3h6
 x56QMrmrI87lYXq2xNQMRgx+ai5AKdiljDFCL6OBmVvv75k10PAFNPErMz+49zePyDdd
 mBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677600625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DjGM0IEteqDe9jCtaMeoJATFuSI/VlpZwchcVoWD2kA=;
 b=PMpB1dtoT9ePMZLY+M5VigtDNKdzPl2UyJc4mHVrJrbq4DFZ/yUHvExEjy2oj+E3Nl
 95A245cL6W6qOhNj7k2Fbugjr8b2Kja38yVVX2U+StW62CO+JBXWmhEDGYC1sA3tBvXv
 kMn79l3dvzCvCuu4JH8Jmzmc0PKcfKjz0mkPqX8Jqq5bYSeH8GNgnIweo27HC7uhVae2
 FXPvvi/094fiFxB1LRN10FffUGYaX7WaGvXDyDOjnj7IW+K0BntOvCGrGp7V7HqoIu5Z
 M0Pf+se6rjM2E9gvGauSW/l+T5hMbGJDFUDeoBMcFsTwacBXx8LcCYHTdVtvOTk9/mOq
 KS+A==
X-Gm-Message-State: AO0yUKU0ihjlbmg0rj92e94CUDKLEf9yBc8ZiHfJKofaQZkD867R651k
 sZc0xkqvwYreKMi5Dqo8rU1WPQ==
X-Google-Smtp-Source: AK7set/G7skLsFvV6X8vvWVnnAAKWQPTae/0iinMFNLMvTg/qMQlps66SMDVNbGGZSqjpPyK2jUM6g==
X-Received: by 2002:a05:6a21:32a5:b0:cc:e439:bdad with SMTP id
 yt37-20020a056a2132a500b000cce439bdadmr3882993pzb.1.1677600624840; 
 Tue, 28 Feb 2023 08:10:24 -0800 (PST)
Received: from ?IPV6:2405:201:d019:c0a2:d1bb:4458:2b1b:e0d9?
 ([2405:201:d019:c0a2:d1bb:4458:2b1b:e0d9])
 by smtp.gmail.com with ESMTPSA id
 w16-20020aa78590000000b005a8cc32b23csm6261326pfn.20.2023.02.28.08.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:10:24 -0800 (PST)
Message-ID: <2bdb572b-d6f4-5ff2-7dc4-33e27c885f89@ventanamicro.com>
Date: Tue, 28 Feb 2023 21:40:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv: Convert epmp from feature to ratified
 smepmp extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230203042434.67293-1-hchauhan@ventanamicro.com>
 <aa1e82f7-54e9-7324-0921-ff4612dcdbc7@ventanamicro.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <aa1e82f7-54e9-7324-0921-ff4612dcdbc7@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Tue, 28 Feb 2023 16:10:30 -0000


On 28/02/23 21:23, Daniel Henrique Barboza wrote:
> Hey. Sorry for the delay, this patch went through the cracks :(
>
> (CCing the reviewers)
> (CCing qemu-devel as well)
>
> On 2/3/23 01:24, Himanshu Chauhan wrote:
>> Smepmp is a ratified extension. This patch converts the existing epmp
>> support as a feature to an extension. With this, "smepmp" string will
>> be concatenated to riscv,isa in generated FDT.
>>
>> Since the official name of the extension is Smepmp, the references
>> to epmp have also been changed to smepmp.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 16 ++++++----------
>>   target/riscv/cpu.h |  3 +--
>>   target/riscv/csr.c |  8 +++++---
>>   target/riscv/pmp.c | 13 +++++++++----
>>   4 files changed, 21 insertions(+), 19 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 14a7027095..d9bba04226 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -103,6 +103,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>>       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, 
>> ext_zhinxmin),
>>       ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
>> +    ISA_EXT_DATA_ENTRY(smepmp, true, PRIV_VERSION_1_12_0, ext_smepmp),
>>       ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>>       ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, 
>> ext_sscofpmf),
>>       ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>> @@ -325,7 +326,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>>       register_cpu_props(DEVICE(obj));
>>       set_priv_version(env, PRIV_VERSION_1_11_0);
>>       cpu->cfg.mmu = false;
>> -    cpu->cfg.epmp = true;
>> +    cpu->cfg.ext_smepmp = true;
>>   }
>>     static void rv32_imafcu_nommu_cpu_init(Object *obj)
>> @@ -884,14 +885,9 @@ static void riscv_cpu_realize(DeviceState *dev, 
>> Error **errp)
>>         if (cpu->cfg.pmp) {
>>           riscv_set_feature(env, RISCV_FEATURE_PMP);
>> -
>> -        /*
>> -         * Enhanced PMP should only be available
>> -         * on harts with PMP support
>> -         */
>> -        if (cpu->cfg.epmp) {
>> -            riscv_set_feature(env, RISCV_FEATURE_EPMP);
>> -        }
>> +    } else {
>> +        /* smepmp requires pmp support */
>> +        cpu->cfg.ext_smepmp = false;
>
>
> I believe this and other chunk like it will collide with the work done 
> in:
>
> "[PATCH v7 00/10] make write_misa a no-op and FEATURE_* cleanups"
>
> That series is already acked, so it would make the maintainer's life 
> easier to
> base this patch on top of that. You can add a:
>
> Based-on: 20230222185205.355361-1-dbarboza@ventanamicro.com
> ("[PATCH v7 00/10] make write_misa a no-op and FEATURE_* cleanups")
>
> at the start of the cover-letter to indicate the dependency.
>
>>       }
>>         if (cpu->cfg.debug) {
>> @@ -1051,6 +1047,7 @@ static Property riscv_cpu_extensions[] = {
>>       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
>>       DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>>         DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>> @@ -1093,7 +1090,6 @@ static Property riscv_cpu_extensions[] = {
>>       /* These are experimental so mark with 'x-' */
>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>>       /* ePMP 0.9.3 */
>> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>>   diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index bcf0826753..30fd29e578 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -87,7 +87,6 @@
>>   enum {
>>       RISCV_FEATURE_MMU,
>>       RISCV_FEATURE_PMP,
>> -    RISCV_FEATURE_EPMP,
>>       RISCV_FEATURE_MISA,
>>       RISCV_FEATURE_DEBUG
>>   };
>> @@ -465,6 +464,7 @@ struct RISCVCPUConfig {
>>       bool ext_smaia;
>>       bool ext_ssaia;
>>       bool ext_sscofpmf;
>> +    bool ext_smepmp;
>>       bool rvv_ta_all_1s;
>>       bool rvv_ma_all_1s;
>>   @@ -484,7 +484,6 @@ struct RISCVCPUConfig {
>>       uint16_t elen;
>>       bool mmu;
>>       bool pmp;
>> -    bool epmp;
>>       bool debug;
>>         bool short_isa_string;
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 62e6c4acbd..f70f6d9aad 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -426,9 +426,11 @@ static RISCVException pmp(CPURISCVState *env, 
>> int csrno)
>>       return RISCV_EXCP_ILLEGAL_INST;
>>   }
>>   -static RISCVException epmp(CPURISCVState *env, int csrno)
>> +static RISCVException smepmp(CPURISCVState *env, int csrno)
>>   {
>> -    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +
>> +    if (env->priv == PRV_M && cpu->cfg.ext_smepmp) {
>
> I did a recent cleanup in these code patterns by using a new 
> riscv_cpu_cfg() API.
> If you rebase this patch on top of that series (which has the API) 
> this code would
> become:
>
>> -   if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
>> +   if (env->priv == PRV_M && riscv_cpu_cfg(env)->ext_smepmp) {
>
>
>>           return RISCV_EXCP_NONE;
>>       }
>>   @@ -4259,7 +4261,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, 
>> rmw_vsiph },
>>         /* Physical Memory Protection */
>> -    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
>> +    [CSR_MSECCFG]    = { "mseccfg",  smepmp, read_mseccfg, 
>> write_mseccfg,
>>                            .min_priv_ver = 
>> PRIV_VERSION_1_11_0           },
>>       [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg, 
>> write_pmpcfg  },
>>       [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg, 
>> write_pmpcfg  },
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index d1126a6066..d85ad07caa 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -58,6 +58,11 @@ static inline int pmp_is_locked(CPURISCVState 
>> *env, uint32_t pmp_index)
>>       return 0;
>>   }
>>   +static inline int smepmp_is_enabled(CPURISCVState *env)
>> +{
>> +    return (RISCV_CPU(env_cpu(env))->cfg.ext_smepmp);
>> +}
>> +
>
> I believe you can just read "riscv_cpu_cfg(env)->ext_smepmp" directly 
> wherever you need
> instead of creating a new function
>
>>   /*
>>    * Count the number of active rules.
>>    */
>> @@ -88,7 +93,7 @@ static void pmp_write_cfg(CPURISCVState *env, 
>> uint32_t pmp_index, uint8_t val)
>>       if (pmp_index < MAX_RISCV_PMPS) {
>>           bool locked = true;
>>   -        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
>> +        if (smepmp_is_enabled(env)) {
>>               /* mseccfg.RLB is set */
>>               if (MSECCFG_RLB_ISSET(env)) {
>>                   locked = false;
>> @@ -239,7 +244,7 @@ static bool 
>> pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>>   {
>>       bool ret;
>>   -    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
>> +    if (smepmp_is_enabled(env)) {
>>           if (MSECCFG_MMWP_ISSET(env)) {
>>               /*
>>                * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
>> @@ -265,7 +270,7 @@ static bool 
>> pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>>           }
>>       }
>>   -    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == 
>> PRV_M)) {
>> +    if (!smepmp_is_enabled(env) || (mode == PRV_M)) {
>>           /*
>>            * Privileged spec v1.10 states if HW doesn't implement any 
>> PMP entry
>>            * or no PMP entry matches an M-Mode access, the access 
>> succeeds.
>> @@ -348,7 +353,7 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>> target_ulong addr,
>>             /*
>>            * Convert the PMP permissions to match the truth table in the
>> -         * ePMP spec.
>> +         * Smepmp spec.
>>            */
>>           const uint8_t epmp_operation =
>>               ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |

Thanks Daniel. I will rebase, take care of the conflicts, comments and 
then resend it.

Regards

Himanshu


