Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38103C61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 22:28:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wziYt-0005fA-8J; Thu, 27 Aug 2026 18:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYq-0005e5-Jn
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYo-0001Iu-Pd
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:04 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLu031117684
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5aFpdYGlNsE5Enj7mfxPMqR8658viNfL7KoBkLVoVBM=; b=EBaxRXIae75fYOTG
 IahDVvjUfXK7PeQji7hvQd9UFzV3GwcmcOIAY8gM+wMLu22r6sRf64/PIA2Whzsn
 pg+j+bSCF4res/wuKYW0Ci3MCPoDBXha5Lu9cccbYdESb2l728MKl1CtT6lSzy1g
 cuuVSpBccLfsop+1fHB5kMpLrbwsnjGuuzTIl2MI2yEhBq144WZkAjVcZ750ATHY
 fI/1JgvJ225jtfNs/+TkCqdzk47GLTK2uUae4vfttAsVhaUlKSRLm2lbXB3oi38V
 bUQQ28bVMwBWwipYN5jABKPWnKrE+XxObUW5VnvK7KAmQoXdbUDLVjjiKN1FeHe8
 xUBtBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0hgm6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9308eafb465so36928185a.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787869611; x=1788474411; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5aFpdYGlNsE5Enj7mfxPMqR8658viNfL7KoBkLVoVBM=;
 b=FYJvZym3228OgofR8KvTmkB9tiCXCDZtsz1MMpK4bi4unasZiVIO8ZU029E0OYgpli
 GRCV4etVAyvbCV2/WUPPih3tGlc60YdA1tlew/K6NZT1t2clsQOFtRHJWktfQBnpCoZS
 O7PiZek54tz2cLn6KpNV8Z2Phhp+yKe1awOUtmmPuB6aBDy0qSo8X5Nu1KtSQ/MGp5rJ
 25iuo5xXR4xL/AEYfANR4VE1bIt9g6lG4qe/fkvrtxV5mJrd7RmrrLRBEFu/WEqGJIib
 1lyUPfGRn88/uVy+Fz+1BbXYzGRtNvr/xH0e9pfK8ijtz97kQZk1S40o6nMOnRPe9l8W
 e/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787869611; x=1788474411;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5aFpdYGlNsE5Enj7mfxPMqR8658viNfL7KoBkLVoVBM=;
 b=IUW8BJNf6v/U1+90eHFhtOCXb+C3Ctkg0KY0tIZs4sgdb66R30Y+N2JPEjc1aXF0Ws
 q4RuvDt1j8bCxddp/EhufABDNhlenoVdjSskfU4ffct8SGFZjKD8clHJ5PyWIV0UqiEs
 RWCDPb6wnVeLWOf7lduNxCwzlhz0PlVRy/iJ3T5l+ANpKvbhlVMMkcEKOJgJpsKjLuMP
 1neijYsnZAVj0bLjZoKXO+KhfsESGbi3TUaP6twdQ5b+aLeXMcyT2tols4eP/kCr8KsB
 oAYPBhDMA+JNeFsXF1Dx7v0XWlF5wGVS/tpdQw47TKtE8t2Up3nUpNrbxZ0VzEDK63V9
 4Egw==
X-Gm-Message-State: AFuF++meDu0fRoTjahDIhAzLyRjyakUYErpaG/2kXHJLH11TxGvU4S7G
 FlhrbNJQjgg75LtJi82pege5zOTfG0hKbv2qYFtEVB0fM6bSLKeIABpJ3KmckJLU2mgPutr2A8Y
 CAoZ/waKoPRRVmuxtLI+Aqmh5kdgWerLCnuUZ3DJ3U2Wnm+ggp+48AKTmlw==
