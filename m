Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188D4C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 14:58:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r013q-0003Kk-Va; Mon, 06 Nov 2023 09:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r013m-0003GG-DG
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 09:58:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r013h-0005Tq-F9
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 09:58:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40839807e82so28010615e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699282710; x=1699887510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G7jeyfc1W8DSP9oWF4r1xDBFL58foM+AMjlNuNg9rZs=;
 b=TVLUgD8KBLIcvheL+o/MUDTlCXk6ScYalG1407AphmLkszK4Ttk30xd6BMtiCg2q4w
 2Wa801JeLqKcdgx9JbPynCZVIrLpIdxkuhPW2dF11pOVAOvK6I60Ox9r6tRxy5isEH+B
 atDPdGjmEvp5vo94tqlvGpgsmFvfXeJaveyoFj0OsaPVPv4r211JbhpGzmZXCEnpwPka
 +vWRKq4/JbeNE7GU6QOVGFGPZjHT8d89QTWIuuqW3rSzL0ve1XV6c9gqqstrZIE1A2l6
 U4Iu7C6x/0eju8Mxyx6ns3X+tE0e4pvBJ4acqGqdy7upP6FzbyPjnHA51DbG5INQVbio
 sSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699282710; x=1699887510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7jeyfc1W8DSP9oWF4r1xDBFL58foM+AMjlNuNg9rZs=;
 b=BmrugvqkVqHorigRC5Q1FSiFO1RMs2e2kzjQfKhlOlAjnn3hqH3R8c87M0SsBQiWqW
 5JfRPVgCGNI2Hyfof76p+efRs5wAgLA7RixCc0NmJxPOWFYelV19KfpPWdnySKon+udz
 vPm5hed/+C1fZiOcAi6MJQOzGIMcW9n+3Ry/nXLACoZc4cn3AJypHEjpZm7iexpucma8
 GKlnfu/XxbDOZPktRYjp+OGDH6ehs5hT2S57iUGVqIFsmbjPk8Oby++Vz+kEW3wtP7Jc
 I4KqHZA77MB6SpYY/sfUZE4MhS3c+Q4uEetqLbWsZSxiUR8GeVf/PEWLcvrb9S4dIUMZ
 vgdQ==
X-Gm-Message-State: AOJu0YyCXhpJMc1SrD1mWhY5DeWAGOs7r6iZTu7x21bYckFwQkgTThde
 +q5w/EHDoB6+PDkNw/6KZwmjwg==
X-Google-Smtp-Source: AGHT+IGZhsUPAkEDo9vC+lXjF3C64+Sk6NYmIKQsG+DzwP6ZuMTiAKzddoyopFMchwhr0K/UTKzs3Q==
X-Received: by 2002:a7b:ce11:0:b0:405:3ab3:e640 with SMTP id
 m17-20020a7bce11000000b004053ab3e640mr9665940wmc.20.1699282710104; 
 Mon, 06 Nov 2023 06:58:30 -0800 (PST)
Received: from [192.168.69.115] (176-131-220-199.abo.bbox.fr.
 [176.131.220.199]) by smtp.gmail.com with ESMTPSA id
 gy14-20020a05600c880e00b00403b63e87f2sm12169569wmb.32.2023.11.06.06.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 06:58:29 -0800 (PST)
Message-ID: <9b6eb677-1655-e452-2555-01eb01cf9072@linaro.org>
Date: Mon, 6 Nov 2023 15:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 12/16] target: Move ArchCPUClass definition to 'cpu.h'
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <20231013140116.255-13-philmd@linaro.org> <ZTI0T98ruc3yWSsa@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZTI0T98ruc3yWSsa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.085,
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

