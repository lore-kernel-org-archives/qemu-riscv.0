Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6KsP-0000Z5-RJ
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KsM-0000Tu-PE
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KsL-0008GN-LL
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57566
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KsL-0008Fk-HY
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M00bRTY5Od/jt3qLVU2pJOLmr0uFfCYFYcH1/TRboO0=;
 b=eQmonRLhWN7Xm2Jy4HkRwaUMb8msgrZES8uymNft1ZSCwPD84+ELYmT3FRFa+dtXX5yUp3
 uaLGyUBXs4ufPIETwM5b99yGHhFOtbwMrZl9mmMp+sYabeK5PKOpqsTDzapi/H4fvqVE79
 TtehcjC+NRy4jGwH6zPagwgv8Pu/bVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-KedknbR_Pg-GkEjsoyumTg-1; Mon, 24 Feb 2020 16:02:45 -0500
X-MC-Unique: KedknbR_Pg-GkEjsoyumTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C59B91005512;
 Mon, 24 Feb 2020 21:02:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E3B5C6DC;
 Mon, 24 Feb 2020 21:02:32 +0000 (UTC)
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
Subject: [RFC PATCH RESEND v2 30/32] hw/input/milkymist-softusb: Let devices
 own the MemoryRegion they create
Date: Mon, 24 Feb 2020 21:55:31 +0100
Message-Id: <20200224205533.23798-31-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 21:02:52 -0000

Avoid orphan memory regions being added in the /unattached QOM
container.

Note this change break the migration of the LM32 milkymist machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/milkymist-softusb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 7deeb1294f..72bc7bae1e 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -259,13 +259,11 @@ static void milkymist_softusb_realize(DeviceState *de=
v, Error **errp)
     sysbus_init_mmio(sbd, &s->regs_region);
=20
     /* register pmem and dmem */
-    memory_region_init_ram_nomigrate(&s->pmem, OBJECT(s), "milkymist-softu=
sb.pmem",
+    memory_region_init_ram(&s->pmem, OBJECT(s), "milkymist-softusb.pmem",
                            s->pmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->pmem);
     sysbus_init_mmio(sbd, &s->pmem);
-    memory_region_init_ram_nomigrate(&s->dmem, OBJECT(s), "milkymist-softu=
sb.dmem",
+    memory_region_init_ram(&s->dmem, OBJECT(s), "milkymist-softusb.dmem",
                            s->dmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->dmem);
     s->dmem_ptr =3D memory_region_get_ram_ptr(&s->dmem);
     sysbus_init_mmio(sbd, &s->dmem);
=20
@@ -275,8 +273,8 @@ static void milkymist_softusb_realize(DeviceState *dev,=
 Error **errp)
=20
 static const VMStateDescription vmstate_milkymist_softusb =3D {
     .name =3D "milkymist-softusb",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, MilkymistSoftUsbState, R_MAX),
         VMSTATE_HID_KEYBOARD_DEVICE(hid_kbd, MilkymistSoftUsbState),
--=20
2.21.1


