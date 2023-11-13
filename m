Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650AFC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 16:40:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2Zyc-0004i1-Cf; Mon, 13 Nov 2023 11:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2Zya-0004ga-Mv
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 11:39:52 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2ZyY-0008Km-Ie
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 11:39:52 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6c4cf0aea06so3541850b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 08:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699893588; x=1700498388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k42RWJxCDgbnuAJM00jLFVUrD0//YqFdC9tbbvNlSY8=;
 b=i80vuuFUT66kolh52sNN3ME8i+/T4mMXHKowOenRH8AQBrS+V7Yr/4dCBUGzevVEp2
 URDTqH+vfaigNF1WnZToOBTN92UzbT1Edj5ua0684a2ZNUzJ9qMmmm/7ZqyeKXaT/8qE
 Em71Q49IqoPPdL+1IlL8/2bI2RNHTmTglCtV8+CPLpb7st4JFljSFjyhUo0lzYEFb7Oj
 spfW426iCta/YF22fEaxyfs0Lal6mw8bAyF1I7XGZ1Wn6LTqFGQj5U8BZ6BoNy/ooYN3
 i12Ds4Ivljb2cqtiFBNlHZCEhMhNNKPN4tIsPxvu3tkFqm+95TG9j+rhpguaGkQ+Yule
 45Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699893588; x=1700498388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k42RWJxCDgbnuAJM00jLFVUrD0//YqFdC9tbbvNlSY8=;
 b=W216TrZHxIr7PrYanKUXxgjvFRPsuR6XyJe1S8jNQyW4r/XOqHNsa+GyE9lj0+Y3ED
 gOJD15S0+DeH4DUBS+u2xJTBvhmrZD4+MhbEl8kc0jgRD9WEzks4bEtcSHLDeMDxWSCN
 mOpNLMffWNWaMdlSGOymD607vM4egbYfTRgvBfckR4653hDiFhOmhLMFNqA+7lXAidNl
 02iRH21nB7nzMYrceNWXH4P5zONKqQyMqbbqeAqzhv2oYK8uSh4+20Za0WGIZyxpguon
 i8b/fbLuTJwydUvbRwBjyx+VS0mEMTuKl6eB6BQqKXhOBR4ks50NQs/SCYIdO/YJJ2eA
 rTJA==
X-Gm-Message-State: AOJu0YwTczFqZq1d+r3Adln6Z+iceZdcpXMt8YFUYpXchXrs5GyrJovH
 BB1TBe5WY/hEDcvMaJ+BhDIGFQ==
X-Google-Smtp-Source: AGHT+IG46gm0KVj9Bo4cPrM9nrJ5VtCeVaM/tMaH26bibX0UctAvsnbLQCMmDdG/8XJuAyu2viVVWQ==
X-Received: by 2002:a05:6a00:188a:b0:68a:3ba3:e249 with SMTP id
 x10-20020a056a00188a00b0068a3ba3e249mr9737282pfh.16.1699893588392; 
 Mon, 13 Nov 2023 08:39:48 -0800 (PST)
Received: from [192.168.68.107] ([152.250.131.148])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a62ed0a000000b006be22fde07dsm3968701pfh.106.2023.11.13.08.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 08:39:47 -0800 (PST)
Message-ID: <d05a9f01-6750-411d-91ef-3b3e7e4f63d2@ventanamicro.com>
Date: Mon, 13 Nov 2023 13:39:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] riscv: zicntr/zihpm flags and disable support
Content-Language: en-US
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
 <CAJ307EhA_m3u7VgML1thYpLozcn-iKr-FY-LtPNMzKUDSTvZQQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAJ307EhA_m3u7VgML1thYpLozcn-iKr-FY-LtPNMzKUDSTvZQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
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



On 11/13/23 13:08, Clément Chigot wrote:
> Hi Daniel,
> 
> This series is triggering warnings when instantiating a CPU having a
> spec version older than 1.12.
>    | $ qemu-system-riscv32 -M sifive_e
>    | qemu-system-riscv32: warning: disabling zicntr extension for hart
> 0x00000000 because privilege spec version does not match
>    | qemu-system-riscv32: warning: disabling zihpm extension for hart
> 0x00000000 because privilege spec version does not match

ooops ...

> 
> And IIUC cpu-tcg.c:riscv_cpu_disable_priv_spec_isa_exts(), they will
> end up being disabled as a result of these warnings.
> 
> I think these two extensions should be skipped in the above function.
> Though we can also disable them on purpose in those old CPUs. WDYT ?

I'm not sure if we should disable zicntr/zihpm in these old CPUs. They were
added in a time where weren't no discrete extensions for these counters,
so existing implementations might be relying on these timers to work
properly.

Your idea of skipping them in riscv_cpu_disable_priv_spec_isa_exts() looks
good to me because it handles the problem at the core: these timers are old
features that turned out to be extensions only later on, and our old CPUs were
already implementing them before that. We have some exceptions for zicntr/zihpm
in the code (e.g. they're the only always enable extension in the parent CPU),
might as well add another one.

CC me in this patch (I'm assuming you're sending it, let me know if you want
me to do it instead) and let's get this fixed during this freeze window.



Thanks,


Daniel


> 
> Thanks,
> Clément
> 
> On Mon, Oct 23, 2023 at 5:40 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> In this v3 the patches that added the extensions flags were squashed
>> with the patches that handled the disablement of the extensions in TCG,
>> as suggested by Alistair in v2.
>>
>> No other change made. Patches based on Alistair's riscv-to-apply.next.
>>
>> Patches missing acks: patch 3
>>
>> Changes from v2:
>> - patch 2: squashed with patch 1
>> - patch 5: squashed with patch 4
>> - v2 link: https://lore.kernel.org/qemu-riscv/20231017221226.136764-1-dbarboza@ventanamicro.com/
>>
>> Daniel Henrique Barboza (4):
>>    target/riscv: add zicntr extension flag for TCG
>>    target/riscv/kvm: add zicntr reg
>>    target/riscv: add zihpm extension flag for TCG
>>    target/riscv/kvm: add zihpm reg
>>
>>   target/riscv/cpu.c         | 15 +++++++++++++++
>>   target/riscv/cpu_cfg.h     |  2 ++
>>   target/riscv/csr.c         |  4 ++++
>>   target/riscv/kvm/kvm-cpu.c |  2 ++
>>   target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
>>   5 files changed, 44 insertions(+)
>>
>> --
>> 2.41.0
>>
>>

