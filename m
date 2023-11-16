Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD247C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 13:24:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3cKq-00009N-Md; Thu, 16 Nov 2023 08:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cKl-00008Q-Ez
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:23:03 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cKi-0004vu-TP
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:23:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso6899455e9.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700140978; x=1700745778; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpYKtitWZaN9Cy7xbji8Hdt44lw8x0AaY5nlqTz8g08=;
 b=MoQnX3wzHi5LHE0upoMtQhEv4qBEbfXkF8u1Ttv3UgmyB3jf3gcO10Iz1eVz93Yegj
 kLJsuDZhChDpqPByXXiJvOR4b2woT4LW6guYHHw94L4j824lEvGJiJ9wcB6XuoG8Yy71
 iyEdhJPReElkXB1lEdibhkHSVgr3GyUcBgmb76pHfJO9O8ij/B79O8bzUKlUJmZKelh/
 58XN54xN2k9Ecu6hyVjxiSUz97oWKUBZSGf4xUOhVoaNzyJd5HsVFLUBdtcbObns39YW
 ak9xv/kcJbuF/C6krLq11y1328QxWwpwpqtVPTKi3sxZ/nQYsPCzDHqeyTl812XFirh0
 f4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140978; x=1700745778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpYKtitWZaN9Cy7xbji8Hdt44lw8x0AaY5nlqTz8g08=;
 b=tuxpN5cqsQ8CCiEllBtuZVBtAom9NbnmZUWMUIJOsQW8QSGZJSBrX+/93f1W9LyhFd
 LvU6xsaQG1NQSU+BPq5Ik1WKGarzmMDXbebKvMLUxchexXlNYSr2kC8nzn/28Y63a5D0
 UBdMp0m5+5AN1hQNlktYQLszv888dGgOQVy4Iw4X/4BheJu/xUi1/FVX5pWNJgg3ToHN
 vqwLlqjaiWs6Hqe8SdbvZTLZuYw7eoE9OZx9aIsKlTCReFdLUUuv9t70EgumPWzJHdH+
 m1ezKcbr1q9M0n/kmzQeSCHAUntETiPIXQM6pTAoi5rpDlxRWiPSFTo3TOXiWE3pPA7v
 hdxw==
X-Gm-Message-State: AOJu0YxcXDvgar+odI5Wc3BJ2j+MwYzYsssZoEBOK2eSc9dGAR49nus4
 NAy+esK15ZfkfqZUQ8bEQAF5eg==
X-Google-Smtp-Source: AGHT+IFINyivybY853n8GsSvVw7z7z9HK7QrEFixJrFNFRt1mPqTH1kjJ3nouSNTzlK6pOSxHOXsKg==
X-Received: by 2002:a05:600c:4f54:b0:40a:49bc:fa9d with SMTP id
 m20-20020a05600c4f5400b0040a49bcfa9dmr12965675wmq.26.1700140977580; 
 Thu, 16 Nov 2023 05:22:57 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b004068e09a70bsm3718284wmp.31.2023.11.16.05.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:22:57 -0800 (PST)
Message-ID: <603ed1f0-ad44-4e51-9e60-7c9b4afb10b5@linaro.org>
Date: Thu, 16 Nov 2023 14:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
Content-Language: en-US
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
 <20231114235628.534334-7-gshan@redhat.com>
 <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
 <55922c30-be4b-459d-835b-819e1dcd2437@linaro.org>
 <93d5e7fa-b1c6-43cc-b3af-026e7a5964b5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <93d5e7fa-b1c6-43cc-b3af-026e7a5964b5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 16/11/23 11:34, Gavin Shan wrote:
> Hi Phil,
> 
> On 11/16/23 17:51, Philippe Mathieu-Daudé wrote:
>> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>>> On 15/11/23 00:56, Gavin Shan wrote:
>>>> Add generic cpu_list() to replace the individual target's 
>>>> implementation
>>>> in the subsequent commits. Currently, there are 3 targets with no 
>>>> cpu_list()
>>>> implementation: microblaze and nios2. With this applied, those two 
>>>> targets
>>>> switch to the generic cpu_list().
>>>>
>>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>>> Available CPUs:
>>>>    microblaze-cpu
>>>>
>>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>>> Available CPUs:
>>>>    nios2-cpu
>>>>
>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   bsd-user/main.c |  5 +----
>>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>>
>>>
>>>> diff --git a/cpu-target.c b/cpu-target.c
>>>> index c078c0e91b..acfc654b95 100644
>>>> --- a/cpu-target.c
>>>> +++ b/cpu-target.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include "hw/qdev-core.h"
>>>>   #include "hw/qdev-properties.h"
>>>>   #include "qemu/error-report.h"
>>>> +#include "qemu/qemu-print.h"
>>>>   #include "migration/vmstate.h"
>>>>   #ifdef CONFIG_USER_ONLY
>>>>   #include "qemu.h"
>>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char 
>>>> *cpu_option)
>>>>       return cpu_type;
>>>>   }
>>>> +#ifndef cpu_list
>>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>>> +{
>>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>>> +
>>>> +    if (cc->deprecation_note) {
>>>> +        qemu_printf("  %s (deprecated)\n", model);
>>>> +    } else {
>>>> +        qemu_printf("  %s\n", model);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void cpu_list(void)
>>>> +{
>>>> +    GSList *list;
>>>> +
>>>> +    list = object_class_get_list_sorted(TYPE_CPU, false);
>>>> +    qemu_printf("Available CPUs:\n");
>>>
>>> Since this output will likely be displayed a lot, IMHO it is worth
>>> doing a first pass to get the number of available CPUs. If it is 1,
>>> print using singular but even better smth like:
>>>
>>>         "This machine can only be used with the following CPU:"
>>
>> Hmm I missed this code is common to user/system emulation.
>>
>> System helper could be clever by using the intersection of cpu_list()
>> and MachineClass::valid_cpu_types[] sets.
>>
> 
> When cpu_list() is called, it's possible the machine type option isn't
> parsed yet. Besides, this function is usually used by "qemu-system-arm 
> -cpu ?".

Not sure this is a good example :)

   $ qemu-system-arm -cpu ?
   qemu-system-arm: No machine specified, and there is no default
   Use -machine help to list supported machines

> So I wouldn't connect to MachineClass::valid_cpu_types[] here if you agree.

Agreed.


