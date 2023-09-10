Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA2C71153
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 23:52:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfUDd-0006E4-Hi; Sun, 10 Sep 2023 19:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfUDb-0006DK-TK
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfUDO-0001FP-VW
 for qemu-riscv@nongnu.org; Sun, 10 Sep 2023 19:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694389901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1qxxh2+fI+mesrtDkof8J1FbUtQfmGsY47dCNqq+Z4=;
 b=CK9sD86RFNwXxXXCmNSa4wNbO4MMLaJAII609ct9S6GKWJQXTZT0CXKSshvAy1ZuMxvKa0
 tUdmGogowIiW8VTnUYB7OJtWXxQ0ng1YecBc8cDkPG5azrzbGUS8E4KyrgQVO95jmKrq63
 eW4TAdkGZ80Y/VdIdDLK6cm4ToIol2M=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-r0eND6FaPzKI7ux0jTUYGQ-1; Sun, 10 Sep 2023 19:51:40 -0400
X-MC-Unique: r0eND6FaPzKI7ux0jTUYGQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6be515ec5d2so3896446a34.3
 for <qemu-riscv@nongnu.org>; Sun, 10 Sep 2023 16:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694389900; x=1694994700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1qxxh2+fI+mesrtDkof8J1FbUtQfmGsY47dCNqq+Z4=;
 b=t8fycq0AH2ZaHIyWgKi8zfZjNOjGpa8jottSnBtHgge5MhPxWbIP47+qXT4tlWf7oa
 s0LleNgjUj85pRZ1VMqsCjtpL84kFNIhZKAcl1AJycJgtSp+mgHzMtJ7I6tYXBOrB5aD
 eDc6ir9DkhY1qYO48xEl6FCCAlE29zsFes9Dxs4QkHRRTCjXgpURWv4uRrU7rD+cjpx1
 qeutdSDGpMYF21H3saOWA3z3uiujDMBvTMzFllUdlIKE5MlkiVejremIoPJG4JvZZ73B
 YDc2L0qlTqQXnE8REmhF2xvQ9GutpVkRUHaBZXkdKT0PMTGdddBf9BZfL/G93F3BYNqu
 I+hw==
X-Gm-Message-State: AOJu0YzEhYMlW9MNtXZ0QQVO6aR/q2MDlxVxwJLuSUEzSfZJUWh/1phq
 ZgopAXD8rNsztvWu27a0726Zm3RYx7s/hZbOGzzFYUEdBpMhau7HUPj6rjaWWafL6AulG3RLl4W
 N1kthIqmMb4pKprk=
X-Received: by 2002:a05:6358:8829:b0:129:c50d:6a37 with SMTP id
 hv41-20020a056358882900b00129c50d6a37mr9335599rwb.16.1694389899816; 
 Sun, 10 Sep 2023 16:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNAd7d0QSgqYbpK9NrmrLgGcUx1FjyAB6qy+AUOeRJTs0J6E0qfgPoPZUzbVaDhbwx4siE6Q==
X-Received: by 2002:a05:6358:8829:b0:129:c50d:6a37 with SMTP id
 hv41-20020a056358882900b00129c50d6a37mr9335541rwb.16.1694389899474; 
 Sun, 10 Sep 2023 16:51:39 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 cq27-20020a056a00331b00b0068fb9965036sm1380014pfb.109.2023.09.10.16.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 16:51:38 -0700 (PDT)
Message-ID: <9af2e956-ad3c-b1ab-ad23-72d72d2a31d3@redhat.com>
Date: Mon, 11 Sep 2023 09:51:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
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
 <5e3a1a66-9d33-cf14-56f7-0fa097b27fcb@linaro.org>
 <a8298b7b-309d-8986-2b2c-d53d50832987@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a8298b7b-309d-8986-2b2c-d53d50832987@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.473, SPF_HELO_NONE=0.001,
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

On 9/8/23 21:23, Philippe Mathieu-Daudé wrote:
> On 8/9/23 10:04, Philippe Mathieu-Daudé wrote:
>> On 8/9/23 01:44, Gavin Shan wrote:
>>>
>>> On 9/7/23 18:20, David Hildenbrand wrote:
>>>> On 07.09.23 02:35, Gavin Shan wrote:
>>>>> For target/s390x, the CPU type name is always the combination of the
>>>>> CPU modle name and suffix. The CPU model names have been correctly
>>>>> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
>>>>>
>>>>> Use generic helper cpu_model_from_type() to show the CPU model names
>>>>> in the above two functions. Besides, we need validate the CPU class
>>>>> in s390_cpu_class_by_name(), as other targets do.
>>>>>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>>>>>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>>>>>   2 files changed, 15 insertions(+), 12 deletions(-)
> 
> 
>>>>>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
>>>>> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
>>>>>       oc = object_class_by_name(typename);
>>>>>       g_free(typename);
>>>>> -    return oc;
>>>>> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
>>>>> +        !object_class_is_abstract(oc)) {
>>>>> +        return oc;
>>>>> +    }
>>>>> +
>>>>> +    return NULL;
>>>>
>>>> Why is that change required?
>>>>
>>>
>>> Good question. It's possible that other class's name conflicts with
>>> CPU class's name. For example, class "abc-base-s390x-cpu" has been
>>> registered for a misc class other than a CPU class. We don't want
>>> s390_cpu_class_by_name() return the class for "abc-base-s390x-cpu".
>>> Almost all other target does similar check.
>>
>> I agree with David there is some code smell here.
>>
>> IMO this check belong to cpu_class_by_name(), not to each impl.
> 
> Suggestion implemented here:
> https://lore.kernel.org/qemu-devel/20230908112235.75914-1-philmd@linaro.org/
> 

Right. That is better way to consolidate the checks. I've provided my
comments for your code changes. I believe I need to rebase my v4 series
on top your changes. Philippe, please let me know if I need include your
patches to my v4 series, modify the code accordingly and send them together
for review.

Thanks,
Gavin


