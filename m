Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlIy-00018I-9M
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIv-000102-4W
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIu-0005y0-35
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:17 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51409)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIl-0005lt-MX; Sun, 12 Apr 2020 18:42:07 -0400
Received: by mail-wm1-x343.google.com with SMTP id x4so7944028wmj.1;
 Sun, 12 Apr 2020 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmelmK+74hZzKF1Ju2OEtzPp85pYogzLjVOdCh3WjgU=;
 b=L284uUWQdVDPw2IQ2bd+/tlSTLI4vyVysyhHVO3o6dBMbjorw3dxS650t6mPU/Sl9+
 Ws4husx/2DpuH+8AomDjrRuDsjdSP5xXAa8LABnXECWRdMifV7lFadX2h+zhHVSjlPj6
 n1yD9LVt7g2SON6evL3IKLQ1YfyQkCD0PrS43BBWiP+VUosrFZBeIyvn+ahjdwrIs/5Q
 oSf476BWlPve0N04a2TgHt+/j77cFI1dgyZN84fBwhaCwZF0qwEaIM3Huqt4Ba+o7dJD
 5DCq4/PDwsFQsLVL9+9maOtXFE6tPfQxyp01ggprGh0ziE6muPUQjWR0jNGETD6iZPHi
 6opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pmelmK+74hZzKF1Ju2OEtzPp85pYogzLjVOdCh3WjgU=;
 b=qaipCUWVPclV7QlfYKH/36JhS1yJnENdmxDck6+8quq0CTXCxPxxOjQuHsZD/cWNba
 u5OFq8E6ztyQ8ONVYttYKj/qlHp1hni31QsPl+6WDIGyEBc9duWS+/KQ1rLBl/3QH72Q
 UbgVWteWW8vp/ujmmrL2CMV2m0dw5V15Q5m6KTMzg/Hy64TynqfFWEJgIPhi7PjLipBs
 QEBZswSvLDugDWNEQyqchbEehm5dG/b8+M9S20mpLCAh1fSzL68ZRFogosCHApgzafeC
 IdsEO5HFw2VBB2iBzfe9Sl14n/vn5KrvVgpoDmJgAaS/YuWJ+pgXG6nBRTfE/Fl+6Hh7
 ldLw==
X-Gm-Message-State: AGi0Pub4Z2000MaUB67UB9HRR2UEVYJtaDmWtvNmbuX53+bB+yUQw/HL
 unBJb/9Au0XZX8TLN3ojMn3d12NIugjZqQ==
X-Google-Smtp-Source: APiQypIepOoCeFLOezrWB1hJWJWNl5b3nBNXtg9LWUKUMKZGRFqtf9yO0rHqlas6fvwRt/hh49Nz7A==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr15866438wmi.88.1586731326418; 
 Sun, 12 Apr 2020 15:42:06 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:05 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 05/23] hw/arm/allwinner-a10: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:26 +0200
Message-Id: <20200412224144.12205-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:18 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/allwinner-a10.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index f41395734a..db70aa2b88 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -158,14 +158,22 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
             object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
-                                     &error_fatal);
+                                     &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                             AW_A10_EHCI_BASE + i * 0x8000);
             sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
                                qdev_get_gpio_in(dev, 39 + i));
 
             object_property_set_bool(OBJECT(&s->ohci[i]), true, "realized",
-                                     &error_fatal);
+                                     &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
                             AW_A10_OHCI_BASE + i * 0x8000);
             sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
@@ -178,7 +186,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc0), 0, AW_A10_MMC0_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc0), 0, qdev_get_gpio_in(dev, 32));
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->mmc0),
-                              "sd-bus", &error_abort);
+                              "sd-bus", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     /* RTC */
     qdev_init_nofail(DEVICE(&s->rtc));
-- 
2.21.1


