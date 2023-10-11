Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2E9CD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPn9-0002Qj-Ke; Tue, 10 Oct 2023 23:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqPn7-0002Pm-Ta
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 23:21:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqPn6-0005T4-1a
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 23:21:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53b962f09e0so5967303a12.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696994502; x=1697599302; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rf5gxsbp430mWT7/Bc31GPupiZtpSrleCvdmHeu8VwU=;
 b=O3LSbvJGRBxmaMS4VnN/y0/hGA/75g1CJXfvYOQDE1C5MyJ3RQY3Rxp0EmyAF1BvVD
 fssoX5uCjpzNoP7S+lAYAZh4FARj0IaV+hn9dD1CHmJteJQCf5qEMvjappsSKT6rHaoR
 1vBpZZ+QXwBWer2/ixrAMYMbQtv7Dz4HWV5SG9JlpwqVo6VcY6v8gd5KpUVBNpj+S9pP
 iAnsjbGLKu/PPBAisWJPun/YMc/k5uoRuiB8TSVLZimKQoIY4GSHNVEvC71EiVD1cvx9
 T0zcrFh1marlG7NLlTanP7uPhXu5iamIaat80LxSV+KiCA7yWo4HSMMAXcSiLWvo7xOQ
 +zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696994502; x=1697599302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rf5gxsbp430mWT7/Bc31GPupiZtpSrleCvdmHeu8VwU=;
 b=dP9BClHz2U9GuaBd1IsHAAYgdIAAMKODrd+rjiuPvSn3895ZRhRJIJ9UAAXyW495O8
 1hItedQ6m90pUhpmBu0dQmUuydpbULXhBvbZoJbaNZYgxUkJUy8J0we9aHsy4u8sz9/n
 /dB7cx/5c4WBtTgNCzlg4THkPirZn2khhNkiNbW9HR3s/d39r3+eznHn3uGtt/LCunx9
 kt0ck7a7pRh+I/v1gWWnZenKVnSnUlH4YgzoP0qt/1fU9nNp9IKouwT5Lf/v/hH7ZF+t
 x2+DpttniBms65F0xwu5BdIcYyfGfkIVQ/uc2cs8kevWgmyx0JpDTftlbxjeWROOFzu0
 X7Ng==
X-Gm-Message-State: AOJu0YzufUsupUtooFuYbOIR/2CY5f6eUFKJKif7NWfG1q0w/N07F/nH
 RbYqPTX760ky+30Hr9AKJLumQg==
X-Google-Smtp-Source: AGHT+IFsoEg+3hmwPLtWkPthJP1a4BnRC8wMFOGJDp/mP781dneXsFI+nVjx6QPZh61yK1gcooY3tQ==
X-Received: by 2002:a05:6402:6d4:b0:533:4c67:c911 with SMTP id
 n20-20020a05640206d400b005334c67c911mr17781768edy.19.1696994501830; 
 Tue, 10 Oct 2023 20:21:41 -0700 (PDT)
Received: from [192.168.69.115] (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056402048c00b0052ffc2e82f1sm8393286edv.4.2023.10.10.20.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 20:21:41 -0700 (PDT)
Message-ID: <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
Date: Wed, 11 Oct 2023 05:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 04/18] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Brian Cain <bcain@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-5-philmd@linaro.org>
 <348eaf9c-9fb6-4674-b324-c3f3017f1851@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <348eaf9c-9fb6-4674-b324-c3f3017f1851@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

Hi Zhiwei,

On 11/10/23 04:51, LIU Zhiwei wrote:
> 
> On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
>> Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
>> macro to resolve target CPU types.
> 
> Hi Philippe,
> 
> I don't understand why should we use FOO_CPU_TYPE_NAME macro to resolve 
> target CPU types? In my opinion, we should pass the
> CPU typename from command line for heterogeneous case.
> 
> Could you make it clearer how should we use FOO_CPU_TYPE_NAME macro to 
> resolve target CPU types in heterogeneous case?

To be honest I start to feel a bit lost with the "cpu
resolving type" design.

We are not quite there yet to "create from command line"
or "create from QMP", so I'm prototyping in plain C.
One of my test is:

   #include "target/arm/cpu-qom.h"
   #include "target/hexagon/cpu-qom.h"
   ...

   static void
   my_machine3_init((MachineState *machine)
   {
     CPUState cpu[2];
     ...

     cpu[0] = CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a72")));
     cpu[1] = CPU(object_new(HEXAGON_CPU_TYPE_NAME("v68")));
     ...
   }

The machine code need access to the per-target
FOO_CPU_TYPE_NAME() macros. I'm not sure what each macro
expands to is considered stable, so IIUC I can't inline and use:

     cpu[0] = CPU(object_new("cortex-a72-arm-cpu"));
     cpu[1] = CPU(object_new("v68"-hexagon-cpu));

That said, maybe I'm mistaken.

Kinda related discussion with Gavin/Igor:
https://lore.kernel.org/qemu-devel/35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com/
(related to 
https://lore.kernel.org/qemu-devel/20230907003553.1636896-1-gshan@redhat.com/).

> 
> Thanks,
> Zhiwei
> 
>> Move the declaration
>> (along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/alpha/cpu-qom.h   | 5 ++++-
>>   target/alpha/cpu.h       | 2 --
>>   target/avr/cpu-qom.h     | 5 ++++-
>>   target/avr/cpu.h         | 2 --
>>   target/cris/cpu-qom.h    | 5 ++++-
>>   target/cris/cpu.h        | 2 --
>>   target/i386/cpu-qom.h    | 3 +++
>>   target/i386/cpu.h        | 2 --
>>   target/m68k/cpu-qom.h    | 5 ++++-
>>   target/m68k/cpu.h        | 2 --
>>   target/mips/cpu-qom.h    | 3 +++
>>   target/mips/cpu.h        | 2 --
>>   target/rx/cpu-qom.h      | 5 ++++-
>>   target/rx/cpu.h          | 2 --
>>   target/s390x/cpu-qom.h   | 5 ++++-
>>   target/s390x/cpu.h       | 2 --
>>   target/sh4/cpu-qom.h     | 5 ++++-
>>   target/sh4/cpu.h         | 2 --
>>   target/sparc/cpu-qom.h   | 5 ++++-
>>   target/sparc/cpu.h       | 2 --
>>   target/tricore/cpu-qom.h | 5 +++++
>>   target/tricore/cpu.h     | 2 --
>>   target/xtensa/cpu-qom.h  | 5 ++++-
>>   target/xtensa/cpu.h      | 2 --
>>   24 files changed, 47 insertions(+), 33 deletions(-)
>>
>> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
>> index 1f200724b6..d596d1b69f 100644
>> --- a/target/alpha/cpu-qom.h
>> +++ b/target/alpha/cpu-qom.h
>> @@ -1,5 +1,5 @@
>>   /*
>> - * QEMU Alpha CPU
>> + * QEMU Alpha CPU QOM header (target agnostic)
>>    *
>>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>>    *
>> @@ -27,6 +27,9 @@
>>   OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
>> +#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>> +#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>> +
>>   /**
>>    * AlphaCPUClass:
>>    * @parent_realize: The parent class' realize handler.
>> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
>> index e2a467ec17..ba0d9e3468 100644
>> --- a/target/alpha/cpu.h
>> +++ b/target/alpha/cpu.h
>> @@ -428,8 +428,6 @@ enum {
>>   void alpha_translate_init(void);
>> -#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>> -#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>   #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>>   void alpha_cpu_list(void);
[...]

