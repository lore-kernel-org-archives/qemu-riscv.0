Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA32C021B8
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 11:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnFin-0007Fb-NC; Wed, 26 Feb 2025 06:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFil-0007Ay-IS
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:36:59 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFij-0003aB-KK
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:36:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2211cd4463cso134363765ad.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2025 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740569816; x=1741174616; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDX8c0Oo8Ne5AvjR5d29zuW0gG34gMmFpo6ET8La5mE=;
 b=W2dChV0EG6Zyj3TykFoxCsChXHK84N6kJM7Qr4Ds9u4ScUp3xbAISaYH3oOLQOihXm
 a2oRwFpRUKU5X/qzvW+dhdjKfLt0mmcH0J1etKq2HZSffW+s+r4Myo+81aXBzvvqISnf
 6yFlIisJ5MlElN6yEhEsGDHSeJQrBm8xzYvJpx2bUEEJPCNMrSJZanAquLCzBG7C+8PS
 oQtwZz+p+ly3Gur4SI8D/bvt48cr9kh01n4bbPfcW7eYpb/yIBenZatYMkCQD+IAn5qc
 /mVeimEFBri4nmrMiJYzqDEEUKCvbtpstxNWXJQTL+RkYMlsZFbWijapF/gU4RAoGlqw
 uGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569816; x=1741174616;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDX8c0Oo8Ne5AvjR5d29zuW0gG34gMmFpo6ET8La5mE=;
 b=SvoTt5FtlOXw0w/DmIIDzv6aS+VaMRkp09SudSST2eHXGFOWuq7YnOmTnNvLhE6tJQ
 sVe69LxNSMNiwQYqzx69Lz/AF+FSGzIdBp0uv/K2fVoNUunx70y0oAKAvbI9zSvBkLMH
 GI8pD9FkKRwbOBRGsEiS1uqPIPeiNy9qYZkLsc+js9WeTMaiu6zQVFqjCfIJEWvmS9N+
 ERmwKjhZZneoTujl5XTdBo127Ne/08WQ0gA/A/bWy2AN9ZXk7XcgeiVRshMxc0kh4ScV
 hKFY3v7GQGLSo0zcGrTlln91s0iykGJeksQ4z8v7zIRRHbJ0ffCwQ1jbD5+6NpsTGy5E
 hBBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW39DN0x50yzXJZzDaKSVo3LpG6kwAqbd+3fSg/dPATOlgB4Ciw7W5WdcthqawjzI31bSDRonA4sYhl@nongnu.org
X-Gm-Message-State: AOJu0YyV09B5UbpEne4rQUGdwqcf87lhn1ASqfsA77PcHO7PB87pMPj5
 rl0dGbTPJXxB3LLVLun332yW0svscb3t8JFTZvt9sJVBm/EBqRGOpbFjGOTmN88=
X-Gm-Gg: ASbGncuzt7K3hhYMzs1tLM0jxbbac8qqWVPLfJAwF699OkmZa/yzv6Y8o4AsyaGL2MQ
 FkmZoKCWKtFg5e4ZdWe1yItTmppUCfaWg3dVbO8xabMz00pvTqRDPeAjJqpxCEgJo44dBAMrWbm
 +uhxFABiEHOf5V6quOkd0EN8ttaiE9ihywtCUA490o0CQQjvw18bgF80YK6hRhtMdLXKqjU+8o7
 fFsY8nYXeAhfO6Gil0ch2tU9qeBJ5W0M546y18ZZCg9S6OBrV1/F3HXHEEZygA0SEd/8O+LNSqX
 FFfmYOFVXIfVEtQG3YEcIIru9Gc04fDsvY+2H0jC+ZfDFJBdzBM900Mpra4lwjWkvosPFhizIEu
 k4s5+
