Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Klt-0005iL-BF
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Klo-0005cY-N1
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Klm-0002hZ-SQ
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Klm-0002ge-5j
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KY0G2gAT7ify0bjXNUXV8FEj1UQWbwwkL92DRJ4rUII=;
 b=fF1Ii/jP+WTBLsRNEOLR0dc8/RQKrybR3EEG1Iv+0YTCpVnMdMBo6hvHRvy+1LzIZppYzN
 69QidrhXCk+E9rYVaBXeGXsCBxAaO8HymfHB2aFk1TL2qE25dCahGs/QG+yTRFPKt7kEkT
 H9DwhYsHQqPlcqit5CdxUDzBxnokC/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-5P_0sCfFPsKylxj2cbCFAQ-1; Mon, 24 Feb 2020 15:55:57 -0500
X-MC-Unique: 5P_0sCfFPsKylxj2cbCFAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55A6C800053;
 Mon, 24 Feb 2020 20:55:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1575C21B;
 Mon, 24 Feb 2020 20:55:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jason Wang <jasowang@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Max Reitz <mreitz@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>
Subject: [PATCH RESEND v2 00/32] hw: Sanitize various MemoryRegion calls
Date: Mon, 24 Feb 2020 21:55:01 +0100
Message-Id: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 24 Feb 2020 20:56:06 -0000

Resending after being kicked by gsmtp...

 4.3.0 Temporary System Problem.  Try again later (10). t81sm863436wmg.6 - =
gsmtp

This series simplifies various memory API calls when creating
memory regions.

Most of the patches are generated with Coccinelle semantic
patches (provided).
Few more cleanups added while writting the patches have been
added.

v1 was 'Let devices own the MemoryRegion they create':
https://www.mail-archive.com/qemu-devel@nongnu.org/msg681960.html

Since v1:
- understood a bit more Peter Maydell comments regarding
  how memory devices are migrated.

Supersedes: <20200221173049.18134-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (32):
  memory: Correctly return alias region type
  memory: Simplify memory_region_init_rom_nomigrate() to ease review
  scripts/cocci: Rename memory-region-{init-ram -> housekeeping}
  scripts/cocci: Patch to replace memory_region_init_{ram,readonly ->
    rom}
  hw/arm: Use memory_region_init_rom() with read-only regions
  hw/display: Use memory_region_init_rom() with read-only regions
  hw/mips: Use memory_region_init_rom() with read-only regions
  hw/m68k: Use memory_region_init_rom() with read-only regions
  hw/net: Use memory_region_init_rom() with read-only regions
  hw/pci-host: Use memory_region_init_rom() with read-only regions
  hw/ppc: Use memory_region_init_rom() with read-only regions
  hw/riscv: Use memory_region_init_rom() with read-only regions
  hw/sh4: Use memory_region_init_rom() with read-only regions
  hw/sparc: Use memory_region_init_rom() with read-only regions
  scripts/cocci: Patch to detect potential use of memory_region_init_rom
  hw/arm/stm32: Use memory_region_init_rom() with read-only regions
  hw/ppc/ppc405: Use memory_region_init_rom() with read-only regions
  hw/i386/pc_sysfw: Simplify using memory_region_init_alias()
  hw/i386/pc_sysfw: Remove unused 'ram_size' argument
  scripts/cocci: Patch to remove unnecessary
    memory_region_set_readonly()
  hw/arm: Remove unnecessary memory_region_set_readonly() on ROM alias
  scripts/cocci: Patch to let devices own their MemoryRegions
  hw/arm: Let devices own the MemoryRegion they create
  hw/char: Let devices own the MemoryRegion they create
  hw/core: Let devices own the MemoryRegion they create
  hw/display: Let devices own the MemoryRegion they create
  hw/dma: Let devices own the MemoryRegion they create
  hw/riscv: Let devices own the MemoryRegion they create
  hw/input/milkymist-softusb: Remove unused 'pmem_ptr' field
  hw/input/milkymist-softusb: Let devices own the MemoryRegion they
    create
  hw/net/milkymist-minimac2: Let devices own the MemoryRegion they
    create
  hw/block/onenand: Let devices own the MemoryRegion they create

 .../memory-region-housekeeping.cocci          | 159 ++++++++++++++++++
 .../coccinelle/memory-region-init-ram.cocci   |  38 -----
 hw/arm/exynos4210.c                           |  14 +-
 hw/arm/fsl-imx25.c                            |  10 +-
 hw/arm/fsl-imx31.c                            |   6 +-
 hw/arm/fsl-imx6.c                             |   6 +-
 hw/arm/fsl-imx6ul.c                           |   9 +-
 hw/arm/mainstone.c                            |   3 +-
 hw/arm/msf2-soc.c                             |   6 +-
 hw/arm/nrf51_soc.c                            |   2 +-
 hw/arm/omap_sx1.c                             |   6 +-
 hw/arm/palm.c                                 |   3 +-
 hw/arm/spitz.c                                |   3 +-
 hw/arm/stellaris.c                            |   3 +-
 hw/arm/stm32f205_soc.c                        |  11 +-
 hw/arm/stm32f405_soc.c                        |  12 +-
 hw/arm/tosa.c                                 |   3 +-
 hw/arm/xlnx-zynqmp.c                          |  11 +-
 hw/block/onenand.c                            |   7 +-
 hw/char/serial.c                              |   7 +-
 hw/core/platform-bus.c                        |   3 +-
 hw/display/cg3.c                              |   5 +-
 hw/display/g364fb.c                           |   3 +-
 hw/display/macfb.c                            |   4 +-
 hw/display/tcx.c                              |   5 +-
 hw/dma/i8257.c                                |   2 +-
 hw/dma/rc4030.c                               |   4 +-
 hw/i386/pc_sysfw.c                            |  29 +---
 hw/input/milkymist-softusb.c                  |  12 +-
 hw/m68k/q800.c                                |   3 +-
 hw/mips/mips_fulong2e.c                       |   3 +-
 hw/mips/mips_jazz.c                           |   6 +-
 hw/mips/mips_mipssim.c                        |   3 +-
 hw/mips/mips_r4k.c                            |   3 +-
 hw/net/dp8393x.c                              |   5 +-
 hw/net/milkymist-minimac2.c                   |   8 +-
 hw/pci-host/prep.c                            |   5 +-
 hw/ppc/mac_newworld.c                         |   3 +-
 hw/ppc/mac_oldworld.c                         |   3 +-
 hw/ppc/ppc405_boards.c                        |   6 +-
 hw/riscv/sifive_e.c                           |   9 +-
 hw/riscv/sifive_u.c                           |   2 +-
 hw/sh4/shix.c                                 |   3 +-
 hw/sparc/leon3.c                              |   3 +-
 memory.c                                      |  16 +-
 MAINTAINERS                                   |   1 +
 46 files changed, 268 insertions(+), 200 deletions(-)
 create mode 100644 scripts/coccinelle/memory-region-housekeeping.cocci
 delete mode 100644 scripts/coccinelle/memory-region-init-ram.cocci

--=20
2.21.1


