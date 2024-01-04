Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE16C47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 18:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLS4h-000359-1x; Thu, 04 Jan 2024 13:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLS4e-00034L-US
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 13:04:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLS4c-0005S9-0v
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 13:04:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d60ad5f0bso8295335e9.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jan 2024 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704391444; x=1704996244; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MMFnyllcwPy0qW405I+eMlwhvboa9IaK0Wss3eV8Td4=;
 b=YLI6BJYuoE696Shlbt6TJWbYpCwTf/BVNtrCwTLaPSV62iD7hvR2xhX4fnMelYJaGS
 XQq0BvfYwGhUTXoCX9BjOV8H8BZiTmQ4U1hkbs2GkE2zDekCSGQkp6OHq7Q4HUHp2BME
 WAYE//f4JNefkIVxrKbcy+gq/DRl76S6JgVSF5FvKCJbX/MdSIRkLG1KiKBsVOvgXsI6
 +yuqo2g48rL4fF8MVJd3q1gAP5IKg80HEvngxRjRSwS8ARdREOjo2G+WnmzkAgm0dAtU
 DdFafBNF+QPkKq2FRaXnoUm/nHFkqZBYT59BDX3J4v0ZJC31kVGeZSFj2xX3XpLwraDQ
 HOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704391444; x=1704996244;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMFnyllcwPy0qW405I+eMlwhvboa9IaK0Wss3eV8Td4=;
 b=nrhRarj9WdzKLjdBGjPSRwzLe0gziTvipdXDERF3lXlGavTGrDtW4SVZLKr3gFLFzH
 DOZl4xsz37/BgWCpBmwAnVUFD/hhh06c60Wx2sbk7IEBKkPc1o646OqzDIUwjMkxaiRZ
 8+SLSoPrZLrxwxJiOqBB5JMgf0WHp6VIvD/uP0ZAAHd+bo27EHXA+GmYioNCC+RAh7I4
 /Jad0WENWNEDrT7UPeo4dEUGmbf25U3rbdcW27xyl3pHKsQJtKxDT99LeR1QchGXfzbZ
 9WANUskCi2UJAqfBn6vn8kW2px/vj/Thvn99gRtmom7tKk7c1KooLHth7YDj6SPjy0UU
 TtfQ==
X-Gm-Message-State: AOJu0YzomOJJRd/N7hfuPtPA3dKf9FAH1C88bPK/O8yOtoj9W1O711ZR
 t0W03cto3BXmN29adIrn+pkZAFExJbBqEA==
X-Google-Smtp-Source: AGHT+IETMTbPGf1myVNpZtmNdmYuL6Yle96SuUyXSiSqnSg1KhDVuAf8X7q7qfkX7eK8dzNNxOgDBw==
X-Received: by 2002:a05:600c:214:b0:40d:932b:c504 with SMTP id
 20-20020a05600c021400b0040d932bc504mr629728wmi.24.1704391444051; 
 Thu, 04 Jan 2024 10:04:04 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c4e5000b0040d933ad598sm4351588wmq.27.2024.01.04.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 10:04:03 -0800 (PST)
Message-ID: <04107470-8438-4e24-9a9a-03f6fa30bb31@linaro.org>
Date: Thu, 4 Jan 2024 19:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] target/alpha: Remove 'ev67' CPU class
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-2-gshan@redhat.com>
 <9fcd0827-a729-4cf8-a6ab-93cda04d88f9@linaro.org>
In-Reply-To: <9fcd0827-a729-4cf8-a6ab-93cda04d88f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 4/1/24 18:58, Philippe Mathieu-Daudé wrote:
> On 15/11/23 00:55, Gavin Shan wrote:
>> 'ev67' CPU class will be returned to match everything, which makes
>> no sense as mentioned in the comments. Remove the logic to fall
>> back to 'ev67' CPU class to match everything.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/alpha/cpu.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 39cf841b3e..91fe8ae095 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -141,11 +141,8 @@ static ObjectClass *alpha_cpu_class_by_name(const 
>> char *cpu_model)
>>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -
>> -    /* TODO: remove match everything nonsense */
>> -    if (!oc || object_class_is_abstract(oc)) {
>> -        /* Default to ev67; no reason not to emulate insns by 
>> default. */
>> -        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>> +    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
>> +        return NULL;
>>       }
> 
> This breaks linux-user:
> 
> qemu-alpha: unable to find CPU model 'any'

Thread 1 "qemu-alpha" hit Breakpoint 1, alpha_cpu_class_by_name 
(cpu_model=0x5555557202a0 "any") at target/alpha/cpu.c:123
123	{
(gdb) bt
#0  alpha_cpu_class_by_name (cpu_model=0x5555557202a0 "any") at 
target/alpha/cpu.c:123
#1  0x0000555555583956 in cpu_class_by_name 
(typename=typename@entry=0x555555674af8 "alpha-cpu", 
cpu_model=0x5555557202a0 "any")
     at hw/core/cpu-common.c:156
#2  0x00005555555904a1 in parse_cpu_option (cpu_option=<optimized out>) 
at cpu-target.c:257
#3  0x00005555555822e9 in main (argc=2, argv=0x7fffffffe318, 
envp=<optimized out>) at linux-user/main.c:784

in main():

  781     if (cpu_model == NULL) {
  782         cpu_model = cpu_get_model(get_elf_eflags(execfd));
  783     }
  784     cpu_type = parse_cpu_option(cpu_model);

Having:

$ cat linux-user/alpha/target_elf.h
...
#ifndef ALPHA_TARGET_ELF_H
#define ALPHA_TARGET_ELF_H
static inline const char *cpu_get_model(uint32_t eflags)
{
     return "any";
}
#endif


