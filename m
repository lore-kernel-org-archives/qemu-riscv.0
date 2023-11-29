Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D95C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 03:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8Bdt-0004tT-VW; Tue, 28 Nov 2023 22:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8Bdt-0004tE-DL
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 22:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8Bdr-0002Iu-DE
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 22:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701230018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtKRsfNL4+Zf7j3ED7iibQmheFrgqWV5inLbbEtFCXA=;
 b=jCXbCVxojzKXsMWU0h225mQeo87aYa9qyYBLRGlNRfIdd896IsvmIN0PhATKypm6caTqZr
 rre7zixeu2IGtsYNZY7iwAeajMxvWDuWV7EgCGySAkQrVY+aAp7WzKZfKvEo+JjEVp6cX8
 CN+0NkW0hrLSIJVjn6bn5CPSVu2Noz0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Q0NGXEF8OzaR1BzCzJFnIg-1; Tue, 28 Nov 2023 22:53:36 -0500
X-MC-Unique: Q0NGXEF8OzaR1BzCzJFnIg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5be0d0248e5so6565386a12.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 19:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701230015; x=1701834815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OtKRsfNL4+Zf7j3ED7iibQmheFrgqWV5inLbbEtFCXA=;
 b=vmYS6C1jHohCQAgmkXFvU04nToWEcCRd1+6yuiBFlCYjmvYIOUH/Xxr77MrPLhyufs
 TMgZ0qsioJI7WDrkbFmlArQeO13vzw3fv7A/AVbHMQ4+P3tDpPcj2NtCMzFoOX0vU1oL
 J5a9BRovx71dL/9q32Z00+4d1BEsJfnd3MkmIYBB1EMlwD9E9YuFZpR30vI+YeCFdMCj
 AZYKc/UAWp9VYHKBTnUFbrac1417ojI7Z4VpZavEhjHY700fCHN2aJnsnQlnBdIE9Dr6
 b3e3XTFQPyfSKG2IaTA3fB3M2BMPIU+WBkEWMflIfFn0iwlmNpUG4Y7vg06k5sRS87bV
 ylLg==
X-Gm-Message-State: AOJu0YyM2YEdrTMZPIbVL2A0poaXYxlMTPzAi8r54W+NBmAhd/Ma4sUA
 mp213dX40+1HGe9v8dZdO5zeU9ZKOg1kfU/DPaFj7KT0uNZ13Hq8Wen6RwkHXL8KxZ69dJedwgg
 rBE8nlSpqwUCRQmo=
X-Received: by 2002:a05:6a20:9146:b0:18b:6f9:dc22 with SMTP id
 x6-20020a056a20914600b0018b06f9dc22mr18187169pzc.41.1701230015683; 
 Tue, 28 Nov 2023 19:53:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlcnuTSBTsWrmA02U9c8LAsTSaqcWWOlMpcxLSXga/f4eafKJk5h8/oaQ8Any+1OTIyM0Xyg==
X-Received: by 2002:a05:6a20:9146:b0:18b:6f9:dc22 with SMTP id
 x6-20020a056a20914600b0018b06f9dc22mr18187147pzc.41.1701230015378; 
 Tue, 28 Nov 2023 19:53:35 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 1-20020a17090a19c100b00280070a2613sm293713pjj.51.2023.11.28.19.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 19:53:34 -0800 (PST)
Message-ID: <9b3db19d-8756-447a-a9a3-948c826c1b40@redhat.com>
Date: Wed, 29 Nov 2023 14:53:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] machine: Print CPU model name instead of CPU type
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
 <20231126231210.112820-4-gshan@redhat.com>
 <32bf41db-375b-4061-bbf3-17ae6b543926@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <32bf41db-375b-4061-bbf3-17ae6b543926@linaro.org>
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

On 11/28/23 20:55, Philippe Mathieu-Daudé wrote:
> On 27/11/23 00:12, Gavin Shan wrote:
>> The names of supported CPU models instead of CPU types should be
>> printed when the user specified CPU type isn't supported, to be
>> consistent with the output from '-cpu ?'.
>>
>> Correct the error messages to print CPU model names instead of CPU
>> type names.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 05e1922b89..898c25552a 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1392,6 +1392,7 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>       ObjectClass *oc = object_class_by_name(machine->cpu_type);
>>       CPUClass *cc;
>> +    char *model;
>>       int i;
>>       /*
>> @@ -1408,17 +1409,25 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
>>           /* The user specified CPU type isn't valid */
>>           if (!mc->valid_cpu_types[i]) {
>> -            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> +            model = cpu_model_from_type(machine->cpu_type);
>> +            g_assert(model != NULL);
>> +            error_setg(errp, "Invalid CPU type: %s", model);
>> +            g_free(model);
> 
>    g_autofree char *requested = cpu_model_from_type(machine->cpu_type);
>    error_setg(errp, "Invalid CPU type: %s", requested);
> 

Yes, g_autofree shall be used here. Besides, "Invalid CPU type" needs to
be "Invalid CPU model".

>> +
>> +            model = cpu_model_from_type(mc->valid_cpu_types[0]);
>> +            g_assert(model != NULL);
>>               if (!mc->valid_cpu_types[1]) {
>> -                error_append_hint(errp, "The only valid type is: %s",
>> -                                  mc->valid_cpu_types[0]);
>> +                error_append_hint(errp, "The only valid type is: %s", model);
> 
>    g_autofree char *model = cpu_model_from_type(mc->valid_cpu_types[0]);
>    error_append_hint(errp, "The only valid type is: %s\n", model);
> 

Yes, as above.

>>               } else {
>> -                error_append_hint(errp, "The valid types are: %s",
>> -                                  mc->valid_cpu_types[0]);
>> +                error_append_hint(errp, "The valid types are: %s", model);
> 
> Please move all the enumeration in this ladder, this makes the logic
> simpler to follow:
> 
>    error_append_hint(errp, "The valid types are: ");
>    for (i = 0; mc->valid_cpu_types[i]; i++) {
>         g_autofree char *model =
>                             cpu_model_from_type(mc->valid_cpu_types[i]);
>         error_append_hint(errp, ", %s", model);
>    }
>    error_append_hint(errp, "\n");
> 

Yes, but we still need to ensure mc->valid_cpu_types[0] != NULL in advance.
"The valid types are: " needs to be "The valid models are: ". Besides,
your proposed code needs to be adjusted a bit like below. Otherwise, we
will get output "The valid types are: , aaa, bbb"

             } else {
                 error_append_hint(errp, "The valid types are: ");
                 for (i = 0; mc->valid_cpu_types[i]; i++) {
                     error_append_hint(errp, "%s%s",
                                       mc->valid_cpu_types[i],
                                       mc->valid_cpu_types[i + 1] ? ", " : "");
                 }
                 error_append_hint(errp, "\n");
             }

I will have separate PATCH[v8 3/9] to have the changes, together with the
precise hint when only mc->valid_cpu_types[0] is valid.

>>               }
>> +            g_free(model);
>>               for (i = 1; mc->valid_cpu_types[i]; i++) {
>> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +                model = cpu_model_from_type(mc->valid_cpu_types[i]);
>> +                g_assert(model != NULL);
>> +                error_append_hint(errp, ", %s", model);
>> +                g_free(model);
>>               }
>>               error_append_hint(errp, "\n");

Thanks,
Gavin


