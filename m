Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDKv5-0001Ks-A1
	for mharc-qemu-riscv@gnu.org; Tue, 10 Aug 2021 02:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKv3-0001Ew-E4
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKuz-000478-8l
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628575636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6zyUXg5aIke+6Rm01WBiRgebbKin/ZJfq9RD2qXyio=;
 b=LGVa6LehvLkM90vVINEVdAlkNdLmklI+JtAX6XUOVPlls6DReRpUCY1gJGrNrUObPuCt2D
 LcrJAc3COAbKR8130//H4B8RIlc8UiK19w3gVXV5FYq0+iKwRrUHG/ckvO1TRLxIoVd7E8
 Aa1aVBLq5gnpnZDqcdtJYIgmjxJpECk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-FF-UTNQXPrmXIkMPRwKgtg-1; Tue, 10 Aug 2021 02:07:14 -0400
X-MC-Unique: FF-UTNQXPrmXIkMPRwKgtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 783481074661;
 Tue, 10 Aug 2021 06:07:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4123B60C05;
 Tue, 10 Aug 2021 06:06:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Peter
 Maydell
 <peter.maydell@linaro.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Thomas Huth
 <huth@tuxfamily.org>, "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Havard Skinnemoen
 <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>, Pavel Pisa
 <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>, Jason
 Wang <jasowang@redhat.com>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, David Hildenbrand
 <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Vijai Kumar K
 <vijai@behindbytes.com>, Alistair Francis <Alistair.Francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Laurent Vivier
 <laurent@vivier.eu>, Corey Minyard <minyard@acm.org>, =?utf-8?Q?C=C3=A9dr?=
 =?utf-8?Q?ic?= Le Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
In-Reply-To: <20210806211127.646908-6-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 08:06:37 +0200
Message-ID: <877dgtygsy.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 10 Aug 2021 06:07:21 -0000

On Fri, Aug 06 2021, Eduardo Habkost <ehabkost@redhat.com> wrote:

> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=3DMoveSymbols \
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
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
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
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
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

Acked-by: Cornelia Huck <cohuck@redhat.com>


