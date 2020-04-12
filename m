Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJP-0001k6-2C
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJK-0001hE-Pf
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJI-0006A3-15
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:41 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50925)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ5-00064w-QH; Sun, 12 Apr 2020 18:42:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id x25so7955571wmc.0;
 Sun, 12 Apr 2020 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bsGyQcFnOKVG+Bd26nlz77NXbYaghgLj/LaGKCq2kg=;
 b=eX1sHVHFuIK3nQOfDgpUI4eSHXXSXBdHrE2Z9B+eADHZ/Su7CQv7no+3Wm1oDu5hjP
 uCALayhitW3NdTg6VSgUDQdfK6Y6s0GIhAqQkRWrTm0lKZei3Pb+0iPWelRSp/ddF56S
 un0GGUF1lBg6V5w7dZtxOD5W7ae2uW9uLdqHMjpCewfzCJ2w3aF3Xbcix3QmliMISYeO
 dIx7VVZwCr5dZfan4td6wq8ay5fTtmOOiasgVZpML7BdJ7pBD5YfxWHMEfWH3vhocesW
 1dx0ennI7jU/H8qAkANDAYyv0nCvy0pHlJ+kq6Zs5jpzoKQfwMQ5xIf1BsqQirePWXFE
 Ds1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+bsGyQcFnOKVG+Bd26nlz77NXbYaghgLj/LaGKCq2kg=;
 b=uYMPnm3B3B1Mir5/sexGlx1lPoXXNmYjdt9J63nFU0l6grPN5T1P1LmLTpzRNEw/mx
 h7JhuDriK/rbM6jDCevHoZAdVpTjVf3actX1q7P/c3oGYp2dP0Kc4lSaD6GQePwzvkEw
 VGyAecasjY9U2y29OETJiann8/SSEa0U3eennYB0wxxMTptVE7kw+McYzlob58JnaOUt
 uuMfD8jU0eNhH7ty6sHTB/JXlD0RZXHIXL91H1ddV11vzCjELR2+w4qL/RxxMLUjzpl0
 iLQ4Mz6vB568Ckahw7GeMIk8KI/coCfjSDBpz7e5rOT1iupdYHMY0pFVGKKePfFxopiZ
 O+ag==
X-Gm-Message-State: AGi0PuZceENVL/QrxzPVZAiDr0tKafoFO0kOtm5reaWllj7QQeyGprbN
 pyFBk07c8vuymFXVu8n4nHVC/A1mHd15HA==
X-Google-Smtp-Source: APiQypJy6nrZ20qouIxhhJadf6rJyopc8CQfJ9vSJ/zY+LE7Gz78yYK16p3AmQnoUHG0sLRGSxOVog==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr7938056wml.82.1586731346690; 
 Sun, 12 Apr 2020 15:42:26 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:26 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 11/23] hw/pci-host/pnv_phb3: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:32 +0200
Message-Id: <20200412224144.12205-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:45 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/pnv_phb3.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 57d717ed23..a9029f5a02 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1008,7 +1008,11 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1023,9 +1027,17 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* MSI sources */
     object_property_set_link(OBJECT(&phb->msis), OBJECT(phb), "phb",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->msis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1034,7 +1046,11 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* Power Bus Common Queue */
     object_property_set_link(OBJECT(&phb->pbcq), OBJECT(phb), "phb",
-                                   &error_abort);
+                                   &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(OBJECT(&phb->pbcq), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.21.1


