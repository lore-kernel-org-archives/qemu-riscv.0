Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7C1C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3ZlP-0003zh-BV; Thu, 16 Nov 2023 05:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZlG-0003yI-NN
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZlC-0003kL-1E
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHrTxseyHZ/YXypNq2A1t5EMJxLtEgwqj7VjPx6kz0s=;
 b=D8v+QeC2LdXVUhA1ZN3kFK7miKdNcQuabjY5xRu2SNAeaECJZ7QnP3YL7GQcmsNqbhbkPF
 n5lkBKJMwkhcpPPY0eNoSf3gEKTYtnQvNgivuUHiWrWRwiv1hcQAAC1u1B9y/7Rwi8oiGd
 2m74bFOg/UWTJbaTPh5Ne0riYOVLC10=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-_iua8C24MlqUU_CgDBL-Jw-1; Thu, 16 Nov 2023 05:38:07 -0500
X-MC-Unique: _iua8C24MlqUU_CgDBL-Jw-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cc281f1214so7592765ad.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131086; x=1700735886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHrTxseyHZ/YXypNq2A1t5EMJxLtEgwqj7VjPx6kz0s=;
 b=w+wlFLlrU6mZtTBK0dY0B/aF/4fhJLF3ygAJTKUbfYKDjiEVz9J4CFgDNUKu+803mD
 AKLaifCqBnIpB6Zax72GbK39F84hytbOLgMD3RgOuFkm5POlFuXD56Ht0PZNys1NDG3s
 pHMPfvBU6LDFuUvLiwEf5fDYWmUl/IrFVZjTEya09NKAVjn415nPoBfBz+kpgpwU35pH
 gklzExDvLYs0cwPlta8uSpvq9FHJlJhp+bm+sJS/vBXudqot5Gh4fQht8zVeIGEXccAu
 4/+z6OyYRJUC01Fc42Gn1OftHlC6Sx2l6i6undCbEpitCUSw8TcyyXtwTnIIzuw0NLC+
 muyA==
X-Gm-Message-State: AOJu0Yy4OyspL0VcM/+0S2CqCb24V1jAZr0eaQj7ExZrKeFbJA/ZACb2
 lfQP+ei7gSMabExfqm/7o7ucY6aB5u30xh8a7vQ/T98rc7/ZBZ1/Re/RgszzU3TdqiGj1nURcES
 AvrPqD1CSmKjNFLw=
X-Received: by 2002:a17:902:7449:b0:1ca:28f3:5690 with SMTP id
 e9-20020a170902744900b001ca28f35690mr8182931plt.46.1700131086127; 
 Thu, 16 Nov 2023 02:38:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOL0MJ1rgng6ZXMh83ikunglHFl822ietR/v9LlZs56zN0kMRYOyDuUO/nqQu4woNfTmHM2A==
X-Received: by 2002:a17:902:7449:b0:1ca:28f3:5690 with SMTP id
 e9-20020a170902744900b001ca28f35690mr8182883plt.46.1700131085817; 
 Thu, 16 Nov 2023 02:38:05 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a1709029a0200b001cc131c65besm8897793plp.168.2023.11.16.02.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:38:05 -0800 (PST)
Message-ID: <2235248b-f2d0-409a-9ae0-e079970ea776@redhat.com>
Date: Thu, 16 Nov 2023 20:37:48 +1000
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
 <ac71b101-3b61-47fa-b017-766ba55a2c8f@linaro.org>
 <38629155-9f2e-43b1-b8eb-e274755109fb@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <38629155-9f2e-43b1-b8eb-e274755109fb@linaro.org>
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

