Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D833C5DF98
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 19:44:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxrcy-0001t7-Fp; Sat, 22 Aug 2026 15:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrcx-0001ss-IN
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:43:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrcv-000757-8G
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:43:39 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cf50c6f235so25065345ad.0
 for <qemu-riscv@nongnu.org>; Sat, 22 Aug 2026 12:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787427816; x=1788032616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TH0PJsVypITU/9irrzyoneF3uRtdmouDSRl9TezlEGQ=;
 b=bHCxZToaooiW8sxefIO2UxULPxJniD//W+VUOs5RCIcfFXq9WO9/Nr6iL7TYVNf+Aq
 s8fIysm0PfXRWK8DH597r/pFHy88zraRsLYKaEvWrGMmbDOOxRrLgDD4OFy4Y6b047xz
 y3CXUGfoLlEH7arVVIW9NnoAqXXbYRpTvlFDhAxBTDnyzybOaviJBxgwwhyCwZBzVCVT
 U3tA56SHjn/VjhQ3lgHOkbq87xYWwwPQADOLx+VDM8bNUDyeGIY3G5L5+qtbjDCetj8i
 v+Is7G76zuHi/3tLIIN/Yi9m+VHcP6o6cD55vm0CAhI0pfJRYvXi0G4xADlmimoL5l6V
 guKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787427816; x=1788032616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TH0PJsVypITU/9irrzyoneF3uRtdmouDSRl9TezlEGQ=;
 b=tQJBBqjzs2oRQ4icHQTHOBNYCpZpdw5qMjOLoirpxC0MfnSjj6qJZWhSi8eHA5k/Jd
 sN6QS8+t/Q2N11RvXh0MhZ0HaB+Ka87MsBZq2FJDwOng88UPr/ncgCl5rGNOKFd61R0J
 Xgec0l3Pidv8GPbB8sS0SpfNVv7aREd8BhrDfkplMaBt5dzjOnn1TnflSvEmY3r4w2Tb
 JGt13o88wimYlhpTYxxb7Uhv1wleCFGrgBhO8eu/TrCfpJLesevywxXpachj2tH6RCgn
 UtmQ/fDYxIqfocz/Owbv7v6EJyrfv3CmW/55nGKzQ17HZELjYc+UeoqA9VjOGz7FAN7D
 05LQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRyS77nOZkiXxBy+UqAaplo/5F7O8q8ZJVoKfNTtCHQSZL4RxLin3MIRzcBeDuQLnoBkZGA+yhKLQO@nongnu.org
X-Gm-Message-State: AFuF++nJR8ytPllmv5708HUdVsf9gclPfeG55alNtb3zcgohkgUr2+dJ
 TDskX7auz9WQI1EXa4Bh29vYl2LwK9GFGbwwu9FdYtRFVAN3THwTEXbr
X-Gm-Gg: AR+sD13uPcSvdtBYZ1Hy3a4afEzETAgAWkTpvdWfC5cfcLJo+yjyXhX/QcseM48ms5j
 E9EaI+dbMb9w8yEANG5M7v6i2YByvuksKqg/Q/Z510s0rnI5csqS4GujRytMIe0H2U1LjFiZp+P
 PX8Su6m2yS/QQq8lLP+RAoAQRa/TV2UsUD886v9YAI+sRiaG93+zFwiuXvelD5vtHOK359JXkO6
 cMNRwbUvVnjgkSmIdCJ1XUuYbb3nvwH4ixjNqos9LIV8ufhPbgGY+04WU4pPCF8zh7AyhsHThbd
 DazF+/CWswER3DGeg+bYgZytNHUfn9A8D0fauPZDSPQN4LSK1x5Eg2LaHV3gJIJt0PgRB4FszNQ
 fCXGbWnm55vgqCs4xzE/D7KpQYDpZXT+3DgFSAwXazH/JGd32K08aoBv3NvV1tFHCKnr3px/PoK
 PuUFDXspi3SAtn5pquwJLOf037z3FCfM4OJLv5REGS/2HHzGhKBmncLdJ9IZQXaPHc99Vow5i9R
 ySrw6EVSVmghd9z10+oK4vA/YMtwGoepq1n8enB8RHxFRuRPfi1aRyBBZQLJ6tOnA==
X-Received: by 2002:a17:903:26c3:b0:2cf:4339:aaa with SMTP id
 d9443c01a7336-2d64b0c72d2mr311380235ad.12.1787427815821; 
 Sat, 22 Aug 2026 12:43:35 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d676895799sm5892715ad.38.2026.08.22.12.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 12:43:35 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, almer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>
Subject: [PATCH v4 1/7] hw/char: Add dw8250 UART
Date: Sat, 22 Aug 2026 19:43:08 +0000
Message-ID: <20260822194315.2550260-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
In-Reply-To: <20260822194315.2550260-1-visitorckw@gmail.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=visitorckw@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add the dw8250 uart support. This hardware is a widely used 16550A
derivative that includes additional registers.

Without this specific device support, the Linux 8250_dw driver fails to
probe the extended registers (UCV, CPR, etc.), which are essential for
correct feature detection.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/Kconfig          |   4 ++
 hw/char/dw8250.c         | 131 +++++++++++++++++++++++++++++++++++++++
 hw/char/meson.build      |   1 +
 include/hw/char/dw8250.h |  27 ++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 hw/char/dw8250.c
 create mode 100644 include/hw/char/dw8250.h

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 020c0a84bb..418d99b757 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -95,3 +95,7 @@ config IP_OCTAL_232
     bool
     default y
     depends on IPACK
