Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F2C021A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:41:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiC0N-0004E8-Dy; Wed, 12 Feb 2025 07:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzp-0003ea-T5
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzj-0000YH-Kt
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so502003f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363851; x=1739968651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWUW6vMOmCPzMRvR9U3A14f86L3fegXfbhL6iARH54I=;
 b=gNS3ViJbvhPyJqtrW3bJa/BpXQLrQ+QKyoUpaUFcZ4/hfOO+a53gNGqu2x9JUKMzBW
 e+OlgMtkxkGyThoLV86FNRjOThpP+DcXkdSlIIM9JyULKqHsbtM1w3NnhXaoO285I+K1
 0ZqJqw5fq+oCHrq1yJtXDTQbEkvFIE/OlfdeOA9AGHCtJka8b8LwR2EoKcze8HyFW+Ho
 kMdizkE0pRg2REWr8iKJzUIzUPT4X2819pBGt8HjEGhBHa1GoTgW0qnCIlBcUSE5JrsG
 phUf9+C+VOap1Jy8Gg1M9gNoszFbg5cGDeyH7Lj8Q9CSRDlXTJAjF2UiywW+TeLTgXNN
 nheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363851; x=1739968651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWUW6vMOmCPzMRvR9U3A14f86L3fegXfbhL6iARH54I=;
 b=jkW+e4IJVeHc7tvS8y7A7ChDe/UmBmhujjDQ/ENA4LGqBlCjcpGd8HHmpvRJL+xaTF
 lwlew3vE790TjuJvGuPd4EuTSg2uPlegdQI/umRJYns52xaFRDKihQboonCoMwx6QaW9
 e0eaJrlejP6moD4fD5cdJFBa/QaSeEzKYiXuCRb03UkreAS2Q5KWAsev7a6TyNqQ6A1S
 ZZLusm0m50HXa0y5zW82biYNgXRygkY9I9aCzNbCE8+P8LamuDDTJtpSWq/fmg6aPHJI
 j0ATyNbT0x6rtx7VX41YfFeoLfE/5FUWMwlJfRAmoPKm7gFh5IUErbv1QnQSH2SkL3jc
 p4jQ==
X-Gm-Message-State: AOJu0Yx06rCb/zS3adDbmS6KfnMLev/NQmdav0ZB1pozg7c9A5OYlJ63
 l5X1xV3xB+7e1YqBlAvoXK48Lj7+uLLuj1Z9dCp2Ho0ZhJQlxl7jqkeKp5wIWva9KocjXsEft8s
 H6pk=
X-Gm-Gg: ASbGncv1TrS7K2IlEWxNTMtdi1c3jPErHZqBEWTufu17Er4D9BTl+GAl/N7ib/d6MC6
 inj08A6hXtFjEiwBdbSBiiYQS7mhJPUW7h/QSKc4sH/ljQZVrzI0hWP6ADBxjL2ibdTrhaIgx5c
 tCGK0GJvqjncbLdN6xAwfydnFmjmNcIoiGEEcjJi2WaKNyI44BK9fLXDVev0wzEFE2H9nH47RdD
 NT0Ju374JE8aTDURMQYQ2GYHB2kSoQ+smCKWm1u4enDaU7PvQASbpXyr5m9BGspwAxYZq16KNWZ
 Nht6xywzZVVHd5HhrTIWlgl1NLer5sSdDDOm0S0AnGBXG7RDdsgtzOGkX6yXmOf60w==
X-Google-Smtp-Source: AGHT+IFjTqIJkFiVLFfbfOLYq7nmhkUi5n+3EcpWnQ7+RncSS97357rQf1FCZWykGKheWLp3BVCOHA==
X-Received: by 2002:a5d:6d0b:0:b0:38d:cab2:91db with SMTP id
 ffacd0b85a97d-38dea251ff6mr2485464f8f.6.1739363850914; 
 Wed, 12 Feb 2025 04:37:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f21ea3246sm444419f8f.81.2025.02.12.04.37.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 06/10] hw/ssi/xilinx_spi: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 13:36:55 +0100
Message-ID: <20250212123659.52764-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/xilinx_spi.c                 | 32 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 490640e9428..b34edf13796 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -175,6 +175,7 @@ petalogix_ml605_init(MachineState *machine)
         SSIBus *spi;
 
         dev = qdev_new("xlnx.xps-spi");
+        qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
         qdev_prop_set_uint8(dev, "num-ss-bits", NUM_SPI_FLASHES);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fd1ff12eb1d..be5baa6b350 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -32,6 +33,7 @@
 
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
 #include "qom/object.h"
 
@@ -83,6 +85,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XilinxSPI, XILINX_SPI)
 struct XilinxSPI {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
 
     qemu_irq irq;
@@ -313,14 +316,17 @@ done:
     xlx_spi_update_irq(s);
 }
 
-static const MemoryRegionOps spi_ops = {
-    .read = spi_read,
-    .write = spi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps spi_ops[2] = {
+    [0 ... 1] = {
+        .read = spi_read,
+        .write = spi_write,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void xilinx_spi_realize(DeviceState *dev, Error **errp)
@@ -329,6 +335,12 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
     XilinxSPI *s = XILINX_SPI(dev);
     int i;
 
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_SPI " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
     DB_PRINT("\n");
 
     s->spi = ssi_create_bus(dev, "spi");
@@ -339,7 +351,8 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
 
-    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+    memory_region_init_io(&s->mmio, OBJECT(s),
+                          &spi_ops[s->model_endianness == ENDIAN_MODE_BIG], s,
                           "xilinx-spi", R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
@@ -362,6 +375,7 @@ static const VMStateDescription vmstate_xilinx_spi = {
 };
 
 static const Property xilinx_spi_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XilinxSPI, model_endianness),
     DEFINE_PROP_UINT8("num-ss-bits", XilinxSPI, num_cs, 1),
 };
 
-- 
2.47.1


