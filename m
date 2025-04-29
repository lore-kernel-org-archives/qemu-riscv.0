Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F45BC3ABAB
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9ohb-0002iC-NA; Tue, 29 Apr 2025 13:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9ohX-0002W7-Re
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:25:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9ohW-0001sQ-7r
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:24:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-225df540edcso1230765ad.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745947496; x=1746552296; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1+kBGVg8/Bu322LkF5RbSkkvpMox5sc21RbuJPRCTs0=;
 b=SxlocIMDR9gJKv8zUcukeYkOQwxWX4/sh9oPBiu2hdXz+8ITiHkNLJoi5PwWJxUp1c
 Uro7zb2abHhR/VfMEESvNLODuNa8m+/uduNgLlhVY8QkTvuDugfc75ajJohKBqleqlM0
 8F3V2dBLkLh60/X1FdWkhqW73fuklDEnT/EaWP29YG1czwjTToXFsc3+ZlS1hDF0bfIw
 ODn5KqdK0cnDF+jkXsOYBR5/HgHFMU2SAYJ2JuDt3iG4H9jslI2TxeFQlhaSFMJknY4w
 6RUzMySfGWQRZzJ1yApsThvBPQyKBriX8CTbpE2I3fZHG9QpUgznKj5HXD1YIAnWvv4j
 UfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745947496; x=1746552296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+kBGVg8/Bu322LkF5RbSkkvpMox5sc21RbuJPRCTs0=;
 b=Gdeo39/nNhN4RAoOaMXUX4Jj3lIXfU/QGcakehRmBhiMuABPEgT2Y9rDX00JmcmgkA
 gW86VpKNVWXVOT5rGFmGix83imx9vZKsgzwLmawMnqciN0WMXkzyPYZv0K/PypxGCpx7
 Tm53cIq4Sg13lWeF3oQOJFJx9Hw00Pve7gmSkC00zlo+17/GtVz4Ban51MDAYgKuqpKU
 SYA8jDwWAhg6QvBGa9JsWDy9gsmij1ed/edBoh1FdkcQ9ZWcqSza21rBVFSq1djTIBdo
 q+no3IktJjVq1aq/YWqC5XQWyZHloW01NjQkrXiheETkMHAUPOEHyoNszWamo/+7qgN2
 gIwA==
X-Gm-Message-State: AOJu0YxLF8OgU3d4UJkTW4m04rO3O+Y8Cpxn3yqK50yZLRnLbkE4mYX7
 hCphDEwhLrfSYjYbgnklcP+yV8oAcYkYErJSGWquIFOFFgD/DBVokdw1VerVA4w=
X-Gm-Gg: ASbGncvEIpBZHPmPmrl8ugsoLRtZEGIi1ggFMIxu6+F1vAMZUUhyEROR18qGcTg5VwJ
 o7NHCNowxDT6UDzUPh9ZrHJsnzCK3EmAZT6f5L1jp7BOta9YIh4/glnEGEldtNGNRAvRRCdy7tu
 +XUFz7tko9AE9ucyz8XkLKAKaVaHrsnuW3dZ9rnNdu3orySix/LpuCjwqeCKY65bTLCVIUrStMb
 JQuSVUMg3dxCv7BHTDKHeKRaDPn38dUk2GiGMu7Hsm+MuWFMmNRqHyhdMkUSxfibMNF+HByFB2S
 o7jFWYJuh0KIQSqQfQPHzcPEfkmE6AKnUqBUC0P6ec0RDr6eZqLR/i8=
X-Google-Smtp-Source: AGHT+IGvSGGJuw81WUz3DEQEHxBgtJTcZXUmST9PmH2iByRkWibW7alf2tg77dBV+PBS7d3JkeT5eQ==
X-Received: by 2002:a17:902:c40f:b0:22d:c846:3e32 with SMTP id
 d9443c01a7336-22de6c72accmr52575895ad.25.1745947496536; 
 Tue, 29 Apr 2025 10:24:56 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f8597c00sm9257620a12.42.2025.04.29.10.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 10:24:56 -0700 (PDT)
Message-ID: <1a0954c4-335a-4325-8463-ccde480783e9@ventanamicro.com>
Date: Tue, 29 Apr 2025 14:24:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] hw/riscv/virt: Use setprop_sized_cells for pcie
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250429061223.1457166-1-joel@jms.id.au>
 <20250429061223.1457166-14-joel@jms.id.au>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250429061223.1457166-14-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

>   hw/riscv/virt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f8943f81790c..cd19c266e62a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -894,8 +894,8 @@ static void create_fdt_pcie(RISCVVirtState *s,
>       if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
>           qemu_fdt_setprop_cell(ms->fdt, name, "msi-parent", msi_pcie_phandle);
>       }
> -    qemu_fdt_setprop_cells(ms->fdt, name, "reg", 0,
> -        s->memmap[VIRT_PCIE_ECAM].base, 0, s->memmap[VIRT_PCIE_ECAM].size);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg", 2,
> +        s->memmap[VIRT_PCIE_ECAM].base, 2, s->memmap[VIRT_PCIE_ECAM].size);
>       qemu_fdt_setprop_sized_cells(ms->fdt, name, "ranges",
>           1, FDT_PCI_RANGE_IOPORT, 2, 0,
>           2, s->memmap[VIRT_PCIE_PIO].base, 2, s->memmap[VIRT_PCIE_PIO].size,


