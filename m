Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8x-0006WX-BY
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8t-0006Nt-VA
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8s-00082o-QH
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51887)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8s-00082j-Mk
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SCSWK+x3Mgxa8dMA1mlI9fXFXh3qxL+ElfqjZu1bX0=;
 b=dZS6RvCLneQgDmmzy8xoM+YYoNIzIqsJhITNJewqz4aJQCfPXR5seJHOICqMHFsbwJrykf
 NQAj7XiaQeu3pOHCT6A4J8ECSOkGiBZYcVi5NKPUvFjcvIcixy0z+WuD7Vtu5x1sqDcFzK
 L2NdlCat3ZD2T4Fa+w+tXMpAy05NmOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-_3MrjPVvMPiXlRXW1SvShA-1; Fri, 21 Feb 2020 12:31:06 -0500
X-MC-Unique: _3MrjPVvMPiXlRXW1SvShA-1
Received: by mail-wr1-f69.google.com with SMTP id o6so1313466wrp.8
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uT16+Xkl8LuYgM/9VDKdGjve7Io5iSq3xRh//xaioN4=;
 b=S9FcMLhndb7x+JSySsgz37EqOoZi/jmcUPooZmrb9SzhXp/fULdCKTDZ3pw2Hr8XsX
 54zeAZlWgCmZpyNwMy1chPPkNJzBOfhHQ6cLzgZCS9mG3SiqrzYsLN35fKflPzsDbCY2
 9pvThAOaEmwE65BSLZf781OyQe10ugo/8dV5PCzA8Bs9ZztDPbUwnY2VK841dc4rPMlI
 tAo4u/HVwyy2hforA7yVWV3afiVqyoh9EgEVi3Uo3yTTFLFkQbdUkYOcY1q0gzReI+tO
 zeJwn0i91YwhlIo495hDAYBN0egIk95KFDt7OTTFlk3MXnDHL/5d/GEmL+jE4eqWkG6s
 /UOA==
X-Gm-Message-State: APjAAAUPl25Q6iVFrSc6Md8CFgHQ0yi+EIhliq+iCoRPJt3fCURZ4fI2
 peczul/wj6QapRPNZ9H1IoxnKEBI/FDiTToLMTy49kT0farCMZPFlJBXjSbMomDHu1fvFh9x4Aq
 rBIcsO/c0G9Q+QIM=
X-Received: by 2002:a1c:f717:: with SMTP id v23mr5024105wmh.172.1582306265268; 
 Fri, 21 Feb 2020 09:31:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPvt3TF/zPnf7stsTmNpxIiEO+ICSYWHDYXBQCMP2TTK3YwUaChff0LmYEe/BwApgSAvw4TQ==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr5024074wmh.172.1582306265019; 
 Fri, 21 Feb 2020 09:31:05 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:31:04 -0800 (PST)
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
Subject: [PATCH 7/7] hw/riscv: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:49 +0100
Message-Id: <20200221173049.18134-8-philmd@redhat.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 17:31:13 -0000

To avoid orphean memory regions being added in the /unattached
QOM container, use the memory_region_owner_nonnull.cocci script
to set the correct ownership.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/riscv/sifive_e.c | 8 ++++----
 hw/riscv/sifive_u.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 8a6b0348df..583015c247 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -145,8 +145,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
                             &error_abort);
=20
     /* Mask ROM */
-    memory_region_init_rom(&s->mask_rom, NULL, "riscv.sifive.e.mrom",
-        memmap[SIFIVE_E_MROM].size, &error_fatal);
+    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom=
",
+                           memmap[SIFIVE_E_MROM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
         memmap[SIFIVE_E_MROM].base, &s->mask_rom);
=20
@@ -208,8 +208,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
=20
     /* Flash memory */
-    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
-        memmap[SIFIVE_E_XIP].size, &error_fatal);
+    memory_region_init_ram(&s->xip_mem, OBJECT(dev), "riscv.sifive.e.xip",
+                           memmap[SIFIVE_E_XIP].size, &error_fatal);
     memory_region_set_readonly(&s->xip_mem, true);
     memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
         &s->xip_mem);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0e12b3ccef..592830a3a2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -497,7 +497,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev=
, Error **errp)
                              &error_abort);
=20
     /* boot rom */
-    memory_region_init_rom(mask_rom, NULL, "riscv.sifive.u.mrom",
+    memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
                            memmap[SIFIVE_U_MROM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].base,
                                 mask_rom);
@@ -511,7 +511,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev=
, Error **errp)
      * leave it enabled all the time. This won't break anything, but will =
be
      * too generous to misbehaving guests.
      */
-    memory_region_init_ram(l2lim_mem, NULL, "riscv.sifive.u.l2lim",
+    memory_region_init_ram(l2lim_mem, OBJECT(dev), "riscv.sifive.u.l2lim",
                            memmap[SIFIVE_U_L2LIM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].base=
,
                                 l2lim_mem);
--=20
2.21.1


