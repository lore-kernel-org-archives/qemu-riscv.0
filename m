Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8u-0006PH-Ic
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8r-0006IE-SK
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8q-00081V-Fp
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51211
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8q-00081A-BO
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIJbNClAaopu3XcwBy22eUj/Xx5fmW+fWgqNqWuWF1g=;
 b=h1ETS4/G0b/xmFkGDnuajaBdMtKjNjqPtwxrEy1cBuHJr/G/fXiLKIinqv02V2M44e7GV5
 PRK0Nb/LDx4twwIMxxEe3z93TS+dPY56Qgi43UorSmgtTXoewHjakGhEtPAL5rDILOt284
 w5xFZHLMTOUPLKQyCdlqfud3omugMcE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-GbDSxIiyN5SdRIl4Cdug_g-1; Fri, 21 Feb 2020 12:30:56 -0500
X-MC-Unique: GbDSxIiyN5SdRIl4Cdug_g-1
Received: by mail-wr1-f69.google.com with SMTP id d8so1312081wrq.12
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhcONAkiFDeuSeZsi9vQPsSpTSVQ47zvNIPLgZ1YRDk=;
 b=ju+X/OOkY7CXwoiZci+6nPQnLxZr+NHf514NzewOmAfTeKSOJEG1oP3KzmnpBppDCY
 aGC78Ozltd4TJBnRU4Ca88qkHdp8doAARueY8uDLDZR5DY4W4pFPnr7DNAksCuvj6U7r
 jzmTEmsiHt+4FCy8WUUe2QTBfdhOSxWgq57JK8oKyI9jxCDWbLPJxhykKgXllA1/vYja
 M7KqsV9gRSF94OoYbp+uqtpgfAMo+/hmwH8uljuwvJur9gXGm1WdWCUrh7enEw+STuQj
 N/hd9frUslrkQyT3d63t8eSbsrpoaEqfNor047sABwmuZkAh+xNertNFG7bEMh38xL89
 Tbcg==
X-Gm-Message-State: APjAAAU3IHBwoRojjRBuVMZDYd6QO7njPOgdU73nWyYCpjliCG/k3z5m
 tUn3b2rQBc+IkYsMagxmCu+tTgSwdj3IFDMlDj48NyYzxMI3TOWjGmqMOLutPXHD37wq+lmstvu
 5m1TQ3u+FbHNs7l4=
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr50053543wrq.155.1582306254965; 
 Fri, 21 Feb 2020 09:30:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0eeMUTxcT7eJ1BFPV35jFa5u7G1EKn9bk9D2WAVnrHFmnGoyOcBdg2D1PUH07W7NO+HPBBQ==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr50053522wrq.155.1582306254743; 
 Fri, 21 Feb 2020 09:30:54 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/7] scripts/coccinelle: Add a script to let devices own their
 MemoryRegions
Date: Fri, 21 Feb 2020 18:30:43 +0100
Message-Id: <20200221173049.18134-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200221173049.18134-1-philmd@redhat.com>
References: <20200221173049.18134-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Fri, 21 Feb 2020 17:31:11 -0000

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

Add a coccinelle script to do automatic semantic patching.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../memory_region_owner_nonnull.cocci         | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/coccinelle/memory_region_owner_nonnull.cocci

diff --git a/scripts/coccinelle/memory_region_owner_nonnull.cocci b/scripts=
/coccinelle/memory_region_owner_nonnull.cocci
new file mode 100644
index 0000000000..6748a200b2
--- /dev/null
+++ b/scripts/coccinelle/memory_region_owner_nonnull.cocci
@@ -0,0 +1,80 @@
+/*
+  Usage:
+
+    spatch \
+        --macro-file scripts/cocci-macro-file.h \
+        --sp-file scripts/coccinelle/memory_region_owner_nonnull.cocci \
+        --keep-comments \
+        --in-place \
+        --dir .
+
+*/
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
+- memory_region_init_ram(E1, NULL, E2, E3, E4);
++ memory_region_init_ram(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram_ptr(E1, NULL, E2, E3, E4);
++ memory_region_init_ram_ptr(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, obj, E2, E3, E4, E5);
+)
+  ...+>
+}
+
+// Device is owner
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
+- memory_region_init_ram(E1, NULL, E2, E3, E4);
++ memory_region_init_ram(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram_ptr(E1, NULL, E2, E3, E4);
++ memory_region_init_ram_ptr(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, OBJECT(dev), E2, E3, E4, E5)=
;
+)
+  ...+>
+}
--=20
2.21.1


