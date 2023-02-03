Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0Wb-0003w2-4i
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WY-0003fi-NN
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:58 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WW-0000kh-O4
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id o18so5406252wrj.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1X0gDpmktmy1MJ+y3Ch36tD5Q1c0/Bd9Mz6MEAa1Kc=;
 b=vOcYP3kzPydImb49582LG2w8amHds1spIeEId2wjbweHaT/wWk3jWuAQkSEZWkiakK
 ly8wiZGMvmqtAfXmSFm+eT0rNEg84PLJjF5VNuhFUyF9pZqfPsRSvRzm0WFGreOBDVZN
 J4/Fz3foJjb+SoysUPc5dr5pnCVCmBFSjiZ4XoVV59ODJo8RgdajIsWEOudgeByz+DQ5
 sxCaCvLWqysJSlTz6dqOmtxsE1fU6vJ+5s9f9i7WGOShEVKw5W2+UBEzY+kkNnjzuEB3
 y0tdrAxbMtHTg02Hfn47zSk+DF2gS5zMy8IAVL/YHZh9co7z/Htf3Glbs470IaEBHu6h
 0YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1X0gDpmktmy1MJ+y3Ch36tD5Q1c0/Bd9Mz6MEAa1Kc=;
 b=s30b6j26mZ+PIkptXZ7PM/umUNvBKrEt/7yuRH2+iUQDQQvQ0qzLKCaFdW8CH3jMlV
 xacYSHgyns2aLhsTI2EgXyiaQK9oIBV5Q1SmGICB6Tu+ARsXMLQX7Fe3dpN4IhJYciZr
 gSVZSVFBnWnaDRHX09J5RybxGq7qLL5A/tIi1zADHEiofbUGg8hxzWmrE4DJVadLtliZ
 BTzTkMMtgEF+mvF1eQiEBhf/2rqWNDHHQTFvqG7Dw92OUL7HRgvAg6URcKM1ME/ZA20t
 Xf+M4kyzCEMvlUV+a4YsTAdluJr3N8Tb88+UbXwLveD6BiPdCqhL3U4D+ILyNC8c+9TW
 0FLQ==
X-Gm-Message-State: AO0yUKU+paRVJS0y0VQPJTnlBv6wFhDUK9340aHd69ABmG4Ua92vrYia
 nI8sueyeredK5Pf1Awz3UpmiF+qoOO8/QAbI
X-Google-Smtp-Source: AK7set+n39k584gkzZ8UVmEf+t21ZMAusdqVJQygdIiDAssgtvO4vl2NIcYwHirOcbL5AfR9d69L6Q==
X-Received: by 2002:adf:9c8e:0:b0:2bf:d034:f49 with SMTP id
 d14-20020adf9c8e000000b002bfd0340f49mr9498399wre.1.1675447856022; 
 Fri, 03 Feb 2023 10:10:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z11-20020adfd0cb000000b002bfd09f2ca6sm2532286wrh.3.2023.02.03.10.10.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 19/19] hw/sparc: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:14 +0100
Message-Id: <20230203180914.49112-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:59 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/dma/sparc32_dma.c |  6 +++---
 hw/sparc/sun4m.c     | 10 ++++------
 hw/sparc64/sun4u.c   |  3 +--
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 0ef13c5e9a..49816755c2 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -347,7 +347,7 @@ static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
     LEDMADeviceState *s = SPARC32_LEDMA_DEVICE(dev);
     SysBusPCNetState *lance = SYSBUS_PCNET(&s->lance);
 
-    object_property_set_link(OBJECT(lance), "dma", OBJECT(dev), &error_abort);
+    qdev_prop_set_link(DEVICE(lance), "dma", OBJECT(dev));
     sysbus_realize(SYS_BUS_DEVICE(lance), &error_fatal);
 }
 
@@ -380,7 +380,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
     }
 
     espdma = DEVICE(&s->espdma);
-    object_property_set_link(OBJECT(espdma), "iommu", iommu, &error_abort);
+    qdev_prop_set_link(espdma, "iommu", iommu);
     sysbus_realize(SYS_BUS_DEVICE(espdma), &error_fatal);
 
     esp = DEVICE(object_resolve_path_component(OBJECT(espdma), "esp"));
@@ -394,7 +394,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
                                 sysbus_mmio_get_region(sbd, 0));
 
     ledma = DEVICE(&s->ledma);
-    object_property_set_link(OBJECT(ledma), "iommu", iommu, &error_abort);
+    qdev_prop_set_link(ledma, "iommu", iommu);
     sysbus_realize(SYS_BUS_DEVICE(ledma), &error_fatal);
 
     lance = DEVICE(object_resolve_path_component(OBJECT(ledma), "lance"));
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index d9288326d6..f241a676b3 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -803,8 +803,7 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     env = &cpu->env;
 
     qemu_register_reset(sun4m_cpu_reset, cpu);
-    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
-                             &error_fatal);
+    qdev_prop_set_bit(DEVICE(cpu), "start-powered-off", id != 0);
     qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
     cpu_sparc_set_id(env, id);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
@@ -851,7 +850,7 @@ static void sun4m_hw_init(MachineState *machine)
 
     /* Create and map RAM frontend */
     dev = qdev_new("memory");
-    object_property_set_link(OBJECT(dev), "memdev", OBJECT(ram_memdev), &error_fatal);
+    qdev_prop_set_link(dev, "memdev", OBJECT(ram_memdev));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0);
 
@@ -978,7 +977,7 @@ static void sun4m_hw_init(MachineState *machine)
 
     /* Logically OR both its IRQs together */
     ms_kb_orgate = DEVICE(object_new(TYPE_OR_IRQ));
-    object_property_set_int(OBJECT(ms_kb_orgate), "num-lines", 2, &error_fatal);
+    qdev_prop_set_uint16(ms_kb_orgate, "num-lines", 2);
     qdev_realize_and_unref(ms_kb_orgate, NULL, &error_fatal);
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(ms_kb_orgate, 0));
     sysbus_connect_irq(s, 1, qdev_get_gpio_in(ms_kb_orgate, 1));
@@ -999,8 +998,7 @@ static void sun4m_hw_init(MachineState *machine)
 
     /* Logically OR both its IRQs together */
     serial_orgate = DEVICE(object_new(TYPE_OR_IRQ));
-    object_property_set_int(OBJECT(serial_orgate), "num-lines", 2,
-                            &error_fatal);
+    qdev_prop_set_uint16(serial_orgate, "num-lines", 2);
     qdev_realize_and_unref(serial_orgate, NULL, &error_fatal);
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(serial_orgate, 0));
     sysbus_connect_irq(s, 1, qdev_get_gpio_in(serial_orgate, 1));
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 387181ff77..823d527078 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -583,8 +583,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     sabre = SABRE(qdev_new(TYPE_SABRE));
     qdev_prop_set_uint64(DEVICE(sabre), "special-base", PBM_SPECIAL_BASE);
     qdev_prop_set_uint64(DEVICE(sabre), "mem-base", PBM_MEM_BASE);
-    object_property_set_link(OBJECT(sabre), "iommu", OBJECT(iommu),
-                             &error_abort);
+    qdev_prop_set_link(DEVICE(sabre), "iommu", OBJECT(iommu));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(sabre), &error_fatal);
 
     /* sabre_config */
-- 
2.38.1


