Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Keu-0001SO-TT
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kes-0001Iz-1J
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Keq-0006Dq-Js
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Keq-0006D7-FX
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AksPoeIdaQJuU1Oxkwgd0bzdhJ7x56x3M7zV8fEB+j0=;
 b=EsKE9bnCyDtuSBet9xir1aNrqfV/T4WYZQisdcH4WHQChS3l1vvOm8SSG9oFBfDxXPKwX+
 Xrm1rHeMPRXvFn9enk/AsRdhZN71mISwvwY3y9KshR1vHegW+iuZsdC/JE2gNqQAiaHK+2
 pIYFhtX2v6husGZ0OKtzSaCQs/EfCnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-CFwJ29rEMF6Jc6Vzgrfz2A-1; Mon, 24 Feb 2020 15:48:50 -0500
X-MC-Unique: CFwJ29rEMF6Jc6Vzgrfz2A-1
Received: by mail-wr1-f69.google.com with SMTP id r1so6143620wrc.15
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ha2K59BdbMBaPgTkM1MITzm+jr6shpDFkGmxbgwDocM=;
 b=n2WbKWCWaFq5UDJ1d1MaJQvSjRkyb67KOnF8Y/wiMSIx5pl56t8w15XOOavTA72t+K
 l+EuvHJySmbS68UJhFldYE/DvRmZb/+tJHsr364wgp3VDSQCGOoDDxwup3PfgZ25Yt7e
 8Vkt6fiRTf9Gao3mLx8fFQji1FdI0C7wDcLqHBGdXhjCx6pIhJKOQto/7iHwNCRS9kxS
 Pud4kuomgi3jJBGD5NedGLcIECQV8eGlvdRN14bS+YiQqsIhXmbQEvBi3UC7Do2uXC/X
 acXgFLRX40nffWZK+m6wUSiKUyoAFxkVtnTUxUv+jPBarRx8thQTF1VfU1BV4HvuqCDQ
 NOmQ==
X-Gm-Message-State: APjAAAXxQclD3BxVBBENFwOEjKHJhQh+fo7GZ7QhXmtevWqbgoDCn6EZ
 FrxCEiniDp/7y9zrV6O8liXMLdTXi/mG5CpTorlnVH1fndtXDrgyEyJ46xYGGU28Q6WDBihvGXO
 6P7bkqo2LD8YP9kQ=
X-Received: by 2002:a5d:4709:: with SMTP id y9mr68557428wrq.412.1582577329160; 
 Mon, 24 Feb 2020 12:48:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy94tnLOr/k7TqopZFvWggJ1kMp+bNN2jjEe23udNlHUPVJaEyhMqg9AkFDXWB9KXDZbOdnYg==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr68557395wrq.412.1582577328984; 
 Mon, 24 Feb 2020 12:48:48 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:48 -0800 (PST)
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
Subject: [PATCH v2 08/32] hw/m68k: Use memory_region_init_rom() with read-only
 regions
Date: Mon, 24 Feb 2020 21:48:04 +0100
Message-Id: <20200224204828.23167-9-philmd@redhat.com>
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
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:55 -0000

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/q800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363688..8083326d37 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -402,13 +402,12 @@ static void q800_init(MachineState *machine)
         uint8_t *ptr;
         /* allocate and load BIOS */
         rom =3D g_malloc(sizeof(*rom));
-        memory_region_init_ram(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
+        memory_region_init_rom(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
                                &error_abort);
         if (bios_name =3D=3D NULL) {
             bios_name =3D MACROM_FILENAME;
         }
         filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        memory_region_set_readonly(rom, true);
         memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom)=
;
=20
         /* Load MacROM binary */
--=20
2.21.1


