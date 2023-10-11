Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E96DCD98F3
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 06:46:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqSym-0002ZZ-NB; Wed, 11 Oct 2023 02:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qqSyi-0002YX-DA
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 02:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qqSyg-0001e8-9l
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 02:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697006752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6Zf4eUKFYEublX2s8iYoEkuD6AiMv6ZrCpWbA4EEAI=;
 b=X3bxW8P1FvayEF+SI9EjA/zK5AFDi/m67TbYZFYpzB/o5GSAls/u3xfhZ2R62rkgDEPgro
 818qqFsPR7nB0BpvyePVxUe5VlGsxdKjcqM2p01iuiaJ9apoh42YLkFlS/xHLdx5dykNe/
 1yvwBcwtXfPBcw48GEshLsEOAVptap8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-Vqi8gZaDN2u8oLDRS_fARg-1; Wed, 11 Oct 2023 02:45:48 -0400
X-MC-Unique: Vqi8gZaDN2u8oLDRS_fARg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1c754c90b4bso53317855ad.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 23:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697006747; x=1697611547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6Zf4eUKFYEublX2s8iYoEkuD6AiMv6ZrCpWbA4EEAI=;
 b=HhQYVl2h2oy8mudnsFyDo4Bc8TuxPz4SsLhAj12tUdiAGdI22AbGpSM2rVo/CoSdcD
 TfbtGZCxqRQe4URNXi2wlRGOEZwfUIlhpdWXMVvPLIe4BARFV39qCGnR8wGALNZ6SzZg
 WIHHFsGD7FWC35xD7VWDo1s3sVVIeN2AdmejudSlcQGVeJf0xnJ2ccEFCzFxYbr+rMDA
 Ck2sNGNBt9qz4DXLdHCPkFshBcoYiiLBb62/lDh/Wop1hvoisDcY9kuarNyNQ2FYmw9v
 oHFHTJ/AqJU+1QF8xEwE5zktUEyEpGhLpC7TSPZDpt1tillnJOwWQiQoSORDlhpdRM5O
 +ePQ==
X-Gm-Message-State: AOJu0YxKGQ6sKY9nE7XlOZ6OlHV8nlMy0iXSj70Hj9uiDrjFiVftfQcR
 Gl0sylRsmSCyidBLwvb2BZH3WZ7MO0Bco7+rRL/EhOHxYsrPCXijN9sgFMIjQhM7O2jIMieXWwH
 jaoGEnkslU/XbheE=
X-Received: by 2002:a17:903:24d:b0:1bd:c7e2:462 with SMTP id
 j13-20020a170903024d00b001bdc7e20462mr20749228plh.11.1697006747683; 
 Tue, 10 Oct 2023 23:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnb/J7/SbM0B3OEtBg9ALiXiQtVJ9lOvT1wMsLXWKXNthSEk2quIs3Ngnl1b115fIcqBxPqA==
X-Received: by 2002:a17:903:24d:b0:1bd:c7e2:462 with SMTP id
 j13-20020a170903024d00b001bdc7e20462mr20749190plh.11.1697006747351; 
 Tue, 10 Oct 2023 23:45:47 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b001c60c8d6b4asm9706912plf.149.2023.10.10.23.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 23:45:46 -0700 (PDT)
Message-ID: <c24efe4e-88e1-c6e5-9e6c-d809c26e40c8@redhat.com>
Date: Wed, 11 Oct 2023 16:45:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
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
 <a42dd7a0-e73f-8410-d096-8298da03f70d@redhat.com>
 <676c81b6-ccaa-51a3-8d1a-65e71a7b2b92@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <676c81b6-ccaa-51a3-8d1a-65e71a7b2b92@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/23 13:28, Philippe Mathieu-Daudé wrote:
