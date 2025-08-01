Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF08CC87FD3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 01:36:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhehX-0005q2-R8; Thu, 31 Jul 2025 21:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uheXp-00080M-Nr
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:26:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uheXn-0006dQ-Vh
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:26:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2403df11a2aso8032735ad.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 18:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754011606; x=1754616406; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vAFLFveFnl9hEIcUUREBOvWx+i0TTO48OUICvMS7lZg=;
 b=RvZGkrZfJh6srUjqkdwMZ2UDFWmt6GcH/9H61EHwqqXMOZRdYmU3d88VvnYrzzyTdp
 fQlDiuSzmRvruMeDuQ5gvPEdzTwQzevXROL1M6gj87qOQn2KXx0TtEwesRWl1o4LZ4UB
 26xDho+sYrYJ3f926zAf67J4nSK1h4nrBLi+xcTVtC46GLOBQ6XgFaVyo1Icp4Daa/eF
 Z4SgtzF8gdwKbg3/gsH4Kjvgs7Seqon1dF8kG9Ri9ktBMVhY/C1X/+gDUzWW/ISRILfF
 0qLA0MzyJFyjo2xCy/grnSEHbIy/JSD8pdRezkHENpDhYyQSE9vnIZXp++tt7SpRXBdw
 UrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754011606; x=1754616406;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vAFLFveFnl9hEIcUUREBOvWx+i0TTO48OUICvMS7lZg=;
 b=ZbISKHARZpAuEAOn0AtnXwXacGRv8NhLh/ALdfiVJzgLV8j+rPCCdsF1HXTeg/xNxO
 1lb3qWbLZ3EZRPhbYIc61h5rzoKXQbUcok8Pwyi9xPX83sqK+pvNyxVj+WK28xmkq3Uw
 6oCpMofVkgElHh4cdumS73tk1ve5fQ2oMVfQsBa7GJSVCpFNfr+SpYCoRxFHipM+KtvG
 iBCejJTae/s5tWjNABkHaPkjZEdnD+O12q8RRW5D0Jw6E3TE4dKG1NR9CKykhDKDq+84
 V3Ihm3t6KxIuJF0dyQVthxmZyuHjBx/m30Oxp9tXsubgGfgLfD+4I2NE20wxwepmCz9x
 alRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ5sxW++reMtajES+MtuMmhbZHJTHL9GCSB7eQx+NvUDLBEyszOnI9kbrYl92BR6JLvOE5zjrEjDvH@nongnu.org
X-Gm-Message-State: AOJu0YwN+7LBzxzwez+SJEzqRYN2BEg9Y9llaJcVEF2gUiwxYs2/QZqE
 AmDHhgssX2+zLmueapaV57iXd0yUImwo+j5W16wVFk0ho6s/uWSn6cS0IiA0WE75tVw=
X-Gm-Gg: ASbGncuEdGv9MWS9jImh1hmaiOWPifc40Yhvu+KdkDsXiX853ynyjAs/alxGZlvSPVB
 Fol+0zod/szSdehnGRq2un6IXCa+gI2YmZ0J4ySacmf12pPAnkfk4C06vkZTQoSOxZ5gK1/eJAB
 JpxV9u8OO44fx0FzLNx8hC4ZMnkuoVldB+5YLFqSGQuCS9yYgRURTsO4BCB5FDTZc6Scrn0F+G2
 PhGO1I/SUZ56N/UrfS+4IPC/0d9vgkI3OrlQp0qHaIo0sl31oF1c+JPa8UW4Ts/QDPZbRjLN0A9
 OeI7yFNxgiSheKAPraTiJEywmKLTvCsC9Eh07H2LNJ5tuVGVOsChIGIqjoXS17JOSVBu8E9RPVW
 qjJwHJ0xrDm/wgbgH5+saPqiOShHFp+eg4vJN9p91
X-Google-Smtp-Source: AGHT+IHk2SQ7+cvK7TCjbeCIpuNRqy0GS5UVCRvnaMUapBpXAhgmMJNtIoVoKFv9lmYP/H4sqBZkKw==
X-Received: by 2002:a17:903:1c5:b0:240:14c:c648 with SMTP id
 d9443c01a7336-2422a699bd0mr11855235ad.25.1754011606047; 
 Thu, 31 Jul 2025 18:26:46 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d21dsm28688075ad.139.2025.07.31.18.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:26:45 -0700 (PDT)
Message-ID: <855c4ee4-e997-42d7-bb2b-95929fd6184e@linaro.org>
Date: Fri, 1 Aug 2025 11:26:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] semihosting/arm-compat-semi: compile once in system
 and per target for user mode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-11-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-11-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> We don't have any target dependency left in system mode, so we can
> compile once.
> 
> User mode depends on qemu.h, which is duplicated between linux and bsd,
> so we can't easily compile it once.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/semihosting/meson.build b/semihosting/meson.build
> index bb0db323937..99f10e2e2bb 100644
> --- a/semihosting/meson.build
> +++ b/semihosting/meson.build
> @@ -12,9 +12,10 @@ system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
>     'stubs-system.c',
>   ))
>   system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
> +  if_true: files('arm-compat-semi.c'),
>     if_false: files('arm-compat-semi-stub.c'))
>   
>   specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
>                   if_true: files('syscalls.c'))
> -specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
> +specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING', 'CONFIG_USER_ONLY'],
>   		if_true: files('arm-compat-semi.c'))

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

