Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kov-0003Lb-CJ
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kos-0003Fm-Qh
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kor-0005fL-PH
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:59:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43684
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kor-0005ev-LD
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eENF83ZsU8Q/JST+/cnBMiYrotiX2pVY6D2cp7zhmT8=;
 b=ZJAycAb0LUDPq5CoG703B+88A3uDWrRD2eY8xf0VSEfZ8bcrd/nlLFF1bK3L16wzljUes/
 LztPnn+fjQ0nVjqWBmiMn2FHzIuxuPL4wgAtw10NyV87aAPciHsuxBfUjZ5SZMRseDg7jk
 +7EwIlubx3KENDVF1i6xijGMB1jMaSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-2zt37Q_CPcWfs3VWnHI3yQ-1; Mon, 24 Feb 2020 15:59:11 -0500
X-MC-Unique: 2zt37Q_CPcWfs3VWnHI3yQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925A313F8;
 Mon, 24 Feb 2020 20:59:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F675C54A;
 Mon, 24 Feb 2020 20:58:53 +0000 (UTC)
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
Subject: [PATCH RESEND v2 13/32] hw/sh4: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:14 +0100
Message-Id: <20200224205533.23798-14-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:59:16 -0000

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sh4/shix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index 2fc2915428..56c7d29bf5 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -53,8 +53,7 @@ static void shix_init(MachineState *machine)
     cpu =3D SUPERH_CPU(cpu_create(machine->cpu_type));
=20
     /* Allocate memory space */
-    memory_region_init_ram(rom, NULL, "shix.rom", 0x4000, &error_fatal);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "shix.rom", 0x4000, &error_fatal);
     memory_region_add_subregion(sysmem, 0x00000000, rom);
     memory_region_init_ram(&sdram[0], NULL, "shix.sdram1", 0x01000000,
                            &error_fatal);
--=20
2.21.1


