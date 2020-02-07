Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j06NC-0001C8-P9
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 11:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j06NA-00013R-7A
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j06N9-0003Lt-54
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54370
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j06N9-0003JY-1Z
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 11:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581092450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeJwD+5oSTfpziNL0l7YGkVnz0HH2iOXbi7RNEBKA7w=;
 b=UfiJR06kFqO3r5DF8InxONqUNUsvVP/O5Hh4Hdt8pQqzLvvGAGaQ/RyWVS0+8dR31oiBVV
 cQoFe0vbaG0eIpDxLus+8hz0Kbcf/7HbjOKOvTrsx5wIsHIBOaXsaJHAj5rNHs6EhXPP3A
 W/VkeXzxM4vcFEv5tfVXt3an5yHQerg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-EutTKxFLNuK3g1U6U3jTIA-1; Fri, 07 Feb 2020 11:20:48 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2183B10CE784;
 Fri,  7 Feb 2020 16:20:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-88.brq.redhat.com [10.40.204.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCBB7790EB;
 Fri,  7 Feb 2020 16:20:25 +0000 (UTC)
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
Subject: [PATCH v4 1/3] hw: Do not initialize MachineClass::is_default to 0
Date: Fri,  7 Feb 2020 17:19:46 +0100
Message-Id: <20200207161948.15972-2-philmd@redhat.com>
In-Reply-To: <20200207161948.15972-1-philmd@redhat.com>
References: <20200207161948.15972-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EutTKxFLNuK3g1U6U3jTIA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 07 Feb 2020 16:20:53 -0000

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


