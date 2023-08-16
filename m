Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE15DC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWIAO-0005Vq-WC; Wed, 16 Aug 2023 11:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWIAL-0005U7-Ta
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:10:34 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWIAI-0005z4-UE
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:10:33 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a7781225b4so5374959b6e.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692198628; x=1692803428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GtoAo+YxHq0clYt7noLkNz2QwIMfUfU18YfbLW+CcZw=;
 b=x571F1g6bhI/imq7nswqdVi6pdBnlRL5suIXx9pVbrSD60+ryP03ijxfrXv+ZonCnL
 Pqs62fp8c1gdveQFMPbdAFr8DqEakNVuGmTloYUCHvt4L+8Y8U91IwrywXzMc4leUrkG
 t9n/7WMJarsxqPhbTf6/R2gikQJblVVJdhpQFiWg9pracbPxg7dp/i6cXXi0dIW4pJWn
 OH4BCeXKBnEPNaX11ok/TTgRY+13gVPDWitN2nu1DQg6CXBygaAOXw5VfJiQNKwKJicf
 Sr1xO29v9/GwEUNUTiRZfODGZyrJ2pFf5kI5DWQHlk+Cc3bvGJDamS8UlVB6aYgATZCF
 Jmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692198628; x=1692803428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GtoAo+YxHq0clYt7noLkNz2QwIMfUfU18YfbLW+CcZw=;
 b=SIIs5PWiUp+0QWzUMc9hphAwIRajSCY5NokyWOra7SO505CDzLb2XXbCfXj4dwPgyV
 UQBO5TMvIGb57hSaGRsMbCTBvTFN/Fx/lENDVOyePcww7BscN50ut3c9fx1S8ctkc/i+
 xfkznyroERLnLFKGzhxUA9WyTl+zGmS/tilWNZFvyUZ1ldZ1bdnp4o5XBbJ+H1LgSPQe
 4E8hRTzNhtG7dQs1l1A3vGF440eTk3zmECVMd13iIHeBYg3SCN21UVrfzvSMrucmCYJ7
 BEVcN23Epm/DBh0K5jVrHT55YS3AJQ6Er26lHvT/cwjQsxofacZThQzko9b2NzX7xH1N
 8fyg==
X-Gm-Message-State: AOJu0YxniGv11dZ85/HjG83bQO7fxDL+kUlkQsW0ZdErW5SJ6aKAsZZJ
 uWxmVLQt/foTfpaUSy6k+Wfzpw==
X-Google-Smtp-Source: AGHT+IHoY8nLEIT/A9eWI3EkdY0/kp2NxDyiFfDp57Yfn++hxAybdRaiFFvValtegzFhn55DAj3sWA==
X-Received: by 2002:a05:6808:f94:b0:3a7:239d:af64 with SMTP id
 o20-20020a0568080f9400b003a7239daf64mr2278717oiw.49.1692198628312; 
 Wed, 16 Aug 2023 08:10:28 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a639e0a000000b005633311c70dsm10919319pgd.32.2023.08.16.08.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 08:10:27 -0700 (PDT)
Message-ID: <05c975ac-4138-4705-9dae-9b529ddb70d4@daynix.com>
Date: Thu, 17 Aug 2023 00:10:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
 <871qg5sryb.fsf@linaro.org> <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
 <87v8dfni7r.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87v8dfni7r.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::230;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x230.google.com
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

