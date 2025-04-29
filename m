Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2FFC3ABAC
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9oh8-0000O9-92; Tue, 29 Apr 2025 13:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9oh5-0000AV-BW
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:24:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9oh1-0001k8-TI
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:24:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22435603572so72299345ad.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745947466; x=1746552266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P06xuHvGSJLkc71HiUE9jTxxAf7SFPP8chppX7+wB4o=;
 b=Wkkg1p2KMxVRammqJBDSbMUdhKA4YS56PA/LFcSSn2MNO9fuhCgraQ5qtvy1zUYCfT
 qkNJ03dRlNFFyuG2MwefQG9KSjogEIztkUYDlDzODEUqVEbvsr6Y9ySQJAWVS8o4HW/0
 0cuep4sMkB5hQ8m4ANw95kMCdZyXMhTApxX7nrZHMgFu4d6ykc9qDDRu1kgnY5EaYiWm
 adL8n5JfroDb6aRiO0IdeTjyVDGTeYRPoCB0EtagCiFZjcHszFkn4nYRnorK8U5ybL7R
 4RsYVPjM0OIKhj5OTSyTHM1B4ewdkm4k1QE3Owh+mNheGRoUfnnbZ//sD26ThtqFmE2O
 3a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745947466; x=1746552266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P06xuHvGSJLkc71HiUE9jTxxAf7SFPP8chppX7+wB4o=;
 b=lDBcr+04oWtWjbdDs4Jvy5wN7k4U7HKt1aNHYr14uVlsdRkLwwSvXner1lSf1CdXut
 u/7+evdg8OO7HdX5aMDjovn6WHphQdKYiNwAoI4hTpbeOeTWhCf18LqW3RJEobKk+7Fs
 VxUpYVuka7FGmP/J1FTX9y44bXgRUe5aKtq9tnc7grb0DWjtCUWmAY//FDuyr2WhLaZX
 QcwyR78bvkT4PLGCDpuU+eKO+Cco2Ia47y23VGYt/UU9AfXKaCCv2sBzEQ39QQGhlcTZ
 0+QQk4Z4zyQsGvOpEs1GNVlxG4lgBTm8NcHN/A6UuQyFbttAOi4SGvqQU3RG78C7KmAr
 H3Xg==
X-Gm-Message-State: AOJu0YzSCa/S1umHd+R5wXtv0m+ftslwKROPdsMWQGXMwJcH2WczWa+8
 WPfkI4dLeexmBvWAY2XaxXeBA+gs2f05/nD3DfkhjlsfwhOG3jxVp7BifP3ptUQ=
X-Gm-Gg: ASbGncubMXWakoaWCgDrjHJHF0u1kS+plYZMIMkGHghVW/UeE/POMd9Rl4T/zy5A76W
 i/1JdUyCo0w/bMhufLImbrqkHxkWsnJrCBRttk/PfMWAWoWGKCxpuThRCIHVNS1rMunk+MUF4OM
 eWUM9gUKa4UynbqQ4zSb5f0qfVmQ9/dkfbeL0ChQfJgF1/LoeUMApPee4UqFO/KVrpiwcniqO3S
 2AGyfroUKWdzWT5YOyFXJcWXHfr1JXUDs7AbOfhZQW1Yzit91e/uTLDUQnSAGzFrTVNq+oGBtl0
 QAs6NcTHJNCius3ROoMUjf7BiokoCAi5LHcDHJ6Iw9t/mNP/hcnplhs=
X-Google-Smtp-Source: AGHT+IFdkaalzIxqRNPunjMM+lY/U1J8tQxD6Sar+WG6oT9Ervkg8DLW4yFwUSAhqcpfdaLrWUUHGg==
X-Received: by 2002:a17:903:40c5:b0:21f:988d:5758 with SMTP id
 d9443c01a7336-22df356f7b7mr2721635ad.35.1745947465760; 
 Tue, 29 Apr 2025 10:24:25 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4dbcb26sm105426675ad.68.2025.04.29.10.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 10:24:25 -0700 (PDT)
Message-ID: <1c026dcf-5cd1-47c9-96c8-5c46758fb580@ventanamicro.com>
Date: Tue, 29 Apr 2025 14:24:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] hw/riscv/virt: Use setprop_sized_cells for rtc
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250429061223.1457166-1-joel@jms.id.au>
 <20250429061223.1457166-12-joel@jms.id.au>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250429061223.1457166-12-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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



On 4/29/25 3:12 AM, Joel Stanley wrote:
> The current device tree property uses two cells for the address (and for
> the size), but assumes the they are less than 32 bits by hard coding the
> high cell to zero.
> 
> Use qemu_fdt_setprop_sized_cells to do the job of splitting the upper
> and lower 32 bits across cells.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d9303c9bb033..823ef7cbe447 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -992,8 +992,9 @@ static void create_fdt_rtc(RISCVVirtState *s,
>       qemu_fdt_add_subnode(ms->fdt, name);
>       qemu_fdt_setprop_string(ms->fdt, name, "compatible",
>           "google,goldfish-rtc");
> -    qemu_fdt_setprop_cells(ms->fdt, name, "reg",
> -        0x0, s->memmap[VIRT_RTC].base, 0x0, s->memmap[VIRT_RTC].size);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
> +                                 2, s->memmap[VIRT_RTC].base,
> +                                 2, s->memmap[VIRT_RTC].size);
>       qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent",
>           irq_mmio_phandle);
>       if (s->aia_type == VIRT_AIA_TYPE_NONE) {


