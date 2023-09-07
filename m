Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E73EC8759
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 23:44:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeOfp-00066L-3P; Thu, 07 Sep 2023 19:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOfn-000666-Oz
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOfl-0002sj-CL
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 19:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694130268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auFvH47RQsTJlEWgbS6R9mPJHb1EUu2ooesuyxdHYpE=;
 b=ACLINhdCOWW7HUQwHhpo4AR6p8UXzo7d8ZgSwnXJdchHo8heJTsn1vQAQ3oDsV2xEEzXtb
 9aQlBmUym7mSLYRIqrLrwt0Cq+qZTtfU6sp9XVC94bXCpcQuW1FDpDU5egeh7CIh7C9mDm
 5LPSSdzntcBJslN1cPtEAI+GGx5+2Jo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-JnSNGz-zNpyOggPiwfyO3w-1; Thu, 07 Sep 2023 19:44:27 -0400
X-MC-Unique: JnSNGz-zNpyOggPiwfyO3w-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1bf703dd21fso21236365ad.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 16:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694130266; x=1694735066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=auFvH47RQsTJlEWgbS6R9mPJHb1EUu2ooesuyxdHYpE=;
 b=M7mHPiestl0wQY777hkhSpHkeToQgilsyCbfn7f5nK1bEmzzwcl3FUm4BT8+OVvOj/
 H50Ki8SWnuWSQFjmnj+GydVjeMhfJH1/sDcavWuL7g8FZaiE1UKRrgMXqmbvZ3rVyTUX
 NCUbyi4hqaFahwrO38vrxtZQavVIRvabnTozr/3uFuTv+iDFQED1Ua1yiCSrXiW+CqkI
 msJ5SbuSZ7yqW1vSrRrvIo6Q973r8hA7oLAcWJkXk6rQCW2vCb+e1b4QYfZPAy3C7Wiy
 Heey7uKufBNTAmlTF/BbXnQfFLzWdE+lhGFn+CNL51gDpfHFkFtik2QjGzoGkpOEsgiX
 8YIg==
X-Gm-Message-State: AOJu0Yy5BTmTEe0vTCkoFkvXNhGrW7+M1mAqi8I6TMPZIfQ6ATtCAmtU
 snq4nqH9Mm4rmsUJpQ/vDLGxAqLB8mJtGrkQBc5SgqtZmPP10/4pywe/kgvcFv60rIoqJMa7CdP
 IlEfCDg+Pf52kyTk=
X-Received: by 2002:a17:902:c1c4:b0:1c1:e53a:c2f with SMTP id
 c4-20020a170902c1c400b001c1e53a0c2fmr962844plc.27.1694130266062; 
 Thu, 07 Sep 2023 16:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7a2X2VCBBZ21cdfgvUbCI6/4iWBifAc3QRFQJIiThkPuEBjOHhkpNNdjnVCfOwESX5S/K1A==
X-Received: by 2002:a17:902:c1c4:b0:1c1:e53a:c2f with SMTP id
 c4-20020a170902c1c400b001c1e53a0c2fmr962829plc.27.1694130265736; 
 Thu, 07 Sep 2023 16:44:25 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709028ec200b001b89a6164desm289730plo.118.2023.09.07.16.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:44:22 -0700 (PDT)
Message-ID: <ab07d81c-da98-a270-c3f6-0625912c6d0b@redhat.com>
Date: Fri, 8 Sep 2023 09:44:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 9/7/23 18:20, David Hildenbrand wrote:
> On 07.09.23 02:35, Gavin Shan wrote:
>> For target/s390x, the CPU type name is always the combination of the
>> CPU modle name and suffix. The CPU model names have been correctly
>> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
>>
>> Use generic helper cpu_model_from_type() to show the CPU model names
>> in the above two functions. Besides, we need validate the CPU class
>> in s390_cpu_class_by_name(), as other targets do.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>>   2 files changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index 91ce896491..103e9072b8 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -338,7 +338,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>   {
>>       const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
>>       CPUClass *cc = CPU_CLASS(scc);
>> -    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
>> +    const char *typename = object_class_get_name((ObjectClass *)data);
>> +    char *model = cpu_model_from_type(typename);
>>       g_autoptr(GString) details = g_string_new("");
>>       if (scc->is_static) {
>> @@ -355,14 +356,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>           g_string_truncate(details, details->len - 2);
>>       }
>> -    /* strip off the -s390x-cpu */
>> -    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
>>       if (details->len) {
>> -        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
>> +        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, details->str);
>>       } else {
>> -        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
>> +        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
>>       }
>> -    g_free(name);
>> +    g_free(model);
>>   }
>>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
>> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    return oc;
>> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
>> +        !object_class_is_abstract(oc)) {
>> +        return oc;
>> +    }
>> +
>> +    return NULL;
> 
> Why is that change required?
> 

Good question. It's possible that other class's name conflicts with
CPU class's name. For example, class "abc-base-s390x-cpu" has been
registered for a misc class other than a CPU class. We don't want
s390_cpu_class_by_name() return the class for "abc-base-s390x-cpu".
Almost all other target does similar check.

Thanks,
Gavin


