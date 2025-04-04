Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B61C36010
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 12:38:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0gIr-0001RQ-8r; Fri, 04 Apr 2025 08:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gIn-0001Na-19
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 08:37:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gIi-0000U5-DK
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 08:37:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso20928865e9.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Apr 2025 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743770254; x=1744375054; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mpn+Mcf9Wk4jyUTuQh/8j/YUnHDY1UQxI8IieAefL8c=;
 b=Y6PAbw2UrvJGcxFa+hDt3x6I8sltJ8NEOdD1jTQJ6oqqM4tnq+SfaJ6SqEyKZEER2e
 X+ZVlcmIAhlAZ70dMe0eK1vagak0R+hdkamryEMuEWepb5cJsMAjFrRTIjiZopmYf4wq
 Qzd6esMEqxjQtx7mmExu/1KcGuBQmspL2hyL4anh9MkxvV9kbG339+5RcU503Dl3e4+Z
 7K3rW5p5XLEAeHqGNIN8/VdXRiDSWJK/7QmOn3rTm8z99prE/7obhZyys/GAMstYmsiM
 O1zutG7mNRAVWcwzyvBkTyMFBHWmnrXGq1k/OoACY+WaORm9PXC2UlD0m7w1zUOQc7HP
 aMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743770254; x=1744375054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mpn+Mcf9Wk4jyUTuQh/8j/YUnHDY1UQxI8IieAefL8c=;
 b=wJ5V1f+9GNJ5crtxFeFPAI6ngCQWiPlrgSTecMcGl/6pWHsp8fEliIjxTbYTX0S+GN
 YZToJUUz6bPpNM+NxmiALL8YnDIYpocjsqozwQ28oI/uC6EJJ2QA9eW8m6LE8LQepyVu
 H/ZxVFJefas8j+Ya66eiaoZg09+QDzAwR927jk+BIBdwlg61dqf7G1bTuaZmkxK9r/OU
 AhtGlLEDgKDUNAxZkYvZ+jj+TkSzv432iKAARt4Skx+vtdRnGktXhePOsn3alWoZLN0b
 NSZ9EqkUw4PwQjxbB8Y/w38ek4uuxYa5kdZan6VUyZIbWHDYrdVXTzXXrO92dFzrgAKv
 eHkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbvRS95R66ssbBjZhGHw2LSV/FouSGZ68fUHk1RQWt2GZXr5P22Tr0nMsrhOTpw6sXUd4v8Q8v56Hv@nongnu.org
X-Gm-Message-State: AOJu0Yz/htti8zP/sRfG2DrSLIslsV043YGFUMNscoKaa8cukF24+8yv
 d+WBPTVq67UtYuSJeM68yPRQ/4zgikLEi89M0RQNQKZRB8YtF4zuNt/c4TT5+wI=
X-Gm-Gg: ASbGncuzQW1pyz/TvjSoOZy+ka2yuC3iVyDXmkLAWHUoiDZjxveAM6enfh4fQDtynTk
 8sr0w3BgxFdaObimV+ImjtI7u0K8KCYYrnQUYq36m77WSWOrhKMHG+yQ6i5e0XvKz9bbiyNB96M
 GWV6xUGqf/e9cauQdjtHNaVNtenMN6SRqZN8d+JEHps3zNwITvzYkLdjAHow6sIsTXwASd+ooQI
 m0A/FnlEJUYLJRJ66jEINch0kYlFWsoL+ozwKPFIZQrhKpzz31to6fw3KCZfOiBzeak+pSJoGap
 NgS+DBCARGBnZwTfiixXaoaGe2OXTFKSmYtqBq0bVVoApnwY8C577tRnWNcGxPD1sWKziCM4Zz5
 Lqx556EJgLi0X
X-Google-Smtp-Source: AGHT+IHaBD9Vm8Ar/MMzO9V+cWg1ihasviumVVtZ6Xv+tkWrpqQVi+T5aH1hgUuXYoXfh9KAiY7/lQ==
X-Received: by 2002:a05:600c:698c:b0:43c:fa0e:471a with SMTP id
 5b1f17b1804b1-43ed6615862mr17926115e9.5.1743770254326; 
 Fri, 04 Apr 2025 05:37:34 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1794e94sm49018925e9.31.2025.04.04.05.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 05:37:33 -0700 (PDT)
Message-ID: <c8df891c-c0bb-4a19-bc13-ef128ed222ae@linaro.org>
Date: Fri, 4 Apr 2025 14:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1] hw/riscv: do not mark any machine as default
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250327130256.653357-1-dbarboza@ventanamicro.com>
 <19d7409d-35a0-486f-a626-9d382fb8a6bf@linaro.org>
 <CAKmqyKPsRvaVztUdPRwf5h90rVdT9MOrvQz_=WvoEj-bWoTWVg@mail.gmail.com>
 <65b3fa18-0f04-4cf8-8d21-ecef180f2fcc@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <65b3fa18-0f04-4cf8-8d21-ecef180f2fcc@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/4/25 13:30, Daniel Henrique Barboza wrote:
> 
> 
> On 4/4/25 2:50 AM, Alistair Francis wrote:
>> On Fri, Mar 28, 2025 at 2:16 AM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 27/3/25 14:02, Daniel Henrique Barboza wrote:
>>>> Commit 5b4beba124 ("RISC-V Spike Machines") added the Spike machine and
>>>> made it default for qemu-system-riscv32/64. It was the first RISC-V
>>>> machine added in QEMU so setting it as default was sensible.
>>>>
>>>> Today we have 7 risc64 and 6 riscv32 machines and having 'spike' as
>>>> default machine is not intuitive. For example, [1] is a bug that was
>>>> opened with the 'virt' board in mind, but given that the user didn't
>>>> pass a '-machine' option, the user was using 'spike' without knowing.
>>>>
>>>> The QEMU archs that defines a default machine usually defines it as the
>>>> most used machine, e.g. PowerPC uses 'pseries' as default. So in theory
>>>> we could change the default to the 'virt' machine, but that would make
>>>> existing command lines that don't specify a machine option to act
>>>> weird: they would silently use 'virt' instead of 'spike'.
>>>>
>>>> Being explicit in the command line is desirable when we have a handful
>>>> of boards available, so remove the default machine setting from RISC-V
>>>> and make it obligatory to specify the board.
>>>>
>>>> After this patch we'll throw an error if no machine is specified:
>>>>
>>>> $ ./build/qemu-system-riscv64 --nographic qemu-system-riscv64: No
>>>> machine specified, and there is no default Use -machine help to list
>>>> supported machines
>>>>
>>>> 'spike' users that aren't specifying their machines in the command line
>>>> will be impacted and will need to add '-M spike' in their scripts.
>>>>
>>>> [1] https://gitlab.com/qemu-project/qemu/-/issues/2467
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>    hw/riscv/spike.c | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>
>>> I'm in favor of this change, which I believe is the correct way to
>>> go, so:
>>
>> Agreed
>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> but I'd rather we follow the deprecation process. Up to the maintainer.
>>
>> I agree, it is a breaking change, it would be nice to go through the
>> deprecation process in case people are expecting Spike to be the
>> default.
> 
> I don't mind going through the deprecation process in this case since we're
> not just eliminating a default value, we're removing it.
> 
> What about other default val related changes, e.g. do we have to go 
> through\
> the deprecation process to change the default CPU of a board? And yeah,
> spoiler alert :D

I think so. My preference to avoid this is to remove default values ;)