On 11/16/23 20:25, Philippe Mathieu-Daudé wrote:
> On 16/11/23 11:19, Philippe Mathieu-Daudé wrote:
>> On 16/11/23 08:51, Philippe Mathieu-Daudé wrote:
>>> On 16/11/23 08:39, Philippe Mathieu-Daudé wrote:
>>>> On 15/11/23 00:56, Gavin Shan wrote:
>>>>> Add generic cpu_list() to replace the individual target's implementation
>>>>> in the subsequent commits. Currently, there are 3 targets with no cpu_list()
>>>>> implementation: microblaze and nios2. With this applied, those two targets
>>>>> switch to the generic cpu_list().
>>>>>
>>>>> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
>>>>> Available CPUs:
>>>>>    microblaze-cpu
>>>>>
>>>>> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
>>>>> Available CPUs:
>>>>>    nios2-cpu
>>>>>
>>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>   bsd-user/main.c |  5 +----
>>>>>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>>>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>>>
>>>>
>>>>> diff --git a/cpu-target.c b/cpu-target.c
>>>>> index c078c0e91b..acfc654b95 100644
>>>>> --- a/cpu-target.c
>>>>> +++ b/cpu-target.c
>>>>> @@ -24,6 +24,7 @@
>>>>>   #include "hw/qdev-core.h"
>>>>>   #include "hw/qdev-properties.h"
>>>>>   #include "qemu/error-report.h"
>>>>> +#include "qemu/qemu-print.h"
>>>>>   #include "migration/vmstate.h"
>>>>>   #ifdef CONFIG_USER_ONLY
>>>>>   #include "qemu.h"
>>>>> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
>>>>>       return cpu_type;
>>>>>   }
>>>>> +#ifndef cpu_list
>>>>> +static void cpu_list_entry(gpointer data, gpointer user_data)
>>>>> +{
>>>>> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>>>> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>>>> +    g_autofree char *model = cpu_model_from_type(typename);
>>>>> +
>>>>> +    if (cc->deprecation_note) {
>>>>> +        qemu_printf("  %s (deprecated)\n", model);
>>>>> +    } else {
>>>>> +        qemu_printf("  %s\n", model);
>>
>> Wondering how this scale to heterogeneous emulation. Should we
>> display the architecture, i.e.:
>>
>> -- >8 --
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 76ef59de0a..aeff182a37 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -792,6 +792,8 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
>>    */
>>   char *cpu_model_from_type(const char *typename);
>>
>> +char *cpu_arch_from_type(const char *typename);
>> +
>>   /**
>>    * cpu_create:
>>    * @typename: The CPU type.
>> diff --git a/cpu-target.c b/cpu-target.c
>> index acfc654b95..75412f902f 100644
>> --- a/cpu-target.c
>> +++ b/cpu-target.c
>> @@ -257,6 +257,12 @@ char *cpu_model_from_type(const char *typename)
>>       return g_strdup(typename);
>>   }
>>
>> +char *cpu_arch_from_type(const char *typename)
>> +{
>> +    assert(g_str_has_suffix(CPU_RESOLVING_TYPE, "-cpu"));
>> +    return g_strndup(CPU_RESOLVING_TYPE, strlen(CPU_RESOLVING_TYPE) - strlen("-cpu"));
> 
> Not good enough:
> 
> $ ./qemu-system-mips64el -M mps2-an500 -cpu \?
> Available CPUs:
>    20Kc (MIPS64)
>    24Kc (MIPS64)
>    24KEc (MIPS64)
>    24Kf (MIPS64)
>    34Kf (MIPS64)
>    4Kc (MIPS64)
>    4KEc (MIPS64)
>    4KEcR1 (MIPS64)
>    4KEm (MIPS64)
>    4KEmR1 (MIPS64)
>    4Km (MIPS64)
>    5Kc (MIPS64)
>    5KEc (MIPS64)
>    5KEf (MIPS64)
>    5Kf (MIPS64)
> 
> Anyhow we can't use CPU_RESOLVING_TYPE in heterogeneous context,
> so we'll probably have to add the arch as a CPUClass field.
> 

CPU_RESOLVING_TYPE has been pinned to one specific target. We need to
improve this to support heterogeneous scenario in the future if you
agree. How about to figure out the improvement in the future to support
heterogeneous case and leave it as what we had?

Thanks,
Gavin

>> +}
>> +
>>   const char *parse_cpu_option(const char *cpu_option)
>>   {
>>       ObjectClass *oc;
>> @@ -290,12 +296,11 @@ static void cpu_list_entry(gpointer data, gpointer user_data)
>>       CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
>>       const char *typename = object_class_get_name(OBJECT_CLASS(data));
>>       g_autofree char *model = cpu_model_from_type(typename);
>> +    g_autofree char *arch = cpu_arch_from_type(typename);
>> +    g_autofree char *arch_up = g_ascii_strup(arch, -1);
>>
>> -    if (cc->deprecation_note) {
>> -        qemu_printf("  %s (deprecated)\n", model);
>> -    } else {
>> -        qemu_printf("  %s\n", model);
>> -    }
>> +    qemu_printf("  %s (%s%s)\n", model, arch_up,
>> +                cc->deprecation_note ? ", deprecated" : "");
>>   }
>> ---
>>
>> Produces:
>>
>> qemu-system-aarch64 -M mps2-an500 -cpu \?
>> Available CPUs:
>>    a64fx (ARM)
>>    arm1026 (ARM)
>>    arm1136 (ARM)
>>    arm1136-r2 (ARM)
>>    arm1176 (ARM)
>>    arm11mpcore (ARM)
>>    arm926 (ARM)
>>    arm946 (ARM)
>>    cortex-a15 (ARM)
>>    cortex-a35 (ARM)
>>    cortex-a53 (ARM)
>>    cortex-a55 (ARM)
>>    cortex-a57 (ARM)
>>    cortex-a7 (ARM)
>>    cortex-a710 (ARM)
>>    cortex-a72 (ARM)
>>    cortex-a76 (ARM)
> 


