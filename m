Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCFFE95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qppri-0002Nr-T5; Mon, 09 Oct 2023 09:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qpprf-0002M4-AI; Mon, 09 Oct 2023 09:00:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qpprb-0001qm-T5; Mon, 09 Oct 2023 09:00:02 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso26523675ad.1; 
 Mon, 09 Oct 2023 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696856398; x=1697461198; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6baBjLax584F+Wx48PItrTfzoctcDA9vXZXF0/tHFY8=;
 b=fdb39VxSeazZ1+AlyXnE0Qn4X4tDwq5aE8prudXtMMX7+ugtBRKiC7hnqOuU+kwC7n
 nbSn2EECzQEPoGCBvWVF+uroAXhdUx0GWu5JC8/Y6byi+dhU6o5W+Q+FX7hwc6Pu23nV
 saO7s5JlI5Zpzlt6kpzuulmm8ETA9byXrl0lfhQZY6to8VBLJJXYWtNDhEmLMEvvroFp
 QKCT1QGu9iVku71D6aRhpbbnhGg+3+wYFeUP+glGGrjHeUCSXtbO7ltckVoMojpf4O6O
 0b+oXpk5V2cC2CD/iFMb9LbPj57+MaCg6LdhCTrR13AhdVSAPk6ZteyPg0o6q6njCZSR
 47Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696856398; x=1697461198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6baBjLax584F+Wx48PItrTfzoctcDA9vXZXF0/tHFY8=;
 b=MmsSThunkWwanZ+qAwa2l4CTrrCkARWreLF0bmlzGIVQltwLtSjOfVK5AGtxQvkwgr
 mQxTlCJ2vdWNIsm7KX9hOMbnJw5x7J3LUo3UiZR9niD442Urd0rlDbE3oBZY6dmkDp0j
 chEd5d9fyXXq54zi1ilNUqRPszul15djFQBR9Z+baNNZWR49BkD6zESNACtKkU43PQox
 vvzil01ZjHOJDnjZ2L7o/Ad8dwX5OjSXjod68we8UWnjGT8ylu5LdHABWHwP9/WMFAHi
 L5Af+8vr9cN4ZV0PqfKYd0gYhkXiQ4KN7YE3olw5Ark3B/RAMpicpduPLMiH4fqSEgdj
 T7hw==
X-Gm-Message-State: AOJu0YyMO2BsLFGfj2gbMw9uGSUMHhRhTtZX1obUrLldZgLY3V3aaKyb
 UA/0ECS8/DablRfb8wZykL8=
X-Google-Smtp-Source: AGHT+IFhZGcN7gLG3cAdRkbu4seZWZltEMN3kwo8lU9at2v9o7oxLTEqH5uPq4DA/Wuovnpc7DzWmw==
X-Received: by 2002:a17:902:e890:b0:1c7:3156:ca48 with SMTP id
 w16-20020a170902e89000b001c73156ca48mr14004827plg.47.1696856397633; 
 Mon, 09 Oct 2023 05:59:57 -0700 (PDT)
Received: from [30.221.98.57] ([47.246.101.57])
 by smtp.gmail.com with ESMTPSA id
 bf5-20020a170902b90500b001c57aac6e5esm9481743plb.23.2023.10.09.05.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 05:59:57 -0700 (PDT)
Message-ID: <80b9d1e6-3048-4308-8cae-2c51be90cd92@gmail.com>
Date: Mon, 9 Oct 2023 20:58:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Use a direct cast for better performance
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, pbonzini@redhat.com
References: <20231008215147.3362612-1-rjones@redhat.com>
 <20231008215147.3362612-2-rjones@redhat.com>
 <50894b0f-effe-4e0d-81a9-51dc24a05489@linux.alibaba.com>
 <20231009125321.GR7636@redhat.com>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20231009125321.GR7636@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=baxiantai@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/10/9 20:53, Richard W.M. Jones wrote:
> On Mon, Oct 09, 2023 at 08:36:28PM +0800, LIU Zhiwei wrote:
>> On 2023/10/9 5:50, Richard W.M. Jones wrote:
>>> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
>>> this adds about 5% total overhead when emulating RV64 on x86-64 host.
>>>
>>> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
>>> disk.  The guest has a copy of the qemu source tree.  The test
>>> involves compiling the qemu source tree with 'make clean; time make -j16'.
>>>
>>> Before making this change the compile step took 449 & 447 seconds over
>>> two consecutive runs.
>>>
>>> After making this change, 428 & 422 seconds.
>>>
>>> The saving is about 5%.
>>>
>>> Thanks: Paolo Bonzini
>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu_helper.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 3a02079290..479d9863ae 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -66,7 +66,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>>>                             uint64_t *cs_base, uint32_t *pflags)
>>>   {
>>>       CPUState *cs = env_cpu(env);
>>> -    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +    /*
>>> +     * Using the checked cast RISCV_CPU(cs) imposes ~ 5% overhead when
>>> +     * QOM cast debugging is enabled, so use a direct cast instead.
>>> +     */
>>> +    RISCVCPU *cpu = (RISCVCPU *)cs;
>> This function is very hot. Maybe we should cache the tbflags instead
>> of calculate it here. Otherwise,
> This function is indeed very hot, taking over 20% of total host time
> in my guest stress test.
>
> How would we cache the flags?  AIUI they simply depend on machine
> state and we must recalculate them either when the machine state
> changes (sprinkle "update_tbflags" everywhere)
Yes, we should do in this way.
>   or here.  If you have
> any suggestions I can try things.
I think it exceeds this patch.
>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> I posted a v3 based on Philippe's feedback.

OK.

Thanks
Zhiwei

>
> Rich.
>
>> Zhiwei
>>
>>>       RISCVExtStatus fs, vs;
>>>       uint32_t flags = 0;

