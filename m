Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659BC531DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 16:56:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sf0Eo-0001CO-Bx; Fri, 16 Aug 2024 12:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sf0Em-0001BD-UC
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 12:55:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sf0EZ-0005MC-Nq
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 12:55:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-710ece280b6so1805830b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2024 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1723827326; x=1724432126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZ33VjOzMVGqTRhI6JcBPKSAYch3Wl7d+95HVVN1Ghk=;
 b=hZZPt8xaJajOOl+J9hAZISfzOdXytdkrk3mj5RZasC0oF9eWPDVyKApWGa9k2AcCM8
 KkjNnjpULRzy9KH3gvi7ZcJLuruSrB8MvMe9w5xdV9wNMhO6GhqsnWwHyu2Iehtdk4+F
 yz7zdseD9ir3xzQVYqmZrlIl3snVlzVUr51SPLkLi2ZYy8CYmg4tzgTqQ5aK/Zf5D7Hm
 KstgcwHwx4E/dkGwsufaST+CRs9pSN7GZrtmymI4A3+TXc3vz1L3pziWUoRNw+4zAedw
 hl1dPJs5Dw9KpZhjX11bKxdgBPROINumht6MJXNmTwdkajvjRWmZ42JO1MhB1L3pVyQQ
 AKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723827326; x=1724432126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZ33VjOzMVGqTRhI6JcBPKSAYch3Wl7d+95HVVN1Ghk=;
 b=GSWS8vXi5gbdZUcCdXRTjyUiy30aDcO6q28Tzeo/71k+X39zOKdpoUi8F9p6lXIDml
 zuASsZ742D9zO31SA7W5LaKYBw2R2uVYHA/iCfGXBPOT8h8dl3pvqX/+F6LkWMt1TRtP
 YjTeSNhjB1EKteMVY3Wl86MhVJqfn24HiK0M5k0FGiZRhzJ3LQBVdzQPgVfXhzWBz9Cg
 83Yyh7esEgnpWFJR8qfFnERfyD3LAeBP8t7mlKq9i2APDJRfOcLi1p9r/FSMQWrkt+Wf
 8419radSLBcpRjIxunniJfkT76GQVhOrDPBRsRa667niGX1tVofVWDBS/IA+w1mP20uv
 HsWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbFxhW+JpKipOMd3uYTo9BwmPd+7G44SCgiHwFKSxstxlfXZpM9SoUOrOJqJOylW3gb9vfjxmLokT3HAGzucPdhymDKCE=
X-Gm-Message-State: AOJu0Yx8aaFaGBVmbHsGcz0G85a3o4CuZQjo9tXcsRlWKXfwEommReIf
 awC9ZeticDUqfNHWnpUr0ejAa7WbH0VOwXy9Zl41tMEqa0fSFaohSil0EPFZYXc=
X-Google-Smtp-Source: AGHT+IGxU9GQNNCh3MUeDyWu6kBw7pMhr9GkZ2p/sLKBH5goiemAPDfude3YrAKx/Owdu9yl6mXCUA==
X-Received: by 2002:a05:6a00:189d:b0:70d:2455:1743 with SMTP id
 d2e1a72fcca58-713c528b93emr3254747b3a.29.1723827326248; 
 Fri, 16 Aug 2024 09:55:26 -0700 (PDT)
Received: from [192.168.68.110] ([179.133.97.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127add8e41sm2825589b3a.24.2024.08.16.09.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 09:55:25 -0700 (PDT)
Message-ID: <303ea731-cdc3-407c-8283-2ae4d947cf2b@ventanamicro.com>
Date: Fri, 16 Aug 2024 13:55:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.1 1/2] Revert "hw/riscv/virt.c: imsics DT: add
 '#msi-cells'"
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20240816160743.220374-4-ajones@ventanamicro.com>
 <20240816160743.220374-5-ajones@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240816160743.220374-5-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 8/16/24 1:07 PM, Andrew Jones wrote:
> This reverts commit f42cdf2ea5b3a1dc369792d7acbf9cd3e5c90815.
> 
> Linux does not properly handle '#msi-cells=<0>' when searching for
> MSI controllers for PCI devices which results in the devices being
> unable to use MSIs. A patch for Linux has been sent[1] but until it,
> or something like it, is merged and in distro kernels we should stop
> adding the property. It's harmless to stop adding it since the
> absence of the property and a value of zero for the property mean
> the same thing according to the DT binding definition.
> 
> Link: https://lore.kernel.org/all/20240816124957.130017-2-ajones@ventanamicro.com/ # 1
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


This is indeed a 9.1 fix. Thanks Drew for sending it.

We can discuss whether we should wrap this around the 'strict-dt' flag or not, but
that can wait for 9.2.


Thanks,

Daniel


>   hw/riscv/virt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 9981e0f6c9b9..cef41c150aaf 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -552,7 +552,6 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
>                             FDT_IMSIC_INT_CELLS);
>       qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller", NULL, 0);
>       qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller", NULL, 0);
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#msi-cells", 0);
>       qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
>                        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
>       qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,

