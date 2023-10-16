Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11EDCDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:20:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsF5G-0008Nk-PA; Mon, 16 Oct 2023 00:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsF5E-0008MV-T9
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 00:20:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsF5D-00028Y-6H
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 00:20:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so1419285b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 15 Oct 2023 21:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697429997; x=1698034797;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JEoH1lVznpfnVPDdQICX0rRjKCP1BMFYTaY1ewfFES0=;
 b=fmQ+fmVMLAI7gTgm7ryi2CmfmY8wCYdGdcDE6b2QBcF56ZZf8tW/SX7Xc94B49cQUv
 q4697jxjARDCUZD4tze9Wxh8kclukNaAt/1RmRK94IsP1eOmCZcmxlOXYwwSSQwubmtU
 HwsmmxaJInuhjMCXfw6FDydqWFkKR2ZMxRkdl1F/hCxn6gimvmGP+RBvLnhgtEkjtVER
 uDFtB4R8AdV7PwGHH4nJ/rvq+BjRxAh7O30zfeu5ZMNlbBqTnpoy+V59lG4GjL4zLg9C
 05oDtcrOrfL4dIrgVlKow+dFJ1XcdjCr2ijjrluvS5C7S9oRQdDSiKvV9WGByfN/14jY
 w0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697429997; x=1698034797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JEoH1lVznpfnVPDdQICX0rRjKCP1BMFYTaY1ewfFES0=;
 b=c5IX7u1CRiZSjqWFC67q/SB8sdgy2B4VhwjAdU/awnLFwGCnt24kBH/uSmL+uxMwgW
 mybs9m2K0DRfUtFHBdyjeT8midVMNR5AEQ/uRz1e6L/Svntyyr1MUQhJbU8j2bTmOOJ+
 dirbUAs2shtcXDZTLS/eWCgujP0nLjBjH+0ErsmVfSCa7/b4+u5qdf2AHqno1JOfUm5j
 +3Uzt986bihlAwAWWFdgrtEX3KCb2Dc1UfYHBKP6eONpO2ujYUClHqkiTQo32gjFB1Ca
 lb6CL6Gi67+kPuDnczbm2eWeeYzIhQHkfW4Ky+IXTR1ScPOpPIPGuayZyXhPSK8Mvs/E
 wLYw==
X-Gm-Message-State: AOJu0YwWv9b8D0BPEa3TOofRyP56TCMHGFL5WKPO6RR6VgxIijrX8ttv
 pvSs9S72GDLJSpJO/09ai8xIZw==
X-Google-Smtp-Source: AGHT+IEr50gicMawX99dMXF2NbxuPr3MU410ECXdL6HBc3EfSScl9TaLMJ4E1GZbApowZVEAZ5lvkg==
X-Received: by 2002:a05:6a20:a110:b0:161:3013:b499 with SMTP id
 q16-20020a056a20a11000b001613013b499mr39016909pzk.60.1697429997349; 
 Sun, 15 Oct 2023 21:19:57 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a17090ac21400b0026b3f76a063sm3671022pjt.44.2023.10.15.21.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 21:19:57 -0700 (PDT)
Message-ID: <57ffefcb-176b-4d8e-8b4d-4a202bf0f7e0@daynix.com>
Date: Mon, 16 Oct 2023 13:19:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/riscv: Do not allow MXL_RV32 for
 TARGET_RISCV64
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
 <20231014033545.15220-2-akihiko.odaki@daynix.com>
 <597bf4be-207b-400a-be49-bc18900809a0@ventanamicro.com>
 <CAKmqyKPqk1sURLQNBoH0MeSJVSut72XiN4H0uT=95S953o7Taw@mail.gmail.com>
 <5670669b-cdfa-4b8f-b02b-b009e7c16540@daynix.com>
 <CAKmqyKOuupgZV0=eS37mnwnGxiq=c90HFkC7T5MoZDfKAo9VzQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAKmqyKOuupgZV0=eS37mnwnGxiq=c90HFkC7T5MoZDfKAo9VzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/10/16 13:07, Alistair Francis wrote:
> On Mon, Oct 16, 2023 at 1:22 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>>
>>
>> On 2023/10/16 10:51, Alistair Francis wrote:
>>> On Sun, Oct 15, 2023 at 4:05 AM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/14/23 00:35, Akihiko Odaki wrote:
>>>>> TARGET_RISCV64 does not have riscv-32bit-cpu.xml so it shouldn't accept
>>>>> MXL_RV32.
>>>>>
>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> ---
>>>>
>>>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>
>>>>
>>>>>     target/riscv/tcg/tcg-cpu.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>>>>> index a28918ab30..e0cbc56320 100644
>>>>> --- a/target/riscv/tcg/tcg-cpu.c
>>>>> +++ b/target/riscv/tcg/tcg-cpu.c
>>>>> @@ -161,10 +161,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>>>         case MXL_RV128:
>>>>>             cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>>>>>             break;
>>>>> -#endif
>>>>> +#elif defined(TARGET_RISCV32)
>>>>>         case MXL_RV32:
>>>>>             cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>>>>>             break;
>>>>> +#endif
>>>
>>> This isn't the right fix. The idea is that riscv64-softmmu can run
>>> 32-bit CPUs, so we instead should include riscv-32bit-cpu.xml
>>
>> In that case I can continue working on the previous version of this
>> series, but is it really true? I see no 32-bit CPUs enabled for
>> riscv64-softmmu. Is there a plan to enable them for riscv64-softmmu?
> 
> Yeah....
> 
> So last time I tried the 32-bit CPUs didn't work correctly. I didn't
> figure out what the issue was, but the *idea* is to eventually enable
> 32-bit CPUs in the 64-bit builds.

Ok, then I'll push the previous version forward.

Daniel, you are concerned that moving misa_mxl_max to class to match 
with gdb_core_xml_file will result in an extra casts when fetching it 
and data when initializing the class.

I think the extra cast is fine since no fetch of misa_mxl_max happens in 
a hot path. Requiring data when initializing the class should also be 
fine since the proposed patch uses the class_data member of TypeInfo, 
which is currently free. Does it make sense?

