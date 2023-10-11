Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A14CD98F8
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 06:15:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqSUX-0004ny-Rf; Wed, 11 Oct 2023 02:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqSU2-0004ZX-Fh; Wed, 11 Oct 2023 02:14:14 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqSTx-0002OT-4U; Wed, 11 Oct 2023 02:14:13 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R771e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=47; SR=0;
 TI=SMTPD_---0VtvF12m_1697004820; 
Received: from 30.221.100.88(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtvF12m_1697004820) by smtp.aliyun-inc.com;
 Wed, 11 Oct 2023 14:13:42 +0800
Message-ID: <c8bcb233-62a8-4ce3-a08d-1da49d896c86@linux.alibaba.com>
Date: Wed, 11 Oct 2023 14:12:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Brian Cain <bcain@quicinc.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/10/11 11:21, Philippe Mathieu-Daudé wrote:
> Hi Zhiwei,
>
> On 11/10/23 04:51, LIU Zhiwei wrote:
>>
>> On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
>>> Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
>>> macro to resolve target CPU types.
>>
>> Hi Philippe,
>>
>> I don't understand why should we use FOO_CPU_TYPE_NAME macro to 
>> resolve target CPU types? In my opinion, we should pass the
>> CPU typename from command line for heterogeneous case.
>>
>> Could you make it clearer how should we use FOO_CPU_TYPE_NAME macro 
>> to resolve target CPU types in heterogeneous case?
>
> To be honest I start to feel a bit lost with the "cpu
> resolving type" design.
>
> We are not quite there yet to "create from command line"
> or "create from QMP", so I'm prototyping in plain C.
> One of my test is:
>
>   #include "target/arm/cpu-qom.h"
>   #include "target/hexagon/cpu-qom.h"
>   ...
>
>   static void
>   my_machine3_init((MachineState *machine)
>   {
>     CPUState cpu[2];
>     ...
>
>     cpu[0] = CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a72")));
>     cpu[1] = CPU(object_new(HEXAGON_CPU_TYPE_NAME("v68")));
>     ...
>   }
>
> The machine code need access to the per-target
> FOO_CPU_TYPE_NAME() macros. 

I see what you mean. It works if we will pass the cpu model instead of 
cpu typename to the machine state(Not yet).

Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> I'm not sure what each macro
> expands to is considered stable, so IIUC I can't inline and use:
>
>     cpu[0] = CPU(object_new("cortex-a72-arm-cpu"));
>     cpu[1] = CPU(object_new("v68"-hexagon-cpu));
>
> That said, maybe I'm mistaken.
>
> Kinda related discussion with Gavin/Igor:
> https://lore.kernel.org/qemu-devel/35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com/ 
>
> (related to 
> https://lore.kernel.org/qemu-devel/20230907003553.1636896-1-gshan@redhat.com/).
>
>>
>> Thanks,
>> Zhiwei
>>
>>> Move the declaration
>>> (along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/alpha/cpu-qom.h   | 5 ++++-
>>>   target/alpha/cpu.h       | 2 --
>>>   target/avr/cpu-qom.h     | 5 ++++-
>>>   target/avr/cpu.h         | 2 --
>>>   target/cris/cpu-qom.h    | 5 ++++-
>>>   target/cris/cpu.h        | 2 --
>>>   target/i386/cpu-qom.h    | 3 +++
>>>   target/i386/cpu.h        | 2 --
>>>   target/m68k/cpu-qom.h    | 5 ++++-
>>>   target/m68k/cpu.h        | 2 --
>>>   target/mips/cpu-qom.h    | 3 +++
>>>   target/mips/cpu.h        | 2 --
>>>   target/rx/cpu-qom.h      | 5 ++++-
>>>   target/rx/cpu.h          | 2 --
>>>   target/s390x/cpu-qom.h   | 5 ++++-
>>>   target/s390x/cpu.h       | 2 --
>>>   target/sh4/cpu-qom.h     | 5 ++++-
>>>   target/sh4/cpu.h         | 2 --
>>>   target/sparc/cpu-qom.h   | 5 ++++-
>>>   target/sparc/cpu.h       | 2 --
>>>   target/tricore/cpu-qom.h | 5 +++++
>>>   target/tricore/cpu.h     | 2 --
>>>   target/xtensa/cpu-qom.h  | 5 ++++-
>>>   target/xtensa/cpu.h      | 2 --
>>>   24 files changed, 47 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
>>> index 1f200724b6..d596d1b69f 100644
>>> --- a/target/alpha/cpu-qom.h
>>> +++ b/target/alpha/cpu-qom.h
>>> @@ -1,5 +1,5 @@
>>>   /*
>>> - * QEMU Alpha CPU
>>> + * QEMU Alpha CPU QOM header (target agnostic)
>>>    *
>>>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>>>    *
>>> @@ -27,6 +27,9 @@
>>>   OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
>>> +#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>>> +#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>> +
>>>   /**
>>>    * AlphaCPUClass:
>>>    * @parent_realize: The parent class' realize handler.
>>> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
>>> index e2a467ec17..ba0d9e3468 100644
>>> --- a/target/alpha/cpu.h
>>> +++ b/target/alpha/cpu.h
>>> @@ -428,8 +428,6 @@ enum {
>>>   void alpha_translate_init(void);
>>> -#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>>> -#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>>   #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>>>   void alpha_cpu_list(void);
> [...]

