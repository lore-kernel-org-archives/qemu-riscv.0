Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78180EEB57E
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 23:53:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfUEz-00078o-KU; Sun, 10 Sep 2023 19:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfUEy-00078N-JT
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfUEu-0001Rm-JS
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694389995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap8jyUrXwHgxdqod+JAjPn4oLiZqDgWz3jFfOIi6xsM=;
 b=DcjQdbMbPYXXhMoPNnEaGvX6K/F4cyNZHR9zWXoPOjlJfKVhSxmtqfU3TFgmjftiRvUyoy
 HD784vHj8ezSHmzqiTcm3Lx05H4+jmOzSmHeFsSQbgw9PC+Vhf036SayodD9ITAOyEb8Qg
 QujCj0lLbnwy4E1KEPwvz2vYPBa0mB0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-74_8j_RKMbqUXzTPuIqONA-1; Sun, 10 Sep 2023 19:53:14 -0400
X-MC-Unique: 74_8j_RKMbqUXzTPuIqONA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-68fb883629aso1286011b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 10 Sep 2023 16:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694389993; x=1694994793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ap8jyUrXwHgxdqod+JAjPn4oLiZqDgWz3jFfOIi6xsM=;
 b=FTO7adPdZLM4I/R71L6vEyvtitMmHJRbNbomTIo9IBQLqunqsIVytQ0Ff8gWk3QFR9
 HUX/rlIb3HJkBT9y+vUqFywPnCgqcrlsf1Z62nZka2yILrgywoQvBKdQAAWgni+rU1Gd
 pugIMGz6SWDWuT8tUdkUZxoaEc4SISyWuzBLkiUV0VtkLN+EPqyXt8Q3HyxrYvvZ89jT
 ZDoCE+6vBM8Uqf/3N58v336UefS9ujxr3pSOtmMrgSvj8Z6YBOIfV8DgKUyLMhjqBuuV
 NKC3DPyRzXW8Zoj9g41qoOzPR0yMxp9YaHqagQuLwUd2DqVbr78iCaQhG1MigCtO5WtO
 Nj9A==
X-Gm-Message-State: AOJu0YwLaINOKnCMnFNTFWfv/gSGIETrUuFv3vbYjYqL/S512hfYEWUO
 T37P46O6RY+SWy+Z4B0+oTAkaibZTY7ZON1kp4BSTIbE0ZeFpTy6CjkhcopSjhJlQr/nedd3a4A
 N2ozdaKPBn6+m2QY=
X-Received: by 2002:a05:6a00:2301:b0:68a:5877:bfb1 with SMTP id
 h1-20020a056a00230100b0068a5877bfb1mr10313997pfh.20.1694389993500; 
 Sun, 10 Sep 2023 16:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLDBUuwMY4+d9ys82hxbkhGiirWTD/Zaq3MUkjBpifVkaU03GyjGaYtt0tO90IjO+1+aeEeA==
X-Received: by 2002:a05:6a00:2301:b0:68a:5877:bfb1 with SMTP id
 h1-20020a056a00230100b0068a5877bfb1mr10313976pfh.20.1694389993225; 
 Sun, 10 Sep 2023 16:53:13 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a056a001c9400b0068fcc7f6b00sm80251pfw.74.2023.09.10.16.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 16:53:12 -0700 (PDT)
Message-ID: <a99d2893-de4c-c188-2f27-5130d34a867d@redhat.com>
Date: Mon, 11 Sep 2023 09:52:53 +1000
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
 <d4aebe17-c077-90ad-2b99-a856b3a4cdcc@redhat.com>
 <a25899be-652a-f104-4efb-f24efcdf2358@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a25899be-652a-f104-4efb-f24efcdf2358@linaro.org>
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

On 9/8/23 17:56, Philippe Mathieu-Daudé wrote:
> On 8/9/23 01:49, Gavin Shan wrote:
>> On 9/7/23 19:05, Philippe Mathieu-Daudé wrote:
>>> On 7/9/23 02:35, Gavin Shan wrote:
>>>> The names of supported CPU models instead of CPU types should be
>>>> printed when the user specified CPU type isn't supported, to be
>>>> consistent with the output from '-cpu ?'.
>>>>
>>>> Correct the error messages to print CPU model names instead of CPU
>>>> type names.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/core/machine.c | 16 ++++++++++++----
>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>>
>>>> @@ -1373,11 +1374,18 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
>>>>           /* The user specified CPU type isn't valid */
>>>>           if (!mc->valid_cpu_types[i]) {
>>>> -            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>>>> -            error_append_hint(errp, "The valid types are: %s",
>>>> -                              mc->valid_cpu_types[0]);
>>>> +            model = cpu_model_from_type(machine->cpu_type);
>>>> +            error_setg(errp, "Invalid CPU type: %s", model);
>>>> +            g_free(model);
>>>> +
>>>> +            model = cpu_model_from_type(mc->valid_cpu_types[0]);
>>>> +            error_append_hint(errp, "The valid types are: %s", model);
>>>> +            g_free(model);
>>>> +
>>>>               for (i = 1; mc->valid_cpu_types[i]; i++) {
>>>> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>>>> +                model = cpu_model_from_type(mc->valid_cpu_types[i]);
>>>
>>> cpu_model_from_type() can return NULL:
>>>
>>>   char *cpu_model_from_type(const char *typename)
>>>   {
>>>       const char *suffix = "-" CPU_RESOLVING_TYPE;
>>>
>>>       if (!object_class_by_name(typename)) {
>>>           return NULL;
>>>       }
>>>
>>> Don't we want to skip that case?
>>>
>>>                     if (!model) {
>>>                         continue;
>>>                     }
>>>
>>
>> No, it's intentional. "(null)" will be printed in this specific case so that
>> it can be identified quickly and mc->valid_cpu_types[] need to be fixed by
>> developers.
> 
> If you want to help developers, use g_assert().
> 

g_assert() wins. It will be included into v4 :)

Thanks,
Gavin


