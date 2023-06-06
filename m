Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C747C7EE37
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 20:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6di2-0002ik-7s; Tue, 06 Jun 2023 16:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6di1-0002iX-4C
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 16:55:17 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6dhr-0003AB-4t
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 16:55:16 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-19f2fb9b1cdso5367470fac.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686084905; x=1688676905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySYjTfOjgREL/5RU/viclMMaPuU1Rlq16xkg6JKQhyY=;
 b=eisxiu1oFtrOlB6CVy/6CHiuQ7Y6jFkb34BlAhbd70+Rz3pwU/jRU0cqCJDcWnxDkY
 UzOEwVf4rUQRIHuFtNi4INFyTj3z+YBQ6RkSfaw6jTttw6bvFVsTCwMnq9mwU3HaQIsb
 ZGoWtUKx1zO/ff2++Atzp869Zuuglejwj4fCzJ7ENbY2a/vxs7r/qm621LAfBpD317TY
 2Pqnn1JUHebDt0Hta6H1IpG7wO415I/QAZHLqKmuAaMnYRL/ontFvIYnVQ5VagoBxEAs
 Dp2MRHtXjkLoi13rNWddVF/Z77JbOdkYC+aSdesiKkyR6pYgZ4QDSvlh67OhZ5UaYooA
 fUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686084905; x=1688676905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ySYjTfOjgREL/5RU/viclMMaPuU1Rlq16xkg6JKQhyY=;
 b=I+/IZ3fVyXqqh3TFURqCADoJC6rO1XEeIraJpS9JGREfh/9bLl5fJewPuMcFFoU7lS
 6cPrs8ChLyZvzTgtnnSKF8mXAcFsyLYRe0U+BgwF1tf5jVRYFazmBr2AFz2E8hUvgDnf
 yeuBkP44qwyCP5fvLjsbwqYiQnOW62YeML/lg80Ptnv6AOcpkcTN5NkAE/F4+Kqjd+Kd
 sBJiM0rN8ppZAmaLr0lW4S1GwhnFc8yH3k9HuPHjg5IUOYSlHkWcjlOQwTYX1SHFpNcX
 v6k/fLI0q7DsIA+OOkc/VERMsaiSwE7t/h0Tbf0NpqVanWqCISTQaaA5tyXx9YHvMZAZ
 QiPw==
X-Gm-Message-State: AC+VfDwC0O2K+pWQkfj1MKKbSlL8r4sTkpHQhvtmmQpiRhSOOI550QjJ
 b1c1hIbGiCv10KSkr2lYxwHHWw==
X-Google-Smtp-Source: ACHHUZ6ceN0lAzdG27KIH2NMYyw0PHc3grM7tuLUL1cbuCHRLLSAzJ3oLOrYErQJXfNLoye+uxwr1w==
X-Received: by 2002:a05:6870:c094:b0:19f:e5a8:7525 with SMTP id
 c20-20020a056870c09400b0019fe5a87525mr2117851oad.12.1686084905572; 
 Tue, 06 Jun 2023 13:55:05 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05687051c300b0019a291d1672sm5194828oaj.26.2023.06.06.13.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 13:55:05 -0700 (PDT)
Message-ID: <416cfdcc-a3bd-0143-8ecd-a5b6630a913e@ventanamicro.com>
Date: Tue, 6 Jun 2023 17:55:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
Content-Language: en-US
To: =?UTF-8?Q?Lo=c3=afc_Lefort?= <loic@rivosinc.com>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230606113812.519723-1-hchauhan@ventanamicro.com>
 <CAGKm2NJGGF-ROU_Js8-pv5xsCadN=vPOAD4EXWnMiveEbu931A@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAGKm2NJGGF-ROU_Js8-pv5xsCadN=vPOAD4EXWnMiveEbu931A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 6/6/23 16:46, Loïc Lefort wrote:
> On Tue, Jun 6, 2023 at 1:39 PM Himanshu Chauhan
> <hchauhan@ventanamicro.com> wrote:
>>
>> Smepmp is a ratified extension which qemu refers to as epmp.
>> Rename epmp to smepmp and add it to extension list so that
>> it is added to the isa string.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c     |  9 +++++----
>>   target/riscv/cpu_cfg.h |  2 +-
>>   target/riscv/csr.c     |  6 +++---
>>   target/riscv/pmp.c     | 12 ++++++------
>>   4 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 881bddf393..cf3d1c3207 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -127,6 +127,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
>> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>>       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>>       ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>>       ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
>> @@ -547,7 +548,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>>   #ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>>   #endif
>> -    cpu->cfg.epmp = true;
>> +    cpu->cfg.ext_smepmp = true;
>>
> Should also update Ibex CPU to priv level 1.12 otherwise Smepmp will
> be disabled since it is now declared PRIV_VERSION_1_12_0 in
> isa_edata_arr.

