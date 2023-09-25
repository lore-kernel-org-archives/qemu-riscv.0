Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B5CE7A91
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 00:25:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkZOq-0003Ln-7f; Sun, 24 Sep 2023 20:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qkZOn-0003K2-Pt
 for qemu-riscv@nongnu.org; Sun, 24 Sep 2023 20:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qkZOm-00075V-1D
 for qemu-riscv@nongnu.org; Sun, 24 Sep 2023 20:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695601467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPk3ge9QXMJ1XbAnO/Cqt8Jm9Bz3ZpC9BoVYrzsRNtg=;
 b=OCq78ri7WP5rFG3nyeYE4EzRpJ1JoND2D6KWdLG1vYHlvkT/rmKR5mhjGw/e5SleV45HRR
 RNVW2FNUkkaCXxmVAGWhmBUEaZJ1kwioIMvvUoebj0c98fz9PtDJkzs+gyM6lYaNbM2hbs
 woO0RV6sczt52oZCTSrcUkIQBBrxfJs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Ip1zP9w6NrmBLe_rWZURZg-1; Sun, 24 Sep 2023 20:24:23 -0400
X-MC-Unique: Ip1zP9w6NrmBLe_rWZURZg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6928ae8bf5bso3730769b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 24 Sep 2023 17:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695601463; x=1696206263;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aPk3ge9QXMJ1XbAnO/Cqt8Jm9Bz3ZpC9BoVYrzsRNtg=;
 b=QMowFYB8sXDj5xtGZx8FIOhHw7XX2ggEiQE2u2n7XiSkYEiX4LHCEb/YYQ+RplNaEZ
 yrYpJoOMr4YAb2XuGn6Ig4ZYXRV3LvTLBGN9Ov5Fe8Se8ZnotPrbcPlLZtTqNtjcFmAf
 SCkZjwvDsn0T7wuLGn1fSOuuzfYwqcfnJ31SuaMkWMcpDc1e7BsxLxiqyV2TP0zpjAvO
 lp/h1pSaBWLMiR1f737TPKx2qis5U3jzwqBIk8neAOZ3Zw/xFgte+I9pSufVa+KL6dFC
 HMNiLofOMQDXIPeSwW1A2A7ADaojVCsTCeZGKu6lbQ/vEonyw/lxku5uDDUOLUwr5DDP
 re8w==
X-Gm-Message-State: AOJu0YwmpTRTrglpbBZZWW7fxQRNng90UB205eARaatVcNwkvJC5o6yq
 Qu/2fqfZm+sEV5M+wCXiXTHkfgK628Cd3UqfMsR+94KgrylUcvc36hu5Or1bst9dZZjQ9huA9rS
 EZ82K+afTovkhBP8=
X-Received: by 2002:a05:6a00:1748:b0:68e:399e:70db with SMTP id
 j8-20020a056a00174800b0068e399e70dbmr4446383pfc.6.1695601462763; 
 Sun, 24 Sep 2023 17:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7kXbdwEQD1GHwmR8IHYWPV5gVi0bNVYVlSZD8uh17vaFrkGYUwuUAURW0v154406zN7nGpQ==
X-Received: by 2002:a05:6a00:1748:b0:68e:399e:70db with SMTP id
 j8-20020a056a00174800b0068e399e70dbmr4446338pfc.6.1695601462370; 
 Sun, 24 Sep 2023 17:24:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a62ee0f000000b00686fe7b7b48sm6728499pfi.121.2023.09.24.17.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 17:24:21 -0700 (PDT)
Message-ID: <a42dd7a0-e73f-8410-d096-8298da03f70d@redhat.com>
Date: Mon, 25 Sep 2023 10:24:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
From: Gavin Shan <gshan@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-4-philmd@linaro.org>
 <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
 <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
 <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
In-Reply-To: <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi Philippe,

