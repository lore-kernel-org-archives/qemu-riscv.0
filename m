Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kpi-0004gE-UB
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kpg-0004ax-6n
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kpf-0006NZ-2Q
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33100
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kpe-0006M6-Ui
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJ6nybCOc2PUBAOje33aa01DAeFm33Ptzm0BhXgaMB8=;
 b=OqVAlVD+OJAqW9z/CJhV5mJS+8BrQoC8dzLepMtlf52ypYYQrhAPMUUopBmjdVT6lQOmX3
 fiK6lHucEs1VunppfwTTnCSHIYQMISFZjWQfrrfvJp05EDPhGlHkNt7fzeu6stmFlp/4+z
 UkXksqI6ZhME7V9a4MROrcygAZOy7lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-MenuiiyUMWeXQD373e_pzQ-1; Mon, 24 Feb 2020 16:00:00 -0500
X-MC-Unique: MenuiiyUMWeXQD373e_pzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605D08017CC;
 Mon, 24 Feb 2020 20:59:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A50C5C651;
 Mon, 24 Feb 2020 20:59:41 +0000 (UTC)
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
Subject: [PATCH RESEND v2 17/32] hw/ppc/ppc405: Use memory_region_init_rom()
 with read-only regions
Date: Mon, 24 Feb 2020 21:55:18 +0100
Message-Id: <20200224205533.23798-18-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-List-Received-Date: Mon, 24 Feb 2020 21:00:05 -0000

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:./hw/ppc/ppc405_boards.c::face=3Dovl-face1::linb=3D195::colb=
=3D8::cole=3D30][potential use of memory_region_init_rom*() in  ./hw/ppc/pp=
c405_boards.c::195]]
* TODO [[view:./hw/ppc/ppc405_boards.c::face=3Dovl-face1::linb=3D464::colb=
=3D8::cole=3D30][potential use of memory_region_init_rom*() in  ./hw/ppc/pp=
c405_boards.c::464]]

We can indeed replace the memory_region_init_ram() and
memory_region_set_readonly() calls by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 1f721feed6..5afe023253 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -192,7 +192,7 @@ static void ref405ep_init(MachineState *machine)
 #endif
     {
         bios =3D g_new(MemoryRegion, 1);
-        memory_region_init_ram(bios, NULL, "ef405ep.bios", BIOS_SIZE,
+        memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
=20
         if (bios_name =3D=3D NULL)
@@ -216,7 +216,6 @@ static void ref405ep_init(MachineState *machine)
             /* Avoid an uninitialized variable warning */
             bios_size =3D -1;
         }
-        memory_region_set_readonly(bios, true);
     }
     /* Register FPGA */
     ref405ep_fpga_init(sysmem, 0xF0300000);
@@ -461,7 +460,7 @@ static void taihu_405ep_init(MachineState *machine)
         if (bios_name =3D=3D NULL)
             bios_name =3D BIOS_FILENAME;
         bios =3D g_new(MemoryRegion, 1);
-        memory_region_init_ram(bios, NULL, "taihu_405ep.bios", BIOS_SIZE,
+        memory_region_init_rom(bios, NULL, "taihu_405ep.bios", BIOS_SIZE,
                                &error_fatal);
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
         if (filename) {
@@ -479,7 +478,6 @@ static void taihu_405ep_init(MachineState *machine)
             error_report("Could not load PowerPC BIOS '%s'", bios_name);
             exit(1);
         }
-        memory_region_set_readonly(bios, true);
     }
     /* Register Linux flash */
     dinfo =3D drive_get(IF_PFLASH, 0, fl_idx);
--=20
2.21.1


