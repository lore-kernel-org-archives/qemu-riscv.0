Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C76CDB483
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 10:18:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtQ63-0005fm-7Y; Thu, 19 Oct 2023 06:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qtQ5z-0005eq-8F
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 06:17:40 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qtQ5u-0001Fe-0S
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 06:17:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c9e072472bso52014465ad.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Oct 2023 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697710652; x=1698315452;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=43ITPoUUF/xKfnM/vZJRGDRmtPTbadQHPjaCAxxIxqo=;
 b=uL750ag+YPSMymNz9nfvNggX31g2Rm7pasezCxGDj0DjGMqJBIG3HQjddAlNDp3SY/
 +Ixw9uSzPTreccNAWcVdEGwdC0DLReyJQftfHO9KRNSIh1ZNwmnoYyb9yKdNgI5/MfLv
 2HE5dQgrHsNpDAeT1u59LLYnOtEnEs9zU5rRdTu+Vvu5TBb86oMYrn+BNL9BGgLzCyyK
 kDt6a7uWNG9wGdnysYrhjGGKAO7kZQnLAe5cx4lOBIBFZ+IiZCplPid+XDB0S1BXSqC4
 +qbHQ7Ih5aJYEDGdCxPalu/Y55Vj/WdlZGLFSYL5mJz3JuqNegtrzIyszIlCBLE/IQFY
 WHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697710652; x=1698315452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=43ITPoUUF/xKfnM/vZJRGDRmtPTbadQHPjaCAxxIxqo=;
 b=LKrnsHbkoDEjy+cjL8z2iF14dTRyliC3j/tTAkvWRYvHtUo0LgXM5FxIA51io2Z+86
 +xy9NTkgwgWFkJ2cQLuPB+e5MjVD5Zcyjjtf3q9/ejnZEHStn7rmmoKjgbQ4cK9IzYRp
 BiiwguTcyKWdhFsJB8cgvryOyS5djeUhwuSh/oco7bjJZiyN44gltz+ZwLp7IIglVC9/
 pcuXYP13oUo29rJr66SJVKlTIywPiptp4mEVTPQ5kDFsvruZlvcPsoRsbVFidv8jGYKH
 /rgGq9eR6hcP/iGIkc8Vza8nl94EoAXpNIVfcdFHO+Mr0+nNY5f6wgSq7apKuOgCzjBN
 GU6g==
X-Gm-Message-State: AOJu0YzMq+IVBDVrbHnz1+zC94o5lGvlEdDVhuITjf2yhTeFyYWlvZjV
 8CJFf/VBSpxECqbjfcmiT1bnYA==
X-Google-Smtp-Source: AGHT+IFyazvGdtKbkG6GjzpMvg2ZyGtxJYyG9hUdBa+xwNXUBQuBvJCH/Bon4VjCJWMC/D2osrz6iQ==
X-Received: by 2002:a17:903:449:b0:1c7:3558:721a with SMTP id
 iw9-20020a170903044900b001c73558721amr1721199plb.58.1697710652516; 
 Thu, 19 Oct 2023 03:17:32 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 ji4-20020a170903324400b001b016313b1dsm1571815plb.86.2023.10.19.03.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 03:17:32 -0700 (PDT)
Message-ID: <867e1c2f-8e7e-4f87-a08d-5a1f849a3210@daynix.com>
Date: Thu, 19 Oct 2023 19:17:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] target/riscv: Move misa_mxl_max to class
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20231017185406.13381-1-akihiko.odaki@daynix.com>
 <20231017185406.13381-4-akihiko.odaki@daynix.com>
 <a829aa4c-0b6f-40b9-a357-99c43d066f3b@ventanamicro.com>
 <ebb52078-2182-4656-a224-928b65124cd3@daynix.com>
 <f1b4af6c-dc83-4d48-bf3f-c4ae408539cd@ventanamicro.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <f1b4af6c-dc83-4d48-bf3f-c4ae408539cd@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/10/18 23:23, Daniel Henrique Barboza wrote:
> 
> 
> On 10/18/23 10:31, Akihiko Odaki wrote:
>> On 2023/10/18 22:01, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 10/17/23 15:53, Akihiko Odaki wrote:
>>>> misa_mxl_max is common for all instances of a RISC-V CPU class so they
>>>> are better put into class.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>
>>> I'll repeat what I said in the v1: this patch is adding an extra 
>>> class parameter,
>>> an extra param required to each class_init, and an extra CPUClass 
>>> cast every time
>>> we want to read misa_mxl_max, all of that because we want to assign 
>>> gdb_core_xml_file
>>> earlier.
>>>
>>> If my previous suggestion of assigning gdb_core directly into 
>>> riscv_cpu_class_init()
>>> doesn't work necause we need misa_mxl_max to do it, a good 
>>> alternative is setting
>>> gdb_core_xml_file in riscv_cpu_post_init(), which is executed after 
>>> all cpu_init()
>>> functions where we already have env->misa_mxl_max set properly.
>>
>> We want to assign gdb_core_xml_file *earlier* so assigning it after 
>> cpu_init() is not OK. In general it should be considered unsafe to 
>> initialize a class variable after class_init(); otherwise other 
>> subsystems cannot know when it becomes available.
> 
> There's no difference in assigning it during .instance_init (cpu_init()) 
> and
> .instance_post_init. The callbacks are called one after the other during
> init time. See qom/object.c,  object_initialize_with_type().
> 
> Now, if we want to be strict with only initializing class variables 
> during class_init(),
> which is something that I will defer to the maintainers, we want to 
> minimize the use
> of env->misa_mxl_max in the code before converting it to a class 
> variable. env->misa_mxl
> is always equal to env->misa_mxl_max, and they are being used 
> interchangeably, but if
> misa_mxl_max is going to be a class variable then we want to use 
> env->misa_mxl instead
> to avoid the RISCV_CPU_GET_CLASS() overhead.
> 
> I suggest a pre-patch to change the uses of env->misa_mxl_max to 
> env->misa_mxl in
> riscv_is_32bit(), riscv_cpu_gdb_read_register(), 
> riscv_cpu_gdb_write_register() and
> so on (there are quite a few places). And then apply this patch on top 
> of it. This would
> at least minimize the amount of casts being done.

misa_mxl and misa_mxl_max may be same for now, but they exist because 
they will be different in the future; otherwise there is no reason to 
have misa_mxl_max at the first place. misa_mxl represents the current 
effective value and misa_mxl_max represents the maximum value the 
emulated CPU supports.

So we need to preserve the existing choice of misa_mxl and misa_mxl_max 
in general. riscv_cpu_gdb_read_register() and 
riscv_cpu_gdb_write_register(), for example, must use misa_mxl_max 
instead of misa_mxl since GDB doesn't support changing register width at 
runtime, and the register width should match with the feature 
description provided by gdb_core_xml_file.

The use of env->misa_mxl_max in riscv_is_32bit(), however, looks not 
good to me. If a 64-bit processor is in 32-bit mode, the 32-bit kernel 
should be loaded. I added a patch to change it to env->misa_mxl in v5.

> 
> All this considered, there's still one extra class cast that we will 
> have to deal with
> in riscv_tr_init_disas_context(). I am not sure how hot this function is 
> but, taking a
> look at other .init_disas_context implementations from other archs and 
> not finding class
> casts in them, I'm worried about the overhead it'll add. It seems like 
> we can just do
> "ctx->misa_mxl_max = env->misa_mxl" to avoid it.

The cost of the class type check should be negligible considering that 
init_disas_context() is followed by the TCG translation, which takes 
most of execution time.

