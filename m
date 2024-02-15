Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8AC4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 11:55:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raaK1-0000sp-Qj; Thu, 15 Feb 2024 06:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raaJy-0000rw-J1
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 06:54:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raaJw-00076q-LK
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 06:54:30 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d7232dcb3eso5771505ad.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 03:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1707998066; x=1708602866; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LKViYHHaJw2R7Cdn+Ssvv26v5ReZYf2UxmLwPR23u/g=;
 b=nG8zJlyyiMBQBMbHRr6W706yFsZoH+rEUh0AVlgdwYdTWei97daGYkqOAyinUHB2ka
 SttU33viiCNrSGHf6GBnKV73hHxN/L6huZE80C+MrfOTt+8z6SR5hUrrKVdF9ljaer4I
 vlyg4NTe4q1phGbGw/tojFkldYbSeH8dkrLGLC5mzSUMHOC7xauAD+aC3P3gNZI10Gd5
 Qw4yLOzzAnGN/OgFqiAPJVMQigL8s7nNGvNMiydX2xuXNMBlFQSvEWgiD8VhoLKtyZ5P
 myHP6kG4vubUj44N38K1FZwNZhd1KyhWMx9+BGMC2XotVmfvSXHAAPST+keysmDNVqFg
 upXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998066; x=1708602866;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LKViYHHaJw2R7Cdn+Ssvv26v5ReZYf2UxmLwPR23u/g=;
 b=lu75cbgALLQXk1HuSLKuE9q8cw6L7RWKlRcUTg/94/MEXaOYQnn9e2IWyLUHtmejGw
 0QET142hqnzxETfQYGAzDtgrxRAwrwPLWRovOGhs/1W6pBfHaSVdbo8uOvxM3iMhH/Ps
 8HEv5weu+74bqaIkEkicMkI9HkyHBtDOLLPPkYM/03KO/n91KQeQmW+MJ+PtiIEHPVAk
 c6rxBrn21PWMoXzY1Vab2/ez5oHtvLAlJxCC2m3sL70Ql5rHN6lZwEAZTrNOZLbn1LIR
 t8CXjT7qBeoiBwLg0wH4igOiJJKpEGH0M6xLSyu0h2IVFRDwf204qbCSSdxqPUU8F2h+
 aXZw==
X-Gm-Message-State: AOJu0YzZXqe4nGcw2RyKNcbQrpO536vuu15ZgdAXJGVlLvmZtnr33Hp/
 JLfeqKCDSq4S5h9bZ79Cl0hTKTEoCl0fawIhJkaVYA1vLUtS9snbwrbIana8vbA=
X-Google-Smtp-Source: AGHT+IEg54NZO9vF+D6Sq3u87ZwemWA4LTsUw3eryB9WrP95gTqjXm7+/Ktx5EDSkdecIOzJ+WlFUw==
X-Received: by 2002:a17:902:b190:b0:1d9:760d:31c7 with SMTP id
 s16-20020a170902b19000b001d9760d31c7mr1433116plr.29.1707998066248; 
 Thu, 15 Feb 2024 03:54:26 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001da2951a788sm582489plb.304.2024.02.15.03.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 03:54:25 -0800 (PST)
Message-ID: <6afa2f70-8daf-4af7-aabd-b642947451fd@ventanamicro.com>
Date: Thu, 15 Feb 2024 08:54:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] RISC-V: Add Ztso extension
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240207122256.902627-1-christoph.muellner@vrull.eu>
 <3da767e4-26f8-4c92-a241-4111c2befdc2@ventanamicro.com>
 <CAEg0e7jXdfViUSaRc2+6WNtTY37_NhbsuxjPMw4YhQ24-HD3tg@mail.gmail.com>
 <20240214-3d00860c6586b83fb7c5755d@orel>
 <CAEg0e7jEvECjSSo+b4hJd9Bjg9Hk=nknmxAvDUHCk70caqqTng@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEg0e7jEvECjSSo+b4hJd9Bjg9Hk=nknmxAvDUHCk70caqqTng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 2/15/24 06:53, Christoph Müllner wrote:
> On Wed, Feb 14, 2024 at 5:25 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Wed, Feb 14, 2024 at 02:38:34PM +0100, Christoph Müllner wrote:
>>> On Wed, Feb 14, 2024 at 2:35 PM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2/7/24 09:22, Christoph Müllner wrote:
>>>>> The first patch of this series picks up an earlier v2 Ztso patch from Palmer,
>>>>> which can be found here:
>>>>>     https://patchwork.kernel.org/project/qemu-devel/patch/20220917072635.11616-1-palmer@rivosinc.com/
>>>>> This patch did not apply cleanly but the necessary changes were trivial.
>>>>> There was a request to extend the commit message, which is part of the
>>>>> posted patch of this series.  As this patch was reviewed a year ago,
>>>>> I believe it could be merged.
>>>>>
>>>>> The second patch simply exposes Ztso via hwprobe.
>>>>
>>>> It's also worth mentioning that the second patch relies on:
>>>>
>>>> "[PATCH 0/2] linux-user/riscv: Sync hwprobe keys with kernel"
>>>>
>>>> To be applied beforehand.
>>>
>>> Indeed! Therefore, the end of the cover letter contains the following paragraph:
>>> """
>>> This series is based on today's riscv-to-apply.next with my other series
>>> that adds the new hwprobe keys
>>> (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
>>> """
>>
>> I think a line like
>>
>> Based-on: 20240207115926.887816-1-christoph.muellner@vrull.eu
>>
>> in the cover letter would allow the automated tools to green-light this
>> series too.
> 
> Should I resend?

You can add the "Based-on" line as Drew said in case a second version is needed.
Don't worry about it.


Thanks,

Daniel

> 
>>
>> Thanks,
>> drew
>>
>>
>>>
>>> To ease reviewing and testing for others, I've also created a remote
>>> branch on GitHub.
>>>
>>> Thanks for reviewing!
>>>
>>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Daniel
>>>>
>>>>
>>>>>
>>>>> Relevant in this context might be also, that Richard's patch to improve
>>>>> TCG's memory barrier selection depending on host and guest memory ordering
>>>>> landed in June 2023:
>>>>>     https://lore.kernel.org/all/a313b36b-dcc1-f812-ccbd-afed1cbd523b@linaro.org/T/
>>>>>
>>>>> The first patch was already sent as part of an RFC series for Ssdtso:
>>>>>     https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg02962.html
>>>>> Since I don't want to keep this patch until the ratification of Ssdtso,
>>>>> I would like to get this merged independent of Ssdtso.
>>>>>
>>>>> This series is based on today's riscv-to-apply.next with my other series
>>>>> that adds the new hwprobe keys
>>>>> (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
>>>>>
>>>>> This series can also be found here:
>>>>>     https://github.com/cmuellner/qemu/tree/ztso
>>>>>
>>>>> Christoph Müllner (1):
>>>>>     linux-user/riscv: Add Ztso extension to hwprobe
>>>>>
>>>>> Palmer Dabbelt (1):
>>>>>     RISC-V: Add support for Ztso
>>>>>
>>>>>    linux-user/syscall.c                    |  3 +++
>>>>>    target/riscv/cpu.c                      |  2 ++
>>>>>    target/riscv/cpu_cfg.h                  |  1 +
>>>>>    target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
>>>>>    target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
>>>>>    target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
>>>>>    target/riscv/translate.c                |  3 +++
>>>>>    7 files changed, 51 insertions(+), 5 deletions(-)
>>>>>

