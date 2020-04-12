Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlIr-0000rV-DY
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIp-0000kp-4Q
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIo-0005rc-2e
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:11 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIg-0005dJ-4x; Sun, 12 Apr 2020 18:42:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id r26so8425330wmh.0;
 Sun, 12 Apr 2020 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=VwEg30j7okioBqC5v8hh9XNEyUEYRALhR2q0/MnYPPK7LyE21JtGuoVyV0NXjAsDeE
 W0GWYtStFWWOKyZkl28oxnjsb+pz1XWK8VGcezDQtttU1Z2u4eW7JmomrUMR1yn1xd7V
 7TUs03mj9nF0gln12G0GI1j2sRegPQRLnT9sV8y5/ZYayK5iopYAmkss4rLodYk6oquC
 9zIXcsbvPzZ24mWl8pJ1g21LbigEV95opjpkBNSPTFSsv74W6D4h0A1egoFrSTogUnbH
 rY6YggXdoxYCgblP5ptbe3tCwVzNu8aitBsCiTyQpnjxL9jaxPnumnNLiglUlr1WYBOY
 YMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=pk9yVtD4O0vmbl5a5fapNyE5mgLvk9WJamnTcsIl2Rz69c5zgftxA8QX3BtvVKUu96
 mTB+7fK+Gq5IPQRXmeUNFae5lnPJ2hyKjNDNN9i9rvU0Uu9ALsUfoRjZlDPcsgSltiAb
 YYHbXE1ZQ/pMpRO5soR6tjq+QLdbf7LsHzNsLPkIXz1F4MJa88UPOm+jpHN14FqqJi3q
 oX6M4ypD9znq1s6uJ8lpH0KefbC7uDHeE2F0/pJ958o24jSl4HDQcLaYWbzuHZ0X0y+N
 nUeqJ4z3VtmhXpc64x+nQWV7MYsSj0tZ+4aWimDyPb1IrhfvabPbegfocE/bQa5WtJrc
 OZHw==
X-Gm-Message-State: AGi0Puavvl2hGEh8msiyObLGOsOn1zPv9GG4EczDMCgjfCmwwHJyaTiH
 1d7SnUB2nGRVTU1pb6kndY82FMX2hITMbQ==
X-Google-Smtp-Source: APiQypLoMBgMjMAYgxmiv9CulGiG8SVPdmk9LQbOeIgOFsyfMFuYuaEPw4YCKEiXsvWsgIeveqjkwA==
X-Received: by 2002:a1c:1f8e:: with SMTP id
 f136mr15479105wmf.166.1586731319651; 
 Sun, 12 Apr 2020 15:41:59 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:41:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Michael Walle <michael@walle.cc>, Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH-for-5.1 v3 03/23] hw/arm/stm32f*05_soc: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:24 +0200
Message-Id: <20200412224144.12205-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:12 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 6 +++++-
 hw/arm/stm32f405_soc.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 76b0b0e9be..b1be4fde40 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -106,7 +106,11 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 4f10ce6176..2b8a84a695 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -121,7 +121,11 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(system_memory),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.21.1


