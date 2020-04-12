Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEN-0007c5-O9
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEK-0007TM-Pt
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEJ-000349-Md
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEC-0002yU-Cj; Sun, 12 Apr 2020 18:37:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id 65so8551064wrl.1;
 Sun, 12 Apr 2020 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBPwBn0xX7ZfnJO2pzvcTNAKfUhOrwNS7+yPtW8R83c=;
 b=jNnXVr4dG8viVg5rnzek32dtSW+BUhYeWkjBZ1Mts3oswQKVJpYJSb/a3xUDXGOCHA
 vcTj6IJgDVnClFLHZI6JYhj/0yWcwWE5bwqhuYu3R2xBF22KXJQQ7rCplx+QcIW/89cE
 +BBKNJ+F0zGh50S0fWJK5JqOjte0vczOmySWvgwDpImSOtGO6XoDmS35/miuuVCFR9MA
 lqgoD0i+oyqkV37MYYRKl9YG74lI7L5g2KgeKZzmMeu5Rd20XFJixQcSpiyV7WNjzXhZ
 HbTCubxFxkr3840pYFRaml02B4DpvRlESXmoIRqexkla676H2NRa5QvhYFZB3zKEwYbi
 +75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VBPwBn0xX7ZfnJO2pzvcTNAKfUhOrwNS7+yPtW8R83c=;
 b=nJoAx+l0mRuhOUd73eTLe0xdvJeL0eebz34GaMYM0JEuh0p/djsqc6GfW3gnLOnzHG
 xQWWq/tOjfGbLOJeuRpFga5MCvNJ+29msvKATa5+zCIOYOnNoogLbfN86lHPc7DTVHE3
 dLQ6kf8k5/ClAWscHbnN2C7CmUZGiCTYFRPKxNhHuyVtCW3nrOLAjANB55PeHl/COGXX
 TrblDfCj7iZzPqkb4exPk8hqn7NuLzi/0O8qFpjmJnM6oXGR6qX3NnFYBHmE1dxM7dxr
 yoGONslGvUhkU7VWp6LkgOyL0+CCrINa+cI0qPmtjEm7u0BMl9K/QQ+JDxm9hSWLmG8n
 jKQw==
X-Gm-Message-State: AGi0PuZTKtCldAhE6/qsMaU5/lHJcP13klZlk3IuQcjGLqSRsGcEb4BP
 OqeOWsLuWgkUSr2AUGLUk6zaaHqi5EeUDg==
X-Google-Smtp-Source: APiQypKYGpzF10hEF4QttQt6RwdkGIqdgLe8usUiHKfLGHbyDGEYP3t/OT3l++yL/qjDLFBwfOLQ3w==
X-Received: by 2002:a05:6000:104a:: with SMTP id
 c10mr701199wrx.254.1586731042243; 
 Sun, 12 Apr 2020 15:37:22 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:21 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 17/24] hw/microblaze/xlnx-zynqmp-pmu: Move some
 code from realize() to init()
Date: Mon, 13 Apr 2020 00:36:12 +0200
Message-Id: <20200412223619.11284-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:34 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/microblaze/xlnx-zynqmp-pmu.c
  >>> possible moves from xlnx_zynqmp_pmu_soc_init() to xlnx_zynqmp_pmu_soc_realize() in ./hw/microblaze/xlnx-zynqmp-pmu.c:79

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 46 ++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 028f31894d..2aa602cf85 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -63,24 +63,6 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 
     object_initialize_child(obj, "pmu-cpu", &s->cpu, sizeof(s->cpu),
                             TYPE_MICROBLAZE_CPU, &error_abort, NULL);
-
-    sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
-                          TYPE_XLNX_PMU_IO_INTC);
-
-    /* Create the IPI device */
-    for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        char *name = g_strdup_printf("ipi%d", i);
-        sysbus_init_child_obj(obj, name, &s->ipi[i],
-                              sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
-        g_free(name);
-    }
-}
-
-static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
-{
-    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
-    Error *err = NULL;
-
     object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
                              "base-vectors", &error_abort);
     object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
@@ -99,18 +81,36 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
                             &error_abort);
     object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
 
+    sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
+                          TYPE_XLNX_PMU_IO_INTC);
     object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
                              &error_abort);
     object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
                              &error_abort);
     object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
                              &error_abort);
+
+    /* Create the IPI device */
+    for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        char *name = g_strdup_printf("ipi%d", i);
+        sysbus_init_child_obj(obj, name, &s->ipi[i],
+                              sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
+        g_free(name);
+    }
+}
+
+static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
+{
+    XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
+    Error *err = NULL;
+
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.21.1


