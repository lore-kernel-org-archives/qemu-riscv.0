Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90C9C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 22:56:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r86zS-0006At-DV; Tue, 28 Nov 2023 17:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r86zP-00069z-Fl
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 17:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r86zM-0001ax-4a
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 17:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701212129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xin/C7uTM75mmI05qzEqtEpuaHR3U4VKO5QiGVJR0dE=;
 b=B/6a6ptkn108rN+AHsqMrnTcVgOTPn3ZN++KfTZ7AHoCoz9JaXqsPCi+/wJN5k+9htuW2b
 JBXsWGQMpaISkVD5/3l/IK4O0VMCiPhQ2tmSqUOni2nm/+gOhB43Dk1ZuNXm/fMTr58NM+
 E073p4X/OHZvWPfpZ92hriiDCwsVoSg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-Eb977US7Pca1kLfqpk4MDA-1; Tue, 28 Nov 2023 17:55:28 -0500
X-MC-Unique: Eb977US7Pca1kLfqpk4MDA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-285d331c6f7so4287909a91.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 14:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701212127; x=1701816927;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xin/C7uTM75mmI05qzEqtEpuaHR3U4VKO5QiGVJR0dE=;
 b=a7bVKWt9r2/KRSId/BfoTl5krCzMMrYLtYb64devnzw0CWiw2aP1X5G/EN4S8ZPmNx
 gd4wdj+oaf1URCDpbwb/oe8lxVwY1ARzTtg+ElL9QPZnbq0n3GEuHo1sVjKIRYszoPAZ
 ZhP5kzLS9rKC590j26pEBi3csNmVFx7Ewcyvkxa9ywC3Dr9ztZTJZO0mke4qqB4hMw1U
 Zp1CWuaPiXPyl72023v2kyhiFrv6qp+o7px13JVOS23FtiCJhLr97y4pb87DLYZCiCaK
 cdKjnDVw+GBXgFHCaCfMFk1J4/y1XCHMCBLNn3SLP6iMOjWMFC3KXxxiTv/aXabIMoYd
 3LIQ==
X-Gm-Message-State: AOJu0Yyha4PUgD38y23052XtUM3jDYEPUo3pNM1IIQNySeva550EtmPN
 pvclg8Ujr7Pe31xwOhYoOsFWGoW8l5FOVIwV3oeXd9PS1gWVo/t+FegtpjUiDky6Et0r4WCfQZj
 6Gd/HVUzC+eNrkNc=
X-Received: by 2002:a17:90b:3906:b0:285:a152:fd3d with SMTP id
 ob6-20020a17090b390600b00285a152fd3dmr12001929pjb.42.1701212127414; 
 Tue, 28 Nov 2023 14:55:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY51za9Tr1CVZ3fk//XPczsw/YAc+IKTuufMn1/U0K0mr4RhenB3mGs2CMdS7P+EQUohiPqQ==
X-Received: by 2002:a17:90b:3906:b0:285:a152:fd3d with SMTP id
 ob6-20020a17090b390600b00285a152fd3dmr12001897pjb.42.1701212126999; 
 Tue, 28 Nov 2023 14:55:26 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 fs23-20020a17090af29700b002852528f62bsm9638944pjb.29.2023.11.28.14.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 14:55:26 -0800 (PST)
Message-ID: <34773ba2-e5f7-4f73-a728-57c5004c8502@redhat.com>
Date: Wed, 29 Nov 2023 09:55:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] machine: Introduce helper is_cpu_type_supported()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-3-gshan@redhat.com>
 <c3e8f22b-c03e-4803-a960-699489afb92b@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <c3e8f22b-c03e-4803-a960-699489afb92b@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/28/23 20:38, Philippe Mathieu-Daudé wrote:
> On 27/11/23 00:12, Gavin Shan wrote:
>> The logic, to check if the specified CPU type is supported in
>> machine_run_board_init(), is independent enough. Factor it out into
>> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
>> clean with this. Since we're here, @machine_class is renamed to @mc
>> to avoid multiple line spanning of code. The error messages and comments
>> are tweaked a bit either.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 90 +++++++++++++++++++++++++++--------------------
>>   1 file changed, 51 insertions(+), 39 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index b3ef325936..05e1922b89 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1387,13 +1387,57 @@ out:
>>       return r;
>>   }
>> +static void is_cpu_type_supported(const MachineState *machine, Error **errp)
> 
> Functions taking an Error** last argument should return a boolean value.
> 

