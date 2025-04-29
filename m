Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E1AC3ABA9
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 12:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9k2T-0004A8-4c; Tue, 29 Apr 2025 08:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9k2R-00049X-1I
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:26:15 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9k2N-0001WS-GL
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:26:14 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-af548cb1f83so6025579a12.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745929568; x=1746534368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PwHLNqHV1p2YGF0jQBhoTy8nyeKgkUjSl0ezZ7PMGYM=;
 b=n8YPMxDGY0DAtUxH4LQ2IsFX0zXlNdCIr2Dls18Jp+R3/OcFFcn1WR0Rm4xtPT8J84
 Yge8YM99QVVarXXjH7NkZL/+vFatc4OoVL+HreLcwhadLDvyThzIGHEQL5EeRus12p6d
 kfmf6dDDi66/+NKn8yHi9fIJHIPvCHLYI+bWs92WZYTwHrsAA8HKSRosD7cSSVZV6WqW
 dxtzl4xtDrt6p+qYJwmeBo/c0Fy5m+3Tdu2oV9pD0j4Ud9os2FrY0Nxpm01nWeqTqK6Q
 yA+AAchSB7pOJpvGS+bgakdd+omhK/KnFq2eNry+yxDGc/ukeo7gazvEN4yf5Sbo7F/H
 QJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745929568; x=1746534368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PwHLNqHV1p2YGF0jQBhoTy8nyeKgkUjSl0ezZ7PMGYM=;
 b=M3Wm5VBIGgNzgWkXWExOy1l67qXVR4VOFT8SUkl7Z4CQf0WUabBoujXpYHNseQYnPw
 RYgMlx5Q+YlxkwIXo40ikn0c65lNXz6lUxxufx8AMOS8m0bKUQ2tPeN1RRe1xHQTAMvd
 evKlyC0tE0Q8jEUnDwFD/zizv2fdzg4pjBc3zr2VKE6pSCgvzEeF4a43gbqJ64ACCGW9
 WoyHBHWv0TK4uZWYEog3TExBPJxhswwbU5fJrIjmNOd7r2R1cSmmjF90HMq7HrFHBM3q
 qEtsOU72FwXGRf2rI/GennLjePUaWJLXA7lIpo4b9ImTwx8kp0svx1FgmGs9H1xWPjGk
 CLLg==
X-Gm-Message-State: AOJu0Yzu2iY9t275DDzw7BMOm4FUr+5hxsJlgmT9rUmsm31/xyI3cbVH
 USMmkZbVYKktVMGqWNu+sALZRZd/mNMdeOHXOFdrwfdMRFjuZ5NyA1QKomoN6qU=
X-Gm-Gg: ASbGnctK6eGF35udcl5TTQQpkYmQNq6GvlUTW7trPfiwawLtGQB2mDVp5zMbOcpsPd9
 nHNjXctLkEkX2tjHyj4hXJ9JBXIlH3otk2rS2e0+yPIRLoVT9ipylnJT6IGK1iZ2YdheCVOHQF1
 Gbob+LOmEhIiaDZmo3xunTXpt8Na0ptTitNJjWZtdLzV64MaxcXkgP95Iu16yY9OkkkNVXZLNWE
 NvzXPeM6k09/8yFox8AhnAe2uYmIIVMBhzo5Zp55Ib2Orv8IcC8oY1ajfbHzfYOuWuMQjnimkqO
 lGn8zuCPHRynwvTJwDExHA3k267Yh9yFStjb7MBgjCvYpXRmTh1sFIM=
X-Google-Smtp-Source: AGHT+IGFGG6sqBgt5Zssh2d6NOQOAZgcAl7i0cFLDLYooeu+8D66hMTPrFRUjXoPufCP8c8tmIwSjA==
X-Received: by 2002:a17:90a:d607:b0:309:f53c:b0a0 with SMTP id
 98e67ed59e1d1-30a013b16d9mr18851934a91.24.1745929567866; 
 Tue, 29 Apr 2025 05:26:07 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309ef03ca86sm11042095a91.3.2025.04.29.05.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:26:07 -0700 (PDT)
Message-ID: <c93ffa82-8ed6-4a1e-ad1a-9d4fc8940165@ventanamicro.com>
Date: Tue, 29 Apr 2025 09:26:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] riscv/virt: Fix address type in
 create_fdt_socket_clint
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250429061223.1457166-1-joel@jms.id.au>
 <20250429061223.1457166-3-joel@jms.id.au>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250429061223.1457166-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 4/29/25 3:12 AM, Joel Stanley wrote:
> The address is a hardware address, so use hwaddr for consistency with
> the rest of the machine.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

I believe you have 2 patches #1 in this series:

[PATCH 01/13] hw/riscv/virt: Fix clint base address type
[PATCH 01/13] riscv/virt: Fix address type in create_fdt_socket_clint

You probably renamed the commit subject to "hw/riscv/virt" and forgot to remove
the generated patch, since both patches do the same changes.

I believe we can ignore this patch and stick withe the first #1. Thanks,


Daniel



>   hw/riscv/virt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 17a790821484..e4c0ac8a2a9a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -324,7 +324,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>       int cpu;
>       g_autofree char *clint_name = NULL;
>       g_autofree uint32_t *clint_cells = NULL;
> -    unsigned long clint_addr;
> +    hwaddr clint_addr;
>       MachineState *ms = MACHINE(s);
>       static const char * const clint_compat[2] = {
>           "sifive,clint0", "riscv,clint0"
> @@ -340,8 +340,8 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>       }
>   
>       clint_addr = s->memmap[VIRT_CLINT].base +
> -                 (s->memmap[VIRT_CLINT].size * socket);
> -    clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
> +                 s->memmap[VIRT_CLINT].size * socket;
> +    clint_name = g_strdup_printf("/soc/clint@%"HWADDR_PRIx, clint_addr);
>       qemu_fdt_add_subnode(ms->fdt, clint_name);
>       qemu_fdt_setprop_string_array(ms->fdt, clint_name, "compatible",
>                                     (char **)&clint_compat,


