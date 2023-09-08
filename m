Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD01EE57E0
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 08:04:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeWTY-00073G-13; Fri, 08 Sep 2023 04:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeWTW-00072b-2u
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 04:04:22 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeWTR-0000Ed-IM
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 04:04:21 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so6231787a12.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 01:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694160256; x=1694765056; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9FFI25x9GTZeiyzvEXXJMGaXXFgZwCtnXBqrzsL6nY=;
 b=tMvCwNy7C1TeS7VQG4vuuQPz0pJkGecrNveOvQvLtxl0mqYx7j8OoC6xA6CelOpYH0
 W7bkqSOA1IiRYvN5Rq9mKtVeNg/ZYHIhvh7PJNOavVifglwn0C7r+hdoAW77IJzt0sy/
 fc+a8zpzCp/gxMj9DomO3453+rEh2+xeYPfmP5xf1WqRZtiZxsSaUewrAyCtC01lUxy7
 XkypiETP3mtYDf2V2ymqB95RkG1OzK4z9Lkbg/JzUXMFWD85lPObXpMniy+MXLiy7Q1Y
 ySN1w6iU20uHh0s/I9KQsiqrILZO7EIIWkJvq8TgmRyNzEPafMwQ9ClhAdkDLGAVtO72
 xKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694160256; x=1694765056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9FFI25x9GTZeiyzvEXXJMGaXXFgZwCtnXBqrzsL6nY=;
 b=SL5SkUOnLN5CjcFWxREgoI0AVmT45TdO1+dDQuKYr1RAcnXjRs1KulhUTdUYj3xvRO
 reKmDSeXTvVyu5MY0lF1nuk07kF67dzuyLx06mYcC+qFJxunS5dqX6ULlfwcHjCxyhr2
 l/C0N1EEHuJkiPgJ6n+eTCF7X2b1DKxVrs0LoUNuGlMwPMaz1npYTw6ORrLwVh6qjsEx
 WZNfY/Q/o8q5ohd2PFAVTZthyF5MU+MpO0ZjjXi2I4wnozYblc98wAsVKDHsP+pIBoMC
 ukjYARGt9rB5HKWJQ2G/va7V5skNE/RfyEdbJNh+RiIWSUUMMbgpkVxqZKneQzr3Vzin
 EM2Q==
X-Gm-Message-State: AOJu0Yz8mOSeF4xi0U2ME9ZAIjjgO3Dl10Tb+MNZZViYM6hrIvlG5AnG
 KMqMywi0kyn8P9m5v1wRtkx4aw==
X-Google-Smtp-Source: AGHT+IHDZhForzIm1vBZCDsrLSzB79sscmNMHn37ReE/8KexdA5zYxe5bXQeUWOlWzuwv5bs81GZ6Q==
X-Received: by 2002:a17:907:2d25:b0:9a5:9b93:d60d with SMTP id
 gs37-20020a1709072d2500b009a59b93d60dmr6429123ejc.36.1694160255712; 
 Fri, 08 Sep 2023 01:04:15 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a17090637c600b00991e2b5a27dsm664080ejc.37.2023.09.08.01.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 01:04:14 -0700 (PDT)
Message-ID: <5e3a1a66-9d33-cf14-56f7-0fa097b27fcb@linaro.org>
Date: Fri, 8 Sep 2023 10:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
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
 npiggin@gmail.com, ysato@users.sourceforge.jp, thuth@redhat.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-16-gshan@redhat.com>
 <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
 <ab07d81c-da98-a270-c3f6-0625912c6d0b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ab07d81c-da98-a270-c3f6-0625912c6d0b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

On 8/9/23 01:44, Gavin Shan wrote:
> 
> On 9/7/23 18:20, David Hildenbrand wrote:
>> On 07.09.23 02:35, Gavin Shan wrote:
>>> For target/s390x, the CPU type name is always the combination of the
>>> CPU modle name and suffix. The CPU model names have been correctly
>>> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
>>>
>>> Use generic helper cpu_model_from_type() to show the CPU model names
>>> in the above two functions. Besides, we need validate the CPU class
>>> in s390_cpu_class_by_name(), as other targets do.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>>>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>>>   2 files changed, 15 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>>> index 91ce896491..103e9072b8 100644
>>> --- a/target/s390x/cpu_models.c
>>> +++ b/target/s390x/cpu_models.c
>>> @@ -338,7 +338,8 @@ static void 
>>> s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>>   {
>>>       const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
>>>       CPUClass *cc = CPU_CLASS(scc);
>>> -    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
>>> +    const char *typename = object_class_get_name((ObjectClass *)data);
>>> +    char *model = cpu_model_from_type(typename);
>>>       g_autoptr(GString) details = g_string_new("");
>>>       if (scc->is_static) {
>>> @@ -355,14 +356,12 @@ static void 
>>> s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>>           g_string_truncate(details, details->len - 2);
>>>       }
>>> -    /* strip off the -s390x-cpu */
>>> -    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
>>>       if (details->len) {
>>> -        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, 
>>> details->str);
>>> +        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, 
>>> details->str);
>>>       } else {
>>> -        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
>>> +        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
>>>       }
>>> -    g_free(name);
>>> +    g_free(model);
>>>   }
>>>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
>>> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char 
>>> *name)
>>>       oc = object_class_by_name(typename);
>>>       g_free(typename);
>>> -    return oc;
>>> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
>>> +        !object_class_is_abstract(oc)) {
>>> +        return oc;
>>> +    }
>>> +
>>> +    return NULL;
>>
>> Why is that change required?
>>
> 
> Good question. It's possible that other class's name conflicts with
> CPU class's name. For example, class "abc-base-s390x-cpu" has been
> registered for a misc class other than a CPU class. We don't want
> s390_cpu_class_by_name() return the class for "abc-base-s390x-cpu".
> Almost all other target does similar check.

I agree with David there is some code smell here.

IMO this check belong to cpu_class_by_name(), not to each impl.


