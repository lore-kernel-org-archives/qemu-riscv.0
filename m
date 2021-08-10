Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDKyD-0006gc-DB
	for mharc-qemu-riscv@gnu.org; Tue, 10 Aug 2021 02:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKyC-0006cN-9z
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKy6-0006qF-Gs
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628575829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58RL47eWZyCzhgKuqtiABHxb0t+kFvojCVqufK2R/OA=;
 b=EeDf4e5GqGDTeOOUuFpV5iTIw3AmR4MwZ5qg791iHhsvkKvDzTO+TkW+UefAUC8gjQGqqF
 HSVF1I4NXw+C35F+ZH0GbpQHd9l/2Ht1oDw7TGwvXfvv+SGfasHcJ82D9HCwdVDZ5zEBi0
 8NlWrlAxRNJ5co766klXQV50Ic5UsHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-GRn88WI7OIuByXOBbE3BTw-1; Tue, 10 Aug 2021 02:10:28 -0400
X-MC-Unique: GRn88WI7OIuByXOBbE3BTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB211853038;
 Tue, 10 Aug 2021 06:10:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30ADB5D9C6;
 Tue, 10 Aug 2021 06:09:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Patrick Venture <venture@google.com>, Thomas Huth <huth@tuxfamily.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Havard Skinnemoen
 <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>, Vijai Kumar K
 <vijai@behindbytes.com>, Alistair Francis <Alistair.Francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>, Vikram Garhwal
 <fnu.vikram@xilinx.com>, Francisco Iglesias
 <francisco.iglesias@xilinx.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Taylor Simpson
 <tsimpson@quicinc.com>, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-6.2 07/12] [automated] Use DECLARE_*CHECKER* macros
 when possible
In-Reply-To: <20210806211127.646908-8-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-8-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 08:09:55 +0200
Message-ID: <871r71ygng.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.702, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 10 Aug 2021 06:10:36 -0000

On Fri, Aug 06 2021, Eduardo Habkost <ehabkost@redhat.com> wrote:

> Converting existing QOM types to OBJECT_DECLARE_TYPE is not
> always trivial (due to inconsistent type/macro naming schemes),
> but at least converting existing manual QOM type checking macros
> to use DECLARE_*CHECKER* is a simpler process, and should at
> least discourage people from defining new QOM type checker macros
> manually.
>
> Generated using:
>
>   $ ./scripts/codeconverter/converter.py -i \
>     --pattern=3DTypeCheckMacro $(git grep -l '' -- '*.[ch]')
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: Bandan Das <bsd@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
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
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-ppc@nongnu.org
> ---
>  hw/nvme/nvme.h                              | 12 ++++++------
>  hw/usb/hcd-xhci-pci.h                       |  4 ++--
>  hw/usb/hcd-xhci-sysbus.h                    |  4 ++--
>  hw/usb/u2f.h                                |  8 ++------
>  include/hw/adc/npcm7xx_adc.h                |  4 ++--
>  include/hw/arm/npcm7xx.h                    | 15 ++++-----------
>  include/hw/char/shakti_uart.h               |  4 ++--
>  include/hw/dma/sifive_pdma.h                |  4 ++--
>  include/hw/dma/xlnx_csu_dma.h               |  4 ++--
>  include/hw/gpio/npcm7xx_gpio.h              |  4 ++--
>  include/hw/i2c/npcm7xx_smbus.h              |  4 ++--
>  include/hw/intc/m68k_irqc.h                 |  4 ++--
>  include/hw/intc/sifive_clint.h              |  4 ++--
>  include/hw/mem/npcm7xx_mc.h                 |  3 ++-
>  include/hw/misc/aspeed_lpc.h                |  3 ++-
>  include/hw/misc/mchp_pfsoc_dmc.h            | 10 ++++------
>  include/hw/misc/mchp_pfsoc_ioscb.h          |  4 ++--
>  include/hw/misc/mchp_pfsoc_sysreg.h         |  5 ++---
>  include/hw/misc/npcm7xx_clk.h               |  3 ++-
>  include/hw/misc/npcm7xx_gcr.h               |  3 ++-
>  include/hw/misc/npcm7xx_mft.h               |  4 ++--
>  include/hw/misc/npcm7xx_pwm.h               |  4 ++--
>  include/hw/misc/npcm7xx_rng.h               |  3 ++-
>  include/hw/misc/xlnx-versal-xramc.h         |  4 ++--
>  include/hw/net/npcm7xx_emc.h                |  4 ++--
>  include/hw/net/xlnx-zynqmp-can.h            |  4 ++--
>  include/hw/nvram/npcm7xx_otp.h              |  3 ++-
>  include/hw/ppc/spapr_drc.h                  | 13 ++++---------
>  include/hw/ppc/spapr_xive.h                 |  7 ++-----
>  include/hw/riscv/microchip_pfsoc.h          |  9 ++++-----
>  include/hw/riscv/shakti_c.h                 |  8 ++++----
>  include/hw/riscv/sifive_e.h                 |  8 ++++----
>  include/hw/riscv/sifive_u.h                 |  8 ++++----
>  include/hw/sd/cadence_sdhci.h               |  4 ++--
>  include/hw/ssi/npcm7xx_fiu.h                |  3 ++-
>  include/hw/ssi/sifive_spi.h                 |  3 ++-
>  include/hw/timer/npcm7xx_timer.h            |  4 ++--
>  include/hw/tricore/tricore_testdevice.h     |  4 ++--
>  include/hw/usb/hcd-dwc3.h                   |  4 ++--
>  include/hw/usb/xlnx-usb-subsystem.h         |  4 ++--
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  4 ++--
>  include/hw/watchdog/sbsa_gwdt.h             |  4 ++--
>  include/qemu/accel.h                        |  8 ++------
>  target/hexagon/cpu.h                        |  8 ++------
>  chardev/char-parallel.c                     |  6 ++----
>  hw/i2c/i2c_mux_pca954x.c                    |  4 ++--
>  hw/m68k/mcf5206.c                           |  3 ++-
>  hw/mem/sparse-mem.c                         |  3 ++-
>  hw/misc/sbsa_ec.c                           |  3 ++-
>  hw/s390x/vhost-user-fs-ccw.c                |  4 ++--
>  hw/sensor/adm1272.c                         |  3 ++-
>  hw/sensor/max34451.c                        |  3 ++-
>  hw/usb/u2f-emulated.c                       |  4 ++--
>  hw/usb/u2f-passthru.c                       |  4 ++--
>  54 files changed, 126 insertions(+), 146 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


