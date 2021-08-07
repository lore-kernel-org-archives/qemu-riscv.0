Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCHT1-0005OP-IF
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 04:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHT0-0005N9-1h; Sat, 07 Aug 2021 04:14:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHSy-00068v-4S; Sat, 07 Aug 2021 04:14:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id l18so14128719wrv.5;
 Sat, 07 Aug 2021 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0EgP5djFeKOy8mbp7NNVDG7L8XkGr3rfIgBFUBT4T+U=;
 b=dBTLatOJGHgqHvUIVbMqSXOEY52GdQKz+A8Qdzx6ckyyG7k3pc3g0JgKGv3ynRbKUo
 qtD9e2k09amc/Gj+sg6j5vWlPTn6PcF0FtPvkvsx+rX+wXnOQ6quCGhANRry8aVHU4Cm
 ebt3zqXUT0fHuYfLWE8riu17DXRYPjr909fW5Q7vAdBuJ6ztQd2Kp4Ny5B+rRYJJ4UFD
 j3Zl+Xcae08XuHkUAbQc7kYdO77nSJyeK8lCGUEqkxxm7Sgw26XppQJYRo8w7naGBMNc
 aPazXv5dbafOwdRHRqeqaZdwGvNttvOUTR5VnRVdiAc/DvQKIs00TEOejRpcbF7s5svr
 nGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EgP5djFeKOy8mbp7NNVDG7L8XkGr3rfIgBFUBT4T+U=;
 b=D1MmOe+cyIIg/kVTX1kyWoZ7zar9rCrtZOByXwq+vdL12kvUunWpPJ+O9+DGuoV25k
 /3H2/tihcw+ZCPnAvZBh0CV9kpmEbTMtbUg230gfJGFLP5t27RMND1FXAwaCf3U4piU3
 IwxAwZUicxRs8ugp0M8ZyG1bnhU7rEUREtXysITrfWzT/jEWmumvyzXeZqyHZBMqM6Fw
 VGenujRmPq5okyHvxgV3gVK7lfcrIL2f4VjEp6lU4Ap796sB/GCT+Tr+7LEldxDH2DNj
 3siOcvmNL4TvqLuucc4K4CfFYJ1JXA1Zg3dKiFVdRrHVF0TzF7UK8yO07+uyewmg7Jn6
 AVIg==
X-Gm-Message-State: AOAM530gXr99mtHu4NyR2Rov4BuIPvLj69Qmp1fK8p6ms6hlXtPbYoIg
 6sd22db5O1V1Obd3QUYyUic=
X-Google-Smtp-Source: ABdhPJyUGi3A9hE4Y77bKS5WlxcrLeJdL5JGcUmCVVOTZNnh+QkX4ADdo6RNL41dT7kg7ZWKkPCQLA==
X-Received: by 2002:a5d:4b48:: with SMTP id w8mr15049507wrs.109.1628324037251; 
 Sat, 07 Aug 2021 01:13:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x16sm12265650wru.40.2021.08.07.01.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:13:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Vijai Kumar K <vijai@behindbytes.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <minyard@acm.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <80f33c09-58d6-e45b-c1de-4050b1a359be@amsat.org>
