Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A112C021BF
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 11:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnFhy-0006l4-KH; Wed, 26 Feb 2025 06:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFhw-0006kS-1j
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:36:08 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnFhq-0003Wv-Gz
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2025 06:36:07 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-220f4dd756eso141370305ad.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2025 03:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740569761; x=1741174561; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2MubOhANbXa6uZuLvkBxKL10EQPxXfrs+dkjDMImQ0=;
 b=NSwA7WR34iO4v+HZxLsSDB4WouFrYOKuS1zAMyGet8Flrlu77gE11fy06J3HOZeTml
 LWT4XgL70vORu3RnX4yaONYNsszYcDBi5KL2xo8FNYYjgqEPs9DU34T2HshMhr2gWDK7
 phfRbngw/QIOAow40G53FJRnKT1IOKg/DD622HVMYqRmdEWVru4k9S6pJ1tje9cDM6NA
 GKRpQghkC+M16bzb2C825FfQ2p6dSTj3YBraBXDifLm9pEky3OgcsTiAWk/dZ2sOmgK/
 Cw8jMQVQOiwjTfNCw/Lri9Mms3VWw2uqghXtaon4RnxKyMiI6RMCj8KCg5tfpLGdttJP
 VzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569761; x=1741174561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2MubOhANbXa6uZuLvkBxKL10EQPxXfrs+dkjDMImQ0=;
 b=YDt+YZ0VjyMUh9434wR3zr+pjyAWVLNmKRQoIPqk/G1dDZaeAYOuiGWdzxllsmpVR4
 yazbJ9g6MCNIDn2SMkC36Pfc29EnpW2T90y5CGAGQFtuqEmBBJfkncPv5Pi2aPFzQCBN
 ZGg0jB2AYyUub1cuuW60kgkWP8V1tLuL+z4ZG/jDlX745/5zfVtxUlHfwZAof/TsB1eF
 A2dHO41ecK+P4QM77IEqgzJF8Ex80QDzztzdVaf6ge8JWYLWWqgCna5Pd32vO1JfH9lz
 vbRJq4utYBTFGAG5Cqbui7SjJHPHxu1bkBHZypQwZBWrM4hHAZsozUNl1iklZpqcqRC3
 RIGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlX2ZVM5zhYMQ5NFAxYvPUx9KfOOvUhKdQ0kQ90t1rj2fTW+xtnf/Wxwbtk3XqEcLxrJRXFgWU1CCR@nongnu.org
X-Gm-Message-State: AOJu0YzmaB7XY1+9kijNELhPmoCmgOtCzKyOrv++V3x8unACdONLjB0u
 qJ2ZoBI+RRyRYu5PIq/tGPKHiPbdEGUCtuOtSh5eTGl5U2OuimSxj5NiYg14ltY=
X-Gm-Gg: ASbGncvW0TPv7iWTB9PvvtzKY5vbVGMiqynTrtbC2UgJmcu1iU7lsinop3phNsWMqYt
 8lFVCymP8dBe/x4ZDBBnzrAmJksZiRT3JOUoH35ghykH7O3TeGhYwvWDy1PUoFE+U1yrORYlC/t
 u63+H48ZqpKCb1tbXmiRR75Zb5lWY73m8NOUuNPAxV+xQN28qGJoHNGRIgLgKOlzMWhlpeNESzY
 AmQDFQfMub88x97IU/xBIge0QrI/J2LnDRZInqy8zZA4+QvtGFYxG0wkaKaR9AO675XmmaqG2kK
 3JDFT12fzsyH7LAfTmnXSUSNT0ksBaIm+C13h4WUomuTNVy1rnlQ23ER2//bl9liWc7H7L+Kpnb
 vzTei
