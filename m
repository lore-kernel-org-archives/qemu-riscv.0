Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B48FC3ABAB
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9ohK-0001PH-5M; Tue, 29 Apr 2025 13:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9ohG-0001Bb-Bx
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:24:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9ohE-0001o5-Dg
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 13:24:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-736ab1c43c4so6337144b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745947479; x=1746552279; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Crh+IgSfMZBSKpOzDKUPfJU8+2T7jhfSsZUjjPNsQ7w=;
 b=foRKGHyFqYqIGURQNSnctFF3XIrSz90bERFBULv6n6O4h+oMg4ar/jyJHF+PrJ57sM
 aTR1/q2hh3B9ql2ivp6+Glt5dazcLihz8e4eJjs/ZxjMRb1kSMqvfxEMHHYu6SP+qENL
 ZlxqMisQdnhDMjp3lacvlxm1JeJuiVa/I/A8/b+xVbPeE4ttxfW1nKZbKMS6nAPKn0wC
 4RbNlSSGIbaOQVnSYnhI8vUvkv4smkRH6aENuendtC51N/53cxMaF5wDdEJKqStWMuKE
 f/jMZDpRkggwhAfr0HZB5V/duEec0X31O4+KIIDsHJuzO0onFIPeiSsNIVZ8DvVR2Stv
 Tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745947479; x=1746552279;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Crh+IgSfMZBSKpOzDKUPfJU8+2T7jhfSsZUjjPNsQ7w=;
 b=bMl39UdCW3tReoyLu3RYvOnbpvpxYuV3qlpnIypZJmE+oTv9aooFkeN7TTJvbb276C
 RQ4yCEz5IGD+7QpULyglZLMT8nBgw33fP+lROyTzsyPoZ/B7nMuml2S03vNOLbhP/bMC
 tu1wXhO4KyNnYvTJxsr1PsuBJsJzVd6I4jAwVrNKqPUttWFhYFFpkUpaz/mnRkN4+dUn
 sPgJdjDQuqv6U568FTut22DVzInTpnhb5ds/LjVW8w0ml5VCgHx16Yyb58pje1DsU/wb
 rBlVOz4jmvE9y6GhDhSLkUb5bxCk/tw93/sgLbHX4eT+LnyLQsZJkIEJ+7W5ppPWCIvz
 L/kw==
X-Gm-Message-State: AOJu0YxkcJnnRK3TxsL3qCwqbPId42c32dCTZata60yl1sYI893aee/h
 qdR9woF1Nk4PmrY1SeIltTW6DHpkT2iJ+wK4pkd9+M2s7Ucex62Zfqh890pahglQRCxWo+jrmSo
 h
X-Gm-Gg: ASbGncvVNFaK1MsWmtO1ZP9QEEj+4iU16VDgqQR4C1oHSeq1lcbB+s+buhfERgxWurv
 K34xfRFvBN/tQhZ46RZqb2y/9meReQ9PtWm/hOETJG9/BHFd99ni5NefhSMasSPpUxM/JwcgZBl
 yb1et3RFZJanlbAME+N16WyAQmg56NOiP+7e+L6t8Eroau8JF4eXYf7FdGoNapCPYQ6hlKyHPIm
 gz3wcoNXmK8nTbarGwBFlOd5d+ifm3pYubEOZqtEB040UVlv1hyT5J9FvAmtQGcYUnraJk0uZpe
 bY34Nw7Q8r3XMXOgXxtVF8EIhfy8l28JNfEOY2V/gwUBALLTE/aI+EGP/KuUbDhuXA==
X-Google-Smtp-Source: AGHT+IHGULrMDGBJuGIt5MQFa7F1tBWRlRP5rTaOOrwXNbz5CimbnVrqohfWzPXpCO9rSogB6Y28vg==
X-Received: by 2002:a05:6a20:6a26:b0:1fe:61a4:71d8 with SMTP id
 adf61e73a8af0-2046a5a9c34mr19681519637.22.1745947478841; 
 Tue, 29 Apr 2025 10:24:38 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15fa80faa2sm9119559a12.48.2025.04.29.10.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 10:24:38 -0700 (PDT)
Message-ID: <6f8ae57e-98e2-4a1d-9e0d-9cc1ffdbe789@ventanamicro.com>
Date: Tue, 29 Apr 2025 14:24:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] hw/riscv/virt: Use setprop_sized_cells for iommu
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250429061223.1457166-1-joel@jms.id.au>
 <20250429061223.1457166-13-joel@jms.id.au>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250429061223.1457166-13-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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

>   hw/riscv/virt.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 823ef7cbe447..f8943f81790c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1088,8 +1088,7 @@ static void create_fdt_iommu_sys(RISCVVirtState *s, uint32_t irq_chip,
>       qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
>       qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
>   
> -    qemu_fdt_setprop_cells(fdt, iommu_node, "reg",
> -                           addr >> 32, addr, size >> 32, size);
> +    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
>       qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
>   
>       qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",


