Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3426C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 11:11:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLi6O-0007Py-LD; Fri, 05 Jan 2024 06:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLi6K-0007MZ-P1
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 06:10:58 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLi6H-0003jS-P3
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 06:10:56 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e5a9bcec9so1845251e87.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704453051; x=1705057851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IjDO5m0dOcaqMNoq9200rzLpRXSkVfVuBa2ol+B/RjU=;
 b=Ld5XkDJlqPnkKe7mhb4ecfAhcrf94Pcr3lIVENITo8rrd87SZFl3FHvAxy2RaTwbZB
 O7y0+jcMPN51UETUoGZSa8SZ3STtr68ZBlerObvauZY9n9dSHun1zM+1gFBD7842umAR
 IMC6qvZb2CiVdIsKsqioNisvLV4uUchgCu9/aaaE5FwKp/uBwX8HwEWhAopdh5Z8XQlS
 bzTfg57TmmpyL8YKYo/U56dhHFSrOfGjmYdqpIE5UIMmoyRvc5P50CZQbzmNC3uTReCa
 JlRyuneuqR798V3+7ATe5dMyGhoZPpNZ3Q61UAlPe9/4AC3uDHqucPu+pEECsukqruE7
 hFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704453051; x=1705057851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IjDO5m0dOcaqMNoq9200rzLpRXSkVfVuBa2ol+B/RjU=;
 b=vZZuiCSEwdYioAG1utIOggZUD3G9A7rXjZRTZj1rGSk8Wmg+Cw7OTUlSdfxKbsMz5F
 bq3+NCrWmJ/Dr4fdMqebT4ufT99N1HhoNZZBoYE1d6+VTR3i4jXfkmr2MgeFY9YKX5CU
 ZZ6UFLFECpecmkiTaVlkOw1eHqanVabgNuOxmgPW3tpkDkBn1urIWDs2NJrSr8JfsqW3
 x18jP44JuFHzHVgOqq7rOeD2h90j0+T+eX9jY6ByoJg+CYIfDHRLQL1oYyzu8zfZapFn
 q9WXu1JIba8R1OM9NztNGT6b4hEuIj0sjYV29u8kr39ySYHSX9q834TcfxiE1n8SzZZj
 euTw==
X-Gm-Message-State: AOJu0YxoIDTQU0zlqE2QpPW6ulpiOdFVDdcGq78Yz0d0mX9+q0YNivtf
 khovZFMj5FXjkqwIX9gUM3dmNFP0ja5wcA==
X-Google-Smtp-Source: AGHT+IFTcVsxYXywomF9LXeYXnD4KRcGPVQ4BaSBQVFsdO3fjgm8KACmz/w4uPNYx7xC70Q0QJ/6hw==
X-Received: by 2002:a05:6512:2351:b0:50e:55d0:855c with SMTP id
 p17-20020a056512235100b0050e55d0855cmr1334142lfu.17.1704453051109; 
 Fri, 05 Jan 2024 03:10:51 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 a5-20020a1709063a4500b00a28d309b063sm757869ejf.220.2024.01.05.03.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 03:10:50 -0800 (PST)
Message-ID: <c9c65355-7666-4749-b93b-5fb1c7f1585b@linaro.org>
Date: Fri, 5 Jan 2024 12:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] machine: Introduce helper is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com,
 Thomas Huth <thuth@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-3-gshan@redhat.com>
 <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
 <c9f68946-2824-48a5-a0a1-290d7ddba178@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c9f68946-2824-48a5-a0a1-290d7ddba178@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/12/23 00:13, Gavin Shan wrote:
> Hi Phil,
> 
> On 12/1/23 20:53, Philippe Mathieu-Daudé wrote:
>> On 29/11/23 05:20, Gavin Shan wrote:
>>> The logic, to check if the specified CPU type is supported in
>>> machine_run_board_init(), is independent enough. Factor it out into
>>> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
>>> clean with this. Since we're here, @machine_class is renamed to @mc to
>>> avoid multiple line spanning of code. The comments are tweaked a bit
>>> either.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>> v8: Move the precise message hint to PATCH[v8 3/9]        (Gavin)
>>> ---
>>>   hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
>>>   1 file changed, 45 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index bde7f4af6d..1797e002f9 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -1387,13 +1387,53 @@ out:
>>>       return r;
>>>   }
>>> +static bool is_cpu_type_supported(const MachineState *machine, Error 
>>> **errp)
>>> +{
>>> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>>> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>>> +    CPUClass *cc;
>>> +    int i;
>>> +
>>> +    /*
>>> +     * Check if the user specified CPU type is supported when the valid
>>> +     * CPU types have been determined. Note that the user specified CPU
>>> +     * type is provided through '-cpu' option.
>>> +     */
>>> +    if (mc->valid_cpu_types && machine->cpu_type) {
>>> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
>>> +            if (object_class_dynamic_cast(oc, 
>>> mc->valid_cpu_types[i])) {
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        /* The user specified CPU type isn't valid */
>>> +        if (!mc->valid_cpu_types[i]) {
>>> +            error_setg(errp, "Invalid CPU type: %s", 
>>> machine->cpu_type);
>>> +            error_append_hint(errp, "The valid types are: %s",
>>> +                              mc->valid_cpu_types[0]);
>>> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
>>> +                error_append_hint(errp, ", %s", 
>>> mc->valid_cpu_types[i]);
>>> +            }
>>> +
>>> +            error_append_hint(errp, "\n");
>>> +            return false;
>>> +        }
>>> +    }
>>> +
>>> +    /* Check if CPU type is deprecated and warn if so */
>>> +    cc = CPU_CLASS(oc);
>>> +    if (cc && cc->deprecation_note) {
>>
>> cc can't be NULL, right? Otherwise,
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
> 
> machine->cpu_type is either mc->default_cpu_type or returned from 
> parse_cpu_option().
> It can be NULL if mc->default_cpu_type is invalid, which is a program 
> error. So
> assert(cc != NULL) should be used instead. I will fold the change to 
> PATCH[v9 3/9]

cpu_type and cc an be NULL with the 'none' machine.

> 
>>> +        warn_report("CPU model %s is deprecated -- %s",
>>> +                    machine->cpu_type, cc->deprecation_note);
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>
> 
> Thanks,
> Gavin
> 