(--- added Alistair in CC since he added the Ibex CPU back in 2020 ---)

Good point. Commit ed6eebaaafd states that the Ibex CPU has ePMP support
and this patch would break it.

I suggest changing the priv_version in a separated patch to facilitate future
rebases/bisects.


Thanks,


Daniel


> 
>>       /* inherited from parent obj via riscv_cpu_init() */
>>       cpu->cfg.ext_ifencei = true;
>> @@ -1336,12 +1337,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>
>> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>> +    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>>           /*
>>            * Enhanced PMP should only be available
>>            * on harts with PMP support
>>            */
>> -        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
>> +        error_setg(errp, "Invalid configuration: SMEPMP requires PMP support");
>>           return;
>>       }
> Nitpick: the spec uses "Smepmp", not "SMEPMP".
> 
>>
>> @@ -1676,7 +1677,7 @@ static Property riscv_cpu_extensions[] = {
>>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>>
>>       /* ePMP 0.9.3 */
>> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
>>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>>
> You missed the comment update but maybe just move the definition next
> to pmp and drop the comment since it's now ratified?
> 
>> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>> index c4a627d335..d79b022e35 100644
>> --- a/target/riscv/cpu_cfg.h
>> +++ b/target/riscv/cpu_cfg.h
>> @@ -87,6 +87,7 @@ struct RISCVCPUConfig {
>>       bool ext_zvfh;
>>       bool ext_zvfhmin;
>>       bool ext_smaia;
>> +    bool ext_smepmp;
>>       bool ext_ssaia;
>>       bool ext_sscofpmf;
>>       bool rvv_ta_all_1s;
>> @@ -121,7 +122,6 @@ struct RISCVCPUConfig {
>>       uint16_t cboz_blocksize;
>>       bool mmu;
>>       bool pmp;
>> -    bool epmp;
>>       bool debug;
>>       bool misa_w;
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 58499b5afc..d9bc591348 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -523,9 +523,9 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
>>       return RISCV_EXCP_ILLEGAL_INST;
>>   }
>>
>> -static RISCVException epmp(CPURISCVState *env, int csrno)
>> +static RISCVException smepmp(CPURISCVState *env, int csrno)
>>   {
>> -    if (riscv_cpu_cfg(env)->epmp) {
>> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>>           return RISCV_EXCP_NONE;
>>       }
>>
>> @@ -4356,7 +4356,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>       [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>>
>>       /* Physical Memory Protection */
>> -    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
>> +    [CSR_MSECCFG]    = { "mseccfg", smepmp, read_mseccfg, write_mseccfg,
>>                            .min_priv_ver = PRIV_VERSION_1_11_0           },
>>       [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
>>       [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 418738afd8..18246e1737 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -87,7 +87,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>>       if (pmp_index < MAX_RISCV_PMPS) {
>>           bool locked = true;
>>
>> -        if (riscv_cpu_cfg(env)->epmp) {
>> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
>>               /* mseccfg.RLB is set */
>>               if (MSECCFG_RLB_ISSET(env)) {
>>                   locked = false;
>> @@ -337,9 +337,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>>
>>           /*
>>            * Convert the PMP permissions to match the truth table in the
>> -         * ePMP spec.
>> +         * SMEPMP spec.
>>            */
> Smepmp
> 
>> -        const uint8_t epmp_operation =
>> +        const uint8_t smepmp_operation =
>>               ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>>               ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>>               (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
>> @@ -364,7 +364,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>>                    * If mseccfg.MML Bit set, do the enhanced pmp priv check
>>                    */
>>                   if (mode == PRV_M) {
>> -                    switch (epmp_operation) {
>> +                    switch (smepmp_operation) {
>>                       case 0:
>>                       case 1:
>>                       case 4:
>> @@ -395,7 +395,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>>                           g_assert_not_reached();
>>                       }
>>                   } else {
>> -                    switch (epmp_operation) {
>> +                    switch (smepmp_operation) {
>>                       case 0:
>>                       case 8:
>>                       case 9:
>> @@ -576,7 +576,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
>>           }
>>       }
>>
>> -    if (riscv_cpu_cfg(env)->epmp) {
>> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>>           /* Sticky bits */
>>           val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
>>           if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
>> --
>> 2.34.1
>>
>>
> 

