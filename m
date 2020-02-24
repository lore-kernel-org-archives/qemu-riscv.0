Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kpy-00053M-C8
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kpv-0004y7-Df
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kpu-0006ZB-2H
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33716
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kpt-0006Yr-U1
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBNzuBX+l+LuROYmtlMct7VCTnb/r/o0TNqAlSU1sE8=;
 b=eIvp2VSzOm4vJb92vw/bod84IkgDHL7j1gLHyFFMOW9kJRjZC3jeFcAB3hQFRIJ0iA2d4T
 lFbUaWJ1Wi8UtlGOp00FRJrztrA/JgKXpLNbMhi+1zBbUVch49T9KSQnA1u+10kZhUafPf
 kPG2iJ6jLdsaHHy1kzkh46eg674D4PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-5sQM0hkiO1O7hIVqfdrbZQ-1; Mon, 24 Feb 2020 16:00:15 -0500
X-MC-Unique: 5sQM0hkiO1O7hIVqfdrbZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 298FC8018A4;
 Mon, 24 Feb 2020 21:00:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D05B5C54A;
 Mon, 24 Feb 2020 20:59:56 +0000 (UTC)
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
Subject: [PATCH RESEND v2 18/32] hw/i386/pc_sysfw: Simplify using
 memory_region_init_alias()
Date: Mon, 24 Feb 2020 21:55:19 +0100
Message-Id: <20200224205533.23798-19-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 21:00:21 -0000

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:hw/i386/pc_sysfw.c::face=3Dovl-face1::linb=3D67::colb=3D4::co=
le=3D26][potential use of memory_region_init_rom*() in  hw/i386/pc_sysfw.c:=
:67]]

pc_isa_bios_init() does a manual copy of a part of the BIOS,
from a read-only region. We can simplify by directly aliasing
the same part.

Before:

  (qemu) info mtree
  memory-region: system
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4g @=
pc.ram 0000000000000000-0000000007ffffff
      0000000000000000-ffffffffffffffff (prio -1, i/o): pci
        00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
        00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
        00000000000e0000-00000000000fffff (prio 1, rom): isa-bios
      ...
      00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0

After:

  (qemu) info mtree
  memory-region: system
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4g @=
pc.ram 0000000000000000-0000000007ffffff
      0000000000000000-ffffffffffffffff (prio -1, i/o): pci
        00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
        00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
        00000000000e0000-00000000000fffff (prio 1, romd): alias isa-bios @s=
ystem.flash0 00000000000e0000-00000000000fffff
      ...
      00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index f5f3f466b0..e864c09ea8 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -54,31 +54,19 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory,
                              MemoryRegion *flash_mem,
                              int ram_size)
 {
-    int isa_bios_size;
-    MemoryRegion *isa_bios;
-    uint64_t flash_size;
-    void *flash_ptr, *isa_bios_ptr;
-
-    flash_size =3D memory_region_size(flash_mem);
+    uint64_t isa_bios_size;
+    MemoryRegion *isa_bios =3D g_new(MemoryRegion, 1);
+    uint64_t flash_size =3D memory_region_size(flash_mem);
=20
     /* map the last 128KB of the BIOS in ISA space */
     isa_bios_size =3D MIN(flash_size, 128 * KiB);
-    isa_bios =3D g_malloc(sizeof(*isa_bios));
-    memory_region_init_ram(isa_bios, NULL, "isa-bios", isa_bios_size,
-                           &error_fatal);
+    memory_region_init_alias(isa_bios, NULL, "isa-bios", flash_mem,
+                             flash_size - isa_bios_size,
+                             isa_bios_size);
     memory_region_add_subregion_overlap(rom_memory,
                                         0x100000 - isa_bios_size,
                                         isa_bios,
                                         1);
-
-    /* copy ISA rom image from top of flash memory */
-    flash_ptr =3D memory_region_get_ram_ptr(flash_mem);
-    isa_bios_ptr =3D memory_region_get_ram_ptr(isa_bios);
-    memcpy(isa_bios_ptr,
-           ((uint8_t*)flash_ptr) + (flash_size - isa_bios_size),
-           isa_bios_size);
-
-    memory_region_set_readonly(isa_bios, true);
 }
=20
 static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
--=20
2.21.1


