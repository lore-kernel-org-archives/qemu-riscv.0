Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF845C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 23:24:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2gHh-0006Vh-Oc; Mon, 13 Nov 2023 18:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gHf-0006Ur-Mn
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 18:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gHd-0002T7-BV
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 18:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699917836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OujD5ycfqz/svV9Ju/bsg82JbTieO3a6f7J8r2fIurI=;
 b=fGj+uUNxy3cKXPJAr/Ylp03wX6v6EEjY/pg/xgLMy0DbF+B1wiVVP35nrq20kxdoo2Oh+G
 b70cS0jdCuCJY4aZ6ciwQ0FWtreZZLEzsmRsc3GZMfRREGHk8xrXrROrVS3lKEZhCkNG4D
 8QgNbjAAgmAfm6Bhzl9VuZZbFzHdQBI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-ggY-nIGjN0-kAI7ZagOMrg-1; Mon, 13 Nov 2023 18:23:54 -0500
X-MC-Unique: ggY-nIGjN0-kAI7ZagOMrg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cc5c4972bdso67468905ad.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 15:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699917833; x=1700522633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OujD5ycfqz/svV9Ju/bsg82JbTieO3a6f7J8r2fIurI=;
 b=gziFtpJhnp3bHj1IrrQYxqWCBG979ImHICkhKYG65WmvMN+IaxSRukQ5keuedeyXDr
 taZ8hDgb6S6CXA2+3XCsIRpQELWLYQogrf00AfZJKZDo/FLbzarHEZxzWbulvIYkQCqL
 KBCCSbytE0Nsfr3Yjom52+gGEU4gAReaXA3GieEL4OjEvrTZc4ShXlH3wSeGXrBDXNzK
 0keHyvI1rTtSVRidUFH+7ANUThhuddTz8UbT1rnaXG6esFOpMLE7G7iyUF78sQ25Myh+
 Wm0yX5cse9tYn4mqnZAtoYe1GqrtdcDvQcb7acgiarn76n2HcLURuVEzahsOHQtAnGJ6
 fkmQ==
X-Gm-Message-State: AOJu0YxRyXDN2TmsX0qc5cUfVako3zrrGFb87r2r8RwIf3/SVkZW4KT1
 4ZVm/FSDwxlsBjRgFyDkfPGUT7I5NZvxirOqAgggYyx23LymdIN5l16smIiQYcSpt5Jqi4CruCs
 vKwxFtY3bQYC5wis=
X-Received: by 2002:a17:902:7d87:b0:1c9:e508:ad54 with SMTP id
 a7-20020a1709027d8700b001c9e508ad54mr564827plm.13.1699917833524; 
 Mon, 13 Nov 2023 15:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE98UpH3dmsODcyf2HUx2Br1VA7hOZQKSeZwTaVRQuRdyCsnYe+7v/N5wY/UAl9d64SCe3WIg==
X-Received: by 2002:a17:902:7d87:b0:1c9:e508:ad54 with SMTP id
 a7-20020a1709027d8700b001c9e508ad54mr564807plm.13.1699917833077; 
 Mon, 13 Nov 2023 15:23:53 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170902dad200b001ca82a4a9c0sm4501618plx.309.2023.11.13.15.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 15:23:51 -0800 (PST)
Message-ID: <4f2b342b-bf32-4fee-9736-a3536ddf5d92@redhat.com>
Date: Tue, 14 Nov 2023 09:23:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-2-gshan@redhat.com>
 <20231106152229.02d6326a@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231106152229.02d6326a@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 11/7/23 00:22, Igor Mammedov wrote:
> On Thu,  2 Nov 2023 10:24:28 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> For target/alpha, the default CPU model name is "ev67". The default
>> CPU model is used when no matching CPU model is found. The conditions
>> to fall back to the default CPU model can be combined so that the code
>> looks a bit simplified.
> 
> default cpu should be specified by board not by target internals.
> 

Yes, MachineClass::default_cpu_type used to specify the default CPU type.
I will improve the changelog in next revision to avoid the confusion.

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/alpha/cpu.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 51b7d8d1bf..c7ae4d6a41 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && object_class_is_abstract(oc)) {
>> -        oc = NULL;
>> -    }
>>   
>>       /* TODO: remove match everything nonsense */
> 
> Let's do ^^^^^ instead of just shifting code around.
> It will break users that specify junk as input, but it's clear
> users error so garbage in => error out.
> 

Ok. The whole chunk of code to fall back to 'ev67' will be dropped
in next revision.

> 
>> -    /* Default to ev67; no reason not to emulate insns by default. */
>> -    if (!oc) {
>> +    if (!oc || object_class_is_abstract(oc)) {
>> +        /* Default to ev67, no reason not to emulate insns by default */
>>           oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>>       }
>>   

Thanks,
Gavin


