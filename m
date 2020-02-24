Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kes-0001Ke-J7
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kep-0001DI-RD
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Keo-0006BC-Mc
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40324
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Keo-0006Ai-GW
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAKyL7Tqa+fBdxrFOnKvFsx39GH2EjqIV6ZKoapzE/Q=;
 b=ff9TA7+CzllX7bpVIKnrzoJyPn7VCpgZqqQ1A+EUixly3y/0OhYKdZcUywXdOTEwAxLcMo
 NMV16vRYrJwXPgwue5lkIGSjPUyTTxriCUHDpnFuNIYsbPgyg/nYjXSQQGcMTRUSuqMwPx
 pEC6wfYHFijhDScjmtFEW1YRe0C/2wY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-WA7PK2fhM-2DXy4toUF2YA-1; Mon, 24 Feb 2020 15:48:46 -0500
X-MC-Unique: WA7PK2fhM-2DXy4toUF2YA-1
Received: by mail-wm1-f69.google.com with SMTP id p26so237480wmg.5
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHrh7HRUxq+j6HbASfjSpjwX0NBi+3mUfkSXhbTFwJw=;
 b=MQLZoa72EQ1AeZX4PF+LzZSvBUmLS6imuwMuifd5Iu2uu0EJROk93G1GlcAyDC91Wo
 S990PIIPSgHjoqleWAFIo93DyMQ2fW7XL3BzfD8CTH+1RYij17vwlIpfXKKNoWFveZaR
 2FQDynt7UDJA+9XyKVo6Wwv5E8UcVXaf8SOIr3tEjQ+I38o4Vqot9fnP5f7OP3ERJAc+
 5uUm/GjsworOpOfl7Vcxhkx6b0F+RQVUe9OyaKf81FAq6nSfUKB7HQI4Z9ymDs4C3K8L
 HGyfgJWbo8TzbhXmOipm43cb8vhWuAVF+ElsdM45Ee28ddDkBv3pXoisl2vRhypwarl1
 lvqw==
X-Gm-Message-State: APjAAAVxGXjzMMC2XfP3iV8QLYzGfYZ2IJIdcWI0XE+IPzTCzSFa9Ky2
 ABK5LeYCgDFG8pcJinVQtE7Yzmxx6KWZrVfCD49UR6yziWENav0N7wKk3Dgi3RgViKs6px8tgys
 tkUfVOYRmE2Rce84=
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr767688wme.125.1582577325016; 
 Mon, 24 Feb 2020 12:48:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLwdvkCXa+u8AS+E6gxck9dM+a9v0Rc897RGeC0Inki2Bq/iMfAnjbkQ7ByePUpzOMLllSfA==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr767637wme.125.1582577324771; 
 Mon, 24 Feb 2020 12:48:44 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Max Reitz <mreitz@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 06/32] hw/display: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 24 Feb 2020 21:48:02 +0100
Message-Id: <20200224204828.23167-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224204828.23167-1-philmd@redhat.com>
References: <20200224204828.23167-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:53 -0000

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


