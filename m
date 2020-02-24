Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6KnW-0000xz-Ej
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KnT-0000rk-RK
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:57:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KnS-0004Zk-Pv
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:57:47 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53522
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KnR-0004XC-MF
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAKyL7Tqa+fBdxrFOnKvFsx39GH2EjqIV6ZKoapzE/Q=;
 b=JRs2QhDPrB+Zgz0xB54Bkj7P+WmgAyBM0/cg9Ffq48VaVkhigOp0fHqfp4oJ1Kb6fFAxv1
 Uj8RgmYynhKpdgAVB7P+EISYLg/eNT7n5wqUrVyipSIoj5DaEz1IHAdXfK1Gse2+IgMvdv
 XLjAenVhPBa3UPqCue+rZ7bczOMFWA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-WEuuKmVzO9K1-WgNWVdffA-1; Mon, 24 Feb 2020 15:57:43 -0500
X-MC-Unique: WEuuKmVzO9K1-WgNWVdffA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17FC6800D53;
 Mon, 24 Feb 2020 20:57:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2364C5C651;
 Mon, 24 Feb 2020 20:57:28 +0000 (UTC)
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
Subject: [PATCH RESEND v2 06/32] hw/display: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:55:07 +0100
Message-Id: <20200224205533.23798-7-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:57:49 -0000

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/cg3.c | 5 ++---
 hw/display/tcx.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 4fb67c6b1c..a1ede10394 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -287,9 +287,8 @@ static void cg3_initfn(Object *obj)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     CG3State *s =3D CG3(obj);
=20
-    memory_region_init_ram_nomigrate(&s->rom, obj, "cg3.prom", FCODE_MAX_R=
OM_SIZE,
-                           &error_fatal);
-    memory_region_set_readonly(&s->rom, true);
+    memory_region_init_rom_nomigrate(&s->rom, obj, "cg3.prom",
+                                     FCODE_MAX_ROM_SIZE, &error_fatal);
     sysbus_init_mmio(sbd, &s->rom);
=20
     memory_region_init_io(&s->reg, obj, &cg3_reg_ops, s, "cg3.reg",
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index ca458f94fe..76de16e8ea 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -755,9 +755,8 @@ static void tcx_initfn(Object *obj)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     TCXState *s =3D TCX(obj);
=20
-    memory_region_init_ram_nomigrate(&s->rom, obj, "tcx.prom", FCODE_MAX_R=
OM_SIZE,
-                           &error_fatal);
-    memory_region_set_readonly(&s->rom, true);
+    memory_region_init_rom_nomigrate(&s->rom, obj, "tcx.prom",
+                                     FCODE_MAX_ROM_SIZE, &error_fatal);
     sysbus_init_mmio(sbd, &s->rom);
=20
     /* 2/STIP : Stippler */
--=20
2.21.1


