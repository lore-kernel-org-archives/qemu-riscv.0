Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Keh-0000pr-Nv
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0000mG-Jk
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Ked-0005xF-Gh
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:40 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34430
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Ked-0005vl-Cj
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHdRJiFy2+sRYmNBB/Zm10M7PeGOon/0i7FrH36WST8=;
 b=ZWIGHcEUiZDuNwtg2v2GKwV08cJ9n44qA5LPGWwETzkCswIojgjIFjdqml6F4BedXbVJGp
 wv58biN3Y+EIlp00JaExc9sUKOPFX7oyXFHCaeKRnj8kxULaRTtOVDTjWnFLcoYto5e60y
 SBp3BJt3RkV4OIvL2tax/SgUrpZosTo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-fqopXGMlNf2PJUAO05SQmQ-1; Mon, 24 Feb 2020 15:48:37 -0500
X-MC-Unique: fqopXGMlNf2PJUAO05SQmQ-1
Received: by mail-wr1-f72.google.com with SMTP id t3so4382527wrp.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZClVMiunKveJxIk817JDRiraYdietQ4sjQAY6VMZbY4=;
 b=jwcEW2NhBihan78lFtoTbMc4bAcIl+bJZEfVfTbGljR31JxYaVzWU9dUuowTTjXD5C
 QQ9AFOhZxEEG+WECWb8Tfa4J2JhahvI+pcijcRvEMg1IaM+yFnnUca6B5RD8vh/eV+lp
 VuwHmueJUDMHVy3W/H1V59kB5HgGxw6aIxh+9SejQJDiVoms7v44wkEawnzKpNv3caGH
 xsJ4b2akQoHJwCKCggG+lQlYZpJUu7NIS4MnuTm7PBuYKe4GRFIl5pwJZC4FmSwfkrFF
 7MY96A+GJKnbtCamQMi/KHZkvWRs+oPuracScQKar6fWvPwuS7QPO4nQM/rzdIIY5PWW
 o37w==
X-Gm-Message-State: APjAAAU18kUqocbzaNiA6EXQ1v9/4OpFsBPSNn5Ow61uaSX6xyUaOvMy
 oq6YDEHvT+QPIM9EdeOng4Hd+6I9Ciy8CVfi72IhaxoKE6ClAiyUaqgNQloxwvJ9XT9TgRJ5Plu
 68BemOIFDN+BXoy0=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr68380895wrs.365.1582577316216; 
 Mon, 24 Feb 2020 12:48:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxB+Vm+i34MxlUQyPhCSr3BdJbqkJu1QAmnjdIH/eqSCWOoIPFgzbAU0Q5gnonM9PI843rig==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr68380843wrs.365.1582577315965; 
 Mon, 24 Feb 2020 12:48:35 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:35 -0800 (PST)
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
Subject: [PATCH v2 02/32] memory: Simplify memory_region_init_rom_nomigrate()
 to ease review
Date: Mon, 24 Feb 2020 21:47:58 +0100
Message-Id: <20200224204828.23167-3-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:42 -0000

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


