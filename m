Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEO-0007fK-QR
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEM-0007Y8-D4
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEL-00035E-Bx
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:34 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEE-00030C-Kp; Sun, 12 Apr 2020 18:37:26 -0400
Received: by mail-wm1-x342.google.com with SMTP id g12so530137wmh.3;
 Sun, 12 Apr 2020 15:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EG1vhq7sjTB9ZSXWfgY7jLuzjsnK7wuhdMzV+BgTOM=;
 b=MsQvQjdOJctQaymMWzuHiIEE+lE19kYquiqYVPI8ArMQyMfUER4XHw9x6BuSyOtNKf
 lA/5a8DhdoV5UNUtzgCep+8KE8mnzFH9fThKoND+pqiF7rRm9vc0Emwo62vxbEmp4qkv
 Jk6v8A6jQHxVB0IseXpPtlnCeqj8194nNLq4BMLAVJ7XIR8RAOh0ZNgmi/NYXfQ5RVu5
 WQbnkElC2a4G+SJ2xRVbwKuokBS06ka+XYcwMunG53+1xCIM8EluyfK11rvsgbD7rmgj
 OJtcJxK6F9aKsAAA5PCU9ov1lOHTmUfxBulafyYFH06Xgvq60924wzckwO22Rt9vgUmQ
 ASdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6EG1vhq7sjTB9ZSXWfgY7jLuzjsnK7wuhdMzV+BgTOM=;
 b=TU1a1j5JI2JI1hO5NRdZ/jwAX9XSxcOGlwea1xc7vtr9sdnsfVDrISh6KqGufB6Y67
 BtH8H/1d+Tv2P85XwIWCU5ewlk5qGdV5w0ZKPaRJ5gPJ9qAKrEJGJ9XJyazFsLjUtPEE
 haZOqcwBeWLe3gIft9jMcrYDPr+ygqAMoas1K3clS6shiOMN7TX+T9OSyk6O2GAvFsfe
 pYqu2Bg2muRM3eBdGRqGNag647/wD83QWp3uTeTmcgFUN1PKPRh83zLCEaAW764fxvR6
 JShFOvEAPnn0QLBchJiYPkjRHUURXuACEa/BPYpDxt4rgQ2hT8YuWB3KbM8luK3QPfvf
 xFYw==
X-Gm-Message-State: AGi0PuYBjH/mBsCdf2uc/Xp9Wfaz7edKJD3axFJ560p12z5NmB6TfGTV
 dsH7yAgOOWejcnTmtEE04lQnLsxh7W+r8Q==
X-Google-Smtp-Source: APiQypJlLltEQFNE2vqF8ExiHlmy6ahTplWoe0ijPErKx9YJP0u0OJAAKYllEE0ddjztCeFBlLUyaA==
X-Received: by 2002:a1c:43c6:: with SMTP id
 q189mr15130503wma.115.1586731045453; 
 Sun, 12 Apr 2020 15:37:25 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 18/24] hw/pci-host/pnv_phb3: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:13 +0200
Message-Id: <20200412223619.11284-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:35 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/pci-host/pnv_phb3.c
  >>> possible moves from pnv_phb3_instance_init() to pnv_phb3_realize() in ./hw/pci-host/pnv_phb3.c:992

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/pci-host/pnv_phb3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 74618fadf0..57d717ed23 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -970,6 +970,8 @@ static void pnv_phb3_instance_init(Object *obj)
     /* LSI sources */
     object_initialize_child(obj, "lsi", &phb->lsis, sizeof(phb->lsis),
                              TYPE_ICS, &error_abort, NULL);
+    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-irqs",
+                            &error_abort);
 
     /* Default init ... will be fixed by HW inits */
     phb->lsis.offset = 0;
@@ -977,6 +979,8 @@ static void pnv_phb3_instance_init(Object *obj)
     /* MSI sources */
     object_initialize_child(obj, "msi", &phb->msis, sizeof(phb->msis),
                             TYPE_PHB3_MSI, &error_abort, NULL);
+    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
+                            &error_abort);
 
     /* Power Bus Common Queue */
     object_initialize_child(obj, "pbcq", &phb->pbcq, sizeof(phb->pbcq),
@@ -1005,8 +1009,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     /* LSI sources */
     object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
                                    &error_abort);
-    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-irqs",
-                            &error_abort);
     object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1024,8 +1026,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
                                    &error_abort);
     object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
                                    &error_abort);
-    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
-                            &error_abort);
     object_property_set_bool(OBJECT(&phb->msis), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.21.1


