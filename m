Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB641EC875E
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 23:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeOlK-0000Or-EO; Thu, 07 Sep 2023 19:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOlI-0000OJ-JX
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOlE-0004e3-6w
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694130607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGvucSUm4qFvKXLIeZFGZYfDq1ItUQUoCdA2ibrpk6w=;
 b=g/3GpQ6123++yAylPECO3YHi8K/hrw0OwsPqB3NDajsdJvRSKLQxNq59LGtgs89/n+frc/
 qm7ME76IbRHjB9/dqZ0xUAM8GRJulXbUTre5dFJRQ4PhHTxgLjj6yljpd0Fb8qoH+pJe32
 Q5rm94VEsFwDX1VT3Rgfo0MZMU8cOCM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Nure-5VfNiKzMoblquPGdA-1; Thu, 07 Sep 2023 19:50:06 -0400
X-MC-Unique: Nure-5VfNiKzMoblquPGdA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bf6e47b5efso21095935ad.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 16:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694130605; x=1694735405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGvucSUm4qFvKXLIeZFGZYfDq1ItUQUoCdA2ibrpk6w=;
 b=rRDahOOGMBaQDeCZz1X9XKq+QQOk8yuHDP17MdLVaJLJEIQgW4F+FpAy7MXNsMsPCo
 OAsMJlGZ3wry0a0dIH3e7ojPZJBoCktr8VSxXyxrsZQ/s64/UEjbWQ9kw3xp/iVtaIGv
 BMFNWJjSwLNn2fhyvaGj/nGRh0e7JpbexRSzPjP93RJgSjGjr1Rg9IPkjWH25t5JrzMb
 IgOskze6pJUiOGgVn/hwB562XV2fwPxLJXCflbUp6PPoYeLfDUh4bEQqtQpI3UfMH+9O
 Kd2tdcVMi7ZYMEIQhaClXj0lITtzepBPuzqMd3oz0JKX1Nsb46abF/zcw7bdhen0gMUz
 SdNQ==
X-Gm-Message-State: AOJu0Yw8WaKmImQsXKy2MYohoAz7TGyDhKvyAY4y1c8CRfN9qTgCjfGb
 1nUIfWC1gtXcroqctgbMyh1ZFvAC7GFQeo22u4x5B9h/gXYqNNAjRvUy/3qc09x87VEzmTJ5IFo
 x7Q5itLpvYBw6Fg4=
X-Received: by 2002:a17:902:f693:b0:1c3:83e2:d0c6 with SMTP id
 l19-20020a170902f69300b001c383e2d0c6mr184917plg.52.1694130605157; 
 Thu, 07 Sep 2023 16:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIC7PYvUyfjsWmDrppLjt11ED13/bQEsArNIscbSfw+OtpzM5AfsO4+vMKtlJujD+9PTkOGw==
X-Received: by 2002:a17:902:f693:b0:1c3:83e2:d0c6 with SMTP id
 l19-20020a170902f69300b001c383e2d0c6mr184873plg.52.1694130604796; 
 Thu, 07 Sep 2023 16:50:04 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170902e9c500b001bb04755212sm287862plk.228.2023.09.07.16.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:50:03 -0700 (PDT)
Message-ID: <d4aebe17-c077-90ad-2b99-a856b3a4cdcc@redhat.com>
Date: Fri, 8 Sep 2023 09:49:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/32] machine: Print CPU model name instead of CPU
 type name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-28-gshan@redhat.com>
 <5a87e81c-b28e-d117-7384-38945a2c5b8d@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <5a87e81c-b28e-d117-7384-38945a2c5b8d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/7/23 19:05, Philippe Mathieu-Daudé wrote:
> On 7/9/23 02:35, Gavin Shan wrote:
>> The names of supported CPU models instead of CPU types should be
>> printed when the user specified CPU type isn't supported, to be
>> consistent with the output from '-cpu ?'.
>>
>> Correct the error messages to print CPU model names instead of CPU
>> type names.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> 
>> @@ -1373,11 +1374,18 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
>>           /* The user specified CPU type isn't valid */
>>           if (!mc->valid_cpu_types[i]) {
>> -            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> -            error_append_hint(errp, "The valid types are: %s",
>> -                              mc->valid_cpu_types[0]);
>> +            model = cpu_model_from_type(machine->cpu_type);
>> +            error_setg(errp, "Invalid CPU type: %s", model);
>> +            g_free(model);
>> +
>> +            model = cpu_model_from_type(mc->valid_cpu_types[0]);
>> +            error_append_hint(errp, "The valid types are: %s", model);
>> +            g_free(model);
>> +
>>               for (i = 1; mc->valid_cpu_types[i]; i++) {
>> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +                model = cpu_model_from_type(mc->valid_cpu_types[i]);
> 
> cpu_model_from_type() can return NULL:
> 
>   char *cpu_model_from_type(const char *typename)
>   {
>       const char *suffix = "-" CPU_RESOLVING_TYPE;
> 
>       if (!object_class_by_name(typename)) {
>           return NULL;
>       }
> 
> Don't we want to skip that case?
> 
>                     if (!model) {
>                         continue;
>                     }
> 

No, it's intentional. "(null)" will be printed in this specific case so that
it can be identified quickly and mc->valid_cpu_types[] need to be fixed by
developers.

>> +                error_append_hint(errp, ", %s", model);
>> +                g_free(model);
>>               }
>>               error_append_hint(errp, "\n");
> 

Thanks,
Gavin


