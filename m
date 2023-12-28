Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F750C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 23:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rIzsz-0006yx-8d; Thu, 28 Dec 2023 18:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIzsx-0006yT-N8
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:33:55 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIzsv-00012n-L5
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:33:55 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3bbc7746812so1428692b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 15:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703806432; x=1704411232; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XqdW2jYMosMWBr/zRbtSmLUfAk/mJ9qyLcxKlP+ZplU=;
 b=oHDPg+IxHx65MraDYrGoNh66wznsVqHz8zaIdJoTpmkyIpyYSxvIBBjDGr7mm9rcQn
 0hYEEjnrXfnfbs8W1stiiJk9rRSyNSaTSv1XuSTntYb6V2FVzniPU7LN9nBpVoGjb1Da
 Rfwpx6UemQHD+ypEBt9iPbxyF0Hz6bCkwZmv6PHgIiXVsyKXaZO/dt9/VYhvf+WUwvXs
 s42qlDKL2r8jYJ29YLDChZb3dsKKxOhslrF3oN8IOHiKTPP0sP3cV2lBgqlBkUqOpIim
 zXvwWtZIi9oc7jJcc6YSVAt19+Wx8Nq5+TJe40ZLgWI8pZAYGC37+SbFBOSWi1l+ddz4
 mISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703806432; x=1704411232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XqdW2jYMosMWBr/zRbtSmLUfAk/mJ9qyLcxKlP+ZplU=;
 b=rW7xFn3dmEiGuBDER1/r4U4/T+Y0LtIhcAN8yLkhdOeGMWzh0ShHpfr1ToG2lmQzi5
 DFdSyrueN96Mc+ECzr6N3d3Kxw0xjIftPvykhvImw35lZgEeye1GZtdWj3olgeiSpQVb
 mdOGGOq4e6GuaTNEG2AnVdaQPrEYSfkGkVHdrqYB8U3SbKspauQlmunux1Tb0AURvkJW
 fV0qwug7DCI0fIJhYAndJoGeNCEq6u1lqBjPfDSrvKdVWgB3mMz1ucceq/qSWmwG6GOV
 4MFcljpWNgnwxVlkB2CZC5eWllNQTu5596jyeQ2rOaM3ky9qBzVH1E8jWjAvip0wS0un
 Ot0Q==
X-Gm-Message-State: AOJu0Yy2am1gx+6bT24t91cTbHNtYIUmMlIMsPd/cCZAP2erwo7GeZNq
 Q6piq9ZqY/FQ4PCgVrvuIlRwa8IoojDFWQ==
X-Google-Smtp-Source: AGHT+IFNgPp1e4EyZEuStzvgU676fjg9bEHnnsnwFIlcvtE565e0WCboTTP46wPVSy8wjWb8brq2YA==
X-Received: by 2002:a05:6808:228a:b0:3bb:b9d1:aabe with SMTP id
 bo10-20020a056808228a00b003bbb9d1aabemr6243421oib.4.1703806432115; 
 Thu, 28 Dec 2023 15:33:52 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:324d:cbc2:5f8b:3a9d?
 ([2001:8003:c020:6900:324d:cbc2:5f8b:3a9d])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a056a0000db00b006d9bf71461asm7105954pfj.86.2023.12.28.15.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Dec 2023 15:33:51 -0800 (PST)
Message-ID: <10c1404a-dff6-4f1e-95f6-9273d4e53c75@linaro.org>
Date: Fri, 29 Dec 2023 10:33:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] target/riscv: Add pointer masking tb flags
Content-Language: en-US
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20231224044812.2072140-1-me@deliversmonkey.space>
 <20231224044812.2072140-5-me@deliversmonkey.space>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231224044812.2072140-5-me@deliversmonkey.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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

On 12/24/23 15:48, Alexey Baturo wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/cpu.h        | 15 +++++++++------
>   target/riscv/cpu_helper.c |  3 +++
>   target/riscv/translate.c  |  5 +++++
>   3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c607a94bba..038b86db4b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -538,14 +538,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
>   FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
>   /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
>   FIELD(TB_FLAGS, XL, 16, 2)
> -FIELD(TB_FLAGS, VTA, 18, 1)
> -FIELD(TB_FLAGS, VMA, 19, 1)
> +/* If pointer masking should be applied and address sign extended */
> +FIELD(TB_FLAGS, PM_PMM, 18, 2)
> +FIELD(TB_FLAGS, PM_SIGNEXTEND, 20, 1)
> +FIELD(TB_FLAGS, VTA, 21, 1)
> +FIELD(TB_FLAGS, VMA, 22, 1)
>   /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 20, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 23, 1)
>   /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> -FIELD(TB_FLAGS, PRIV, 22, 2)
> -FIELD(TB_FLAGS, AXL, 24, 2)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 24, 1)
> +FIELD(TB_FLAGS, PRIV, 25, 2)
> +FIELD(TB_FLAGS, AXL, 27, 2)

Any particular reason to add these in the middle?

Something to consider as a somewhat unrelated cleanup would be to add an eighth MMUIdx for 
MMUIdx_M + no translation.  This would be used both for MBARE and internally within 
get_physical_address for accessing PTEs.  See also the ptw_translate cleanups in 
target/i386 for atomic PTE updates (4a1e9d4d11cd).

At which point PM_SIGNEXTEND can be replaced by a test vs mmu_idx, saving a bit in tb_flags.

Something for later, anyway.


r~

