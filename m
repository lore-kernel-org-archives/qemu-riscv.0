Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6C7C282C5
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 09:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tp1ka-0000bE-OJ; Mon, 03 Mar 2025 04:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tp1kX-0000ab-Pe
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 04:06:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tp1kV-0003zr-RA
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 04:06:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22349dc31bcso71271825ad.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Mar 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740992765; x=1741597565; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hcPiAQzFxXv4DupwJqAsuQhM6RsdGjMAZXwk/2lMBvc=;
 b=HdjDo2kTfiH3QdMMO9SHb7MB9M3GkBySJUqlc0KUNcTgkeuYZDyFgDNfXzgGmm0k4g
 yK1WIqJITqDI05fyr9XsTmFd0w8rgfhrOdhrXegRqpx6YIUaoNDZQNVYUy00ujS6FmyD
 W/o6r2t5tuf9PjD2IS79ATPcv6p/g1hKeor2EYj2xkhkFetJVIli/rGpPZwmC6YGHkMw
 I+TW0Vq4bdVN3BjVlOTtnV9wQqfeY3WUIEnAQKxwk8ux3wfNIk/Uyp/6S8EXCIJaeA0o
 qvKNzYFiHSQL1pUymSmzDxVrwyubSZQDimc+ksvo0C5Ad0yQCQDTGqc0T3d7fExtpZrm
 bjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740992765; x=1741597565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hcPiAQzFxXv4DupwJqAsuQhM6RsdGjMAZXwk/2lMBvc=;
 b=SpYnyfVQH5P6YbC3IB8xyUzpwprKq9yZPjuyMVA1+EiBcb7OZ8W7G9c/dumD9t5/ky
 Y9RYya1q4y8G6oFUPaw9nJWWGSjXQUvcFOmygXuKcF2LIP+49PwtniRLK5mTjVC62TBq
 miPiXzvTxAecb1GHz9eQEvSYpdFJbOgKnT6OkHn1bw4I/mv4qoTN/OxfrTrIWDtHHeFS
 EybEwG+jxLTv+AUP+zgPiRmL0KwomUK+pVhMUf6LHBlmm9nqMYypQZKm/JY30fk3PO9e
 sO7EooyRC+v6Vcwgf+jSvLcQIdFkQ1JhpPU6kO2XwXimsQie8M6eOO8MyvkhezNDu1Cu
 vN/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs9Z73SyTi6HZ6Qaj/oZqnaeCDFKMB4J+PqpbzX09XcznQIJ4Ja+fUS9TcWpf03OKY1P1x/ezhVBS1@nongnu.org
X-Gm-Message-State: AOJu0Yww86mZIGa7IPtY6+1gCwQDWo08y7ds5lUiGI1jfh4C9fkhn5z1
 +3UfTqpQL4ctWkrtWVn4HXoNXD9iSuTviXOJC5seyYWFsVY+XIUgqDrMTunOb1ErgVQEM0+Kwdr
 P
X-Gm-Gg: ASbGnctgyLO8PFlG9hbWi6py65oebuASoQUPFIhbUZ96ImVIln1CX4gw42MO5sH7l45
 zLHPr7fKtEoNv21VdsYGDVi7P/ZvCC7TRlghxpTTaCTSDIbk2AU90QLrPudslxHnJu6olsWoZhO
 S+n4nYMh+kFA/Le6U2akkASecTdlssA2KBhZApgX+s+ppfa/U/hz45CghcaUsshe3G1hs6HarVk
 mFTO+SxWd/uQ/EPWJ10dvJZd4EQbYtgyxWVF6UxFMXggBtRPFijNMdfOTSPQCYrACZNey1jrARe
 NbhKij35HWnV8DMAlvlcyj0w8JMSYzTX/3ce6qfjXR0DfZu4Dj3QwcXw/Ub3
