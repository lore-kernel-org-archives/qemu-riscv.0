Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Krs-0007rT-Gm
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Krp-0007kF-HU
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kro-0007t9-Dc
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58797
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kro-0007ss-7p
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fz4RL4GQNxQ7AL6EJheq8m8lRXs+9KDO1fv0pwDQ6ZM=;
 b=J5wnbVYHyY6jERH5K0N9I7KVk06nA+EbLw1UeLkbIvi6weUbDqtzd0gig7T8UyuFilNoat
 n+Y2vfe4MR2CmkelAM5BWV1aYFnZLI8vomCgrqfh8C9o4werchyyFpq4xtaKUZ4zFMicD1
 Tc8PW0I85mhE6BbZrR6BbFZXXg4fH7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-kuzCGZ-OP76fTPXm_0eVkA-1; Mon, 24 Feb 2020 16:02:10 -0500
X-MC-Unique: kuzCGZ-OP76fTPXm_0eVkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8306800EB4;
 Mon, 24 Feb 2020 21:02:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80E5E5C6DC;
 Mon, 24 Feb 2020 21:01:51 +0000 (UTC)
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
Subject: [PATCH RESEND v2 27/32] hw/dma: Let devices own the MemoryRegion they
 create
Date: Mon, 24 Feb 2020 21:55:28 +0100
Message-Id: <20200224205533.23798-28-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 21:02:19 -0000

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/i8257.c  | 2 +-
 hw/dma/rc4030.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index bad8debae4..ef15c06d77 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -553,7 +553,7 @@ static void i8257_realize(DeviceState *dev, Error **err=
p)
     I8257State *d =3D I8257(dev);
     int i;
=20
-    memory_region_init_io(&d->channel_io, NULL, &channel_io_ops, d,
+    memory_region_init_io(&d->channel_io, OBJECT(dev), &channel_io_ops, d,
                           "dma-chan", 8 << d->dshift);
     memory_region_add_subregion(isa_address_space_io(isa),
                                 d->base, &d->channel_io);
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index c4cf8236f4..f62eb3d2a3 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -679,9 +679,9 @@ static void rc4030_realize(DeviceState *dev, Error **er=
rp)
     s->periodic_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                      rc4030_periodic_timer, s);
=20
-    memory_region_init_io(&s->iomem_chipset, NULL, &rc4030_ops, s,
+    memory_region_init_io(&s->iomem_chipset, o, &rc4030_ops, s,
                           "rc4030.chipset", 0x300);
-    memory_region_init_io(&s->iomem_jazzio, NULL, &jazzio_ops, s,
+    memory_region_init_io(&s->iomem_jazzio, o, &jazzio_ops, s,
                           "rc4030.jazzio", 0x00001000);
=20
     memory_region_init_iommu(&s->dma_mr, sizeof(s->dma_mr),
--=20
2.21.1


