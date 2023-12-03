Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13F8C4167B
	for <qemu-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 23:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9veH-000854-UN; Sun, 03 Dec 2023 18:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9veH-00084o-Bg
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 18:13:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9veF-0006vd-JV
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 18:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701645193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AddhGMlN52/YRv1w4anICuPDpCboCFFpiOkqpWi288Y=;
 b=Kl/wJYHYvY0sFMyzpgJJ5haVd97/giD1K/Da7lnsU4XlmrOzrczV8nLvPGIdPffU5u+P/M
 43fowZp+r4Gaf5W/7DOhzKQhILPVknjATAnDLc9WfCzHAf2Lazqk6AGE5WZdulxzSwqV/w
 0B3P7IyznCXRAZAaQxHAeYUs81/ijn0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-Dnufyi9aNO6XzQb_plmB9w-1; Sun, 03 Dec 2023 18:13:12 -0500
X-MC-Unique: Dnufyi9aNO6XzQb_plmB9w-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-286a4fc4e9eso851319a91.2
 for <qemu-riscv@nongnu.org>; Sun, 03 Dec 2023 15:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701645191; x=1702249991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AddhGMlN52/YRv1w4anICuPDpCboCFFpiOkqpWi288Y=;
 b=YXZB9tU0lrZ89FsKbtRGAy/gx3a4voNvQo5KBeteuomyOcY/mhbMzNo6kaXT3WPG8o
 FKAIZTISkc587T8KTuscFqkWz6c9zWlHXLKNzaSJNG0jtzycTuFnY0nXkqZuzLm8q1X3
 T7MNWRUcdvna5twYXNbRMdYOuLGOuMgH+p2yOu6IyyHcjTYG3Ju7Rhm2szaKDIGscG/t
 Bmys1KtJUeueuJsUnytT/NyEA2ta0Mw8tWSeZD3Dm6RW6SDm9as+rHLDNVk1bjTOidi5
 newzIdtoZIAL3BZLZk1yhTkCHwZVMVCGxeAiyjLSQgVn3F+F2yNvWndXS36QmW3jvV6v
 c2ow==
X-Gm-Message-State: AOJu0YzA2f5jdS+sJcpZEx6ozLPjJ6LTlhaaN35qGwDUUEvEAQHDJRAo
 hCsdvIShZf5BNHiaee9LJ42V8OeU6648wTEcROR2cjj4pdaJGAvsqdF7iiwKp4z2wQhp0XE1hHT
 YZlCAsdKOePskBPc=
X-Received: by 2002:a17:90a:30f:b0:286:9bc6:c95b with SMTP id
 15-20020a17090a030f00b002869bc6c95bmr880594pje.2.1701645191439; 
 Sun, 03 Dec 2023 15:13:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYZLxpcLLDwWKkFG0eLU9HhxgLcfhQzygxMJrc2gwA+9M5g110HqEjOiPCuSoBu1NURDVQtQ==
X-Received: by 2002:a17:90a:30f:b0:286:9bc6:c95b with SMTP id
 15-20020a17090a030f00b002869bc6c95bmr880565pje.2.1701645191092; 
 Sun, 03 Dec 2023 15:13:11 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a348700b00280c285f878sm7252609pjb.55.2023.12.03.15.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 15:13:10 -0800 (PST)
Message-ID: <c9f68946-2824-48a5-a0a1-290d7ddba178@redhat.com>
Date: Mon, 4 Dec 2023 09:13:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] machine: Introduce helper is_cpu_type_supported()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-3-gshan@redhat.com>
 <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On 12/1/23 20:53, Philippe Mathieu-Daudé wrote:
> On 29/11/23 05:20, Gavin Shan wrote:
>> The logic, to check if the specified CPU type is supported in
>> machine_run_board_init(), is independent enough. Factor it out into
>> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
>> clean with this. Since we're here, @machine_class is renamed to @mc to
>> avoid multiple line spanning of code. The comments are tweaked a bit
>> either.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> v8: Move the precise message hint to PATCH[v8 3/9]        (Gavin)
>> ---
>>   hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
>>   1 file changed, 45 insertions(+), 38 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index bde7f4af6d..1797e002f9 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1387,13 +1387,53 @@ out:
>>       return r;
>>   }
>> +static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
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
>> +            error_append_hint(errp, "The valid types are: %s",
>> +                              mc->valid_cpu_types[0]);
>> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
>> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +            }
>> +
>> +            error_append_hint(errp, "\n");
>> +            return false;
>> +        }
>> +    }
>> +
>> +    /* Check if CPU type is deprecated and warn if so */
>> +    cc = CPU_CLASS(oc);
>> +    if (cc && cc->deprecation_note) {
> 
> cc can't be NULL, right? Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

machine->cpu_type is either mc->default_cpu_type or returned from parse_cpu_option().
It can be NULL if mc->default_cpu_type is invalid, which is a program error. So
assert(cc != NULL) should be used instead. I will fold the change to PATCH[v9 3/9]

>> +        warn_report("CPU model %s is deprecated -- %s",
>> +                    machine->cpu_type, cc->deprecation_note);
>> +    }
>> +
>> +    return true;
>> +}
> 

Thanks,
Gavin


