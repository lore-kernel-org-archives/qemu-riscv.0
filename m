Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZI9Q-000827-KZ
	for mharc-qemu-riscv@gnu.org; Thu, 14 May 2020 14:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZI9O-0007yv-BQ
 for qemu-riscv@nongnu.org; Thu, 14 May 2020 14:00:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43587
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZI9N-0004zj-25
 for qemu-riscv@nongnu.org; Thu, 14 May 2020 14:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589479203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6u+EQomKA3fAx30W7MJ5PJOr2y4zIumN8td25R0lRoo=;
 b=jROg/PRwIDABnPlqUMiAUOZbsTXFOf123kgwQZgY+euG8n7WeTQ2SId2aoZdcn9Sk4CraX
 hbT4RyR/XvXKwuH8JZ67DaysfqoBgi5D22NTR6bfw3DysUkVTdRlY4wcSqM5GOH+Rykv0l
 lUyRbADW6UWqsCcqTD2kXcy8BfjxCO4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-sbKO8UY7OpOwpbuYBSPt-g-1; Thu, 14 May 2020 13:59:59 -0400
X-MC-Unique: sbKO8UY7OpOwpbuYBSPt-g-1
Received: by mail-wm1-f72.google.com with SMTP id l26so4372290wmh.3
 for <qemu-riscv@nongnu.org>; Thu, 14 May 2020 10:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6u+EQomKA3fAx30W7MJ5PJOr2y4zIumN8td25R0lRoo=;
 b=IrrhURRi8e1uGxeZSlLVPfffOpYCqTyWNy00vC6gltTNRbFEvFtGmu8r97U5f3ldkV
 zQ807OIldwEVlpNGoHmsIcvEpdipiRDNjvhzlTEUevrImtkxU8FrYCJojt4I5W9RSIqw
 ZbrK8LHuL0JaZyRRE1ceC3Ye9d1cm1U+QTv1ilZm8eXb3dDvNhHIHy3ZJOYAIMdsB64v
 XaP3/JBz8jk0S0jpU9X5DuZVnLHR1WCTGZ7H3ybNn3xEYEVxKwNJLq4Tcv49CSoeyNGa
 ehwD2mJzbH//q4nybqkRNJRuzIkKCpLnnrYObNBokL/PrLY9dJlAhqox5LePipwIK2j7
 pKuA==
X-Gm-Message-State: AOAM532D5QlCCBPCUbwRpoNj6/Z//e2gGXROBzopf4LsSzpEc1lyjwt0
 RbuVDZsvN7Gm2PHzevtQ3WSADHn7TcggGgk2DC/+2iu+w2fMKVzBNV9FIytkKSOZtotFJbC5x97
 Bk3YRE6Hcr94c62U=
X-Received: by 2002:adf:f981:: with SMTP id f1mr6616285wrr.244.1589479198537; 
 Thu, 14 May 2020 10:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzwlOZhwqJLf2Z7jqKDgdl0dFUpRFKlhAuuh9FusNhF6yEBryfoZTEd7CNkhNkihO+rJ37FA==
X-Received: by 2002:adf:f981:: with SMTP id f1mr6616264wrr.244.1589479198237; 
 Thu, 14 May 2020 10:59:58 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id o15sm4387930wrw.65.2020.05.14.10.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 10:59:57 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] hw/char: Initial commit of Ibex UART
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <11b8f3cd28fd52b10caefe21a7b70444b85792f8.1588878756.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44285916-1542-5ba3-eb39-48f9728c1e8d@redhat.com>
Date: Thu, 14 May 2020 19:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11b8f3cd28fd52b10caefe21a7b70444b85792f8.1588878756.git.alistair.francis@wdc.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:41:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2020 18:00:06 -0000

Hi Alistair,

On 5/7/20 9:13 PM, Alistair Francis wrote:
> This is the initial commit of the Ibex UART device. Serial TX is
> working, while RX has been implemeneted but untested.
> 
> This is based on the documentation from:
> https://docs.opentitan.org/hw/ip/uart/doc/
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS                 |   2 +
>   hw/char/Makefile.objs       |   1 +
>   hw/char/ibex_uart.c         | 490 ++++++++++++++++++++++++++++++++++++
>   hw/riscv/Kconfig            |   4 +
>   include/hw/char/ibex_uart.h | 110 ++++++++
>   5 files changed, 607 insertions(+)
>   create mode 100644 hw/char/ibex_uart.c
>   create mode 100644 include/hw/char/ibex_uart.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3d77f0861..d3d47564ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1236,7 +1236,9 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
>   F: hw/riscv/opentitan.c
> +F: hw/char/ibex_uart.c
>   F: include/hw/riscv/opentitan.h
> +F: include/hw/char/ibex_uart.h
>   
>   
>   SH4 Machines
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 9e9a6c1aff..633996be5b 100644
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -12,6 +12,7 @@ common-obj-$(CONFIG_VIRTIO_SERIAL) += virtio-console.o
>   common-obj-$(CONFIG_XILINX) += xilinx_uartlite.o
>   common-obj-$(CONFIG_XEN) += xen_console.o
>   common-obj-$(CONFIG_CADENCE) += cadence_uart.o
> +common-obj-$(CONFIG_IBEX) += ibex_uart.o
>   
>   common-obj-$(CONFIG_EXYNOS4) += exynos4210_uart.o
>   common-obj-$(CONFIG_COLDFIRE) += mcf_uart.o
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> new file mode 100644
> index 0000000000..f6215ae23d
> --- /dev/null
> +++ b/hw/char/ibex_uart.c
> @@ -0,0 +1,490 @@
> +/*
> + * QEMU lowRISC Ibex UART device
> + *
> + * Copyright (c) 2020 Western Digital
> + *
> + * For details check the documentation here:
> + *    https://docs.opentitan.org/hw/ip/uart/doc/
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/char/ibex_uart.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +static void ibex_uart_update_irqs(IbexUartState *s)
> +{
> +    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_TX_WATERMARK) {
> +        qemu_set_irq(s->tx_watermark, 1);
> +    } else {
> +        qemu_set_irq(s->tx_watermark, 0);
> +    }
> +
> +    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_RX_WATERMARK) {
> +        qemu_set_irq(s->rx_watermark, 1);
> +    } else {
> +        qemu_set_irq(s->rx_watermark, 0);

I wonder if having both bit separate can't lead to odd pulse behavior 
(this function should have the same result if you invert the RX/TX 
processing here). I'd be safer using a local 'raise_watermark' boolean 
variable, then call qemu_set_irq() once.

> +    }
> +
> +    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_TX_EMPTY) {
> +        qemu_set_irq(s->tx_empty, 1);
> +    } else {
> +        qemu_set_irq(s->tx_empty, 0);
> +    }
> +
> +    if (s->uart_intr_state & s->uart_intr_enable & INTR_STATE_RX_OVERFLOW) {
> +        qemu_set_irq(s->rx_overflow, 1);
> +    } else {
> +        qemu_set_irq(s->rx_overflow, 0);
> +    }
> +}
[...]


