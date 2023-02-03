Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0WG-0001ym-CH
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WD-0001nH-Th
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WB-0000DJ-SB
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so5949340wmq.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLTcZ2bERqFx5QJrSflHdKK5QKRI/+byta3hYLUUz0c=;
 b=zvZlsVJvQ9nVYz40xbEJsOTsWOExXlNi5m+ZWR11e2QgZdOlbijtW1EZV+9yYyttom
 qx/cONN4L24gJJ/b5iMak+z+CGG4sjTGq8RJDVKQlXkUFeP7es8lB3xKokC9GcBTVLyl
 seplGESIzoWOj+ioKMB/V9KcRLoilrWM069r/uvImip8xqqtk+ss1DhVGJrR9RYaZGp3
 6GOe+Iq1VClsXRp+I1Uj4H3Y1hgXzAGWQKsZIscAtis+Q9rVXioUMnPgzpM5/evUAJmC
 EfrMEr6vLAys23XdlDl6QPEuhQCMmnjNdo65f/xcUID3GvN8axykf9Th2xh5KR/YY5O5
 nzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLTcZ2bERqFx5QJrSflHdKK5QKRI/+byta3hYLUUz0c=;
 b=vADaquM1kDxV0XC+RdSjpxFjZkOM4Hyl/uFfF0D2EBOxKjnV22M1vtjb4mvlDzX3LD
 bUnwEiPz7KKJ+TzPJqQ6TDW1vPZpfmSR0oeX57DWG9zuH9k2a2AeXze6xc/7i6sASAD8
 QhvzyNJYsZmWoHzzgoa7mDxcBRI8F+LoQlg09+IXpZqizHULP0ECYjRt9mz92i5PXiav
 Y+9Stsi03ymYx8KYDsskXrq2vd7kOE1mwI1MZ9Sv1rUVBkNlmwQEPDzo5UoVvfP5BGNn
 52aBKOHmb/MifFEjC/NeAgPDUsyaM8aXf6ry/y1UOWGqjlbbuvY77qtpBY6sMuHJSSnG
 8jyg==
X-Gm-Message-State: AO0yUKWmtnAv4VJIWv6K9Zd+7aZqYeS7ofE1EtvBXHsbSpKWuNAK4HEK
 qoSUXAEkdvXWESUDkIi7HlOEiNX9GGQV1Zt2
X-Google-Smtp-Source: AK7set+eTmvp+Ew991zRwc4+QlrZR6jfPylL97gKlTK5F21mFMbfBIvRfbODgDcweyNqe7smDzI2SQ==
X-Received: by 2002:a05:600c:35c6:b0:3de:56a8:ae6b with SMTP id
 r6-20020a05600c35c600b003de56a8ae6bmr4915919wmq.34.1675447835110; 
 Fri, 03 Feb 2023 10:10:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b003dc522dd25esm3702947wmq.30.2023.02.03.10.10.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 15/19] hw/mips: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:10 +0100
Message-Id: <20230203180914.49112-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2023 18:10:38 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/boston.c |  6 ++----
 hw/mips/cps.c    | 42 ++++++++++++++----------------------------
 hw/mips/jazz.c   |  3 +--
 hw/mips/malta.c  |  6 ++----
 4 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 21ad844519..f3c2179f66 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -700,10 +700,8 @@ static void boston_mach_init(MachineState *machine)
     }
 
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
-    object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
-                            &error_fatal);
-    object_property_set_uint(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
-                            &error_fatal);
+    qdev_prop_set_string(DEVICE(&s->cps), "cpu-type", machine->cpu_type);
+    qdev_prop_set_uint32(DEVICE(&s->cps), "num-vp", machine->smp.cpus);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in",
                           qdev_get_clock_out(dev, "cpu-refclk"));
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b5269ebf1..3109644c5e 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -79,10 +79,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         CPUMIPSState *env = &cpu->env;
 
         /* All VPs are halted on reset. Leave powering up to CPC. */
-        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
-                                      errp)) {
-            return;
-        }
+        qdev_prop_set_bit(DEVICE(cpu), "start-powered-off", true);
+
         /* All cores use the same clock tree */
         qdev_connect_clock_in(DEVICE(cpu), "clk-in", s->clock);
 
