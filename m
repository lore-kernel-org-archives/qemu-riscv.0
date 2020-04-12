Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJ6-0001Ww-Nw
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ3-0001Pk-UW
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ3-00063G-0k
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:25 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIw-0005yo-Pd; Sun, 12 Apr 2020 18:42:18 -0400
Received: by mail-wr1-x443.google.com with SMTP id d17so1634141wrg.11;
 Sun, 12 Apr 2020 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=siCEjIHDD7HMxh4IxS5LlIjGg2cHeis4GeHzcv0NZEd05t+44glLDFXzjnhEgGdKrK
 QNFLZuYqlDaOYEAwR8wPyuaQ/MzSzcAvI1MK4eODswr/M1mFJOqJcrcig2XYb3EqsD7/
 XNGH5dq8cxwQUkrGO39iUEmIzGNpZtIjTlkGzQD90aigcGn+AniKHUmTsCFY4/mm+9vl
 l6dWLyhK+3sjpBVLN2MDBwv/mu/sQv0DM441GyRbWnlvbsrf61jm85H8n/TIZYGYHQ4t
 DJG5dtAWoZgx1h4M+vwYr27SMW3LTCAZLxfRzVLVcceL4vtv7LM9mQyZqznXrdT0a9R8
 KfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m8ZDXiD3nFiP7GdGwQTV0ex2VskQyj/RhxvXu9V538w=;
 b=WZNW50qhgNXh0JEVBldTQpQ1u1j/i30mG85DPCvQrkUn69H75fZT9hAXGt7BjNw6B1
 9F1QcbkWE+fqE5itrsafU2TL2HLDEcGZFT08HCY4SU5mTWw3d1YUAAFEAh4J/fgVfqIF
 tkZ2qaQfLDiAoFoPUFTNiwLSn8bPd10pq63AtV017Hckc9AuGnbwMLh967o2XAn9J45r
 DhjzFuAmJzM8kGVNqZbdga9FMUTr8ywi/t9j3ahFpuw4KXGHEm+iTxFr8WObCFuy7ofO
 Mpll3Ex5Gizte+vyI1HypWbSbovx+1wIasJGQsua5sgJAuIqSKeKEWVQoX2+r0FXAKWd
 hH0g==
X-Gm-Message-State: AGi0PuZ/APNgr7i6II4vMgoFsSZdMUm08D6d8olwfQWuxCCLVHqFHX1S
 KDAk0nTJxxdauhrNLwN3hcnlJLXMV1gdgA==
X-Google-Smtp-Source: APiQypJNvCx3ya+uEetc5CRWYwAwiOiz9uC7PQFTCGgsNZU5737WZHFoI+MEnhxwKZmpOYdbKKrg8w==
X-Received: by 2002:adf:f986:: with SMTP id f6mr157751wrr.221.1586731336548;
 Sun, 12 Apr 2020 15:42:16 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:15 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 08/23] hw/arm/armv7m: Add missing error-propagation
 code
Date: Mon, 13 Apr 2020 00:41:29 +0200
Message-Id: <20200412224144.12205-9-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:27 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 7531b97ccd..249a7605f6 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -168,7 +168,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
-                             &error_abort);
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
         object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
         if (err != NULL) {
@@ -256,7 +260,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                 return;
             }
             object_property_set_link(obj, OBJECT(s->board_memory),
-                                     "source-memory", &error_abort);
+                                     "source-memory", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
             object_property_set_bool(obj, true, "realized", &err);
             if (err != NULL) {
                 error_propagate(errp, err);
-- 
2.21.1


