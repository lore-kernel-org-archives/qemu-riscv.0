Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D87C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 22:48:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r86sD-0002xS-4w; Tue, 28 Nov 2023 17:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r86sA-0002us-4s
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 17:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r86s8-0008HP-3D
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 17:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701211681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZlhKbYDKMR5EXLI+Z0VEPsCjkS4zj7wfEYHqF5iDzY=;
 b=R+9naEES8BUSAvCEUft94zyn0BsCCQOaq+OVGm1FWTiqVt90QGZCct08S6CndIPjQkEA1v
 kCG3lSU5ylymOHSccPhVryODFIL7ntx37NOdk5OFpPtrJwwZUtKnxZApJfe0M77Kkeiz+4
 shDtTtt2Oi3BhbWEEs+1V1RjMvvCjxs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-QjwoZ9l4PKaiz9PlsCOq9A-1; Tue, 28 Nov 2023 17:48:00 -0500
X-MC-Unique: QjwoZ9l4PKaiz9PlsCOq9A-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cff359d156so18516325ad.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 14:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701211679; x=1701816479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hZlhKbYDKMR5EXLI+Z0VEPsCjkS4zj7wfEYHqF5iDzY=;
 b=dClBMTxJfpOa4pA5R+hb/7T9ffNYmz2n1GHE9jfG8R7fuv+RcNbbOgD3qGvyiNwNYL
 J11e6WniD397Aa8k+oILVQj7LnF8rYSbAlzIj9+CYVoHa3Nr+gdKJjg0VuDG+qd0XTs8
 lVy2Apo+1yXtB49poGvmvta+e8Wy4z3WKI36hxC85u+omGgRfoHTUMyRiAwpYgpICA9F
 2qtAoqsNT07Brq9JXNEWOv/Hr/t0VKhSiYJaDVJC1HsLYsl0sucnCOl3xPWe8IoxMxsm
 4rnqo5tya79txXsXfkbYwz32VakzVYEe0eCLg04EH+CB1u+9N0dLVrWWBpBnCP6MQk2P
 f/mQ==
X-Gm-Message-State: AOJu0YyDhkh4iWvcPvHiZDBt0R3VIHNFZ78C5l7j4lNCv7KHqtVAp+ah
 dlWyVS2fg8iPbt34Ey041EkegXVwzH9rc3AOouatuPKrsa8aFZ8j14Z271AG2vIe10wrVB7ulIf
 veGKiovPhj1ZgC68=
X-Received: by 2002:a17:902:c40a:b0:1cf:aff5:8934 with SMTP id
 k10-20020a170902c40a00b001cfaff58934mr15685032plk.48.1701211679037; 
 Tue, 28 Nov 2023 14:47:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO23u4IHLUUljL+HKKFuezgjiYcWLSt1lfhuGUFvyKbdvHD41IOEwW7NloQClgMETx7OxLYg==
X-Received: by 2002:a17:902:c40a:b0:1cf:aff5:8934 with SMTP id
 k10-20020a170902c40a00b001cfaff58934mr15685001plk.48.1701211678733; 
 Tue, 28 Nov 2023 14:47:58 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902cec300b001cfce2bf48esm4503807plg.43.2023.11.28.14.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 14:47:58 -0800 (PST)
Message-ID: <a89a52af-ad01-4a71-a533-fff555c4e938@redhat.com>
Date: Wed, 29 Nov 2023 09:47:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] machine: Use error handling when CPU type is
 checked
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
 <20231126231210.112820-2-gshan@redhat.com>
 <013fb5f5-8281-4f7a-83c8-ac22f845297b@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <013fb5f5-8281-4f7a-83c8-ac22f845297b@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/28/23 20:43, Philippe Mathieu-Daudé wrote:
> On 27/11/23 00:12, Gavin Shan wrote:
>> QEMU will be terminated if the specified CPU type isn't supported
>> in machine_run_board_init(). The list of supported CPU type names
>> is tracked by mc->valid_cpu_types.
>>
>> The error handling can be used to propagate error messages, to be
>> consistent how the errors are handled for other situations in the
>> same function.
>>
>> No functional change intended.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> v7: Add 'return' after error_propagate() to avoid calling into
>>      mc->init() in the failing case                        (Marcin)
>> ---
>>   hw/core/machine.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 0c17398141..b3ef325936 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1394,6 +1394,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>       MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>>       ObjectClass *oc = object_class_by_name(machine->cpu_type);
>>       CPUClass *cc;
>> +    Error *local_err = NULL;
> 
> IIUC the big comment in "include/qapi/error.h", since commit ae7c80a7bd
> ("error: New macro ERRP_GUARD()") we want to use the new macro instead.
> 

Yeah, there already has a ERRP_GUARD() in machine_run_board_init(). After
rechecking the implementation of ERRP_GUARD(), I found @local_err needs to
be dropped and use @errp below.


>>       /* This checkpoint is required by replay to separate prior clock
>>          reading from the other reads, because timer polling functions query
>> @@ -1466,15 +1467,17 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>           if (!machine_class->valid_cpu_types[i]) {
>>               /* The user specified CPU is not valid */
>> -            error_report("Invalid CPU type: %s", machine->cpu_type);
>> -            error_printf("The valid types are: %s",
>> -                         machine_class->valid_cpu_types[0]);
>> +            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
>> +            error_append_hint(&local_err, "The valid types are: %s",
>> +                              machine_class->valid_cpu_types[0]);
>>               for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
>> +                error_append_hint(&local_err, ", %s",
>> +                                  machine_class->valid_cpu_types[i]);
>>               }
>> -            error_printf("\n");
>> +            error_append_hint(&local_err, "\n");
>> -            exit(1);
>> +            error_propagate(errp, local_err);
>> +            return;
>>           }
>>       }

@local_err needs to be replaced with @errp in this chunk of code, as mentioned
above.

Thanks,
Gavin


