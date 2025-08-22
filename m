Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D99CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTKB-0005ig-Qy; Fri, 22 Aug 2025 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTK8-0005gb-KK
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:05:00 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTK1-0005Qq-Ql
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:05:00 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-77033293ed8so641840b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755875089; x=1756479889; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RcXFpFcsz2o2Nzjw3h3EANE1RROMlfaR0fdCkYlkHB4=;
 b=uSx+N1R198ooF/tSDI9xHwhEruiRcsG0nG9LGr34dEzkYIQ/4K7gMUYFzFUEtvy3Rc
 FiOcxiqfEKaPmgva7xTlYg0zxvhfEWiy31ZP1lIXChK+EIzECnxayFx+CfiyRFcS4hz1
 DctcKs8YR1eO88wmsqVG8jrQb4+rNjt96LcZM4Wk9uOROy5wk/scMjQTI5MTECTBi+pG
 /Q2Um/KQmjCmXj19pcrgdymvlZAZ98hIHPKSameNii9Q6iv+scdykki6FIzOcNqx2KXR
 siFDzWgyOUz6d1pJBnZp1hRfh+0p0kxi1nPYKd+Nh5QNrTLWFTOQeFtPtF9ZINI57kX7
 5KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755875089; x=1756479889;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RcXFpFcsz2o2Nzjw3h3EANE1RROMlfaR0fdCkYlkHB4=;
 b=F2mY2W3/Llp91k55va/NkmSQKto/0RJB5/Kw2wHiiPLsBdlOmq5iC+RzRjZS6INwuc
 fMb1GmaI8F6dbCVMGMTJ1eOrJ8J3bgKOkyIoViZ5pXsrT3lnZI0CLADClGENCQbw8obI
 ETMEbtawm9quyiisIBbI3QoERGr/1QkiWGVci2//9L4pK5zKkVWFANhPlxBnkx2DQ0G2
 wxaJocw/Ke3BZHKM8YiEXFE0yA+eo/NMBskA9dWy2vTnAfg30FI/usRPzc65TGPMh6Tf
 qI4l8GE8lZzezwh4VQhIFfm7PNC7FufWoaVEbUPj1+eZ3AabXZNBaBZiljizJfykR+zA
 O/8A==
X-Gm-Message-State: AOJu0Yw4RrzZdmakwllFBKIEG7ix6hIhgEiuyzjRTE0ivsKb0ywYWokL
 kOa05hQ6BxaduWlV4vWUPdiwB+reMCLF6DFIfkPQiJcvOEf9CKV3ibOj/OCjFCdURfY=
X-Gm-Gg: ASbGncvjpue+aPCkApLBo5kTyZawal/dMB3WQpovKeA3Qj1hrBrsRz+lPeim+9d1m5/
 y+CQ8kVvZkYf53ouwk7QenBo93LjcQQ5l1rlCGPouccGXWB5EE6mQp4DYkDVfGL2/p1rAWILAiN
 fWX+dT3uRJJdXI1YYd6xeOzHECmF5+62llF+fdXa421jDEJeVwr0SpXQezBZpC2jFCTC5G5Crjh
 rwzwYxKHxk/dG5tGeuwy2cdU7KCSB7AEfwh2QDZOB9ZBQortxtCcL5fQf+OTPsXID2mBpbe0H2D
 3hW7QPhCWMWTb78Wuj3kmiB9SavfpLMx6KaLlatyQWsRpXdPHOrhtNOH7Zb5XSoCh6EIlbwj3zV
 PwWK+zHOyup2wNcRRX6+aL59hVielK7ckFkn0
X-Google-Smtp-Source: AGHT+IF59mXoQwUbYyzNEWsqJUGWIrmmpdgL7gjo4HS3L19atEqK2QA30uGGF5h+jMHxT43vmOjtYA==
X-Received: by 2002:a05:6a20:939e:b0:21a:e751:e048 with SMTP id
 adf61e73a8af0-24340d7bb9emr5091041637.35.1755875088628; 
 Fri, 22 Aug 2025 08:04:48 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7704000edeasm184983b3a.45.2025.08.22.08.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 08:04:48 -0700 (PDT)