X-Google-Smtp-Source: AGHT+IFDZ4aIS6RbzntCSdHhsXiLV2HReIB9aK7ND13zb8LklgGhHnjyu+BOugbesovk1hJeQ3nS1Q==
X-Received: by 2002:a05:6300:8a0d:b0:1ee:ea8f:2ea4 with SMTP id
 adf61e73a8af0-1f0fc99ca01mr7836171637.38.1740569816283; 
 Wed, 26 Feb 2025 03:36:56 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:8aac:3850:3cde:f614:deb0?
 ([2804:7f0:bcc0:8aac:3850:3cde:f614:deb0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a6fa24fsm3182401b3a.72.2025.02.26.03.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:36:55 -0800 (PST)
Message-ID: <3cc3e11d-6def-4c4b-a0a5-3b3b9da9e107@ventanamicro.com>
Date: Wed, 26 Feb 2025 08:36:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hw/intc/aplic: refine the APLIC realize
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250224025722.3999-1-yongxuan.wang@sifive.com>
 <20250224025722.3999-3-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250224025722.3999-3-yongxuan.wang@sifive.com>
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



On 2/23/25 11:57 PM, Yong-Xuan Wang wrote:
> When the APLIC is emulated in the kernel, the GPIO output lines to CPUs
> can be remove. In this case the APLIC trigger CPU interrupts by KVM APIs.
> 
> This patch also move the code that claim the CPU interrupts to the
> beginning of APLIC realization. This can avoid the unnecessary resource
> allocation before checking failed.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/intc/riscv_aplic.c | 49 +++++++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 0974c6a5db39..e5714267c096 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -893,6 +893,26 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>       RISCVAPLICState *aplic = RISCV_APLIC(dev);
>   
>       if (riscv_use_emulated_aplic(aplic->msimode)) {
> +        /* Create output IRQ lines for non-MSI mode */
> +        if (!aplic->msimode) {
> +            /* Claim the CPU interrupt to be triggered by this APLIC */
> +            for (i = 0; i < aplic->num_harts; i++) {
> +                RISCVCPU *cpu;
> +
> +                cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
> +                if (riscv_cpu_claim_interrupts(cpu,
> +                    (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> +                    error_report("%s already claimed",
> +                                 (aplic->mmode) ? "MEIP" : "SEIP");
> +                    exit(1);
> +                }
> +            }
> +
> +            aplic->external_irqs = g_malloc(sizeof(qemu_irq) *
> +                                            aplic->num_harts);
> +            qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
> +        }
> +
>           aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
>           aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
>           aplic->state = g_new0(uint32_t, aplic->num_irqs);
> @@ -927,23 +947,6 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> -    /* Create output IRQ lines for non-MSI mode */
> -    if (!aplic->msimode) {
> -        aplic->external_irqs = g_malloc(sizeof(qemu_irq) * aplic->num_harts);
> -        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
> -
> -        /* Claim the CPU interrupt to be triggered by this APLIC */
> -        for (i = 0; i < aplic->num_harts; i++) {
> -            RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
> -            if (riscv_cpu_claim_interrupts(cpu,
> -                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> -                error_report("%s already claimed",
> -                             (aplic->mmode) ? "MEIP" : "SEIP");
> -                exit(1);
> -            }
> -        }
> -    }
> -
>       msi_nonbroken = true;
>   }
>   
> @@ -1067,15 +1070,15 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>   
>       if (riscv_use_emulated_aplic(msimode)) {
>           sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> -    }
>   
> -    if (!msimode) {
> -        for (i = 0; i < num_harts; i++) {
> -            CPUState *cpu = cpu_by_arch_id(hartid_base + i);
> +        if (!msimode) {
> +            for (i = 0; i < num_harts; i++) {
> +                CPUState *cpu = cpu_by_arch_id(hartid_base + i);
>   
> -            qdev_connect_gpio_out_named(dev, NULL, i,
> -                                        qdev_get_gpio_in(DEVICE(cpu),
> +                qdev_connect_gpio_out_named(dev, NULL, i,
> +                                            qdev_get_gpio_in(DEVICE(cpu),
>                                               (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
> +            }
>           }
>       }
>   