X-Gm-Gg: AR+sD13+l0pURAB4AHF6KVLoDt+JRUuN1NOUcD9XsiczH1UYNDWCpArmQG/ZGsQYOn2
 mOyw23RZy4GRuUKXWKOVhbUe+LoVA6OSYgYpyMCL+SNlIY2MaR3sh+hNA8UuailE1b/2qSLiE+a
 +LnUyMJdzTP/KowwSvmyobwK1R4YPcG9nHqO4eC/+ONuG9aMRLZoptBD+zidXt38Af9Kosd/TRV
 7hKx7UpnXLl3lSjuTget5HSvWjciP1H3hVMBtC9PMNv0rY5CdbzeyyIjGTfAIwLBzD6lCxIQ/45
 TuZMcS4+wdCR/cK1vT1Axnmy624ulMaVu894F/AdGldZDE62FOqXjzEWEm9EX4dkPAoQk0LPsre
 1LVvLRakz5owMzuWbcyT/z9Ssc+aH6zlvrpKbtg==
X-Received: by 2002:a05:620a:6606:b0:937:1097:feb8 with SMTP id
 af79cd13be357-939138be733mr270483485a.24.1787869610983; 
 Thu, 27 Aug 2026 15:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6606:b0:937:1097:feb8 with SMTP id
 af79cd13be357-939138be733mr270477985a.24.1787869610441; 
 Thu, 27 Aug 2026 15:26:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173a734dsm8924985a.26.2026.08.27.15.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 15:26:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 11/14] hw/riscv/device-common,
 virt.c: add riscv_create_platform_bus()
Date: Thu, 27 Aug 2026 19:26:04 -0300
Message-ID: <20260827222608.329788-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfXy8XEvSY7KRPO
 tSibqmQ0at4Zp+mglEXK5bHfevO/YPXyT0Hbt+am5U9iJwJYaI7l6VM14jrbDfko6tzC7Mnh7QG
 uMml6zttD1WZVjbvFK7HQTcGqxcNeNL/Wk0tU6jBWS7JZPqnCjz1hmBb342C38s/qH+oVThMnry
 K4H512mM0wKsIqFhvxQtu701lDCGIqkNzBcRtecyMtcPvF/E4NkTsaicvVcVz+CqYKLm/7bFf0+
 7XHebrq6mmgr5BsNjDR5gJrgw2O2E5RrxP5NFPpZQmqgibZF+qd8uBslXMHw/sJDk5HE8wDWN6j
 rdSvcYzTtywRlw04HHjApl62Wb3xg+oXDT56U33NykKIXXsEgrsA6O+UjAqjCBoxOmHV+QTyWmC
 iU/EmuZQzallbq1MQ+cAfVaFLoFszjmSKyXx0ubmRbDfA/7RuulYxyF9oZH85hSTPQNTluRhgqJ
 qJv2E1FYbj+WylqkLmQ==
X-Proofpoint-GUID: e_r_569kQMc5sAgoy0cWyVBUUziTGQ2A
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90b9ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aH2Wc4Ua3Gm2Ww6jc38A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: e_r_569kQMc5sAgoy0cWyVBUUziTGQ2A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX4P6f62PVU7g8
 0bLuNN6hOGixj+8WltmPIwhOZcDRwXGkYL3E+GbURzD2U5mDPJ0B5kJW2fwv+lgP0Lyu/6QbNp8
 IRRS5XYi2Lex5OQT+MQ/NDInj5Dr5sE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270190
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

There will be code repetition instances added by the 'riscv-server-ref'
board w.r.t device creation and initialization.  Instead of waiting for
that code to land we're adding helpers beforehand.  The idea is to make
the new board code shorter and more palatable for reviewers.