Message-ID: <5d76251c-5f75-4854-8d2d-f37491df40e2@linaro.org>
Date: Fri, 22 Aug 2025 08:04:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] single-binary: compile once semihosting
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <7c026d43-04b4-4615-8478-639393b640c2@linaro.org>
 <e7ea76f9-b66c-4656-b8b6-4d0ff0dfee35@linaro.org>
 <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
In-Reply-To: <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 2025-08-22 07:57, Pierrick Bouvier wrote:
> On 2025-08-22 07:56, Philippe Mathieu-Daudé wrote:
>> On 22/8/25 16:31, Pierrick Bouvier wrote:
>>> On 2025-08-04 11:39, Pierrick Bouvier wrote:
>>>> This series compiles once semihosting files in system mode.
>>>> The most complicated file was semihosting/arm-compat-semi.c, which was
>>>> carefully
>>>> cleaned in easy to understand steps.
>>>>
>>>> v2
>>>> -- 
>>>>
>>>> - use vaddr for syscalls.c/.h
>>>> - static qualifier for console_{in,out}_gf
>>>> - use vaddr for arm-compat-semi.c
>>>> - semihosting/arm-compat-semi: fix cast for common_semi_set_ret
>>>>
>>>> v3
>>>> -- 
>>>>
>>>> - keep common_semi_sys_exit_extended (Peter)
>>>>
>>>> Pierrick Bouvier (12):
>>>>      semihosting/syscalls: compile once in system and per target for user
>>>>        mode
>>>>      semihosting/syscalls: replace uint64_t with vaddr where appropriate
>>>>      semihosting/guestfd: compile once for system/user
>>>>      semihosting/arm-compat-semi: change common_semi_sys_exit_extended
>>>>      target/riscv/common-semi-target: remove sizeof(target_ulong)
>>>>      target/{arm,riscv}/common-semi-target: eradicate target_ulong
>>>>      include/semihosting/common-semi: extract common_semi API
>>>>      semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
>>>>      semihosting/arm-compat-semi: replace target_ulong with uint64_t
>>>>      semihosting/arm-compat-semi: eradicate target_long
>>>>      semihosting/arm-compat-semi: remove dependency on cpu.h
>>>>      semihosting/arm-compat-semi: compile once in system and per target for
>>>>        user mode
>>>>
>>>>     include/semihosting/common-semi.h             |   6 +
>>>>     include/semihosting/guestfd.h                 |   7 --
>>>>     include/semihosting/semihost.h                |   2 +
>>>>     include/semihosting/syscalls.h                |  30 ++---
>>>>     semihosting/arm-compat-semi-stub.c            |  19 +++
>>>>     semihosting/arm-compat-semi.c                 |  65 ++++++++---
>>>>     semihosting/guestfd.c                         |  26 +----
>>>>     semihosting/syscalls.c                        | 109 +++++++++---------
>>>>     ...mon-semi-target.h => common-semi-target.c} |  22 ++--
>>>>     ...mon-semi-target.h => common-semi-target.c} |  27 +++--
>>>>     semihosting/meson.build                       |  18 +--
>>>>     target/arm/meson.build                        |   4 +
>>>>     target/riscv/meson.build                      |   4 +
>>>>     13 files changed, 190 insertions(+), 149 deletions(-)
>>>>     create mode 100644 semihosting/arm-compat-semi-stub.c
>>>>     rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
>>>>     rename target/riscv/{common-semi-target.h => common-semi-target.c}
>>>> (53%)
>>>>
>>>
>>> Ping on this series.
>>> I'll be out next week, but it should be ready to be pulled once the
>>> trunk reopens.
>>
>> Modulo the comment on patch #9, the series is fully reviewed.
>>
> 
> I'll send a v4 with this, thanks.

v4: 
https://lore.kernel.org/qemu-devel/20250822150058.18692-1-pierrick.bouvier@linaro.org/T/#u

