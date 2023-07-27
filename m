Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25ABC001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 05:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOtMq-0002LK-Et; Thu, 27 Jul 2023 01:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOtMf-0002Ir-7y
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 01:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOtMb-0008Fc-He
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 01:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690434996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MB62iwUTWE6vJ1eiAjJv5G3wdLCfwPDlmKuliPo1kDk=;
 b=UNb8kJ6VDSQMox4RZXjxOp4NrqXJg1nPBzuFYTgX99ybQW7phLm8N7MCgjo3zk7bES9hBS
 NbR+x7cgEbq3ibctXx85KHAKBBO7kHQm7FwZ4FSS66OB3C3HtLj7lguZJ2ODMjZ1XoqdU9
 vgvaiXCx3D56rzW+jFpAF7NgpK+Bsqk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-_O-Ml__jMtCjIf5mqeSMOA-1; Thu, 27 Jul 2023 01:16:32 -0400
X-MC-Unique: _O-Ml__jMtCjIf5mqeSMOA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-686bc3f11feso390586b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Jul 2023 22:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690434991; x=1691039791;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MB62iwUTWE6vJ1eiAjJv5G3wdLCfwPDlmKuliPo1kDk=;
 b=CKpckHJJGI3p7nmY2RIeF9bOYWcOSzzbuOxc8xDv4Hi6OJJObd2UpJKzmHHUH3qlVu
 0atSJlu53HFQOFlZK+kJ2JTXFHIKz3Y4BRFfYOZGWxPNSZjWmguHvYkquh+lupx/lRg9
 kWnIdVpyb3B13b+8CnFjFAmA3+Pue9iwXdtP0GXrwYG9pcy3G17m5Sbo5MT2QsFHS/fj
 nWpagBdbnjIrkOxIMasp04iUwno8taDCsfwHRyO8CzTn2Y6eplNbGvi6f3tgrKHeigFQ
 3cO9DRNr04VLNZ66k5hSxg2ekW/DhhVPuNIPSlkg8PrWwymrLrnkEKiWbKFUA5tde9LH
 VxQA==
X-Gm-Message-State: ABy/qLagiVAcWtrlWV8c8HPnUrC5MG6G6rW7oqvNE3T+tNE9Sb07JZps
 vcR0SRP7vgrxAfhJ5e02LM38A6vzRnxDHLTofXAO5Axw5w034Xm9mxUn/jMip30bQ5D4KF313eL
 JkwKhSiiGHkangy0=
X-Received: by 2002:a05:6a00:a13:b0:668:7494:384a with SMTP id
 p19-20020a056a000a1300b006687494384amr1993855pfh.12.1690434991208; 
 Wed, 26 Jul 2023 22:16:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcP6cyLiy7dsvhOjqCYF7o4/rMGmDfzavqByv9SGsd9vMLAZ7LB6BRE8+D35wyT5u8jSq+yg==
X-Received: by 2002:a05:6a00:a13:b0:668:7494:384a with SMTP id
 p19-20020a056a000a1300b006687494384amr1993811pfh.12.1690434990865; 
 Wed, 26 Jul 2023 22:16:30 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 f15-20020aa78b0f000000b0066a613c4a58sm508843pfd.102.2023.07.26.22.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 22:16:30 -0700 (PDT)
Message-ID: <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
Date: Thu, 27 Jul 2023 15:16:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


On 7/27/23 09:08, Richard Henderson wrote:
> On 7/25/23 17:32, Gavin Shan wrote:
>> -static const char *q800_machine_valid_cpu_types[] = {
>> +static const char * const q800_machine_valid_cpu_types[] = {
>>       M68K_CPU_TYPE_NAME("m68040"),
>>       NULL
>>   };
>> +static const char * const q800_machine_valid_cpu_models[] = {
>> +    "m68040",
>> +    NULL
>> +};
> 
> I really don't like this replication.
> 

Right, it's going to be lots of replications, but gives much flexibility.
There are 21 targets and we don't have fixed pattern for the mapping between
CPU model name and CPU typename. I'm summarizing the used patterns like below.

   1 All CPU model names are mappinged to fixed CPU typename;
   2 CPU model name is same to CPU typename;
   3 CPU model name is alias to CPU typename;
   4 CPU model name is prefix of CPU typename;

   Target         Categories    suffix-of-CPU-typename
   -------------------------------------------------------
   alpha          -234          -alpha-cpu
   arm            ---4          -arm-cpu
   avr            -2--
   cris           --34          -cris-cpu
   hexagon        ---4          -hexagon-cpu
   hppa           1---
   i386           ---4          -i386-cpu
   loongarch      -2-4          -loongarch-cpu
   m68k           ---4          -m68k-cpu
   microblaze     1---
   mips           ---4          -mips64-cpu  -mips-cpu
   nios2          1---
   openrisc       ---4          -or1k-cpu
   ppc            --34          -powerpc64-cpu  -powerpc-cpu
   riscv          ---4          -riscv-cpu
   rx             -2-4          -rx-cpu
   s390x          ---4          -s390x-cpu
   sh4            --34          -superh-cpu
   sparc          -2--
   tricore        ---4          -tricore-cpu
   xtensa         ---4          -xtensa-cpu

There are several options as below. Please let me know which one or something
else is the best.

(a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to track
the valid CPU typenames and CPU model names.

(b) Introduce CPUClass::model_name_by_typename(). Every target has their own
implementation to convert CPU typename to CPU model name. The CPU model name
is parsed from mc->valid_cpu_types[i].

     char *CPUClass::model_by_typename(const char *typename);

(c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_cpu_models
because the CPU type check is currently needed by target arm/m68k/riscv where we
do have fixed pattern to convert CPU model names to CPU typenames. The CPU typename
is comprised of CPU model name and suffix. However, it won't be working when the CPU
type check is required by other target where we have patterns other than this.

Thanks,
Gavin