On 20/10/23 10:03, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Oct 13, 2023 at 04:01:11PM +0200, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 13 Oct 2023 16:01:11 +0200
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 12/16] target: Move ArchCPUClass definition to 'cpu.h'
>> X-Mailer: git-send-email 2.41.0
>>
>> The OBJECT_DECLARE_CPU_TYPE() macro forward-declares each
>> ArchCPUClass type. These forward declarations are sufficient
>> for code in hw/ to use the QOM definitions. No need to expose
>> these structure definitions. Keep each local to their target/
>> by moving them to the corresponding "cpu.h" header.
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/alpha/cpu-qom.h      | 16 ---------------
>>   target/alpha/cpu.h          | 13 +++++++++++++
>>   target/arm/cpu-qom.h        | 27 -------------------------
>>   target/arm/cpu.h            | 25 ++++++++++++++++++++++++
>>   target/avr/cpu-qom.h        | 16 ---------------
>>   target/avr/cpu.h            | 14 +++++++++++++
>>   target/cris/cpu-qom.h       | 19 ------------------
>>   target/cris/cpu.h           | 16 +++++++++++++++
>>   target/hexagon/cpu-qom.h    |  1 -
>>   target/hppa/cpu-qom.h       | 16 ---------------
>>   target/hppa/cpu.h           | 14 +++++++++++++
>>   target/i386/cpu-qom.h       | 39 -------------------------------------
>>   target/i386/cpu.h           | 35 +++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu-qom.h  |  1 -
>>   target/m68k/cpu-qom.h       | 16 ---------------
>>   target/m68k/cpu.h           | 13 +++++++++++++
>>   target/microblaze/cpu-qom.h | 16 ---------------
>>   target/microblaze/cpu.h     | 13 +++++++++++++
>>   target/mips/cpu-qom.h       | 20 -------------------
>>   target/mips/cpu.h           | 17 ++++++++++++++++
>>   target/nios2/cpu-qom.h      |  1 -
>>   target/openrisc/cpu-qom.h   |  1 -
>>   target/riscv/cpu-qom.h      | 16 +--------------
>>   target/riscv/cpu.h          | 14 +++++++++++++
>>   target/rx/cpu-qom.h         | 15 --------------
>>   target/rx/cpu.h             | 14 +++++++++++++
>>   target/s390x/cpu-qom.h      | 37 +----------------------------------
>>   target/s390x/cpu.h          | 30 ++++++++++++++++++++++++++++
>>   target/s390x/cpu_models.h   |  8 ++++----
>>   target/sh4/cpu-qom.h        | 23 ----------------------
>>   target/sh4/cpu.h            | 20 +++++++++++++++++++
>>   target/sparc/cpu-qom.h      | 18 -----------------
>>   target/sparc/cpu.h          | 18 +++++++++++++++--
>>   target/tricore/cpu-qom.h    | 10 ----------
>>   target/tricore/cpu.h        |  6 ++++++
>>   target/xtensa/cpu-qom.h     | 21 --------------------
>>   target/xtensa/cpu.h         | 20 +++++++++++++++++--
>>   37 files changed, 284 insertions(+), 335 deletions(-)


>> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
>> index dffc74c1ce..d4e216d000 100644
>> --- a/target/i386/cpu-qom.h
>> +++ b/target/i386/cpu-qom.h
>> @@ -21,8 +21,6 @@
>>   #define QEMU_I386_CPU_QOM_H
>>   
>>   #include "hw/core/cpu.h"
>> -#include "qemu/notify.h"
>> -#include "qom/object.h"
>>   
>>   #ifdef TARGET_X86_64
>>   #define TYPE_X86_CPU "x86_64-cpu"
>> @@ -35,41 +33,4 @@ OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
>>   #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
>>   #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
>>   
>> -typedef struct X86CPUModel X86CPUModel;
>> -
>> -/**
>> - * X86CPUClass:
>> - * @cpu_def: CPU model definition
>> - * @host_cpuid_required: Whether CPU model requires cpuid from host.
>> - * @ordering: Ordering on the "-cpu help" CPU model list.
>> - * @migration_safe: See CpuDefinitionInfo::migration_safe
>> - * @static_model: See CpuDefinitionInfo::static
>> - * @parent_realize: The parent class' realize handler.
>> - * @parent_phases: The parent class' reset phase handlers.
>> - *
>> - * An x86 CPU model or family.
>> - */
>> -struct X86CPUClass {
>> -    CPUClass parent_class;
>> -
>> -    /* CPU definition, automatically loaded by instance_init if not NULL.
>> -     * Should be eventually replaced by subclass-specific property defaults.
>> -     */
>> -    X86CPUModel *model;
>> -
>> -    bool host_cpuid_required;
>> -    int ordering;
>> -    bool migration_safe;
>> -    bool static_model;
>> -
>> -    /* Optional description of CPU model.
>> -     * If unavailable, cpu_def->model_id is used */
>> -    const char *model_description;
>> -
>> -    DeviceRealize parent_realize;
>> -    DeviceUnrealize parent_unrealize;
>> -    ResettablePhases parent_phases;
>> -};
>> -
>> -
>>   #endif
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 2dea4df086..e21d293daa 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -2037,6 +2037,41 @@ struct ArchCPU {
>>       bool xen_vapic;
>>   };
>>   
>> +typedef struct X86CPUModel X86CPUModel;
> 
> Could we "typedef" this structure at its definition?

No, because X86CPUClass uses the declaration in its 'model' field
in [*], so we have to forward-declare it first.

