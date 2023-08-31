Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A7DC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 14:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbiPB-0008V8-Cm; Thu, 31 Aug 2023 10:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbiP9-0008Su-Sq
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 10:12:15 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbiP6-0001y7-H0
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 10:12:15 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1c504386370so469433fac.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693491130; x=1694095930; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PslmwfvvUUTGvGPc+HI+pleCPfXIfU7JKRpYs3nC9h4=;
 b=Mo0yG83zyR9FTUWMVY7juxeHz2+D0Wr3z4T63WmtVFIQu/xR+Nfb/a4ak8fYHAd/wA
 A9QgRlWQMbgEmJm5S6HjzmXK+nJiBe3NoMKpzVbjsNYIo2jmkpsuELNwaVwkMBbGeqeJ
 /j0rIqWM/Nl6goBtWnM9FCMvmJ4TFLedv5uc9C1WIp7ZeIpR1YKzM/Uei4dldNDKBqkY
 ZQ7+akJ+8Ha1kOVVx+K03fVqpOCxq+hV2dhuqvD45bRpAE81g4C/v9KpN6GKC7w3BUbf
 td3M2wUIDlmX3TYPS7qf/WUY7Ot2dE8/boEkTboXn4TfNBkgXGr6aIUKYYg88NdXLykF
 NZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693491130; x=1694095930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PslmwfvvUUTGvGPc+HI+pleCPfXIfU7JKRpYs3nC9h4=;
 b=AgLmN3Hl0WYrorZwPr9A245xTtKpwMfjNloaqMTS5K5sTvEpw5K1DvEHrvBPRKLAIF
 nLO8mlnhTuwbTtBwYgqvxDX4LLqeGbCtvmq7OqY3xky8ofdRqDacz+58gtwc+Pogio3x
 zn/3UC6HLiG0hMJSV8/jkceBUjqBvvSX6DaDxEB4euGbXFAjDVrlx3cUFJgUirM9fidw
 IaNNIp0MSc/3a6S4aceuFmt/3A88H1BIZ9vBSBotePI+1hj0g2mtBDJaTOK700iK4ov8
 5+wzMfJeugGaU3TRRthI83oehQTNEWhJ+ehlYwY/7nIx8AwPegsCL914WviZWCsceqd4
 jPpg==
X-Gm-Message-State: AOJu0YxCOMrOzC2XYFz61SVhNmAeVHzuPtjt2EGESCh6LW5U8wf5KIl8
 4f1/kT1omU0D/HuC7vxvrFLXWQ==
X-Google-Smtp-Source: AGHT+IHmc2R4NlLR4T31Vy+eUv5YtmUh7gIYFeF1B0sadm/qyhOnF3iugnODNcHA830kOP8FqMXtYQ==
X-Received: by 2002:a05:6871:60e:b0:1bb:a264:a7ba with SMTP id
 w14-20020a056871060e00b001bba264a7bamr6097822oan.56.1693491129818; 
 Thu, 31 Aug 2023 07:12:09 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 v49-20020a056870957100b001c03d1a519fsm892770oal.39.2023.08.31.07.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 07:12:09 -0700 (PDT)
Message-ID: <529bd06e-55aa-3801-68ad-1471e3eef837@ventanamicro.com>
Date: Thu, 31 Aug 2023 11:12:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v8 15/20] target/riscv/cpu.c: introduce
 cpu_cfg_ext_auto_update()
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-16-dbarboza@ventanamicro.com>
 <20230831-51eeb5c42e9b3466b8cf6afb@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-51eeb5c42e9b3466b8cf6afb@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/31/23 10:33, Andrew Jones wrote:
> On Thu, Aug 24, 2023 at 07:14:35PM -0300, Daniel Henrique Barboza wrote:
>> During realize() time we're activating a lot of extensions based on some
>> criteria, e.g.:
>>
>>      if (cpu->cfg.ext_zk) {
>>          cpu->cfg.ext_zkn = true;
>>          cpu->cfg.ext_zkr = true;
>>          cpu->cfg.ext_zkt = true;
>>      }
>>
>> This practice resulted in at least one case where we ended up enabling
>> something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
>> has priv_spec older than 1.12.0.
>>
>> We're also not considering user choice. There's no way of doing it now
>> but this is about to change in the next few patches.
>>
>> cpu_cfg_ext_auto_update() will check for priv version mismatches before
>> enabling extensions. If we have a mismatch between the current priv
>> version and the extension we want to enable, do not enable it. In the
>> near future, this same function will also consider user choice when
>> deciding if we're going to enable/disable an extension or not.
>>
>> For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ddbf82f859..c56abf8395 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -177,6 +177,44 @@ static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
>>       *ext_enabled = en;
>>   }
>>   
>> +static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>> +        if (isa_edata_arr[i].ext_enable_offset != ext_offset) {
>> +            continue;
>> +        }
>> +
>> +        return isa_edata_arr[i].min_version;
>> +    }
>> +
>> +    /* Default to oldest priv spec if no match found */
>> +    return PRIV_VERSION_1_10_0;
> 
> This seems backwards to me. If we don't know for how long an extension
> has been ratified, then it seems like the default should be "Well, I
> guess it's new". Or, we could assert here to ensure we don't have any
> extensions having their minimum version checked which are missing version
> information. An assert also makes sense for the case that an invalid
> ext_offset was passed to this function.

IIRC I decided to return a default instead of asserting due to some extensions
not having priv_spec versions, but that was in an older codebase (a few months
ago).

I'll see if I can change this to assert out instead of setting a default value.


Thanks,

Daniel

> 
>> +}
>> +
>> +static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>> +                                    bool value)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    bool prev_val = isa_ext_is_enabled(cpu, ext_offset);
>> +    int min_version;
>> +
>> +    if (prev_val == value) {
>> +        return;
>> +    }
>> +
>> +    if (value && env->priv_ver != PRIV_VERSION_LATEST) {
>> +        /* Do not enable it if priv_ver is older than min_version */
>> +        min_version = cpu_cfg_ext_get_min_version(ext_offset);
>> +        if (env->priv_ver < min_version) {
>> +            return;
>> +        }
>> +    }
>> +
>> +    isa_ext_update_enabled(cpu, ext_offset, value);
>> +}
>> +
>>   const char * const riscv_int_regnames[] = {
>>       "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>>       "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
>> @@ -1268,12 +1306,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>   
>>       /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
>>       if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
>> -        cpu->cfg.ext_zca = true;
>> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
>>           if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
>> -            cpu->cfg.ext_zcf = true;
>> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
>>           }
>>           if (riscv_has_ext(env, RVD)) {
>> -            cpu->cfg.ext_zcd = true;
>> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
>>           }
>>       }
>>   
>> -- 
>> 2.41.0
>>
>>
> 
> Thanks,
> drew

