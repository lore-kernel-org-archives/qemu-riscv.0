Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlIv-00011v-UH
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIt-0000wm-D7
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIs-0005ud-6B
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:15 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIk-0005gp-Aa; Sun, 12 Apr 2020 18:42:06 -0400
Received: by mail-wr1-x443.google.com with SMTP id f13so8503285wrm.13;
 Sun, 12 Apr 2020 15:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVvHZN6pNMjS63zKUqHDX/HjbfNz01Q6piyIEWw/Gxw=;
 b=SeWVKbwkgCy1BfFAupgKAptkoWp225ePEX6YbcwRFzXjPK5YvyONEJhUB7ssQiKcDs
 lw4JCUxaH8WMKS9HaTLgUVjNXDbPbg9NZ18suZeHdepD2EvWOc/MPgBTnqJ5MYi/CpBa
 yy+6vjx0XcJK2DE3u/7PduHCUxUmIPoz24qL5LUtzghFjBjddMyaa+wEivDVutSqEBlC
 9WBoZz8r73DtwdjskMW+OOzilMyT8oTyz+j3Wg4da6X5gwq1lmeazM3qVpQ3XiqgleX6
 YXM9U7Jz3xjsfvVCdWIH9qXVM5QhEHQT7UmnhKxlDDvJ/ds2KJ7tK1X9Ztp68rqGiFLs
 g2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DVvHZN6pNMjS63zKUqHDX/HjbfNz01Q6piyIEWw/Gxw=;
 b=gzs/qoC3/20IPNaJBcECxYXHTQmVzJbRv+XoUvku1bF3RQ0DOkF1N5MoVMtcmWmCEa
 z4Ag71YQiP6NbQ6QHjBKPHxPbmdnYzl63mKGm0gE3ScMPvUm/bkqMJyfuaOwDSilYde4
 KOXhkx/m/ZQJyo44Hx0sTl7l85M97hPmoofrnaZsJN80mCUrcBtclGLZ6WVQson+9ltm
 uGUDu1qHB2K4oKvfJqkfSQwahA4cyO7kpIk6f+DQRuqxC3BuNfB9xVFzcUL5P13lZaN7
 Rt7VKjPoQR5TxvCzTYAWY4IwR8gg5QFgc9FDZjLGGocBO0JlwNEH3EaEBr8iGO9qGeQ+
 nnSw==
X-Gm-Message-State: AGi0PuYCPfkt8dxC9/WGs34BXhPXLG+wCnACEhLOB6v2eijf8/6K+cjY
 XXsNaoKvjX424Zn9hq5vL1u7vBWeUZaUgg==
X-Google-Smtp-Source: APiQypKvvhg/w+kNNCyhw7xzlfIZoPq1EThd4RvWrquNW2z7JK8BUGVCtlqvz3lgKi0NUPBzkWujwQ==
X-Received: by 2002:adf:9441:: with SMTP id 59mr15576166wrq.211.1586731323017; 
 Sun, 12 Apr 2020 15:42:03 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:02 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 04/23] hw/arm/aspeed: Add missing error-propagation
 code
Date: Mon, 13 Apr 2020 00:41:25 +0200
Message-Id: <20200412224144.12205-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:16 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++++++++++++++------
 hw/arm/aspeed_soc.c     | 12 ++++++++++--
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 64512f95c9..504f540369 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -277,7 +277,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         if (s->num_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]),
                                     ASPEED_A7MPCORE_ADDR,
-                                    "reset-cbar", &error_abort);
+                                    "reset-cbar", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
         }
         /*
          * TODO: the secondary CPUs are started and a boot helper
@@ -293,10 +297,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* A7MPCORE */
     object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cpu",
-                            &error_abort);
+                            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 
     object_property_set_bool(OBJECT(&s->a7mpcore), true, "realized",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
 
     for (i = 0; i < s->num_cpus; i++) {
@@ -343,7 +355,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl),
-                             OBJECT(&s->scu), "scu", &error_abort);
+                             OBJECT(&s->scu), "scu", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -459,7 +475,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
 
         object_property_set_link(OBJECT(&s->wdt[i]),
-                                 OBJECT(&s->scu), "scu", &error_abort);
+                                 OBJECT(&s->scu), "scu", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
@@ -490,7 +510,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                            aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
 
         object_property_set_link(OBJECT(&s->mii[i]), OBJECT(&s->ftgmac100[i]),
-                                 "nic", &error_abort);
+                                 "nic", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->mii[i]), true, "realized",
                                  &err);
         if (err) {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4ee991ec16..1762c7aebd 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -301,7 +301,11 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl),
-                             OBJECT(&s->scu), "scu", &error_abort);
+                             OBJECT(&s->scu), "scu", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -398,7 +402,11 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
 
         object_property_set_link(OBJECT(&s->wdt[i]),
-                                 OBJECT(&s->scu), "scu", &error_abort);
+                                 OBJECT(&s->scu), "scu", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1


