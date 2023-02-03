Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0Vv-0008SE-VZ
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vq-0007y6-C2
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vm-0008UH-B8
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id q5so5441902wrv.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNLse2ZcD75ram/6R7ZT7oCmOqU0RAt0KF/SNVgLID4=;
 b=F4kQFrxYh5Svorw0WiId2px/Ova0AuG4RaY1y3WSjTYNqA7gqCiHiib3eQrx5f/xEs
 DI3sVEl872UBCplU8OR4dDLHMYVsppx65wuS7eM/p/GuMbfijnwuu1FEieOpOEQP0ZNT
 XWE1DNi+/PZHmGHqv36heCtjmLV/6XegC2N8Zet3rVHlpeHA6mSlVFiIbi55LBNGQqVU
 X1r2x/U5j+IdG5aUBLYxDpiZJbiquFn7IyvQgAdeb6Hesr3QkIrVZSHhcl5K0dqHjubt
 XNpZtV4LluNzeulDHfRXdNA2SErvOiriKDMVbRNi8BdN3QJSjApFth5E0xY+bw4UmpW9
 FXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FNLse2ZcD75ram/6R7ZT7oCmOqU0RAt0KF/SNVgLID4=;
 b=fZYDQTcliGz+n0vBaKqaJM+RQo2+gM4l8XnHT7bqscjy6yB+AiGscqCVOnJj8f4Nsy
 W/pCrfpDewawquFRH0JW4Uq4CoqBszGSrlL8sWuTWPIOatLvRsbKU1IodxGYRBVwDZf8
 Z4Dxsx2bGdPPqG6UHje8JYMOrb/a+qE73X0NVdxAnvOl82aE0ah37U8MuxDzTTzQxceY
 0m4gjzoM5dZsZNIuSJlIUFpyoqDa8wvuTiz7vemnb/YIMuqZpFknq/XvWZH/rKmoya9Q
 L0pgzvfwqswjmY/aBWRyballSW35ttn6J+lkj9d4+zzq0/lzgXGXU4DezahES0gm9KKK
 0jTQ==
X-Gm-Message-State: AO0yUKW1WwshpsDZL54rfFPFHNOavUzwM4f4w7PLEuwq2tXAlqcqn57p
 HeuX3v7HlXwnvoG5u/mZ2FfFbA==
X-Google-Smtp-Source: AK7set/D6H7+maKyZY6LFvuerFfHC9jQOaT8s4VBnqUMY9fjuKeobBfUjZ67ftUIgzHa5w9V7lFJdw==
X-Received: by 2002:a5d:4350:0:b0:2c3:6686:c7d5 with SMTP id
 u16-20020a5d4350000000b002c36686c7d5mr8980518wrr.18.1675447807755; 
 Fri, 03 Feb 2023 10:10:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002bbb2d43f65sm2533879wrx.14.2023.02.03.10.10.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 10/19] hw/avr: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:05 +0100
Message-Id: <20230203180914.49112-11-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:17 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/avr/arduino.c | 4 ++--
 hw/avr/atmega.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 48ef478346..428e6e1b2d 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -15,6 +15,7 @@
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
+#include "hw/qdev-properties.h"
 
 struct ArduinoMachineState {
     /*< private >*/
@@ -44,8 +45,7 @@ static void arduino_machine_init(MachineState *machine)
     ArduinoMachineState *ams = ARDUINO_MACHINE(machine);
 
     object_initialize_child(OBJECT(machine), "mcu", &ams->mcu, amc->mcu_type);
-    object_property_set_uint(OBJECT(&ams->mcu), "xtal-frequency-hz",
-                             amc->xtal_hz, &error_abort);
+    qdev_prop_set_uint64(DEVICE(&ams->mcu), "xtal-frequency-hz", amc->xtal_hz);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
     if (machine->firmware) {
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index a34803e642..e6ebc7473a 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -327,8 +327,8 @@ static void atmega_realize(DeviceState *dev, Error **errp)
         devname = g_strdup_printf("timer%zu", i);
         object_initialize_child(OBJECT(dev), devname, &s->timer[i],
                                 TYPE_AVR_TIMER16);
-        object_property_set_uint(OBJECT(&s->timer[i]), "cpu-frequency-hz",
-                                 s->xtal_freq_hz, &error_abort);
+        qdev_prop_set_uint64(DEVICE(&s->timer[i]), "cpu-frequency-hz",
+                             s->xtal_freq_hz);
         sbd = SYS_BUS_DEVICE(&s->timer[i]);
         sysbus_realize(sbd, &error_abort);
         sysbus_mmio_map(sbd, 0, OFFSET_DATA + mc->dev[idx].addr);
-- 
2.38.1


