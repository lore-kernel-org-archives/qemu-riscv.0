Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j06NA-000154-S1
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 11:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j06N8-0000xC-3Z
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j06N6-0003CL-W0
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:50 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46038
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j06N6-0003Aa-S5
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581092448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SqpfzpI4dpRLXc3WqQjo05yB0n6jdXmIRafCXmc4x+0=;
 b=iOY9/ZQulaAcZgeVtu40EoF410xSv+HEGjLKWxX83gdZJTfFBnNQ5KeNeLx3E0qVfOj92t
 K731anyM0J2PoxJOIA6yuFl+4wVto87Qeb17NqNjTONLyjcRzHypXP7+Dqn+m/CMukww+b
 K2ADQ0WkHSR9oAXwhsN8lgz6+AB+A7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-mzrnWNmBPwSd3OFiMujIqw-1; Fri, 07 Feb 2020 11:20:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CDADDB23;
 Fri,  7 Feb 2020 16:20:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-88.brq.redhat.com [10.40.204.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E49790D8;
 Fri,  7 Feb 2020 16:20:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Jia Liu <proljc@gmail.com>
Subject: [PATCH v4 0/3] Make MachineClass::is_default boolean,
 refuse  multiple default machines
Date: Fri,  7 Feb 2020 17:19:45 +0100
Message-Id: <20200207161948.15972-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mzrnWNmBPwSd3OFiMujIqw-1
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
X-List-Received-Date: Fri, 07 Feb 2020 16:20:51 -0000

Cleanup after reviewing "ppc: function to setup latest class options":
https://www.mail-archive.com/qemu-devel@nongnu.org/msg677709.html

Since v3:
- addressed Laurent & Michael comments

Philippe Mathieu-Daud=C3=A9 (3):
  hw: Do not initialize MachineClass::is_default to 0
  hw: Make MachineClass::is_default a boolean type
  vl: Abort if multiple machines are registered as default

 include/hw/boards.h                      |  4 +++-
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
 hw/sparc64/sun4u.c                       |  2 +-
 hw/tricore/tricore_testboard.c           |  1 -
 hw/unicore32/puv3.c                      |  2 +-
 vl.c                                     |  6 ++++--
 25 files changed, 30 insertions(+), 31 deletions(-)

--=20
2.21.1


