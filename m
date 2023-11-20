Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC26C197A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 12:16:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r53CK-0003Zm-ER; Mon, 20 Nov 2023 07:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r53CH-0003YO-PB
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 07:16:13 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r53CE-0000e2-Sb
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 07:16:12 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548a2c20f50so1686888a12.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Nov 2023 04:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482569; x=1701087369; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFwTUgdGmz6e1RnmeB28qxX070DArTGK86lTEvx/A3M=;
 b=P8xyxCURrmXbo8Pssl/G1OGebfFR3ZZUDigVfkVT/4R6HgaOHnE9fi/DpFgcgG0NUl
 Hz4X6AU5b3Ax53Uv6L73joMhpTW/dj9a7Qxu/SndMPXiTp/BjTSDfzW8JrlNRjQOBMog
 ku48C3rTDSmiIXR9JO0ZOUS8zAaN20r+AyZBMpGSiu732WLY/nSuC01AGeB2HxX+f2kz
 JgVUIK0A6P44Gkl3YZRjisXsDmYkennwdKauu3kEwZ+Gm2XFla5mb5FDwTowLSDEZJEh
 n3Cru0/Fo3bD+Bldki8m8IZz+64B9TCdAWZvV+X83dftk8qVsO3abCv0zUgFeh7uKCoK
 dlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482569; x=1701087369;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFwTUgdGmz6e1RnmeB28qxX070DArTGK86lTEvx/A3M=;
 b=oSz9ioHJEr0/AL9l09j6jW+O1yFDou4+eHiG8rCAdyobgnlVrnLQjfdAvHXheYxtKC
 t6MCTRjUa/zIDLbfKm6xUTImW2AflhYuR5rDixTTpdMBPUZpWU/ttXhD8sudDUeKoByW
 /DseCatPdGu8glOXckbmgrCl6POQBzwudJ30UIe4Q3k537QQWTCYS8tHKQnWkjQXfw0Z
 3tyIsa2AdW5uTkjZVEjSUxlYKA731W0oRys1M6u3UAbGHqtOwjhsKUnnFEz83CQZNt0b
 yw16qN50dNqeA/3/BxZtDE9ghqz+EsVkVKpo8Uk/vQuE913a+j6/ddWVf1ctfghjg3PP
 lzbQ==
X-Gm-Message-State: AOJu0YzcpNkGraCbU8n8sPXNVt+oH0fUUADdf+HVDl7M8n0WhbSDFHxs
 z0sG7xYCvj7gPdyqj8Iq6EZSAg==
X-Google-Smtp-Source: AGHT+IFO/Th0OkauubHlx+ksS3YieIsh5pl7kF/TT/D3qMHgpuc9aHoPik5K5GpISrhjOZKaLmpt6w==
X-Received: by 2002:a17:906:2249:b0:9dd:4811:7111 with SMTP id
 9-20020a170906224900b009dd48117111mr5298369ejr.4.1700482569345; 
 Mon, 20 Nov 2023 04:16:09 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090673cc00b009dd606ce80fsm3862535ejl.31.2023.11.20.04.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 04:16:08 -0800 (PST)
Message-ID: <3bd74930-f445-47b2-bb76-8451aa7b995a@linaro.org>
Date: Mon, 20 Nov 2023 13:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
Content-Language: en-US
To: LeoHou <LeoHou@canaan-creative.com>, Dongxue Zhang <elta.era@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@canaan-creative.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-riscv <qemu-riscv@nongnu.org>, =?UTF-8?B?5byg5Lic6Zuq?=
 <zhangdongxue@canaan-creative.com>,
 "leohou1402@gmail.com" <leohou1402@gmail.com>
References: <cover.1699496263.git.houyingle@canaan-creative.com>
 <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
 <CAEomy4TmM0ShGkuV2mprB8Xm0Kn62ZWZA7Gnfvt07pioY9fCCA@mail.gmail.com>
 <bf0c7c6d-a940-4968-ab18-4af6125b8d0b@linaro.org>
 <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/11/23 05:25, LeoHou wrote:
> On 9/11/23 23:26, Philippe Mathieu-Daudé  wrote:
>   
>> Hi Leo,
>>
>> First, I can't find your patch in my mailbox, so I'm replying to
>> Dongxue's review.
>>
>> On 9/11/23 03:41, Dongxue Zhang wrote:
>>> Reviewed-by: Dongxue Zhang <zhangdongxue@canaan-creative.com>
>>>
>>>
>>>> On Thu, Nov 9, 2023 at 10:22 AM Leo Hou <LeoHou@canaan-creative.com> wrote:
>>>>
>>>> From: Leo Hou <houyingle@canaan-creative.com>
>>>>
>>>> cpu_by_arch_id() uses hartid-base as the index to obtain the corresponding CPUState structure variable.
>>>> qemu_get_cpu() uses cpu_index as the index to obtain the corresponding CPUState structure variable.
>>>>
>>>> In heterogeneous CPU or multi-socket scenarios, multiple aclint needs to be instantiated,
>>>> and the hartid-base of each cpu bound by aclint can start from 0. If cpu_by_arch_id() is still used
>>>> in this case, all aclint will bind to the earliest initialized hart with hartid-base 0 and cause conflicts.
>>>>
>>>> So with cpu_index as the index, use qemu_get_cpu() to get the CPUState struct variable,
>>>> and connect the aclint interrupt line to the hart of the CPU indexed with cpu_index
>>>> (the corresponding hartid-base can start at 0). It's more reasonable.
>>>>
>>>> Signed-off-by: Leo Hou <houyingle@canaan-creative.com>
>>>> ---
>>>>     hw/intc/riscv_aclint.c | 16 ++++++++--------
>>>>     1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
>>>> index ab1a0b4b3a..be8f539fcb 100644
>>>> --- a/hw/intc/riscv_aclint.c
>>>> +++ b/hw/intc/riscv_aclint.c
>>>> @@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>>>>             addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
>>>>             size_t hartid = mtimer->hartid_base +
>>>>                             ((addr - mtimer->timecmp_base) >> 3);
>>>> -        CPUState *cpu = cpu_by_arch_id(hartid);
>>>> +        CPUState *cpu = qemu_get_cpu(hartid);
>>
>> There is some code smell here. qemu_get_cpu() shouldn't be called by
>> device models, but only by accelerators.
> 
> Yes, qemu_get_cpu() is designed to be called by accelerators.
> But there is currently no new API to support multi-socket and
> heterogeneous processor architectures，and sifive_plic has been
> designed with qemu_get_cpu().
> Please refer to:
> [1] https://lore.kernel.org/qemu-devel/1519683480-33201-16-git-send-email-mjc@sifive.com/
> [2] https://lore.kernel.org/qemu-devel/20200825184836.1282371-3-alistair.francis@wdc.com/
> 
> 
>> Maybe the timer should get a link of the hart array it belongs to,
>> and offset to this array base hartid?
> 
> The same problem exists not only with timer, but also with aclint.
> There needs to be a general approach to this problem.

Right. However since there is no heterogeneous support in QEMU
at present, we don't need this patch in the next release.

So I'd rather wait and work on a correct fix. Up to the maintainer.

Regards,

Phil.

>> I'm going to
>> NACK
>> this patch until further review / clarifications.
> 
> Regards,
> 
> Leo Hou.