> Then this explicit "typedef" can also be omitted, just like you did
> elsewhere.
> 
>> +
>> +/**
>> + * X86CPUClass:
>> + * @cpu_def: CPU model definition
>> + * @host_cpuid_required: Whether CPU model requires cpuid from host.
>> + * @ordering: Ordering on the "-cpu help" CPU model list.
>> + * @migration_safe: See CpuDefinitionInfo::migration_safe
>> + * @static_model: See CpuDefinitionInfo::static
>> + * @parent_realize: The parent class' realize handler.
>> + * @parent_phases: The parent class' reset phase handlers.
>> + *
>> + * An x86 CPU model or family.
>> + */
>> +struct X86CPUClass {
>> +    CPUClass parent_class;
>> +
>> +    /* CPU definition, automatically loaded by instance_init if not NULL.
>> +     * Should be eventually replaced by subclass-specific property defaults.
>> +     */
>> +    X86CPUModel *model;

[*]     ^^^^^^^^^^^

>> +    bool host_cpuid_required;
>> +    int ordering;
>> +    bool migration_safe;
>> +    bool static_model;
>> +
>> +    /* Optional description of CPU model.
>> +     * If unavailable, cpu_def->model_id is used */
>> +    const char *model_description;
>> +
>> +    DeviceRealize parent_realize;
>> +    DeviceUnrealize parent_unrealize;
>> +    ResettablePhases parent_phases;
>> +};


>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index 76efb614a6..35ca5c4600 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -20,7 +20,6 @@
>>   #define RISCV_CPU_QOM_H
>>   
>>   #include "hw/core/cpu.h"
>> -#include "qom/object.h"
>>   
>>   #define TYPE_RISCV_CPU "riscv-cpu"
>>   #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
>> @@ -44,21 +43,8 @@
>>   #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>>   
>> -typedef struct CPUArchState CPURISCVState;
>> +typedef struct CPUArchState CPURISCVState; // XXX
> 
> Is "// XXX" redundant?

Good catch, I forgot about this comment. I now simply moved that
to "cpu.h".

> 
>>   
>>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>>   
>> -/**
>> - * RISCVCPUClass:
>> - * @parent_realize: The parent class' realize handler.
>> - * @parent_phases: The parent class' reset phase handlers.
>> - *
>> - * A RISCV CPU model.
>> - */
>> -struct RISCVCPUClass {
>> -    CPUClass parent_class;
>> -
>> -    DeviceRealize parent_realize;
>> -    ResettablePhases parent_phases;
>> -};
>>   #endif /* RISCV_CPU_QOM_H */
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index d832696418..a7edf95213 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -414,6 +414,20 @@ struct ArchCPU {
>>       GHashTable *pmu_event_ctr_map;
>>   };
>>   
>> +/**
>> + * RISCVCPUClass:
>> + * @parent_realize: The parent class' realize handler.
>> + * @parent_phases: The parent class' reset phase handlers.
>> + *
>> + * A RISCV CPU model.
>> + */
>> +struct RISCVCPUClass {
>> +    CPUClass parent_class;
>> +
>> +    DeviceRealize parent_realize;
>> +    ResettablePhases parent_phases;
>> +};
>> +


>> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
>> index fcd70daddf..4037e31f79 100644
>> --- a/target/s390x/cpu-qom.h
>> +++ b/target/s390x/cpu-qom.h
>> @@ -21,7 +21,6 @@
>>   #define QEMU_S390_CPU_QOM_H
>>   
>>   #include "hw/core/cpu.h"
>> -#include "qom/object.h"
>>   
>>   #define TYPE_S390_CPU "s390x-cpu"
>>   
>> @@ -30,40 +29,6 @@ OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
>>   #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
>>   #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
>>   
>> -typedef struct S390CPUModel S390CPUModel;
>> -typedef struct S390CPUDef S390CPUDef;
>> -
>> -typedef struct CPUArchState CPUS390XState;
>> -
>> -typedef enum cpu_reset_type {
>> -    S390_CPU_RESET_NORMAL,
>> -    S390_CPU_RESET_INITIAL,
>> -    S390_CPU_RESET_CLEAR,
>> -} cpu_reset_type;
>> -
>> -/**
>> - * S390CPUClass:
>> - * @parent_realize: The parent class' realize handler.
>> - * @parent_reset: The parent class' reset handler.
>> - * @load_normal: Performs a load normal.
>> - * @cpu_reset: Performs a CPU reset.
>> - * @initial_cpu_reset: Performs an initial CPU reset.
>> - *
>> - * An S/390 CPU model.
>> - */
>> -struct S390CPUClass {
>> -    CPUClass parent_class;
>> -
>> -    const S390CPUDef *cpu_def;
>> -    bool kvm_required;
>> -    bool is_static;
>> -    bool is_migration_safe;
>> -    const char *desc;
>> -
>> -    DeviceRealize parent_realize;
>> -    DeviceReset parent_reset;
>> -    void (*load_normal)(CPUState *cpu);
>> -    void (*reset)(CPUState *cpu, cpu_reset_type type);
>> -};
>> +typedef struct CPUArchState CPUS390XState; // XXX
> 
> same here.

Oops, I forgot to send the preliminary series required to
remove that comment, see:
https://lore.kernel.org/qemu-devel/20231106114500.5269-1-philmd@linaro.org/

> Just the above nits. Otherwise,
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Thanks for your careful review!

