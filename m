Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOqAM-0006OO-6q
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 19:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAI-0006Nr-SL; Mon, 28 Feb 2022 19:14:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=38785
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAH-0005JV-8v; Mon, 28 Feb 2022 19:14:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v21so17905356wrv.5;
 Mon, 28 Feb 2022 16:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vYk6CQqV9TgryNjiL4o/ztuD6B5ePpM/3OKhf2ProGM=;
 b=ff27V9gPHrWFbUb47A9f5sMeeT2DeLp0ixGrT6jvEppvJF1mEFq5XOk68Yiy/Ekyfs
 /tuPJ5hmDII/F3rLr8iksI3DZOPT47Mzi45/aCWDULSiqcQanh3KXckbo+TaOEFvQ/KF
 lwhlhjaDqUON5X53hwax0MuGPPpLmOMcyGZjZQ3GpDA2sJRDE59BlBIOZD5/dtZ5+H7Q
 zKM2ez9B/ij5pKkXSpHy+hSECDQyOWKk6rV4K364elcfx9ugiAYpmBp7svWGwnQfXYDI
 RJpv7+raWb8lx8QSs1gxY03UMzsFcnIirnUFV1fD8mG/voZtVBckJc8TP/dp6NkhuPDJ
 uthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vYk6CQqV9TgryNjiL4o/ztuD6B5ePpM/3OKhf2ProGM=;
 b=dLTJHIbAj6iaIECSwIkI7MHS0Ej9FMkReIX3kEHb+uV4tNBJ++X92zIHjhhaM3endi
 raEEOWHNpAQydV9CT+SBByUCC8nBVm+zweRV5z+jhK9SdLwMFDrqE5gHFuDbUg5PRGSY
 7DvdQB8PJF5VCwLT9MzDbQb8+F7RKVgCB73+En75MRtC3K1MzlqxDiZcg8Q4vLYhZfdN
 YqdwYgSKSJivaVe5XUkQ4i+AVj1LMa3ZCN7XrhqF6/BmuAXTvYynLqnRRv3ViXH6bj/U
 sFIohzocgIj+rh92wd1zgUgv0CFXhMHl8PON7Y2rgAVDfyms9hbO3PVCdCty0RjzmplN
 Ja5Q==
X-Gm-Message-State: AOAM530me3eQ71XcNFt5Dr+dgyr7S0dseJtk/6XI4HfDAQLzwl1Gud1Q
 wfX5iZGCZ877PSEu7WpYQ5k=
X-Google-Smtp-Source: ABdhPJxocwAr/3z1RKdy9/AKrJ0f280NLFjXgLlI1/zSiNp4i99Z+4qvV653nWQUZ+WWnfbnLM4FEg==
X-Received: by 2002:adf:fbcf:0:b0:1ef:d5f2:23a5 with SMTP id
 d15-20020adffbcf000000b001efd5f223a5mr5142184wrs.567.1646093691022; 
 Mon, 28 Feb 2022 16:14:51 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm1088490wmp.44.2022.02.28.16.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:14:50 -0800 (PST)
Message-ID: <0215dda2-9b9f-f0cf-32a9-3c64340aab79@gmail.com>
Date: Tue, 1 Mar 2022 00:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] riscv: opentitan: Connect opentitan SPI Host
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
References: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
 <20220228034047.34612-2-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228034047.34612-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 00:14:55 -0000

On 28/2/22 04:40, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Conenct spi host[1/0] to opentitan.

Typo "Connect".

> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>   hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
>   include/hw/riscv/opentitan.h | 12 +++++++++++-
>   2 files changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 833624d66c..2d401dcb23 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -120,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
>       object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
>   
>       object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
> +
> +    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
> +        object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
> +                                TYPE_IBEX_SPI_HOST);
> +    }
>   }
>   
>   static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>   {
>       const MemMapEntry *memmap = ibex_memmap;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
>       MachineState *ms = MACHINE(qdev_get_machine());
>       LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
>       MemoryRegion *sys_mem = get_system_memory();
> @@ -209,14 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                             qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
>                                              IRQ_M_TIMER));
>   
> +    /* SPI-Hosts */
> +    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> +        dev = DEVICE(&(s->spi_host[i]));
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {

FYI if this fails for i=1, spi_host[0] is not deallocated. Not sure how
to improve this.

> +            return;
> +        }
> +        busdev = SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, memmap[IBEX_DEV_SPI_HOST0 + i].base);

> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 00da9ded43..3a3f412ef8 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -1,7 +1,7 @@

> +#define OPENTITAN_NUM_SPI_HOSTS 2
> +#define OPENTITAN_SPI_HOST0 0
> +#define OPENTITAN_SPI_HOST1 1

Eventuallt enum.

>   enum {
>       IBEX_TIMER_TIMEREXPIRED0_0 = 126,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ = 153,
> +    IBEX_SPI_HOST1_ERR_IRQ = 152,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ = 151,
> +    IBEX_SPI_HOST0_ERR_IRQ = 150,
>       IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
>       IBEX_UART0_RX_TIMEOUT_IRQ = 7,
>       IBEX_UART0_RX_BREAK_ERR_IRQ = 6,

It would be nice to get this enum somehow sorted.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

