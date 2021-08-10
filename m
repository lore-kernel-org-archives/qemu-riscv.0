Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDL00-0000hx-38
	for mharc-qemu-riscv@gnu.org; Tue, 10 Aug 2021 02:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKzx-0000gz-Vk
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKzw-0008Q9-6u
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628575943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNtgybHUXwWUCA/ZbpdWoCGHg2948usPYr6wOFNmhio=;
 b=DKgcOJYtn6ziAb7AmTLJZTziR/fZZV0+gUriUyrF9LjVKU2XoOnoH3yPDsTogyhLBqlncq
 g8VEQm0qvXA9RtKhbJKx2jfDo4jlDS9jQhxFoEktR0ABvOM+Nq8fVWY+S3BMXZEG7KbHlL
 mz0xhVzPsZBEfH0cGhc1w+XQCSZDkj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-cZeG3siDNUerxLgaCy96Zg-1; Tue, 10 Aug 2021 02:12:22 -0400
X-MC-Unique: cZeG3siDNUerxLgaCy96Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA063363A4;
 Tue, 10 Aug 2021 06:12:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A07285C232;
 Tue, 10 Aug 2021 06:12:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <huth@tuxfamily.org>, Paul Burton
 <paulburton@kernel.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Havard
 Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal
 <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, Vijai Kumar K
 <vijai@behindbytes.com>, Alistair Francis <Alistair.Francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>, Francisco
 Iglesias <francisco.iglesias@xilinx.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH for-6.2 12/12] [automated] Use
 OBJECT_DECLARE_SIMPLE_TYPE when possible
In-Reply-To: <20210806211127.646908-13-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-13-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 08:12:03 +0200
Message-ID: <87y299x1zg.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 10 Aug 2021 06:12:26 -0000

On Fri, Aug 06 2021, Eduardo Habkost <ehabkost@redhat.com> wrote:

> Replace typedef + DECLARE_INSTANCE_CHECKER with
> equivalent OBJECT_DECLARE_SIMPLE_TYPE macro.
>
> Generated using:
>
> $ ./scripts/codeconverter/converter.py -i \
>   --pattern=3DAddObjectDeclareSimpleType $(git grep -l '' -- '*.[ch]')
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
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
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
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

Acked-by: Cornelia Huck <cohuck@redhat.com>