Correct, especially @errp instead of @local_err will be passed from
machine_run_board_init() to is_cpu_type_supported(). We needs an
indicator for machine_run_board_init() to bail immediately to avoid
calling mc->init() there in the failing cases.

>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>> +    CPUClass *cc;
>> +    int i;
>> +
>> +    /*
>> +     * Check if the user specified CPU type is supported when the valid
>> +     * CPU types have been determined. Note that the user specified CPU
>> +     * type is provided through '-cpu' option.
>> +     */
>> +    if (mc->valid_cpu_types && machine->cpu_type) {
>> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
>> +            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
>> +                break;
>> +            }
>> +        }
>> +
>> +        /* The user specified CPU type isn't valid */
>> +        if (!mc->valid_cpu_types[i]) {
>> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> +            if (!mc->valid_cpu_types[1]) {
>> +                error_append_hint(errp, "The only valid type is: %s",
>> +                                  mc->valid_cpu_types[0]);
>> +            } else {
>> +                error_append_hint(errp, "The valid types are: %s",
>> +                                  mc->valid_cpu_types[0]);
>> +            }
>> +
>> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
>> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +            }
>> +
>> +            error_append_hint(errp, "\n");
>> +            return;
>> +        }
>> +    }
>> +
>> +    /* Check if CPU type is deprecated and warn if so */
>> +    cc = CPU_CLASS(oc);
>> +    if (cc && cc->deprecation_note) {
>> +        warn_report("CPU model %s is deprecated -- %s",
>> +                    machine->cpu_type, cc->deprecation_note);
> 
> Why did you move the deprecation warning within the is_supported check?
> 

This check is more relevant to CPU type, to check if the CPU type has
been deprecated. Besides, @oc and @cc can be dropped from machine_run_board_init().

>> +    }
>> +}
>>   void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
>>   {
>>       ERRP_GUARD();
>>       MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>> -    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>> -    CPUClass *cc;
>>       Error *local_err = NULL;
>>       /* This checkpoint is required by replay to separate prior clock
>> @@ -1449,43 +1493,11 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>           machine->ram = machine_consume_memdev(machine, machine->memdev);
>>       }
>> -    /* If the machine supports the valid_cpu_types check and the user
>> -     * specified a CPU with -cpu check here that the user CPU is supported.
>> -     */
>> -    if (machine_class->valid_cpu_types && machine->cpu_type) {
>> -        int i;
>> -
>> -        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
>> -            if (object_class_dynamic_cast(oc,
>> -                                          machine_class->valid_cpu_types[i])) {
>> -                /* The user specified CPU is in the valid field, we are
>> -                 * good to go.
>> -                 */
>> -                break;
>> -            }
>> -        }
>> -
>> -        if (!machine_class->valid_cpu_types[i]) {
>> -            /* The user specified CPU is not valid */
>> -            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
>> -            error_append_hint(&local_err, "The valid types are: %s",
>> -                              machine_class->valid_cpu_types[0]);
>> -            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> -                error_append_hint(&local_err, ", %s",
>> -                                  machine_class->valid_cpu_types[i]);
>> -            }
>> -            error_append_hint(&local_err, "\n");
>> -
>> -            error_propagate(errp, local_err);
>> -            return;
>> -        }
>> -    }
>> -
>> -    /* Check if CPU type is deprecated and warn if so */
>> -    cc = CPU_CLASS(oc);
>> -    if (cc && cc->deprecation_note) {
>> -        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
>> -                    cc->deprecation_note);
>> +    /* Check if the CPU type is supported */
>> +    is_cpu_type_supported(machine, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
> 
> This becomes:
> 
>         if (!is_cpu_type_supported(machine, errp)) {
> 

Nod

>> +        return;
>>       }
>>       if (machine->cgs) {
> 

Thanks,
Gavin


