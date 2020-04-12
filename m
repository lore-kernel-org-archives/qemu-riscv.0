Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlIo-0000jd-Rg
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIl-0000aK-T3
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIj-0005lA-PX
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIb-0005ag-LN; Sun, 12 Apr 2020 18:41:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id a201so8022464wme.1;
 Sun, 12 Apr 2020 15:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZt0wKgOcXbd9J2Y1x7+Xq5w37mnJzb6ovGxsczGG64=;
 b=Ff51tXSFzMGTVB6OFe8osL8ONzouppYDRkA2PIv3gsEFbZbh7q8ABs7ytxaJIG5bbl
 SaeJtifskcrkTRvldi2nu7JOj/G4UcSLaf9/ndJ1pJfvdSERV6BQfA75byp+mF6y7ASz
 gCTdoWdE686ZrX05sirXkyRY3oos7DODVumfnk8QpvNUGUXQRLrb6NYO9McQKJXnymy2
 f52qr55WLRuifIiwUdlcd1pq7FwLSH15YMqbRtbBdqzlBN5fFhP2pTRiTGry+FUQVQEQ
 eef+vFNbz+swgk4Mz7sg/TXs4q+tKZ6oCpJ62G7WbY8Y1YDssqlqMgpZX9hd9tkLQ3Ja
 3GfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LZt0wKgOcXbd9J2Y1x7+Xq5w37mnJzb6ovGxsczGG64=;
 b=Tk7Gm0L16z/EsYGQHEIEL66TYQg3iSFoOiXPwus5jKz+RcUuxYSw5FhDrt5ljcpjXe
 9jk1PDBwPq6jOaW2J/wT0URj1OaHg3P7pyj7QOU5hoWKEtzzLvhCAt61hzIE6oIh1lB9
 EXfi4+T3t9ZuzGt1NjKbu0H3r9EJjWb3k+7nW46BGgfJp3CaZ58z+004AyWI1QXph/rF
 prLbxFL3fhFjqCRwIt9QbI2N59AvIbf4IMlPRQYRL12VJHUd+sMasNEe0Uyd2t8AjOxH
 gDLMfbEte16aBSGoRRIzIuljmtkZE4ElN3H97INFFmydp/PuuqPojP0VGMs5hUyCFKbo
 TOXg==
X-Gm-Message-State: AGi0PubCiH1PKtgA6zKfIsgXXQcfFsWgd1CHrURFVTiNhOcpYImzfDDG
 i6XCNankBCAN/58+A1/wOT4vyyNJ/T5nSw==
X-Google-Smtp-Source: APiQypL/eTMuhBIW7cJJft81oZJNUAucSomY9Qu5NwW35Awp1q6yAaZ8cPQZMSNMkHpIPuRZhpyEJA==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr16506355wmm.174.1586731316198; 
 Sun, 12 Apr 2020 15:41:56 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:41:55 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 02/23] hw/arm/fsl-imx: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:23 +0200
Message-Id: <20200412224144.12205-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:09 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx25.c |  6 +++++-
 hw/arm/fsl-imx6.c  | 18 +++++++++++++++---
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 6f1a82ce3d..3d87fe867e 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -295,7 +295,11 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
         };
 
         object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 6bf8aa0404..b3cef5bb57 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -359,7 +359,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     /* USB */
     for (i = 0; i < FSL_IMX6_NUM_USB_PHYS; i++) {
         object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
                         FSL_IMX6_USBPHY1_ADDR + i * 0x1000);
     }
@@ -372,7 +376,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         };
 
         object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX6_USBOH3_USB_ADDR + i * 0x200);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
@@ -430,7 +438,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         };
 
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX6_WDOGn_ADDR[i]);
     }
-- 
2.21.1


