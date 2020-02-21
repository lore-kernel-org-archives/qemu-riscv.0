Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8n-000687-TT
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8l-00063l-Vc
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8k-0007xr-MX
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46214
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8k-0007xW-IR
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zf2WsS+Rv67/jMvGBPvIRKzoIHeTqtx2fA55QRMOVeM=;
 b=DKpV2OtjV/sbVml3RGpFRcxQApGv6u4u0FPsVne8cjUK4m2dNi4J/cvUWHgX8oWwuC1OHT
 x2ULsHizqX26gUTbGtvK5InnV5k12XrHobwtogowvEoBLVF51nYxkw6V33xe44V52IdvW0
 9vAva0+/GkhH0oJAN6Ay6IQz7muoUsw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-oQuw8WTiMNC8Erl6vi8-VA-1; Fri, 21 Feb 2020 12:31:00 -0500
X-MC-Unique: oQuw8WTiMNC8Erl6vi8-VA-1
Received: by mail-wm1-f69.google.com with SMTP id q125so856557wme.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEZCU8SMVeWrFaW4f8SskHzoBJoLksHA5LudhJgZBAs=;
 b=pTGthBeHE8G9CR1KPP0ywfvmIaTwMZRUBs0+DzZRA/uPknqkOHmcn0XayQRXri3fl8
 NTrFuku+tZQ3W+fbNT+fx0iphcrGLcutf03ANCcDIeXxoDFg6aN+Cm6ePPVKQX12WJC2
 +UoKPVey8Zq8eNNLh3p0AgpkUMZ2dvxsL0kPD6CQn+H4dHLEz9AXkq2xK15cUwEjHS/g
 L1HxNpT70p8kfqWs5xQZXSdmd2FnWULNGrARdPqmE6+gdaLQWkR2YvEQOi00OR14/J4M
 JOCMcW9XCyQ7aGhDkfWoyN6kuQFTuwvJ/mLkDBJWoUH1LczODlUBwqqONuk1sueKSRiU
 pXxg==
X-Gm-Message-State: APjAAAVjL8HMSaHxYJ0ZuWU49LT2SJ3CwsQUk4ufX5YjTZpe4oqjixWk
 Y+tkL0AOT0GikzAO6YIHlENP4Foa2v5KNKvjP+sOrIKtbkkfMHVGM1HU84WMy4fhjaz7k8fWAtd
 wPQXg5Vm+q12QrHY=
X-Received: by 2002:adf:edd0:: with SMTP id v16mr48855679wro.310.1582306259065; 
 Fri, 21 Feb 2020 09:30:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLjsZ7pMGOPIjvUZ886X5oZJeXEr39Z4xA7MlsHceESPee+5Hs9pw7468ZjEUoGKjIVYKtFQ==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr48855657wro.310.1582306258912; 
 Fri, 21 Feb 2020 09:30:58 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:58 -0800 (PST)
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
Subject: [PATCH 3/7] hw/char: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:45 +0100
Message-Id: <20200221173049.18134-4-philmd@redhat.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 17:31:05 -0000

To avoid orphean memory regions being added in the /unattached
QOM container, use the memory_region_owner_nonnull.cocci script
to set the correct ownership.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/char/serial.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 9298881af9..2ab8b69e03 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -997,7 +997,7 @@ static void serial_io_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_io_ops, s, "serial", 8);
+    memory_region_init_io(&s->io, OBJECT(dev), &serial_io_ops, s, "serial"=
, 8);
     sysbus_init_mmio(SYS_BUS_DEVICE(sio), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(sio), &s->irq);
 }
@@ -1106,8 +1106,9 @@ static void serial_mm_realize(DeviceState *dev, Error=
 **errp)
         return;
     }
=20
-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[smm->endianness], s=
mm,
-                          "serial", 8 << smm->regshift);
+    memory_region_init_io(&s->io, OBJECT(dev),
+                          &serial_mm_ops[smm->endianness], smm, "serial",
+                          8 << smm->regshift);
     sysbus_init_mmio(SYS_BUS_DEVICE(smm), &s->io);
     sysbus_init_irq(SYS_BUS_DEVICE(smm), &smm->serial.irq);
 }
--=20
2.21.1


