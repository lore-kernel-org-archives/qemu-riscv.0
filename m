Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED61EE57DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 07:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeWLr-0004Cz-7r; Fri, 08 Sep 2023 03:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeWLn-0004C7-4Q
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 03:56:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeWLj-0007Fr-0E
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 03:56:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-402d499580dso19429035e9.1
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694159776; x=1694764576; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e6r47bnQqppy3RXSlZGeuopTuLkcgj1EzvlIAiXJ8CY=;
 b=q5zBVjruJaQKoPX/5hjM18EpX5VRG3pweNs3OAfJIeXwnKTMNEtuAAmKJp+v/6tz8s
 YMv0pxxZVwtl1lbopNbJMDUlRx5CVBWJDfEuc9VOrnAB837HgeZypiJ6ILRV/aF59ZRn
 n9GCQRIfpI6/+wuJgC0Od4Aor/n5Cf5absvUHd75xsZQftExAT+T6jzSHdeSXPZkdbi/
 fHWppDA3oHd4/kRMIyXWyS7QC1bWbd/HPX/BaN9BntUrcByaVYyuVwE4R+mOSO2sml7s
 XpbMHU+pRsmI1fi2QDnzMgtpPrnD615B1LLHyLWJJJYqVdSG9br/AbJtKsexLbqp2OL3
 hlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694159776; x=1694764576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e6r47bnQqppy3RXSlZGeuopTuLkcgj1EzvlIAiXJ8CY=;
 b=gm8PJuYrNuPkypnYZ2OaUE2NPJ7qN2Uadpv3cd7lHOFx3MJIqNCevZgJEcSc+OQcKO
 rCP1tYHomMSqIAwbNj7XZ779lDP6MLW2Yb2bfiEGXQBZIK9JNzw/D6nCHF98tjZJ8mZf
 1ECCJn6NJezMmnemNd3QNkMeeaguaplkXKXNEC2AzLSkM1TC15vIvjv3KiSXsvchLynD
 O5SIqv83wa2XSXEl9l75HZKAs8/9pjmQZ2RZKATzSsQRTfwPRCxcuLkkrklKhONj7wUw
 6e1Krkm3l7Z1XK4ueuiLsfdv2bnkV7VaUh3jL7U12wfnBgTGzU02K1D/0favlMIfEz6h
 pXKw==
X-Gm-Message-State: AOJu0YyIrdnh0qukYTJ14IlYrgknqP1+sTJ8jh8W8Rn10hE33x51aHYM
 dpkBSC9qMIyaJc2Mhi24U/nhkw==
X-Google-Smtp-Source: AGHT+IGsQSxAm7sljolcMlp0GgptAK3oSk7hlqEkFS0duDevzJPjU9xEmsBpMvsi1Y3KaHPJQ6PI+g==
X-Received: by 2002:a05:600c:218f:b0:401:b2c7:34a8 with SMTP id
 e15-20020a05600c218f00b00401b2c734a8mr1630126wme.7.1694159776337; 
 Fri, 08 Sep 2023 00:56:16 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c240c00b003fc06169ab3sm4506564wmp.20.2023.09.08.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 00:56:15 -0700 (PDT)
Message-ID: <a25899be-652a-f104-4efb-f24efcdf2358@linaro.org>
Date: Fri, 8 Sep 2023 09:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 27/32] machine: Print CPU model name instead of CPU
 type name
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4aebe17-c077-90ad-2b99-a856b3a4cdcc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 8/9/23 01:49, Gavin Shan wrote:
> On 9/7/23 19:05, Philippe Mathieu-Daudé wrote:
>> On 7/9/23 02:35, Gavin Shan wrote:
>>> The names of supported CPU models instead of CPU types should be
>>> printed when the user specified CPU type isn't supported, to be
>>> consistent with the output from '-cpu ?'.
>>>
>>> Correct the error messages to print CPU model names instead of CPU
>>> type names.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/core/machine.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>>
>>> @@ -1373,11 +1374,18 @@ static void 
>>> is_cpu_type_supported(MachineState *machine, Error **errp)
>>>           /* The user specified CPU type isn't valid */
>>>           if (!mc->valid_cpu_types[i]) {
>>> -            error_setg(errp, "Invalid CPU type: %s", 
>>> machine->cpu_type);
>>> -            error_append_hint(errp, "The valid types are: %s",
>>> -                              mc->valid_cpu_types[0]);
>>> +            model = cpu_model_from_type(machine->cpu_type);
>>> +            error_setg(errp, "Invalid CPU type: %s", model);
>>> +            g_free(model);
>>> +
>>> +            model = cpu_model_from_type(mc->valid_cpu_types[0]);
>>> +            error_append_hint(errp, "The valid types are: %s", model);
>>> +            g_free(model);
>>> +
>>>               for (i = 1; mc->valid_cpu_types[i]; i++) {
>>> -                error_append_hint(errp, ", %s", 
>>> mc->valid_cpu_types[i]);
>>> +                model = cpu_model_from_type(mc->valid_cpu_types[i]);
>>
>> cpu_model_from_type() can return NULL:
>>
>>   char *cpu_model_from_type(const char *typename)
>>   {
>>       const char *suffix = "-" CPU_RESOLVING_TYPE;
>>
>>       if (!object_class_by_name(typename)) {
>>           return NULL;
>>       }
>>
>> Don't we want to skip that case?
>>
>>                     if (!model) {
>>                         continue;
>>                     }
>>
> 
> No, it's intentional. "(null)" will be printed in this specific case so 
> that
> it can be identified quickly and mc->valid_cpu_types[] need to be fixed by
> developers.

If you want to help developers, use g_assert().