On 2023/08/17 0:00, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/08/14 20:59, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>>>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>>>> also replaces the values assigned to gdb_num_core_regs with the
>>>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>>>
>>>> A following change will utilize additional information provided by
>>>> GDBFeature to simplify XML file lookup.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    include/hw/core/cpu.h   | 5 +++--
>>>>    target/s390x/cpu.h      | 2 --
>>>>    gdbstub/gdbstub.c       | 6 +++---
>>>>    target/arm/cpu.c        | 4 ++--
>>>>    target/arm/cpu64.c      | 4 ++--
>>>>    target/arm/tcg/cpu32.c  | 3 ++-
>>>>    target/avr/cpu.c        | 4 ++--
>>>>    target/hexagon/cpu.c    | 2 +-
>>>>    target/i386/cpu.c       | 7 +++----
>>>>    target/loongarch/cpu.c  | 4 ++--
>>>>    target/m68k/cpu.c       | 7 ++++---
>>>>    target/microblaze/cpu.c | 4 ++--
>>>>    target/ppc/cpu_init.c   | 4 ++--
>>>>    target/riscv/cpu.c      | 7 ++++---
>>>>    target/rx/cpu.c         | 4 ++--
>>>>    target/s390x/cpu.c      | 4 ++--
>>>>    16 files changed, 36 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>> index fdcbe87352..84219c1885 100644
>>>> --- a/include/hw/core/cpu.h
>>>> +++ b/include/hw/core/cpu.h
>>>> @@ -23,6 +23,7 @@
>>>>    #include "hw/qdev-core.h"
>>>>    #include "disas/dis-asm.h"
>>>>    #include "exec/cpu-common.h"
>>>> +#include "exec/gdbstub.h"
>>>>    #include "exec/hwaddr.h"
>>>>    #include "exec/memattrs.h"
>>>>    #include "qapi/qapi-types-run-state.h"
>>>> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>>>>     *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>>>     *       its Harvard architecture split code and data.
>>>>     * @gdb_num_core_regs: Number of core registers accessible to GDB.
>>> It seems redundant to have this when gdb_core_features already
>>> encapsulates this, especially since...
>>>
>>>> - * @gdb_core_xml_file: File name for core registers GDB XML description.
>>>> + * @gdb_core_feature: GDB core feature description.
>>>>     * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>>>>     *           before the insn which triggers a watchpoint rather than after it.
>>>>     * @gdb_arch_name: Optional callback that returns the architecture name known
>>>> @@ -163,7 +164,7 @@ struct CPUClass {
>>>>        int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>>>>        vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>>>    -    const char *gdb_core_xml_file;
>>>> +    const GDBFeature *gdb_core_feature;
>>>>        gchar * (*gdb_arch_name)(CPUState *cpu);
>>>>        const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
>>>>    
>>> <snip>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> index d71a162070..a206ab6b1b 100644
>>>> --- a/target/arm/cpu.c
>>>> +++ b/target/arm/cpu.c
>>>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>>>    #ifndef CONFIG_USER_ONLY
>>>>        cc->sysemu_ops = &arm_sysemu_ops;
>>>>    #endif
>>>> -    cc->gdb_num_core_regs = 26;
>>>>        cc->gdb_arch_name = arm_gdb_arch_name;
>>>>        cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>>>        cc->gdb_stop_before_watchpoint = true;
>>>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>>>>        CPUClass *cc = CPU_CLASS(acc);
>>>>          acc->info = data;
>>>> -    cc->gdb_core_xml_file = "arm-core.xml";
>>>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
>>>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>>> You are doing assignments like this. I think something like this in
>>> gdbstub:
>>> modified   gdbstub/gdbstub.c
>>> @@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
>>>        CPUArchState *env = cpu->env_ptr;
>>>        GDBRegisterState *r;
>>>    -    if (reg < cc->gdb_num_core_regs) {
>>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>>            return cc->gdb_read_register(cpu, buf, reg, has_xml);
>>>        }
>>>    @@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu,
>>> uint8_t *mem_buf, int reg,
>>>        CPUArchState *env = cpu->env_ptr;
>>>        GDBRegisterState *r;
>>>    -    if (reg < cc->gdb_num_core_regs) {
>>> +    if (reg < cc->gdb_core_feature->num_regs) {
>>>            return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
>>>        }
>>> makes most of the uses go away. Some of the other arches might need
>>> target specific tweaks.
>>
>> The problem is how to deal with the target specific tweaks. ppc
>> requires gdb_num_core_regs to have some value greater than
>> cc->gdb_core_feature->num_regs for compatibility with legacy GDB.
>> Other architectures simply do not have XMLs. Simply replacing
>> cc->gdb_num_core_regs with cc->gdb_core_feature->num_regs will break
>> those architectures.
> 
> How about:
> 
>    int core_regs = cc->gdb_core_feature ? cc->gdb_core_feature->num_regs
>    : cc->gdb_num_core_regs
> 
> And document the field as for legacy gdb use only?

I'm not sure. It looks a more error-prone way to derive the core 
register number.

> 
>>
>>> <snip>
>>>
> 
> 