A new 'device-common' file is created for such helpers.  We'll start
with the platform bus, a nice piece of software that only the 'virt'
board uses so far, and the 'riscv-server-ref' will use to support TPM
devices.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 48 ++++++++++++++++++++++++++++++++
 hw/riscv/meson.build             |  1 +
 hw/riscv/virt.c                  | 30 +++-----------------
 include/hw/riscv/device-common.h | 19 +++++++++++++
 4 files changed, 72 insertions(+), 26 deletions(-)
 create mode 100644 hw/riscv/device-common.c
 create mode 100644 include/hw/riscv/device-common.h

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
new file mode 100644
index 0000000000..d3c68a9e71
--- /dev/null
+++ b/hw/riscv/device-common.c
@@ -0,0 +1,48 @@
+/*
+ * RISC-V board helpers for FDT generation.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/riscv/device-common.h"
+
+#include "hw/core/platform-bus.h"
+#include "hw/core/qdev.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/sysbus.h"
+#include "qapi/error.h"
+#include "system/address-spaces.h"
+#include "system/memory.h"
+
+
+DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
+                                       const MemMapEntry *platform_bus_mem,
+                                       int platform_bus_base_irq,
+                                       int platform_bus_num_irqs)
+{
+    MemoryRegion *sysmem = get_system_memory();
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", platform_bus_num_irqs);
+    qdev_prop_set_uint32(dev, "mmio_size", platform_bus_mem->size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    for (int i = 0; i < platform_bus_num_irqs; i++) {
+        int irq = platform_bus_base_irq + i;
+        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
+    }
+
+    memory_region_add_subregion(sysmem,
+                                platform_bus_mem->base,
+                                sysbus_mmio_get_region(sysbus, 0));
+
+    return dev;
+}
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 0d82ceacc4..7aa3c1578d 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,7 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('aia.c'))
 riscv_ss.add(files('boot.c'))
+riscv_ss.add(files('device-common.c'))
 riscv_ss.add(files('fdt-common.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ccea5784f0..a2671ae341 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
+#include "hw/riscv/device-common.h"
 #include "hw/riscv/fdt-common.h"
 #include "hw/riscv/machines-qom.h"
 #include "hw/riscv/numa.h"
@@ -683,31 +684,6 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
              memmap[VIRT_PLIC].size);
 }
 
-static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
-{
-    DeviceState *dev;
-    SysBusDevice *sysbus;
-    int i;
-    MemoryRegion *sysmem = get_system_memory();
-
-    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
-    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
-    qdev_prop_set_uint32(dev, "mmio_size", s->memmap[VIRT_PLATFORM_BUS].size);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s->platform_bus_dev = dev;
-
-    sysbus = SYS_BUS_DEVICE(dev);
-    for (i = 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
-        int irq = VIRT_PLATFORM_BUS_IRQ + i;
-        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
-    }
-
-    memory_region_add_subregion(sysmem,
-                                s->memmap[VIRT_PLATFORM_BUS].base,
-                                sysbus_mmio_get_region(sysbus, 0));
-}
-
 static void virt_build_smbios(RISCVVirtState *s)
 {
     MachineClass *mc = MACHINE_GET_CLASS(s);
@@ -1030,7 +1006,9 @@ static void virt_machine_init(MachineState *machine)
 
     gpex_pcie_init(system_memory, pcie_irqchip, s);
 
-    create_platform_bus(s, mmio_irqchip);
+    s->platform_bus_dev = riscv_create_platform_bus(mmio_irqchip,
+        &s->memmap[VIRT_PLATFORM_BUS], VIRT_PLATFORM_BUS_IRQ,
+        VIRT_PLATFORM_BUS_NUM_IRQS);
 
     serial_mm_init(system_memory, s->memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
new file mode 100644
index 0000000000..12af031bbf
--- /dev/null
+++ b/include/hw/riscv/device-common.h
@@ -0,0 +1,19 @@
+/*
+ * RISC-V board helpers for FDT generation.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef RISCV_DEVICE_COMMON_H
+#define RISCV_DEVICE_COMMON_H
+
+#include "exec/hwaddr.h"
+#include "hw/core/qdev.h"
+
+DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
+                                       const MemMapEntry *platform_bus_mem,
+                                       int platform_bus_base_irq,
+                                       int platform_bus_num_irqs);
+#endif
-- 
2.43.0


