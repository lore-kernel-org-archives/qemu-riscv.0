Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB6CCCF9F0
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vESZ9-0005Pw-3H; Thu, 30 Oct 2025 09:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vESZ7-0005Pc-Fz
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 09:19:45 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vESYt-0004vi-TV
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 09:19:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b6cf07258e8so662827a12.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761830367; x=1762435167; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGIXo2z+J50Wr885gX1BIVtGJ3XASVTcwkNTKz6W7hM=;
 b=LLs5k4OApnDMoKkdJqt2v/Aft4/H+YcrSsnsHwhI1bRzVxvF2raP+kkRxJg5Cj0wz6
 CxPS6NQylE4do63hBW1RWsidrmmFbJWBcq7O/eCuceDFGjwZsUjbth41JpZh/ewKB6MS
 zUV8LbQYVOxdvBXQ1fuMzvVd26rRgi7kgO2xMmdKoxE5I20Ls4JBLu3+i9dBiSCgbju6
 JsJ4lRWr5a/GPE2PqBasNvCEXnCmOwTKSKkEUvJq92A2EUBxxLViI81NI7NBi0iSotpg
 SlndYzyfd+W8J2RF97eF/YNT55jnlboXSAisJ9tAGzS1NR6oYEnZJSTelaHDECpG1BGd
 N2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761830367; x=1762435167;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGIXo2z+J50Wr885gX1BIVtGJ3XASVTcwkNTKz6W7hM=;
 b=qaWDb1HlT2ixnxotPVRYjP1ncPpVnkshzHF/i92NWRRpK3MGUuEA6G6rFNX09uxczu
 cGXdvSVEWj/Oq2ReNghQ9D0jsC36N/mjxFDsrH2kJtzmZD/k6KfqBoUib/9TOi8WzFhp
 JgtclVkfa0UI7HrZz3rEQ6RqtUNL3uhCAlC9AMQhC/DHTvzJ0I9oBRsj2Za3icSBSC0l
 fZ2MgFxw7GG5XZXnzYmp+8Q6kX6rUSl8FWaC32p6L2VyQZvamPw+edctv4TO32CCxdRY
 w3vDgz0Lh3YqLrNRNkL5rOyOu+fAvT47C0s2i6PVJYUdioh1b08cUridLhJo+QKRG453
 GuHQ==
X-Gm-Message-State: AOJu0YzWpg6I8whzaa8HldYsz/B6+1NsKvDGyQ/57VhkZ47fVnJuejAf
 FRKtxtaWABF4xwoscViiBKZTqMthZYf3InmNHLreNaVlW/BPxD8N0srwFVZxm/ErBnT65CBZa81
 skI48OTw=
X-Gm-Gg: ASbGncvcTpBCsK8R1+/2ybRx5wd38qUQp6Qf5vkjcAtceBVWhZZ0qb37yzNJFES37y/
 7zWsDp1Q9C4+eILCu2LvPyP7g/pIWTE+zm5eKM/oTh1QI+HRslYZ+VQtbNHSQXDv9XfuIYcBsbW
 hSsKa3zUrTNRLu7HO7ilhFfQtHC+4SFQG359eVMilRmh0Xwrv6xlnW611VSRV4drIX+LPitsz+q
 0O5yafSV0kz5YJ/3YdFtBaOA1zLxnaZPxX12ndX2nqimjw0s7Box7KyNmYeauVr0gQtVckl0Zza
 1oBss57Gi030jW6cCoquPKB7l6Ah2NDb7uvkzemNZiD8s6tDQ1T65nrOHfhkwalBqTD9GbDsDyW
 IozR53NjXR+CbTdZvYoGdHKVOunPBSbuKw0RIYO9K7ZOUO4U/+VjKtgifQOHdCIbMbMe41wKW5h
 e3J8ryJc+MRL5+2qobjAAugzQ=
