Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA6C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:32:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyU31-0001yW-Cp; Thu, 02 Nov 2023 05:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyU2z-0001xW-8c
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:31:29 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyU2x-0003Md-O9
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:31:29 -0400
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-778af1b5b1eso40867185a.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698917486; x=1699522286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iZ69wLqdQU0zShrgzTql7BRgRfY24h8OWduSUJRUe80=;
 b=UAas3eLrPGLNLF+Uiyw1Vt2GqdLsg/KFyrMzgncKoRlx5MSdeOM2SE8KII5/7wQC6s
 Fg5v5b6KHttgFz5UzpfdNhUvNRj/2OEXpogfKD5nZH8DcTfDL/8xqIPchfTCeDRJir95
 NFYUWNckbI52kV+r4ZmmJ+X4QiX6CrvWu00eYtmel3OPPOh6caGQ6EJUWXSsXj0X58id
 6ePE2XX+7/0f0CTzyd729vTl3yFBR3ZSJd5Fn5HKlCdpWABiazinFEu4YvsUQUmvqXmf
 kFs0WSJFOvWd83RyLHFzXQq++NX9N41WxM7FFMccXV93C/MdEiHSCOc/9omapFYKd189
 DfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698917486; x=1699522286;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ69wLqdQU0zShrgzTql7BRgRfY24h8OWduSUJRUe80=;
 b=ODwOwpAW09eoaFp4ymlp31zZLWSNF0WxQkvGaVyo6Zheh2SgbDAZE5v3o56WGS5A0y
 +mzSwhmiPfBov2HNkzorotiy0abV3MrDKn8nBFVWZHNAIzCQmAFNipxGL4E8QXNOpCdC
 URUhF0ZWiCc7bHgj7CUsGF60l/h8jm6E5EsU9Sxxg4d0PYRpQflwk6eYGLkzpMsqKa6B
 dOXTli39jDs/zHKbrtBKrNzcZy8lUMlc8NLWqta3BOYZN2JX2gnYVWzHc2g3NOfdIcBP
 CoI7wHpBqHzXJsgLbzc21U5kl4sf2qOwJwGuJ6ac+QVFMcps6i/ryqTsgisL+ZhZo03O
 T9AQ==
X-Gm-Message-State: AOJu0Yw3d/bVE9tv21vgKObJTLnpQWbBdhTE9+r9N5w16XHcp7D52vDc
 eGXRl03tnEymUY8cE1cbw9ySmQ==
X-Google-Smtp-Source: AGHT+IFD0wsHGig/ClHIyhEuEwbVQJe1u4uC5ZQVDPqbKDedj79C4+2vmpb62TZiPCjkZBdZCvSQUQ==
X-Received: by 2002:a05:6214:2427:b0:66d:4766:5a83 with SMTP id
 gy7-20020a056214242700b0066d47665a83mr21090472qvb.16.1698917486666; 
 Thu, 02 Nov 2023 02:31:26 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a0cc486000000b0065b2167fd63sm2203392qvi.65.2023.11.02.02.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 02:31:26 -0700 (PDT)
Message-ID: <ff7efd3a-f1a1-4c49-a44e-c264103a1a09@ventanamicro.com>
Date: Thu, 2 Nov 2023 06:31:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/ssi: ibex_spi_host: Clear the interrupt even if
 disabled
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bmeng.cn@gmail.com
References: <20231102003424.2003428-1-alistair.francis@wdc.com>
 <20231102003424.2003428-2-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231102003424.2003428-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 11/1/23 21:34, Alistair Francis wrote:
> We currently don't clear the interrupts if they are disabled. This means
> that if an interrupt occurs and the guest disables interrupts the QEMU
> IRQ will remain high.
> 
> This doesn't immediately affect guests, but if the
> guest re-enables interrupts it's possible that we will miss an
> interrupt as it always remains set.
> 
> Let's update the logic to always call qemu_set_irq() even if the
> interrupts are disabled to ensure we set the level low. The level will
> never be high unless interrupts are enabled, so we won't generate
> interrupts when we shouldn't.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/ssi/ibex_spi_host.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 1ee7d88c22..c300ec294d 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -205,9 +205,10 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>           if (err_irq) {
>               s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_ERROR_MASK;
>           }
> -        qemu_set_irq(s->host_err, err_irq);
>       }
>   
> +    qemu_set_irq(s->host_err, err_irq);
> +
>       /* Event IRQ Enabled and Event IRQ Cleared */
>       if (event_en && !status_pending) {
>           if (FIELD_EX32(intr_test_reg, INTR_STATE,  SPI_EVENT)) {
> @@ -229,8 +230,9 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>           if (event_irq) {
>               s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_SPI_EVENT_MASK;
>           }
> -        qemu_set_irq(s->event, event_irq);
>       }
> +
> +    qemu_set_irq(s->event, event_irq);
>   }
>   
>   static void ibex_spi_host_transfer(IbexSPIHostState *s)

