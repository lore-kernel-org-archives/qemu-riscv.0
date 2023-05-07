Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvnS1-0008EX-CP
	for mharc-qemu-riscv@gnu.org; Sun, 07 May 2023 19:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnRs-0008Dr-UE; Sun, 07 May 2023 19:05:53 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnRq-0003sh-0Y; Sun, 07 May 2023 19:05:47 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-4304f4aea78so1255819137.3; 
 Sun, 07 May 2023 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683500743; x=1686092743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybKjR5K87X8rKvfjrPVWLm4JL1K26Mnv7KUJ2DkA/34=;
 b=DMoK2R5je8XVQIQ+76fX9It0EZDdK1U7X9OiMHNbnUJdpHN6zngmSrqqIF3LV4zats
 TidOzgOO5Q10ILK+Or58CM6TNWWqTglS05SwLj/gnI0IhZPZBWBKAe80eHZaD/d0sYgZ
 bd0klvv5tgwkGiPnfB833+6tpOrhYsz+YHOwKum04/Z6gwrcgpVSHFMbmJ7yHnK1Z5t6
 Avdq1wqV88H7MbPdLLMWFYmWl70dIxirKBcjUUYURm3IyOf9K06joWfJOhbv6aLVkNo+
 uSBPTf+HKwbVsUPh4upyPmRNudUzaGU3kvu+fimW2zxKP9B9+SIqp/GtCAVmwEN5uEFN
 TdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683500743; x=1686092743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybKjR5K87X8rKvfjrPVWLm4JL1K26Mnv7KUJ2DkA/34=;
 b=NqjaMN+WnKu05DFksOir7OrxQZwfxs2YdoHZ/GuOfl6AVXRew9s2/KKKJmMZMnPdQM
 WZJu8XIsPcmHIBglO0Wy8AVN1zTyA61bWcLurBSy8k1nzHhpMlhwiJpMXRhlyJrZuPFb
 MaDbbdpneyRZ+jkUoGAWn6SsFt599bSDmlMQYyfp78yK6XR9D5tytDWtgj86DTxyhKGR
 NmVV0quYdwrFOLu5hxRL1EKKzcP7kZBPSmCM5AtH5pPc9nYNlgQTyO7qGCoWdS7Cnx1A
 yvMO/B0AbBNVBrP+W70RM9rZyfuJfBO2N4RQAkVvkAU2xxerY804ZmTyo9vNt5D8N0zS
 axYA==
X-Gm-Message-State: AC+VfDxcqOtTwdVuvwr2pIL7CmZmlNDFiYLn4yA4zPBwSaFEeuvmwtHj
 t09fI2qxhLj9ZmfJCO4iSs2caXs9fly9+ar7NltO5wxf3KcClw==
X-Google-Smtp-Source: ACHHUZ6ufPv+UjrFjyMUyBHHKryoFsyvUC6/m0Feuxva876GxmDuzRQy50dFqnzbUxy6UpzEokYsDaogWrLZS96v+QA=
X-Received: by 2002:a67:f44b:0:b0:434:8401:beae with SMTP id
 r11-20020a67f44b000000b004348401beaemr2257542vsn.34.1683500743488; Sun, 07
 May 2023 16:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073509.3618388-1-yong.li@intel.com>
In-Reply-To: <20230425073509.3618388-1-yong.li@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:05:17 +1000
Message-ID: <CAKmqyKPOuryjYD=c=aJ0n0hfSx29HebGsyKwwUUa9U0GpfwOxg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv/virt: Add a second UART for secure world
To: Yong Li <yong.li@intel.com>
Cc: qemu-devel@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 07 May 2023 23:05:54 -0000

On Tue, Apr 25, 2023 at 5:36=E2=80=AFPM Yong Li <yong.li@intel.com> wrote:
>
> The virt machine can have two UARTs and the second UART
> can be used by the secure payload, firmware or OS residing
> in secure world. Will include the UART device to FDT in a
> seperated patch.
>
> Signed-off-by: Yong Li <yong.li@intel.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This has come up before (see
https://gitlab.com/qemu-project/qemu/-/issues/955) and we decided that
we don't want to add a second UART. If you would like a second one you
can attach it via PCIe.

I think we need a really compelling reason to add another UART. There
was a push recently to move more towards a "PCIe board" where
everything is attached via PCIe, and this is going in the opposite
direction.

Alistair

> ---
>  hw/riscv/virt.c         | 4 ++++
>  include/hw/riscv/virt.h | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..8e11c4b9b3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] =3D {
>      [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>      [VIRT_UART0] =3D        { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
> +    [VIRT_UART1] =3D        { 0x10002000,         0x100 },
>      [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
>      [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
>      [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1506,6 +1507,9 @@ static void virt_machine_init(MachineState *machine=
)
>      serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>          0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>
>      sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>          qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..8d2f8f225d 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -74,6 +74,7 @@ enum {
>      VIRT_APLIC_S,
>      VIRT_UART0,
>      VIRT_VIRTIO,
> +    VIRT_UART1,
>      VIRT_FW_CFG,
>      VIRT_IMSIC_M,
>      VIRT_IMSIC_S,
> @@ -88,6 +89,7 @@ enum {
>  enum {
>      UART0_IRQ =3D 10,
>      RTC_IRQ =3D 11,
> +    UART1_IRQ =3D 12,
>      VIRTIO_IRQ =3D 1, /* 1 to 8 */
>      VIRTIO_COUNT =3D 8,
>      PCIE_IRQ =3D 0x20, /* 32 to 35 */
> --
> 2.25.1
>
>

