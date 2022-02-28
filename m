Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOqAT-0006Qu-M7
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 19:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAO-0006Oy-O5; Mon, 28 Feb 2022 19:15:01 -0500
Received: from [2a00:1450:4864:20::32a] (port=53854
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAM-0005L7-V1; Mon, 28 Feb 2022 19:15:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i20so6630455wmc.3;
 Mon, 28 Feb 2022 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nRXzGm1tTr+lcQI5RkHkPfC04rl1jWoXmAMM9OCIX8Y=;
 b=qFLkMN0ID42xLwgyChgqEXlUkgMv2HELW18OjGN5TlP0yGlP4Wr4Ws9hF8obRdotIz
 JR+moNdT+FD0bxJHFTLlluDXkuSesbnGlB2cLQyM13NUxj0KEtxEBl3240C52m84P4Fo
 2KTh955sIJ3FzLFS84rCLwG2oeHsYHVrp5g5Ne7Qpx0GI/okGfDwhwRVDMWCo7Fy4r6+
 J0fQqFSqS14L040PzBZU55VIrifXgUl7/ulHikKuECNeUrc7r7zocramso9LzrOjtse/
 TaDTxxCdtWfB9Z+d84YVk2hT99SRL7R0dwIBxVfea2/H5HXBItzrj5JsQXbmMkAJvv7A
 uCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nRXzGm1tTr+lcQI5RkHkPfC04rl1jWoXmAMM9OCIX8Y=;
 b=kP0aLTKJig5UTx+tm0RuUkOKKLdwL0PEOXWknMMjfLbLXTgT0lC8YOQ0buVD5Qy3d3
 g3miPiWSGPzx0CBqc0xHrIB3YlNpiiCxBcIlvxHRbb7sRNqDymM0/AY7f/AJcJiOlolc
 aW8GMa9NMgTL3v9AQkSUZtT+pr3R+nFxsM+rxhsf328w0kBfho20Z05kr0cnwhSNlbDU
 ocaIPb2alzgNHDEYD59j0Fot7rTSEk+VIk7jz210LRbIN6XF4BnYyDP8Pl93O+ahwN24
 Rb5oPjApBNFd8n/ib94ex1Vw72AW8RwE+dWCaPMPrfS0q3sxBBxbe+bCnw+szlDmLZQh
 XhJw==
X-Gm-Message-State: AOAM531QqbAJfC7kbi8jdjwqhTlurgehSpcNtFEJDsteB2FS9GhqTRHX
 m1rJ/+Dglw9XG29WJEMmwcY=
X-Google-Smtp-Source: ABdhPJwa9aU5M0nvrx/x+cphkXL5mnkZ5ms2az1Trcu2S+2FquOMyXFYSIkc/gCcM/sUgRNnVoU4dA==
X-Received: by 2002:a7b:c3d5:0:b0:381:2ed5:aee1 with SMTP id
 t21-20020a7bc3d5000000b003812ed5aee1mr15153229wmj.113.1646093696965; 
 Mon, 28 Feb 2022 16:14:56 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d648d000000b001efd62a840dsm4994628wri.111.2022.02.28.16.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:14:56 -0800 (PST)
Message-ID: <2d6f54e0-c96a-91dd-0fe6-099f2715cfbb@gmail.com>
Date: Tue, 1 Mar 2022 00:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] hw/ssi: Add Ibex SPI device model
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, wilfred.mallawa@wdc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
 <CAKmqyKMaX6ExVyVfFhdKvmXL4e+uPuczJwYLLVxMbKrED0-ksg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAKmqyKMaX6ExVyVfFhdKvmXL4e+uPuczJwYLLVxMbKrED0-ksg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Tue, 01 Mar 2022 00:15:01 -0000

Hi Wilfred,

On 28/2/22 10:13, Alistair Francis wrote:
> On Mon, Feb 28, 2022 at 1:41 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
>>
>> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>
>> Adds the SPI_HOST device model for ibex. The device specification is as per
>> [1]. The model has been tested on opentitan with spi_host unit tests
>> written for TockOS.
>>
>> [1] https://docs.opentitan.org/hw/ip/spi_host/doc/
>>
>> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>> ---
>>   hw/ssi/ibex_spi_host.c         | 613 +++++++++++++++++++++++++++++++++
>>   hw/ssi/meson.build             |   1 +
>>   hw/ssi/trace-events            |   7 +
>>   include/hw/ssi/ibex_spi_host.h |  94 +++++
>>   4 files changed, 715 insertions(+)
>>   create mode 100644 hw/ssi/ibex_spi_host.c
>>   create mode 100644 include/hw/ssi/ibex_spi_host.h

>> +static void ibex_spi_host_realize(DeviceState *dev, Error **errp)
>> +{
>> +    IbexSPIHostState *s = IBEX_SPI_HOST(dev);
>> +    int i;
>> +
>> +    s->ssi = ssi_create_bus(dev, "ssi");
>> +    s->cs_lines = g_new0(qemu_irq, s->num_cs);
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
>> +    }
>> +
>> +    /* Setup CONFIGOPTS Multi-register */
>> +    s->config_opts = malloc(sizeof(uint32_t) * s->num_cs);

This array is not zeroed. Clearer as:

         s->config_opts = g_new0(uint32_t, s->num_cs);

>> +
>> +    /* Setup FIFO Interrupt Timer */
>> +    s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                          fifo_trigger_update, s);
>> +
>> +    /* FIFO sizes as per OT Spec */
>> +    fifo8_create(&s->tx_fifo, IBEX_SPI_HOST_TXFIFO_LEN);
>> +    fifo8_create(&s->rx_fifo, IBEX_SPI_HOST_RXFIFO_LEN);
>> +}
>> +
>> +static void ibex_spi_host_init(Object *obj)
>> +{
>> +    IbexSPIHostState *s = IBEX_SPI_HOST(obj);
>> +
>> +    s->init_status = true;

What about reset?

>> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->host_err);
>> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->event);
>> +
>> +    memory_region_init_io(&s->mmio, obj, &ibex_spi_ops, s,
>> +                          TYPE_IBEX_SPI_HOST, 0x1000);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>> +}