X-Google-Smtp-Source: AGHT+IG1rGwfGr6t8stP7wq/c4j/04pRegpw5iJKxj1vWg0+87G2/WJ7LvRZX+NVbl1PQj7bKcY33g==
X-Received: by 2002:a17:902:e543:b0:21f:515:d61 with SMTP id
 d9443c01a7336-22307b52f48mr106307795ad.21.1740569760835; 
 Wed, 26 Feb 2025 03:36:00 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:8aac:3850:3cde:f614:deb0?
 ([2804:7f0:bcc0:8aac:3850:3cde:f614:deb0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0aec38sm29346325ad.233.2025.02.26.03.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:36:00 -0800 (PST)
Message-ID: <58c4d7e5-a4a3-4a4d-b5d9-57fdbedd97f0@ventanamicro.com>
Date: Wed, 26 Feb 2025 08:35:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/intc/imsic: refine the IMSIC realize
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250224025722.3999-1-yongxuan.wang@sifive.com>
 <20250224025722.3999-2-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250224025722.3999-2-yongxuan.wang@sifive.com>
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
> When the IMSIC is emulated in the kernel, the GPIO output lines to CPUs
> and aia_ireg_rmw_fn setting can be remove. In this case the IMSIC
> trigger CPU interrupts by KVM APIs, and the RMW of IREG is handled in
> kernel.
> 
> This patch also move the code that claim the CPU interrupts to the
> beginning of IMSIC realization. This can avoid the unnecessary resource
> allocation before checking failed.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_imsic.c | 47 ++++++++++++++++++++++++-------------------
>   1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index dc8162c0a7c9..241b12fef09f 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -349,7 +349,19 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>       CPUState *cpu = cpu_by_arch_id(imsic->hartid);
>       CPURISCVState *env = cpu ? cpu_env(cpu) : NULL;
>   
> +    /* Claim the CPU interrupt to be triggered by this IMSIC */
> +    if (riscv_cpu_claim_interrupts(rcpu,
> +            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> +        error_setg(errp, "%s already claimed",
> +                   (imsic->mmode) ? "MEIP" : "SEIP");
> +        return;
> +    }
> +
>       if (!kvm_irqchip_in_kernel()) {
> +        /* Create output IRQ lines */
> +        imsic->external_irqs = g_malloc(sizeof(qemu_irq) * imsic->num_pages);
> +        qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
> +
>           imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
>           imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
>           imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
> @@ -361,18 +373,6 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>                             IMSIC_MMIO_SIZE(imsic->num_pages));
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
>   
> -    /* Claim the CPU interrupt to be triggered by this IMSIC */
> -    if (riscv_cpu_claim_interrupts(rcpu,
> -            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> -        error_setg(errp, "%s already claimed",
> -                   (imsic->mmode) ? "MEIP" : "SEIP");
> -        return;
> -    }
> -
> -    /* Create output IRQ lines */
> -    imsic->external_irqs = g_malloc(sizeof(qemu_irq) * imsic->num_pages);
> -    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
> -
>       /* Force select AIA feature and setup CSR read-modify-write callback */
>       if (env) {
>           if (!imsic->mmode) {
> @@ -381,8 +381,11 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>           } else {
>               rcpu->cfg.ext_smaia = true;
>           }
> -        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
> -                                      riscv_imsic_rmw, imsic);
> +
> +        if (!kvm_irqchip_in_kernel()) {
> +            riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
> +                                          riscv_imsic_rmw, imsic);
> +        }
>       }
>   
>       msi_nonbroken = true;
> @@ -464,15 +467,17 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>   
> -    for (i = 0; i < num_pages; i++) {
> -        if (!i) {
> -            qdev_connect_gpio_out_named(dev, NULL, i,
> -                                        qdev_get_gpio_in(DEVICE(cpu),
> +    if (!kvm_irqchip_in_kernel()) {
> +        for (i = 0; i < num_pages; i++) {
> +            if (!i) {
> +                qdev_connect_gpio_out_named(dev, NULL, i,
> +                                            qdev_get_gpio_in(DEVICE(cpu),
>                                               (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
> -        } else {
> -            qdev_connect_gpio_out_named(dev, NULL, i,
> -                                        qdev_get_gpio_in(DEVICE(cpu),
> +            } else {
> +                qdev_connect_gpio_out_named(dev, NULL, i,
> +                                            qdev_get_gpio_in(DEVICE(cpu),
>                                               IRQ_LOCAL_MAX + i - 1));
> +            }
>           }
>       }
>   


