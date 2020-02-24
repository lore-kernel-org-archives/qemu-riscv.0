Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6KmF-0006U0-MI
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KmC-0006Lo-5L
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KmB-00037C-0a
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29698
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KmA-00036c-Rh
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHdRJiFy2+sRYmNBB/Zm10M7PeGOon/0i7FrH36WST8=;
 b=Yx2g4ZaM0Gm8cjug/fJBtqZg3EeOsPg8f9U+z1u3+crPu4Ba6QSfIYuN3e3+mKwut5q+2n
 lNjZSlq9AJUw/AQjrwKAA+LOMXWlPQiCejhRJvDJhkmPo0cwm6HGLwbjp7wv6lBKdVQM/Y
 4KoIe8b231GsvVmPWU/0uPrzWkkbxSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-RETixul5O6-YeTanaLpfrg-1; Mon, 24 Feb 2020 15:56:24 -0500
X-MC-Unique: RETixul5O6-YeTanaLpfrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81726800D50;
 Mon, 24 Feb 2020 20:56:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EDC95C21B;
 Mon, 24 Feb 2020 20:56:11 +0000 (UTC)
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
Subject: [PATCH RESEND v2 02/32] memory: Simplify
 memory_region_init_rom_nomigrate() to ease review
Date: Mon, 24 Feb 2020 21:55:03 +0100
Message-Id: <20200224205533.23798-3-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:56:29 -0000

memory_region_init_rom_nomigrate() has the same content than
memory_region_init_ram_shared_nomigrate(), with setting the
readonly mode. The code is easier to review as creating a
readonly ram/shared/nomigrate region.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 memory.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/memory.c b/memory.c
index ce1179874e..6a327a54ed 100644
--- a/memory.c
+++ b/memory.c
@@ -1659,19 +1659,8 @@ void memory_region_init_rom_nomigrate(MemoryRegion *=
mr,
                                       uint64_t size,
                                       Error **errp)
 {
-    Error *err =3D NULL;
-    memory_region_init(mr, owner, name, size);
-    mr->ram =3D true;
+    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false, =
errp);
     mr->readonly =3D true;
-    mr->terminates =3D true;
-    mr->destructor =3D memory_region_destructor_ram;
-    mr->ram_block =3D qemu_ram_alloc(size, false, mr, &err);
-    mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
-    if (err) {
-        mr->size =3D int128_zero();
-        object_unparent(OBJECT(mr));
-        error_propagate(errp, err);
-    }
 }
=20
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
--=20
2.21.1


