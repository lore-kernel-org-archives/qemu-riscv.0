Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLoHf-0002MS-TJ
	for mharc-qemu-riscv@gnu.org; Tue, 07 Apr 2020 09:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jLoHd-0002Jg-Di
 for qemu-riscv@nongnu.org; Tue, 07 Apr 2020 09:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jLoHa-00019d-Ul
 for qemu-riscv@nongnu.org; Tue, 07 Apr 2020 09:28:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54540
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jLoHa-00017e-RT
 for qemu-riscv@nongnu.org; Tue, 07 Apr 2020 09:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586266129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocp6EFI20MUtjHSglurSSfhDC1bsCpIKAKWMCb27vzI=;
 b=C8wmc/ApfSPTDQMeecRBpm24CcDpxKJs6lYevHzo++gu9KQE7zxCh5+0F23yjGu0upyTbp
 ApbRaHAyRZNuB1u/rgzV6R/NsSh0s/PhXSAH+XjuSVTgjQqsbwPtJSR7Y1k/Q6UVG+aX32
 lYqlLsK6LKaGuvpS9YrtkTszqdOxwQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-98bDI2EnMXS9kxLZ7dlJew-1; Tue, 07 Apr 2020 09:28:48 -0400
X-MC-Unique: 98bDI2EnMXS9kxLZ7dlJew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A002801E66;
 Tue,  7 Apr 2020 13:28:42 +0000 (UTC)
Received: from gondolin (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CF6C7E303;
 Tue,  7 Apr 2020 13:28:00 +0000 (UTC)
Date: Tue, 7 Apr 2020 15:27:58 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, "Michael
 S. Tsirkin" <mst@redhat.com>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Alistair Francis <alistair@alistair23.me>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, John Snow <jsnow@redhat.com>, Kevin
 Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?Q8OpZHJpYw==?=
 Le Goater <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Jiri
 Slaby <jslaby@suse.cz>, David Gibson <david@gibson.dropbear.id.au>, Jason
 Wang <jasowang@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Andrzej Zaborowski
 <balrogg@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, David Hildenbrand
 <david@redhat.com>, Eric Farman <farman@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Zhang Chen <chen.zhang@intel.com>, Li Zhijian
 <lizhijian@cn.fujitsu.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, qemu-arm@nongnu.org (open list:Raspberry Pi),
 qemu-block@nongnu.org (open list:Floppy), qemu-ppc@nongnu.org (open
 list:Old World (g3beige)), qemu-riscv@nongnu.org (open list:RISC-V TCG
 CPUs), qemu-s390x@nongnu.org (open list:S390 Virtio-ccw)
Subject: Re: [PATCH-for-5.1 v2 49/54] various: Use &error_abort in
 instance_init()
Message-ID: <20200407152758.1cf47130.cohuck@redhat.com>
In-Reply-To: <20200406174743.16956-50-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-50-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 07 Apr 2020 13:28:54 -0000

On Mon,  6 Apr 2020 19:47:38 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Patch created mechanically by running:
>=20
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h \
>     --include-headers --keep-comments --in-place \
>     --sp-file \
>       scripts/coccinelle/use-error_abort-in-instance_init.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  backends/cryptodev-vhost-user.c |  2 +-
>  backends/rng-egd.c              |  2 +-
>  backends/rng-random.c           |  2 +-
>  backends/vhost-user.c           |  3 ++-
>  hw/arm/bcm2835_peripherals.c    |  6 ++++--
>  hw/arm/vexpress.c               |  8 ++++----
>  hw/arm/xlnx-zcu102.c            |  8 ++++----
>  hw/block/fdc.c                  |  4 ++--
>  hw/block/vhost-user-blk.c       |  2 +-
>  hw/block/virtio-blk.c           |  2 +-
>  hw/core/machine.c               |  6 +++---
>  hw/cpu/core.c                   |  4 ++--
>  hw/display/vga-pci.c            |  7 +++++--
>  hw/display/xlnx_dp.c            |  4 ++--
>  hw/dma/sparc32_dma.c            |  2 +-
>  hw/gpio/aspeed_gpio.c           |  2 +-
>  hw/ide/macio.c                  |  4 +++-
>  hw/ide/qdev.c                   |  4 ++--
>  hw/intc/apic_common.c           |  2 +-
>  hw/mem/nvdimm.c                 |  4 ++--
>  hw/misc/aspeed_sdmc.c           |  2 +-
>  hw/misc/edu.c                   |  3 ++-
>  hw/misc/macio/macio.c           |  4 ++--
>  hw/misc/macio/pmu.c             |  3 ++-
>  hw/misc/pca9552.c               |  2 +-
>  hw/misc/tmp105.c                |  2 +-
>  hw/misc/tmp421.c                |  8 ++++----
>  hw/net/e1000.c                  |  3 ++-
>  hw/net/lance.c                  |  3 ++-
>  hw/net/lasi_i82596.c            |  3 ++-
>  hw/net/ne2000-isa.c             |  4 ++--
>  hw/net/spapr_llan.c             |  2 +-
>  hw/net/virtio-net.c             |  2 +-
>  hw/pci-host/grackle.c           |  2 +-
>  hw/pci-host/i440fx.c            |  8 ++++----
>  hw/pci-host/prep.c              |  2 +-
>  hw/pci-host/q35.c               | 23 ++++++++++++++---------
>  hw/pci-host/sabre.c             |  3 ++-
>  hw/pci-host/uninorth.c          |  9 +++++----
>  hw/pcmcia/pxa2xx.c              |  3 ++-
>  hw/ppc/spapr_drc.c              |  6 +++---
>  hw/ppc/spapr_rng.c              |  2 +-
>  hw/riscv/sifive_u.c             |  4 ++--
>  hw/s390x/event-facility.c       |  6 +++---
>  hw/s390x/s390-ccw.c             |  2 +-
>  hw/s390x/s390-skeys.c           |  4 ++--
>  hw/s390x/s390-stattrib.c        |  4 ++--
>  hw/s390x/sclp.c                 |  2 +-
>  hw/scsi/scsi-bus.c              |  2 +-
>  hw/ssi/xilinx_spips.c           |  2 +-
>  hw/usb/bus.c                    |  4 ++--
>  hw/usb/dev-network.c            |  2 +-
>  hw/usb/dev-storage.c            |  4 ++--
>  hw/usb/host-libusb.c            |  2 +-
>  hw/usb/redirect.c               |  2 +-
>  hw/virtio/virtio-balloon.c      |  4 ++--
>  net/dump.c                      |  4 ++--
>  net/filter-buffer.c             |  2 +-
>  net/filter-mirror.c             | 10 +++++-----
>  net/filter-rewriter.c           |  3 ++-
>  target/arm/cpu64.c              |  4 ++--
>  target/i386/cpu.c               | 23 ++++++++++++++---------
>  target/s390x/cpu.c              |  3 ++-
>  tests/check-qom-proplist.c      |  7 ++++---
>  tests/test-qdev-global-props.c  |  4 ++--
>  65 files changed, 155 insertions(+), 126 deletions(-)
>=20

s390 parts:
Acked-by: Cornelia Huck <cohuck@redhat.com>


