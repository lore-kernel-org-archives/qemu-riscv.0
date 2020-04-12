Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEI-0007Md-NI
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEG-0007FS-7p
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEE-00030p-W9
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55732)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlE5-0002uo-3k; Sun, 12 Apr 2020 18:37:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id e26so7922203wmk.5;
 Sun, 12 Apr 2020 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLajudUBTjPPEHDWHNc0MGZvDpG60cDj46wJF9MFpFg=;
 b=fhUjf2lC31hWvhQc0jfLtI9F/BIZ5VIR2Wq6tohOk81zDbrOll+RxbdwOLBS8vjr5k
 yG/GeGp43DkcM1phJoDP23wccdizGpVjXQYiuhJSdAUD3VJTPcojeJuatp9RBnozjK/E
 fZ6U9XKVSWbBn40dI3QcxHpKHmfd3bvnUkJuh6wqttFw8RyUoemfeweYSb8ONBk8idkA
 iO4Vx2BLKOAcUFyuqoK1aNXDP3nt6U21iiTkJXT63QNjRIuY4BeNp9b4sCuPIUyNULcz
 swsGBRjHj6dOXWrT856nZoeLpI59WFK5Iiw8eVsD12GDDMh/4gOeacBZDrngXmrHXR6D
 Kkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cLajudUBTjPPEHDWHNc0MGZvDpG60cDj46wJF9MFpFg=;
 b=mci4jD2MoHTLyfMt653Zq+LYIZ+c03O8uP9bRXWpyDfQca6PdUbEI8wl+nMECYqWbZ
 B9pzsArkvOQaWQSyN9xXO5vzenllhE+jz50nmjc+dBlSco9G2xk/Z6vdptetZmbM0cnP
 7XIhiQnsXk+LO0SM7vn769fLlE7q7aZPELL14z/qgSzAxtNESQelPGszauONssrAmZ+K
 Ov0Zl6Pq9HY//IHVP+edwF9xELZ0fAXhMiERbDJtyCk/IlYtfR1OBGbOyA8GeQqrU/pg
 L3hoDbPGxFQVq3ZkPUPq5pIeesUEFQY4OLKeDacute9z1XQ7+e+4ddHR2L1Zm4LhZZY2
 dpqA==
X-Gm-Message-State: AGi0PuaPiGqQ4DUBYcIEtdHqBhcxktkenghg1VzopcfA0b9YDLe38DBy
 47M4mFPWkgx8xq4wlWHNlXxMcHs+4+TYeQ==
X-Google-Smtp-Source: APiQypKWzqoDEL0XMAg15Qo6HwT/t7hmIuiC1g78CIeCyAqNrwg049tayE2VNwVBP5Qtls+8mUxBkA==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr13491389wma.30.1586731035721; 
 Sun, 12 Apr 2020 15:37:15 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:15 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 15/24] hw/arm/xlnx-zynqmp: Split
 xlnx_zynqmp_create_rpu() as init + realize
Date: Mon, 13 Apr 2020 00:36:10 +0200
Message-Id: <20200412223619.11284-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:29 -0000

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/xlnx-zynqmp.c
  EXN: Coccinelle_modules.Common.Timeout

We are going to manually add the missing propagate_error() calls.
Some functions can be called at init() time, reducing the need
to add extra Error checks at realize() time. Split create_rpu()
in init() and realize().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 43d57fa7de..457057198a 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -173,18 +173,9 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
     return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
 }
 
-static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
-                                   const char *boot_cpu, Error **errp)
+static void xlnx_zynqmp_rpu_init(XlnxZynqMPState *s, int num_rpus)
 {
-    Error *err = NULL;
     int i;
-    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
-                       XLNX_ZYNQMP_NUM_RPU_CPUS);
-
-    if (num_rpus <= 0) {
-        /* Don't create rpu-cluster object if there's nothing to put in it */
-        return;
-    }
 
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
@@ -192,13 +183,25 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
 
     for (i = 0; i < num_rpus; i++) {
-        char *name;
-
         object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
                                 &s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
                                 ARM_CPU_TYPE_NAME("cortex-r5f"),
                                 &error_abort, NULL);
 
+        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
+                                 &error_abort);
+    }
+}
+
+static void xlnx_zynqmp_rpu_realize(XlnxZynqMPState *s, int num_rpus,
+                                    const char *boot_cpu, Error **errp)
+{
+    Error *err = NULL;
+    int i;
+
+    for (i = 0; i < num_rpus; i++) {
+        char *name;
+
         name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -209,8 +212,6 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
         }
         g_free(name);
 
-        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
-                                 &error_abort);
         object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
                                  &err);
         if (err) {
@@ -228,6 +229,8 @@ static void xlnx_zynqmp_init(Object *obj)
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
     int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
+                       XLNX_ZYNQMP_NUM_RPU_CPUS);
 
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             sizeof(s->apu_cluster), TYPE_CPU_CLUSTER,
@@ -290,6 +293,10 @@ static void xlnx_zynqmp_init(Object *obj)
         sysbus_init_child_obj(obj, "adma[*]", &s->adma[i], sizeof(s->adma[i]),
                               TYPE_XLNX_ZDMA);
     }
+
+    if (num_rpus > 0) {
+        xlnx_zynqmp_rpu_init(s, num_rpus);
+    }
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -300,6 +307,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     uint8_t i;
     uint64_t ram_size;
     int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
+                       XLNX_ZYNQMP_NUM_RPU_CPUS);
     const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
     ram_addr_t ddr_low_size, ddr_high_size;
     qemu_irq gic_spi[GIC_NUM_SPI_INTR];
@@ -458,9 +467,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                     "RPUs just use -smp 6.");
     }
 
-    xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
-    if (err) {
-        goto out_propagate_error;
+    if (num_rpus > 0) {
+        xlnx_zynqmp_rpu_realize(s, num_rpus, boot_cpu, &err);
+        if (err) {
+            goto out_propagate_error;
+        }
     }
 
     if (!s->boot_cpu_ptr) {
-- 
2.21.1


