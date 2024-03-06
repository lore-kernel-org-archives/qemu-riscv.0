Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD9FC5475B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 12:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhqj2-00046u-F1; Wed, 06 Mar 2024 07:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhqj1-00046m-67
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 07:50:23 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhqiw-0000bP-EH
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 07:50:22 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e5a232fe80so611921b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709729417; x=1710334217; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vN52UaDpk5D7vKtAoIgf9PA/6BlBQMxCYSVnVaLx1dw=;
 b=Zxae4pkOahMQYdnld161ID+XxU73lWgH9NSEGiBHcSj1zIc/4PNsLxBg32GU3rBU6o
 8hxbU962JHUgwtqKcLksLzCR/dV7sT4OFPkVQXYofRgd1auh8Wvs6w3iAE4Y+E/m69vZ
 WSerHBrqibmvNCfn3e1IDefmDT/1J3MfTn0oA2sAtxBiqg2Fk53Jj1xHkdfqpFr20xhJ
 6sh4t56XH5CzboDyWJf1Powra6gPv+XyXr7Iep0tlqBr7b+mYU40Q0ZhJW1bPg1HJIMV
 aec69bLEONU1hMQ5fAJvQN6Yh26X3bwhq+9e9fVxzrn6cTr+1ER1LKGqenoF/KJCedx8
 IRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709729417; x=1710334217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vN52UaDpk5D7vKtAoIgf9PA/6BlBQMxCYSVnVaLx1dw=;
 b=UYIWqzoLEvVJj37Rq7tW4uayWzhBRjLumHrqipQHEoGRdtnj5fhh/YkviDjnikFK9Z
 UzJEmA1jDFi1z84Ntvzbi1UrOziz4gwnw7TeTZh3wn9gcb4QpcEE6u1xnEUcHA2rVQBW
 JZITRplksqq5G60jglSSveu69aK1t6RZh4HfbKCIi3gDxxzpIfG3uyzOK3aVJsygLZTq
 iZH/ofP7VtgovzQHV4/+eInqcPc1d60+YC4nt9reGyTs5jB+0+Y5eZ8vAwCDYu/SS3nB
 e/UqMtMWYnP1wXFhqZ6Gvz72qroSkG3RLXbZEMOoW9MTykQS+o6n17olK1N30ANVmJD2
 4rxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3g+Obd/Q/rygc59y37UPFIX75PPj1fWoPRM3mQdVSp0/zVbXctjnP+1vurK+aR42JhVljF3qqH6wA5756b7Bet2DvJg=
X-Gm-Message-State: AOJu0YwI/dzSc6+ccibhjePXTzXgF+6/vIo7Ta0qVqvOXMW44ffwhZeM
 qkaxxurKMIOF5faah5U4NHDrVVbKjrZeRZG7OmW/wF/BYxhzNp3qQyKH/xJBGRM=
X-Google-Smtp-Source: AGHT+IEQcYg68Qze1b6fmlEwHVOjH6XGTUMEzgnnOuOd0pL+HEDtAB/zaOeGXuvdRuzTLxpjMXiMWA==
X-Received: by 2002:a05:6a00:1821:b0:6e4:908c:613b with SMTP id
 y33-20020a056a00182100b006e4908c613bmr8024469pfa.8.1709729416599; 
 Wed, 06 Mar 2024 04:50:16 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a62e410000000b006e46047fe04sm10706966pfh.204.2024.03.06.04.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 04:50:16 -0800 (PST)
Message-ID: <7c39bea9-c57b-410b-b63a-ea7eb7440ac8@ventanamicro.com>
Date: Wed, 6 Mar 2024 09:50:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/intc/riscv_aplic: Fix setipnum_le write emulation
 for APLIC MSI-mode
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20240306095722.463296-1-apatel@ventanamicro.com>
 <20240306095722.463296-2-apatel@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240306095722.463296-2-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 3/6/24 06:57, Anup Patel wrote:
> The writes to setipnum_le register in APLIC MSI-mode have special
> consideration for level-triggered interrupts as-per section "4.9.2
> Special consideration for level-sensitive interrupt sources" of the
> RISC-V AIA specification.
> 
> Particularly, the below text from the RISC-V specification defines
> the behaviour of writes to setipnum_le for level-triggered interrupts:
> 
> "A second option is for the interrupt service routine to write the
> APLIC’s source identity number for the interrupt to the domain’s
> setipnum register just before exiting. This will cause the interrupt’s
> pending bit to be set to one again if the source is still asserting
> an interrupt, but not if the source is not asserting an interrupt."
> 
> Fix setipnum_le write emulation for APLIC MSI-mode by implementing
> the above behaviour in riscv_aplic_set_pending() function.
> 
> Fixes: e8f79343cfc8 ("hw/intc: Add RISC-V AIA APLIC device emulation")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aplic.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index e98e258deb..775bb96164 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -218,13 +218,25 @@ static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
>       }
>   
>       sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
> -    if ((sm == APLIC_SOURCECFG_SM_INACTIVE) ||
> -        ((!aplic->msimode || (aplic->msimode && !pending)) &&
> -         ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
> -          (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
> +    if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
>           return;
>       }
>   
> +    if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
> +        (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
> +        if (!aplic->msimode || (aplic->msimode && !pending)) {
> +            return;
> +        }
> +        if ((aplic->state[irq] & APLIC_ISTATE_INPUT) &&
> +            (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)) {
> +            return;
> +        }
> +        if (!(aplic->state[irq] & APLIC_ISTATE_INPUT) &&
> +            (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH)) {
> +            return;
> +        }
> +    }
> +
>       riscv_aplic_set_pending_raw(aplic, irq, pending);
>   }
>   

