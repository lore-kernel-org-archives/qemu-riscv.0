Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B01C48BC1
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 13:43:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raFXH-00072C-2S; Wed, 14 Feb 2024 08:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raFXF-00071R-Tp
 for qemu-riscv@nongnu.org; Wed, 14 Feb 2024 08:42:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raFXD-0001oh-RR
 for qemu-riscv@nongnu.org; Wed, 14 Feb 2024 08:42:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d953fa3286so42928605ad.2
 for <qemu-riscv@nongnu.org>; Wed, 14 Feb 2024 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1707918166; x=1708522966; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2auo9oBTkUDUdR/b36sittQ3kuxtvCXUg45SfblRYg4=;
 b=gAgIAacckRj2usQ1VCO9X+9Qt2MUCazcvIoemIOhEWfEEaraTkC1zblKeqryF1hHE0
 Q0IMH+zar2guiSUYNFMaqp5zHXNgq5Xi63CrhNdmTm+Om6LpJJbssEkLyeDBgEVtX2ig
 Fkn57aE7K5z9hWivl3gDbgFE1BxqPxf7mtI91loAu01hrvZzBQcNSlLiYmltcES5PHQS
 9dkY5KM4Lj/rv4EuoOhfca5OJC3qEJmCmZVBdUYsnLVo309bEkyi6z/22istjAAtPuTW
 bM/qM35rp7dz97M+VCWO58ruVKKCiqONh3JAeTHSYkz7lHbSuPgeVOMOTgss9vosQZqQ
 PP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707918166; x=1708522966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2auo9oBTkUDUdR/b36sittQ3kuxtvCXUg45SfblRYg4=;
 b=DaWieQ8LYghvpvBBp3RgHGEf920qb+spfaArOL6jFcpCqnhQVDaLIYcJ9hP2MqWlgB
 FW8in+N+P1fC2/TPBl3TYnla5qW8ttNAvQc1GH/FUlcnMpOi5Sq3pEFFV6TFnPytUE6w
 O9ny9Ua9LhDxix60nf6as3pU76VUvs8WDW0vXnSX+U9cAU57/gVvvykAT3Og7UmapgVz
 FefvP2rXM8mZ6Zbpw7LmrYpAnYLWJydwJaTpgWDtbR/THAHgJSs4djoPIgBbx912lCx/
 we0XdcY2lwB6rU+r4ojAuj+h81P6Hmi/K1WtqWppjwk563CjEWNuNFYvni8aiIhaG9j6
 XSlg==
X-Gm-Message-State: AOJu0YyERdIPyKEHe4HFcQA6NQKOng2BVoOpQry/M5PbJ47HNHrGNZDp
 gAvc+YV2uI4loMUIiDI87Jyb/7IIm1hHdrwTvFY5Tulxi8jR6tlfWtHClM4qeMU=
X-Google-Smtp-Source: AGHT+IF3WHcoOJSuXqOyI7rnv0Sfl4qbYKBmJukdStj8+hStVJcRicoaeV5MlwdkNDbn8O437+GjJg==
X-Received: by 2002:a17:902:ba82:b0:1d8:ae30:eddd with SMTP id
 k2-20020a170902ba8200b001d8ae30edddmr2766077pls.23.1707918166344; 
 Wed, 14 Feb 2024 05:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8R7v+1VIIeJqFpwFo5V2JNAYQgjRZfEhxWZP3ewg9dQr8WqTmKLgvQ+yIHs/gedzjDyrcMGII8ycfh5Q7kk9T727kGhDMTW6gSJihvZ3j7yMiyITBigeBoz5KKKZnR+SrkzE9A1BPnd6+vxx7jvr9Bd4pHT4kBZ0gaxu/s3GkRhlmIEoJtLJf4oSO6KXKjJ24Z+eGwW106/FvzydABxAIFW/NqFhA05irY2RlnzbOZ7/Vqz3Safo2gHTshACeg48nNVXJ0hS9SH0rJKe1qV9ilUXRBfTEPutftx94
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170902c1d500b001d9602f3dbesm3718154plc.24.2024.02.14.05.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:42:45 -0800 (PST)
Message-ID: <72350b07-acc5-4ece-b5e2-a3c8e41b80a2@ventanamicro.com>
Date: Wed, 14 Feb 2024 10:42:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] RISC-V: Add Ztso extension
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240207122256.902627-1-christoph.muellner@vrull.eu>
 <3da767e4-26f8-4c92-a241-4111c2befdc2@ventanamicro.com>
 <CAEg0e7jXdfViUSaRc2+6WNtTY37_NhbsuxjPMw4YhQ24-HD3tg@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEg0e7jXdfViUSaRc2+6WNtTY37_NhbsuxjPMw4YhQ24-HD3tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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



On 2/14/24 10:38, Christoph Müllner wrote:
> On Wed, Feb 14, 2024 at 2:35 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 2/7/24 09:22, Christoph Müllner wrote:
>>> The first patch of this series picks up an earlier v2 Ztso patch from Palmer,
>>> which can be found here:
>>>     https://patchwork.kernel.org/project/qemu-devel/patch/20220917072635.11616-1-palmer@rivosinc.com/
>>> This patch did not apply cleanly but the necessary changes were trivial.
>>> There was a request to extend the commit message, which is part of the
>>> posted patch of this series.  As this patch was reviewed a year ago,
>>> I believe it could be merged.
>>>
>>> The second patch simply exposes Ztso via hwprobe.
>>
>> It's also worth mentioning that the second patch relies on:
>>
>> "[PATCH 0/2] linux-user/riscv: Sync hwprobe keys with kernel"
>>
>> To be applied beforehand.
> 
> Indeed! Therefore, the end of the cover letter contains the following paragraph:
> """
> This series is based on today's riscv-to-apply.next with my other series
> that adds the new hwprobe keys
> (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
> """

I guess it's also worth mentioning that I didn't pay enough attention to the
cover letter :skull:



Thanks,

Daniel

> 
> To ease reviewing and testing for others, I've also created a remote
> branch on GitHub.
> 
> Thanks for reviewing!
> 
>>
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>
>>>
>>> Relevant in this context might be also, that Richard's patch to improve
>>> TCG's memory barrier selection depending on host and guest memory ordering
>>> landed in June 2023:
>>>     https://lore.kernel.org/all/a313b36b-dcc1-f812-ccbd-afed1cbd523b@linaro.org/T/
>>>
>>> The first patch was already sent as part of an RFC series for Ssdtso:
>>>     https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg02962.html
>>> Since I don't want to keep this patch until the ratification of Ssdtso,
>>> I would like to get this merged independent of Ssdtso.
>>>
>>> This series is based on today's riscv-to-apply.next with my other series
>>> that adds the new hwprobe keys
>>> (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
>>>
>>> This series can also be found here:
>>>     https://github.com/cmuellner/qemu/tree/ztso
>>>
>>> Christoph Müllner (1):
>>>     linux-user/riscv: Add Ztso extension to hwprobe
>>>
>>> Palmer Dabbelt (1):
>>>     RISC-V: Add support for Ztso
>>>
>>>    linux-user/syscall.c                    |  3 +++
>>>    target/riscv/cpu.c                      |  2 ++
>>>    target/riscv/cpu_cfg.h                  |  1 +
>>>    target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
>>>    target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
>>>    target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
>>>    target/riscv/translate.c                |  3 +++
>>>    7 files changed, 51 insertions(+), 5 deletions(-)
>>>

