Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BDFC4167B
	for <qemu-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 23:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9vlk-0001q2-J3; Sun, 03 Dec 2023 18:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vlj-0001pc-WB
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 18:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vli-0000V6-LQ
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 18:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701645657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spwkLDHgoaxm9u/144CqpiGtbQ9F85ARNRSrmjoTQow=;
 b=STIcNEsNAbOwfzFbbQGy0GAZpTEQc5g4py59DOMOga8CqPvxH1z2gFRBACKd/s51VT7F4y
 GISftOAMDobG7zWVJUODpAA8WZi1d1kdI59pqM/aN6gj0U0gt+HO1U9bkaYuGgzqTs2G38
 A2bBGAYbnHFYda4vaAsQuvnO9I7F0vE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-lv1Iti_tOkKXWhBXlMMxSw-1; Sun, 03 Dec 2023 18:20:54 -0500
X-MC-Unique: lv1Iti_tOkKXWhBXlMMxSw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1f9dc7a1f1bso4224733fac.2
 for <qemu-riscv@nongnu.org>; Sun, 03 Dec 2023 15:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701645653; x=1702250453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=spwkLDHgoaxm9u/144CqpiGtbQ9F85ARNRSrmjoTQow=;
 b=l0YPnOd2zLcOQmaJPbfITrx25RYH2AxyHIDH0d8cwLWrpVkpqdkgT/iLVRSqIBaAz8
 frfsPPHd3+6BC8bg84OSzoYD9YnHjyhQgoy/vSmsnjgwjn+xZjfQxbmAGsb/0l1oRPw+
 H7bfnsQkw+MKz/IZRni+Qo6tfRPcH3x2bEERXPqVV3FO5w3bhrFnny4U4g4X+sHkwEvZ
 mSCLLDnsHMb8FVA7UoulMn2pzUTHEal/DDBBoLw56ZCE99Y7jvCawnCTPgT0E7EamlZ3
 ue7J0kgRDu5JVg7kDyB3nWhAvR8WfViqiqo7MmyJ7jAkJCFSEnAwALqAhADYE2gPcNn/
 dTSg==
X-Gm-Message-State: AOJu0YyaPnsp60uevcsk88SbDSGqMBCxOT4oVipcr5xZnz1XoOjae43J
 RgTiegrij1nx/C1SGCgEoLEV9PIYz/bCzWMAJtHTliYYQTyeyhpLBpJR24tO1dSPo2eVNwdLJ4h
 6eAtyZ+0XAhtfgYA=
X-Received: by 2002:a05:6870:d889:b0:1fb:75b:2fb3 with SMTP id
 oe9-20020a056870d88900b001fb075b2fb3mr3531154oac.74.1701645653611; 
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+mtUOBvNeAZYsiln7QyrSwYC05F2KrlSocmiKdSvDR7WktaYEtI9UNJCAMAuSt2buO7tQyQ==
X-Received: by 2002:a05:6870:d889:b0:1fb:75b:2fb3 with SMTP id
 oe9-20020a056870d88900b001fb075b2fb3mr3531134oac.74.1701645653335; 
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 c5-20020aa78805000000b006cb65cfde6dsm6358199pfo.200.2023.12.03.15.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
Message-ID: <fa0e8be7-8f18-4d74-ad5d-6dc44d375d2d@redhat.com>
Date: Mon, 4 Dec 2023 09:20:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
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
 <20231129042012.277831-4-gshan@redhat.com>
 <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi Phil

On 12/1/23 20:57, Philippe Mathieu-Daudé wrote:
> On 29/11/23 05:20, Gavin Shan wrote:
>> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
>> NULL.
> 
> This case is a programming error, right? We should simply:
> 
>   assert(!mc->valid_cpu_types || *mc->valid_cpu_types);
> 

Yes, assert() should be used instead. I will do this like below:

     if (mc->valid_cpu_types && machine->cpu_type) {
         assert(mc->valid_cpu_types[1] != NULL);


>> So the check is skipped for this particular case. The constraint
>> has been taken when the error messags are appended.
>>
>> A precise hint for the error message is given when mc->valid_cpu_types[0]
>> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
>> when we have mutiple valid entries there is avoided to increase the code
>> readability, as suggested by Philippe Mathieu-Daudé.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
> 

Thanks,
Gavin


