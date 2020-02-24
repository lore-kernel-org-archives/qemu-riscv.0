Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Keo-00019m-T0
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kel-00011r-GU
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kek-000669-DZ
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23097
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kek-00065Z-9x
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKIXWkZQ88WTduFFFkbsC3MYjrqzYmU5aP3tKw4s+ro=;
 b=EVaqCleLEx4N3hbWnVaxYwZxzK1HcQTlBL4zEXxH0yct1q+26cDyY981YpXqbyPT9MJyMC
 q57DSxG3lbTv3cE+ZY4TC3GKYkhvrT+lmClnvK7hy0O8UevL9G4X0LEfQVNw4YI+AueXJS
 z6/BCifpw7AU1u93ia7LqPxDX39fu+w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-CPpWELH6OAuCSfPWSi-UXg-1; Mon, 24 Feb 2020 15:48:42 -0500
X-MC-Unique: CPpWELH6OAuCSfPWSi-UXg-1
Received: by mail-wm1-f71.google.com with SMTP id 7so229506wmf.9
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKNOtl8y4WJnqPTmGJ+A9Z44KVpFXaN4HJISuiqMTmo=;
 b=n3xmhqFQW+Lxd89S+A38z9pkAMgORDFCNqqzyVOAqNvDGLjOVZHn3dbRMBlZcaxCU6
 w0Pr1a8JuGIpJABAF+b5IhVwdb/aHaFNnLYjtlwHR6yrrABAMxRXu/ZgVT/M+2MTOaY6
 Rw6Z/X7afl/1TJxoGx1gGD3asjrOvgv4Vcp7yiS1e/XktWMgehdLj87aJYiLkyX1J8IV
 qwc4OAvyOldKrGHgmNppQesabH3/SDWw+kfNnDH+o3iJM9dBc6Uquyj+7fFP1uO1gG2Q
 JF4NP5q+BMhyyGEMr0lN2gtWlF+xotFYXwQnr8lbDuUeT5Oq1u3+/t4Mnb3UFcU8VZMy
 FuwQ==
X-Gm-Message-State: APjAAAXnn+5pJVrbtJBT0BsHaixAbagnewnTi1yflzoY6Ckop+tm/YQp
 nR6M6gL8UMTHdbtaP6EP3IWtshuDfernKcECFjS/lJyYRYZHCOsZC01Pw6V7iaHvwH2BrF/sFyE
 LkCs0eq9UXN2q2yE=
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr69172205wrt.343.1582577320912; 
 Mon, 24 Feb 2020 12:48:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4MCZfRxgscfc/5ZSigtanCe63LnJ5kZKwhRv/zQemHwh1Jrdht+paqBfLCcFYfOZJBrKrrA==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr69172166wrt.343.1582577320715; 
 Mon, 24 Feb 2020 12:48:40 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:40 -0800 (PST)
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
Subject: [PATCH v2 04/32] scripts/cocci: Patch to replace
 memory_region_init_{ram, readonly -> rom}
Date: Mon, 24 Feb 2020 21:48:00 +0100
Message-Id: <20200224204828.23167-5-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:49 -0000

Add a semantic patch to replace memory_region_init_ram(readonly)
by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../memory-region-housekeeping.cocci           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index 3699c1017e..ee3923d369 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -11,6 +11,24 @@
 */
=20
=20
+// Replace memory_region_init_ram(readonly) by memory_region_init_rom()
+@@
+expression E1, E2, E3, E4, E5;
+symbol true;
+@@
+(
+- memory_region_init_ram(E1, E2, E3, E4, E5);
++ memory_region_init_rom(E1, E2, E3, E4, E5);
+  ... WHEN !=3D E1
+- memory_region_set_readonly(E1, true);
+|
+- memory_region_init_ram_nomigrate(E1, E2, E3, E4, E5);
++ memory_region_init_rom_nomigrate(E1, E2, E3, E4, E5);
+  ... WHEN !=3D E1
+- memory_region_set_readonly(E1, true);
+)
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
2.21.1


