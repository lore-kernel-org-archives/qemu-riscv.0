Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j03KQ-00081m-Qk
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 08:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j03KN-0007wg-Sh
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j03KM-0007mL-JJ
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25654
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j03KM-0007m5-Fn
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581080746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TPyeTQVoGVIo9b5LzSFXtIt3DMMWp2dN58foGtQj7MM=;
 b=ixQ9CTZibXHFbPE9aS2+1aWtj/Gnt9kFVaDpKDgJmf6cowL2YEMCUdoT0guex3aC8pcCLc
 o0eb4vE68+bfuYKvn/BLO8qb2Je2yGCYEWcDnnkj5Pf7yXTCo3GLD6lbPiR0mzS99ryJVM
 4e1k6gNqBiWqSFF3Agn2Q/Gvmp5r1wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-Ts1dBpymMnmmxVhRcHqH5g-1; Fri, 07 Feb 2020 08:05:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2EB01081FA5;
 Fri,  7 Feb 2020 13:05:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54FF25C554;
 Fri,  7 Feb 2020 13:04:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 0/3] Make MachineClass::is_default boolean,
 refuse  multiple default machines
Date: Fri,  7 Feb 2020 14:04:50 +0100
Message-Id: <20200207130453.16666-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Ts1dBpymMnmmxVhRcHqH5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 07 Feb 2020 13:05:49 -0000

Cleanup after reviewing "ppc: function to setup latest class options":
https://www.mail-archive.com/qemu-devel@nongnu.org/msg677709.html

Philippe Mathieu-Daud=C3=A9 (3):
  hw: Do not initialize MachineClass::is_default to 0
  hw: Make MachineClass::is_default a boolean type
  vl: Abort if multiple machines are registered as default

 include/hw/boards.h                      |  2 +-
 hw/alpha/dp264.c                         |  2 +-
 hw/cris/axis_dev88.c                     |  2 +-
 hw/hppa/machine.c                        |  2 +-
 hw/i386/pc_piix.c                        | 10 +++++-----
 hw/lm32/lm32_boards.c                    |  3 +--
 hw/lm32/milkymist.c                      |  1 -
 hw/m68k/mcf5208.c                        |  2 +-
 hw/m68k/q800.c                           |  1 -
 hw/microblaze/petalogix_ml605_mmu.c      |  1 -
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
 hw/mips/mips_malta.c                     |  2 +-
 hw/moxie/moxiesim.c                      |  2 +-
 hw/nios2/10m50_devboard.c                |  2 +-
 hw/openrisc/openrisc_sim.c               |  2 +-
 hw/ppc/mac_oldworld.c                    |  2 +-
 hw/ppc/spapr.c                           |  2 +-
 hw/riscv/spike.c                         |  2 +-
 hw/s390x/s390-virtio-ccw.c               |  2 +-
 hw/sh4/shix.c                            |  2 +-
 hw/sparc/sun4m.c                         |  2 +-
 hw/sparc64/niagara.c                     |  2 +-
 hw/sparc64/sun4u.c                       |  4 ++--
 hw/tricore/tricore_testboard.c           |  1 -
 hw/unicore32/puv3.c                      |  2 +-
 vl.c                                     |  4 ++++
 26 files changed, 30 insertions(+), 31 deletions(-)

--=20
2.21.1


