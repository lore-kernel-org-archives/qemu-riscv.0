Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8v-0006RE-81
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8r-0006HM-Ge
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8q-00081M-9j
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50072
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8q-000817-63
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcJ0r25XnABvMzyrrGJORHDPS5fue3w9osOFGOe2Mkc=;
 b=ESUscsSldpayKZq6GbAqKDqn3745z+nJuq29aBjfZ1Q7p2xXJ1NqiL58qTVyZZH6h82PET
 +S/4qDiBbJyvwbTjnAvU4oCn75qy3EHHN8OPQiCnFErF7GFsXgSm9wOrNRFB6lCYF6u+Zi
 Jfk/w5XjoVDDKRP+7phvu+8L8LEv1SM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-QTN2jR8SM1qUvJGuu-eXEw-1; Fri, 21 Feb 2020 12:31:05 -0500
X-MC-Unique: QTN2jR8SM1qUvJGuu-eXEw-1
Received: by mail-wm1-f72.google.com with SMTP id u11so902905wmb.4
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBRFsAffF41rgxvlY5ZKXchGXzJT1TmiIiTOimH9EdI=;
 b=SZL/5JfHFkD2+OFgR2D5WQqs2MFKzSUsQk0BiEbvp7Ggk3yFtYu3USmypdoOiMFG97
 2la5nhnfpX/pNX4463XE+/l/d5zWMqOXYXzfLsqbaj9iJauN3ZNAEVgkrTVvRn5syUkw
 5Pc4Q125vzk2Np9FWfEMKokw4y8r96fXvhEdzB4rQVZswI4rLo7CXMXi70wCr04KqWhv
 bbC3qKGYmxggYNk1RQd9Lusvrj/LvOXRxB8G/bd+hHICFdA4K7jF7PiXpf2XjxYPxyAB
 sJT5B5cibHXwuUWZdFBcr+UlwHstJgOa6b5bRBC7oR+3SmhZnDS1LzeNTsvYVm5ypq8l
 EYZw==
X-Gm-Message-State: APjAAAVWEyWJjMtk5QeN98ZECK1D/1bSdtv0bbIbrgoCSqyfl8/b6/M1
 vNfLbyAYIBLqsDcCi1rtZ5bu3whOCKJq0UUGkcSb1xqj1eNztjK9Ak0A1OY+z3/BDQE6lN86ykj
 Z5HNXBmCGgYRSaFg=
X-Received: by 2002:a1c:bdc6:: with SMTP id n189mr5069508wmf.102.1582306263743; 
 Fri, 21 Feb 2020 09:31:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEI/3oNsoby0bNnihrImcdqmlWs6JCexTdc29W5L27hyKcBACqbzBuXeY5ABZ/RF+Qns1Heg==
X-Received: by 2002:a1c:bdc6:: with SMTP id n189mr5069492wmf.102.1582306263543; 
 Fri, 21 Feb 2020 09:31:03 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:31:03 -0800 (PST)
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
Subject: [PATCH 6/7] hw/dma: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:48 +0100
Message-Id: <20200221173049.18134-7-philmd@redhat.com>
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

To avoid orphean memory regions being added in the /unattached
QOM container, use the memory_region_owner_nonnull.cocci script
to set the correct ownership.

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


