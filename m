Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlDv-0006SJ-GA
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDt-0006Ls-Bi
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDs-0002l3-56
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:05 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDk-0002a4-Kj; Sun, 12 Apr 2020 18:36:56 -0400
Received: by mail-wr1-x441.google.com with SMTP id s8so8515793wrt.7;
 Sun, 12 Apr 2020 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6j0bhZZ4DXOIthIvcH8V/7teI/2Tb9x+JKEVdKazvPI=;
 b=eFlUd8YEqZR/79bEwbmGKECR8/EG2M4YzFCWq3LM08R0hHAPy+gzaCZAV03gn6/lAY
 jn+9+rtK4Xfimpyr4E8Qx9FsPUwPLRLggGi00zgpDTEL7bwTiDZhZ0em9A5UbtxwpSpj
 FZLJZXEE1waHPMxAD+KhRXVHtn7aoXnJbrm8Wts4dZ3xKncTCQWBTaiT3v8idWJBSlNJ
 tuv/tGTzoxre+aNodrp5aya19i1uidhDFCw7d/rMaI6xdgo/mwru/10anjgfsQJ8jPsj
 HxyKqY/GZMcHFK8a+XS3ET6vbx/itFfEcCNOreDuV7LSYsosLtYgGEXzX0kFpMDK2iVP
 YNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6j0bhZZ4DXOIthIvcH8V/7teI/2Tb9x+JKEVdKazvPI=;
 b=VEUEbUW/dC3w9XR+l93hEQJpl0D2iFWIQQLyG3rx+UPCqUiFhp5aJdE3ZulKg0z0fT
 A04go+1FnPa5sMj6WrEnFRYoIfJP52f0x8b82AS0sudMSF6K6k6WgHYLxec3YkkUiSA0
 g7Zxv94Gip+g3m2Ts199n/FKxSEGuIkZ/IP478QL6cMbFDSpYBMxFRuTxsSzzuSOoe/1
 p6iVhbTva5x9gl/WR1u24tJPXO5UJ7GuAhHk5x1FOHvCHKPADC2y/blKOOiueptKogB4
 PUWdgMT10o/0VdTxHWlh+JriO+2E4AK2+OP7RosFYutdGR1BM1mFJr4JnG3hT5m256NT
 AFiw==
X-Gm-Message-State: AGi0PuZFFm/50NMuNlgdTggoERF2fW0Ppn28oyBRtPPdOiZhNfvxosrv
 i2a2U1V1Xs99s2PHBHLu7E7PSYWKxaqf4w==
X-Google-Smtp-Source: APiQypKEjrLxX9i3bDjxv2a41yRjAhO0grt5Neq8gfpVkF/6bV2sC/1Y2A4snIazbnU+Ux5llElkPA==
X-Received: by 2002:a05:6000:370:: with SMTP id
 f16mr16595619wrf.9.1586731015348; 
 Sun, 12 Apr 2020 15:36:55 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:54 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 09/24] hw/arm/fsl-imx6: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:04 +0200
Message-Id: <20200412223619.11284-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:06 -0000

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/fsl-imx6.c
  Fatal error: exception Coccinelle_modules.Common.Timeout

While reviewing we noticed some functions can be called at
init() time, reducing the need to add extra Error checks at
realize() time. Move them. The coccinelle script succeeds
after this.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 3d37352b08..6bf8aa0404 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -48,11 +48,30 @@ static void fsl_imx6_init(Object *obj)
         object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
                                 ARM_CPU_TYPE_NAME("cortex-a9"),
                                 &error_abort, NULL);
+
+        /* On uniprocessor, the CBAR is set to 0 */
+        if (smp_cpus > 1) {
+            object_property_set_int(OBJECT(&s->cpu[i]), FSL_IMX6_A9MPCORE_ADDR,
+                                    "reset-cbar", &error_abort);
+        }
+
+        /* All CPU but CPU 0 start in power off mode */
+        if (i) {
+            object_property_set_bool(OBJECT(&s->cpu[i]), true,
+                                     "start-powered-off", &error_abort);
+        }
     }
 
     sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore, sizeof(s->a9mpcore),
                           TYPE_A9MPCORE_PRIV);
 
+    object_property_set_int(OBJECT(&s->a9mpcore), smp_cpus, "num-cpu",
+                            &error_abort);
+
+    object_property_set_int(OBJECT(&s->a9mpcore),
+                            FSL_IMX6_MAX_IRQ + GIC_INTERNAL, "num-irq",
+                            &error_abort);
+
     sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX6_CCM);
 
     sysbus_init_child_obj(obj, "src", &s->src, sizeof(s->src), TYPE_IMX6_SRC);
@@ -81,6 +100,10 @@ static void fsl_imx6_init(Object *obj)
         snprintf(name, NAME_SIZE, "gpio%d", i + 1);
         sysbus_init_child_obj(obj, name, &s->gpio[i], sizeof(s->gpio[i]),
                               TYPE_IMX_GPIO);
+        object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-edge-sel",
+                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-upper-pin-irq",
+                                 &error_abort);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
@@ -124,19 +147,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     unsigned int smp_cpus = ms->smp.cpus;
 
     for (i = 0; i < smp_cpus; i++) {
-
-        /* On uniprocessor, the CBAR is set to 0 */
-        if (smp_cpus > 1) {
-            object_property_set_int(OBJECT(&s->cpu[i]), FSL_IMX6_A9MPCORE_ADDR,
-                                    "reset-cbar", &error_abort);
-        }
-
-        /* All CPU but CPU 0 start in power off mode */
-        if (i) {
-            object_property_set_bool(OBJECT(&s->cpu[i]), true,
-                                     "start-powered-off", &error_abort);
-        }
-
         object_property_set_bool(OBJECT(&s->cpu[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
@@ -144,13 +154,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    object_property_set_int(OBJECT(&s->a9mpcore), smp_cpus, "num-cpu",
-                            &error_abort);
-
-    object_property_set_int(OBJECT(&s->a9mpcore),
-                            FSL_IMX6_MAX_IRQ + GIC_INTERNAL, "num-irq",
-                            &error_abort);
-
     object_property_set_bool(OBJECT(&s->a9mpcore), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -310,10 +313,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             },
         };
 
-        object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-edge-sel",
-                                 &error_abort);
-        object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-upper-pin-irq",
-                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1