> On 25/9/23 02:24, Gavin Shan wrote:
>> On 9/12/23 08:40, Gavin Shan wrote:
>>> On 9/11/23 19:43, Philippe Mathieu-Daudé wrote:
>>>> On 11/9/23 01:28, Gavin Shan wrote:
>>>>> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>>>>>> Add a field to return the QOM type name of a CPU class.
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
> 
> 
>>>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>>>> index 129d179937..e469efd409 100644
>>>>>> --- a/include/hw/core/cpu.h
>>>>>> +++ b/include/hw/core/cpu.h
>>>>>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>>>>>   /**
>>>>>>    * CPUClass:
>>>>>> + * @cpu_resolving_type: CPU QOM type name
>>>>>>    * @class_by_name: Callback to map -cpu command line model name to an
>>>>>>    *                 instantiatable CPU type.
>>>>>>    * @parse_features: Callback to parse command line arguments.
>>>>>> @@ -148,6 +149,7 @@ struct CPUClass {
>>>>>>       DeviceClass parent_class;
>>>>>>       /*< public >*/
>>>>>> +    const char *cpu_resolving_type;
>>>>>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>>>>>       void (*parse_features)(const char *typename, char *str, Error **errp);
>>>>>
>>>>> The question is why not use CPU_RESOLVING_TYPE directly? It seems CPU_RESOLVING_TYPE
>>>>> is exactly what you want here.
>>>>
>>>> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
>>>> hw/core/cpu-common.c to be target-agnostic (build once for all
>>>> targets). This is particularly important in the context of
>>>> heterogeneous QEMU, where a single binary will be able to create
>>>> CPUs from different targets.
>>>>
>>>
>>> CPU_RESOLVING_TYPE and CPUClass::cpu_resolving_type is duplicate to
>>> each other. There are two options I can figure out to avoid the
>>> duplication.
>>>
>>> (a) move cpu_class_by_name() from hw/core/cpu-common.c to cpu.c, so that
>>>      CPU_RESOLVING_TYPE can be seen. cpu.c::list_cpus() is the example.
>>>
>>> (b) remove hw/core/cpu-common.c::cpu_calss_by_name() and squeeze its
>>>      logic to cpu.c::parse_cpu_option() since there are not too much
>>>      users for it. target/arm and target/s390 needs some tweaks so that
>>>      hw/core/cpu-common.c::cpu_calss_by_name() can be removed.
>>>
>>>      [gshan@gshan q]$ git grep \ cpu_class_by_name\(
>>>      cpu.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
>>>      target/arm/arm-qmp-cmds.c:    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>>>      target/s390x/cpu_models_sysemu.c:    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);
>>>
>>> When option (b) is taken, this series to have the checks against @oc
>>> in hw/core/cpu-common.c::cpu_calss_by_name() becomes non-sense. Instead,
>>> we need the same (and complete) checks in CPUClass::class_by_name() for
>>> individual targets. Further more, an inline helper can be provided to do
>>> the check in CPUClass::class_by_name() for individual targets.
>>>
>>>     include/hw/core/cpu.h
>>>
>>>     static inline bool cpu_class_is_valid(ObjectClass *oc, const char *parent)
>>>     {
>>>         if (!object_class_dynamic_cast(oc, parent) ||
>>>             object_class_is_abstract(oc)) {
>>>             return false;
>>>         }
>>>
>>>         return true;
>>>     }
>>>
>>
>> Since my series to make CPU type check unified depends on this series, could
>> you please share your thoughts? If you don't have bandwidth for this, I can
>> improve the code based on your thoughts, and include your patches to my series
>> so that they can be reviewed at once. Please just let me know.
> 
> You seem to prove (b) is not useful, so we have to do (a).
> 
> Unfortunately at this moment I feel hopeless with this topic.
> 
> I don't want to delay your work further. If you find a way to integrate
> both series, please go ahead. Otherwise let's drop my approach and
> continue with your previous work.
> 
> I apologize I kept you waiting that long.
> 

Ah, nope, nothing went to wrong here. Thanks for your reply, I will try
to follow (a) and integrate your patches to my series. Please help to
review my series when it's posted :)

Thanks,
Gavin


