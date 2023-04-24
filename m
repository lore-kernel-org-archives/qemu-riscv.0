Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqs3Y-0004A7-8u
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqs3S-00047G-4h
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:00:16 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqs3Q-0007lV-9A
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:00:13 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so31050172a12.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682326806; x=1684918806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkrHqy/DYWiIr5gAaxM7VNtlMyzQhuQqhdMjN0T+l/g=;
 b=QGe0nzXnRkcZ1b48jqNE/ymIxUTURwD8CRHa9Y/uMciCtbg8lqJgdLjFAKhQP7Jws+
 3oaAlNr0B6g+pck8e3VFy0SSQLxHpiHaY6qeAtmIH0vtKKx4KdA0Taa2R0th7oZ+Vc9b
 uXwAiS5qdMSxon0OZuVmaqxE+dfx9T+esJIkEkWt5bOeXiBlmwE9C8qqAi/jeHrhDCeZ
 11EYAfOOgkj89uuGUVAs+XSH/nH3ks81fiW8WJrd7hnRjhutP7fkyj+PyXamL7kTQnXj
 hjFCIOvSK7yGTHiL4yHbctSGbC/N3SFKwJOay0ag36gHsCcEPOrQDlXuhccZsOqPF+Ui
 odHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682326806; x=1684918806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkrHqy/DYWiIr5gAaxM7VNtlMyzQhuQqhdMjN0T+l/g=;
 b=ATGlsoE3PNB/R9LoHx1st6YKf4oKMaH+VcWG6Y0TBY085ds0nae1Kv7hl/LoWalpdq
 kDNGKTUFcM5tRC61xdiFkjWT+f33r4DQL39ZXgmciRvj6RYG2pPcccf7oDSWrMdyvsUF
 V2k8YLDqv2zt68kfmmymL7d6n1vXQwnwMnXr01qY/TQEUPN1bDsl+7Utymi3TWgWwW70
 9uehZ5r1oOhMMu/D4VLDVyPeHL+P0DEygU2/Ypcay618MPNToCmlHDhTgR2QVAT+p7tO
 B5BtsZRuas6RQ8yotJIum0WB7OCQ+oJk93/DCukVmTCB1XLv/vIFilX8+Qcw4PBkji0H
 bcew==
X-Gm-Message-State: AAQBX9eZBt/B3Vjfr/qjC2xGLEiPAPGaJAE0urQ3Aam/BaTnAy7bCpVv
 D7iCGoDLH+euv/oGb6KpZK5n4uRcOSEHZLRhIl8KsQ==
X-Google-Smtp-Source: AKy350Z6OS8AGPZvbeSp7UwqBXR216XzuZcOplbW2YhUyMfFxpQkOih6IuRj84xdamLH+wr2yrOG+92SIrSaMdiDLrQ=
X-Received: by 2002:a05:6402:12c2:b0:506:a44c:e213 with SMTP id
 k2-20020a05640212c200b00506a44ce213mr10632448edx.20.1682326806583; Mon, 24
 Apr 2023 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230424062409.3395609-1-yong.li@intel.com>
In-Reply-To: <20230424062409.3395609-1-yong.li@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 09:59:55 +0100
Message-ID: <CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt: Add a second UART for secure world
To: Yong Li <yong.li@intel.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 09:00:17 -0000

On Mon, 24 Apr 2023 at 07:24, Yong Li <yong.li@intel.com> wrote:
>
> The virt machine can have two UARTs and the second UART
> can be used when host secure-mode support is enabled.

Do you mean "host" here, or "guest" ?

> Signed-off-by: Yong Li <yong.li@intel.com>
> ---
>  hw/riscv/virt.c         | 4 ++++
>  include/hw/riscv/virt.h | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b38b41e685..02475e1678 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>      [VIRT_UART0] =        { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
> +    [VIRT_UART1] =        { 0x10002000,         0x100 },
>      [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>      [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>      [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
>      serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>          0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>
>      sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>          qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));

Is it intentional that you only create the UART device
and do not add it to the FDT ? (UART0 doesn't seem to be
in the ACPI table generation code so I guess that part
is OK.)

You probably also want to test for compatibility:
for arm we found that different bits of software
(firmware, Linux kernel) annoyingly iterated through
the dtb in different orders.

thanks
-- PMM