X-Google-Smtp-Source: AGHT+IGucJ7QLEoalGTUpsCNeerNW49k4GT55jBtlOyS2D+xKGsDWEcuFFMXhZhUFC/GQdScepW0/w==
X-Received: by 2002:a17:903:2f88:b0:292:dca8:c140 with SMTP id
 d9443c01a7336-294deedd087mr81821135ad.44.1761830367500; 
 Thu, 30 Oct 2025 06:19:27 -0700 (PDT)
Received: from [192.168.68.110] ([187.101.65.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d097fasm186887595ad.29.2025.10.30.06.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:19:26 -0700 (PDT)
Message-ID: <653e5fcc-c404-474d-89d3-e5ff2f622b9d@ventanamicro.com>
Date: Thu, 30 Oct 2025 10:19:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/intc/riscv_aplic: Expand inactive source handling
 for AIA target[i]
To: Nikita Novikov <n.novikov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20251029-n-novikov-aplic_aia_ro-v1-0-39fec74c918a@syntacore.com>
 <20251029-n-novikov-aplic_aia_ro-v1-1-39fec74c918a@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251029-n-novikov-aplic_aia_ro-v1-1-39fec74c918a@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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



On 10/29/25 4:17 AM, Nikita Novikov wrote:
> According to the RISC-V AIA v1.0, section 4.5.2 ("Source configurations"),
> register target[i] shall be read-only zero when interrupt source i is inactive
> in this domain. A source is inactive if it is delegated to a child domain or
> its source mode is INACTIVE.
> 
> The previous implementation only checked SM == INACTIVE. This patch adds
> full compliance:
> - Return zero on read if D == 1 or SM == INACTIVE
> - Ignore writes in both cases
> 
> Fixes: b6f1244678 ("intc/riscv_aplic: Fix target register read when source is inactive")
> Signed-off-by: Nikita Novikov <n.novikov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 28 +++++++++++++++++++++++++---
>   1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index a2041e702245211ba3bcf4334301d7c86272e36f..8c3b16074cd3ca1bc3004cfaaa13f34b8860bd48 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -193,6 +193,26 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
>   #endif
>   }
>   
> +/*
> + * APLIC target[i] must be read-only zero if the source i is inactive
> + * in this domain (delegated or SM == INACTIVE)
> + */
> +static inline bool riscv_aplic_source_active(RISCVAPLICState *aplic,
> +                                             uint32_t irq)
> +{
> +    uint32_t sc, sm;
> +
> +    if ((irq == 0) || (aplic->num_irqs <= irq)) {
> +        return false;
> +    }
> +    sc = aplic->sourcecfg[irq];
> +    if (sc & APLIC_SOURCECFG_D) {
> +        return false;
> +    }
> +    sm = sc & APLIC_SOURCECFG_SM_MASK;
> +    return sm != APLIC_SOURCECFG_SM_INACTIVE;
> +}
> +
>   static bool riscv_aplic_irq_rectified_val(RISCVAPLICState *aplic,
>                                             uint32_t irq)
>   {
> @@ -635,7 +655,7 @@ static void riscv_aplic_request(void *opaque, int irq, int level)
>   
>   static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    uint32_t irq, word, idc, sm;
> +    uint32_t irq, word, idc;
>       RISCVAPLICState *aplic = opaque;
>   
>       /* Reads must be 4 byte words */
> @@ -703,8 +723,7 @@ static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
>       } else if ((APLIC_TARGET_BASE <= addr) &&
>               (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
>           irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> -        sm = aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
> -        if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
> +        if (!riscv_aplic_source_active(aplic, irq)) {
>               return 0;
>           }
>           return aplic->target[irq];
> @@ -841,6 +860,9 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
>       } else if ((APLIC_TARGET_BASE <= addr) &&
>               (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
>           irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> +        if (!riscv_aplic_source_active(aplic, irq)) {
> +            return;
> +        }
>           if (aplic->msimode) {
>               aplic->target[irq] = value;
>           } else {
> 