@@ -106,12 +104,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     /* Inter-Thread Communication Unit */
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
-        object_property_set_link(OBJECT(&s->itu), "cpu[0]",
-                                 OBJECT(first_cpu), &error_abort);
-        object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
-                                &error_abort);
-        object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
-                                &error_abort);
+        qdev_prop_set_link(DEVICE(&s->itu), "cpu[0]", OBJECT(first_cpu));
+        qdev_prop_set_uint32(DEVICE(&s->itu), "num-fifo", 16);
+        qdev_prop_set_uint32(DEVICE(&s->itu), "num-semaphores", 16);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->itu), errp)) {
             return;
         }
@@ -122,10 +117,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
 
     /* Cluster Power Controller */
     object_initialize_child(OBJECT(dev), "cpc", &s->cpc, TYPE_MIPS_CPC);
-    object_property_set_uint(OBJECT(&s->cpc), "num-vp", s->num_vp,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpc), "vp-start-running", 1,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->cpc), "num-vp", s->num_vp);
+    qdev_prop_set_uint64(DEVICE(&s->cpc), "vp-start-running", 0x1);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpc), errp)) {
         return;
     }
@@ -135,10 +128,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
 
     /* Global Interrupt Controller */
     object_initialize_child(OBJECT(dev), "gic", &s->gic, TYPE_MIPS_GIC);
-    object_property_set_uint(OBJECT(&s->gic), "num-vp", s->num_vp,
-                            &error_abort);
-    object_property_set_uint(OBJECT(&s->gic), "num-irq", 128,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-vp", s->num_vp);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", 128);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
     }
@@ -150,16 +141,11 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     gcr_base = MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
-    object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->gcr), "gcr-rev", 0x800,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->gcr), "gcr-base", gcr_base,
-                            &error_abort);
-    object_property_set_link(OBJECT(&s->gcr), "gic", OBJECT(&s->gic.mr),
-                             &error_abort);
-    object_property_set_link(OBJECT(&s->gcr), "cpc", OBJECT(&s->cpc.mr),
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->gcr), "num-vp", s->num_vp);
+    qdev_prop_set_int32(DEVICE(&s->gcr), "gcr-rev", 0x800);
+    qdev_prop_set_uint64(DEVICE(&s->gcr), "gcr-base", gcr_base);
+    qdev_prop_set_link(DEVICE(&s->gcr), "gic", OBJECT(&s->gic.mr));
+    qdev_prop_set_link(DEVICE(&s->gcr), "cpc", OBJECT(&s->cpc.mr));
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gcr), errp)) {
         return;
     }
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..d18aeb439b 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -302,8 +302,7 @@ static void mips_jazz_init(MachineState *machine,
             qdev_set_nic_properties(dev, nd);
             qdev_prop_set_uint8(dev, "it_shift", 2);
             qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
-            object_property_set_link(OBJECT(dev), "dma_mr",
-                                     OBJECT(rc4030_dma_mr), &error_abort);
+            qdev_prop_set_link(dev, "dma_mr", OBJECT(rc4030_dma_mr));
             sysbus = SYS_BUS_DEVICE(dev);
             sysbus_realize_and_unref(sysbus, &error_fatal);
             sysbus_mmio_map(sysbus, 0, 0x80001000);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index af9021316d..3b88668bae 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1064,10 +1064,8 @@ static void create_cps(MachineState *ms, MaltaState *s,
                        qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
     object_initialize_child(OBJECT(s), "cps", &s->cps, TYPE_MIPS_CPS);
-    object_property_set_str(OBJECT(&s->cps), "cpu-type", ms->cpu_type,
-                            &error_fatal);
-    object_property_set_uint(OBJECT(&s->cps), "num-vp", ms->smp.cpus,
-                            &error_fatal);
+    qdev_prop_set_string(DEVICE(&s->cps), "cpu-type", ms->cpu_type);
+    qdev_prop_set_uint32(DEVICE(&s->cps), "num-vp", ms->smp.cpus);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in", s->cpuclk);
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
 
-- 
2.38.1


