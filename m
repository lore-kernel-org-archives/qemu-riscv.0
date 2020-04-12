Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEK-0007Qu-3g
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEG-0007HY-UB
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEF-00031E-Os
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:28 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54908)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlE8-0002wl-7x; Sun, 12 Apr 2020 18:37:20 -0400
Received: by mail-wm1-x341.google.com with SMTP id h2so7914546wmb.4;
 Sun, 12 Apr 2020 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VuVWzBfpjz6H0HCIF1s/Heqg2exv+JQ+H2vwU4p06Wo=;
 b=f4h0TAvNfsqrudSKvetIzFeOKI3Mm7ul8tSs4BXylq9EZam7VrYgdFSM23ZR9dmCZO
 JjXMx0CoZPEF7YgSs7zcsr5gkYxxzslClRq2JI+9syCPg2cgo+jDd1O0Ilx9bLmh4yPU
 Cp4FZJulgOMk/IAKxOb154sBFRa0U1Jr7NKtRaloX4nAQPnMdXa8ufRESoX3N2HX9oT0
 ph/JhnkcOIQ8seDCKhaW7spnYVy19Y80OO8QyZUDfDpiBolKDNZXWDdxi0j1jh3P74kN
 08nXKIiYlj4p4CCPC+iwlXC6/WzeewZff3mj+lwKdRdEzXMI3WwX6ZAL4s48xtsVqzmK
 OWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VuVWzBfpjz6H0HCIF1s/Heqg2exv+JQ+H2vwU4p06Wo=;
 b=SfQcUDv0R+Z6MW7BDxwsGiaXiSJ7mRnIpkJFBIu4QKdQIHWhBPaa/R6Nl1+GBM7CVN
 Gjc6aS44V6A1GevznMLacufDML1hDHMZUpyl7ooXKhEeGk0fxkBTefe25LWDumuZ++u3
 xhZTBuZrrpYkJ5ZCT/G+k4vdUmQEjKEzK/eY1osrOkGg3ZnUi8TXBs8lFH+30ngWrFKo
 5qm/rGlvosnQmUpmQRep5rg7833R7WMc/9HcP1CJOTN0VFIcZWpiJUG3ptmftVlbzdjv
 kYxMGYpokNZZnqDSxL+laB4obPWlfz+fqTwdblsWomemxpD4aHeAs1fqIcH2ERJ3RY9w
 EG5w==
X-Gm-Message-State: AGi0PuYWoAxD/TUvigrACX59U2QPSqJhm3Pym7TbqRDXeHV7E128swGj
 lJcNRNFRIZK5yzn/vbyRxyN1ytHFcY3fNg==
X-Google-Smtp-Source: APiQypK6lOUi3RaPIYFNsB3DpYTZGpWRBCr/hmLS1rLJoGKmpyvdFZraFuIAbo0ecycmXM4x+IQdXw==
X-Received: by 2002:a1c:3884:: with SMTP id f126mr121709wma.91.1586731039078; 
 Sun, 12 Apr 2020 15:37:19 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:18 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 16/24] hw/arm/xlnx-zynqmp: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:11 +0200
Message-Id: <20200412223619.11284-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:30 -0000

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/xlnx-zynqmp.c
  EXN: Coccinelle_modules.Common.Timeout

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/arm/xlnx-zynqmp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 457057198a..5ec9c24ee7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -242,6 +242,11 @@ static void xlnx_zynqmp_init(Object *obj)
                                 &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
                                 ARM_CPU_TYPE_NAME("cortex-a53"),
                                 &error_abort, NULL);
+
+        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
+                                "psci-conduit", &error_abort);
+        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
+                                "reset-cbar", &error_abort);
     }
 
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
@@ -250,6 +255,10 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
         sysbus_init_child_obj(obj, "gem[*]", &s->gem[i], sizeof(s->gem[i]),
                               TYPE_CADENCE_GEM);
+        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revision",
+                                &error_abort);
+        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
+                                &error_abort);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
@@ -259,6 +268,8 @@ static void xlnx_zynqmp_init(Object *obj)
 
     sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
                           TYPE_SYSBUS_AHCI);
+    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports",
+                            &error_abort);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci[i],
@@ -370,9 +381,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_apus; i++) {
         char *name;
 
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
-                                "psci-conduit", &error_abort);
-
         name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -387,8 +395,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                                  s->secure, "has_el3", NULL);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]),
                                  s->virt, "has_el2", NULL);
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
-                                "reset-cbar", &error_abort);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), num_apus,
                                 "core-count", &error_abort);
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
@@ -490,10 +496,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
         }
-        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revision",
-                                &error_abort);
-        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
-                                &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
             goto out_propagate_error;
@@ -514,8 +516,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[uart_intr[i]]);
     }
 
-    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports",
-                            &error_abort);
     object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
     if (err) {
         goto out_propagate_error;
-- 
2.21.1


