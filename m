Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCHOh-00038O-P9
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 04:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHOf-00037Y-O7; Sat, 07 Aug 2021 04:09:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:47021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHOd-0001vO-Oi; Sat, 07 Aug 2021 04:09:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id c16so14072682wrp.13;
 Sat, 07 Aug 2021 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XsgXu+vGFYzBvFSuWaAnX9REy7MG6QA6UbtFJBGCKC8=;
 b=KP3xBu7azKvgVdt+UGZXSTMKmj50GKANKYgDuIPRHbDdiQJdjb+luS/kF8ON0f+nVI
 F9+Fn6fobIfU4MOqzqXBYMOfokhnKHnOZoEWpfnMwzfjOHKe/jI/zORsD6XOkIrR0q6z
 RVxuJP9DrRfAdFRkLo0mk4pg+qwEwWalks+AiKb90qOTpOwvUq5aIysj7BZN+Blo7VlT
 RwB3Bxu3KVl/afW41pbJqmVZ3Ys5HkvQZizaEqWb3uGx2dOMP6V3yF4tNjYQv6WFHlJ4
 19e+v2UZJTJbgiznc0d4PI77ilVS/BCgy/jprnCFg4cUs8nxJZfBq5/4d0T4aumHRvVH
 R5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XsgXu+vGFYzBvFSuWaAnX9REy7MG6QA6UbtFJBGCKC8=;
 b=O/Oa1y4AXqGl6dc3lDUNUzbBd4XBD4aXEEdl7jhMSaAhSdlMVYgmJwp/ZNet4eMBMo
 L79Z0CLErNJa3kvNHfGhGC3oz4hEpEmCds10H1Do6D9qdb8BbqjQ6Pkratr/7qkgcVjq
 wwC18XP+JTshbe+IJ+s50L6OkEhYYfmCRmuuHr8xDwO29EBE63Pz8NJu5fXE0qeKEDBB
 0kWF71DboyeNkD3LzYgI7h9XQANurr5923v/X0d54s2RH89eLtBlJAX8hBjRP3Uhvua3
 apGpkUHDLrXabB/FmXXcQa5bXs9/eLnedtb3iCbDJ8ZGYIzKQliO8QJhQUG8WSrIcDTx
 6jTw==
X-Gm-Message-State: AOAM530LYh4aGZ9aNasufdaYTlNtMIUfXBzV3YRbGMyOdOfKXovOIUFT
 GdZr1JScFD66fy5ESZomk/A=
