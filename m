Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kob-0002et-JY
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KoU-0002ZG-VY
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:58:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KoT-0005Hp-OU
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:58:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23139
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KoT-0005HN-KF
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4lGHk6QRHeMqJdDVZg1X6stDT6EwWnjYxVVB4qV32g=;
 b=izzDagO0HYrU2/OFidNsfEOITktLcFsloEtlYdGYkYzTFCAUg1Om3eC6FWfxE9R+mJC0CG
 cbj+oW5KrtBt6BiPuljiJtABUieCa+ppe4Eyx/1emtDFANg0+rvZkCzZWrn71xkDDrHzBA
 v7EiWh1QNbsPR6hen26Fy/U7ANB8L+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-4jvavk5APjisH5JRlTDLgA-1; Mon, 24 Feb 2020 15:58:47 -0500
X-MC-Unique: 4jvavk5APjisH5JRlTDLgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F65A5EB;
 Mon, 24 Feb 2020 20:58:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD36F5C241;
 Mon, 24 Feb 2020 20:58:28 +0000 (UTC)
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
Subject: [PATCH RESEND v2 11/32] hw/ppc: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:12 +0100
Message-Id: <20200224205533.23798-12-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-List-Received-Date: Mon, 24 Feb 2020 20:58:52 -0000

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/mac_newworld.c | 3 +--
 hw/ppc/mac_oldworld.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 464d012103..566413e479 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -156,13 +156,12 @@ static void ppc_core99_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0, ram);
=20
     /* allocate and load BIOS */
-    memory_region_init_ram(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
+    memory_region_init_rom(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
                            &error_fatal);
=20
     if (bios_name =3D=3D NULL)
         bios_name =3D PROM_FILENAME;
     filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    memory_region_set_readonly(bios, true);
     memory_region_add_subregion(get_system_memory(), PROM_ADDR, bios);
=20
     /* Load OpenBIOS (ELF) */
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7318d7e9b4..8b22ff60b8 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -132,13 +132,12 @@ static void ppc_heathrow_init(MachineState *machine)
     memory_region_add_subregion(sysmem, 0, ram);
=20
     /* allocate and load BIOS */
-    memory_region_init_ram(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
+    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
                            &error_fatal);
=20
     if (bios_name =3D=3D NULL)
         bios_name =3D PROM_FILENAME;
     filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    memory_region_set_readonly(bios, true);
     memory_region_add_subregion(sysmem, PROM_ADDR, bios);
=20
     /* Load OpenBIOS (ELF) */
--=20
2.21.1


