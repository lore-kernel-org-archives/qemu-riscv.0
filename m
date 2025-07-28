Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF45C83F17
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:47:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ugRwO-0007Fj-St; Mon, 28 Jul 2025 13:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ugRwK-0007Bb-SZ
 for qemu-riscv@nongnu.org; Mon, 28 Jul 2025 13:47:09 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ugRwH-0007iy-KX
 for qemu-riscv@nongnu.org; Mon, 28 Jul 2025 13:47:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso53591605ad.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Jul 2025 10:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753724824; x=1754329624; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W24ug8XqRDWTo+EiGO8PyS6AAkHzkN5/Gb9zlRuCjvo=;
 b=jyo5tg6eg9wI3RmgnHSipSdISKIERuCUw1bSeo5Uzj51kQK5WorMzyyRyg9S45FCe4
 It2tGlYB46Js66H6mOu4g7v69ZjR41vDrt2Gqp7RjL3K5zpN+yDISTNFxnVlh1rgc33e
 UlbnnE0130742Elsw6VKYItiH8PhbRKUo8APUaTJVGAW2SGSx7sF+r4iuYjrKZDhVI8j
 L1QRaG8h1ycL5ebU/ybNzkTVPUtHWxFAKOjxw7DV9NgJszx/OiuY+33J5NNhkWBT4P9e
 3QwPs43I8ZFSVbQBZMYIRwYIgQZmD+sDjqIJ0j6JuYwXU8iVyf5CV4X7C25wQsvPwRBk
 Q0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753724824; x=1754329624;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W24ug8XqRDWTo+EiGO8PyS6AAkHzkN5/Gb9zlRuCjvo=;
 b=EHnA7T2nbQq1sF1AnHBH7X0mSnAxkxojYJqiBB8vsWrW9sLw9VJ0iLW1GpR8CESf8D
 1+iTJdLWiP6ZrVKlQECOabF9GhDkApZaF0gMYFur11RZR9oR5/hyscaVHLreeixEqogf
 SO/UQ+cByOCfvHvgvtutsJxMCgKKBGk8nNspzOV3WPEMlK/cqIq6mOsR2gq9FQLmZ+Dc
 1i+iA14MTagdsRbqkin3Xfr/Ao50BmeVuKg0aa3ZNuBstZfqpZZlJCRGqwBS7g7KtU0f
 nTNPWWezBTAsN3C7LX6T8y4c6bD/WaAp/bcLS3M/ZE3wwCT6E8QhHr6Batm1yPg181on
 iX7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD+Py6e9IU9iVkNT5rmAIX8sYvpj+Fn1g7kW0/3vtJRYUCg5z8XZqUzUguDsHmhMnVzIOOXOd9Vd0d@nongnu.org
X-Gm-Message-State: AOJu0Yz0r4EdhRBBYDZfAzszGeEeO/9UGhuR29X32+C+/N5ct/TFilSw
 JyoA300xJuRidaTsEsiUE2nEF7vu3JvbVh94Tk7T21VZz6SJy1yvsgk4NXOUJJUL0EU=
X-Gm-Gg: ASbGncsOMPp5dFNYvAuTn5iDkyi80DmowvuEB2huYFdOcnXB2Q9Oxzw8mAMFFYC+70E
 /rpIUdGfDU61eaCnQmGdtjaP2a7O5FiwM7A0gRaHk3U89Ib/7pXwht1cc2pR8K+/Rh/0dlzwwN6
 SMq2AdGPJWTVIKSbdfnHOs5u2tGaZlz9PqsA2m/DdJeUbYeC13ZyU248k2Nbw4QOwHwuFaGnL31
 mkRdrGDp1OG2h/ToczNCECn1Vd2zRhqpuXOUPoQfK9ZeecOxzRbK5eMxockB7I8PJejP4zFP+Os
 dqix0Y4RHfitqp526INNCkiEuYFVJYvUcVojZU2qFo7Bow6/M/rsKS8FSxWBujmK9QgHJ4lvJIf
 mlQBy5Rg5+ujsBhu9vxLrlmGglqWkXLWA3q8uNQ==
X-Google-Smtp-Source: AGHT+IFPMFNEWL5JzztxKlrMj1GrM19trCrrYw63Tv+To5luleT63vhD1Zm8ijI5yV/CMcKiuTqhOw==
X-Received: by 2002:a17:903:acc:b0:23f:fdeb:416f with SMTP id
 d9443c01a7336-23ffdeb42c7mr94890015ad.35.1753724823759; 
 Mon, 28 Jul 2025 10:47:03 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.118.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f11bsm39532555ad.181.2025.07.28.10.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 10:47:03 -0700 (PDT)
Message-ID: <c8ce625a-2cbc-434b-8368-a64c72781ce8@ventanamicro.com>
Date: Mon, 28 Jul 2025 14:46:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] intc/riscv_aplic: Fix target register read when source
 is inactive
To: Yang Jialong <z_bajeer@yeah.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: yangjialong@rvcore.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20250728055114.252024-1-z_bajeer@yeah.net>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250728055114.252024-1-z_bajeer@yeah.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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



On 7/28/25 2:51 AM, Yang Jialong wrote:
> The RISC-V Advanced interrupt Architecture:
> 4.5.16. Interrupt targets:
> If interrupt source i is inactive in this domain, register target[i] is
> read-only zero.
> 
> Signed-off-by: Yang Jialong <z_bajeer@yeah.net>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> v1 --> v2:
> - Use '&' replace the error '*'.
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 4fa5f7597b..a1d9fa5085 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -628,7 +628,7 @@ static void riscv_aplic_request(void *opaque, int irq, int level)
>   
>   static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    uint32_t irq, word, idc;
> +    uint32_t irq, word, idc, sm;
>       RISCVAPLICState *aplic = opaque;
>   
>       /* Reads must be 4 byte words */
> @@ -696,6 +696,10 @@ static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
>       } else if ((APLIC_TARGET_BASE <= addr) &&
>               (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
>           irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> +        sm = aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
> +        if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
> +            return 0;
> +        }
>           return aplic->target[irq];
>       } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
>               (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {


