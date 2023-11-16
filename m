Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF8EC197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Zhw-0004xC-FP; Thu, 16 Nov 2023 05:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3Zhu-0004vn-12
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3Zhr-0006PV-4t
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkF5SooOT9kaUjO3QP6Bxrm8owBD8rkz72Yox0uZtMI=;
 b=d9rJLbrXXl5Qv7pS5kLrr40tGQBzD+y59sqoCJF5r3oFLOoCRxualbVX0rLycru2OgOCMz
 3p/d4IhZXnlDriogIwOYS0S+8U652ZQnCT+bMUkOvPzNdgfZfVysHVYZ9B97IorXVL3xay
 lhJCHKCigQU1cd/DSOteLTj2LSPTx3U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-fGQMBBUgNQuhYVI49oq40g-1; Thu, 16 Nov 2023 05:34:34 -0500
X-MC-Unique: fGQMBBUgNQuhYVI49oq40g-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6c4f8a2dcbdso783691b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130873; x=1700735673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TkF5SooOT9kaUjO3QP6Bxrm8owBD8rkz72Yox0uZtMI=;
 b=wX+vO7KkZljeCLXCANLKHseGKxDox/sNvzYvuLMyIDFcVJa44SI+HA3R2juXKNl6up
 LdeaJVlOsHhiWbXol6cM+YBFLtpwRGfkBKlIJ39VeZjdW6GCBWgfxx2uY4ARsrLwcZOT
 2e/ErMkbcY5R5LF4JMzqb7ZTo9kMtyC/HVQP3spN/8BXnK9+di/pAaWBPhoG6iT+JPee
 eWExo3S6zhHs557FTQts04GJojg0uMdmA2NCkTTLW3j5vOgu4TDb4rQbPAQ4SmAb24SK
 pHlH3/v88IjlzrCpu0iNC28Z8AGglpC+j9pvU96SrGCka2h8gcuc+qhG2QG8uG/FAnHH
 CkjA==
X-Gm-Message-State: AOJu0YwBAt6CKXh4uzrVW+ZUyBTk4zCdeQ3w/HNMM//0WIcOEdKf7nig
 xzQngEGcxHAxImS+/dpLyCsBDueZIByVeGM0ANYrwZLpQV2N1Wl+8Nrf05XjAs1HCfEaF6+ZLuZ
 0hs2MKJFAoPyTBXE=
X-Received: by 2002:a05:6a21:339d:b0:16b:8154:2168 with SMTP id
 yy29-20020a056a21339d00b0016b81542168mr15293449pzb.26.1700130873510; 
 Thu, 16 Nov 2023 02:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXVC2W+6nWb8fReoqIvdLuCo5Ah5gmebUD5Got/4aW26J/CaJEghKTksyRJIm21CFv/JPg5A==
X-Received: by 2002:a05:6a21:339d:b0:16b:8154:2168 with SMTP id
 yy29-20020a056a21339d00b0016b81542168mr15293426pzb.26.1700130873188; 
 Thu, 16 Nov 2023 02:34:33 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 by14-20020a056a02058e00b005bd980cca56sm2289210pgb.29.2023.11.16.02.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:34:32 -0800 (PST)
Message-ID: <93d5e7fa-b1c6-43cc-b3af-026e7a5964b5@redhat.com>
Date: Thu, 16 Nov 2023 20:34:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
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
 <20231114235628.534334-7-gshan@redhat.com>
 <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
 <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Phil,

On 11/16/23 17:51, Philippe Mathieu-Daudé wrote:
> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>> On 15/11/23 00:56, Gavin Shan wrote:
>>> Add generic cpu_list() to replace the individual target's implementation
>>> in the subsequent commits. Currently, there are 3 targets with no cpu_list()
>>> implementation: microblaze and nios2. With this applied, those two targets
>>> switch to the generic cpu_list().
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>> Available CPUs:
>>>    microblaze-cpu
>>>
>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>> Available CPUs:
>>>    nios2-cpu
>>>
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   bsd-user/main.c |  5 +----
>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>
>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index c078c0e91b..acfc654b95 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -24,6 +24,7 @@
>>>   #include "hw/qdev-core.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qemu/error-report.h"
>>> +#include "qemu/qemu-print.h"
>>>   #include "migration/vmstate.h"
>>>   #ifdef CONFIG_USER_ONLY
>>>   #include "qemu.h"
>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
>>>       return cpu_type;
>>>   }
>>> +#ifndef cpu_list
>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>> +{
>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>> +
>>> +    if (cc->deprecation_note) {
>>> +        qemu_printf("  %s (deprecated)\n", model);
>>> +    } else {
>>> +        qemu_printf("  %s\n", model);
>>> +    }
>>> +}
>>> +
>>> +static void cpu_list(void)
>>> +{
>>> +    GSList *list;
>>> +
>>> +    list = object_class_get_list_sorted(TYPE_CPU, false);
>>> +    qemu_printf("Available CPUs:\n");
>>
>> Since this output will likely be displayed a lot, IMHO it is worth
>> doing a first pass to get the number of available CPUs. If it is 1,
>> print using singular but even better smth like:
>>
>>         "This machine can only be used with the following CPU:"
> 
> Hmm I missed this code is common to user/system emulation.
> 
> System helper could be clever by using the intersection of cpu_list()
> and MachineClass::valid_cpu_types[] sets.
> 

When cpu_list() is called, it's possible the machine type option isn't
parsed yet. Besides, this function is usually used by "qemu-system-arm -cpu ?".
So I wouldn't connect to MachineClass::valid_cpu_types[] here if you agree.

Thanks,
Gavin

>> That said, this can be done later on top, so:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> +    g_slist_foreach(list, cpu_list_entry, NULL);
>>> +    g_slist_free(list);
>>> +}
>>> +#endif
>>
>>
> 


