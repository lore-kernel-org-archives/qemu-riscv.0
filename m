Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j03KO-0007xc-Ko
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 08:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j03KM-0007tz-1q
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j03KK-0007l5-Tt
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28211
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j03KK-0007kl-Q6
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 08:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581080744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeJwD+5oSTfpziNL0l7YGkVnz0HH2iOXbi7RNEBKA7w=;
 b=HIQZQOm1LrenWnkLEZ+V3g71uaoRD/eY0YPZX/lnThHDaDTegEccC6qvLIp5UHI6yZqMHm
 /z1NIp4E2etL4DiuoH6Zx/z80zKQjdnuQTOt1CiVKjyLxmCJkjH141l+H+LNFjPFfvAqaa
 cLkY4BY1xDl6QPlFEBg5C3OaS3ascnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-TKZ-oKQdOwyzArmBnSghTQ-1; Fri, 07 Feb 2020 08:05:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16107104FC00;
 Fri,  7 Feb 2020 13:05:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 777A35C883;
 Fri,  7 Feb 2020 13:05:23 +0000 (UTC)
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
Subject: [PATCH v3 1/3] hw: Do not initialize MachineClass::is_default to 0
Date: Fri,  7 Feb 2020 14:04:51 +0100
Message-Id: <20200207130453.16666-2-philmd@redhat.com>
In-Reply-To: <20200207130453.16666-1-philmd@redhat.com>
References: <20200207130453.16666-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: TKZ-oKQdOwyzArmBnSghTQ-1
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
X-List-Received-Date: Fri, 07 Feb 2020 13:05:47 -0000

The MachineClass is already zeroed on creation.

Note: The code setting is_default=3D0 in hw/i386/pc_piix.c is
      different (related to compat options). When adding a
      new versioned machine, we want it to be the new default,
      so we have to mark the previous one as not default.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: new patch
---
 hw/lm32/lm32_boards.c               | 1 -
 hw/lm32/milkymist.c                 | 1 -
 hw/m68k/q800.c                      | 1 -
 hw/microblaze/petalogix_ml605_mmu.c | 1 -
 hw/tricore/tricore_testboard.c      | 1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index d1894adab8..156b050abc 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -302,7 +302,6 @@ static void lm32_uclinux_class_init(ObjectClass *oc, vo=
id *data)
=20
     mc->desc =3D "lm32 platform for uClinux and u-boot by Theobroma System=
s";
     mc->init =3D lm32_uclinux_init;
-    mc->is_default =3D 0;
     mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
 }
=20
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 6d46134232..9fa5fd7050 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -214,7 +214,6 @@ static void milkymist_machine_init(MachineClass *mc)
 {
     mc->desc =3D "Milkymist One";
     mc->init =3D milkymist_init;
-    mc->is_default =3D 0;
     mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
 }
=20
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363688..788b5d663f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -441,7 +441,6 @@ static void q800_machine_class_init(ObjectClass *oc, vo=
id *data)
     mc->init =3D q800_init;
     mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m68040");
     mc->max_cpus =3D 1;
-    mc->is_default =3D 0;
     mc->block_default_type =3D IF_SCSI;
 }
=20
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_=
ml605_mmu.c
index 09486bc8bf..0a2640c40b 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -216,7 +216,6 @@ static void petalogix_ml605_machine_init(MachineClass *=
mc)
 {
     mc->desc =3D "PetaLogix linux refdesign for xilinx ml605 little endian=
";
     mc->init =3D petalogix_ml605_init;
-    mc->is_default =3D 0;
 }
=20
 DEFINE_MACHINE("petalogix-ml605", petalogix_ml605_machine_init)
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.=
c
index 20c9ccb3ce..8ec2b5bddd 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -105,7 +105,6 @@ static void ttb_machine_init(MachineClass *mc)
 {
     mc->desc =3D "a minimal TriCore board";
     mc->init =3D tricoreboard_init;
-    mc->is_default =3D 0;
     mc->default_cpu_type =3D TRICORE_CPU_TYPE_NAME("tc1796");
 }
=20
--=20
2.21.1