X-Google-Smtp-Source: AGHT+IEF77+vspI+aMaXXUnpm2YngwGA5mFvkOMBXHHQLYVQrOfEH7vjMCygk5EwCuY6mh+J34XYnQ==
X-Received: by 2002:a17:902:f693:b0:216:31c2:3db8 with SMTP id
 d9443c01a7336-22369213455mr208301345ad.37.1740992765480; 
 Mon, 03 Mar 2025 01:06:05 -0800 (PST)
Received: from [192.168.68.110] ([177.170.227.219])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fb004sm73133895ad.64.2025.03.03.01.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 01:06:05 -0800 (PST)
Message-ID: <e92eb3e5-05f2-4c10-83fd-f5e6a9dc1628@ventanamicro.com>
Date: Mon, 3 Mar 2025 06:06:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char: sifive_uart: Free fifo on unrealize
To: Alistair Francis <alistair23@gmail.com>, palmer@dabbelt.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 philmd@linaro.org, chigot@adacore.com
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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



On 3/2/25 11:31 PM, Alistair Francis wrote:
> We previously allocate the fifo on reset and never free it, which means
> we are leaking memory.
> 
> Instead let's allocate on realize and free on unrealize.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/char/sifive_uart.c | 44 +++++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 4bc5767284..b45e6c098c 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -251,6 +251,23 @@ static int sifive_uart_be_change(void *opaque)
>       return 0;
>   }
>   
> +static void sifive_uart_reset_enter(Object *obj, ResetType type)
> +{
> +    SiFiveUARTState *s = SIFIVE_UART(obj);
> +
> +    s->txfifo = 0;
> +    s->ie = 0;
> +    s->ip = 0;
> +    s->txctrl = 0;
> +    s->rxctrl = 0;
> +    s->div = 0;
> +
> +    s->rx_fifo_len = 0;
> +
> +    memset(s->rx_fifo, 0, SIFIVE_UART_RX_FIFO_SIZE);
> +    fifo8_reset(&s->tx_fifo);
> +}
> +
>   static const Property sifive_uart_properties[] = {
>       DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
>   };
> @@ -270,30 +287,24 @@ static void sifive_uart_realize(DeviceState *dev, Error **errp)
>   {
>       SiFiveUARTState *s = SIFIVE_UART(dev);
>   
> +    fifo8_create(&s->tx_fifo, SIFIVE_UART_TX_FIFO_SIZE);
> +
>       s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                             fifo_trigger_update, s);
>   
> -    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
> -                             sifive_uart_event, sifive_uart_be_change, s,
> -                             NULL, true);
> +    if (qemu_chr_fe_backend_connected(&s->chr)) {
> +        qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
> +                                 sifive_uart_event, sifive_uart_be_change, s,
> +                                 NULL, true);
> +    }
>   
>   }
>   
> -static void sifive_uart_reset_enter(Object *obj, ResetType type)
> +static void sifive_uart_unrealize(DeviceState *dev)
>   {
> -    SiFiveUARTState *s = SIFIVE_UART(obj);
> -
> -    s->txfifo = 0;
> -    s->ie = 0;
> -    s->ip = 0;
> -    s->txctrl = 0;
> -    s->rxctrl = 0;
> -    s->div = 0;
> -
> -    s->rx_fifo_len = 0;
> +    SiFiveUARTState *s = SIFIVE_UART(dev);
>   
> -    memset(s->rx_fifo, 0, SIFIVE_UART_RX_FIFO_SIZE);
> -    fifo8_create(&s->tx_fifo, SIFIVE_UART_TX_FIFO_SIZE);
> +    fifo8_destroy(&s->tx_fifo);
>   }
>   
>   static void sifive_uart_reset_hold(Object *obj, ResetType type)
> @@ -329,6 +340,7 @@ static void sifive_uart_class_init(ObjectClass *oc, void *data)
>       ResettableClass *rc = RESETTABLE_CLASS(oc);
>   
>       dc->realize = sifive_uart_realize;
> +    dc->unrealize = sifive_uart_unrealize;
>       dc->vmsd = &vmstate_sifive_uart;
>       rc->phases.enter = sifive_uart_reset_enter;
>       rc->phases.hold  = sifive_uart_reset_hold;