On 9/12/23 08:40, Gavin Shan wrote:
> On 9/11/23 19:43, Philippe Mathieu-Daudé wrote:
>> On 11/9/23 01:28, Gavin Shan wrote:
>>> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>>>> Add a field to return the QOM type name of a CPU class.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   include/hw/core/cpu.h   | 2 ++
>>>>   hw/core/cpu-common.c    | 2 +-
>>>>   target/alpha/cpu.c      | 1 +
>>>>   target/arm/cpu.c        | 1 +
>>>>   target/avr/cpu.c        | 1 +
>>>>   target/cris/cpu.c       | 1 +
>>>>   target/hexagon/cpu.c    | 1 +
>>>>   target/hppa/cpu.c       | 1 +
>>>>   target/i386/cpu.c       | 1 +
>>>>   target/loongarch/cpu.c  | 1 +
>>>>   target/m68k/cpu.c       | 1 +
>>>>   target/microblaze/cpu.c | 1 +
>>>>   target/mips/cpu.c       | 1 +
>>>>   target/nios2/cpu.c      | 1 +
>>>>   target/openrisc/cpu.c   | 1 +
>>>>   target/ppc/cpu_init.c   | 1 +
>>>>   target/riscv/cpu.c      | 1 +
>>>>   target/rx/cpu.c         | 1 +
>>>>   target/s390x/cpu.c      | 1 +
>>>>   target/sh4/cpu.c        | 1 +
>>>>   target/sparc/cpu.c      | 1 +
>>>>   target/tricore/cpu.c    | 1 +
>>>>   target/xtensa/cpu.c     | 1 +
>>>>   23 files changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index 129d179937..e469efd409 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>>>   /**
>>>>    * CPUClass:
>>>> + * @cpu_resolving_type: CPU QOM type name
>>>>    * @class_by_name: Callback to map -cpu command line model name to an
>>>>    *                 instantiatable CPU type.
>>>>    * @parse_features: Callback to parse command line arguments.
>>>> @@ -148,6 +149,7 @@ struct CPUClass {
>>>>       DeviceClass parent_class;
>>>>       /*< public >*/
>>>> +    const char *cpu_resolving_type;
>>>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>>>       void (*parse_features)(const char *typename, char *str, Error **errp);
>>>
>>> The question is why not use CPU_RESOLVING_TYPE directly? It seems CPU_RESOLVING_TYPE
>>> is exactly what you want here.
>>
>> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
>> hw/core/cpu-common.c to be target-agnostic (build once for all
>> targets). This is particularly important in the context of
>> heterogeneous QEMU, where a single binary will be able to create
>> CPUs from different targets.
>>
> 
> CPU_RESOLVING_TYPE and CPUClass::cpu_resolving_type is duplicate to
> each other. There are two options I can figure out to avoid the
> duplication.
> 
> (a) move cpu_class_by_name() from hw/core/cpu-common.c to cpu.c, so that
>      CPU_RESOLVING_TYPE can be seen. cpu.c::list_cpus() is the example.
> 
> (b) remove hw/core/cpu-common.c::cpu_calss_by_name() and squeeze its
>      logic to cpu.c::parse_cpu_option() since there are not too much
>      users for it. target/arm and target/s390 needs some tweaks so that
>      hw/core/cpu-common.c::cpu_calss_by_name() can be removed.
> 
>      [gshan@gshan q]$ git grep \ cpu_class_by_name\(
>      cpu.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
>      target/arm/arm-qmp-cmds.c:    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>      target/s390x/cpu_models_sysemu.c:    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);
> 
> When option (b) is taken, this series to have the checks against @oc
> in hw/core/cpu-common.c::cpu_calss_by_name() becomes non-sense. Instead,
> we need the same (and complete) checks in CPUClass::class_by_name() for
> individual targets. Further more, an inline helper can be provided to do
> the check in CPUClass::class_by_name() for individual targets.
> 
>     include/hw/core/cpu.h
> 
>     static inline bool cpu_class_is_valid(ObjectClass *oc, const char *parent)
>     {
>         if (!object_class_dynamic_cast(oc, parent) ||
>             object_class_is_abstract(oc)) {
>             return false;
>         }
> 
>         return true;
>     }
> 

Since my series to make CPU type check unified depends on this series, could
you please share your thoughts? If you don't have bandwidth for this, I can
improve the code based on your thoughts, and include your patches to my series
so that they can be reviewed at once. Please just let me know.

Thanks,
Gavin



