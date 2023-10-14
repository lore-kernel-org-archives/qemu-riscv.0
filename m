Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE6CDB465
	for <qemu-riscv@archiver.kernel.org>; Sat, 14 Oct 2023 22:25:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrn4N-00046a-Cf; Sat, 14 Oct 2023 18:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qrn4M-000464-0l
 for qemu-riscv@nongnu.org; Sat, 14 Oct 2023 18:25:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qrn4J-0005fp-Ja
 for qemu-riscv@nongnu.org; Sat, 14 Oct 2023 18:25:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6b7f0170d7bso1050104b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 14 Oct 2023 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697322310; x=1697927110;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fzisKM8OXe68jsGiandojg8nbd8KGlaJcsJepIMQH1c=;
 b=xk+FdjqWmAsxdYnxWSDHQ4Kua7cABdU1dFTZeuVtPgF0akPXOjepWXAoxXeCITuoTv
 U1kr20Cygq92tNTuHTw98UTxiRaOf+t1HiRmDELKOcx4rGBGcWPdlYO6GQ48nGS7FcXW
 Lzw1c2SQxJvkPS49ZxHpnpdu/PVpjORa2LX1qr71WoAJUd0YRxdgyNL4rHOMAyiHHFCM
 mFgOfYxbCvLlmT+NgO/nrtD88qryMgkZAd4HKcnWLfHHO4xf+lFEF49k+gArGmSSJfCF
 lrkr144m7/T1vEYEfIObgzkjpCcB3aqch/45XXcG93K2Hle7pzbhMurmFpvw/5CWWVKi
 qx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697322310; x=1697927110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fzisKM8OXe68jsGiandojg8nbd8KGlaJcsJepIMQH1c=;
 b=XzeKHQMg2/jlWzUWZ+73Ertj2tj/caHexkR9O4Oe1MkewSN06M1cDz+9CWnfDAQsVF
 MxJhi6D90xJAPN8sFO9Vewq6kbXwywG1RnxdXxQKzPhuJsb20joqMLjIKi0TpbuClpSS
 Zv07xwROZVsDRbx5qUgeSzKrwo6zhTjdkc9KOxGuCJFm+VR5xKnLYK2xQLrRnV0OpJc6
 9jS7bHALrwTNq1xyqZjLxIB98jRPIjbtll47OrBMkMDzrQN2k7FqfFMB+7P4nTF7H+ae
 JeAOW7LDJoCrjc39TUxwXAsjCQreMsyzst0r/5HN9UhYWHa4bkDKic7WPdlmlzUsFwO8
 hjcg==
X-Gm-Message-State: AOJu0YyOLvwigs5QnTl79/+JSXfyUiCWRCjPSIpDAA6g6wJI54nngrpG
 neoz5FXP5E6+xAl30SK5n+sJPQ==
X-Google-Smtp-Source: AGHT+IEAAAzaPFhEnqZR5faBhc9FMnwN4Zc7NsAPkz0qjSZJg2NTpVoC7wLv0jcNsNuKoTNUfrOuIw==
X-Received: by 2002:a05:6a20:9152:b0:154:c836:9ed5 with SMTP id
 x18-20020a056a20915200b00154c8369ed5mr33646465pzc.17.1697322309755; 
 Sat, 14 Oct 2023 15:25:09 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 y123-20020a636481000000b005b628aa2a8dsm65401pgb.69.2023.10.14.15.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Oct 2023 15:25:09 -0700 (PDT)
Message-ID: <917cb69b-d97c-4f41-bf90-49ad3a42a3ba@daynix.com>
Date: Sun, 15 Oct 2023 07:25:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/riscv: Initialize gdb_core_xml_file only
 once
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
 <20231014033545.15220-3-akihiko.odaki@daynix.com>
 <6a06acfc-3ca0-402e-8a98-bdd1a22bdf0d@ventanamicro.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <6a06acfc-3ca0-402e-8a98-bdd1a22bdf0d@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/10/15 3:19, Daniel Henrique Barboza wrote:
> 
> 
> On 10/14/23 00:35, Akihiko Odaki wrote:
>> gdb_core_xml_file was assigned each time a CPU is instantiated before
>> this change.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/riscv/cpu.c         | 5 +++++
>>   target/riscv/tcg/tcg-cpu.c | 4 ----
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ac4a6c7eec..a811215150 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1575,6 +1575,11 @@ static void riscv_cpu_class_init(ObjectClass 
>> *c, void *data)
>>       cc->get_pc = riscv_cpu_get_pc;
>>       cc->gdb_read_register = riscv_cpu_gdb_read_register;
>>       cc->gdb_write_register = riscv_cpu_gdb_write_register;
>> +#ifdef TARGET_RISCV64
>> +    cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>> +#elif defined(TARGET_RISCV32)
>> +    cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>> +#endif
>>       cc->gdb_num_core_regs = 33;
>>       cc->gdb_stop_before_watchpoint = true;
>>       cc->disas_set_info = riscv_cpu_disas_set_info;
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index e0cbc56320..626fb2acea 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -150,8 +150,6 @@ static void 
>> riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>>   static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>   {
>> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>> -    CPUClass *cc = CPU_CLASS(mcc);
>>       CPURISCVState *env = &cpu->env;
>>       /* Validate that MISA_MXL is set properly. */
>> @@ -159,11 +157,9 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU 
>> *cpu, Error **errp)
>>   #ifdef TARGET_RISCV64
>>       case MXL_RV64:
>>       case MXL_RV128:
>> -        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>>           break;
>>   #elif defined(TARGET_RISCV32)
>>       case MXL_RV32:
>> -        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>>           break;
> 
> 
> Hmmm the issue here is that, in patch 1, you added an "elif 
> defined(TARGET_RISCV32)"
> based on an assumption that you changed here since there's no more 
> gdb_core files being
> set.

It's opposite. Patch 1 added "elif defined(TARGET_RISCV32)" because 
configs/targets/riscv64-linux-user.mak and 
configs/targets/riscv64-softmmu.mak do not list riscv-32bit-cpu.xml and 
referencing it from TARGET_RISCV64 results in an error.

Since patch 1 now ensures TARGET_RISCV64 will never have MXL_RV32 as 
misa_mxl_max, patch 2 can safely assume TARGET_RISCV64 always has 
riscv-64bit-cpu.xml as gdb_core_xml_file.

> 
> My suggestion is to use patch 1 from v1, where you removed the 
> misa_mxl_max == misa_mxl
> check at the end of this function. And then in this patch you can remove 
> this function
> altogether since you're assigning gdb_core in riscv_cpu_class_init() and 
> the function will
> be left doing nothing of note.

Assigning gdb_core_xml_file is more like a side-effect of 
riscv_cpu_validate_misa_mxl(), and the main purpose of this function is 
to validate misa_mxl[_max]. I think it's still a good idea to validate 
misa_mxl_max in particular. Specifying MXL_RV32 as misa_mxl_max for 
TARGET_RISCV64 or specifying MXL_RV64/MXL_RV128 for TARGET_RISCV32 will 
not work because of the incompatible gdb_core_xml_file (and probably 
other reasons).