+
+config DW8250
+    bool
+    select SERIAL
diff --git a/hw/char/dw8250.c b/hw/char/dw8250.c
new file mode 100644
index 0000000000..ccf05dd9ad
--- /dev/null
+++ b/hw/char/dw8250.c
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Synopsys DesignWare APB UART (DW 8250)
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/char/dw8250.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/qdev-properties-system.h"
+
+#define DW_UART_REGION_SIZE 0x100
+
+#define DW_UART_RE_EN (0xB4 >> 2) /* Receiver Output Enable Register */
+#define DW_UART_DLF   (0xC0 >> 2) /* Divisor Latch Fraction Register */
+#define DW_UART_CPR   (0xF4 >> 2) /* Component Parameter Register */
+#define DW_UART_UCV   (0xF8 >> 2) /* UART Component Version */
+#define DW_UART_CTR   (0xFC >> 2) /* Component Type Register */
+
+#define DW_UART_UCV_VALUE 0x3332332A /* "323*" -> v3.23a */
+#define DW_UART_CTR_VALUE 0x44570110 /* "DW" */
+
+static uint64_t dw8250_ext_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    DW8250State *s = opaque;
+
+    switch (addr >> s->regshift) {
+    case DW_UART_UCV:
+        return DW_UART_UCV_VALUE;
+    case DW_UART_CPR:
+        return 0x00000000; /* No advanced features (DMA, extra FIFOs) */
+    case DW_UART_CTR:
+        return DW_UART_CTR_VALUE;
+
+    case DW_UART_RE_EN:
+    case DW_UART_DLF:
+        /*
+         * Return 0 to indicate these optional features
+         * (RS485 and Fractional Divisor) are not implemented.
+         */
+        return 0x00000000;
+
+    default:
+        return 0;
+    }
+}
+
+static void dw8250_ext_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write to address 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps dw8250_ext_ops = {
+    .read = dw8250_ext_read,
+    .write = dw8250_ext_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void dw8250_instance_init(Object *obj)
+{
+    DW8250State *s = DW8250(obj);
+
+    s->serial_mm = qdev_new("serial-mm");
+    object_property_add_child(obj, "serial-mm", OBJECT(s->serial_mm));
+    object_property_add_alias(obj, "chardev", OBJECT(s->serial_mm), "chardev");
+}
+
+static void dw8250_realize(DeviceState *dev, Error **errp)
+{
+    DW8250State *s = DW8250(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(s->serial_mm);
+
+    memory_region_init(&s->container, OBJECT(dev), "dw8250-container",
+                       DW_UART_REGION_SIZE);
+    sysbus_init_mmio(sbd, &s->container);
+
+    qdev_prop_set_uint8(s->serial_mm, "regshift", s->regshift);
+    qdev_prop_set_uint8(s->serial_mm, "endianness", DEVICE_LITTLE_ENDIAN);
+    if (!sysbus_realize(serial_sbd, errp)) {
+        return;
+    }
+
+    memory_region_init_io(&s->ext_iomem, OBJECT(dev), &dw8250_ext_ops, s,
+                          "dw8250-ext", DW_UART_REGION_SIZE);
+    memory_region_add_subregion(&s->container, 0, &s->ext_iomem);
+
+    memory_region_add_subregion_overlap(&s->container, 0,
+                                        sysbus_mmio_get_region(serial_sbd, 0), 1);
+
+    sysbus_pass_irq(sbd, serial_sbd);
+}
+
+static const Property dw8250_properties[] = {
+    DEFINE_PROP_UINT8("regshift", DW8250State, regshift, 2),
+};
+
+static void dw8250_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = dw8250_realize;
+    device_class_set_props(dc, dw8250_properties);
+}
+
+static const TypeInfo dw8250_info = {
+    .name          = TYPE_DW8250,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(DW8250State),
+    .instance_init = dw8250_instance_init,
+    .class_init    = dw8250_class_init,
+};
+
+static void dw8250_register_types(void)
+{
+    type_register_static(&dw8250_info);
+}
+
+type_init(dw8250_register_types)
diff --git a/hw/char/meson.build b/hw/char/meson.build
index fc3d7ee506..b2250ee6ae 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -38,6 +38,7 @@ system_ss.add(when: 'CONFIG_STM32L4X5_USART', if_true: files('stm32l4x5_usart.c'
 system_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 system_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
 system_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
+system_ss.add(when: 'CONFIG_DW8250', if_true: files('dw8250.c'))
 
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
diff --git a/include/hw/char/dw8250.h b/include/hw/char/dw8250.h
new file mode 100644
index 0000000000..59396ad202
--- /dev/null
+++ b/include/hw/char/dw8250.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Synopsys DesignWare APB UART (DW 8250)
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#ifndef HW_CHAR_DW8250_H
+#define HW_CHAR_DW8250_H
+
+#include "hw/core/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_DW8250 "dw8250"
+OBJECT_DECLARE_SIMPLE_TYPE(DW8250State, DW8250)
+
+struct DW8250State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion container;
+    MemoryRegion ext_iomem;
+    DeviceState *serial_mm;
+
+    uint8_t regshift;
+};
+
+#endif
-- 
2.55.0.766.g2966f0265a-goog