Date: Sat, 7 Aug 2021 10:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-6-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 07 Aug 2021 08:14:02 -0000

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
> 
> Patch generated using:
> 
>  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
> 
> which will:
> - split "typdef struct { ... } TypedefName" declarations
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: Bandan Das <bsd@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vijai Kumar K <vijai@behindbytes.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: "Hervé Poussineau" <hpoussin@reactos.org>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-ppc@nongnu.org
> ---
>  hw/nvme/nvme.h                              |  6 ++++--
>  hw/usb/hcd-uhci.h                           |  1 +
>  hw/usb/hcd-xhci-pci.h                       |  6 ++++--
>  hw/usb/hcd-xhci-sysbus.h                    |  6 ++++--
>  hw/usb/u2f.h                                |  6 ++++--
>  include/hw/acpi/acpi_dev_interface.h        |  2 +-
>  include/hw/adc/npcm7xx_adc.h                |  1 +
>  include/hw/arm/linux-boot-if.h              |  2 +-
>  include/hw/arm/npcm7xx.h                    | 11 +++++++----
>  include/hw/char/shakti_uart.h               |  6 ++++--
>  include/hw/core/accel-cpu.h                 |  1 +
>  include/hw/dma/sifive_pdma.h                |  1 +
>  include/hw/dma/xlnx_csu_dma.h               |  1 +
>  include/hw/fw-path-provider.h               |  2 +-
>  include/hw/gpio/npcm7xx_gpio.h              |  1 +
>  include/hw/hotplug.h                        |  2 +-
>  include/hw/i2c/npcm7xx_smbus.h              |  1 +
>  include/hw/intc/intc.h                      |  2 +-
>  include/hw/intc/m68k_irqc.h                 |  6 ++++--
>  include/hw/intc/sifive_clint.h              |  6 ++++--
>  include/hw/ipmi/ipmi.h                      |  2 +-
>  include/hw/mem/memory-device.h              |  2 +-
>  include/hw/mem/npcm7xx_mc.h                 |  1 +
>  include/hw/misc/aspeed_lpc.h                |  6 ++++--
>  include/hw/misc/bcm2835_cprman.h            |  1 +
>  include/hw/misc/bcm2835_cprman_internals.h  |  1 +
>  include/hw/misc/mchp_pfsoc_dmc.h            |  1 +
>  include/hw/misc/mchp_pfsoc_ioscb.h          |  1 +
>  include/hw/misc/mchp_pfsoc_sysreg.h         |  1 +
>  include/hw/misc/npcm7xx_clk.h               |  1 +
>  include/hw/misc/npcm7xx_gcr.h               |  1 +
>  include/hw/misc/npcm7xx_pwm.h               |  1 +
>  include/hw/misc/npcm7xx_rng.h               |  1 +
>  include/hw/misc/xlnx-versal-xramc.h         |  6 ++++--
>  include/hw/net/npcm7xx_emc.h                |  1 +
>  include/hw/net/xlnx-zynqmp-can.h            |  6 ++++--
>  include/hw/nmi.h                            |  2 +-
>  include/hw/nvram/npcm7xx_otp.h              |  1 +
>  include/hw/ppc/spapr_drc.h                  | 15 +++++++++------
>  include/hw/ppc/spapr_xive.h                 | 11 +++++++----
>  include/hw/ppc/vof.h                        |  1 +
>  include/hw/rdma/rdma.h                      |  2 +-
>  include/hw/riscv/microchip_pfsoc.h          |  1 +
>  include/hw/riscv/shakti_c.h                 | 11 +++++++----
>  include/hw/riscv/sifive_e.h                 |  6 ++++--
>  include/hw/riscv/sifive_u.h                 | 11 +++++++----
>  include/hw/rtc/m48t59.h                     |  2 +-
>  include/hw/sd/cadence_sdhci.h               |  1 +
>  include/hw/ssi/npcm7xx_fiu.h                |  1 +
>  include/hw/ssi/sifive_spi.h                 |  6 ++++--
>  include/hw/stream.h                         |  2 +-
>  include/hw/timer/npcm7xx_timer.h            |  1 +
>  include/hw/tricore/tricore_testdevice.h     |  6 ++++--
>  include/hw/usb/hcd-dwc3.h                   |  6 ++++--
>  include/hw/usb/msd.h                        |  1 +
>  include/hw/usb/xlnx-usb-subsystem.h         |  6 ++++--
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  6 ++++--
>  include/hw/vmstate-if.h                     |  2 +-
>  include/hw/watchdog/sbsa_gwdt.h             |  6 ++++--
>  include/qom/object_interfaces.h             |  2 +-
>  include/sysemu/tpm.h                        |  2 +-
>  target/arm/idau.h                           |  2 +-
>  target/hexagon/cpu.h                        | 11 +++++++----
>  accel/tcg/tcg-all.c                         |  1 +
>  chardev/char-parallel.c                     |  1 +
>  hw/arm/bcm2836.c                            |  1 +
>  hw/m68k/mcf5206.c                           |  1 +
>  hw/mem/sparse-mem.c                         |  6 ++++--
>  hw/mips/loongson3_virt.c                    |  1 +
>  hw/misc/npcm7xx_clk.c                       |  1 +
>  hw/misc/sbsa_ec.c                           |  1 +
>  hw/net/can/ctucan_pci.c                     |  1 +
>  hw/nvram/npcm7xx_otp.c                      |  1 +
>  hw/s390x/vhost-user-fs-ccw.c                |  1 +
>  hw/sensor/adm1272.c                         |  6 ++++--
>  hw/sensor/max34451.c                        |  6 ++++--
>  hw/usb/u2f-emulated.c                       |  1 +
>  hw/usb/u2f-passthru.c                       |  1 +
>  hw/virtio/vhost-user-i2c-pci.c              |  1 +
>  tests/unit/check-qom-interface.c            |  2 +-
>  ui/vdagent.c                                |  1 +
>  81 files changed, 179 insertions(+), 82 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

