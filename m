Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F55C87FD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 16:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukPdc-0000vY-Pn; Fri, 08 Aug 2025 12:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPdV-0000sI-HQ
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:08:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPdT-0008Vt-Or
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:08:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so1122533f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754669281; x=1755274081; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2UmMFBDfKJsvqp9hiPE1ZCZpOSiKT0wAMQRCT46+kmQ=;
 b=FFaQCp44V8cT1BQB8RlfuMgian1oOjP3f37NQkQbJyyXCZlu5IE2dcXTtDjKjryFfY
 1FyD6VPT8JIkXYzF91QvjjCBlISvYYHgwaNbad0FrfDaJ1GEra1d0pR2yr9Qw+OUVcnp
 tdV2677zBTOfQt5rCErHWNJmDXY6L153aLTz88CpAasd0UAzNXcvdxO5YxzG4BYxt8tU
 WYCHrSOGFCj+FLX9EFZqDBYrxUXm8ticPapMgf4ZT1lDjw2Dr024NLS/lBSUoAgMtt29
 yQ/JCcHtEczDZKHvOMn4lKKNiv1vNOxBBxxfGo6IwQg+340bbuRH0we4/8uj1aGvNF0J
 15jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754669281; x=1755274081;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UmMFBDfKJsvqp9hiPE1ZCZpOSiKT0wAMQRCT46+kmQ=;
 b=fmHJ5/V1W2rSoWob69YAGc5e70ipm7UZoR8eD/32tzKotGwDKivtCAiwL7QXbO8f83
 enHVzVe1+/qoslU2Mtri+XPACwBUYicj3aP9qFUYyyza5xcnE1xElpyl3JM2XIyPZ8AS
 8avx+7kJeKpZluZncB677HxPCsjYV1JUTwg/ehyq6NEugqghMW3DcAzjCCiB/FeK0Km5
 rvazmZ/ZSgz8rYwR0ngudY93UjmfGmTRqb6oulfYYM3ECiXjFP3VR9lXE7Knrp8xASjb
 HG+iAQX8Mmmta37UL7wQ5bninVN7rj2AdGJtFyRhbLJMYZGGza/CnkUn729CBGA9WGG6
 Qh/Q==
X-Gm-Message-State: AOJu0YzbTEpPWuQtp5KKTvPyP5nVkioZ55rLcwCXoVyc5UOfLJZXRXh3
 oa6ILBjcNMB8O0wyP3SMqoVS2gjpk9iiXPioSHlmJBDfakudugbnAsmkyxRCnVJehEU=
X-Gm-Gg: ASbGncu7KgGnl3+HqGqhZedyTiPwG3KSDt/efrFOaBLub62ato3JBcmKWWSL+ytTBVs
 xAp10fmuE4Wr6P+ARQ6vaygKc52yy+VjKHlmUeJ0a6bRIgM7tcHHHIWf/kChvqpEevuT+88LRay
 d8tDSe3NVYSZ1psz+Kxf57GWTDGMQN3TegTnVDry5SLtPG+slDCSc98DTgh+gb7GDz+YlErnXrJ
 f5X0ieS5vLvtveqy8vIGB0CsaJSEWwNnaj/y8Kuo0j1zjfi5HCN6XiYm1vtcNmC37q7w68fK9Xj
 QOuFk0x32FSsY+E9hzrQXIoYHNV2KyycqKe8G+1LoG1KEqGeaN9yMUF9wIBAcb60DPmb59obv8U
 8LYd02+U47/JO17n111Ur6LCUBqVx1s1Qx0DFgtu/RzClIBkq/Q3JasbIHdnVtOoOyw==
X-Google-Smtp-Source: AGHT+IFIiTSNOvYDxK3HFyvNSfBZE3peRraLmP+wlq8P/jPHHpJNAdFtogaR9uH8TWOaJm0FGdF6pw==
X-Received: by 2002:a05:6000:3108:b0:3a3:7ba5:93a5 with SMTP id
 ffacd0b85a97d-3b900b37bddmr3146456f8f.26.1754669280923; 
 Fri, 08 Aug 2025 09:08:00 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45923c34af8sm242737735e9.24.2025.08.08.09.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:08:00 -0700 (PDT)
Message-ID: <1cf4f7e5-c9d2-49fd-98db-fd8d05fd241f@linaro.org>
Date: Fri, 8 Aug 2025 18:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/14] hw/misc: Add RISC-V CMGCR device implementation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-9-djordje.todorovic@htecgroup.com>
 <a9874cc7-e18e-4b6c-aaac-2c6ce56c1bf7@linaro.org>
Content-Language: en-US
In-Reply-To: <a9874cc7-e18e-4b6c-aaac-2c6ce56c1bf7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 8/8/25 18:00, Philippe Mathieu-Daudé wrote:
> On 17/7/25 11:38, Djordje Todorovic wrote:
>> Add RISC-V implementation of the Coherent Manager Global Control
>> Register (CMGCR) device. It is based on the existing MIPS CMGCR
>> implementation but adapted for RISC-V systems.
>>
>> The CMGCR device provides global system control for multi-core
>> configurations in RISC-V systems.
>>
>> This is needed for the MIPS BOSTON AIA board.
>>
>> Signed-off-by: Chao-ying Fu <cfu@mips.com>
>> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>> ---
>>   hw/misc/Kconfig               |  10 ++
>>   hw/misc/meson.build           |   2 +
>>   hw/misc/riscv_cmgcr.c         | 234 ++++++++++++++++++++++++++++++++++
>>   include/hw/misc/riscv_cmgcr.h |  49 +++++++
>>   4 files changed, 295 insertions(+)
>>   create mode 100644 hw/misc/riscv_cmgcr.c
>>   create mode 100644 include/hw/misc/riscv_cmgcr.h
> 
> 
>> +static void riscv_gcr_realize(DeviceState *dev, Error **errp)
>> +{
>> +    RISCVGCRState *s = RISCV_GCR(dev);
> 
> Please report an error for invalid num_vps values (0 or >MAX).

Per the next patch:

   #define VPS_MAX 64

Is it possible to have a config with 7, 24 or 35 vps?

> 
>> +
>> +    /* Create local set of registers for each VP */
>> +    s->vps = g_new(RISCVGCRVPState, s->num_vps);
>> +}


