Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kr1-0006eJ-14
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 16:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kqm-0006Yh-Ko
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:01:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kqk-00073f-Mt
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:01:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23957
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kqk-00072U-IA
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 16:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmrQdlXnA/jIW2pFbe6JSKjkAJeY5OyoEuZkOnpt8X8=;
 b=FsEzxn37muk8o0WX7gtKCb3bkGZI0xJ693hG4IzzWORfB/qRK/p75/MhMB33Lb5HsW+/59
 ZupAABoSUFn8PrgP+OlkAbtKYea3l4zJFn616BmSinXhS4JBAfMEWn9accD4pGSb1/ilCG
 Jht8J9bThEuHpc+SoMctYxyGi2+7TFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-IQ06hTSpOlaokjmfvr9NAA-1; Mon, 24 Feb 2020 16:01:04 -0500
X-MC-Unique: IQ06hTSpOlaokjmfvr9NAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFA458010F0;
 Mon, 24 Feb 2020 21:01:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 595675C651;
 Mon, 24 Feb 2020 21:00:51 +0000 (UTC)
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
Subject: [PATCH RESEND v2 22/32] scripts/cocci: Patch to let devices own their
 MemoryRegions
Date: Mon, 24 Feb 2020 21:55:23 +0100
Message-Id: <20200224205533.23798-23-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 21:01:14 -0000

When a device creates a MemoryRegion without setting its ownership,
the MemoryRegion is added to the machine "/unattached" container in
the QOM tree.

Example with the Samsung SMDKC210 board:

  $ arm-softmmu/qemu-system-arm -M smdkc210 -S -monitor stdio
  (qemu) info qom-tree
  /machine (smdkc210-machine)
    /unattached (container)
      /io[0] (qemu:memory-region)
      /exynos4210.dram0[0] (qemu:memory-region)
      /exynos4210.irom[0] (qemu:memory-region)
      /exynos4210.iram[0] (qemu:memory-region)
      /exynos4210.chipid[0] (qemu:memory-region)
      ...
      /device[26] (exynos4210.uart)
        /exynos4210.uart[0] (qemu:memory-region)
    /soc (exynos4210)
      ^
       \__ [*]

The irom/iram/chipid regions should go under 'soc' at [*].

Add a semantic patch to let the device own the memory region.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Remove memory_region_init_ram() change which might break migration
    (Peter Maydell)
---
 .../memory-region-housekeeping.cocci          | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index 5e6b31d8ba..c768d8140a 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -101,3 +101,59 @@ expression ERRP;
 +memory_region_init_rom_device(MR, NULL, OPS, OPAQUE, NAME, SIZE, ERRP);
  ...
 -vmstate_register_ram_global(MR);
+
+
+// Device is owner
+@@
+typedef DeviceState;
+identifier device_fn, dev, obj;
+expression E1, E2, E3, E4, E5;
+@@
+static void device_fn(DeviceState *dev, ...)
+{
+  ...
+  Object *obj =3D OBJECT(dev);
+  <+...
+(
+- memory_region_init(E1, NULL, E2, E3);
++ memory_region_init(E1, obj, E2, E3);
+|
+- memory_region_init_io(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_io(E1, obj, E2, E3, E4, E5);
+|
+- memory_region_init_alias(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_alias(E1, obj, E2, E3, E4, E5);
+|
+- memory_region_init_rom(E1, NULL, E2, E3, E4);
++ memory_region_init_rom(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, obj, E2, E3, E4, E5);
+)
+  ...+>
+}
+@@
+identifier device_fn, dev;
+expression E1, E2, E3, E4, E5;
+@@
+static void device_fn(DeviceState *dev, ...)
+{
+  <+...
+(
+- memory_region_init(E1, NULL, E2, E3);
++ memory_region_init(E1, OBJECT(dev), E2, E3);
+|
+- memory_region_init_io(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_io(E1, OBJECT(dev), E2, E3, E4, E5);
+|
+- memory_region_init_alias(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_alias(E1, OBJECT(dev), E2, E3, E4, E5);
+|
+- memory_region_init_rom(E1, NULL, E2, E3, E4);
++ memory_region_init_rom(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, OBJECT(dev), E2, E3, E4, E5)=
;
+)
+  ...+>
+}
--=20
2.21.1