X-Google-Smtp-Source: ABdhPJwpueCFHlVOTb7rwDg3kHRw6WbWF7qKYD+Qui0mLvdMhPs53kfsOZK8YicAtvir00DxpTMHcw==
X-Received: by 2002:a5d:5650:: with SMTP id j16mr14743100wrw.46.1628323768389; 
 Sat, 07 Aug 2021 01:09:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm14346925wrt.18.2021.08.07.01.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:09:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH for-6.2 12/12] [automated] Use OBJECT_DECLARE_SIMPLE_TYPE
 when possible
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <laurent@vivier.eu>, Vijai Kumar K <vijai@behindbytes.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Paul Burton <paulburton@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-13-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b35db3c5-614c-325c-4632-50eb902bf343@amsat.org>
Date: Sat, 7 Aug 2021 10:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-13-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Sat, 07 Aug 2021 08:09:34 -0000

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Replace typedef + DECLARE_INSTANCE_CHECKER with
> equivalent OBJECT_DECLARE_SIMPLE_TYPE macro.
> 
> Generated using:
> 
> $ ./scripts/codeconverter/converter.py -i \
>   --pattern=AddObjectDeclareSimpleType $(git grep -l '' -- '*.[ch]')
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vijai Kumar K <vijai@behindbytes.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-ppc@nongnu.org
> ---
>  hw/nvme/nvme.h                              | 10 +++-------
>  hw/usb/hcd-xhci-pci.h                       |  4 +---
>  hw/usb/hcd-xhci-sysbus.h                    |  4 +---
>  include/hw/adc/npcm7xx_adc.h                |  4 +---
>  include/hw/char/shakti_uart.h               |  4 +---
>  include/hw/dma/sifive_pdma.h                |  4 +---
>  include/hw/dma/xlnx_csu_dma.h               |  4 +---
>  include/hw/gpio/sifive_gpio.h               |  4 +---
>  include/hw/intc/m68k_irqc.h                 |  4 +---
>  include/hw/intc/sifive_clint.h              |  4 +---
>  include/hw/intc/sifive_plic.h               |  4 +---
>  include/hw/misc/aspeed_lpc.h                |  4 +---
>  include/hw/misc/bcm2835_cprman_internals.h  | 12 ++++--------
>  include/hw/misc/led.h                       |  3 +--
>  include/hw/misc/mchp_pfsoc_dmc.h            |  8 ++------
>  include/hw/misc/mchp_pfsoc_ioscb.h          |  4 +---
>  include/hw/misc/mchp_pfsoc_sysreg.h         |  4 +---
>  include/hw/misc/npcm7xx_clk.h               |  3 +--
>  include/hw/misc/npcm7xx_gcr.h               |  4 +---
>  include/hw/misc/npcm7xx_mft.h               |  4 +---
>  include/hw/misc/npcm7xx_pwm.h               |  3 +--
>  include/hw/misc/sifive_e_prci.h             |  4 +---
>  include/hw/misc/sifive_test.h               |  4 +---
>  include/hw/misc/sifive_u_otp.h              |  4 +---
>  include/hw/misc/sifive_u_prci.h             |  4 +---
>  include/hw/misc/xlnx-versal-xramc.h         |  4 +---
>  include/hw/net/npcm7xx_emc.h                |  4 +---
>  include/hw/net/xlnx-zynqmp-can.h            |  4 +---
>  include/hw/ppc/spapr_drc.h                  |  4 +---
>  include/hw/register.h                       |  3 +--
>  include/hw/riscv/microchip_pfsoc.h          |  4 +---
>  include/hw/riscv/shakti_c.h                 |  8 ++------
>  include/hw/riscv/sifive_e.h                 |  4 +---
>  include/hw/riscv/sifive_u.h                 |  4 +---
>  include/hw/sd/cadence_sdhci.h               |  4 +---
>  include/hw/ssi/sifive_spi.h                 |  4 +---
>  include/hw/timer/npcm7xx_timer.h            |  3 +--
>  include/hw/tricore/tricore_testdevice.h     |  4 +---
>  include/hw/usb/hcd-dwc3.h                   |  4 +---
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  4 +---
>  hw/m68k/mcf5206.c                           |  4 +---
>  hw/mips/boston.c                            |  4 +---
>  hw/misc/npcm7xx_clk.c                       |  9 +++------
>  hw/net/can/ctucan_pci.c                     |  4 +---
>  hw/s390x/vhost-user-fs-ccw.c                |  4 +---
>  hw/sensor/adm1272.c                         |  4 +---
>  hw/sensor/max34451.c                        |  4 +---
>  47 files changed, 56 insertions(+), 154 deletions(-)

> diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> index 701302ad044..2576193e673 100644
> --- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> +++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
> @@ -29,9 +29,7 @@
>  
>  #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
>  
> -typedef struct VersalUsb2CtrlRegs VersalUsb2CtrlRegs;
> -DECLARE_INSTANCE_CHECKER(VersalUsb2CtrlRegs, XILINX_VERSAL_USB2_CTRL_REGS,
> -                         TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
> +OBJECT_DECLARE_SIMPLE_TYPE(VersalUsb2CtrlRegs, XILINX_VERSAL_USB2_CTRL_REGS)

Unrelated to this patch, we should remove the _regs suffix from
this model.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

